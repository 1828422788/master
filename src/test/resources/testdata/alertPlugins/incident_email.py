# -*- coding: utf-8 -*-
# cheng.tao@yottabyte.cn
# 2019-09-08
# Copyright 2014-2019 Yottabyte
# file description: 邮件告警插件，默认插件，目前是支持用户分组及附件趋势图
__author__ = 'cheng.tao'

from django.template import Context, Template
from email.mime.multipart import MIMEMultipart
from email.mime.text import MIMEText
from email.mime.base import MIMEBase
from email.mime.image import MIMEImage
from email import encoders
from logging import handlers
from yottaweb.apps.utils.resources import MyUtils

import json,urllib.request,urllib.parse,urllib.error,urllib.request,urllib.error,urllib.parse
import configparser
import smtplib
import logging
import os
import base64
import sys
import importlib

importlib.reload(sys)

logger = logging.getLogger('alert_runner')

global reply_content
reply_content = ""
log_content = {
    logging.FATAL: logger.fatal,
    logging.ERROR: logger.error,
    logging.WARNING: logger.warning,
    logging.INFO: logger.info,
    logging.DEBUG: logger.debug
}

# 发送方式的类型，对应三个样例。
# 样例一：connect；样例二：common；样例三：starttls。
# 默认的是样例2，所以是common。如果跑不通，能跑通哪个样例，替换哪个样例对应的代号。
send_type = "common"

META = {
    "name": "incident_email",
    "version": 1,
    "alias": "邮件告警",
    "configs": [
        {
            "name": "subject",
            "alias": "标题",
            "placeholder": "支持模板语言",
            "presence": True,
            "value_type": "string",
            "default_value": "{% if alert.action_type == \"merge\" %}{{alert.incident.main_title}}|最新告警{% else %}[{{alert.operator_name}}] {% if alert.action_type == \"assign_owner\" %}分配{% elif alert.action_type == \"add_comment\" %}评论{% elif alert.action_type == \"change_status\" %}修改状态{% endif %}[{{alert.incident.priority}}]{{alert.incident.main_title}}{% endif %}",
            "style": {
                "rows": 1,
                "cols": 15
            }
        },
        {
            "name": "receiver",
            "alias": "接收者",
            "placeholder": "可以是个人邮箱，也可以是用户分组",
            "presence": True,
            "value_type": "string",
            "input_type": "email_account_group",
            "default_value": "",
            "style": {
                "rows": 1,
                "cols": 20
            }
        },
        {
            "name": "content_tmpl",
            "alias": "内容模板",
            "placeholder": "",
            "presence": True,
            "value_type": "template",
            "default_value": """
<table border="0" cellspacing="0" cellpadding="0" style="font-family:"微软雅黑",Helvetica,Arial,sans-serif;font-size:14px "
  width="100%">
  <tbody>
    <tr>
      <td style="">
        <table width="100%" border="0" cellpadding="0" cellspacing="0">
          <tbody>
            <tr style="background-color: #2F323E;">
              <td>
                <p style="text-align:left;color: #FFFFFF; margin: 0 0 0 20px;font-size:18px;line-height: 48px;font-family:"微软雅黑",Helvetica,Arial,sans-serif;">日志易</p>
              </td>
            </tr>
          </tbody>
        </table>
      </td>
    </tr>
    <tr align="center">
      <td style="padding: 0 20px;">
        <p style="text-align:center;color:#2F323E;margin:24px 0;font-size:22px;font-family:"微软雅黑",Helvetica,Arial,sans-serif;">
          {% if alert.action_type == "merge" %}{{alert.incident.main_title}}|最新告警{% else %}[{{alert.operator_name}}] {% if alert.action_type == "assign_owner" %}分配{% elif alert.action_type == "add_comment" %}评论{% elif alert.action_type == "change_status" %}修改状态{% endif %}[{{alert.incident.priority}}]{{alert.incident.main_title}}{% endif %}</p>
      </td>
    </tr>
    <table id="background-table" cellpadding="0" cellspacing="0" width="100%"
      style="border-collapse: collapse; mso-table-lspace: 0pt; mso-table-rspace: 0pt; background-color: #EDF1F5; border-collapse: collapse; mso-table-lspace: 0pt; mso-table-rspace: 0pt"
      bgcolor="#EDF1F5">
      <tbody>
        <tr>
          <td id="header-pattern-container" style="padding: 0px; border-collapse: collapse; padding: 10px 20px">
            <table id="header-pattern" cellspacing="0" cellpadding="0" border="0"
              style="border-collapse: collapse; mso-table-lspace: 0pt; mso-table-rspace: 0pt">
              <tbody>
                <tr>
                  <td id="header-text-container" valign="middle"
                    style="color:#2F323E; padding: 0px; border-collapse: collapse; vertical-align: middle; font-family: Arial, sans-serif; font-size: 14px; line-height: 20px; mso-line-height-rule: exactly; mso-text-raise: 1px">
                    {% if alert.action_type == "merge" %}{{alert.last_add_alertcef_time}}更新{% else %}[{{alert.operator_name}}] {% if alert.action_type == "assign_owner" %}分配{% elif alert.action_type == "add_comment" %}评论{% elif alert.action_type == "change_status" %}修改{% endif %}{% endif %}了一个事故{% if alert.action_type == "change_status" %}的状态{% endif %}</td>
                </tr>
              </tbody>
            </table>
          </td>
        </tr>
        <tr>
          <td id="email-content-container" style="padding: 0px; border-collapse: collapse; padding: 0 20px">
            <table id="email-content-table" cellspacing="0" cellpadding="0" border="0" width="100%"
              style="border-collapse: collapse; mso-table-lspace: 0pt; mso-table-rspace: 0pt; border-spacing: 0; border-collapse: separate">
              <tbody>
                <tr>
                  <td class="email-content-rounded-top mobile-expand"
                    style="padding: 0px; border-collapse: collapse; color: #ffffff; padding: 0 15px 0 16px; height: 15px; background-color: #ffffff; border-left: 1px solid #cccccc; border-top: 1px solid #cccccc; border-right: 1px solid #cccccc; border-bottom: 0; border-top-right-radius: 5px; border-top-left-radius: 5px; height: 10px; line-height: 10px; padding: 0 15px 0 16px; mso-line-height-rule: exactly"
                    height="10" bgcolor="#ffffff">&nbsp;</td>
                </tr>
                <tr>
                  <td class="email-content-main mobile-expand "
                    style="padding: 0px; border-collapse: collapse; border-left: 1px solid #cccccc; border-right: 1px solid #cccccc; border-top: 0; border-bottom: 0; padding: 0 15px 0 16px; background-color: #ffffff"
                    bgcolor="#ffffff">
                    <table class="page-title-pattern" cellspacing="0" cellpadding="0" border="0" width="100%"
                      style="border-collapse: collapse; mso-table-lspace: 0pt; mso-table-rspace: 0pt">
                      <tbody>
                        <tr>
                          <td
                            style="vertical-align: top;; padding: 0px; border-collapse: collapse; padding-right: 5px; font-size: 20px; line-height: 30px; mso-line-height-rule: exactly"
                            class="page-title-pattern-header-container"> <span class="page-title-pattern-header"
                              style="font-family: Arial, sans-serif; padding: 0; font-size: 20px; line-height: 30px; mso-text-raise: 2px; mso-line-height-rule: exactly; vertical-align: middle">
                              <a href="{{web_conf.custom.web_address}}/app/incident/{{alert.incident.id}}/" style="color: #5C9DF5; text-decoration: none" target="_blank">incident概述：{{alert.incident.subtitle}}</a> </span> </td>
                        </tr>
                      </tbody>
                    </table>
                  </td>
                </tr>
                {% if not alert.action_type == "" %}
                <tr>
                  <td class="email-content-main mobile-expand  wrapper-special-margin"
                    style="padding: 0px; border-collapse: collapse; border-left: 1px solid #cccccc; border-right: 1px solid #cccccc; border-top: 0; border-bottom: 0; padding: 0 15px 0 16px; background-color: #ffffff; padding-top: 10px; padding-bottom: 5px"
                    bgcolor="#ffffff">
                    <table class="keyvalue-table"
                      style="border-collapse: collapse; mso-table-lspace: 0pt; mso-table-rspace: 0pt">
                      <tbody>
                      {% if alert.action_type == "assign_owner" %}
                        <tr>
                          <th style="color: #2F323E; font: normal 14px/20px Arial, sans-serif; text-align: left; vertical-align: top; padding: 4px 0">
                            更改者:</th>
                          <td style="color: #2F323E; padding: 0px; border-collapse: collapse; font: normal 14px/20px Arial, sans-serif; padding: 4px 0 4px 5px; vertical-align: top">
                            {{alert.operator_name}}</td>
                        </tr>
                        <tr>
                          <th style="color: #2F323E; font: normal 14px/20px Arial, sans-serif; text-align: left; vertical-align: top; padding: 4px 0">
                            经办人:</th>
                          <td style="padding: 0px; border-collapse: collapse; font: normal 14px/20px Arial, sans-serif; padding: 4px 0 4px 5px; vertical-align: top">
                            <span class="diffcontext">{{alert.assign_owner_name}}</span> </td>
                        </tr>
                      {% elif alert.action_type == "add_comment" %}
                        <tr>
                          <th style="color: #2F323E; font: normal 14px/20px Arial, sans-serif; text-align: left; vertical-align: top; padding: 4px 0">
                            评论:</th>
                          <td style="color: #2F323E; padding: 0px; border-collapse: collapse; font: normal 14px/20px Arial, sans-serif; padding: 4px 0 4px 5px; vertical-align: top">
                            {{alert.comment_content}}</td>
                        </tr>
                      {% elif alert.action_type == "change_status" %}
                        <tr>
                          <th style="color: #2F323E; font: normal 14px/20px Arial, sans-serif; text-align: left; vertical-align: top; padding: 4px 0">
                            状态:</th>
                          <td style="color: #2F323E; padding: 0px; border-collapse: collapse; font: normal 14px/20px Arial, sans-serif; padding: 4px 0 4px 5px; vertical-align: top">
                            {{alert.change_status_post}}</td>
                        </tr>
                      {% endif %}
                      </tbody>
                    </table>
                  </td>
                </tr>
                {% endif %}
                <tr>
                  <td class="email-content-rounded-bottom mobile-expand"
                    style="padding: 0px; border-collapse: collapse; color: #ffffff; padding: 0 15px 0 16px; height: 5px; line-height: 5px; background-color: #ffffff; border-top: 0; border-left: 1px solid #cccccc; border-bottom: 1px solid #cccccc; border-right: 1px solid #cccccc; border-bottom-right-radius: 5px; border-bottom-left-radius: 5px; mso-line-height-rule: exactly"
                    height="5" bgcolor="#ffffff">&nbsp;</td>
                </tr>
              </tbody>
            </table>
          </td>
        </tr>
        <tr>
          <td id="footer-pattern" style="padding: 0px; border-collapse: collapse; padding: 12px 20px">
            <table id="footer-pattern-container" cellspacing="0" cellpadding="0" border="0"
              style="border-collapse: collapse; mso-table-lspace: 0pt; mso-table-rspace: 0pt">
              <tbody>
                <tr>
                  <td id="footer-pattern-text" class="mobile-resize-text" width="100%"
                    style="padding: 0px; border-collapse: collapse; line-height: 18px; mso-line-height-rule: exactly; mso-text-raise: 2px">
                  </td>
                </tr>
              </tbody>
            </table>
          </td>
        </tr>
      </tbody>
    </table>
    {% if alert.action_type == "assign_owner" or alert.action_type == "merge" %}
    <tr>
      <td style="font-family:Helvetica,Arial,sans-serif;font-size:14px;">
        <table width="100%" border="0" cellpadding="5" cellspacing="0">
          <tbody>
            <tr>
              <td>
                <p style="margin:0;font-size:14px;line-height:24px;color: #2F323E; font: bold 14px/20px Arial, sans-serif;margin-bottom: 10px">
                  <br>基本信息<br></p>
                <p style="margin:0;font-size:12px;line-height:24px;color: #2F323E; font: normal Arial, sans-serif;">
                  告警个数：{{ alert.total }}个</p>
                <p style="margin:0;font-size:12px;line-height:24px;color: #2F323E; font: normal Arial, sans-serif;margin-bottom: 10px">
                  incident概述：{{alert.incident.subtitle}} </p>
              </td>
            </tr>
          </tbody>
        </table>
      </td>
    </tr>
    <tr>
      <td style="font-family:Helvetica,Arial,sans-serif;font-size:14px;">
        <table width="318px" style="border: 1px solid #D7D7D7" cellpadding="10" cellspacing="0">
          <tbody>
            <tr>
              <td style="border-right: 1px solid #D7D7D7; background-color:#EFF3F6;">
                <p style="margin:0;font-size:12px;color: #2F323E; font-weight: bold; font-family:Arial, sans-serif;">等级
                </p>
              </td>
              <td style="border-right: 1px solid #D7D7D7; background-color:#EFF3F6;">
                <p style="margin:0;font-size:12px;color: #2F323E; font-weight: bold; font-family:Arial, sans-serif;">状态
                </p>
              </td>
              <td style="background-color:#EFF3F6;">
                <p style="margin:0;font-size:12px;color: #2F323E; font-weight: bold; font-family:Arial, sans-serif;">
                  开始时间</p>
              </td>
            </tr>
            <tr>
              <td style="border-right: 1px solid #D7D7D7">
                <p style="margin:0;font-size:12px;color: #2F323E; font: normal Arial, sans-serif;">{{alert.incident.priority}}</p>
              </td>
              <td style="border-right: 1px solid #D7D7D7">
                <p style="margin:0;font-size:12px;color: #2F323E; font: normal Arial, sans-serif;">{{alert.incident.status}}</p>
              </td>
              <td>
                <p style="margin:0;font-size:12px;color: #2F323E; font: normal Arial, sans-serif;">{{alert.incident.create_time}}</p>
              </td>
            </tr>
          </tbody>
        </table>
      </td>
    </tr>
    <tr>
      <td style="font-family:Helvetica,Arial,sans-serif;font-size:14px;">
        <table width="100%" border="0" cellpadding="5" cellspacing="0">
          <tbody>
            <tr>
              <td>
                <p
                  style="margin:0;font-size:14px;line-height:24px;color: #2F323E; font: bold 14px/20px Arial, sans-serif;margin-bottom: 10px">
                  <br>最新告警<br></p>
              </td>
            </tr>
          </tbody>
        </table>
      </td>
    </tr>
    <tr>
      <td style="font-family:Helvetica,Arial,sans-serif;font-size:14px;">
        <table width="100%" style="border: 1px solid #D7D7D7" cellpadding="10" cellspacing="0">
          <tbody>
            <tr>
              <td style="border-right: 1px solid #D7D7D7; background-color:#EFF3F6;">
                <p style="margin:0;font-size:12px;color: #2F323E; font-weight: bold; font-family:Arial, sans-serif;">时间
                </p>
              </td>
              <td style="border-right: 1px solid #D7D7D7; background-color:#EFF3F6;">
                <p style="margin:0;font-size:12px;color: #2F323E; font-weight: bold; font-family:Arial, sans-serif;">描述
                </p>
              </td>
              <td style="border-right: 1px solid #D7D7D7; background-color:#EFF3F6;">
                <p style="margin:0;font-size:12px;color: #2F323E; font-weight: bold; font-family:Arial, sans-serif;">名称
                </p>
              </td>
              <td style="border-right: 1px solid #D7D7D7; background-color:#EFF3F6;">
                <p style="margin:0;font-size:12px;color: #2F323E; font-weight: bold; font-family:Arial, sans-serif;">详情
                </p>
              </td>
              <td style="background-color:#EFF3F6;width:200px;">
                <p style="margin:0;font-size:12px;color: #2F323E; font-weight: bold; font-family:Arial, sans-serif;">操作
                </p>
              </td>
            </tr>
            {% for cef in alert.alertcefs|slice:":5" %}
            {% if not forloop.counter|divisibleby:"2" %}
            <tr>
            {% else %}
            <tr style="background-color:#F4F4F4;">
            {% endif %}
              <td style="border-right: 1px solid #D7D7D7">
                <p style="margin:0;font-size:12px;color: #2F323E; font: normal Arial, sans-serif;">{{cef.first_event_time}}
                </p>
              </td>
              <td style="border-right: 1px solid #D7D7D7">
                <p style="margin:0;font-size:12px;color: #2F323E; font: normal Arial, sans-serif;">{{cef.summary}}</p>
              </td>
              <td style="border-right: 1px solid #D7D7D7">
                <p style="margin:0;font-size:12px;color: #2F323E; font: normal Arial, sans-serif;">{{cef.name}}
                </p>
              </td>
              <td style="border-right: 1px solid #D7D7D7">
                <p style="margin:0;font-size:12px;color: #2F323E; font: normal Arial, sans-serif;">
                  {{cef.custom_info.alert_result_str}}</p>
              </td>
              <td>
                <p style="margin:0;font-size:12px;color: #2F323E; font: normal Arial, sans-serif;">
                  {% if cef.custom_info.alert_result.history_views %}
                    {% for his_view in cef.custom_info.alert_result.history_views %}
                      <a href="{{web_conf.custom.web_address}}{{his_view.url}}" style="color: #5C9DF5; text-decoration: none; padding-left: 10px;"
                        target="_blank">{{his_view.desc}}</a>
                    {% endfor %}
                  {% else %}
                    <a href="{{web_conf.custom.web_address}}/alerts/records/?alert_id={{cef.custom_info.alert_id}}&alert_name={{cef.custom_info.alert_name}}" style="color: #5C9DF5; text-decoration: none; padding-left: 10px;"
                      target="_blank">查看历史记录</a>
                    {% if cef.custom_info.alert_result != "" %}
                      <a href="{{web_conf.custom.web_address}}/search/?datasets={{ cef.custom_info.alert_result.data.search.datasets|urlencode }}&time_range={{cef.custom_info.alert_result.data.strategy.trigger.start_time|date:"Uu"|slice:":-3"}},{{cef.custom_info.alert_result.data.strategy.trigger.end_time|date:"Uu"|slice:":-3"}}&filters=&query={{cef.custom_info.alert_result.data.search.query|urlencode}}&title={{cef.custom_info.alert_result.data.name|urlencode}}&_t={{cef.custom_info.alert_result.data.send_time|date:"Uu"|slice:":-3"}}&page=1&size=20&order=desc&index=new&searchMode=index" style="color: #5C9DF5; text-decoration: none" target="_blank">在搜索中打开</a>
                    {% endif %}
                  {% endif %}
                </p>
              </td>
            </tr>
            {% endfor %}
          </tbody>
        </table>
      </td>
    </tr>
    <tr>
      <td style="font-family:Helvetica,Arial,sans-serif;font-size:14px;">
        <table width="100%" border="0" cellpadding="5" cellspacing="0">
          <tbody>
            <tr>
              <td>
                <p
                  style="margin:0;font-size:14px;line-height:24px;color: #2F323E; font: bold 14px/20px Arial, sans-serif;margin-bottom: 10px">
                  <br>事件相关告警数趋势<br></p>
              </td>
            </tr>
          </tbody>
        </table>
      </td>
    </tr>
    <tr>
      <td style="font-family:Helvetica,Arial,sans-serif;font-size:14px;">
        <img style="height: 300px;" src="cid:timechart_trend" />
      </td>
    </tr>
    {% endif  %}
  </tbody>
</table>
                """,
            "style": {
                "rows": 30,
                "cols": 60
            }
        }
    ]
}


# 发送GET请求，可以传入frontend的地址和接口，向Frontend发送请求
def http_get(url, params):
    logger.info("url is %s" % (url))
    logger.info("params is %s" % (params))

    url_params = urllib.parse.urlencode(params)
    logger.info("whole url is %s%s%s" % (url, '?', url_params))

    req = urllib.request.Request(url = '%s%s%s' % (url, '?', url_params))
    res = urllib.request.urlopen(req)
    res = res.read()
    logger.info("response is %s" % res)
    return res


def _web_conf_obj():
    confobj = {}
    try:
        cf = configparser.ConfigParser()
        real_path = os.getcwd() + '/config'
        cf.read(real_path + "/yottaweb.ini")
        for section in cf.sections():
            confobj[section] = {}
            for k, v in cf.items(section):
                confobj[section][k] = v
    except Exception:
        log_and_reply(logging.ERROR, ("_yottaweb_conf_obj get failed!"))
    return confobj


def _render(conf_obj, tmpl_str):
    t = Template(tmpl_str)
    c = Context(conf_obj)
    _content = t.render(c)
    return _content


def content(params, alert):
    logger.info("content params is %s" % (params))
    template_str = params.get('configs')[2].get('value')
    conf_obj = {'alert': alert, 'web_conf': _web_conf_obj()}
    _content = _render(conf_obj, template_str)
    _content = add_graph_to_text(params, _content)
    logger.info("content result is %s" % (_content))
    return _content


def connect_method(use_ssl, mail_host, smtp_port):
    if use_ssl == "yes":
        s = smtplib.SMTP_SSL()
    else:
        s = smtplib.SMTP()
    s.connect(mail_host, smtp_port)
    return s


# 样例2就是默认的发送方式
def common_method(use_ssl, mail_host, smtp_port):
    if use_ssl == "yes":
        s = smtplib.SMTP_SSL(mail_host, smtp_port)
    else:
        s = smtplib.SMTP(mail_host, smtp_port)
    return s


def starttls_method(use_ssl, mail_host, smtp_port):
    if use_ssl == "yes":
        s = smtplib.SMTP_SSL(mail_host, smtp_port)
    else:
        s = smtplib.SMTP(mail_host, smtp_port)
    s.starttls()
    return s


send_email_method = {"connect": connect_method,
                     "common": common_method, "starttls": starttls_method}

def handle(params, alert):
    try:
        do_handle(params, alert)
    except Exception as e:
        logger.info(e)
        raise e

def do_handle(params, alert):
    # print "###########################mail params: ",params
    # print "###########################mail alert: ", alert

    # render subject
    subject_tmpl=params.get('configs')[0].get('value')
    subject_conf_obj={'alert': alert}
    subject=_render(subject_conf_obj, subject_tmpl)

    logger.info("configs[1] is %s" % (params.get('configs')[1]))
    receivers=params.get('configs')[1].get('value').strip(',').split(',')
    logger.info("receivers are %s" % (receivers))

    # Frontend只有通过某个用户分组id获取某个分组的用户，目前没有批量接口。
    account_emails_list=[]
    for receiver in receivers:     # 循环获取
        logger.info("receiver is %s" % (receiver))
        if '@' in receiver:
            account_emails_list=account_emails_list + [receiver]
            logger.info("account_emails_list is %s" % (account_emails_list))
        else:
            logger.info("invalid receiver %s" % receiver)

    # 虽然注册用户时，邮箱不能重复，但是这里还是去重一下
    account_emails=list(set(account_emails_list))
    # 转化字符串
    receiver_str=','.join(account_emails)
    logger.info("receiver_str is %s" % (receiver_str))

    _content=content(params, alert)
    token=params.get('token')
    if token is None:
        logger.error("token is none")
    else:
        graph_path = params.get('timechart_trend_path')
        send_mail(subject, receiver_str, _content, token, graph_path)


def send_mail(subject, receiver, content, token, graph_path):
    try:
        cf = configparser.ConfigParser()
        real_path = os.getcwd() + '/config'
        cf.read(real_path + "/yottaweb.ini")
        use_ssl_ini = cf.get('email', 'use_ssl')
        need_login_ini = cf.get('email', 'need_login')
        send_address_ini = cf.get('email', 'send')
        smtp_pwd_ini = cf.get('email', 'passwd')
        smtp_port_ini = cf.get('email', 'smtp_port')
        email_user_ini = cf.get('email', 'user')
        smtp_server_ini = cf.get('email', 'smtp_server')
        use_ssl = ''
        need_login = ''
        send_address = ''
        smtp_pwd = ''
        smtp_port = ''
        email_user = ''
        smtp_server = ''

        all_ori_conf = MyUtils().get_key_config(token, 'all').get("data")

        if all_ori_conf:
            use_ssl = all_ori_conf.get('email_email_use_ssl')
            need_login = all_ori_conf.get('email_email_need_login')
            send_address = str(all_ori_conf.get('email_send'))
            smtp_pwd = all_ori_conf.get('email_passwd')
            smtp_port = str(all_ori_conf.get('email_smtp_port'))
            email_user = str(all_ori_conf.get('email_user')) if all_ori_conf.get(
                'email_user') else all_ori_conf.get('email_user')
            smtp_server = str(all_ori_conf.get('email_smtp_server'))
            if not (send_address and smtp_pwd and smtp_port and smtp_server and email_user):
                use_ssl = use_ssl_ini
                need_login = need_login_ini
                send_address = send_address_ini
                smtp_pwd = smtp_pwd_ini
                smtp_port = smtp_port_ini
                email_user = email_user_ini
                smtp_server = smtp_server_ini
            if email_user == 'sender' or not email_user:
                email_user = send_address
    except Exception as e:
        log_and_reply(logging.ERROR, ("alert_plugins_config get failed!"))
        use_ssl = 'no'
        need_login = 'yes'
        send_address = 'notice@yottabyte.cn'
        smtp_pwd = ''
        smtp_port = ''
        smtp_server = ''
    logger.info("alert_send_mail_conf: %s" % (send_address))
    sub = subject
    content = content
    mail_to_list = receiver.split(',')
    if not mail_to_list:
        return
    mail_host = smtp_server
    mail_address = send_address
    mail_pass = smtp_pwd
    mail_user = email_user
    logger.info("mail_host is %s" % (mail_host))
    logger.info("mail_address is %s" % (mail_address))
    logger.info("mail_sender is %s" % (mail_user))
    #
    # to_list:发给谁
    # sub:主题
    # content:内容
    # send_mail("sub","content")

    #
    main_msg = MIMEMultipart()
    me = mail_address
    # 创建一个实例，这里设置为html格式邮件
    msg = MIMEText(content, _subtype='html', _charset='gb18030')
    main_msg.attach(msg)
    main_msg['Subject'] = sub
    main_msg['From'] = me
    main_msg['To'] = ";".join(mail_to_list)

    contype = 'application/octet-stream'
    maintype, subtype = contype.split('/', 1)

    logger.info("graph path %s" % graph_path)
    # 如果趋势图路径是空，则跳过，不附带图片
    if graph_path and graph_path != "":
        target_file = graph_path
        data = open(target_file, 'rb')
        file_msg = MIMEBase(maintype, subtype)
        file_msg.set_payload(data.read())
        data.close()
        encoders.encode_base64(file_msg)
        #设置附件头
        basename = os.path.basename(target_file)
        file_msg.add_header('Content-Disposition', 'attachment', filename = basename)
        main_msg.attach(file_msg)

        #正文也增加图片，但是一个流只能增加一种，所以不能与附件合并
        fp = open(target_file, 'rb')
        image_msg = MIMEImage(fp.read(),subtype)
        fp.close()
        image_msg.add_header('Content-ID', '<timechart_trend>')
        main_msg.attach(image_msg)

    try:
        smtp = send_email_method.get(send_type)(use_ssl, mail_host, smtp_port)
        if need_login == "yes":
            smtp.login(mail_user, mail_pass)

        # logger.error(main_msg.as_string())
        smtp.sendmail(me, mail_to_list, main_msg.as_string())
        smtp.close()
        log_and_reply(
            logging.INFO, ("Send email[ %s ] of report successful!" % (sub)))
        return True
    except Exception as e:
        log_and_reply(
            logging.ERROR, ("Send mail [ %s ] Error: %s" % (sub, str(e))))
        return False

# 获取日志地址，不建议自定义
# 设置日志格式和滚动方式
def set_logger(reset_logger):
    global logger
    logger = reset_logger

# 既在日志中打印，又在执行结果中显示
def log_and_reply(log_level, comment):
    global reply_content
    log_content.get(log_level)(comment)
    reply_content = '%s%s%s' % (reply_content, "\n", comment)


# 获取执行结果的接口
def execute_reply(params, alert):
    logger.info("reply_content start")
    handle(params, alert)
    logger.info("reply_content: %s" % (reply_content))
    return reply_content

# 预览插入趋势图
def add_graph_to_text(params, content):
    graph_path = ""

    if "timechart_trend_path" in params:
        graph_path = params.get('timechart_trend_path')
        logger.info("graph_path is %s" % (graph_path))

        fp = open(graph_path, 'rb')
        base64_data = base64.b64encode(fp.read())
        fp.close()
        imageHtml = "<img src=\"data:image/jpg;base64,%s\" style=\"width:700px\"/><br><br>" % (base64_data)
        content = content.replace("<br><img src=\"cid:timechart_trend\"/><br><br>", imageHtml)
    else:
        #如果没有图片，这里就去掉显示图片的地方，否则会有一个图裂，但是不知道需不需要保留这个图裂，以作提示
        content = content.replace("<br><img src=\"cid:timechart_trend\"/><br><br>", "")

    logger.info("content replace is %s" % (content))
    return content

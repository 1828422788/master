# -*- coding: utf-8 -*-
# liu.shiyun@yottabyte.cn
# 2018-03-14
# Copyright 2018 Yottabyte
# filename: yottaweb/apps/alert/plugins/ping_host.py
# file description: ping主机的告警插件，是默认插件
__author__ = 'liu.shiyun'

from django.template import Context, Template
from email.mime.multipart import MIMEMultipart
from email.mime.text import MIMEText
from email.mime.base import MIMEBase
from email import encoders

import configparser
import smtplib
import logging
import os
import subprocess
import re

re_logger = logging.getLogger("django.request")
global reply_content
reply_content = ""
log_content = {
    logging.FATAL: re_logger.fatal,
    logging.ERROR: re_logger.error,
    logging.WARNING: re_logger.warning,
    logging.INFO: re_logger.info,
    logging.DEBUG: re_logger.debug
}

META = {
        "name": "ping_host",
        "version": 1,
        "alias": "ping主机",
        "configs": [
            {
                "name": "ipOrHostname",
                "alias": "IP地址或主机名",
                "placeholder": "支持模板语言",
                "presence": True,
                "value_type": "template",
                "default_value": "{{alert.alertcefs.0.source}}",
                "style": {
                    "rows": 1,
                    "cols": 15
                }
            }
        ]
}

# pattern compile
CHUNK = '([a-zA-Z0-9][a-zA-Z0-9-]{0,61}[a-zA-Z0-9]|[a-zA-Z0-9])'
CHUNK_HOSTNAME = r'^('+ CHUNK +'\.)*' + CHUNK + '$'
PATTERN_HOSTNAME = re.compile(CHUNK_HOSTNAME)

CHUNK_IPV4 = r'([0-9]|[1-9][0-9]|1[0-9][0-9]|2[0-4][0-9]|25[0-5])'
PATTERN_IPV4 = re.compile(r'^(' + CHUNK_IPV4 + r'\.){3}' + CHUNK_IPV4 + r'$')

CHUNK_IPV6 = r'([0-9a-fA-F]{1,4})'
PATTERN_IPV6 = re.compile(r'^(' + CHUNK_IPV6 + r'\:){7}' + CHUNK_IPV6 + r'$')

def _web_conf_obj():
    confobj = {}
    try:
        cf = configparser.ConfigParser()
        real_path = os.getcwd() + '/config'
        cf.read(real_path + "/yottaweb.ini")
        for section in cf.sections():
            confobj[section] = {}
            for k,v in cf.items(section):
                confobj[section][k] = v
    except Exception as e:
        log_and_reply(logging.ERROR, ("_yottaweb_conf_obj get failed!"))
    return confobj

def _render(conf_obj, tmpl_str):
    t = Template(tmpl_str)
    c = Context(conf_obj)
    _content = t.render(c)
    return _content

def content(params, alert):
    template_str = params.get('configs')[0].get('value')
    conf_obj = {'alert': alert, 'web_conf': _web_conf_obj()}
    _content = _render(conf_obj, template_str)
    return _content

def handle(params, alert):
    # 如果有要显示在执行结果的内容，需要再次声明全局变量。
    # global reply_content

    # render subject
    subject_tmpl = params.get('configs')[0].get('value')
    # 以下是输出信息的三种方式：
    # 只打印日志：re_logger.info("subject_tmpl is: %s " % (subject_tmpl))
    # 只在执行结果中显示，需要结合上面再次声明全局变量：reply_content = '%s%s%s' % (reply_content, "\n", subject_tmpl)
    # 既打印日志，又在执行结果中显示：log_and_reply(logging.INFO, ("subject_tmpl is: %s " % (subject_tmpl)))

    subject_conf_obj = {'alert': alert}
    subject = _render(subject_conf_obj, subject_tmpl)
    _content = content(params, alert)
    return run_command(_content)

def run_command(ip_or_hostname):
    valid = validate_hostname(ip_or_hostname) or validate_IP_address(ip_or_hostname)
    if valid:
        ping_command = "ping -c 3 %s" % (ip_or_hostname)
        re_logger.info("command is: %s" % (ping_command))
        status,output = subprocess.getstatusoutput(ping_command)
        log_and_reply(logging.INFO, ("%s" % (output)))
        return output
    else:
        output = ip_or_hostname + " is not ip or hostname"
        re_logger.error(output)
        log_and_reply(logging.ERROR, ("%s" % (output)))
        return output

def validate_hostname(hostname):
    return True if PATTERN_HOSTNAME.match(hostname) else False

def validate_IP_address(ip):
    if '.' in ip:
        return True if PATTERN_IPV4.match(ip) else False
    if ':' in ip:
        return True if PATTERN_IPV6.match(ip) else False
    return False

# 既在日志中打印，又在执行结果中显示
def log_and_reply(log_level, comment):
    global reply_content
    log_content.get(log_level)(comment)
    reply_content = '%s%s%s' % (reply_content, "\n", comment)

# 获取执行结果的接口
def execute_reply(params, alert):
    re_logger.info("reply_content start")
    handle(params, alert)
    re_logger.info("reply_content: %s" % (reply_content))
    return reply_content







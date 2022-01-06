# -*- coding: utf-8 -*-
# wu.ranbo@yottabyte.cn
# 2016-05-19
# Copyright 2016 Yottabyte
# filename: yottaweb/apps/alert/plugins/http_forwarder.py
# file description: 告警转发插件，默认插件
__author__ = 'wu.ranbo'

from django.template import Context, Template
import configparser
import html.parser
import logging
import requests
import json
import copy
import os

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
    "name": "http_forwarder",
    "version": 2,
    "alias": "告警转发",
    "configs": [
        {
            "name": "address",
            "alias": "转发url地址",
            "placeholder": "支持模板语言",
            "presence": True,
            "value_type": "string",
            "default_value": "http://127.0.0.1:8080/?alert_name={{alert.name}}&alert.send_time={{alert.send_time}}",
            "style": {
                "rows": 1,
                "cols": 60
            }
        },
        {
            "name": "method",
            "alias": "请求方法",
            "placeholder": "",
            "presence": True,
            "value_type": "string",
            "input_type": "drop_down",
            "input_candidate": ["POST", "GET", "PUT", "DELETE"],
            "default_value": "POST",
            "style": {
                "rows": 1,
                "cols": 30
            }
        },
        {
            "name": "body",
            "alias": "Body内容",
            "placeholder": "用&连接的参数或json等,{{alert|safe}}是获取全部告警信息",
            "presence": False,
            "value_type": "string",
            "default_value": """{{alert|safe}}""",
            "style": {
                "rows": 30,
                "cols": 60
            }
        }
        ]
    }

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

def datetime_to_timestamp(dt):
    return int(dt.strftime("%s"))*1000 + dt.microsecond/1000

def deparse_alert_post(out_alert_post):
    alert_post = copy.deepcopy(out_alert_post)
    alert_post['send_time'] = datetime_to_timestamp(alert_post['send_time'])
    alert_post['exec_time'] = datetime_to_timestamp(alert_post['exec_time'])
    trigger = alert_post['strategy']['trigger']
    if 'start_time' in trigger:
        trigger['start_time'] = datetime_to_timestamp(trigger['start_time'])
    if 'end_time' in trigger:
        trigger['end_time'] = datetime_to_timestamp(trigger['end_time'])
    if 'baseline_start_time' in trigger:
        trigger['baseline_start_time'] = datetime_to_timestamp(trigger['baseline_start_time'])
    if 'baseline_end_time' in trigger:
        trigger['baseline_end_time'] = datetime_to_timestamp(trigger['baseline_end_time'])

    if 'compare_desc_text' in trigger:
        del trigger['compare_desc_text']
    alert_post['strategy']['trigger'] = trigger
    del alert_post['_alert_meta']
    return alert_post

def http_post(url, body):
    # body = json.dumps(body)
    body = body.encode("utf-8")
    re_logger.info("http_post body: %s, %s" % (type(body), body))

    # 若需要发送的post请求为"application/json"格式，可以在请求中加上header:
    # headers={'Content-Type': "application/json"}
    # 可以通过登录接口 http://127.0.0.1:8090/api/v2/login/ 进行测试，header再加上Authorization头:
    # "Authorization": "Basic YWRtaW46YWRtaW5Acml6aGl5aS5jb20="
    result = requests.post(url, data=body, timeout=(1.0, 3.0))
    re_logger.info("http_post reponse: %s" % (result))
    res = result.json()
    re_logger.info("http_post result: %s" % (res))

def http_get(url, body):
    requests.get(url, timeout=(1.0, 3.0))

def http_put(url, body):
    body = body.encode("utf-8")
    requests.put(url, data=body, timeout=(1.0, 3.0))

def http_delete(url, body):
    requests.delete(url, timeout=(1.0, 3.0))

send_method = {"POST": http_post, "GET": http_get, "PUT": http_put, "DELETE": http_delete}

#兼容旧版的配置项，使插件后台执行保持正常
def old_deal(params):
    if not params['version'] == 2:
            params['configs'].append({'value': "POST"})
            params['configs'].append({'value': "{{alert|safe}}"})
    return params

def content(params, alert, isHandle = False):
    # re_logger.info("content params is %s" % (params))
    url_template = params['configs'][0]['value']
    body_template = params['configs'][2]['value']
    re_logger.info("url template is %s" % (url_template))
    re_logger.info("body template is %s" % (body_template))

    origin_alert = deparse_alert_post(alert)
    origin_alert_info = json.dumps(origin_alert, ensure_ascii=False, indent=4).encode("utf-8", "ignore")
    conf_obj = {'alert': origin_alert, 'web_conf': _web_conf_obj()}

    url = _render(conf_obj, url_template)
    body = ""
    #兼容旧版本，body的默认值传原始告警信息，并且转化为json。其余的需要用户自己转换了。
    if body_template.strip() == "{{alert|safe}}":
        body = origin_alert_info
        body = str(body, encoding="utf8")
    else:
        body = _render(conf_obj, body_template)
        # 用户可能需要自己将数据整成json格式，例如：
        # content = {
        #     "name": body
        # }
        # body = json.dumps(content)

    re_logger.info("url is %s" % (url))
    re_logger.info("body is %s" % (body))


    # 如果是handler调用，即执行，则返回url和body，如果是预览，则显示几个支持模板的控件中的内容。
    if isHandle:        
        return url, body
    else:         
        _content = ("""url地址: %s<br><br>body内容: <br>%s<br>""") % (url, body)
        return _content

def handle(params, alert):
    try:
        re_logger.info("params is %s" % (params))
        #处理旧插件
        new_params = old_deal(params)
        re_logger.info("new params is %s" % (new_params))
        method = params['configs'][1]['value']
        (url, body) = content(new_params, alert, True)
        html_parser = html.parser.HTMLParser()
        parse_body = html_parser.unescape(body)
        send_method.get(method)(url, parse_body)
    except Exception as e:
        log_and_reply(logging.ERROR, ("alert.plugins.http_forwarder got exception %s") % e)
        raise e
            
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
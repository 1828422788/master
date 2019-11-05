# /usr/bin/env python
# -*- coding: utf-8 -*-
# filename: yottaweb/apps/alert/plugins/baixin_alert.py
# 2017-06-24
# file description: 百信银行告警发送
__author__ = 'Lai.YM'
import logging
import json
import urllib2
import urllib
import sys
import time
import hashlib
import uuid
import traceback

# NOTE!!!!!
# 1. 告警的查询query需要保证结果中包含hostname字段。
# 因为发告警需要hostname，搜索可有多个hostname，
# 所以是要循环告警查询的所有结果一条条发送，结果中必须含有hostname字段。
# 2. 因显示阈值问题，基线告警暂时不能配置为此插件
# 3. 连续统计告警使用“达到阈值”指定的值作为阈值

MONITOR_URL = "http://xxx/portal/api/warning/extern/third_party/add.do"
SMS_URL = "http://172.20.17.11:8088/json/send-template-sms"

req_logger = logging.getLogger("django.request")
META = {
    "name": "baixin_alert",
    "version": 1,
    "alias": "百信告警发送",   # 这个alias的名字直接会显示在前台web的告警方式中
    "configs": [
        {
            "name": "phones",
            "alias": "短信告警手机号,多个以英文逗号隔开",  # 这个会直接显示在前台web的填写框下面,用来指引用户
            "presence": True,
            "value_type": "string",
            "default_value": "",
            "input_type": "phone",
            "style": {
                "rows": 1,
                "cols": 15
            }
        },
        {
            "name": "ckecker",
            "alias": "报警系统名称",
            "value_type": "string",
            "default_value": "log",
            "presence": True,
            "style": {
                "rows": 1,
                "cols": 15,
            }
        },
        {
            "name": "class",
            "alias": "监控类别",
            "value_type": "string",
            "default_value": "",
            "presence": True,
            "style": {
                "rows": 1,
                "cols": 15,
            }
        },
        {
            "name": "object",
            "alias": "监控对象",
            "value_type": "string",
            "default_value": "",
            "presence": True,
            "style": {
                "rows": 1,
                "cols": 15,
            }
        },
        {
            "name": "metrics",
            "alias": "监控指标",
            "value_type": "string",
            "default_value": "",
            "presence": True,
            "style": {
                "rows": 1,
                "cols": 15,
            }
        },
        {
            "name": "alarmLevel",
            "alias": "告警级别",  # warn：一般告警；minor：次要告警major：主要告警critical：严重告警
            "value_type": "string",
            "default_value": "minor",
            "input_type": "drop_down",
            "input_candidate": ["warn", "minor", "major", "critical"],
            "presence": True,
            "style": {
                "rows": 1,
                "cols": 10,
            }
        },
        {
            "name": "note",
            "alias": "补充说明告警的内容",
            "value_type": "string",
            "default_value": "",
            "presence": False,
            "style": {
                "rows": 1,
                "cols": 30,
            }
        },
        {
            "name": "url",
            "alias": "处理告警的运维手册和自动化脚本链接",
            "value_type": "string",
            "default_value": "",
            "presence": False,
            "style": {
                "rows": 1,
                "cols": 40,
            }
        }
        ]
    }

################################################################

# 获取body
def get_alert_body(params, alert, host):
    # 通过参数执行的值
    configs = params.get('configs')
    checker = configs[1].get('value')
    i_class = configs[2].get('value')
    i_object = configs[3].get('value')
    metrics = configs[4].get('value')
    alarmLevel = configs[5].get('value')
    note = configs[6].get('value')
    url = configs[7].get('value')

    # 获取告警时间
    timedatetime = alert['exec_time']
    alarmTime = timedatetime.strftime("%Y_%m_%d_%H:%M:%S:%f")[0:-3]
    # 获取告警值
    value = 0
    result = alert['result']
    if 'value' in result:
        value = result['value']
    elif 'total' in result:
        value = result['total']
    elif 'hits' in result:
        value = len(result['hits'])
    # 获取告警阈值
    # 基线告警暂时不考虑，连续统计告警使用“达到阈值”指定的值作为阈值
    threshold = 0
    trigger = alert['strategy']['trigger']
    if 'compare_value' in trigger:
        if len(trigger['compare_value']) == 1:
            threshold = trigger['compare_value'][0]
    elif 'threshold' in trigger:
        threshold = trigger['threshold']

    # 返回值
    ret = {
        "host": host,
        "checker": checker,
        "alarmTime": alarmTime,
        "class": i_class,
        "object": i_object,
        "metrics": metrics,
        "alarmLevel": alarmLevel,
        "value": value,
        "threshold": threshold,
        "note": note,
        "url": url
    }
    return ret

# # 发送到监控平台
def get_monitor_req(alert_body):
    mon_url = MONITOR_URL
    msgdata = urllib.urlencode(alert_body)
    req = urllib2.Request(mon_url, msgdata)
    req.add_header('Content-Type', 'application/json')
    return req

# # return: == 0 表明三次重试依然失败
def sendmonitor(alert_body, tmout=1):
    req = get_monitor_req(alert_body)
    cycleTime = 1
    sendStatus = 1
    while True:
        try:
            res = urllib2.urlopen(req, timeout=tmout)
            resCtx = res.read()
            resJson = json.loads(resCtx)
        except Exception, e:
            req_logger.error("baixin_alert: Occur an error when send info to monitor platform, url is:" +
                             req.get_full_url() + req.get_data() + ",exception is " + str(e))
            exc_type, exc_value, exc_traceback = sys.exc_info()
            req_logger.error(traceback.format_exception(exc_type, exc_value, exc_traceback))
            cycleTime += 1
        else:
            if resJson["retStatus"] != 0:
                req_logger.error("baixin_alert: Return status abnormal when send info to monitor platform")
                sendStatus = 0
                exc_type, exc_value, exc_traceback = sys.exc_info()
                req_logger.error(traceback.format_exception(exc_type, exc_value, exc_traceback))
            break

        if cycleTime > 3:
            sendStatus = 0
            req_logger.error("baixin_alert: Three times error when send info to monitor platform")
            exc_type, exc_value, exc_traceback = sys.exc_info()
            req_logger.error(traceback.format_exception(exc_type, exc_value, exc_traceback))

    return sendStatus

def getMd5(string):
    m = hashlib.md5()
    m.update(string)
    md5 = m.hexdigest()
    return md5

def get_sms_req(alert_body, mobiles):
    sms_url = SMS_URL
    username = "test141"
    password = "123456"
    uniqId = str(uuid.uuid1())
    timestamp = int(round(time.time() * 1000))
    sign_string = str(username) + str(password) + uniqId + str(timestamp)
    sign = getMd5(str(sign_string))
    service_code = "1069001"
    template_id = "baixin_monitor_170622_01"
    msgdata = urllib.urlencode({
        "user_id": username,    # 这些字段都是api中强制要求有的
        "transaction_id": uniqId,
        "timestamp": timestamp,
        "sign": sign,
        "template_id": template_id,
        "mobiles": mobiles,
        "sms_param": alert_body,
        "service_code": service_code,
        "ext": ""})
    req = urllib2.Request(sms_url, msgdata)
    return req

def sendsms(alert_body, mobiles):
    req = get_sms_req(mobiles, alert_body)
    try:
        urllib2.urlopen(req)
    except Exception, e:
        req_logger.error("baixin_alert: sms failed, url is: " +
                         req.get_full_url() + req.get_data() + ",exception is " + str(e))
        exc_type, exc_value, exc_traceback = sys.exc_info()
        req_logger.error(traceback.format_exception(exc_type, exc_value, exc_traceback))

    # print res.read()
    return

def content(params, alert):
    ret_str = ""
    try:
        alert_bodies = []
        is_recovery = alert['is_alert_recovery']
        if is_recovery:
            return "the recover alert, no content preview"
        else:
            if len(alert["result"]["hits"]) <= 0:
                return "alert search no result, render empty content"
            for hit in alert["result"]["hits"]:
                if "hostname" not in hit:
                    return "hostname not in a hit result"
                alert_bodies.append(get_alert_body(params, alert, hit["hostname"]))
        ret = []
        mobiles = params['configs'][0].get('value')
        for body in alert_bodies:
            req = get_monitor_req(body)
            ret.append(req.get_full_url() + req.get_data())
            req = get_sms_req(body, mobiles)
            ret.append(req.get_full_url() + req.get_data())
        ret_str = "<br>".join(ret)
        return ret_str
    except Exception, e:
        req_logger.error("baixin_alert: content get error: " + str(e))
        exc_type, exc_value, exc_traceback = sys.exc_info()
        req_logger.error(traceback.format_exception(exc_type, exc_value, exc_traceback))
        ret_str = "preview content error, baixin_alert: content get error: " + str(e) + str(traceback.format_exception(exc_type, exc_value, exc_traceback))
        return ret_str
    return ret_str

# ###  捕获手机号码 ####
def handle(params, alert):
    try:
        mobiles = params['configs'][0].get('value').strip(" ")
        is_recovery = alert['is_alert_recovery']
        if is_recovery:
            return "the recover alert, no content preview"
        else:
            for hit in alert["result"]["hits"]:
                if "hostname" not in hit:
                    return "hostname not in a hit result"
                alert_body = get_alert_body(params, alert, hit["hostname"])
                monitor_ret_code = sendmonitor(alert_body)
                if monitor_ret_code != 1:
                    sendsms(alert_body, mobiles)
    except Exception, e:
        req_logger.error("baixin_alert: alert.plugins.sendsms got exception " + str(e))
        exc_type, exc_value, exc_traceback = sys.exc_info()
        req_logger.error(traceback.format_exception(exc_type, exc_value, exc_traceback))
        raise e

# ###  测试短信告警发送内容 ####
_mobiles = "13426402990"
_t_content = {
    "type": "test",
    "level": "high",
    "host": "aom",
    "ip": "192.168.1.1",
    "time": "2017-06-26 10 : 20 : 00",
    "msg": "error",
    "detail": "device alert"
}
################################

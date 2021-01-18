#/usr/bin/env python
# -*- coding: utf-8 -*-
# Copyright 2016 Yottabyte
# filename: yottaweb/apps/alert/plugins/sendsms.py
import logging
import requests
import json
import copy
import httplib
import urllib2
import sys
import urllib
import suds
req_logger = logging.getLogger("django.request")
META = {
    "name": "sendsms",
    "version": 1,
    "alias": "Warehouse Oracle DB  短信告警",
    "configs": [
        {
            "name": "address",
            "alias": "手机号码(多个手机号码请使用英文逗号分隔)",
            "presence": True,
            "value_type": "string",
            "default_value": "",
            "style": {
                "rows": 1,
                "cols": 30
            }
        }
        ]
    }

#logger=logging.getLogger()
#file=logging.FileHandler("/tmp/test.log")
#logger.addHandler(file)
#formatter=logging.Formatter("%(asctime)s %(levelname)s %(message)s")
#file.setFormatter(formatter)
#logger.setLevel(logging.NOTSET)
#logger.info("begin to log")

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

def sendsms(mobile,content):
    url="http://XXX/services/cmcc_mas_wbs?wsdl"
    applicationID="XXX"
    desAddress="tel:%s"%mobile
    messageFormat="GB2312"
    deptNo="XXX"
    empNo="XXX"
    isMain="XXX"
    passageWay="XXX"
    password="XXX"
    username="XXX"
    client = suds.client.Client(url)
    service = client.service
    #print("client:    %s" % client)
    client.service.sendSms(applicationID,desAddress,"",content,messageFormat,"Normal","false",deptNo,empNo,isMain,passageWay,password,username)

def content(params, alert):
    origin_alert = deparse_alert_post(alert)
    return json.dumps(origin_alert, ensure_ascii=False, indent=4).encode("utf-8", "ignore")
def handle(params, alert):
    try:
        #logger.debug("alert:%s"%alert)
        #logger.debug("address:%s"%address)
        #logger.debug("alert.name:%s"%alert['name'])
        address = params['configs'][0]['value']
        addressList = address.split(",")
        contentList = []
        for tempMsg in alert['result']['hits']:
            if tempMsg.has_key('raw_message'):
                rawMessage = tempMsg['raw_message'].strip('\n')
                rawMsg = json.loads(rawMessage) 
                if rawMsg.has_key('SUBJECT_AREA') and rawMsg.has_key('WORKFLOW_NAME'):
                    sArea = rawMsg['SUBJECT_AREA']
                    wName = rawMsg['WORKFLOW_NAME']
                    contentList.append((sArea,wName))
        #for tempContent in contentList:   #can not really remove duplicate values in below cicle
        #    if contentList.count(tempContent) > 1:
        #        contentList.remove(tempContent)
        contentList = list(set(contentList))
        for finalContent in contentList:
            if isinstance(finalContent,tuple) and len(finalContent) > 1:
                content = alert['name']+"\n"+"SUBJECT_AREA:"+finalContent[0]+"\n"+"WORKFLOW_NAME:"+finalContent[1]
                for mobile in addressList:
                    sendsms(mobile.strip(" "),content)
    except Exception, e:
        req_logger.error("alert.plugins.sendsms got exception %s", e)
        raise e

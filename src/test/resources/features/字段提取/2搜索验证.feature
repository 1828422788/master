 @second @configsSmoke
Feature: 字段提取搜索验证

  Scenario Outline: 在搜索页验证
    When open the "splSearch.SearchPage" page for uri "/search/"
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I set the parameter "SearchInput" with value "tag:<tag>"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    Then I move the mouse pointer to the "Result"
    And I click the "RightIcon" button
    Then I will see the spl search result "<searchResult>"

    Examples:
      | tag                                   | searchResult                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        |
#      | auto_test_geo                         | {'apache.clientip.geo.city':'apache.clientip.geo.city：private ','apache.clientip.geo.country':'apache.clientip.geo.country：private ','apache.clientip.geo.ip':'apache.clientip.geo.ip：192.168.1.139 ','apache.clientip.geo.isp':'apache.clientip.geo.isp：private ','apache.clientip.geo.province':'apache.clientip.geo.province：private ','apache.method':'apache.method：GET ','apache.referer':'apache.referer：http://alltest.rizhiyi.com/search/?query=*&time_range=-2d%2Cnow&order=desc&size=20&page=1&sourcegroup=all&type=timeline&_t=1422088066859&title=%E9%BB%98%E8%AE%A4&index=0 ','apache.referer_domain':'apache.referer_domain：alltest.rizhiyi.com ','apache.request_path':'apache.request_path：/api/v0/search/fields/ ','apache.request_query':'apache.request_query：field=tag&filters=&order=desc&page=1&query=*&size=50&sourcegroup=all&sourcegroupCn=%E6%89%80%E6%9C%89%E6%97%A5%E5%BF%97&time_range=-2d,now&type=fields ','apache.resp_len':'apache.resp_len：363 ','apache.status':'apache.status：200 ','apache.timestamp':'apache.timestamp：24/Jan/2015:17:03:49 +0800 ','apache.ua':'apache.ua：Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:35.0) Gecko/20100101 Firefox/35.0 ','apache.version':'apache.version：1.1 '} |
#      | auto_test_csv                         | {'other.portinfo[].1':'other.portinfo[].1：T1/1 T1/2 F2/1 F2/2 F2/3 F2/4 F2/5 F2/6 F2/7 F2/8 ','other.portinfo[].2':'other.portinfo[].2：down down up up down down down down down down ','other.portinfo[].3':'other.portinfo[].3：0 0 0 0 0 0 0 0 0 0 ','other.portinfo[].4':'other.portinfo[].4：0 0 0 0 0 0 0 0 0 0 ','other.portinfo[].5':'other.portinfo[].5：0 0 0 0 0 0 0 0 0 0 ','other.portinfo[].6':'other.portinfo[].6：0 0 0 0 0 0 0 0 0 0 '}                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 |
#      | auto_test_hex                         | {'raw_message':'raw_message：import sys\nimpor'}                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     |
#      | auto_test_ip                          | {'other.ip':'other.ip：217.171.224.66 '}                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             |
#      | auto_test_KV                          | {'other.MNEMONIC':'other.MNEMONIC：ZONE_DP_FLT_EXECUTION_TCP_LOG(l) ','other.host':'other.host：HLJ_S12508_1_FW ','other.id':'other.id：190 ','other.message.beginTime_e(1013)':'other.message.beginTime_e(1013)：05182016112009 ','other.message.destIPAddr(1019)':'other.message.destIPAddr(1019)：10.166.5.70 ','other.message.destPortNum(1020)':'other.message.destPortNum(1020)：1521 ','other.message.destZoneName(1035)':'other.message.destZoneName(1035)：servertrust ','other.message.endTime_e(1014)':'other.message.endTime_e(1014)：05182016112009 ','other.message.policyActType(1071)':'other.message.policyActType(1071)：denied ','other.message.protType(1001)':'other.message.protType(1001)：TCP(6) ','other.message.rule_ID(1070)':'other.message.rule_ID(1070)：90 ','other.message.srcIPAddr(1017)':'other.message.srcIPAddr(1017)：10.167.77.99 ','other.message.srcPortNum(1018)':'other.message.srcPortNum(1018)：49362 ','other.message.srcZoneName(1034)':'other.message.srcZoneName(1034)：serveruntrust ','other.severity':'other.severity：6 ','other.timestamp':'other.timestamp：May 18 11:20:10 2016  ','other.vendor':'other.vendor：10FILTER '} |
#      | auto_test_KV_group                    | {'test.Cell.CellName':'test.Cell.CellName：CA_ABS ','test.Cell.ChildCount':'test.Cell.ChildCount：4 ','test.Cell.ChildCountLimit':'test.Cell.ChildCountLimit：5000 ','test.Cell.ClientIp':'test.Cell.ClientIp：9 ','test.Cell.MessageLimit':'test.Cell.MessageLimit：12288 ','test.Cell.MinuteCountLimit':'test.Cell.MinuteCountLimit：2000 ','test.Cell.Oid':'test.Cell.Oid：CA_ABS ','test.Cell.OutOfService':'test.Cell.OutOfService：false ','test.Cell.OverLoad':'test.Cell.OverLoad：false ','test.Cell.ParentOid':'test.Cell.ParentOid：CA_ABS ','test.InvokeProcessor.AverageTaskTime':'test.InvokeProcessor.AverageTaskTime：7 ','test.InvokeProcessor.AverageTasksPerSecond':'test.InvokeProcessor.AverageTasksPerSecond：0 ','test.InvokeProcessor.CompletedTasks':'test.InvokeProcessor.CompletedTasks：22321 ','test.InvokeProcessor.ComputeAverageInterval':'test.InvokeProcessor.ComputeAverageInterval：10000 ','test.InvokeProcessor.RunningTasks':'test.InvokeProcessor.RunningTasks：0 '}                                                                                                                                                                       |
#      | auto_test_syslog                      | {'other.facility':'other.facility：daemon ','other.pri':'other.pri：30 ','other.severity':'other.severity：info '}                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     |
#      | auto_test_url                         | {'apache.clientip':'apache.clientip：192.168.1.139 ','apache.method':'apache.method：GET ','apache.referer':'apache.referer：http://alltest.rizhiyi.com/search/?query=*&time_range=-2d%2Cnow&order=desc&size=20&page=1&sourcegroup=all&type=timeline&_t=1422088066859&title=%E9%BB%98%E8%AE%A4&index=0 ','apache.referer_domain':'apache.referer_domain：alltest.rizhiyi.com ','apache.request_path':'apache.request_path：/api/v0/search/fields/ ','apache.request_query':'apache.request_query：field=tag&filters=&order=desc&page=1&query=*&size=50&sourcegroup=all&sourcegroupCn=所有日志&time_range=-2d,now&type=fields ','apache.resp_len':'apache.resp_len：363 ','apache.status':'apache.status：200 ','apache.timestamp':'apache.timestamp：24/Jan/2015:17:03:49 +0800 ','apache.ua':'apache.ua：Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:35.0) Gecko/20100101 Firefox/35.0 ','apache.version':'apache.version：1.1 '}                                                                                                                                                                                                                                            |
#      | auto_test_agent                       | {'apache.clientip':'apache.clientip：192.168.1.139 ','apache.method':'apache.method：GET ','apache.referer':'apache.referer：http://alltest.rizhiyi.com/search/?query=*&time_range=-2d%2Cnow&order=desc&size=20&page=1&sourcegroup=all&type=timeline&_t=1422088066859&title=%E9%BB%98%E8%AE%A4&index=0 ','apache.referer_domain':'apache.referer_domain：alltest.rizhiyi.com ','apache.request_path':'apache.request_path：/api/v0/search/fields/ ','apache.request_query':'apache.request_query：field=tag&filters=&order=desc&page=1&query=*&size=50&sourcegroup=all&sourcegroupCn=%E6%89%80%E6%9C%89%E6%97%A5%E5%BF%97&time_range=-2d,now&type=fields ','apache.resp_len':'apache.resp_len：363 ','apache.status':'apache.status：200 ','apache.timestamp':'apache.timestamp：24/Jan/2015:17:03:49 +0800 ','apache.ua.browser':'apache.ua.browser：Firefox ','apache.ua.browser_v':'apache.ua.browser_v：Firefox 35.0 ','apache.ua.os':'apache.ua.os：Mac OS X ','apache.ua.os_v':'apache.ua.os_v：Mac OS X 10.10 ','apache.version':'apache.version：1.1 '}                                                                                                                   |
#      | auto_test_replaceContent              | {'raw_message':'raw_message：123456qwe'}                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             |
      | auto_test_n                           | {'other.geo.city':'other.geo.city：鞍山市 ','other.geo.country':'other.geo.country：中国 ','other.geo.isp':'other.geo.isp：中国移动 ','other.geo.latitude':'other.geo.latitude：41.115009 ','other.geo.longitude':'other.geo.longitude：122.976822 ','other.geo.phone':'other.geo.phone：15998008888 ','other.geo.province':'other.geo.province：辽宁 '}                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              |
      | auto_test_tel                         | {'other.city':'other.city：鞍山市 ','other.country':'other.country：中国 ','other.isp':'other.isp：中国移动 ','other.latitude':'other.latitude：41.115009 ','other.longitude':'other.longitude：122.976822 ','other.province':'other.province：辽宁 '}                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               |
      | auto_test_toNum                       | {'other.MNEMONIC':'other.MNEMONIC：ZONE_DP_FLT_EXECUTION_TCP_LOG(l) ','other.host':'other.host：HLJ_S12508_1_FW ','other.id':'other.id：190 ','other.message':'other.message：srcZoneName(1034)=serveruntrust;destZoneName(1035)=servertrust;rule_ID(1070)=90;policyActType(1071)=denied;protType(1001)=TCP(6);srcIPAddr(1017)=10.167.77.99;destIPAddr(1019)=10.166.5.70;srcPortNum(1018)=49362;destPortNum(1020)=1521;beginTime_e(1013)=05182016112009;endTime_e(1014)=05182016112009; ','other.severity':'other.severity：6 ','other.timestamp':'other.timestamp：May 18 11:20:10 2016  ','other.vendor':'other.vendor：10FILTER '}                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      |
      | 1 AND appname:regex                   | {"other.user":"other.user：enable_15 "}                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              |
      | 2 AND appname:regex                   | {"other.user":"other.user：enable_15 "}                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              |
      | auto_test_apache                      | {'apache.referer':'apache.referer：http://alltest.rizhiyi.com/search/?query=*&time_range=-2d%2Cnow&order=desc&size=20&page=1&sourcegroup=all&type=timeline&_t=1422088066859&title=%E9%BB%98%E8%AE%A4&index=0 ','apache.referer_domain':'apache.referer_domain：alltest.rizhiyi.com ','apache.request_path':'apache.request_path：/api/v0/search/fields/ ','apache.request_query':'apache.request_query：field=tag&filters=&order=desc&page=1&query=*&size=50&sourcegroup=all&sourcegroupCn=%E6%89%80%E6%9C%89%E6%97%A5%E5%BF%97&time_range=-2d,now&type=fields ','apache.resp_len':'apache.resp_len：363 '}                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              |
      | auto_test_codec                       | {"other.name":"other.name：aaa ","other.val":"other.val：111 "}                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       |
#      | auto_test_dictionary                  | {'json.Category':'json.Category： ','json.ComputerName':'json.ComputerName：WIN-999OGBVAHMI ','json.EventCode':'json.EventCode：7036 ','json.EventIdentifier':'json.EventIdentifier：1073748860 ','json.EventType':'json.EventType：3 ','json.Logfile':'json.Logfile：System ','json.Message':'json.Message：Application Experience 服务处于 正在运行 状态。 ','json.RecordNumber':'json.RecordNumber：108343 ','json.SourceName':'json.SourceName：Service Control Manager ','json.TimeGenerated':'json.TimeGenerated：2015-01-04T20:45:09+08:00 ','json.level':'json.level：2 ','json.source':'json.source：sys '}                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       |
#      | auto_test_rename                      | {'other.a.b.h':'other.a.b.h：d ','other.a.e.h':'other.a.e.h：g '}                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     |
#      | redirect_zhu AND appname:redirect_zhu | {"other.key":"other.key：value "}                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    |


  Scenario Outline: RZY-3418:在搜索页验证自定义配置高级算子
    When open the "splSearch.SearchPage" page for uri "/search/"
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I set the parameter "SearchInput" with value "<spl>"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    Then I move the mouse pointer to the "Result"
    And I click the "RightIcon" button
    Then I will see the spl search result "<searchResult>"

    Examples:
      | spl             | searchResult                                                                                              |
      | appname:dissect | {"other.id":"other.id：123 ","other.domain":"other.domain：rizhiyi.com ","other.url":"other.url：index.do "} |
      | appname:script  | {"other.result.count":"other.result.count：5664 ","other.result.time":"other.result.time：1516189 "}        |
      | appname:base64  | {"other.code":"other.code：hello base64 "}                                                                 |
      | appname:unicode | {"other.rr":"other.rr：PartyBasicInfoService_客户基本信息服务 "}                                                   |

@all @smoke @configs
Feature: 字段提取规则列表

  Background:
    Given open the "configs.ListPage" page for uri "/configs/"
    And I click the "CreateButton" button
    Then I will see the "configs.CreatePage" page
    When I set the parameter "Name" with value "AutoTest"
    And I set the parameter "Logtype" with value "test"
    Then I choose the "default_ParserRule" from the "Group"

  Scenario Outline: 正则解析
    When I set the parameter "LogSample" with value "<logSample>"
    And I choose the "<parseRule>" from the "ParseRule"
    And I choose the "<sourceField>" from the "SourceField"
    And I set the parameter "Regex" with value "<regex>"
    And I click the "ParseButton" button
    And I will see the success message "验证完成"
    Then I will see the element "<key>" name is "<value>"

    Examples:
      | logSample | parseRule | sourceField | regex | key | value |
#      | 2014-05-14 23:24:47 15752 [Note] InnoDB: 128 rollback segment(s) are active | 正则解析      | raw_message | (?<timestamp>\\S+ \\S+) (?<pid>\\S+) \\[(?<loglevel>\\S+)\\] (?<message>.*) | Value1,Value2,Value3,Value4 | "Note","InnoDB: 128 rollback segment(s) are active","15752","2014-05-14 23:24:47" |

  Scenario Outline: KeyValue分解
    When I set the parameter "LogSample" with value "<logSample>"
    And I choose the "KeyValue分解" from the "ParseRule"
    And I choose the "<sourceField>" from the "SourceField"
    And I set the parameter "FieldSeparator" with value "&"
    And I set the parameter "KVSeparator" with value "="
    And I set the parameter "KeepKey" with value "<keepKey>"
    And I set the parameter "DumpKey" with value "<dumpKey>"
    And I click the "ParseButton" button
    And I will see the success message "验证完成"
    Then I will see the element "<key>" name is "<value>"

    Examples:
      | logSample | sourceField | keepKey | dumpKey | key | value |
#      | field=tag&filters=&order=desc&page=1&query=*&size=50&sourcegroup=all&sourcegroupCn=%E6%89%80%E6%9C%89%E6%97%A5%E5%BF%97&time_range=-2d,now&type=fields | raw_message |         |         | Value1,Value2,Value3,Value4,Value5,Value6,Value7,Value9 | "tag","desc","1","*","50","all","%E6%89%80%E6%9C%89%E6%97%A5%E5%BF%97","fields" |
#      | field=tag&filters=&order=desc&page=1&query=*&size=50&sourcegroup=all&sourcegroupCn=%E6%89%80%E6%9C%89%E6%97%A5%E5%BF%97&time_range=-2d,now&type=fields | raw_message |         | order   | Value1,Value2,Value3,Value4,Value5,Value6,Value8        | "tag","1","*","50","all","%E6%89%80%E6%9C%89%E6%97%A5%E5%BF%97","fields"        |
#      | field=tag&filters=&order=desc&page=1&query=*&size=50&sourcegroup=all&sourcegroupCn=%E6%89%80%E6%9C%89%E6%97%A5%E5%BF%97&time_range=-2d,now&type=fields | raw_message | order   |         | Value1                                                  | "desc"                                                                          |

  Scenario Outline: 正则解析+KeyValue正则匹配
    When I set the parameter "LogSample" with value "<logSample>"
    And I choose the "<parseRule>" from the "ParseRule"
    And I wait for "2000" millsecond
    And I choose the "<sourceField>" from the "SourceField"
    And I set the parameter "Regex" with value "<regex>"
    And I click the "ParseButton" button
    And I will see the success message "验证完成"
    Then I will see the element "<key>" name is "<value>"
    And I click the "ContinueButton" button
    And I choose the "<parseRule1>" from the "ParseRule"
    And I wait for "2000" millsecond
    And I choose the "<sourceField2>" from the "SourceFieldLabel2"
    And I set the parameter "KeyRegex" with value "<keyRegex>"
    And I set the parameter "ValueRegex" with value "<valueRegex>"
    And I set the parameter "KVSeparator" with value "<kvSeparator>"
    And I click the "ParseButton" button
    And I will see the success message "验证完成"
    Then I will see the element "<key1>" name is "<value1>"

    Examples:
      | logSample | parseRule | sourceField | regex | key | value | parseRule1 | sourceField2 | keyRegex | valueRegex | kvSeparator | key1 | value1 |
#      | <190>May 18 11:20:10 2016 HLJ_S12508_1_FW %%10FILTER/6/ZONE_DP_FLT_EXECUTION_TCP_LOG(l): -DEV_TYPE=SECPATH-PN=210231A0H6010C000002; srcZoneName(1034)=serveruntrust;destZoneName(1035)=servertrust;rule_ID(1070)=90;policyActType(1071)=denied;protType(1001)=TCP(6);srcIPAddr(1017)=10.167.77.99;destIPAddr(1019)=10.166.5.70;srcPortNum(1018)=49362;destPortNum(1020)=1521;beginTime_e(1013)=05182016112009;endTime_e(1014)=05182016112009; | 正则解析      | raw_message | <%{NOTSPACE:id}>(?<timestamp>%{NOTSPACE}\s+%{NOTSPACE}\s+%{NOTSPACE}\s+%{NOTSPACE}\s+)%{NOTSPACE:host} \%\%(?<vendor>[^/]*)/(?<severity>[^/]*)/(?<MNEMONIC>[^:]*): -DEV_TYPE=SECPATH-PN=210231A0H6010C000002; (?<message>.*) | Value1, Value2,Value3,Value4,Value5,Value6,Value7 | "ZONE_DP_FLT_EXECUTION_TCP_LOG(l)","HLJ_S12508_1_FW","190","srcZoneName(1034)=serveruntrust;destZoneName(1035)=servertrust;rule_ID(1070)=90;policyActType(1071)=denied;protType(1001)=TCP(6);srcIPAddr(1017)=10.167.77.99;destIPAddr(1019)=10.166.5.70;srcPortNum(1018)=49362;destPortNum(1020)=1521;beginTime_e(1013)=05182016112009;endTime_e(1014)=05182016112009;","6","May 18 11:20:10 2016 ","10FILTER" | KeyValue正则匹配 | message      | [^=;]+   | [^=;]+     | \(\d+\)=    | Value1,Value2,Value3,Value4,Value5,Value6,Value7,Value8,Value9,Value10,Value11,Value12,Value13,Value14,Value15,Value16 | "ZONE_DP_FLT_EXECUTION_TCP_LOG(l)","HLJ_S12508_1_FW","190","05182016112009","10.166.5.70","1521","servertrust","05182016112009","denied","TCP(6)","90","10.167.77.99","49362","serveruntrust","6","May 18 11:20:10 2016 ","10FILTER" |

  Scenario Outline: 正则解析+数值型字段转换
    When I set the parameter "LogSample" with value "<logSample>"
    And I choose the "正则解析" from the "ParseRule"
    And I wait for "2000" millsecond
    And I choose the "raw_message" from the "SourceField"
    And I wait for "2000" millsecond
    And I set the parameter "Regex" with value "<regex>"
    And I click the "ParseButton" button
    And I will see the success message "验证完成"
    Then I will see the element "<key>" name is "<value>"
    And I click the "ContinueButton" button
    And I choose the "数值型字段转换" from the "ParseRule"
    And I choose the "id" from the "SourceFieldLabel2"
    And I choose the "Decimal" from the "<decimal>"
    And I click the "ParseButton" button
    And I will see the success message "验证完成"
    Then I will see the element "<key1>" name is "<value1>"

    Examples:
      | logSample | regex | key | value | decimal | key1 | value1 |
#      | <190>May 18 11:20:10 2016 HLJ_S12508_1_FW %%10FILTER/6/ZONE_DP_FLT_EXECUTION_TCP_LOG(l): -DEV_TYPE=SECPATH-PN=210231A0H6010C000002; srcZoneName(1034)=serveruntrust;destZoneName(1035)=servertrust;rule_ID(1070)=90;policyActType(1071)=denied;protType(1001)=TCP(6);srcIPAddr(1017)=10.167.77.99;destIPAddr(1019)=10.166.5.70;srcPortNum(1018)=49362;destPortNum(1020)=1521;beginTime_e(1013)=05182016112009;endTime_e(1014)=05182016112009; | <%{NOTSPACE:id}>(?<timestamp>%{NOTSPACE}\s+%{NOTSPACE}\s+%{NOTSPACE}\s+%{NOTSPACE}\s+)%{NOTSPACE:host} \%\%(?<vendor>[^/]*)/(?<severity>[^/]*)/(?<MNEMONIC>[^:]*): -DEV_TYPE=SECPATH-PN=210231A0H6010C000002; (?<message>.*) | Value1, Value2,Value3,Value4,Value5,Value6,Value7 | "ZONE_DP_FLT_EXECUTION_TCP_LOG(l)","HLJ_S12508_1_FW","190","srcZoneName(1034)=serveruntrust;destZoneName(1035)=servertrust;rule_ID(1070)=90;policyActType(1071)=denied;protType(1001)=TCP(6);srcIPAddr(1017)=10.167.77.99;destIPAddr(1019)=10.166.5.70;srcPortNum(1018)=49362;destPortNum(1020)=1521;beginTime_e(1013)=05182016112009;endTime_e(1014)=05182016112009;","6","May 18 11:20:10 2016 ","10FILTER" | 2       | Value3 | "190"  |
#      | <190>May 18 11:20:10 2016 HLJ_S12508_1_FW %%10FILTER/6/ZONE_DP_FLT_EXECUTION_TCP_LOG(l): -DEV_TYPE=SECPATH-PN=210231A0H6010C000002; srcZoneName(1034)=serveruntrust;destZoneName(1035)=servertrust;rule_ID(1070)=90;policyActType(1071)=denied;protType(1001)=TCP(6);srcIPAddr(1017)=10.167.77.99;destIPAddr(1019)=10.166.5.70;srcPortNum(1018)=49362;destPortNum(1020)=1521;beginTime_e(1013)=05182016112009;endTime_e(1014)=05182016112009; | <%{NOTSPACE:id}>(?<timestamp>%{NOTSPACE}\s+%{NOTSPACE}\s+%{NOTSPACE}\s+%{NOTSPACE}\s+)%{NOTSPACE:host} \%\%(?<vendor>[^/]*)/(?<severity>[^/]*)/(?<MNEMONIC>[^:]*): -DEV_TYPE=SECPATH-PN=210231A0H6010C000002; (?<message>.*) | Value1, Value2,Value3,Value4,Value5,Value6,Value7 | "ZONE_DP_FLT_EXECUTION_TCP_LOG(l)","HLJ_S12508_1_FW","190","srcZoneName(1034)=serveruntrust;destZoneName(1035)=servertrust;rule_ID(1070)=90;policyActType(1071)=denied;protType(1001)=TCP(6);srcIPAddr(1017)=10.167.77.99;destIPAddr(1019)=10.166.5.70;srcPortNum(1018)=49362;destPortNum(1020)=1521;beginTime_e(1013)=05182016112009;endTime_e(1014)=05182016112009;","6","May 18 11:20:10 2016 ","10FILTER" | 8       | Value3 | "190"  |
#      | <190>May 18 11:20:10 2016 HLJ_S12508_1_FW %%10FILTER/6/ZONE_DP_FLT_EXECUTION_TCP_LOG(l): -DEV_TYPE=SECPATH-PN=210231A0H6010C000002; srcZoneName(1034)=serveruntrust;destZoneName(1035)=servertrust;rule_ID(1070)=90;policyActType(1071)=denied;protType(1001)=TCP(6);srcIPAddr(1017)=10.167.77.99;destIPAddr(1019)=10.166.5.70;srcPortNum(1018)=49362;destPortNum(1020)=1521;beginTime_e(1013)=05182016112009;endTime_e(1014)=05182016112009; | <%{NOTSPACE:id}>(?<timestamp>%{NOTSPACE}\s+%{NOTSPACE}\s+%{NOTSPACE}\s+%{NOTSPACE}\s+)%{NOTSPACE:host} \%\%(?<vendor>[^/]*)/(?<severity>[^/]*)/(?<MNEMONIC>[^:]*): -DEV_TYPE=SECPATH-PN=210231A0H6010C000002; (?<message>.*) | Value1, Value2,Value3,Value4,Value5,Value6,Value7 | "ZONE_DP_FLT_EXECUTION_TCP_LOG(l)","HLJ_S12508_1_FW","190","srcZoneName(1034)=serveruntrust;destZoneName(1035)=servertrust;rule_ID(1070)=90;policyActType(1071)=denied;protType(1001)=TCP(6);srcIPAddr(1017)=10.167.77.99;destIPAddr(1019)=10.166.5.70;srcPortNum(1018)=49362;destPortNum(1020)=1521;beginTime_e(1013)=05182016112009;endTime_e(1014)=05182016112009;","6","May 18 11:20:10 2016 ","10FILTER" | 10      | Value3 | 190    |
#      | <190>May 18 11:20:10 2016 HLJ_S12508_1_FW %%10FILTER/6/ZONE_DP_FLT_EXECUTION_TCP_LOG(l): -DEV_TYPE=SECPATH-PN=210231A0H6010C000002; srcZoneName(1034)=serveruntrust;destZoneName(1035)=servertrust;rule_ID(1070)=90;policyActType(1071)=denied;protType(1001)=TCP(6);srcIPAddr(1017)=10.167.77.99;destIPAddr(1019)=10.166.5.70;srcPortNum(1018)=49362;destPortNum(1020)=1521;beginTime_e(1013)=05182016112009;endTime_e(1014)=05182016112009; | <%{NOTSPACE:id}>(?<timestamp>%{NOTSPACE}\s+%{NOTSPACE}\s+%{NOTSPACE}\s+%{NOTSPACE}\s+)%{NOTSPACE:host} \%\%(?<vendor>[^/]*)/(?<severity>[^/]*)/(?<MNEMONIC>[^:]*): -DEV_TYPE=SECPATH-PN=210231A0H6010C000002; (?<message>.*) | Value1, Value2,Value3,Value4,Value5,Value6,Value7 | "ZONE_DP_FLT_EXECUTION_TCP_LOG(l)","HLJ_S12508_1_FW","190","srcZoneName(1034)=serveruntrust;destZoneName(1035)=servertrust;rule_ID(1070)=90;policyActType(1071)=denied;protType(1001)=TCP(6);srcIPAddr(1017)=10.167.77.99;destIPAddr(1019)=10.166.5.70;srcPortNum(1018)=49362;destPortNum(1020)=1521;beginTime_e(1013)=05182016112009;endTime_e(1014)=05182016112009;","6","May 18 11:20:10 2016 ","10FILTER" | 16      | Value3 | 400    |

  Scenario Outline: 正则解析+URL解析/user agent解析/CSV解析/syslog_pri解析/ip格式转换
    When I set the parameter "LogSample" with value "<logSample>"
    And I choose the "正则解析" from the "ParseRule"
    And I wait for "2000" millsecond
    And I choose the "raw_message" from the "SourceField"
    And I wait for "2000" millsecond
    And I set the parameter "Regex" with value "<regex>"
    And I click the "ParseButton" button
    And I will see the success message "验证完成"
    Then I will see the element "<key>" name is "<value>"
    And I click the "ContinueButton" button
    And I choose the "<parseRule>" from the "ParseRule"
    And I choose the "<sourceField>" from the "SourceFieldLabel2"
    And I set the parameter "<inputElement>" with value "<timeFormat>"
    And I wait for "SuccessMessage" will be invisible
    And I click the "ParseButton" button
    And I will see the success message "验证完成"
    Then I will see the element "<key1>" name is "<value1>"

    Examples:
      | logSample | regex | key | value | parseRule | sourceField | inputElement | timeFormat | key1 | value1 |
#      | 192.168.1.139 - - [24/Jan/2015:17:03:49 +0800] "GET /api/v0/search/fields/?field=tag&filters=&order=desc&page=1&query=*&size=50&sourcegroup=all&sourcegroupCn=%E6%89%80%E6%9C%89%E6%97%A5%E5%BF%97&time_range=-2d,now&type=fields HTTP/1.1" 200 363 "http://alltest.rizhiyi.com/search/?query=*&time_range=-2d%2Cnow&order=desc&size=20&page=1&sourcegroup=all&type=timeline&_t=1422088066859&title=%E9%BB%98%E8%AE%A4&index=0" "Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:35.0) Gecko/20100101 Firefox/35.0" | %{ApcClientIP} %{ApcIdent} %{ApcUser} %{ApcTimestamp} %{ApcRequest} %{ApcStatus} %{ApcRespLen} %{ApcReferer} %{ApcUa} | Value1, Value2,Value3,Value4,Value5,Value6,Value7,Value8,Value9,Value10,Value11 | "192.168.1.139","GET","http://alltest.rizhiyi.com/search/?query=*&time_range=-2d%2Cnow&order=desc&size=20&page=1&sourcegroup=all&type=timeline&_t=1422088066859&title=%E9%BB%98%E8%AE%A4&index=0","alltest.rizhiyi.com","/api/v0/search/fields/","field=tag&filters=&order=desc&page=1&query=*&size=50&sourcegroup=all&sourcegroupCn=%E6%89%80%E6%9C%89%E6%97%A5%E5%BF%97&time_range=-2d,now&type=fields",363,200,"24/Jan/2015:17:03:49 +0800","Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:35.0) Gecko/20100101 Firefox/35.0","1.1" | URL解析        | request_query |              |                        | Value6                                                                 | "field=tag&filters=&order=desc&page=1&query=*&size=50&sourcegroup=all&sourcegroupCn=所有日志&time_range=-2d,now&type=fields"                                                                            |
#      | 192.168.1.139 - - [24/Jan/2015:17:03:49 +0800] "GET /api/v0/search/fields/?field=tag&filters=&order=desc&page=1&query=*&size=50&sourcegroup=all&sourcegroupCn=%E6%89%80%E6%9C%89%E6%97%A5%E5%BF%97&time_range=-2d,now&type=fields HTTP/1.1" 200 363 "http://alltest.rizhiyi.com/search/?query=*&time_range=-2d%2Cnow&order=desc&size=20&page=1&sourcegroup=all&type=timeline&_t=1422088066859&title=%E9%BB%98%E8%AE%A4&index=0" "Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:35.0) Gecko/20100101 Firefox/35.0" | %{ApcClientIP} %{ApcIdent} %{ApcUser} %{ApcTimestamp} %{ApcRequest} %{ApcStatus} %{ApcRespLen} %{ApcReferer} %{ApcUa} | Value1, Value2,Value3,Value4,Value5,Value6,Value7,Value8,Value9,Value10,Value11 | "192.168.1.139","GET","http://alltest.rizhiyi.com/search/?query=*&time_range=-2d%2Cnow&order=desc&size=20&page=1&sourcegroup=all&type=timeline&_t=1422088066859&title=%E9%BB%98%E8%AE%A4&index=0","alltest.rizhiyi.com","/api/v0/search/fields/","field=tag&filters=&order=desc&page=1&query=*&size=50&sourcegroup=all&sourcegroupCn=%E6%89%80%E6%9C%89%E6%97%A5%E5%BF%97&time_range=-2d,now&type=fields",363,200,"24/Jan/2015:17:03:49 +0800","Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:35.0) Gecko/20100101 Firefox/35.0","1.1" | user agent解析 | ua            |              |                        | Value10,Value11,Value12,Value13                                        | "Firefox","Firefox 35.0","Mac OS X","Mac OS X 10.10"                                                                                                                                                |
#      | 192.168.1.139 - - [24/Jan/2015:17:03:49 +0800] "GET /api/v0/search/fields/?field=tag&filters=&order=desc&page=1&query=*&size=50&sourcegroup=all&sourcegroupCn=%E6%89%80%E6%9C%89%E6%97%A5%E5%BF%97&time_range=-2d,now&type=fields HTTP/1.1" 200 363 "http://alltest.rizhiyi.com/search/?query=*&time_range=-2d%2Cnow&order=desc&size=20&page=1&sourcegroup=all&type=timeline&_t=1422088066859&title=%E9%BB%98%E8%AE%A4&index=0" "Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:35.0) Gecko/20100101 Firefox/35.0" | %{ApcClientIP} %{ApcIdent} %{ApcUser} %{ApcTimestamp} %{ApcRequest} %{ApcStatus} %{ApcRespLen} %{ApcReferer} %{ApcUa} | Value1, Value2,Value3,Value4,Value5,Value6,Value7,Value8,Value9,Value10,Value11 | "192.168.1.139","GET","http://alltest.rizhiyi.com/search/?query=*&time_range=-2d%2Cnow&order=desc&size=20&page=1&sourcegroup=all&type=timeline&_t=1422088066859&title=%E9%BB%98%E8%AE%A4&index=0","alltest.rizhiyi.com","/api/v0/search/fields/","field=tag&filters=&order=desc&page=1&query=*&size=50&sourcegroup=all&sourcegroupCn=%E6%89%80%E6%9C%89%E6%97%A5%E5%BF%97&time_range=-2d,now&type=fields",363,200,"24/Jan/2015:17:03:49 +0800","Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:35.0) Gecko/20100101 Firefox/35.0","1.1" | 时间戳识别        | timestamp     | TimeFormat   | dd/MMM/yyyy:HH:mm:ss Z | Value9                                                                 | "2015/01/24 17:03:49.0"                                                                                                                                                                             |
#      | <134> Portinfo(Port,State,rx Kpps,tx Kpps,rx Mbps,tx Mbps): T1/1 down 0 0 0 0  \| T1/2 down 0 0 0 0 \| F2/1 up 0 0 0 0 \| F2/2 up 0 0 0 0 \| F2/3 down 0 0 0 0 \| F2/4 down 0 0 0 0 \| F2/5 down 0 0 0 0 \| F2/6 down 0 0 0 0 \| F2/7 down 0 0 0 0 \| F2/8 down 0 0 0 0 \|                                                                                                                                                                                                                                           | .*?:\s+(?<portinfo>.*)                                                                                                | Value1                                                                          | "T1/1 down 0 0 0 0 \| T1/2 down 0 0 0 0 \| F2/1 up 0 0 0 0 \| F2/2 up 0 0 0 0 \| F2/3 down 0 0 0 0 \| F2/4 down 0 0 0 0 \| F2/5 down 0 0 0 0 \| F2/6 down 0 0 0 0 \| F2/7 down 0 0 0 0 \| F2/8 down 0 0 0 0 \|"                                                                                                                                                                                                                                                                                                                           | CSV解析        | portinfo      | Separate     | \s*\\\|\s*             | Value1,Value2,Value3,Value4,Value5,Value6,Value7,Value8,Value9,Value10 | "T1/1 down 0 0 0 0","T1/2 down 0 0 0 0","F2/1 up 0 0 0 0","F2/2 up 0 0 0 0","F2/3 down 0 0 0 0","F2/4 down 0 0 0 0","F2/5 down 0 0 0 0","F2/6 down 0 0 0 0","F2/7 down 0 0 0 0","F2/8 down 0 0 0 0" |
#      | <30>Oct 9 22:33:20 hlfedora auditd[1787]: The audit daemon is exiting.                                                                                                                                                                                                                                                                                                                                                                                                                                               | <(?<pri>\d+)>.*                                                                                                       | Value1                                                                          | "30"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      | syslog_pri解析 | pri           |              |                        | Value1,Value2,Value3                                                   | "daemon","30","info"                                                                                                                                                                                |
#      | 3651919938 | (?<ip>.*) | Value1 | "3651919938" | ip格式转换    | ip          |              |            | Value1 | "217.171.224.66" |

  Scenario Outline: json解析
    When I set the parameter "LogSample" with value "{"Name": "John Smith ", "Age": 23, "Employed": true, "Address": {"Street": "324 Chrome St", "City": "Portland, New York,Los Angeles ", "Country": "United States"}}"
    And I choose the "Json解析" from the "ParseRule"
    And I choose the "raw_message" from the "SourceField"
    And I set the parameter "<element>" with value "<path>"
    And I click the "ParseButton" button
    And I will see the success message "验证完成"
    Then I will see the element "<key>" name is "<value>"

    Examples:
      | element | path | key | value |
#      |           |      | Value1,Value2,Value3,Value4,Value5,Value6 | "Portland, New York,Los Angeles ","United States","324 Chrome St",23,true,"John Smith " |
#      | PathInput | Age  | Number1                                   | 23                                                                                      |

  Scenario Outline: CSV解析
    When I set the parameter "LogSample" with value "192.168.1.200,xmxm,rzy,13800000000"
    And I choose the "CSV解析" from the "ParseRule"
    And I choose the "raw_message" from the "SourceField"
    And I set the parameter "Separate" with value "<separate>"
    And I set the parameter "FieldList" with value "<fieldList>"
    And I click the "ParseButton" button
    And I will see the success message "验证完成"
    Then I will see the element "<key>" name is "<value>"

    Examples:
      | separate | fieldList | key | value |
#      | ,        | 1,2,3,4,5 | Value1,Value2,Value3,Value4 | "192.168.1.200","xmxm","rzy","13800000000" |

  Scenario Outline: 正则解析+geo解析
    When I set the parameter "LogSample" with value "192.168.1.139 - - [24/Jan/2015:17:03:49 +0800] "GET /api/v0/search/fields/?field=tag&filters=&order=desc&page=1&query=*&size=50&sourcegroup=all&sourcegroupCn=%E6%89%80%E6%9C%89%E6%97%A5%E5%BF%97&time_range=-2d,now&type=fields HTTP/1.1" 200 363 "http://alltest.rizhiyi.com/search/?query=*&time_range=-2d%2Cnow&order=desc&size=20&page=1&sourcegroup=all&type=timeline&_t=1422088066859&title=%E9%BB%98%E8%AE%A4&index=0" "Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:35.0) Gecko/20100101 Firefox/35.0""
    And I choose the "正则解析" from the "ParseRule"
    And I wait for "2000" millsecond
    And I choose the "raw_message" from the "SourceField"
    And I wait for "2000" millsecond
    And I set the parameter "Regex" with value "%{ApcClientIP} %{ApcIdent} %{ApcUser} %{ApcTimestamp} %{ApcRequest} %{ApcStatus} %{ApcRespLen} %{ApcReferer} %{ApcUa}"
    And I click the "ParseButton" button
    And I will see the success message "验证完成"
    Then I will see the element value in json "<result>"
    And I click the "ContinueButton" button
    And I choose the "<parseRule>" from the "ParseRule"
    And I choose the "<sourceField>" from the "SourceFieldLabel2"
    And I click the "<parseField>" button
    And I click the "ParseButton" button
    And I will see the success message "验证完成"
    Then I will see the element value in json "<result1>"

    Examples:
      | result | parseRule | sourceField | parseField | result1 |
#      | {'Value1':'"192.168.1.139"','Value2':'"GET"','Value3':'"http://alltest.rizhiyi.com/search/?query=*&time_range=-2d%2Cnow&order=desc&size=20&page=1&sourcegroup=all&type=timeline&_t=1422088066859&title=%E9%BB%98%E8%AE%A4&index=0"','Value4':'"alltest.rizhiyi.com"','Value5':'"/api/v0/search/fields/"','Value6':'"field=tag&filters=&order=desc&page=1&query=*&size=50&sourcegroup=all&sourcegroupCn=%E6%89%80%E6%9C%89%E6%97%A5%E5%BF%97&time_range=-2d,now&type=fields"','Number1':'363','Number2':'200','Value7':'"24/Jan/2015:17:03:49 +0800"','Value8':'"Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:35.0) Gecko/20100101 Firefox/35.0"','Value9':'"1.1"'} | geo解析     | clientip    | Checkbox   | {'Value1':'"192.168.1.139"','Value2':'"private"','Value3':'"private"','Value4':'"private"','Value5':'"private"','Value6':'"GET"','Value7':'"http://alltest.rizhiyi.com/search/?query=*&time_range=-2d%2Cnow&order=desc&size=20&page=1&sourcegroup=all&type=timeline&_t=1422088066859&title=%E9%BB%98%E8%AE%A4&index=0"','Value8':'"alltest.rizhiyi.com"','Value9':'"/api/v0/search/fields/"','Value10':'"field=tag&filters=&order=desc&page=1&query=*&size=50&sourcegroup=all&sourcegroupCn=%E6%89%80%E6%9C%89%E6%97%A5%E5%BF%97&time_range=-2d,now&type=fields"','Number1':'363','Number2':'200','Value11':'"24/Jan/2015:17:03:49 +0800"','Value12':'"Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:35.0) Gecko/20100101 Firefox/35.0"','Value13':'"1.1"'} |
#      | {'Value1':'"192.168.1.139"','Value2':'"GET"','Value3':'"http://alltest.rizhiyi.com/search/?query=*&time_range=-2d%2Cnow&order=desc&size=20&page=1&sourcegroup=all&type=timeline&_t=1422088066859&title=%E9%BB%98%E8%AE%A4&index=0"','Value4':'"alltest.rizhiyi.com"','Value5':'"/api/v0/search/fields/"','Value6':'"field=tag&filters=&order=desc&page=1&query=*&size=50&sourcegroup=all&sourcegroupCn=%E6%89%80%E6%9C%89%E6%97%A5%E5%BF%97&time_range=-2d,now&type=fields"','Number1':'363','Number2':'200','Value7':'"24/Jan/2015:17:03:49 +0800"','Value8':'"Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:35.0) Gecko/20100101 Firefox/35.0"','Value9':'"1.1"'} | geo解析     | clientip    |            | {'Value1':'"private"','Value2':'"private"','Value3':'"192.168.1.139"','Value4':'"private"','Value5':'"private"','Value6':'"GET"','Value7':'"http://alltest.rizhiyi.com/search/?query=*&time_range=-2d%2Cnow&order=desc&size=20&page=1&sourcegroup=all&type=timeline&_t=1422088066859&title=%E9%BB%98%E8%AE%A4&index=0"','Value8':'"alltest.rizhiyi.com"','Value9':'"/api/v0/search/fields/"','Value10':'"field=tag&filters=&order=desc&page=1&query=*&size=50&sourcegroup=all&sourcegroupCn=%E6%89%80%E6%9C%89%E6%97%A5%E5%BF%97&time_range=-2d,now&type=fields"','Number1':'363','Number2':'200','Value11':'"24/Jan/2015:17:03:49 +0800"','Value12':'"Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:35.0) Gecko/20100101 Firefox/35.0"','Value13':'"1.1"'} |

  Scenario Outline: 格式化处理
    When I set the parameter "LogSample" with value "192.168.1.139 - - [24/Jan/2015:17:03:49 +0800] "GET /api/v0/search/fields/?field=tag&filters=&order=desc&page=1&query=*&size=50&sourcegroup=all&sourcegroupCn=%E6%89%80%E6%9C%89%E6%97%A5%E5%BF%97&time_range=-2d,now&type=fields HTTP/1.1" 200 363 "http://alltest.rizhiyi.com/search/?query=*&time_range=-2d%2Cnow&order=desc&size=20&page=1&sourcegroup=all&type=timeline&_t=1422088066859&title=%E9%BB%98%E8%AE%A4&index=0" "Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:35.0) Gecko/20100101 Firefox/35.0""
    And I set the parameter "Source" with value "/var/log/20180821/website"
    And I choose the "正则解析" from the "ParseRule"
    And I choose the "raw_message" from the "SourceField"
    And I set the parameter "Regex" with value "(?<clientip>\S+) - - \[\d+/\w+/\d+:(?<time>\S+) \+0800\](.*)"
    And I click the "ParseButton" button
    And I will see the success message "验证完成"
    Then I will see the element "<key>" name is "<value>"
    And I click the "ContinueButton" button
    And I choose the "正则解析" from the "ParseRule"
    And I choose the "@source" from the "SourceFieldLabel2"
    And I set the parameter "Regex2" with value "/var/log/(?<date>\d{8})/website"
    And I click the "ParseButton" button
    And I will see the success message "验证完成"
    Then I will see the element "<key1>" name is "<value1>"
    And I click the "ContinueButton" button
    And I choose the "格式化处理" from the "ParseRule"
    And I choose the "date,time" from the "SourceFieldLabel3"
    And I set the parameter "FormatRule" with value "$1$2"
    And I set the parameter "TargetField" with value "timestamp"
    And I click the "ParseButton" button
    And I will see the success message "验证完成"
    Then I will see the element "<key2>" name is "<value2>"

    Examples:
      | key | value | key1 | value1 | key2 | value2 |
#      | Value1,Value2 | "192.168.1.139","17:03:49" | Value1,Value2,Value3 | "192.168.1.139","20180821","17:03:49" | Value1,Value2,Value3,Value4 | "192.168.1.139","20180821","17:03:49","2018082117:03:49" |

  Scenario Outline: 删除字段
    When I set the parameter "LogSample" with value "192.168.1.139 - - [24/Jan/2015:17:03:49 +0800] "GET /api/v0/search/fields/?field=tag&filters=&order=desc&page=1&query=*&size=50&sourcegroup=all&sourcegroupCn=%E6%89%80%E6%9C%89%E6%97%A5%E5%BF%97&time_range=-2d,now&type=fields HTTP/1.1" 200 363 "http://alltest.rizhiyi.com/search/?query=*&time_range=-2d%2Cnow&order=desc&size=20&page=1&sourcegroup=all&type=timeline&_t=1422088066859&title=%E9%BB%98%E8%AE%A4&index=0" "Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:35.0) Gecko/20100101 Firefox/35.0""
    And I set the parameter "Source" with value "/var/log/20180821/website"
    And I choose the "正则解析" from the "ParseRule"
    And I choose the "raw_message" from the "SourceField"
    And I set the parameter "Regex" with value "(?<clientip>\S+) - - \[\d+/\w+/\d+:(?<time>\S+) \+0800\](.*)"
    And I click the "ParseButton" button
    And I will see the success message "验证完成"
    Then I will see the element "<key>" name is "<value>"
    And I click the "ContinueButton" button
    And I choose the "正则解析" from the "ParseRule"
    And I choose the "@source" from the "SourceFieldLabel2"
    And I set the parameter "Regex2" with value "/var/log/(?<date>\d{8})/website"
    And I click the "ParseButton" button
    And I will see the success message "验证完成"
    Then I will see the element "<key1>" name is "<value1>"
    And I click the "ContinueButton" button
    And I choose the "格式化处理" from the "ParseRule"
    And I choose the "date,time" from the "SourceFieldLabel3"
    And I set the parameter "FormatRule" with value "$1$2"
    And I set the parameter "TargetField" with value "timestamp"
    And I click the "ParseButton" button
    And I will see the success message "验证完成"
    Then I will see the element "<key2>" name is "<value2>"
    And I click the "ContinueButton" button
    And I choose the "删除字段" from the "ParseRule"
    And I choose the "date" from the "SourceFieldLabel4"
    And I click the "ParseButton" button
    And I will see the success message "验证完成"
    Then I will see the element "<key3>" name is "<value3>"

    Examples:
      | key | value | key1 | value1 | key2 | value2 | key3 | value3 |
#      | Value1,Value2 | "192.168.1.139","17:03:49" | Value1,Value2,Value3 | "192.168.1.139","20180821","17:03:49" | Value1,Value2,Value3,Value4 | "192.168.1.139","20180821","17:03:49","2018082117:03:49" | Value1,Value2,Value3 | "192.168.1.139","17:03:49","2018082117:03:49" |

  Scenario Outline: 内容替换
    When I set the parameter "LogSample" with value "123abc456qwe"
    And I choose the "内容替换" from the "ParseRule"
    And I choose the "raw_message" from the "SourceField"
    And I set the parameter "Regex" with value "(\d+)[a-z]+"
    And I set the parameter "ReplaceContent" with value "<replaceContent>"
    And I click the "<replaceFirst>" button
    And I click the "ParseButton" button
    And I will see the success message "验证完成"
#    Then I will see the element "<key>" name is "<value>"
    Then I will see the element value in json "<result>"

    Examples:
      | replaceContent | replaceFirst | result                |
      | $1             |              | {'Value1':'"123456"'} |



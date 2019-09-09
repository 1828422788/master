@configsSmoke
Feature: 字段提取规则列表

  Background:
    Given open the "configs.ListPage" page for uri "/configs/"
    And I click the "CreateButton" button
    Then I will see the "configs.CreatePage" page
    When I set the parameter "Name" with value "AutoTest"
    And I set the parameter "Logtype" with value "test"

  @first
  Scenario Outline: RZY-1530:正则解析规则
    When I set the parameter "LogSample" with value "192.168.1.139 - - [24/Jan/2015:17:03:49 +0800] "GET /api/v0/search/fields/?field=tag&filters=&order=desc&page=1&query=*&size=50&sourcegroup=all&sourcegroupCn=%E6%89%80%E6%9C%89%E6%97%A5%E5%BF%97&time_range=-2d,now&type=fields HTTP/1.1" 200 363 "http://alltest.rizhiyi.com/search/?query=*&time_range=-2d%2Cnow&order=desc&size=20&page=1&sourcegroup=all&type=timeline&_t=1422088066859&title=%E9%BB%98%E8%AE%A4&index=0" "Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:35.0) Gecko/20100101 Firefox/35.0""
    And I choose the "正则解析" from the "ParseRule"
    And I alter the element "ExtractSample" class to "yw-extract-sample yw-extract-sample-container"
    And I choose the "raw_message" from the "SourceField"
    And I set the parameter "Regex" with value "%{ApcClientIP} %{ApcIdent} %{ApcUser} %{ApcTimestamp} %{ApcRequest} %{ApcStatus} %{ApcRespLen} %{ApcReferer} %{ApcUa}"
    And I click the "ParseButton" button
    And I wait for "SuccessMessage" will be visible
#    And I will see the success message "验证完成"
    Then I will see the element value in json "{'Result':'<result>'}"

    Examples:
      | result                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 |
      | Object\nclientip:"192.168.1.139"\nmethod:"GET"\nreferer:"http://alltest.rizhiyi.com/search/?query=*&time_range=-2d%2Cnow&order=desc&size=20&page=1&sourcegroup=all&type=timeline&_t=1422088066859&title=%E9%BB%98%E8%AE%A4&index=0"\nreferer_domain:"alltest.rizhiyi.com"\nrequest_path:"/api/v0/search/fields/"\nrequest_query:"field=tag&filters=&order=desc&page=1&query=*&size=50&sourcegroup=all&sourcegroupCn=%E6%89%80%E6%9C%89%E6%97%A5%E5%BF%97&time_range=-2d,now&type=fields"\nresp_len:363\nstatus:200\ntimestamp:"24/Jan/2015:17:03:49 +0800"\nua:"Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:35.0) Gecko/20100101 Firefox/35.0"\nversion:"1.1"\nraw_message:"192.168.1.139 - - [24/Jan/2015:17:03:49 +0800] "GET /api/v0/search/fields/?field=tag&filters=&order=desc&page=1&query=*&size=50&sourcegroup=all&sourcegroupCn=%E6%89%80%E6%9C%89%E6%97%A5%E5%BF%97&time_range=-2d,now&type=fields HTTP/1.1" 200 363 "http://alltest.rizhiyi.com/search/?query=*&time_range=-2d%2Cnow&order=desc&size=20&page=1&sourcegroup=all&type=timeline&_t=1422088066859&title=%E9%BB%98%E8%AE%A4&index=0" "Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:35.0) Gecko/20100101 Firefox/35.0"" |

  @second
  Scenario Outline: KeyValue分解（RZY-1531至1533）
    When I set the parameter "LogSample" with value "<logSample>"
    And I choose the "KeyValue分解" from the "ParseRule"
    And I alter the element "ExtractSample" class to "yw-extract-sample yw-extract-sample-container"
    And I choose the "<sourceField>" from the "SourceField"
    And I set the parameter "FieldSeparator" with value "&"
    And I set the parameter "KVSeparator" with value "="
    And I set the parameter "KeepKey" with value "<keepKey>"
    And I set the parameter "DumpKey" with value "<dumpKey>"
    And I click the "ParseButton" button
    And I wait for "SuccessMessage" will be visible
#    And I will see the success message "验证完成"
    Then I will see the element value in json "{'Result':'<result>'}"

    Examples:
      | logSample                                                                                                                                              | sourceField | keepKey | dumpKey | result                                                                                                                                                                                                                                                                                                                                                |
      | field=tag&filters=&order=desc&page=1&query=*&size=50&sourcegroup=all&sourcegroupCn=%E6%89%80%E6%9C%89%E6%97%A5%E5%BF%97&time_range=-2d,now&type=fields | raw_message |         |         | Object\nfield:"tag"\norder:"desc"\npage:"1"\nquery:"*"\nsize:"50"\nsourcegroup:"all"\nsourcegroupCn:"%E6%89%80%E6%9C%89%E6%97%A5%E5%BF%97"\ntime_range:"-2d,now"\ntype:"fields"\nraw_message:"field=tag&filters=&order=desc&page=1&query=*&size=50&sourcegroup=all&sourcegroupCn=%E6%89%80%E6%9C%89%E6%97%A5%E5%BF%97&time_range=-2d,now&type=fields" |
      | field=tag&filters=&order=desc&page=1&query=*&size=50&sourcegroup=all&sourcegroupCn=%E6%89%80%E6%9C%89%E6%97%A5%E5%BF%97&time_range=-2d,now&type=fields | raw_message |         | order   | Object\nfield:"tag"\npage:"1"\nquery:"*"\nsize:"50"\nsourcegroup:"all"\nsourcegroupCn:"%E6%89%80%E6%9C%89%E6%97%A5%E5%BF%97"\ntime_range:"-2d,now"\ntype:"fields"\nraw_message:"field=tag&filters=&order=desc&page=1&query=*&size=50&sourcegroup=all&sourcegroupCn=%E6%89%80%E6%9C%89%E6%97%A5%E5%BF%97&time_range=-2d,now&type=fields"               |
      | field=tag&filters=&order=desc&page=1&query=*&size=50&sourcegroup=all&sourcegroupCn=%E6%89%80%E6%9C%89%E6%97%A5%E5%BF%97&time_range=-2d,now&type=fields | raw_message | order   |         | Object\norder:"desc"\nraw_message:"field=tag&filters=&order=desc&page=1&query=*&size=50&sourcegroup=all&sourcegroupCn=%E6%89%80%E6%9C%89%E6%97%A5%E5%BF%97&time_range=-2d,now&type=fields"                                                                                                                                                            |

  @second
  Scenario Outline: RZY-1535:keyvalue正则匹配
    When I set the parameter "LogSample" with value "<logSample>"
    And I choose the "<parseRule>" from the "ParseRule"
    And I alter the element "ExtractSample" class to "yw-extract-sample yw-extract-sample-container"
    And I choose the "<sourceField>" from the "SourceField"
    And I set the parameter "Regex" with value "<regex>"
    And I click the "ParseButton" button
    And I wait for "SuccessMessage" will be visible
#    And I will see the success message "验证完成"
    Then I will see the element value in json "{'Result':'<result>'}"
    And I click the "ContinueButton" button
    And I choose the "<parseRule1>" from the "ParseRule"
    And I choose the "<sourceField2>" from the "SourceFieldLabel2"
    And I set the parameter "KeyRegex" with value "<keyRegex>"
    And I set the parameter "ValueRegex" with value "<valueRegex>"
    And I set the parameter "KVSeparator" with value "<kvSeparator>"
    And I click the "ParseButton" button
    And I wait for "SuccessMessage" will be visible
#    And I will see the success message "验证完成"
    Then I will see the element value in json "{'Result':'<result1>'}"

    Examples:
      | logSample                                                                                                                                                                                                                                                                                                                                                                                                                                     | parseRule | sourceField | regex                                                                                                                                                                                                                        | parseRule1   | sourceField2 | keyRegex | valueRegex | kvSeparator | result                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      | result1                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          |
      | <190>May 18 11:20:10 2016 HLJ_S12508_1_FW %%10FILTER/6/ZONE_DP_FLT_EXECUTION_TCP_LOG(l): -DEV_TYPE=SECPATH-PN=210231A0H6010C000002; srcZoneName(1034)=serveruntrust;destZoneName(1035)=servertrust;rule_ID(1070)=90;policyActType(1071)=denied;protType(1001)=TCP(6);srcIPAddr(1017)=10.167.77.99;destIPAddr(1019)=10.166.5.70;srcPortNum(1018)=49362;destPortNum(1020)=1521;beginTime_e(1013)=05182016112009;endTime_e(1014)=05182016112009; | 正则解析      | raw_message | <%{NOTSPACE:id}>(?<timestamp>%{NOTSPACE}\s+%{NOTSPACE}\s+%{NOTSPACE}\s+%{NOTSPACE}\s+)%{NOTSPACE:host} \%\%(?<vendor>[^/]*)/(?<severity>[^/]*)/(?<MNEMONIC>[^:]*): -DEV_TYPE=SECPATH-PN=210231A0H6010C000002; (?<message>.*) | KeyValue正则匹配 | message      | [^=;]+   | [^=;]+     | =           | Object\nMNEMONIC:"ZONE_DP_FLT_EXECUTION_TCP_LOG(l)"\nhost:"HLJ_S12508_1_FW"\nid:"190"\nmessage:"srcZoneName(1034)=serveruntrust;destZoneName(1035)=servertrust;rule_ID(1070)=90;policyActType(1071)=denied;protType(1001)=TCP(6);srcIPAddr(1017)=10.167.77.99;destIPAddr(1019)=10.166.5.70;srcPortNum(1018)=49362;destPortNum(1020)=1521;beginTime_e(1013)=05182016112009;endTime_e(1014)=05182016112009;"\nseverity:"6"\ntimestamp:"May 18 11:20:10 2016 "\nvendor:"10FILTER"\nraw_message:"<190>May 18 11:20:10 2016 HLJ_S12508_1_FW %%10FILTER/6/ZONE_DP_FLT_EXECUTION_TCP_LOG(l): -DEV_TYPE=SECPATH-PN=210231A0H6010C000002; srcZoneName(1034)=serveruntrust;destZoneName(1035)=servertrust;rule_ID(1070)=90;policyActType(1071)=denied;protType(1001)=TCP(6);srcIPAddr(1017)=10.167.77.99;destIPAddr(1019)=10.166.5.70;srcPortNum(1018)=49362;destPortNum(1020)=1521;beginTime_e(1013)=05182016112009;endTime_e(1014)=05182016112009;" | Object\nMNEMONIC:"ZONE_DP_FLT_EXECUTION_TCP_LOG(l)"\nhost:"HLJ_S12508_1_FW"\nid:"190"\nmessage:Object\nbeginTime_e(1013):"05182016112009"\ndestIPAddr(1019):"10.166.5.70"\ndestPortNum(1020):"1521"\ndestZoneName(1035):"servertrust"\nendTime_e(1014):"05182016112009"\npolicyActType(1071):"denied"\nprotType(1001):"TCP(6)"\nrule_ID(1070):"90"\nsrcIPAddr(1017):"10.167.77.99"\nsrcPortNum(1018):"49362"\nsrcZoneName(1034):"serveruntrust"\nseverity:"6"\ntimestamp:"May 18 11:20:10 2016 "\nvendor:"10FILTER"\nraw_message:"<190>May 18 11:20:10 2016 HLJ_S12508_1_FW %%10FILTER/6/ZONE_DP_FLT_EXECUTION_TCP_LOG(l): -DEV_TYPE=SECPATH-PN=210231A0H6010C000002; srcZoneName(1034)=serveruntrust;destZoneName(1035)=servertrust;rule_ID(1070)=90;policyActType(1071)=denied;protType(1001)=TCP(6);srcIPAddr(1017)=10.167.77.99;destIPAddr(1019)=10.166.5.70;srcPortNum(1018)=49362;destPortNum(1020)=1521;beginTime_e(1013)=05182016112009;endTime_e(1014)=05182016112009;" |

  @second
  Scenario Outline: 正则解析+数值型字段转换（RZY-1536至1538）
    When I set the parameter "LogSample" with value "<logSample>"
    And I choose the "正则解析" from the "ParseRule"
    And I alter the element "ExtractSample" class to "yw-extract-sample yw-extract-sample-container"
    And I choose the "raw_message" from the "SourceField"
    And I set the parameter "Regex" with value "<regex>"
    And I click the "ParseButton" button
    And I wait for "SuccessMessage" will be visible
#    And I will see the success message "验证完成"
    Then I will see the element value in json "{'Result':'<result>'}"
    And I click the "ContinueButton" button
    And I choose the "数值型字段转换" from the "ParseRule"
    And I choose the "<field>" from the "SourceFieldLabel2"
    And I choose the "<decimal>" from the "Decimal"
    And I click the "ParseButton" button
    And I wait for "SuccessMessage" will be visible
#    And I will see the success message "验证完成"
    Then I will see the element value in json "{'Result':'<result1>'}"

    Examples:
      | logSample                                                                                                                                                                                                                                                                                                                                                                                                                                     | regex                                                                                                                                                                                                                        | result                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      | result1                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   | field       | decimal |
      | <190>May 18 11:20:10 2016 HLJ_S12508_1_FW %%10FILTER/6/ZONE_DP_FLT_EXECUTION_TCP_LOG(l): -DEV_TYPE=SECPATH-PN=210231A0H6010C000002; srcZoneName(1034)=serveruntrust;destZoneName(1035)=servertrust;rule_ID(1070)=90;policyActType(1071)=denied;protType(1001)=TCP(6);srcIPAddr(1017)=10.167.77.99;destIPAddr(1019)=10.166.5.70;srcPortNum(1018)=49362;destPortNum(1020)=1521;beginTime_e(1013)=05182016112009;endTime_e(1014)=05182016112009; | <%{NOTSPACE:id}>(?<timestamp>%{NOTSPACE}\s+%{NOTSPACE}\s+%{NOTSPACE}\s+%{NOTSPACE}\s+)%{NOTSPACE:host} \%\%(?<vendor>[^/]*)/(?<severity>[^/]*)/(?<MNEMONIC>[^:]*): -DEV_TYPE=SECPATH-PN=210231A0H6010C000002; (?<message>.*) | Object\nMNEMONIC:"ZONE_DP_FLT_EXECUTION_TCP_LOG(l)"\nhost:"HLJ_S12508_1_FW"\nid:"190"\nmessage:"srcZoneName(1034)=serveruntrust;destZoneName(1035)=servertrust;rule_ID(1070)=90;policyActType(1071)=denied;protType(1001)=TCP(6);srcIPAddr(1017)=10.167.77.99;destIPAddr(1019)=10.166.5.70;srcPortNum(1018)=49362;destPortNum(1020)=1521;beginTime_e(1013)=05182016112009;endTime_e(1014)=05182016112009;"\nseverity:"6"\ntimestamp:"May 18 11:20:10 2016 "\nvendor:"10FILTER"\nraw_message:"<190>May 18 11:20:10 2016 HLJ_S12508_1_FW %%10FILTER/6/ZONE_DP_FLT_EXECUTION_TCP_LOG(l): -DEV_TYPE=SECPATH-PN=210231A0H6010C000002; srcZoneName(1034)=serveruntrust;destZoneName(1035)=servertrust;rule_ID(1070)=90;policyActType(1071)=denied;protType(1001)=TCP(6);srcIPAddr(1017)=10.167.77.99;destIPAddr(1019)=10.166.5.70;srcPortNum(1018)=49362;destPortNum(1020)=1521;beginTime_e(1013)=05182016112009;endTime_e(1014)=05182016112009;" | Object\nMNEMONIC:"ZONE_DP_FLT_EXECUTION_TCP_LOG(l)"\nhost:"HLJ_S12508_1_FW"\nid:"190"\nmessage:"srcZoneName(1034)=serveruntrust;destZoneName(1035)=servertrust;rule_ID(1070)=90;policyActType(1071)=denied;protType(1001)=TCP(6);srcIPAddr(1017)=10.167.77.99;destIPAddr(1019)=10.166.5.70;srcPortNum(1018)=49362;destPortNum(1020)=1521;beginTime_e(1013)=05182016112009;endTime_e(1014)=05182016112009;"\nseverity:6\ntimestamp:"May 18 11:20:10 2016 "\nvendor:"10FILTER"\nraw_message:"<190>May 18 11:20:10 2016 HLJ_S12508_1_FW %%10FILTER/6/ZONE_DP_FLT_EXECUTION_TCP_LOG(l): -DEV_TYPE=SECPATH-PN=210231A0H6010C000002; srcZoneName(1034)=serveruntrust;destZoneName(1035)=servertrust;rule_ID(1070)=90;policyActType(1071)=denied;protType(1001)=TCP(6);srcIPAddr(1017)=10.167.77.99;destIPAddr(1019)=10.166.5.70;srcPortNum(1018)=49362;destPortNum(1020)=1521;beginTime_e(1013)=05182016112009;endTime_e(1014)=05182016112009;" | severity    | 10      |
      | <190>May 18 11:20:10 2016 HLJ_S12508_1_FW %%10FILTER/6/ZONE_DP_FLT_EXECUTION_TCP_LOG(l): -DEV_TYPE=SECPATH-PN=210231A0H6010C000002; srcZoneName(1034)=serveruntrust;destZoneName(1035)=servertrust;rule_ID(1070)=90;policyActType(1071)=denied;protType(1001)=TCP(6);srcIPAddr(1017)=10.167.77.99;destIPAddr(1019)=10.166.5.70;srcPortNum(1018)=49362;destPortNum(1020)=1521;beginTime_e(1013)=05182016112009;endTime_e(1014)=05182016112009; | <%{NOTSPACE:id}>(?<timestamp>%{NOTSPACE}\s+%{NOTSPACE}\s+%{NOTSPACE}\s+%{NOTSPACE}\s+)%{NOTSPACE:host} \%\%(?<vendor>[^/]*)/(?<severity>[^/]*)/(?<MNEMONIC>[^:]*): -DEV_TYPE=SECPATH-PN=210231A0H6010C000002; (?<message>.*) | Object\nMNEMONIC:"ZONE_DP_FLT_EXECUTION_TCP_LOG(l)"\nhost:"HLJ_S12508_1_FW"\nid:"190"\nmessage:"srcZoneName(1034)=serveruntrust;destZoneName(1035)=servertrust;rule_ID(1070)=90;policyActType(1071)=denied;protType(1001)=TCP(6);srcIPAddr(1017)=10.167.77.99;destIPAddr(1019)=10.166.5.70;srcPortNum(1018)=49362;destPortNum(1020)=1521;beginTime_e(1013)=05182016112009;endTime_e(1014)=05182016112009;"\nseverity:"6"\ntimestamp:"May 18 11:20:10 2016 "\nvendor:"10FILTER"\nraw_message:"<190>May 18 11:20:10 2016 HLJ_S12508_1_FW %%10FILTER/6/ZONE_DP_FLT_EXECUTION_TCP_LOG(l): -DEV_TYPE=SECPATH-PN=210231A0H6010C000002; srcZoneName(1034)=serveruntrust;destZoneName(1035)=servertrust;rule_ID(1070)=90;policyActType(1071)=denied;protType(1001)=TCP(6);srcIPAddr(1017)=10.167.77.99;destIPAddr(1019)=10.166.5.70;srcPortNum(1018)=49362;destPortNum(1020)=1521;beginTime_e(1013)=05182016112009;endTime_e(1014)=05182016112009;" | Object\nMNEMONIC:"ZONE_DP_FLT_EXECUTION_TCP_LOG(l)"\nhost:"HLJ_S12508_1_FW"\nid:190\nmessage:"srcZoneName(1034)=serveruntrust;destZoneName(1035)=servertrust;rule_ID(1070)=90;policyActType(1071)=denied;protType(1001)=TCP(6);srcIPAddr(1017)=10.167.77.99;destIPAddr(1019)=10.166.5.70;srcPortNum(1018)=49362;destPortNum(1020)=1521;beginTime_e(1013)=05182016112009;endTime_e(1014)=05182016112009;"\nseverity:6\ntimestamp:"May 18 11:20:10 2016 "\nvendor:"10FILTER"\nraw_message:"<190>May 18 11:20:10 2016 HLJ_S12508_1_FW %%10FILTER/6/ZONE_DP_FLT_EXECUTION_TCP_LOG(l): -DEV_TYPE=SECPATH-PN=210231A0H6010C000002; srcZoneName(1034)=serveruntrust;destZoneName(1035)=servertrust;rule_ID(1070)=90;policyActType(1071)=denied;protType(1001)=TCP(6);srcIPAddr(1017)=10.167.77.99;destIPAddr(1019)=10.166.5.70;srcPortNum(1018)=49362;destPortNum(1020)=1521;beginTime_e(1013)=05182016112009;endTime_e(1014)=05182016112009;"   | id,severity | 10      |
      | <190>May 18 11:20:10 2016 HLJ_S12508_1_FW %%10FILTER/6/ZONE_DP_FLT_EXECUTION_TCP_LOG(l): -DEV_TYPE=SECPATH-PN=210231A0H6010C000002; srcZoneName(1034)=serveruntrust;destZoneName(1035)=servertrust;rule_ID(1070)=90;policyActType(1071)=denied;protType(1001)=TCP(6);srcIPAddr(1017)=10.167.77.99;destIPAddr(1019)=10.166.5.70;srcPortNum(1018)=49362;destPortNum(1020)=1521;beginTime_e(1013)=05182016112009;endTime_e(1014)=05182016112009; | <%{NOTSPACE:id}>(?<timestamp>%{NOTSPACE}\s+%{NOTSPACE}\s+%{NOTSPACE}\s+%{NOTSPACE}\s+)%{NOTSPACE:host} \%\%(?<vendor>[^/]*)/(?<severity>[^/]*)/(?<MNEMONIC>[^:]*): -DEV_TYPE=SECPATH-PN=210231A0H6010C000002; (?<message>.*) | Object\nMNEMONIC:"ZONE_DP_FLT_EXECUTION_TCP_LOG(l)"\nhost:"HLJ_S12508_1_FW"\nid:"190"\nmessage:"srcZoneName(1034)=serveruntrust;destZoneName(1035)=servertrust;rule_ID(1070)=90;policyActType(1071)=denied;protType(1001)=TCP(6);srcIPAddr(1017)=10.167.77.99;destIPAddr(1019)=10.166.5.70;srcPortNum(1018)=49362;destPortNum(1020)=1521;beginTime_e(1013)=05182016112009;endTime_e(1014)=05182016112009;"\nseverity:"6"\ntimestamp:"May 18 11:20:10 2016 "\nvendor:"10FILTER"\nraw_message:"<190>May 18 11:20:10 2016 HLJ_S12508_1_FW %%10FILTER/6/ZONE_DP_FLT_EXECUTION_TCP_LOG(l): -DEV_TYPE=SECPATH-PN=210231A0H6010C000002; srcZoneName(1034)=serveruntrust;destZoneName(1035)=servertrust;rule_ID(1070)=90;policyActType(1071)=denied;protType(1001)=TCP(6);srcIPAddr(1017)=10.167.77.99;destIPAddr(1019)=10.166.5.70;srcPortNum(1018)=49362;destPortNum(1020)=1521;beginTime_e(1013)=05182016112009;endTime_e(1014)=05182016112009;" | Object\nMNEMONIC:"ZONE_DP_FLT_EXECUTION_TCP_LOG(l)"\nhost:"HLJ_S12508_1_FW"\nid:400\nmessage:"srcZoneName(1034)=serveruntrust;destZoneName(1035)=servertrust;rule_ID(1070)=90;policyActType(1071)=denied;protType(1001)=TCP(6);srcIPAddr(1017)=10.167.77.99;destIPAddr(1019)=10.166.5.70;srcPortNum(1018)=49362;destPortNum(1020)=1521;beginTime_e(1013)=05182016112009;endTime_e(1014)=05182016112009;"\nseverity:"6"\ntimestamp:"May 18 11:20:10 2016 "\nvendor:"10FILTER"\nraw_message:"<190>May 18 11:20:10 2016 HLJ_S12508_1_FW %%10FILTER/6/ZONE_DP_FLT_EXECUTION_TCP_LOG(l): -DEV_TYPE=SECPATH-PN=210231A0H6010C000002; srcZoneName(1034)=serveruntrust;destZoneName(1035)=servertrust;rule_ID(1070)=90;policyActType(1071)=denied;protType(1001)=TCP(6);srcIPAddr(1017)=10.167.77.99;destIPAddr(1019)=10.166.5.70;srcPortNum(1018)=49362;destPortNum(1020)=1521;beginTime_e(1013)=05182016112009;endTime_e(1014)=05182016112009;" | id          | 16      |

  @second
  Scenario Outline: 1539、1540、1541、1545、1547、1555
    When I set the parameter "LogSample" with value "<logSample>"
    And I choose the "正则解析" from the "ParseRule"
    And I alter the element "ExtractSample" class to "yw-extract-sample yw-extract-sample-container"
    And I choose the "raw_message" from the "SourceField"
    And I set the parameter "Regex" with value "<regex>"
    And I click the "ParseButton" button
    And I wait for "SuccessMessage" will be visible
#    And I will see the success message "验证完成"
    Then I will see the element value in json "{'Result':'<result>'}"
    And I click the "ContinueButton" button
    And I choose the "<parseRule>" from the "ParseRule"
    And I choose the "<sourceField>" from the "SourceFieldLabel2"
    And I set the parameter "<inputElement>" with value "<timeFormat>"
    And I click the "ParseButton" button
    And I wait for "SuccessMessage" will be visible
#    And I will see the success message "验证完成"
    And I wait for "2000" millsecond
    Then I will see the element value in json "{'Result':'<result1>'}"

    Examples:
      | logSample                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            | regex                                                                                                                 | parseRule    | sourceField   | inputElement | timeFormat             | result                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 | result1                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     |
      | 192.168.1.139 - - [24/Jan/2015:17:03:49 +0800] "GET /api/v0/search/fields/?field=tag&filters=&order=desc&page=1&query=*&size=50&sourcegroup=all&sourcegroupCn=%E6%89%80%E6%9C%89%E6%97%A5%E5%BF%97&time_range=-2d,now&type=fields HTTP/1.1" 200 363 "http://alltest.rizhiyi.com/search/?query=*&time_range=-2d%2Cnow&order=desc&size=20&page=1&sourcegroup=all&type=timeline&_t=1422088066859&title=%E9%BB%98%E8%AE%A4&index=0" "Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:35.0) Gecko/20100101 Firefox/35.0" | %{ApcClientIP} %{ApcIdent} %{ApcUser} %{ApcTimestamp} %{ApcRequest} %{ApcStatus} %{ApcRespLen} %{ApcReferer} %{ApcUa} | URL解析        | request_query |              |                        | Object\nclientip:"192.168.1.139"\nmethod:"GET"\nreferer:"http://alltest.rizhiyi.com/search/?query=*&time_range=-2d%2Cnow&order=desc&size=20&page=1&sourcegroup=all&type=timeline&_t=1422088066859&title=%E9%BB%98%E8%AE%A4&index=0"\nreferer_domain:"alltest.rizhiyi.com"\nrequest_path:"/api/v0/search/fields/"\nrequest_query:"field=tag&filters=&order=desc&page=1&query=*&size=50&sourcegroup=all&sourcegroupCn=%E6%89%80%E6%9C%89%E6%97%A5%E5%BF%97&time_range=-2d,now&type=fields"\nresp_len:363\nstatus:200\ntimestamp:"24/Jan/2015:17:03:49 +0800"\nua:"Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:35.0) Gecko/20100101 Firefox/35.0"\nversion:"1.1"\nraw_message:"192.168.1.139 - - [24/Jan/2015:17:03:49 +0800] "GET /api/v0/search/fields/?field=tag&filters=&order=desc&page=1&query=*&size=50&sourcegroup=all&sourcegroupCn=%E6%89%80%E6%9C%89%E6%97%A5%E5%BF%97&time_range=-2d,now&type=fields HTTP/1.1" 200 363 "http://alltest.rizhiyi.com/search/?query=*&time_range=-2d%2Cnow&order=desc&size=20&page=1&sourcegroup=all&type=timeline&_t=1422088066859&title=%E9%BB%98%E8%AE%A4&index=0" "Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:35.0) Gecko/20100101 Firefox/35.0"" | Object\nclientip:"192.168.1.139"\nmethod:"GET"\nreferer:"http://alltest.rizhiyi.com/search/?query=*&time_range=-2d%2Cnow&order=desc&size=20&page=1&sourcegroup=all&type=timeline&_t=1422088066859&title=%E9%BB%98%E8%AE%A4&index=0"\nreferer_domain:"alltest.rizhiyi.com"\nrequest_path:"/api/v0/search/fields/"\nrequest_query:"field=tag&filters=&order=desc&page=1&query=*&size=50&sourcegroup=all&sourcegroupCn=所有日志&time_range=-2d,now&type=fields"\nresp_len:363\nstatus:200\ntimestamp:"24/Jan/2015:17:03:49 +0800"\nua:"Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:35.0) Gecko/20100101 Firefox/35.0"\nversion:"1.1"\nraw_message:"192.168.1.139 - - [24/Jan/2015:17:03:49 +0800] "GET /api/v0/search/fields/?field=tag&filters=&order=desc&page=1&query=*&size=50&sourcegroup=all&sourcegroupCn=%E6%89%80%E6%9C%89%E6%97%A5%E5%BF%97&time_range=-2d,now&type=fields HTTP/1.1" 200 363 "http://alltest.rizhiyi.com/search/?query=*&time_range=-2d%2Cnow&order=desc&size=20&page=1&sourcegroup=all&type=timeline&_t=1422088066859&title=%E9%BB%98%E8%AE%A4&index=0" "Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:35.0) Gecko/20100101 Firefox/35.0""                                      |
      | 192.168.1.139 - - [24/Jan/2015:17:03:49 +0800] "GET /api/v0/search/fields/?field=tag&filters=&order=desc&page=1&query=*&size=50&sourcegroup=all&sourcegroupCn=%E6%89%80%E6%9C%89%E6%97%A5%E5%BF%97&time_range=-2d,now&type=fields HTTP/1.1" 200 363 "http://alltest.rizhiyi.com/search/?query=*&time_range=-2d%2Cnow&order=desc&size=20&page=1&sourcegroup=all&type=timeline&_t=1422088066859&title=%E9%BB%98%E8%AE%A4&index=0" "Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:35.0) Gecko/20100101 Firefox/35.0" | %{ApcClientIP} %{ApcIdent} %{ApcUser} %{ApcTimestamp} %{ApcRequest} %{ApcStatus} %{ApcRespLen} %{ApcReferer} %{ApcUa} | user agent解析 | ua            |              |                        | Object\nclientip:"192.168.1.139"\nmethod:"GET"\nreferer:"http://alltest.rizhiyi.com/search/?query=*&time_range=-2d%2Cnow&order=desc&size=20&page=1&sourcegroup=all&type=timeline&_t=1422088066859&title=%E9%BB%98%E8%AE%A4&index=0"\nreferer_domain:"alltest.rizhiyi.com"\nrequest_path:"/api/v0/search/fields/"\nrequest_query:"field=tag&filters=&order=desc&page=1&query=*&size=50&sourcegroup=all&sourcegroupCn=%E6%89%80%E6%9C%89%E6%97%A5%E5%BF%97&time_range=-2d,now&type=fields"\nresp_len:363\nstatus:200\ntimestamp:"24/Jan/2015:17:03:49 +0800"\nua:"Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:35.0) Gecko/20100101 Firefox/35.0"\nversion:"1.1"\nraw_message:"192.168.1.139 - - [24/Jan/2015:17:03:49 +0800] "GET /api/v0/search/fields/?field=tag&filters=&order=desc&page=1&query=*&size=50&sourcegroup=all&sourcegroupCn=%E6%89%80%E6%9C%89%E6%97%A5%E5%BF%97&time_range=-2d,now&type=fields HTTP/1.1" 200 363 "http://alltest.rizhiyi.com/search/?query=*&time_range=-2d%2Cnow&order=desc&size=20&page=1&sourcegroup=all&type=timeline&_t=1422088066859&title=%E9%BB%98%E8%AE%A4&index=0" "Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:35.0) Gecko/20100101 Firefox/35.0"" | Object\nclientip:"192.168.1.139"\nmethod:"GET"\nreferer:"http://alltest.rizhiyi.com/search/?query=*&time_range=-2d%2Cnow&order=desc&size=20&page=1&sourcegroup=all&type=timeline&_t=1422088066859&title=%E9%BB%98%E8%AE%A4&index=0"\nreferer_domain:"alltest.rizhiyi.com"\nrequest_path:"/api/v0/search/fields/"\nrequest_query:"field=tag&filters=&order=desc&page=1&query=*&size=50&sourcegroup=all&sourcegroupCn=%E6%89%80%E6%9C%89%E6%97%A5%E5%BF%97&time_range=-2d,now&type=fields"\nresp_len:363\nstatus:200\ntimestamp:"24/Jan/2015:17:03:49 +0800"\nua:Object\nbrowser:"Firefox"\nbrowser_v:"Firefox 35.0"\nos:"Mac OS X"\nos_v:"Mac OS X 10.10"\nversion:"1.1"\nraw_message:"192.168.1.139 - - [24/Jan/2015:17:03:49 +0800] "GET /api/v0/search/fields/?field=tag&filters=&order=desc&page=1&query=*&size=50&sourcegroup=all&sourcegroupCn=%E6%89%80%E6%9C%89%E6%97%A5%E5%BF%97&time_range=-2d,now&type=fields HTTP/1.1" 200 363 "http://alltest.rizhiyi.com/search/?query=*&time_range=-2d%2Cnow&order=desc&size=20&page=1&sourcegroup=all&type=timeline&_t=1422088066859&title=%E9%BB%98%E8%AE%A4&index=0" "Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:35.0) Gecko/20100101 Firefox/35.0"" |
      | 192.168.1.139 - - [24/Jan/2015:17:03:49 +0800] "GET /api/v0/search/fields/?field=tag&filters=&order=desc&page=1&query=*&size=50&sourcegroup=all&sourcegroupCn=%E6%89%80%E6%9C%89%E6%97%A5%E5%BF%97&time_range=-2d,now&type=fields HTTP/1.1" 200 363 "http://alltest.rizhiyi.com/search/?query=*&time_range=-2d%2Cnow&order=desc&size=20&page=1&sourcegroup=all&type=timeline&_t=1422088066859&title=%E9%BB%98%E8%AE%A4&index=0" "Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:35.0) Gecko/20100101 Firefox/35.0" | %{ApcClientIP} %{ApcIdent} %{ApcUser} %{ApcTimestamp} %{ApcRequest} %{ApcStatus} %{ApcRespLen} %{ApcReferer} %{ApcUa} | 时间戳识别        | timestamp     | TimeFormat   | dd/MMM/yyyy:HH:mm:ss Z | Object\nclientip:"192.168.1.139"\nmethod:"GET"\nreferer:"http://alltest.rizhiyi.com/search/?query=*&time_range=-2d%2Cnow&order=desc&size=20&page=1&sourcegroup=all&type=timeline&_t=1422088066859&title=%E9%BB%98%E8%AE%A4&index=0"\nreferer_domain:"alltest.rizhiyi.com"\nrequest_path:"/api/v0/search/fields/"\nrequest_query:"field=tag&filters=&order=desc&page=1&query=*&size=50&sourcegroup=all&sourcegroupCn=%E6%89%80%E6%9C%89%E6%97%A5%E5%BF%97&time_range=-2d,now&type=fields"\nresp_len:363\nstatus:200\ntimestamp:"24/Jan/2015:17:03:49 +0800"\nua:"Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:35.0) Gecko/20100101 Firefox/35.0"\nversion:"1.1"\nraw_message:"192.168.1.139 - - [24/Jan/2015:17:03:49 +0800] "GET /api/v0/search/fields/?field=tag&filters=&order=desc&page=1&query=*&size=50&sourcegroup=all&sourcegroupCn=%E6%89%80%E6%9C%89%E6%97%A5%E5%BF%97&time_range=-2d,now&type=fields HTTP/1.1" 200 363 "http://alltest.rizhiyi.com/search/?query=*&time_range=-2d%2Cnow&order=desc&size=20&page=1&sourcegroup=all&type=timeline&_t=1422088066859&title=%E9%BB%98%E8%AE%A4&index=0" "Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:35.0) Gecko/20100101 Firefox/35.0"" | Object\nclientip:"192.168.1.139"\nmethod:"GET"\nreferer:"http://alltest.rizhiyi.com/search/?query=*&time_range=-2d%2Cnow&order=desc&size=20&page=1&sourcegroup=all&type=timeline&_t=1422088066859&title=%E9%BB%98%E8%AE%A4&index=0"\nreferer_domain:"alltest.rizhiyi.com"\nrequest_path:"/api/v0/search/fields/"\nrequest_query:"field=tag&filters=&order=desc&page=1&query=*&size=50&sourcegroup=all&sourcegroupCn=%E6%89%80%E6%9C%89%E6%97%A5%E5%BF%97&time_range=-2d,now&type=fields"\nresp_len:363\nstatus:200\ntimestamp:"2015/01/24 17:03:49.0"\nua:"Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:35.0) Gecko/20100101 Firefox/35.0"\nversion:"1.1"\nraw_message:"192.168.1.139 - - [24/Jan/2015:17:03:49 +0800] "GET /api/v0/search/fields/?field=tag&filters=&order=desc&page=1&query=*&size=50&sourcegroup=all&sourcegroupCn=%E6%89%80%E6%9C%89%E6%97%A5%E5%BF%97&time_range=-2d,now&type=fields HTTP/1.1" 200 363 "http://alltest.rizhiyi.com/search/?query=*&time_range=-2d%2Cnow&order=desc&size=20&page=1&sourcegroup=all&type=timeline&_t=1422088066859&title=%E9%BB%98%E8%AE%A4&index=0" "Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:35.0) Gecko/20100101 Firefox/35.0""           |
      | <134> Portinfo(Port,State,rx Kpps,tx Kpps,rx Mbps,tx Mbps): T1/1 down 0 0 0 0  \| T1/2 down 0 0 0 0 \| F2/1 up 0 0 0 0 \| F2/2 up 0 0 0 0 \| F2/3 down 0 0 0 0 \| F2/4 down 0 0 0 0 \| F2/5 down 0 0 0 0 \| F2/6 down 0 0 0 0 \| F2/7 down 0 0 0 0 \| F2/8 down 0 0 0 0 \|                                                                                                                                                                                                                                           | .*?:\s+(?<portinfo>.*)                                                                                                | CSV解析        | portinfo      | Separate     | \s*\\\|\s*             | Object\nportinfo:"T1/1 down 0 0 0 0 \| T1/2 down 0 0 0 0 \| F2/1 up 0 0 0 0 \| F2/2 up 0 0 0 0 \| F2/3 down 0 0 0 0 \| F2/4 down 0 0 0 0 \| F2/5 down 0 0 0 0 \| F2/6 down 0 0 0 0 \| F2/7 down 0 0 0 0 \| F2/8 down 0 0 0 0 \|"\nraw_message:"<134> Portinfo(Port,State,rx Kpps,tx Kpps,rx Mbps,tx Mbps): T1/1 down 0 0 0 0 \| T1/2 down 0 0 0 0 \| F2/1 up 0 0 0 0 \| F2/2 up 0 0 0 0 \| F2/3 down 0 0 0 0 \| F2/4 down 0 0 0 0 \| F2/5 down 0 0 0 0 \| F2/6 down 0 0 0 0 \| F2/7 down 0 0 0 0 \| F2/8 down 0 0 0 0 \|"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              | Object\nportinfo:Array[10]\n0:"T1/1 down 0 0 0 0"\n1:"T1/2 down 0 0 0 0"\n2:"F2/1 up 0 0 0 0"\n3:"F2/2 up 0 0 0 0"\n4:"F2/3 down 0 0 0 0"\n5:"F2/4 down 0 0 0 0"\n6:"F2/5 down 0 0 0 0"\n7:"F2/6 down 0 0 0 0"\n8:"F2/7 down 0 0 0 0"\n9:"F2/8 down 0 0 0 0"\nraw_message:"<134> Portinfo(Port,State,rx Kpps,tx Kpps,rx Mbps,tx Mbps): T1/1 down 0 0 0 0 \| T1/2 down 0 0 0 0 \| F2/1 up 0 0 0 0 \| F2/2 up 0 0 0 0 \| F2/3 down 0 0 0 0 \| F2/4 down 0 0 0 0 \| F2/5 down 0 0 0 0 \| F2/6 down 0 0 0 0 \| F2/7 down 0 0 0 0 \| F2/8 down 0 0 0 0 \|"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       |
      | <30>Oct 9 22:33:20 hlfedora auditd[1787]: The audit daemon is exiting.                                                                                                                                                                                                                                                                                                                                                                                                                                               | <(?<pri>\d+)>.*                                                                                                       | syslog_pri解析 | pri           |              |                        | Object\npri:"30"\nraw_message:"<30>Oct 9 22:33:20 hlfedora auditd[1787]: The audit daemon is exiting."                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 | Object\nfacility:"daemon"\npri:"30"\nseverity:"info"\nraw_message:"<30>Oct 9 22:33:20 hlfedora auditd[1787]: The audit daemon is exiting."                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  |
      | 3651919938                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           | (?<ip>.*)                                                                                                             | ip格式转换       | ip            |              |                        | Object\nip:"3651919938"\nraw_message:"3651919938"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      | Object\nip:"217.171.224.66"\nraw_message:"3651919938"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       |

  @second
  Scenario Outline: 1542、1543
    When I set the parameter "LogSample" with value "{"Name": "John Smith ", "Age": 23, "Employed": true, "Address": {"Street": "324 Chrome St", "City": "Portland, New York,Los Angeles ", "Country": "United States"}}"
    And I choose the "Json解析" from the "ParseRule"
    And I alter the element "ExtractSample" class to "yw-extract-sample yw-extract-sample-container"
    And I choose the "raw_message" from the "SourceField"
    And I set the parameter "<element>" with value "<path>"
    And I click the "ParseButton" button
    And I wait for "SuccessMessage" will be visible
#    And I will see the success message "验证完成"
    Then I will see the element value in json "{'Result':'<result>'}"

    Examples:
      | element   | path | result                                                                                                                                                                                                                                                                                                                                        |
      |           |      | Object\nAddress:Object\nCity:"Portland, New York,Los Angeles "\nCountry:"United States"\nStreet:"324 Chrome St"\nAge:23\nEmployed:true\nName:"John Smith "\nraw_message:"{"Name": "John Smith ", "Age": 23, "Employed": true, "Address": {"Street": "324 Chrome St", "City": "Portland, New York,Los Angeles ", "Country": "United States"}}" |
      | PathInput | Age  | Object\nAge:23\nraw_message:"{"Name": "John Smith ", "Age": 23, "Employed": true, "Address": {"Street": "324 Chrome St", "City": "Portland, New York,Los Angeles ", "Country": "United States"}}"                                                                                                                                             |

  @first
  Scenario Outline: CSV解析（RZY-1544）
    When I set the parameter "LogSample" with value "192.168.1.200,xmxm,rzy,13800000000"
    And I choose the "CSV解析" from the "ParseRule"
    And I alter the element "ExtractSample" class to "yw-extract-sample yw-extract-sample-container"
    And I choose the "raw_message" from the "SourceField"
    And I set the parameter "Separate" with value "<separate>"
    And I set the parameter "FieldList" with value "<fieldList>"
    And I click the "ParseButton" button
    And I wait for "SuccessMessage" will be visible
#    And I will see the success message "验证完成"
    Then I will see the element value in json "{'Result':'<result>'}"

    Examples:
      | separate | fieldList | result                                                                                                          |
      | ,        | 1,2,3,4,5 | Object\n1:"192.168.1.200"\n2:"xmxm"\n3:"rzy"\n4:"13800000000"\nraw_message:"192.168.1.200,xmxm,rzy,13800000000" |

  @second
  Scenario Outline: 正则解析+geo解析（RZY-1548至1549）
    When I set the parameter "LogSample" with value "192.168.1.139 - - [24/Jan/2015:17:03:49 +0800] "GET /api/v0/search/fields/?field=tag&filters=&order=desc&page=1&query=*&size=50&sourcegroup=all&sourcegroupCn=%E6%89%80%E6%9C%89%E6%97%A5%E5%BF%97&time_range=-2d,now&type=fields HTTP/1.1" 200 363 "http://alltest.rizhiyi.com/search/?query=*&time_range=-2d%2Cnow&order=desc&size=20&page=1&sourcegroup=all&type=timeline&_t=1422088066859&title=%E9%BB%98%E8%AE%A4&index=0" "Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:35.0) Gecko/20100101 Firefox/35.0""
    And I choose the "正则解析" from the "ParseRule"
    And I alter the element "ExtractSample" class to "yw-extract-sample yw-extract-sample-container"
    And I choose the "raw_message" from the "SourceField"
    And I set the parameter "Regex" with value "%{ApcClientIP} %{ApcIdent} %{ApcUser} %{ApcTimestamp} %{ApcRequest} %{ApcStatus} %{ApcRespLen} %{ApcReferer} %{ApcUa}"
    And I click the "ParseButton" button
    And I wait for "SuccessMessage" will be visible
#    And I will see the success message "验证完成"
    Then I will see the element value in json "{'Result':'<result>'}"
    And I click the "ContinueButton" button
    And I choose the "<parseRule>" from the "ParseRule"
    And I choose the "<sourceField>" from the "SourceFieldLabel2"
    And I click the "<parseField>" button
    And I click the "ParseButton" button
    And I wait for "SuccessMessage" will be visible
#    And I will see the success message "验证完成"
    Then I will see the element value in json "{'Result':'<result1>'}"

    Examples:
      | result                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 | parseRule | sourceField | parseField | result1                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             |
      | Object\nclientip:"192.168.1.139"\nmethod:"GET"\nreferer:"http://alltest.rizhiyi.com/search/?query=*&time_range=-2d%2Cnow&order=desc&size=20&page=1&sourcegroup=all&type=timeline&_t=1422088066859&title=%E9%BB%98%E8%AE%A4&index=0"\nreferer_domain:"alltest.rizhiyi.com"\nrequest_path:"/api/v0/search/fields/"\nrequest_query:"field=tag&filters=&order=desc&page=1&query=*&size=50&sourcegroup=all&sourcegroupCn=%E6%89%80%E6%9C%89%E6%97%A5%E5%BF%97&time_range=-2d,now&type=fields"\nresp_len:363\nstatus:200\ntimestamp:"24/Jan/2015:17:03:49 +0800"\nua:"Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:35.0) Gecko/20100101 Firefox/35.0"\nversion:"1.1"\nraw_message:"192.168.1.139 - - [24/Jan/2015:17:03:49 +0800] "GET /api/v0/search/fields/?field=tag&filters=&order=desc&page=1&query=*&size=50&sourcegroup=all&sourcegroupCn=%E6%89%80%E6%9C%89%E6%97%A5%E5%BF%97&time_range=-2d,now&type=fields HTTP/1.1" 200 363 "http://alltest.rizhiyi.com/search/?query=*&time_range=-2d%2Cnow&order=desc&size=20&page=1&sourcegroup=all&type=timeline&_t=1422088066859&title=%E9%BB%98%E8%AE%A4&index=0" "Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:35.0) Gecko/20100101 Firefox/35.0"" | geo解析     | clientip    |            | Object\nclientip:Object\ngeo:Object\ncity:"private"\ncountry:"private"\nip:"192.168.1.139"\nisp:"private"\nprovince:"private"\nmethod:"GET"\nreferer:"http://alltest.rizhiyi.com/search/?query=*&time_range=-2d%2Cnow&order=desc&size=20&page=1&sourcegroup=all&type=timeline&_t=1422088066859&title=%E9%BB%98%E8%AE%A4&index=0"\nreferer_domain:"alltest.rizhiyi.com"\nrequest_path:"/api/v0/search/fields/"\nrequest_query:"field=tag&filters=&order=desc&page=1&query=*&size=50&sourcegroup=all&sourcegroupCn=%E6%89%80%E6%9C%89%E6%97%A5%E5%BF%97&time_range=-2d,now&type=fields"\nresp_len:363\nstatus:200\ntimestamp:"24/Jan/2015:17:03:49 +0800"\nua:"Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:35.0) Gecko/20100101 Firefox/35.0"\nversion:"1.1"\nraw_message:"192.168.1.139 - - [24/Jan/2015:17:03:49 +0800] "GET /api/v0/search/fields/?field=tag&filters=&order=desc&page=1&query=*&size=50&sourcegroup=all&sourcegroupCn=%E6%89%80%E6%9C%89%E6%97%A5%E5%BF%97&time_range=-2d,now&type=fields HTTP/1.1" 200 363 "http://alltest.rizhiyi.com/search/?query=*&time_range=-2d%2Cnow&order=desc&size=20&page=1&sourcegroup=all&type=timeline&_t=1422088066859&title=%E9%BB%98%E8%AE%A4&index=0" "Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:35.0) Gecko/20100101 Firefox/35.0"" |
      | Object\nclientip:"192.168.1.139"\nmethod:"GET"\nreferer:"http://alltest.rizhiyi.com/search/?query=*&time_range=-2d%2Cnow&order=desc&size=20&page=1&sourcegroup=all&type=timeline&_t=1422088066859&title=%E9%BB%98%E8%AE%A4&index=0"\nreferer_domain:"alltest.rizhiyi.com"\nrequest_path:"/api/v0/search/fields/"\nrequest_query:"field=tag&filters=&order=desc&page=1&query=*&size=50&sourcegroup=all&sourcegroupCn=%E6%89%80%E6%9C%89%E6%97%A5%E5%BF%97&time_range=-2d,now&type=fields"\nresp_len:363\nstatus:200\ntimestamp:"24/Jan/2015:17:03:49 +0800"\nua:"Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:35.0) Gecko/20100101 Firefox/35.0"\nversion:"1.1"\nraw_message:"192.168.1.139 - - [24/Jan/2015:17:03:49 +0800] "GET /api/v0/search/fields/?field=tag&filters=&order=desc&page=1&query=*&size=50&sourcegroup=all&sourcegroupCn=%E6%89%80%E6%9C%89%E6%97%A5%E5%BF%97&time_range=-2d,now&type=fields HTTP/1.1" 200 363 "http://alltest.rizhiyi.com/search/?query=*&time_range=-2d%2Cnow&order=desc&size=20&page=1&sourcegroup=all&type=timeline&_t=1422088066859&title=%E9%BB%98%E8%AE%A4&index=0" "Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:35.0) Gecko/20100101 Firefox/35.0"" | geo解析     | clientip    | Checkbox   | Object\nclientip:"192.168.1.139"\ngeo:Object\ncity:"private"\ncountry:"private"\nisp:"private"\nprovince:"private"\nmethod:"GET"\nreferer:"http://alltest.rizhiyi.com/search/?query=*&time_range=-2d%2Cnow&order=desc&size=20&page=1&sourcegroup=all&type=timeline&_t=1422088066859&title=%E9%BB%98%E8%AE%A4&index=0"\nreferer_domain:"alltest.rizhiyi.com"\nrequest_path:"/api/v0/search/fields/"\nrequest_query:"field=tag&filters=&order=desc&page=1&query=*&size=50&sourcegroup=all&sourcegroupCn=%E6%89%80%E6%9C%89%E6%97%A5%E5%BF%97&time_range=-2d,now&type=fields"\nresp_len:363\nstatus:200\ntimestamp:"24/Jan/2015:17:03:49 +0800"\nua:"Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:35.0) Gecko/20100101 Firefox/35.0"\nversion:"1.1"\nraw_message:"192.168.1.139 - - [24/Jan/2015:17:03:49 +0800] "GET /api/v0/search/fields/?field=tag&filters=&order=desc&page=1&query=*&size=50&sourcegroup=all&sourcegroupCn=%E6%89%80%E6%9C%89%E6%97%A5%E5%BF%97&time_range=-2d,now&type=fields HTTP/1.1" 200 363 "http://alltest.rizhiyi.com/search/?query=*&time_range=-2d%2Cnow&order=desc&size=20&page=1&sourcegroup=all&type=timeline&_t=1422088066859&title=%E9%BB%98%E8%AE%A4&index=0" "Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:35.0) Gecko/20100101 Firefox/35.0""            |

  @second
  Scenario Outline: 1550、1551
    When I set the parameter "LogSample" with value "192.168.1.139 - - [24/Jan/2015:17:03:49 +0800] "GET /api/v0/search/fields/?field=tag&filters=&order=desc&page=1&query=*&size=50&sourcegroup=all&sourcegroupCn=%E6%89%80%E6%9C%89%E6%97%A5%E5%BF%97&time_range=-2d,now&type=fields HTTP/1.1" 200 363 "http://alltest.rizhiyi.com/search/?query=*&time_range=-2d%2Cnow&order=desc&size=20&page=1&sourcegroup=all&type=timeline&_t=1422088066859&title=%E9%BB%98%E8%AE%A4&index=0" "Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:35.0) Gecko/20100101 Firefox/35.0""
    And I set the parameter "Source" with value "/var/log/20180821/website"
    And I choose the "正则解析" from the "ParseRule"
    And I alter the element "ExtractSample" class to "yw-extract-sample yw-extract-sample-container"
    And I choose the "raw_message" from the "SourceField"
    And I set the parameter "Regex" with value "(?<clientip>\S+) - - \[\d+/\w+/\d+:(?<time>\S+) \+0800\](?<msg>.*)"
    And I click the "ParseButton" button
    And I wait for "SuccessMessage" will be visible
#    And I will see the success message "验证完成"
    Then I will see the element value in json "{'Result':'<result>'}"
    And I click the "ContinueButton" button
    And I choose the "正则解析" from the "ParseRule"
    And I choose the "@source" from the "SourceFieldLabel2"
    And I set the parameter "Regex2" with value "/var/log/(?<date>\d{8})/website"
    And I click the "ParseButton" button
    And I wait for "SuccessMessage" will be visible
#    And I will see the success message "验证完成"
    Then I will see the element value in json "{'Result':'<result1>'}"
    And I click the "ContinueButton" button
    And I choose the "格式化处理" from the "ParseRule"
    And I choose the "date,time" from the "SourceFieldLabel3"
    And I set the parameter "FormatRule" with value "$1 $2"
    And I set the parameter "TargetField" with value "timestamp"
    And I click the "ParseButton" button
    And I wait for "SuccessMessage" will be visible
#    And I will see the success message "验证完成"
    Then I will see the element value in json "{'Result':'<result2>'}"
    And I click the "ContinueButton" button
    And I choose the "删除字段" from the "ParseRule"
    And I choose the "date" from the "SourceFieldLabel4"
    And I click the "ParseButton" button
    And I wait for "SuccessMessage" will be visible
#    And I will see the success message "验证完成"
    And I wait for "2000" millsecond
    Then I will see the element value in json "{'Result':'<result3>'}"

    Examples:
      | result                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              | result1                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              | result2                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             | result3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            |
      | Object\nclientip:"192.168.1.139"\nmsg:" "GET /api/v0/search/fields/?field=tag&filters=&order=desc&page=1&query=*&size=50&sourcegroup=all&sourcegroupCn=%E6%89%80%E6%9C%89%E6%97%A5%E5%BF%97&time_range=-2d,now&type=fields HTTP/1.1" 200 363 "http://alltest.rizhiyi.com/search/?query=*&time_range=-2d%2Cnow&order=desc&size=20&page=1&sourcegroup=all&type=timeline&_t=1422088066859&title=%E9%BB%98%E8%AE%A4&index=0" "Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:35.0) Gecko/20100101 Firefox/35.0""\ntime:"17:03:49"\nraw_message:"192.168.1.139 - - [24/Jan/2015:17:03:49 +0800] "GET /api/v0/search/fields/?field=tag&filters=&order=desc&page=1&query=*&size=50&sourcegroup=all&sourcegroupCn=%E6%89%80%E6%9C%89%E6%97%A5%E5%BF%97&time_range=-2d,now&type=fields HTTP/1.1" 200 363 "http://alltest.rizhiyi.com/search/?query=*&time_range=-2d%2Cnow&order=desc&size=20&page=1&sourcegroup=all&type=timeline&_t=1422088066859&title=%E9%BB%98%E8%AE%A4&index=0" "Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:35.0) Gecko/20100101 Firefox/35.0"" | Object\nclientip:"192.168.1.139"\ndate:"20180821"\nmsg:" "GET /api/v0/search/fields/?field=tag&filters=&order=desc&page=1&query=*&size=50&sourcegroup=all&sourcegroupCn=%E6%89%80%E6%9C%89%E6%97%A5%E5%BF%97&time_range=-2d,now&type=fields HTTP/1.1" 200 363 "http://alltest.rizhiyi.com/search/?query=*&time_range=-2d%2Cnow&order=desc&size=20&page=1&sourcegroup=all&type=timeline&_t=1422088066859&title=%E9%BB%98%E8%AE%A4&index=0" "Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:35.0) Gecko/20100101 Firefox/35.0""\ntime:"17:03:49"\nraw_message:"192.168.1.139 - - [24/Jan/2015:17:03:49 +0800] "GET /api/v0/search/fields/?field=tag&filters=&order=desc&page=1&query=*&size=50&sourcegroup=all&sourcegroupCn=%E6%89%80%E6%9C%89%E6%97%A5%E5%BF%97&time_range=-2d,now&type=fields HTTP/1.1" 200 363 "http://alltest.rizhiyi.com/search/?query=*&time_range=-2d%2Cnow&order=desc&size=20&page=1&sourcegroup=all&type=timeline&_t=1422088066859&title=%E9%BB%98%E8%AE%A4&index=0" "Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:35.0) Gecko/20100101 Firefox/35.0"" | Object\nclientip:"192.168.1.139"\ndate:"20180821"\nmsg:" "GET /api/v0/search/fields/?field=tag&filters=&order=desc&page=1&query=*&size=50&sourcegroup=all&sourcegroupCn=%E6%89%80%E6%9C%89%E6%97%A5%E5%BF%97&time_range=-2d,now&type=fields HTTP/1.1" 200 363 "http://alltest.rizhiyi.com/search/?query=*&time_range=-2d%2Cnow&order=desc&size=20&page=1&sourcegroup=all&type=timeline&_t=1422088066859&title=%E9%BB%98%E8%AE%A4&index=0" "Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:35.0) Gecko/20100101 Firefox/35.0""\ntime:"17:03:49"\ntimestamp:"20180821 17:03:49"\nraw_message:"192.168.1.139 - - [24/Jan/2015:17:03:49 +0800] "GET /api/v0/search/fields/?field=tag&filters=&order=desc&page=1&query=*&size=50&sourcegroup=all&sourcegroupCn=%E6%89%80%E6%9C%89%E6%97%A5%E5%BF%97&time_range=-2d,now&type=fields HTTP/1.1" 200 363 "http://alltest.rizhiyi.com/search/?query=*&time_range=-2d%2Cnow&order=desc&size=20&page=1&sourcegroup=all&type=timeline&_t=1422088066859&title=%E9%BB%98%E8%AE%A4&index=0" "Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:35.0) Gecko/20100101 Firefox/35.0"" | Object\nclientip:"192.168.1.139"\nmsg:" "GET /api/v0/search/fields/?field=tag&filters=&order=desc&page=1&query=*&size=50&sourcegroup=all&sourcegroupCn=%E6%89%80%E6%9C%89%E6%97%A5%E5%BF%97&time_range=-2d,now&type=fields HTTP/1.1" 200 363 "http://alltest.rizhiyi.com/search/?query=*&time_range=-2d%2Cnow&order=desc&size=20&page=1&sourcegroup=all&type=timeline&_t=1422088066859&title=%E9%BB%98%E8%AE%A4&index=0" "Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:35.0) Gecko/20100101 Firefox/35.0""\ntime:"17:03:49"\ntimestamp:"20180821 17:03:49"\nraw_message:"192.168.1.139 - - [24/Jan/2015:17:03:49 +0800] "GET /api/v0/search/fields/?field=tag&filters=&order=desc&page=1&query=*&size=50&sourcegroup=all&sourcegroupCn=%E6%89%80%E6%9C%89%E6%97%A5%E5%BF%97&time_range=-2d,now&type=fields HTTP/1.1" 200 363 "http://alltest.rizhiyi.com/search/?query=*&time_range=-2d%2Cnow&order=desc&size=20&page=1&sourcegroup=all&type=timeline&_t=1422088066859&title=%E9%BB%98%E8%AE%A4&index=0" "Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:35.0) Gecko/20100101 Firefox/35.0"" |

  @second
  Scenario Outline: 内容替换（RZY-1556至1557）
    When I set the parameter "LogSample" with value "123abc456qwe"
    And I choose the "内容替换" from the "ParseRule"
    And I alter the element "ExtractSample" class to "yw-extract-sample yw-extract-sample-container"
    And I choose the "raw_message" from the "SourceField"
    And I set the parameter "Regex" with value "(\d+)[a-z]+"
    And I set the parameter "ReplaceContent" with value "<replaceContent>"
    And I click the "<replaceFirst>" button
    And I click the "ParseButton" button
    And I wait for "SuccessMessage" will be visible
#    And I will see the success message "验证完成"
    Then I will see the element value in json "{'Result':'<result>'}"

    Examples:
      | replaceContent | replaceFirst | result                          |
      | $1             |              | Object\nraw_message:"123456qwe" |
      | $1             | Checkbox     | Object\nraw_message:"123456"    |

  @second
  Scenario Outline: 固定电话解析（RZY-1558、RZY-1561）
    When I set the parameter "LogSample" with value "<log>"
    And I choose the "<parseRule>" from the "ParseRule"
    And I alter the element "ExtractSample" class to "yw-extract-sample yw-extract-sample-container"
    And I choose the "<field>" from the "SourceField"
    And I click the "<checkBox>" button
    And I click the "ParseButton" button
    And I wait for "SuccessMessage" will be visible
#    And I will see the success message "验证完成"
    Then I will see the element value in json "{'Result':'<result>'}"

    Examples:
      | log         | parseRule | field       | checkBox | result                                                                                                                                                 |
      | 03188433218 | 固定电话解析    | raw_message |          | Object\ngeo:Object\ncity:"衡水市"\ncountry:"中国"\nlatitude:37.72831\nlongitude:115.69151\nprovince:"河北"\ntelephone:"03188433218"\nraw_message:"03188433218" |
      | 03188433218 | 固定电话解析    | raw_message | Checkbox | Object\ncity:"衡水市"\ncountry:"中国"\nlatitude:37.72831\nlongitude:115.69151\nprovince:"河北"\nraw_message:"03188433218"                                      |

  @second
  Scenario Outline: 字段重命名（RZY-1590）
    When I set the parameter "LogSample" with value "<log>"
    And I choose the "Json解析" from the "ParseRule"
    And I alter the element "ExtractSample" class to "yw-extract-sample yw-extract-sample-container"
    And I choose the "raw_message" from the "SourceField"
    And I click the "ParseButton" button
    And I wait for "SuccessMessage" will be visible
#    And I will see the success message "验证完成"
    Then I will see the element value in json "{'Result':'<result>'}"
    And I click the "ContinueButton" button
    And I choose the "字段重命名" from the "ParseRule"
    And I set the parameter "SourceFieldInput" with value "a.b.c"
    And I set the parameter "TargetField" with value "c"
    And I click the "ParseButton" button
    And I wait for "SuccessMessage" will be visible
#    And I will see the success message "验证完成"
    Then I will see the element value in json "{'Result':'<result1>'}"

    Examples:
      | log                   | result                                                                 | result1                                            |
      | {"a":{"b":{"c":"d"}}} | Object\na:Object\nb:Object\nc:"d"\nraw_message:"{"a":{"b":{"c":"d"}}}" | Object\nc:"d"\nraw_message:"{"a":{"b":{"c":"d"}}}" |

  @second @configsSmoke
  Scenario Outline: XML解析（RZY-1546）
    When I set the parameter "LogSample" with value "<root><test><a>1</a><a>2</a></test><test>3</test></root>"
    And I choose the "XML解析" from the "ParseRule"
    And I alter the element "ExtractSample" class to "yw-extract-sample yw-extract-sample-container"
    And I choose the "raw_message" from the "SourceField"
    And I click the "ParseButton" button
    And I wait for "SuccessMessage" will be visible
#    And I will see the success message "验证完成"
    Then I will see the element value in json "{'Result':'<result>'}"

    Examples:
      | result                                                                                                                                        |
      | Object\ntest:Array[1]\n0:"3"\ntest[]:Object\na:Array[2]\n0:"1"\n1:"2"\nraw_message:"<root><test><a>1</a><a>2</a></test><test>3</test></root>" |

  @second @configsSmoke
  Scenario Outline: RZY-2798：group_regex
    When I set the parameter "LogSample" with value "<log>"
    And I alter the element "ExtractSample" class to "yw-extract-sample yw-extract-sample-container"
    And I choose the "KeyValue正则匹配" from the "ParseRule"
    And I alter the element "ExtractSample" class to "yw-extract-sample yw-extract-sample-container"
    And I choose the "raw_message" from the "SourceField"
    And I set the parameter "KeyRegex" with value "\w+"
    And I set the parameter "ValueRegex" with value "\w+"
    And I set the parameter "KVSeparator" with value "\s*=\s*"
    And I set the parameter "GroupRegex" with value "\[[^\]]*=(\w+)[^\]]*\]\s*"
    And I click the "ParseButton" button
    And I wait for "SuccessMessage" will be visible
#    And I will see the success message "验证完成"
    Then I will see the element value in json "{'Result':'<result>'}"

    Examples:
      | log                                                                                                                                                                                                                                                                                                                                                                                         | result                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             |
      | [AB Server:type=Cell]\nChildCount = 4\nMessageLimit = 12288\nOid = CA_ABS\nCellName = CA_ABS\nClientIp = 9.1.6.247\nParentOid = CA_ABS\nOutOfService = false\nChildCountLimit = 5000\nOverLoad = false\nMinuteCountLimit = 2000\n[AB Server:type=InvokeProcessor]\nAverageTaskTime = 7\nAverageTasksPerSecond = 0\nCompletedTasks = 22321\nComputeAverageInterval = 10000\nRunningTasks = 0 | Object\nCell:Object\nCellName:"CA_ABS"\nChildCount:"4"\nChildCountLimit:"5000"\nClientIp:"9"\nMessageLimit:"12288"\nMinuteCountLimit:"2000"\nOid:"CA_ABS"\nOutOfService:"false"\nOverLoad:"false"\nParentOid:"CA_ABS"\nInvokeProcessor:Object\nAverageTaskTime:"7"\nAverageTasksPerSecond:"0"\nCompletedTasks:"22321"\nComputeAverageInterval:"10000"\nRunningTasks:"0"\nraw_message:"[AB Server:type=Cell] ChildCount = 4 MessageLimit = 12288 Oid = CA_ABS CellName = CA_ABS ClientIp = 9.1.6.247 ParentOid = CA_ABS OutOfService = false ChildCountLimit = 5000 OverLoad = false MinuteCountLimit = 2000 [AB Server:type=InvokeProcessor] AverageTaskTime = 7 AverageTasksPerSecond = 0 CompletedTasks = 22321 ComputeAverageInterval = 10000 RunningTasks = 0" |

  @second
  Scenario Outline: RZY-2823、2824
    When I set the parameter "LogSample" with value "<log>"
    And I choose the "时间戳识别" from the "ParseRule"
    And I alter the element "ExtractSample" class to "yw-extract-sample yw-extract-sample-container"
    And I choose the "raw_message" from the "SourceField"
    And I set the parameter "TimeFormat" with value "dd/MMM/yyyy:HH:mm:ss Z"
    And I set the parameter "TimestampPrefix" with value "\["
    And I set the parameter "MaxMatchLength" with value "<length>"
    And I click the "ParseButton" button
    And I wait for "SuccessMessage" will be visible
#    And I will see the success message "验证完成"
    Then I will see the element value in json "{'Result':'<result>'}"

    Examples:
      | log                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  | length | result                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        |
      | 192.168.1.139 - - [24/Jan/2015:17:03:49 +0800] "GET /api/v0/search/fields/?field=tag&filters=&order=desc&page=1&query=*&size=50&sourcegroup=all&sourcegroupCn=%E6%89%80%E6%9C%89%E6%97%A5%E5%BF%97&time_range=-2d,now&type=fields HTTP/1.1" 200 363 "http://alltest.rizhiyi.com/search/?query=*&time_range=-2d%2Cnow&order=desc&size=20&page=1&sourcegroup=all&type=timeline&_t=1422088066859&title=%E9%BB%98%E8%AE%A4&index=0" "Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:35.0) Gecko/20100101 Firefox/35.0" |        | Object\ntimestamp:"2015/01/24 17:03:49.0"\nraw_message:"192.168.1.139 - - [24/Jan/2015:17:03:49 +0800] "GET /api/v0/search/fields/?field=tag&filters=&order=desc&page=1&query=*&size=50&sourcegroup=all&sourcegroupCn=%E6%89%80%E6%9C%89%E6%97%A5%E5%BF%97&time_range=-2d,now&type=fields HTTP/1.1" 200 363 "http://alltest.rizhiyi.com/search/?query=*&time_range=-2d%2Cnow&order=desc&size=20&page=1&sourcegroup=all&type=timeline&_t=1422088066859&title=%E9%BB%98%E8%AE%A4&index=0" "Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:35.0) Gecko/20100101 Firefox/35.0"" |
      | 192.168.1.139 - - [24/Jan/2015:17:03:49 +0800] "GET /api/v0/search/fields/?field=tag&filters=&order=desc&page=1&query=*&size=50&sourcegroup=all&sourcegroupCn=%E6%89%80%E6%9C%89%E6%97%A5%E5%BF%97&time_range=-2d,now&type=fields HTTP/1.1" 200 363 "http://alltest.rizhiyi.com/search/?query=*&time_range=-2d%2Cnow&order=desc&size=20&page=1&sourcegroup=all&type=timeline&_t=1422088066859&title=%E9%BB%98%E8%AE%A4&index=0" "Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:35.0) Gecko/20100101 Firefox/35.0" | 45     | Object\ntimestamp:"2015/01/24 17:03:49.0"\nraw_message:"192.168.1.139 - - [24/Jan/2015:17:03:49 +0800] "GET /api/v0/search/fields/?field=tag&filters=&order=desc&page=1&query=*&size=50&sourcegroup=all&sourcegroupCn=%E6%89%80%E6%9C%89%E6%97%A5%E5%BF%97&time_range=-2d,now&type=fields HTTP/1.1" 200 363 "http://alltest.rizhiyi.com/search/?query=*&time_range=-2d%2Cnow&order=desc&size=20&page=1&sourcegroup=all&type=timeline&_t=1422088066859&title=%E9%BB%98%E8%AE%A4&index=0" "Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:35.0) Gecko/20100101 Firefox/35.0"" |

  @all @smoke @configs @configsSmoke
  Scenario: RZY-2824：最大匹配长度（步骤1）
    When I set the parameter "LogSample" with value "192.168.1.139 - - [24/Jan/2015:17:03:49 +0800] "GET /api/v0/search/fields/?field=tag&filters=&order=desc&page=1&query=*&size=50&sourcegroup=all&sourcegroupCn=%E6%89%80%E6%9C%89%E6%97%A5%E5%BF%97&time_range=-2d,now&type=fields HTTP/1.1" 200 363 "http://alltest.rizhiyi.com/search/?query=*&time_range=-2d%2Cnow&order=desc&size=20&page=1&sourcegroup=all&type=timeline&_t=1422088066859&title=%E9%BB%98%E8%AE%A4&index=0" "Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:35.0) Gecko/20100101 Firefox/35.0""
    And I choose the "时间戳识别" from the "ParseRule"
    And I alter the element "ExtractSample" class to "yw-extract-sample yw-extract-sample-container"
    And I choose the "raw_message" from the "SourceField"
    And I set the parameter "TimeFormat" with value "dd/MMM/yyyy:HH:mm:ss Z"
    And I set the parameter "TimestampPrefix" with value "\["
    And I set the parameter "MaxMatchLength" with value "44"
    And I click the "ParseButton" button
    Then I will see the error message contains "解析失败"

  @second @configsSmoke
  Scenario Outline: RZY-2802、2803
    When I set the parameter "LogSample" with value "18840824121"
    And I choose the "手机号码解析" from the "ParseRule"
    And I alter the element "ExtractSample" class to "yw-extract-sample yw-extract-sample-container"
    And I choose the "raw_message" from the "SourceField"
    And I "<check>" the checkbox which name is "<label>"
    And I click the "ParseButton" button
    And I wait for "SuccessMessage" will be visible
#    And I will see the success message "验证完成"
    Then I will see the element value in json "{'Result':'<result>'}"

    Examples:
      | check   | label   | result                                                                                                                                                          |
      |         |         | Object\ngeo:Object\ncity:"大连市"\ncountry:"中国"\nisp:"中国移动"\nlatitude:38.94381\nlongitude:121.57652\nphone:"18840824121"\nprovince:"辽宁"\nraw_message:"18840824121" |
      | checked | 解析到顶层字段 | Object\ncity:"大连市"\ncountry:"中国"\nisp:"中国移动"\nlatitude:38.94381\nlongitude:121.57652\nprovince:"辽宁"\nraw_message:"18840824121"                                  |

  @second @configsSmoke
  Scenario Outline: RZY-2865、2866
    When I set the parameter "LogSample" with value "<log>"
    And I choose the "Json解析" from the "ParseRule"
    And I alter the element "ExtractSample" class to "yw-extract-sample yw-extract-sample-container"
    And I choose the "raw_message" from the "SourceField"
    And I click the "ParseButton" button
    And I wait for "SuccessMessage" will be visible
#    And I will see the success message "验证完成"
    Then I will see the element value in json "{'Result':'<result>'}"
    And I click the "ContinueButton" button
    And I choose the "字段重命名" from the "ParseRule"
    And I set the parameter "SourceFieldInput" with value "a.*.c"
    And I set the parameter "TargetField" with value "a.*.h"
    And I click the "ParseButton" button
    And I wait for "SuccessMessage" will be visible
#    And I will see the success message "验证完成"
    Then I will see the element value in json "{'Result':'<result1>'}"

    Examples:
      | log                                       | result                                                                                                   | result1                                                                                                  |
      | {"a":{"b":\n{"c":"d"}\n,"e":{"c":"g"}}\n} | Object\na:Object\nb:Object\nc:"d"\ne:Object\nc:"g"\nraw_message:"{"a":{"b": {"c":"d"} ,"e":{"c":"g"}} }" | Object\na:Object\nb:Object\nh:"d"\ne:Object\nh:"g"\nraw_message:"{"a":{"b": {"c":"d"} ,"e":{"c":"g"}} }" |

  @second @configsSmoke
  Scenario Outline: RZY-2819：配置自定义字典解析规则
    When I set the parameter "LogSample" with value "{"Category":"","ComputerName":"WIN-999OGBVAHMI","EventCode":7036,"EventIdentifier":1073748860,"EventType":3,"Logfile":"System","Message":"Application Experience 服务处于 正在运行 状态。","RecordNumber":108343,"SourceName":"Service Control Manager","User":"","TimeGenerated":"2015-01-04T20:45:09+08:00"}"
    And I choose the "Json解析" from the "ParseRule"
    And I alter the element "ExtractSample" class to "yw-extract-sample yw-extract-sample-container"
    And I choose the "raw_message" from the "SourceField"
    And I click the "ParseButton" button
    And I click the "ContinueButton" button
    And I choose the "自定义字典" from the "ParseRule"
    And I choose the "raw_message" from the "SourceField"
    And I choose the "win_sys_sourcename.csv" from the "Dictionary"
    And I choose the "sourcename" from the "BaseField"
    And I choose the "level,source" from the "ExtendField"
    And I click the "ParseButton" button
    And I wait for "SuccessMessage" will be visible
#    And I will see the success message "验证完成"
    Then I will see the element value in json "{'Result':'<result>'}"

    Examples:
      | result                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           |
      | Object\nCategory:""\nComputerName:"WIN-999OGBVAHMI"\nEventCode:7036\nEventIdentifier:1073748860\nEventType:3\nLogfile:"System"\nMessage:"Application Experience 服务处于 正在运行 状态。"\nRecordNumber:108343\nSourceName:"Service Control Manager"\nTimeGenerated:"2015-01-04T20:45:09+08:00"\nUser:""\nraw_message:"{"Category":"","ComputerName":"WIN-999OGBVAHMI","EventCode":7036,"EventIdentifier":1073748860,"EventType":3,"Logfile":"System","Message":"Application Experience 服务处于 正在运行 状态。","RecordNumber":108343,"SourceName":"Service Control Manager","User":"","TimeGenerated":"2015-01-04T20:45:09+08:00"}" |

  @second @configsSmoke
  Scenario Outline: RZY-2825：hex转换
    When I set the parameter "LogSample" with value "e5a4a7e9bb91e5b1b1"
    And I choose the "Hex转换" from the "ParseRule"
    And I alter the element "ExtractSample" class to "yw-extract-sample yw-extract-sample-container"
    And I choose the "raw_message" from the "SourceField"
    And I set the parameter "Code" with value "utf-8"
    And I click the "ParseButton" button
    And I wait for "SuccessMessage" will be visible
#    And I will see the success message "验证完成"
    Then I will see the element value in json "{'Result':'<result>'}"

    Examples:
      | result                    |
      | Object\nraw_message:"大黑山" |

  @second @configsSmoke
  Scenario Outline: RZY-2862、2863：（非）严格解析
    When I set the parameter "LogSample" with value "aaa 111"
    And I choose the "结构体解析" from the "ParseRule"
    And I alter the element "ExtractSample" class to "yw-extract-sample yw-extract-sample-container"
    And I choose the "raw_message" from the "SourceField"
    And I set the parameter "Struct" with value "<struct>"
    And I "checked" the checkbox which name is "<checkbox>"
    And I click the "ParseButton" button
    And I wait for "SuccessMessage" will be visible
#    And I will see the success message "验证完成"
    Then I will see the element value in json "{'Result':'<result>'}"

    Examples:
      | struct         | checkbox | result                                             |
      | name:3,val:4:i | 是否严格解析   | Object\nname:"aaa"\nval:111\nraw_message:"aaa 111" |
      | name:3,val:3:i |          | Object\nname:"aaa"\nval:11\nraw_message:"aaa 111"  |

  @second
  Scenario Outline: RZY-2826:高级模式下start_offset的使用
    When I set the parameter "LogSample" with value "00000000: 696d 706f 7274 2073 7973 0a69 6d70 6f72"
    And I choose the "Hex转换" from the "ParseRule"
    And I alter the element "ExtractSample" class to "yw-extract-sample yw-extract-sample-container"
    And I click the "ChangeToJson" button under some element
    And I set the parameter "{"source": "raw_message","codec_type": "GBK","start_offset":10,"column_bytes":16}" to json editor
    And I click the "ParseButton" button
    And I wait for "SuccessMessage" will be visible
#    And I will see the success message "验证完成"
    Then I will see the element value in json "{'Result':'<result>'}"

    Examples:
      | result                                 |
      | Object\nraw_message:"import sys impor" |

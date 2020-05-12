@configsSmoke
Feature: 字段提取KeyValue正则匹配

  Background:
    Given open the "configs.ListPage" page for uri "/configs/"
    Then I wait for loading invisible


  Scenario Outline: RZY-1535:KeyValue正则匹配
    And I click the "Create" button
    Then I will see the "configs.CreatePage" page
    When I set the parameter "LogSample" with value "<190>May 18 11:20:10 2016 HLJ_S12508_1_FW %%10FILTER/6/ZONE_DP_FLT_EXECUTION_TCP_LOG(l): -DEV_TYPE=SECPATH-PN=210231A0H6010C000002; srcZoneName(1034)=serveruntrust;destZoneName(1035)=servertrust;rule_ID(1070)=90;policyActType(1071)=denied;protType(1001)=TCP(6);srcIPAddr(1017)=10.167.77.99;destIPAddr(1019)=10.166.5.70;srcPortNum(1018)=49362;destPortNum(1020)=1521;beginTime_e(1013)=05182016112009;endTime_e(1014)=05182016112009;"
    And I click the "AddRule" button
    And I choose the "正则解析" from the "ParseRule"
    And I choose the "raw_message" from the "SourceField"
    And I set the parameter "Regex" with value "<%{NOTSPACE:id}>(?<timestamp>%{NOTSPACE}\s+%{NOTSPACE}\s+%{NOTSPACE}\s+%{NOTSPACE}\s+)%{NOTSPACE:host} \%\%(?<vendor>[^/]*)/(?<severity>[^/]*)/(?<MNEMONIC>[^:]*): -DEV_TYPE=SECPATH-PN=210231A0H6010C000002; (?<message>.*)"
    And I click the "EnsureAddParseRule" button
    And I wait for "ParseButton" will be visible
    Then I wait for "1000" millsecond
    And I click the "ParseButton" button
    And I wait for "CheckSuccess" will be visible
    Then I will see the element value in json "{'Result':'<result>'}"
    And I click the "AddRule" button
    And I choose the "KeyValue正则匹配" from the "ParseRule"
    And I choose the "message" from the "SourceField"
    And I set the parameter "KeyRegex" with value "[^=;]+"
    And I set the parameter "ValueRegex" with value "[^=;]+"
    And I set the parameter "KVSeparator" with value "="
    And I click the "EnsureAddParseRule" button
    And I wait for "ParseButton" will be visible
    Then I wait for "1000" millsecond
    And I click the "ParseButton" button
    And I wait for "CheckSuccess2" will be visible
    Then I will see the element value in json "{'Result':'<result1>'}"
    And I click the "NextButton" button under some element
    And I click the "SwitchButton" button
    When I set the parameter "Name" with value "RZY1535KeyValue正则匹配"
    And I set the parameter "Logtype" with value "other"
    And I set the parameter "AppName" with value "<appName>"
    And I set the parameter "Tag" with value "<appName>"
    And I click the "Done" button
    Then I wait for "ConfigDone" will be visible
    When open the "localUpload.ListPage" page for uri "/sources/input/os/"
    And I set the parameter "AppName" with value "<appName>"
    And I set the parameter "Tag" with value "<appName>"
    And I upload a file with name "/src/test/resources/testdata/log/<log>"
    And I click the "UploadButton" button
    And I wait for element "VerifyText" change text to "上传完成"
    Then I wait for "40000" millsecond
    When open the "splSearch.SearchPage" page for uri "/search/"
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I set the parameter "SearchInput" with value "tag:<appName>"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    Then I move the mouse pointer to the "Result"
    And I click the "RightIcon" button
    Then I will see the spl search result "<searchResult>"

    Examples:
      | appName      | log    | result                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      | result1                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          | searchResult                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        |
      | auto_test_KV | KV.log | Object\nMNEMONIC:"ZONE_DP_FLT_EXECUTION_TCP_LOG(l)"\nhost:"HLJ_S12508_1_FW"\nid:"190"\nmessage:"srcZoneName(1034)=serveruntrust;destZoneName(1035)=servertrust;rule_ID(1070)=90;policyActType(1071)=denied;protType(1001)=TCP(6);srcIPAddr(1017)=10.167.77.99;destIPAddr(1019)=10.166.5.70;srcPortNum(1018)=49362;destPortNum(1020)=1521;beginTime_e(1013)=05182016112009;endTime_e(1014)=05182016112009;"\nseverity:"6"\ntimestamp:"May 18 11:20:10 2016 "\nvendor:"10FILTER"\nraw_message:"<190>May 18 11:20:10 2016 HLJ_S12508_1_FW %%10FILTER/6/ZONE_DP_FLT_EXECUTION_TCP_LOG(l): -DEV_TYPE=SECPATH-PN=210231A0H6010C000002; srcZoneName(1034)=serveruntrust;destZoneName(1035)=servertrust;rule_ID(1070)=90;policyActType(1071)=denied;protType(1001)=TCP(6);srcIPAddr(1017)=10.167.77.99;destIPAddr(1019)=10.166.5.70;srcPortNum(1018)=49362;destPortNum(1020)=1521;beginTime_e(1013)=05182016112009;endTime_e(1014)=05182016112009;" | Object\nMNEMONIC:"ZONE_DP_FLT_EXECUTION_TCP_LOG(l)"\nhost:"HLJ_S12508_1_FW"\nid:"190"\nmessage:Object\nbeginTime_e(1013):"05182016112009"\ndestIPAddr(1019):"10.166.5.70"\ndestPortNum(1020):"1521"\ndestZoneName(1035):"servertrust"\nendTime_e(1014):"05182016112009"\npolicyActType(1071):"denied"\nprotType(1001):"TCP(6)"\nrule_ID(1070):"90"\nsrcIPAddr(1017):"10.167.77.99"\nsrcPortNum(1018):"49362"\nsrcZoneName(1034):"serveruntrust"\nseverity:"6"\ntimestamp:"May 18 11:20:10 2016 "\nvendor:"10FILTER"\nraw_message:"<190>May 18 11:20:10 2016 HLJ_S12508_1_FW %%10FILTER/6/ZONE_DP_FLT_EXECUTION_TCP_LOG(l): -DEV_TYPE=SECPATH-PN=210231A0H6010C000002; srcZoneName(1034)=serveruntrust;destZoneName(1035)=servertrust;rule_ID(1070)=90;policyActType(1071)=denied;protType(1001)=TCP(6);srcIPAddr(1017)=10.167.77.99;destIPAddr(1019)=10.166.5.70;srcPortNum(1018)=49362;destPortNum(1020)=1521;beginTime_e(1013)=05182016112009;endTime_e(1014)=05182016112009;" | {'other.MNEMONIC':'other.MNEMONIC：ZONE_DP_FLT_EXECUTION_TCP_LOG(l) ','other.host':'other.host：HLJ_S12508_1_FW ','other.id':'other.id：190 ','other.message.beginTime_e(1013)':'other.message.beginTime_e(1013)：05182016112009 ','other.message.destIPAddr(1019)':'other.message.destIPAddr(1019)：10.166.5.70 ','other.message.destPortNum(1020)':'other.message.destPortNum(1020)：1521 ','other.message.destZoneName(1035)':'other.message.destZoneName(1035)：servertrust ','other.message.endTime_e(1014)':'other.message.endTime_e(1014)：05182016112009 ','other.message.policyActType(1071)':'other.message.policyActType(1071)：denied ','other.message.protType(1001)':'other.message.protType(1001)：TCP(6) ','other.message.rule_ID(1070)':'other.message.rule_ID(1070)：90 ','other.message.srcIPAddr(1017)':'other.message.srcIPAddr(1017)：10.167.77.99 ','other.message.srcPortNum(1018)':'other.message.srcPortNum(1018)：49362 ','other.message.srcZoneName(1034)':'other.message.srcZoneName(1034)：serveruntrust ','other.severity':'other.severity：6 ','other.timestamp':'other.timestamp：May 18 11:20:10 2016  ','other.vendor':'other.vendor：10FILTER '} |


  Scenario Outline: RZY-2798：group_regex

    And I click the "Create" button
    Then I will see the "configs.CreatePage" page
    When I set the parameter "LogSample" with value "[AB Server:type=Cell] ChildCount = 4 MessageLimit = 12288 Oid = CA_ABS CellName = CA_ABS ClientIp = 9.1.6.247 ParentOid = CA_ABS OutOfService = false ChildCountLimit = 5000 OverLoad = false MinuteCountLimit = 2000 [AB Server:type=InvokeProcessor] AverageTaskTime = 7 AverageTasksPerSecond = 0 CompletedTasks = 22321 ComputeAverageInterval = 10000 RunningTasks = 0"
    And I click the "AddRule" button
    And I choose the "KeyValue正则匹配" from the "ParseRule"
    And I choose the "raw_message" from the "SourceField"
    And I set the parameter "KeyRegex" with value "\w+"
    And I set the parameter "ValueRegex" with value "\w+"
    And I set the parameter "KVSeparator" with value "\s*=\s*"
    And I set the parameter "GroupRegex" with value "\[[^\]]*=(\w+)[^\]]*\]\s*"
    And I click the "EnsureAddParseRule" button
    And I wait for "ParseButton" will be visible
    Then I wait for "1000" millsecond
    And I click the "ParseButton" button
    And I wait for "CheckSuccess" will be visible
    Then I will see the element value in json "{'Result':'<result>'}"
    And I click the "NextButton" button under some element
    And I click the "SwitchButton" button
    When I set the parameter "Name" with value "RZY2798group_regex"
    And I set the parameter "Logtype" with value "test"
    And I set the parameter "AppName" with value "<appName>"
    And I set the parameter "Tag" with value "<appName>"
    And I click the "Done" button
    Then I wait for "ConfigDone" will be visible
    When open the "localUpload.ListPage" page for uri "/sources/input/os/"
    And I set the parameter "AppName" with value "<appName>"
    And I set the parameter "Tag" with value "<appName>"
    And I upload a file with name "/src/test/resources/testdata/log/<log>"
    And I click the "UploadButton" button
    And I wait for element "VerifyText" change text to "上传完成"
    Then I wait for "40000" millsecond
    When open the "splSearch.SearchPage" page for uri "/search/"
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I set the parameter "SearchInput" with value "tag:<appName>"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    Then I move the mouse pointer to the "Result"
    And I click the "RightIcon" button
    Then I will see the spl search result "<searchResult>"

    Examples:
      | log          | appName            | result                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             | searchResult                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  |
      | KV_group.log | auto_test_KV_group | Object\nCell:Object\nCellName:"CA_ABS"\nChildCount:"4"\nChildCountLimit:"5000"\nClientIp:"9"\nMessageLimit:"12288"\nMinuteCountLimit:"2000"\nOid:"CA_ABS"\nOutOfService:"false"\nOverLoad:"false"\nParentOid:"CA_ABS"\nInvokeProcessor:Object\nAverageTaskTime:"7"\nAverageTasksPerSecond:"0"\nCompletedTasks:"22321"\nComputeAverageInterval:"10000"\nRunningTasks:"0"\nraw_message:"[AB Server:type=Cell] ChildCount = 4 MessageLimit = 12288 Oid = CA_ABS CellName = CA_ABS ClientIp = 9.1.6.247 ParentOid = CA_ABS OutOfService = false ChildCountLimit = 5000 OverLoad = false MinuteCountLimit = 2000 [AB Server:type=InvokeProcessor] AverageTaskTime = 7 AverageTasksPerSecond = 0 CompletedTasks = 22321 ComputeAverageInterval = 10000 RunningTasks = 0" | {'test.Cell.CellName':'test.Cell.CellName：CA_ABS ','test.Cell.ChildCount':'test.Cell.ChildCount：4 ','test.Cell.ChildCountLimit':'test.Cell.ChildCountLimit：5000 ','test.Cell.ClientIp':'test.Cell.ClientIp：9 ','test.Cell.MessageLimit':'test.Cell.MessageLimit：12288 ','test.Cell.MinuteCountLimit':'test.Cell.MinuteCountLimit：2000 ','test.Cell.Oid':'test.Cell.Oid：CA_ABS ','test.Cell.OutOfService':'test.Cell.OutOfService：false ','test.Cell.OverLoad':'test.Cell.OverLoad：false ','test.Cell.ParentOid':'test.Cell.ParentOid：CA_ABS ','test.InvokeProcessor.AverageTaskTime':'test.InvokeProcessor.AverageTaskTime：7 ','test.InvokeProcessor.AverageTasksPerSecond':'test.InvokeProcessor.AverageTasksPerSecond：0 ','test.InvokeProcessor.CompletedTasks':'test.InvokeProcessor.CompletedTasks：22321 ','test.InvokeProcessor.ComputeAverageInterval':'test.InvokeProcessor.ComputeAverageInterval：10000 ','test.InvokeProcessor.RunningTasks':'test.InvokeProcessor.RunningTasks：0 '} |


  Scenario Outline: KeyValue正则匹配详情验证
    And I click the "Create" button
    Then I will see the "configs.CreatePage" page
    When I set the parameter "LogSample" with value "<190>May 18 11:20:10 2016 HLJ_S12508_1_FW %%10FILTER/6/ZONE_DP_FLT_EXECUTION_TCP_LOG(l): -DEV_TYPE=SECPATH-PN=210231A0H6010C000002; srcZoneName(1034)=serveruntrust;destZoneName(1035)=servertrust;rule_ID(1070)=90;policyActType(1071)=denied;protType(1001)=TCP(6);srcIPAddr(1017)=10.167.77.99;destIPAddr(1019)=10.166.5.70;srcPortNum(1018)=49362;destPortNum(1020)=1521;beginTime_e(1013)=05182016112009;endTime_e(1014)=05182016112009;"
    And I click the "AddRule" button
    And I choose the "正则解析" from the "ParseRule"
    And I choose the "raw_message" from the "SourceField"
    And I set the parameter "Regex" with value "<%{NOTSPACE:id}>(?<timestamp>%{NOTSPACE}\s+%{NOTSPACE}\s+%{NOTSPACE}\s+%{NOTSPACE}\s+)%{NOTSPACE:host} \%\%(?<vendor>[^/]*)/(?<severity>[^/]*)/(?<MNEMONIC>[^:]*): -DEV_TYPE=SECPATH-PN=210231A0H6010C000002; (?<message>.*)"
    And I click the "EnsureAddParseRule" button
    And I wait for "ParseButton" will be visible
    Then I wait for "1000" millsecond
    And I click the "ParseButton" button
    And I wait for "CheckSuccess" will be visible
    Then I will see the element value in json "{'Result':'<result>'}"
    And I click the "AddRule" button
    And I choose the "KeyValue正则匹配" from the "ParseRule"
    And I choose the "message" from the "SourceField"
    And I set the parameter "KeyRegex" with value "[^=;]+"
    And I set the parameter "ValueRegex" with value "[^=;]+"
    And I set the parameter "KVSeparator" with value "="
    And I click the "EnsureAddParseRule" button
    And I wait for "ParseButton" will be visible
    Then I wait for "1000" millsecond
    And I click the "ParseButton" button
    And I wait for "CheckSuccess2" will be visible
    Then I will see the element value in json "{'Result':'<result1>'}"
    And I click the "NextButton" button under some element
    And I click the "SwitchButton" button
    When I set the parameter "Name" with value "<name>"
    And I set the parameter "Logtype" with value "other"
    And I set the parameter "AppName" with value "<appName>"
    And I set the parameter "Tag" with value "<appName>"
    And I click the "Done" button
    Then I wait for "ConfigDone" will be visible
    When open the "localUpload.ListPage" page for uri "/sources/input/os/"
    And I set the parameter "AppName" with value "<appName>"
    And I set the parameter "Tag" with value "<appName>"
    And I upload a file with name "/src/test/resources/testdata/log/<log>"
    And I click the "UploadButton" button
    And I wait for element "VerifyText" change text to "上传完成"
    Then I wait for "90000" millsecond
    Given open the "configs.ListPage" page for uri "/configs/"
    When the data name is "{'column':'1','name':'<name>'}" then i click the "详情" button
    And I wait for loading invisible
    Then I will see the config element "<rule1>" value is "<rule1> 1 1 0 0 0"
    Then I will see the config element "<rule2>" value is "<rule2> 1 1 0 0 0"

    Examples:
      | name             | rule1        | rule2 | appName   | log    | result                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      | result1                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          |
      | KeyValue正则匹配详情验证 | KeyValue正则匹配 | 正则解析  | KV_detail | KV.log | Object\nMNEMONIC:"ZONE_DP_FLT_EXECUTION_TCP_LOG(l)"\nhost:"HLJ_S12508_1_FW"\nid:"190"\nmessage:"srcZoneName(1034)=serveruntrust;destZoneName(1035)=servertrust;rule_ID(1070)=90;policyActType(1071)=denied;protType(1001)=TCP(6);srcIPAddr(1017)=10.167.77.99;destIPAddr(1019)=10.166.5.70;srcPortNum(1018)=49362;destPortNum(1020)=1521;beginTime_e(1013)=05182016112009;endTime_e(1014)=05182016112009;"\nseverity:"6"\ntimestamp:"May 18 11:20:10 2016 "\nvendor:"10FILTER"\nraw_message:"<190>May 18 11:20:10 2016 HLJ_S12508_1_FW %%10FILTER/6/ZONE_DP_FLT_EXECUTION_TCP_LOG(l): -DEV_TYPE=SECPATH-PN=210231A0H6010C000002; srcZoneName(1034)=serveruntrust;destZoneName(1035)=servertrust;rule_ID(1070)=90;policyActType(1071)=denied;protType(1001)=TCP(6);srcIPAddr(1017)=10.167.77.99;destIPAddr(1019)=10.166.5.70;srcPortNum(1018)=49362;destPortNum(1020)=1521;beginTime_e(1013)=05182016112009;endTime_e(1014)=05182016112009;" | Object\nMNEMONIC:"ZONE_DP_FLT_EXECUTION_TCP_LOG(l)"\nhost:"HLJ_S12508_1_FW"\nid:"190"\nmessage:Object\nbeginTime_e(1013):"05182016112009"\ndestIPAddr(1019):"10.166.5.70"\ndestPortNum(1020):"1521"\ndestZoneName(1035):"servertrust"\nendTime_e(1014):"05182016112009"\npolicyActType(1071):"denied"\nprotType(1001):"TCP(6)"\nrule_ID(1070):"90"\nsrcIPAddr(1017):"10.167.77.99"\nsrcPortNum(1018):"49362"\nsrcZoneName(1034):"serveruntrust"\nseverity:"6"\ntimestamp:"May 18 11:20:10 2016 "\nvendor:"10FILTER"\nraw_message:"<190>May 18 11:20:10 2016 HLJ_S12508_1_FW %%10FILTER/6/ZONE_DP_FLT_EXECUTION_TCP_LOG(l): -DEV_TYPE=SECPATH-PN=210231A0H6010C000002; srcZoneName(1034)=serveruntrust;destZoneName(1035)=servertrust;rule_ID(1070)=90;policyActType(1071)=denied;protType(1001)=TCP(6);srcIPAddr(1017)=10.167.77.99;destIPAddr(1019)=10.166.5.70;srcPortNum(1018)=49362;destPortNum(1020)=1521;beginTime_e(1013)=05182016112009;endTime_e(1014)=05182016112009;" |


  Scenario Outline: group_regex详情验证

    And I click the "Create" button
    Then I will see the "configs.CreatePage" page
    When I set the parameter "LogSample" with value "[AB Server:type=Cell] ChildCount = 4 MessageLimit = 12288 Oid = CA_ABS CellName = CA_ABS ClientIp = 9.1.6.247 ParentOid = CA_ABS OutOfService = false ChildCountLimit = 5000 OverLoad = false MinuteCountLimit = 2000 [AB Server:type=InvokeProcessor] AverageTaskTime = 7 AverageTasksPerSecond = 0 CompletedTasks = 22321 ComputeAverageInterval = 10000 RunningTasks = 0"
    And I click the "AddRule" button
    And I choose the "KeyValue正则匹配" from the "ParseRule"
    And I choose the "raw_message" from the "SourceField"
    And I set the parameter "KeyRegex" with value "\w+"
    And I set the parameter "ValueRegex" with value "\w+"
    And I set the parameter "KVSeparator" with value "\s*=\s*"
    And I set the parameter "GroupRegex" with value "\[[^\]]*=(\w+)[^\]]*\]\s*"
    And I click the "EnsureAddParseRule" button
    And I wait for "ParseButton" will be visible
    Then I wait for "1000" millsecond
    And I click the "ParseButton" button
    And I wait for "CheckSuccess" will be visible
    Then I will see the element value in json "{'Result':'<result>'}"
    And I click the "NextButton" button under some element
    And I click the "SwitchButton" button
    When I set the parameter "Name" with value "<name>"
    And I set the parameter "Logtype" with value "test"
    And I set the parameter "AppName" with value "<appName>"
    And I set the parameter "Tag" with value "<appName>"
    And I click the "Done" button
    Then I wait for "ConfigDone" will be visible
    When open the "localUpload.ListPage" page for uri "/sources/input/os/"
    And I set the parameter "AppName" with value "<appName>"
    And I set the parameter "Tag" with value "<appName>"
    And I upload a file with name "/src/test/resources/testdata/log/<log>"
    And I click the "UploadButton" button
    And I wait for element "VerifyText" change text to "上传完成"
    Then I wait for "90000" millsecond
    Given open the "configs.ListPage" page for uri "/configs/"
    When the data name is "{'column':'1','name':'<name>'}" then i click the "详情" button
    And I wait for loading invisible
    Then I will see the config element "<rule1>" value is "<rule1> 1 1 0 0 0"

    Examples:
      | name               | rule1        | log          | appName            | result                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             |
      | group_regex详情验证 | KeyValue正则匹配 | KV_group.log | KV_group_detail | Object\nCell:Object\nCellName:"CA_ABS"\nChildCount:"4"\nChildCountLimit:"5000"\nClientIp:"9"\nMessageLimit:"12288"\nMinuteCountLimit:"2000"\nOid:"CA_ABS"\nOutOfService:"false"\nOverLoad:"false"\nParentOid:"CA_ABS"\nInvokeProcessor:Object\nAverageTaskTime:"7"\nAverageTasksPerSecond:"0"\nCompletedTasks:"22321"\nComputeAverageInterval:"10000"\nRunningTasks:"0"\nraw_message:"[AB Server:type=Cell] ChildCount = 4 MessageLimit = 12288 Oid = CA_ABS CellName = CA_ABS ClientIp = 9.1.6.247 ParentOid = CA_ABS OutOfService = false ChildCountLimit = 5000 OverLoad = false MinuteCountLimit = 2000 [AB Server:type=InvokeProcessor] AverageTaskTime = 7 AverageTasksPerSecond = 0 CompletedTasks = 22321 ComputeAverageInterval = 10000 RunningTasks = 0" |


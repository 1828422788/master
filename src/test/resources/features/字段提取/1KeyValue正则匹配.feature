@configsSmoke
Feature: 字段提取KeyValue正则匹配

  Scenario Outline: RZY-1535:KeyValue正则匹配
    Given open the "configs.ListPage" page for uri "/configs/"
    And I click the "CreateButton" button
    Then I will see the "configs.CreatePage" page
    When I set the parameter "LogSample" with value "<190>May 18 11:20:10 2016 HLJ_S12508_1_FW %%10FILTER/6/ZONE_DP_FLT_EXECUTION_TCP_LOG(l): -DEV_TYPE=SECPATH-PN=210231A0H6010C000002; srcZoneName(1034)=serveruntrust;destZoneName(1035)=servertrust;rule_ID(1070)=90;policyActType(1071)=denied;protType(1001)=TCP(6);srcIPAddr(1017)=10.167.77.99;destIPAddr(1019)=10.166.5.70;srcPortNum(1018)=49362;destPortNum(1020)=1521;beginTime_e(1013)=05182016112009;endTime_e(1014)=05182016112009;"
    And I click the "AddRule" button
    And I choose the "正则解析" from the "ParseRule"
    And I choose the "raw_message" from the "SourceField"
    And I set the parameter "Regex" with value "<%{NOTSPACE:id}>(?<timestamp>%{NOTSPACE}\s+%{NOTSPACE}\s+%{NOTSPACE}\s+%{NOTSPACE}\s+)%{NOTSPACE:host} \%\%(?<vendor>[^/]*)/(?<severity>[^/]*)/(?<MNEMONIC>[^:]*): -DEV_TYPE=SECPATH-PN=210231A0H6010C000002; (?<message>.*)"
    And I click the "EnsureAddParseRule" button
    And I wait for "ParseButton" will be visible
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
    And I click the "ParseButton" button
    And I wait for "CheckSuccess2" will be visible
    Then I will see the element value in json "{'Result':'<result1>'}"
    And I click the "NextButton" button under some element
    When I set the parameter "Name" with value "RZY1535KeyValue正则匹配"
    And I set the parameter "Logtype" with value "other"
    And I set the parameter "AppName" with value "auto_test_KV"
    And I set the parameter "Tag" with value "auto_test_KV"
    And I click the "NextButton" button
    Then I wait for "ConfigDone" will be visible

    Examples:
      | result                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      | result1                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          |
      | Object\nMNEMONIC:"ZONE_DP_FLT_EXECUTION_TCP_LOG(l)"\nhost:"HLJ_S12508_1_FW"\nid:"190"\nmessage:"srcZoneName(1034)=serveruntrust;destZoneName(1035)=servertrust;rule_ID(1070)=90;policyActType(1071)=denied;protType(1001)=TCP(6);srcIPAddr(1017)=10.167.77.99;destIPAddr(1019)=10.166.5.70;srcPortNum(1018)=49362;destPortNum(1020)=1521;beginTime_e(1013)=05182016112009;endTime_e(1014)=05182016112009;"\nseverity:"6"\ntimestamp:"May 18 11:20:10 2016 "\nvendor:"10FILTER"\nraw_message:"<190>May 18 11:20:10 2016 HLJ_S12508_1_FW %%10FILTER/6/ZONE_DP_FLT_EXECUTION_TCP_LOG(l): -DEV_TYPE=SECPATH-PN=210231A0H6010C000002; srcZoneName(1034)=serveruntrust;destZoneName(1035)=servertrust;rule_ID(1070)=90;policyActType(1071)=denied;protType(1001)=TCP(6);srcIPAddr(1017)=10.167.77.99;destIPAddr(1019)=10.166.5.70;srcPortNum(1018)=49362;destPortNum(1020)=1521;beginTime_e(1013)=05182016112009;endTime_e(1014)=05182016112009;" | Object\nMNEMONIC:"ZONE_DP_FLT_EXECUTION_TCP_LOG(l)"\nhost:"HLJ_S12508_1_FW"\nid:"190"\nmessage:Object\nbeginTime_e(1013):"05182016112009"\ndestIPAddr(1019):"10.166.5.70"\ndestPortNum(1020):"1521"\ndestZoneName(1035):"servertrust"\nendTime_e(1014):"05182016112009"\npolicyActType(1071):"denied"\nprotType(1001):"TCP(6)"\nrule_ID(1070):"90"\nsrcIPAddr(1017):"10.167.77.99"\nsrcPortNum(1018):"49362"\nsrcZoneName(1034):"serveruntrust"\nseverity:"6"\ntimestamp:"May 18 11:20:10 2016 "\nvendor:"10FILTER"\nraw_message:"<190>May 18 11:20:10 2016 HLJ_S12508_1_FW %%10FILTER/6/ZONE_DP_FLT_EXECUTION_TCP_LOG(l): -DEV_TYPE=SECPATH-PN=210231A0H6010C000002; srcZoneName(1034)=serveruntrust;destZoneName(1035)=servertrust;rule_ID(1070)=90;policyActType(1071)=denied;protType(1001)=TCP(6);srcIPAddr(1017)=10.167.77.99;destIPAddr(1019)=10.166.5.70;srcPortNum(1018)=49362;destPortNum(1020)=1521;beginTime_e(1013)=05182016112009;endTime_e(1014)=05182016112009;" |

  Scenario Outline: RZY-2798：group_regex
    Given open the "configs.ListPage" page for uri "/configs/"
    And I click the "CreateButton" button
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
    And I click the "ParseButton" button
    And I wait for "CheckSuccess" will be visible
    Then I will see the element value in json "{'Result':'<result>'}"
    And I click the "NextButton" button under some element
    And I click the "SwitchButton" button
    When I set the parameter "Name" with value "RZY2798group_regex"
    And I set the parameter "Logtype" with value "test"
    And I set the parameter "AppName" with value "auto_test_KV_group"
    And I set the parameter "Tag" with value "auto_test_KV_group"
    And I click the "NextButton" button
    Then I wait for "ConfigDone" will be visible

    Examples:
      | result                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             |
      | Object\nCell:Object\nCellName:"CA_ABS"\nChildCount:"4"\nChildCountLimit:"5000"\nClientIp:"9"\nMessageLimit:"12288"\nMinuteCountLimit:"2000"\nOid:"CA_ABS"\nOutOfService:"false"\nOverLoad:"false"\nParentOid:"CA_ABS"\nInvokeProcessor:Object\nAverageTaskTime:"7"\nAverageTasksPerSecond:"0"\nCompletedTasks:"22321"\nComputeAverageInterval:"10000"\nRunningTasks:"0"\nraw_message:"[AB Server:type=Cell] ChildCount = 4 MessageLimit = 12288 Oid = CA_ABS CellName = CA_ABS ClientIp = 9.1.6.247 ParentOid = CA_ABS OutOfService = false ChildCountLimit = 5000 OverLoad = false MinuteCountLimit = 2000 [AB Server:type=InvokeProcessor] AverageTaskTime = 7 AverageTasksPerSecond = 0 CompletedTasks = 22321 ComputeAverageInterval = 10000 RunningTasks = 0" |

  Scenario Outline: 上传日志
    When open the "localUpload.ListPage" page for uri "/sources/input/os/"
    And I set the parameter "AppName" with value "<appName>"
    And I set the parameter "Tag" with value "<appName>"
    And I upload a file with name "/src/test/resources/testdata/log/<log>"
    And I click the "UploadButton" button
    And I wait for element "VerifyText" change text to "上传完成"

    Examples:
      | appName            | log          |
      | auto_test_KV       | KV.log       |
      | auto_test_KV_group | KV_group.log |
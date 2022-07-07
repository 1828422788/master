@configs @configsKeyValueRegex
Feature: 字段提取KeyValue正则匹配

  Scenario Outline: RZY-1535:KeyValue正则匹配
    Given open the "configs.ListPage" page for uri "/configs/"
    Then I wait for loading invisible
    And I click the "Create" button
    Then I will see the "configs.CreatePage" page
    When I set the parameter "LogSample" with value "<190>May 18 11:20:10 2016 HLJ_S12508_1_FW %%10FILTER/6/ZONE_DP_FLT_EXECUTION_TCP_LOG(l): -DEV_TYPE=SECPATH-PN=210231A0H6010C000002; srcZoneName(1034)=serveruntrust;destZoneName(1035)=servertrust;rule_ID(1070)=90;policyActType(1071)=denied;protType(1001)=TCP(6);srcIPAddr(1017)=10.167.77.99;destIPAddr(1019)=10.166.5.70;srcPortNum(1018)=49362;destPortNum(1020)=1521;beginTime_e(1013)=05182016112009;endTime_e(1014)=05182016112009;"
    And I click the "AddRule" button
    And I choose the "正则解析" from the "ParseRule"
    And I choose the "raw_message" from the "SourceField"
    And I set the value "<%{NOTSPACE:id}>(?<timestamp>%{NOTSPACE}\s+%{NOTSPACE}\s+%{NOTSPACE}\s+%{NOTSPACE}\s+)%{NOTSPACE:host} \%\%(?<vendor>[^/]*)/(?<severity>[^/]*)/(?<MNEMONIC>[^:]*): -DEV_TYPE=SECPATH-PN=210231A0H6010C000002; (?<message>.*)" to the textarea "Regex"
    And I click the "EnsureAddParseRule" button
    And I wait for loading invisible
    And I click the "ParseButton" button
    And I wait for "CheckSuccess" will be visible
    And I will see the field extraction result "<result>"
    And I click the "Collapse" button
    And I click the "AddRule" button
    And I choose the "KeyValue正则匹配" from the "ParseRule"
    And I choose the "message" from the "SourceField"
    And I set the parameter "KeyRegex" with value "[^=;]+"
    And I set the parameter "ValueRegex" with value "[^=;]+"
    And I set the parameter "KVSeparator" with value "="
    And I click the "EnsureAddParseRule" button
    And I wait for loading invisible
    And I click the "ParseButton" button
    And I wait for "CheckSuccess2" will be visible
    And I will see the field extraction result "<result1>"
    And I click the "Collapse" button
    And I click the "NextButton" button
    When I set the parameter "Name" with value "RZY1535KeyValue正则匹配"
    And I set the parameter "Logtype" with value "other"
    And I set the parameter "AppName" with value "<appName>"
    And I set the parameter "Tag" with value "<appName>"
    And I switch the "SwitchButton" button to "enable"
    And I click the "Done" button
    And I will see the element "ResultMessage" contains "新建成功"

    Examples:
      | appName     | result                                                                                                                                                                                                                                                                                                                                                                                                                                                   | result1                                                                                                                                                                                                                                                                                                                                                                                                                                                               |
      | wym_test_KV | {'MNEMONIC':'ZONE_DP_FLT_EXECUTION_TCP_LOG(l)','host':'HLJ_S12508_1_FW','id':'190','message':'srcZoneName(1034)=serveruntrust;destZoneName(1035)=servertrust;rule_ID(1070)=90;policyActType(1071)=denied;protType(1001)=TCP(6);srcIPAddr(1017)=10.167.77.99;destIPAddr(1019)=10.166.5.70;srcPortNum(1018)=49362;destPortNum(1020)=1521;beginTime_e(1013)=05182016112009;endTime_e(1014)=05182016112009;','severity':'6','vendor':'10FILTER'} | {'MNEMONIC':'ZONE_DP_FLT_EXECUTION_TCP_LOG(l)','host':'HLJ_S12508_1_FW','id':'190','message.beginTime_e(1013)':'05182016112009','message.destIPAddr(1019)':'10.166.5.70','message.destPortNum(1020)':'1521','message.destZoneName(1035)':'servertrust','message.endTime_e(1014)':'05182016112009','message.policyActType(1071)':'denied','message.protType(1001)':'TCP(6)','message.rule_ID(1070)':'90','message.srcIPAddr(1017)':'10.167.77.99','message.srcPortNum(1018)':'49362','message.srcZoneName(1034)':'serveruntrust','severity':'6','vendor':'10FILTER'} |

  Scenario Outline: RZY-1535:KeyValue正则匹配，上传日志，验证结果
    When open the "localUpload.ListPage" page for uri "/sources/input/os/"
    And I set the parameter "AppName" with value "<appName>"
    And I set the parameter "Tag" with value "<appName>"
    And I upload a file with name "/src/test/resources/testdata/log/<log>"
    And I click the "UploadButton" button
    And I will see the element "VerifyText" contains "上传完成"
    And I click the "Confirm" button
    And I wait for loading invisible
    When I will see the "splSearch.SearchPage" page
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I will see the element "SearchInput" contains "appname:"<appName>" AND tag:"<appName>""
    Then I move the mouse pointer to the "Result"
    And I click the "RightIcon" button
    Then I will see the spl search result "<searchResult>"

    Examples:
      | appName      | log    | searchResult                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        |
      | wym_test_KV  | KV.log | {'other.timestamp':'May 18 11:20:10 2016','other.MNEMONIC':'ZONE_DP_FLT_EXECUTION_TCP_LOG(l)','other.host':'HLJ_S12508_1_FW','other.id':'190','other.message.beginTime_e(1013)':'05182016112009','other.message.destIPAddr(1019)':'10.166.5.70','other.message.destPortNum(1020)':'1521','other.message.destZoneName(1035)':'servertrust','other.message.endTime_e(1014)':'05182016112009','other.message.policyActType(1071)':'denied','other.message.protType(1001)':'TCP(6)','other.message.rule_ID(1070)':'90','other.message.srcIPAddr(1017)':'10.167.77.99','other.message.srcPortNum(1018)':'49362','other.message.srcZoneName(1034)':'serveruntrust','other.severity':'6','other.vendor':'10FILTER'} |

  Scenario Outline: RZY-2798: group_regex
    Given open the "configs.ListPage" page for uri "/configs/"
    Then I wait for loading invisible
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
    And I wait for loading invisible
    And I click the "ParseButton" button
    And I wait for "CheckSuccess" will be visible
    And I will see the field extraction result "<result>"
    And I click the "Collapse" button
    And I click the "NextButton" button
    When I set the parameter "Name" with value "RZY2798group_regex"
    And I set the parameter "Logtype" with value "test"
    And I set the parameter "AppName" with value "<appName>"
    And I set the parameter "Tag" with value "<appName>"
    And I switch the "SwitchButton" button to "enable"
    And I click the "Done" button
    And I will see the element "ResultMessage" contains "新建成功"

    Examples:
      | appName            | result                                                                                                                                                                                                                                                                                                                                                                   |
      | wym_test_KV_group | {'Cell.CellName':'CA_ABS','Cell.ChildCount':'4','Cell.ChildCountLimit':'5000','Cell.ClientIp':'9','Cell.MessageLimit':'12288','Cell.MinuteCountLimit':'2000','Cell.Oid':'CA_ABS','Cell.OutOfService':'false','Cell.OverLoad':'false','Cell.ParentOid':'CA_ABS','InvokeProcessor.AverageTaskTime':'7','InvokeProcessor.AverageTasksPerSecond':'0','InvokeProcessor.CompletedTasks':'22321','InvokeProcessor.ComputeAverageInterval':'10000','InvokeProcessor.RunningTasks':'0'} |

  Scenario Outline: RZY-2798: group_regex,上传日志，验证结果
    When open the "localUpload.ListPage" page for uri "/sources/input/os/"
    And I set the parameter "AppName" with value "<appName>"
    And I set the parameter "Tag" with value "<appName>"
    And I upload a file with name "/src/test/resources/testdata/log/<log>"
    And I click the "UploadButton" button
    And I will see the element "VerifyText" contains "上传完成"
    And I click the "Confirm" button
    And I wait for loading invisible
    When I will see the "splSearch.SearchPage" page
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I will see the element "SearchInput" contains "appname:"<appName>" AND tag:"<appName>""
    Then I move the mouse pointer to the "Result"
    And I click the "RightIcon" button
    Then I will see the spl search result "<searchResult>"

    Examples:
      | log          | appName           | searchResult                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  |
      | KV_group.log | wym_test_KV_group | {'test.Cell.CellName':'CA_ABS','test.Cell.ChildCount':'4','test.Cell.ChildCountLimit':'5000','test.Cell.ClientIp':'9','test.Cell.MessageLimit':'12288','test.Cell.MinuteCountLimit':'2000','test.Cell.Oid':'CA_ABS','test.Cell.OutOfService':'false','test.Cell.OverLoad':'false','test.Cell.ParentOid':'CA_ABS','test.InvokeProcessor.AverageTaskTime':'7','test.InvokeProcessor.AverageTasksPerSecond':'0','test.InvokeProcessor.CompletedTasks':'22321','test.InvokeProcessor.ComputeAverageInterval':'10000','test.InvokeProcessor.RunningTasks':'0'} |
Feature: 趋势图所需字段提取新建

  @createEssentialData
  Scenario: RZY-2631前提：创建一个针对sequence的字段提取规则并上传日志
    Given open the "configs.ListPage" page for uri "/configs/"
    And I click the "Create" button
    Then I will see the "configs.CreatePage" page
    When I set the parameter "LogSample" with value "1511255129000, fred, bob, query1, 111"
    And I click the "AddRule" button
    And I choose the "CSV解析" from the "ParseRule"
    And I choose the "raw_message" from the "SourceField"
    And I set the parameter "Separate" with value ","
    And I set the parameter "FieldList" with value "time,from,to,relatemsg,msgid"
    And I click the "EnsureAddParseRule" button
    And I wait for "ParseButton" will be visible
    And I click the "NextButton" button
    And I click the "SwitchButton" button
    And I set the parameter "AppName" with value "seq_test"
    And I set the parameter "Tag" with value "seq_test"
    When I set the parameter "Name" with value "AutoTestForTrend"
    And I set the parameter "Logtype" with value "sequence"
    And I click the "NextButton" button
    Then I wait for "ConfigDone" will be visible
    And open the "localUpload.ListPage" page for uri "/sources/input/os/"
    And I set the parameter "AppName" with value "seq_test"
    And I set the parameter "Tag" with value "seq_test"
    And I upload a file with name "/src/test/resources/testdata/log/autotest.csv"
    And I click the "UploadButton" button
    And I wait for element "VerifyText" change text to "上传完成"

  @createEssentialData
  Scenario: RZY-2813:parser_调用链dapper
    Given open the "configs.ListPage" page for uri "/configs/"
    And I click the "Create" button
    Then I will see the "configs.CreatePage" page
    And I set the parameter "LogSample" with value "00:07:52.199 [DubboServerHandler-192.168.180.142:22880-thread-5] INFO  com.github.kristofa.brave.LoggingReporter:35 report - {"traceId":"511f8756ce1d0b8a","id":"ef01b997ba20e053","name":"mould2rpcservice.demoformould2","parentId":"511f8756ce1d0b8a","annotations":[{"timestamp":1533290272196569,"value":"sr","endpoint":{"serviceName":"gnete-cps-mould2-biz","ipv4":"192.168.180.142"}},{"timestamp":1533290272196614,"value":"sr","endpoint":{"serviceName":"gnete-cps-mould2-biz","ipv4":"192.168.180.142"}},{"timestamp":1533290272196727,"value":"ss","endpoint":{"serviceName":"gnete-cps-mould2-biz","ipv4":"192.168.180.142"}}],"binaryAnnotations":[{"key":"address","value":"192.168.180.142:22880","endpoint":{"serviceName":"gnete-cps-mould2-biz","ipv4":"192.168.180.142"}},{"key":"ca","value":true,"endpoint":{"serviceName":"gnete-cps-mould-biz","ipv4":"192.168.180.142","port":51798}},{"key":"server_result","value":"true","endpoint":{"serviceName":"gnete-cps-mould2-biz","ipv4":"192.168.180.142"}}]}"
    And I click the "AddRule" button
    And I choose the "正则解析" from the "ParseRule"
    And I choose the "raw_message" from the "SourceField"
    And I set the parameter "Regex" with value "(?<time>\d+:\d+:\d+\.\d+)\s+\S+\s+(?<level>\S+)\s+(?<class>\S+)\:\S+\s+\S+\s+-\s+(?<msg>.*)"
    And I click the "EnsureAddParseRule" button
    And I wait for "ParseButton" will be visible
    And I click the "ParseButton" button
    And I click the "AddRule" button
    And I choose the "JSON解析" from the "ParseRule"
    And I choose the "msg" from the "SourceField"
    And I click the "EnsureAddParseRule" button
    And I wait for "ParseButton" will be visible
    And I click the "ParseButton" button
    And I click the "AddRule" button
    And I choose the "时间戳识别" from the "ParseRule"
    And I choose the "time" from the "SourceField"
    And I set the parameter "TimeFormat" with value "HH:mm:ss.SSS"
    And I click the "EnsureAddParseRule" button
    And I wait for "ParseButton" will be visible
    And I click the "NextButton" button under some element
    And I click the "SwitchButton" button
    When I set the parameter "Name" with value "dapper"
    And I set the parameter "Logtype" with value "dapper"
    And I set the parameter "AppName" with value "gf_dapper"
    And I set the parameter "Tag" with value "gf_dapper"
    And I click the "NextButton" button
    Then I wait for "ConfigDone" will be visible
    And open the "localUpload.ListPage" page for uri "/sources/input/os/"
    And I set the parameter "AppName" with value "gf_dapper"
    And I set the parameter "Tag" with value "gf_dapper"
    And I upload a file with name "/src/test/resources/testdata/log/gf_dapper.txt"
    And I click the "UploadButton" button
    And I wait for element "VerifyText" change text to "上传完成"

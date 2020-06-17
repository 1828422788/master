@createEssentialData @baseUser
Feature: 新建用户和字段提取

  Scenario: new_user_logdisplay
    Given open the "users.ListPage" page for uri "/account/users/"
    And I click the "CreateUser" button
    And I will see the "users.CreatePage" page
    When I set the parameter "UserName" with value "logdisplay"
    And I set the parameter "FullName" with value "logdisplay"
    And I set the parameter "Email" with value "logdisplay@t.cn"
    And I set the parameter "Password" with value "All#123456"
    And I choose the "__admin__" from the "Role"
    And I click the "CreateButton" button
    Then I wait for "SuccessMessage" will be visible

  Scenario: dapper_parser
    Given open the "configs.ListPage" page for uri "/configs/"
    Then I wait for loading invisible

    And I click the "Create" button
    Then I will see the "configs.CreatePage" page
    When I set the parameter "LogSample" with value "00:07:52.063 [DubboServerHandler-192.168.180.142:22880-thread-3] INFO  com.github.kristofa.brave.LoggingReporter:35 report - {"traceId":"511f8756ce1d0b8a","id":"48599c19bdb75b44","name":"mould2rpcservice.demoformould2","parentId":"12e1779d4741bf9a","annotations":[{"timestamp":1533290272026787,"value":"sr","endpoint":{"serviceName":"gnete-cps-mould2-biz","ipv4":"192.168.180.142"}},{"timestamp":1533290272030124,"value":"sr","endpoint":{"serviceName":"gnete-cps-mould2-biz","ipv4":"192.168.180.142"}},{"timestamp":1533290272032818,"value":"ss","endpoint":{"serviceName":"gnete-cps-mould2-biz","ipv4":"192.168.180.142"}}],"binaryAnnotations":[{"key":"address","value":"192.168.180.142:22880","endpoint":{"serviceName":"gnete-cps-mould2-biz","ipv4":"192.168.180.142"}},{"key":"ca","value":true,"endpoint":{"serviceName":"gnete-cps-mould1-biz","ipv4":"192.168.180.142","port":51797}},{"key":"server_result","value":"true","endpoint":{"serviceName":"gnete-cps-mould2-biz","ipv4":"192.168.180.142"}}]}"

    And I click the "AddRule" button
    And I choose the "正则解析" from the "ParseRule" in config
    And I choose the "raw_message" from the "SourceField" in config
    And I set the parameter "Regex" with value "(?<time>\d+:\d+:\d+\.\d+)\s+\S+\s+(?<level>\S+)\s+(?<class>\S+)\:\S+\s+\S+\s+-\s+(?<msg>.*)"
    And I click the "EnsureAddParseRule" button
    And I wait for "ParseButton" will be visible
    Then I wait for "100" millsecond
    And I click the "ParseButton" button
    And I wait for "CheckSuccess" will be visible

    And I click the "AddRule" button
    And I choose the "JSON解析" from the "ParseRule" in config
    And I choose the "msg" from the "SourceField" in config
    And I click the "EnsureAddParseRule" button
    And I wait for "ParseButton" will be visible
    Then I wait for "100" millsecond
    And I click the "ParseButton" button
    And I wait for "CheckSuccess" will be visible

    And I click the "AddRule" button
    And I choose the "时间戳识别" from the "ParseRule" in config
    And I choose the "time" from the "SourceField" in config
    And I set the parameter "TimeFormat" with value "HH:mm:ss.SSS"
    And I set the parameter "MaxMatchLength" with value "80"
    And I click the "EnsureAddParseRule" button
    And I wait for "ParseButton" will be visible
    Then I wait for "100" millsecond
    And I click the "ParseButton" button
    And I wait for "CheckSuccess" will be visible

    And I click the "NextButton" button under some element
    And I click the "SwitchButton" button
    When I set the parameter "Name" with value "dapper"
    And I set the parameter "Logtype" with value "dapper"
    And I set the parameter "AppName" with value "dapper"
    And I set the parameter "Tag" with value "*"
    And I click the "Done" button
    Then I wait for "ConfigDone" will be visible



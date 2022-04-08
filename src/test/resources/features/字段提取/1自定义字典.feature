@configs23 @configs
Feature: 字段提取自定义字典


  Scenario: 新建字典
    Given open the "dictionary.ListPage" page for uri "/dictionary/"
    And I wait for loading invisible
    When I click the "UploadButton" button
    Then I set the parameter "Name" with value "win_sys_sourcename"
    And I upload a file with name "/src/test/resources/testdata/dictionary/win_sys_sourcename.csv"
    And I wait for "FileName" will be visible
    And I click the "EnsureUpload" button
    Then I will see the success message "创建字典成功"


  Scenario Outline: RZY-2819: 配置自定义字典解析规则
    Given open the "configs.ListPage" page for uri "/configs/"
    Then I wait for loading invisible
    And I click the "Create" button
    Then I will see the "configs.CreatePage" page
    When I set the parameter "LogSample" with value "{"Category":"","ComputerName":"WIN-999OGBVAHMI","EventCode":7036,"EventIdentifier":1073748860,"EventType":3,"Logfile":"System","Message":"Application Experience 服务处于 正在运行 状态。","RecordNumber":108343,"SourceName":"Service Control Manager","User":"","TimeGenerated":"2015-01-04T20:45:09+08:00"}"
    And I click the "AddRule" button
    And I choose the "JSON解析" from the "ParseRule" in config
    And I wait for "1000" millsecond
    And I choose the "raw_message" from the "SourceField" in config
    Then I wait for "1000" millsecond
    And I click the "EnsureAddParseRule" button
    And I wait for loading invisible
    And I click the "ParseButton" button
    And I wait for "CheckSuccess" will be visible
    Then I will see the field extraction result "<result1>"
    And I click the "Collapse" button
    And I click the "AddRule" button
    And I choose the "自定义字典" from the "ParseRule" in config
    Then I wait for "1000" millsecond
    And I choose the "SourceName" from the "SourceField" in config
    Then I wait for "1000" millsecond
    And I choose the "win_sys_sourcename.csv" from the "Dictionary" in config
    Then I wait for "1000" millsecond
    And I choose the "sourcename" from the "BaseField" in config
    Then I wait for "1000" millsecond
    And I choose the "level,source" from the "ExtendField" in config
    Then I wait for "1000" millsecond
    And I click the "EnsureAddParseRule" button
    And I wait for "ParseButton" will be visible
    Then I wait for "100" millsecond
    And I click the "ParseButton" button
    And I wait for "CheckSuccess2" will be visible
    Then I will see the field extraction result "<result>"
    And I click the "Collapse" button
    And I click the "NextButton" button under some element
    When I set the parameter "Name" with value "RZY2819配置自定义字典解析规则"
    And I set the parameter "Logtype" with value "json"
    And I set the parameter "AppName" with value "<appName>"
    And I set the parameter "Tag" with value "<appName>"
    And I switch the "SwitchButton" button to "enable"
    And I click the "Done" button
    Then I wait for "ConfigDone" will be visible

    Examples:
      | appName             | result                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               | result1                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               |
      | wym_test_dictionary | {'ComputerName':'"WIN-999OGBVAHMI"','EventCode':'7036','EventIdentifier':'1073748860','EventType':'3','Logfile':'"System"','Message':'"Application Experience 服务处于 正在运行 状态。"','RecordNumber':'108343','SourceName':'"Service Control Manager"','TimeGenerated':'"2015-01-04T20:45:09+08:00"','User':'""','level':'"2"','source':'"sys"','raw_message':'"{"Category":"","ComputerName":"WIN-999OGBVAHMI","EventCode":7036,"EventIdentifier":1073748860,"EventType":3,"Logfile":"System","Message":"Application Experience 服务处于 正在运行 状态。","RecordNumber":108343,"SourceName":"Service Control Manager","User":"","TimeGenerated":"2015-01-04T20:45:09+08:00"}"'} | {'Category':'""','ComputerName':'"WIN-999OGBVAHMI"','EventCode':'7036','EventIdentifier':'1073748860','EventType':'3','Logfile':'"System"','Message':'"Application Experience 服务处于 正在运行 状态。"','RecordNumber':'108343','SourceName':'"Service Control Manager"','TimeGenerated':'"2015-01-04T20:45:09+08:00"','User':'""','raw_message':'"{"Category":"","ComputerName":"WIN-999OGBVAHMI","EventCode":7036,"EventIdentifier":1073748860,"EventType":3,"Logfile":"System","Message":"Application Experience 服务处于 正在运行 状态。","RecordNumber":108343,"SourceName":"Service Control Manager","User":"","TimeGenerated":"2015-01-04T20:45:09+08:00"}"'} |


  Scenario Outline: RZY-2819: 上传日志，验证结果
    When open the "localUpload.ListPage" page for uri "/sources/input/os/"
    And I set the parameter "AppName" with value "<appName>"
    And I set the parameter "Tag" with value "<appName>"
    And I upload a file with name "/src/test/resources/testdata/log/<log>"
    And I click the "UploadButton" button
    Then I wait for loading invisible
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
      | appName             | log            | searchResult                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  |
      | wym_test_dictionary | dictionary.log | {'json.Category':'','json.ComputerName':'WIN-999OGBVAHMI','json.EventCode':'7036','json.EventIdentifier':'1073748860','json.EventType':'3','json.Logfile':'System','json.Message':'Application Experience 服务处于 正在运行 状态。','json.RecordNumber':'108343','json.SourceName':'Service Control Manager','json.TimeGenerated':'2015-01-04T20:45:09+08:00','json.level':'2','json.source':'sys'} |


  Scenario Outline: 自定义字典详情页验证
    Given open the "configs.ListPage" page for uri "/configs/"
    Then I wait for loading invisible
    And I set the parameter "SearchInput" with value "<name>"
    Then I wait for loading invisible
    When the data name is "{'column':'1','name':'<name>'}" then i click the "详情" button
    And I wait for loading invisible
    Then I will see the config element "<rule1>" value is "<rule1> 1 1 0 0 0"
    Then I will see the config element "<rule2>" value is "<rule2> 1 1 0 0 0"

    Examples:
      | name                          | rule1      | rule2    |
      | RZY2819配置自定义字典解析规则 | 自定义字典 | JSON解析 |


  Scenario: 删除字典
    Given open the "dictionary.ListPage" page for uri "/dictionary/"
    And I wait for loading invisible
    Then I set the parameter "SearchInput" with value "win_sys_sourcename.csv"
    And I wait for loading invisible
    When the data name is "{'column':'0','name':'win_sys_sourcename.csv'}" then i click the "删除" button in more menu
    Then I will see the success message "确认删除 [win_sys_sourcename.csv] ?"
    When I click the "Ensure" button
    And I wait for loading invisible
    Then I will see the success message "删除成功"
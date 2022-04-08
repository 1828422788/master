@configs25 @configs
Feature: 字段提取重命名字段


  Scenario Outline: 字段重命名（RZY-1590）
    Given open the "configs.ListPage" page for uri "/configs/"
    Then I wait for loading invisible
    And I click the "Create" button
    Then I will see the "configs.CreatePage" page
    When I set the parameter "LogSample" with value "<log>"
    And I click the "AddRule" button
    And I choose the "JSON解析" from the "ParseRule" in config
    And I wait for "1000" millsecond
    And I choose the "raw_message" from the "SourceField" in config
    Then I wait for "1000" millsecond
    And I click the "EnsureAddParseRule" button
    And I wait for loading invisible
    And I click the "ParseButton" button
    And I wait for "CheckSuccess" will be visible
    And I click the "Collapse" button
    And I click the "AddRule" button
    And I choose the "字段重命名" from the "ParseRule" in config
    Then I wait for "1000" millsecond
    And I set the parameter "SourceFieldInput" with value "a.b.c"
    And I set the parameter "TargetFieldInput" with value "c"
    And I click the "EnsureAddParseRule" button
    And I wait for loading invisible
    And I click the "ParseButton" button
    And I wait for "CheckSuccess2" will be visible
    Then I will see the field extraction result "<result>"
    And I click the "Collapse" button
    And I click the "NextButton" button under some element
    When I set the parameter "Name" with value "RZY2865支持通配符"
    And I set the parameter "Logtype" with value "other"
    And I set the parameter "AppName" with value "<appName>"
    And I set the parameter "Tag" with value "<appName>"
    And I switch the "SwitchButton" button to "enable"
    And I click the "Done" button
    Then I wait for "ConfigDone" will be visible

    Examples:
      | appName         | log                   | result                                              |
      | wym_test_rename | {"a":{"b":{"c":"d"}}} | {'c':'"d"','raw_message':'"{"a":{"b":{"c":"d"}}}"'} |


  Scenario Outline: 字段重命名,上传日志，验证结果
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
    And I wait for "10000" millsecond

    Examples:
      | appName         | log        | searchResult                      |
      | wym_test_rename | rename.log | {'other.a.e.c':'g','other.c':'d'} |


  Scenario Outline: 重命名字段支持通配符详情页验证
    Given open the "configs.ListPage" page for uri "/configs/"
    Then I wait for loading invisible
    And I set the parameter "SearchInput" with value "<name>"
    Then I wait for loading invisible
    When the data name is "{'column':'1','name':'<name>'}" then i click the "详情" button
    And I wait for loading invisible
    Then I will see the config element "<rule1>" value is "<rule1> 1 1 0 0 0"
    Then I will see the config element "<rule2>" value is "<rule2> 1 1 0 0 0"

    Examples:
      | name              | rule1    | rule2      |
      | RZY2865支持通配符 | JSON解析 | 字段重命名 |
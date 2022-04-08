@configs21 @configs
Feature: 字段提取结构体解析


  Scenario Outline: RZY-2863:非严格解析
    Given open the "configs.ListPage" page for uri "/configs/"
    Then I wait for loading invisible
    And I click the "Create" button
    Then I will see the "configs.CreatePage" page
    When I set the parameter "LogSample" with value "aaa 111"
    And I click the "AddRule" button
    And I choose the "结构体解析" from the "ParseRule" in config
    And I wait for "1000" millsecond
    And I choose the "raw_message" from the "SourceField" in config
    Then I wait for "1000" millsecond
    And I set the value "<struct>" to the textarea "Struct"
    And I click the "EnsureAddParseRule" button
    And I wait for loading invisible
    And I click the "ParseButton" button
    And I wait for "CheckSuccess" will be visible
    Then I will see the field extraction result "<result>"

    Examples:
      | struct         | result                                                |
      | name:3,val:3:i | {'name':'"aaa"','val':'11','raw_message':'"aaa 111"'} |


  Scenario Outline: RZY-2862:严格解析
    Given open the "configs.ListPage" page for uri "/configs/"
    Then I wait for loading invisible
    And I click the "Create" button
    Then I will see the "configs.CreatePage" page
    When I set the parameter "LogSample" with value "aaa 111"
    And I click the "AddRule" button
    And I choose the "结构体解析" from the "ParseRule" in config
    And I wait for "1000" millsecond
    And I choose the "raw_message" from the "SourceField" in config
    Then I wait for "1000" millsecond
    And I set the value "<struct>" to the textarea "Struct"
    And I click the "StrictMode" button
    And I click the "EnsureAddParseRule" button
    And I wait for loading invisible
    And I click the "ParseButton" button
    And I wait for "CheckSuccess" will be visible
    And I will see the field extraction result "<result>"
    And I click the "Collapse" button
    And I click the "NextButton" button under some element
    When I set the parameter "Name" with value "RZY2862严格解析"
    And I set the parameter "Logtype" with value "other"
    And I set the parameter "AppName" with value "<appName>"
    And I set the parameter "Tag" with value "<appName>"
    And I switch the "SwitchButton" button to "enable"
    And I click the "Done" button
    Then I wait for "ConfigDone" will be visible

    Examples:
      | struct         | result                                                 | appName        |
      | name:3,val:4:i | {'name':'"aaa"','val':'111','raw_message':'"aaa 111"'} | wym_test_codec |


  Scenario Outline: RZY-2862:严格解析,上传日志，验证结果
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
      | appName        | log            | searchResult                           |
      | wym_test_codec | 结构体解析.log | {"other.name":"aaa","other.val":"111"} |


  Scenario Outline: 详情验证
    Given open the "configs.ListPage" page for uri "/configs/"
    Then I wait for loading invisible
    And I set the parameter "SearchInput" with value "<name>"
    Then I wait for loading invisible
    When the data name is "{'column':'1','name':'<name>'}" then i click the "详情" button
    And I wait for loading invisible
    Then I will see the config element "<rule1>" value is "<rule1> 1 1 0 0 0"

    Examples:
      | name            | rule1 |
      | RZY2862严格解析 | 结构体解析 |

@configs14 @configs
Feature: 字段提取内容替换

  @configsSmoke
  Scenario Outline: RZY-1557:不勾选 只替换第一个
    Given open the "configs.ListPage" page for uri "/configs/"
    And I wait for loading invisible
    And I click the "Create" button
    Then I will see the "configs.CreatePage" page
    When I set the parameter "LogSample" with value "123abc456qwe"
    And I click the "AddRule" button
    And I choose the "内容替换" from the "ParseRule" in config
    And I wait for "1000" millsecond
    And I choose the "raw_message" from the "SourceField" in config
    Then I wait for "1000" millsecond
    And I set the value "(\d+)[a-z]+" to the textarea "Regex"
    And I set the value "$1" to the textarea "ReplaceContent"
    And I click the "ReplaceFirst" button
    And I click the "EnsureAddParseRule" button
    And I wait for loading invisible
    And I click the "ParseButton" button
    And I wait for "CheckSuccess" will be visible
    Then I will see the element value in json "{'Result':'<result>'}"

    Examples:
      | result                       |
      | Object\nraw_message:"123456" |


  Scenario Outline: RZY-1556:内容替换搜索页验证
    Given open the "configs.ListPage" page for uri "/configs/"
    And I wait for loading invisible
    And I click the "Create" button
    Then I will see the "configs.CreatePage" page
    When I set the parameter "LogSample" with value "123abc456qwe"
    And I click the "AddRule" button
    And I choose the "内容替换" from the "ParseRule" in config
    And I wait for "1000" millsecond
    And I choose the "raw_message" from the "SourceField" in config
    Then I wait for "1000" millsecond
    And I set the value "(\d+)[a-z]+" to the textarea "Regex"
    And I set the value "<replaceContent>" to the textarea "ReplaceContent"
    And I click the "EnsureAddParseRule" button
    And I wait for loading invisible
    And I click the "ParseButton" button
    And I wait for "CheckSuccess" will be visible
    Then I will see the element value in json "{'Result':'<result>'}"
    And I click the "Collapse" button
    And I click the "NextButton" button under some element
    When I set the parameter "Name" with value "RZY1556内容替换"
    And I set the parameter "Logtype" with value "other"
    And I set the parameter "AppName" with value "<appName>"
    And I set the parameter "Tag" with value "<appName>"
    And I switch the "SwitchButton" button to "enable"
    And I click the "Done" button
    Then I wait for "ConfigDone" will be visible

    Examples:
      | appName                 | replaceContent | result                          |
      | wym_test_replaceContent | $1             | Object\nraw_message:"123456qwe" |


  Scenario Outline: RZY-1556:上传日志，验证结果
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
    And I wait for "5000" millsecond

    Examples:
      | appName                 | log                | searchResult                |
      | wym_test_replaceContent | replaceContent.log  | {'raw_message':'123456qwe'} |


  Scenario Outline: RZY-1556:内容替换详情验证
    Given open the "configs.ListPage" page for uri "/configs/"
    And I wait for loading invisible
    And I set the parameter "SearchInput" with value "<name>"
    Then I wait for loading invisible
    When the data name is "{'column':'1','name':'<name>'}" then i click the "详情" button
    And I wait for loading invisible
    Then I will see the config element "<rule1>" value is "<rule1> 1 1 0 0 0"

    Examples:
      | name            | rule1 |
      | RZY1556内容替换 | 内容替换  |


  Scenario Outline: RZY-1559:tag替换搜索页验证
    Given open the "configs.ListPage" page for uri "/configs/"
    And I wait for loading invisible
    And I click the "Create" button
    Then I will see the "configs.CreatePage" page
    And I click the "AddRule" button
    And I choose the "JSON解析" from the "ParseRule" in config
    And I wait for "1000" millsecond
    And I choose the "raw_message" from the "SourceField" in config
    Then I wait for "1000" millsecond
    And I click the "EnsureAddParseRule" button
    And I wait for loading invisible
    And I click the "AddRule" button
    And I choose the "内容替换" from the "ParseRule" in config
    And I wait for "1000" millsecond
    And I choose the "@tag" from the "SourceField" in config
    And I set the value "(.*)" to the textarea "Regex"
    And I set the value "$1,newinfo" to the textarea "ReplaceContent"
    And I click the "EnsureAddParseRule" button
    And I wait for loading invisible
    And I click the "NextButton" button under some element
    When I set the parameter "Name" with value "RZY1559tag替换"
    And I set the parameter "Logtype" with value "other"
    And I set the parameter "AppName" with value "<tag>"
    And I set the parameter "Tag" with value "<tag>"
    And I switch the "SwitchButton" button to "enable"
    And I click the "Done" button
    Then I wait for "ConfigDone" will be visible

    Examples:
      | tag                 |
      | wym_test_replaceTag |


  Scenario Outline: RZY-1559:上传日志，验证结果
    When open the "localUpload.ListPage" page for uri "/sources/input/os/"
    And I set the parameter "AppName" with value "<tag>"
    And I set the parameter "Tag" with value "<tag>"
    And I upload a file with name "/src/test/resources/testdata/log/<log>"
    And I click the "UploadButton" button
    Then I wait for loading invisible
    And I will see the element "VerifyText" contains "上传完成"
    And I click the "Confirm" button
    And I wait for loading invisible
    When I will see the "splSearch.SearchPage" page
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I will see the element "SearchInput" contains "appname:"<tag>" AND tag:"<tag>""
    Then I move the mouse pointer to the "Result"
    And I click the "RightIcon" button
    Then I will see the spl search result "<searchResult>"
    And I wait for "5000" millsecond

    Examples:
      | tag                 | log        | searchResult                                |
      | wym_test_replaceTag | rename.log | {"tag":"wym_test_replaceTagnewinfo"} |


  Scenario Outline: tag替换详情验证
    Given open the "configs.ListPage" page for uri "/configs/"
    And I wait for loading invisible
    And I set the parameter "SearchInput" with value "<name>"
    Then I wait for loading invisible
    When the data name is "{'column':'1','name':'<name>'}" then i click the "详情" button
    And I wait for loading invisible
    Then I will see the config element "<rule1>" value is "<rule1> 1 1 0 0 0"
    Then I will see the config element "<rule2>" value is "<rule2> 1 1 0 0 0"

    Examples:
      | name           | rule1    | rule2   |
      | RZY1559tag替换 | JSON解析 | 内容替换  |

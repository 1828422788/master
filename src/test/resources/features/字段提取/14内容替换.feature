@configs @configs14
Feature: 字段提取内容替换


  @configsSmoke
  Scenario Outline: RZY-1557:不勾选 只替换第一个
    Given open the "configs.ListPage" page for uri "/configs/"
    And I wait for loading invisible
    And I click the "Create" button
    Then I will see the "configs.CreatePage" page
    When I set the parameter "LogSample" with value "123abc456qwe"
    And I click the "AddRule" button
    And I choose the "内容替换" from the "ParseRule"
    And I wait for "1000" millsecond
    And I choose the "raw_message" from the "SourceField"
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


  Scenario Outline: RZY-1556:内容替换
    Given open the "configs.ListPage" page for uri "/configs/"
    And I wait for loading invisible
    And I click the "Create" button
    Then I will see the "configs.CreatePage" page
    When I set the parameter "LogSample" with value "123abc456qwe"
    And I click the "AddRule" button
    And I choose the "内容替换" from the "ParseRule"
    And I wait for "1000" millsecond
    And I choose the "raw_message" from the "SourceField"
    Then I wait for "1000" millsecond
    And I set the value "(\d+)[a-z]+" to the textarea "Regex"
    And I set the value "<replaceContent>" to the textarea "ReplaceContent"
    And I click the "EnsureAddParseRule" button
    And I wait for loading invisible
    And I click the "ParseButton" button
    And I wait for "CheckSuccess" will be visible
    Then I will see the element value in json "{'Result':'<result>'}"
    And I click the "Collapse" button
    And I click the "NextButton" button
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

    Examples:
      | appName                 | log                | searchResult                |
      | wym_test_replaceContent | replaceContent.log  | {'raw_message':'123456qwe'} |


  Scenario Outline: RZY-1559:tag替换搜索页验证
    Given open the "configs.ListPage" page for uri "/configs/"
    And I wait for loading invisible
    And I click the "Create" button
    Then I will see the "configs.CreatePage" page
    And I click the "AddRule" button
    And I choose the "JSON解析" from the "ParseRule"
    And I wait for "1000" millsecond
    And I choose the "raw_message" from the "SourceField"
    Then I wait for "1000" millsecond
    And I click the "EnsureAddParseRule" button
    And I wait for loading invisible
    And I click the "AddRule" button
    And I choose the "内容替换" from the "ParseRule"
    And I wait for "1000" millsecond
    And I choose the "@tag" from the "SourceField"
    And I set the value "(.*)" to the textarea "Regex"
    And I set the value "$1,newinfo" to the textarea "ReplaceContent"
    And I click the "EnsureAddParseRule" button
    And I wait for loading invisible
    And I click the "NextButton" button
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
    And I will see the element "VerifyText" contains "上传完成"
    And I click the "Confirm" button
    And I wait for loading invisible
    When I will see the "splSearch.SearchPage" page
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I will see the element "SearchInput" contains "appname:"<tag>" AND tag:"<tag>""
    Then I move the mouse pointer to the "Result"
    And I click the "RightIcon" button
    Then I will see the spl search result "<searchResult>"

    Examples:
      | tag                 | log        | searchResult                                |
      | wym_test_replaceTag | rename.log | {"tag":"wym_test_replaceTagnewinfo"} |
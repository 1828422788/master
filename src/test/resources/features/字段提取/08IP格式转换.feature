@configs @configsIP
Feature: 字段提取IP格式转换

  Scenario Outline: RZY-1555:IP格式转换
    Given open the "configs.ListPage" page for uri "/configs/"
    And I wait for loading invisible
    And I click the "Create" button
    Then I will see the "configs.CreatePage" page
    When I set the parameter "LogSample" with value "3651919938"
    And I click the "AddRule" button
    And I choose the "正则解析" from the "ParseRule"
    And I choose the "raw_message" from the "SourceField"
    And I set the value "(?<ip>.*)" to the textarea "Regex"
    And I click the "EnsureAddParseRule" button
    And I wait for loading invisible
    And I click the "ParseButton" button
    And I wait for "CheckSuccess" will be visible
    Then I will see the field extraction result "<result>"
    And I click the "Collapse" button
    And I click the "AddRule" button
    And I choose the "ip格式转换" from the "ParseRule"
    And I choose the "ip" from the "SourceField"
    And I click the "EnsureAddParseRule" button
    And I wait for loading invisible
    And I click the "ParseButton" button
    And I wait for "CheckSuccess2" will be visible
    Then I will see the field extraction result "<result1>"
    And I click the "Collapse" button
    And I click the "NextButton" button
    When I set the parameter "Name" with value "RZY1555IP格式转换"
    And I set the parameter "Logtype" with value "other"
    And I set the parameter "AppName" with value "<appName>"
    And I set the parameter "Tag" with value "<appName>"
    And I switch the "SwitchButton" button to "enable"
    And I click the "Done" button
    And I will see the element "ResultMessage" contains "新建成功"

    Examples:
      | appName     | result                                         | result1                                            |
      | wym_test_ip | {'ip':'3651919938','raw_message':'3651919938'} | {'ip':'217.171.224.66','raw_message':'3651919938'} |

  Scenario Outline: RZY-1555:上传日志，验证结果
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
      | appName     | log    | searchResult                |
      | wym_test_ip | ip.log | {'other.ip':'217.171.224.66'} |
@configsSmoke
Feature: 字段提取内容替换

  Scenario Outline: RZY-1557:不勾选 只替换第一个
    Given open the "configs.ListPage" page for uri "/configs/"
    And I click the "Create" button
    Then I will see the "configs.CreatePage" page
    When I set the parameter "LogSample" with value "123abc456qwe"
    And I click the "AddRule" button
    And I choose the "内容替换" from the "ParseRule" in config
    And I choose the "raw_message" from the "SourceField" in config
    And I set the parameter "Regex" with value "(\d+)[a-z]+"
    And I set the parameter "ReplaceContent" with value "$1"
    And I click the "Checkbox" button
    And I click the "EnsureAddParseRule" button
    And I wait for "ParseButton" will be visible
    And I click the "ParseButton" button
    And I wait for "CheckSuccess" will be visible
    Then I will see the element value in json "{'Result':'<result>'}"

    Examples:
      | result                       |
      | Object\nraw_message:"123456" |

  Scenario Outline: RZY-1556:内容替换
    Given open the "configs.ListPage" page for uri "/configs/"
    And I click the "Create" button
    Then I will see the "configs.CreatePage" page
    When I set the parameter "LogSample" with value "123abc456qwe"
    And I click the "AddRule" button
    And I choose the "内容替换" from the "ParseRule" in config
    And I choose the "raw_message" from the "SourceField" in config
    And I set the parameter "Regex" with value "(\d+)[a-z]+"
    And I set the parameter "ReplaceContent" with value "<replaceContent>"
    And I click the "EnsureAddParseRule" button
    And I wait for "ParseButton" will be visible
    And I click the "ParseButton" button
    And I wait for "CheckSuccess" will be visible
    Then I will see the element value in json "{'Result':'<result>'}"
    And I click the "NextButton" button under some element
    And I click the "SwitchButton" button
    When I set the parameter "Name" with value "RZY1556内容替换"
    And I set the parameter "Logtype" with value "other"
    And I set the parameter "AppName" with value "auto_test_replaceContent"
    And I set the parameter "Tag" with value "auto_test_replaceContent"
    And I click the "Done" button
    Then I wait for "ConfigDone" will be visible

    Examples:
      | replaceContent | result                          |
      | $1             | Object\nraw_message:"123456qwe" |

  Scenario: RZY-1559:tag替换
    Given open the "configs.ListPage" page for uri "/configs/"
    And I click the "Create" button
    Then I will see the "configs.CreatePage" page
    And I click the "AddRule" button
    And I choose the "JSON解析" from the "ParseRule" in config
    And I choose the "raw_message" from the "SourceField" in config
    And I click the "EnsureAddParseRule" button
    And I wait for "ParseButton" will be visible
    And I click the "AddRule" button
    And I choose the "内容替换" from the "ParseRule" in config
    And I choose the "@tag" from the "SourceField" in config
    And I set the parameter "Regex" with value "(.*)"
    And I set the parameter "ReplaceContent" with value "$1,newinfo"
    And I click the "EnsureAddParseRule" button
    And I wait for "ParseButton" will be visible
    And I click the "NextButton" button under some element
    And I click the "SwitchButton" button
    When I set the parameter "Name" with value "RZY1559tag替换"
    And I set the parameter "Logtype" with value "other"
    And I set the parameter "AppName" with value "auto_test_replaceTag"
    And I set the parameter "Tag" with value "auto_test_replaceTag"
    And I click the "Done" button
    Then I wait for "ConfigDone" will be visible

  Scenario Outline: 上传日志
    When open the "localUpload.ListPage" page for uri "/sources/input/os/"
    And I set the parameter "AppName" with value "<appName>"
    And I set the parameter "Tag" with value "<appName>"
    And I upload a file with name "/src/test/resources/testdata/log/<log>"
    And I click the "UploadButton" button
    And I wait for element "VerifyText" change text to "上传完成"

    Examples:
      | appName                  | log                |
      | auto_test_replaceContent | replaceContent.log |
      | auto_test_replaceTag     | rename.log         |
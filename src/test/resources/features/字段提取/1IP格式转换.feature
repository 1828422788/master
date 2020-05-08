@configsSmoke
Feature: 字段提取IP格式转换

  @second
  Scenario Outline: RZY-1555:IP格式转换
    Given open the "configs.ListPage" page for uri "/configs/"
    And I click the "Create" button
    Then I will see the "configs.CreatePage" page
    When I set the parameter "LogSample" with value "3651919938"
    And I click the "AddRule" button
    And I choose the "正则解析" from the "ParseRule" in config
    And I choose the "raw_message" from the "SourceField" in config
    And I set the parameter "Regex" with value "(?<ip>.*)"
    And I click the "EnsureAddParseRule" button
    And I wait for "ParseButton" will be visible
    And I click the "ParseButton" button
    And I wait for "CheckSuccess" will be visible
    Then I will see the element value in json "{'Result':'<result>'}"
    And I click the "AddRule" button
    And I choose the "ip格式转换" from the "ParseRule" in config
    And I choose the "ip" from the "SourceField" in config
    And I click the "EnsureAddParseRule" button
    And I wait for "ParseButton" will be visible
    And I click the "ParseButton" button
    And I wait for "CheckSuccess2" will be visible
    Then I will see the element value in json "{'Result':'<result1>'}"
    And I click the "NextButton" button under some element
    And I click the "SwitchButton" button
    When I set the parameter "Name" with value "RZY1555IP格式转换"
    And I set the parameter "Logtype" with value "other"
    And I set the parameter "AppName" with value "auto_test_ip"
    And I set the parameter "Tag" with value "auto_test_ip"
    And I click the "Done" button
    Then I wait for "ConfigDone" will be visible

    Examples:
      | result                                            | result1                                               |
      | Object\nip:"3651919938"\nraw_message:"3651919938" | Object\nip:"217.171.224.66"\nraw_message:"3651919938" |

  Scenario Outline: 上传日志
    When open the "localUpload.ListPage" page for uri "/sources/input/os/"
    And I set the parameter "AppName" with value "<appName>"
    And I set the parameter "Tag" with value "<appName>"
    And I upload a file with name "/src/test/resources/testdata/log/<log>"
    And I click the "UploadButton" button
    And I wait for element "VerifyText" change text to "上传完成"

    Examples:
      | appName      | log    |
      | auto_test_ip | ip.log |
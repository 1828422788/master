@configsSmoke
Feature: 字段提取手机号码解析

  Scenario Outline: RZY-2802、2803
    Given open the "configs.ListPage" page for uri "/configs/"
    And I click the "CreateButton" button
    Then I will see the "configs.CreatePage" page
    When I set the parameter "LogSample" with value "18840824121"
    And I click the "AddRule" button
    And I choose the "手机号码解析" from the "ParseRule"
    And I choose the "raw_message" from the "SourceField"
    And I click the "<check>" button
    And I click the "EnsureAddParseRule" button
    And I wait for "ParseButton" will be visible
    And I click the "ParseButton" button
    And I wait for "CheckSuccess" will be visible
    Then I will see the element value in json "{'Result':'<result>'}"
    And I click the "NextButton" button under some element
    And I click the "SwitchButton" button
    When I set the parameter "Name" with value "<name>"
    And I set the parameter "Logtype" with value "other"
    And I set the parameter "AppName" with value "<appName>"
    And I set the parameter "Tag" with value "<appName>"
    And I click the "NextButton" button
    Then I wait for "ConfigDone" will be visible

    Examples:
      | name           | check    | result                                                                                                                                                          | appName       |
      | RZY2802手机号码解析  |          | Object\ngeo:Object\ncity:"大连市"\ncountry:"中国"\nisp:"中国移动"\nlatitude:38.94381\nlongitude:121.57652\nphone:"18840824121"\nprovince:"辽宁"\nraw_message:"18840824121" | auto_test_n   |
      | RZY2803解析到顶层字段 | Checkbox | Object\ncity:"大连市"\ncountry:"中国"\nisp:"中国移动"\nlatitude:38.94381\nlongitude:121.57652\nprovince:"辽宁"\nraw_message:"18840824121"                                  | auto_test_tel |

  Scenario Outline: 上传日志
    When open the "localUpload.ListPage" page for uri "/sources/input/os/"
    And I set the parameter "AppName" with value "<appName>"
    And I set the parameter "Tag" with value "<appName>"
    And I upload a file with name "/src/test/resources/testdata/log/<log>"
    And I click the "UploadButton" button
    And I wait for element "VerifyText" change text to "上传完成"

    Examples:
      | appName       | log     |
      | auto_test_n   | tel.log |
      | auto_test_tel | tel.log |
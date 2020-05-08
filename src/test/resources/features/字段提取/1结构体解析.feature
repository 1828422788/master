@configsSmoke
Feature: 字段提取结构体解析

  Scenario Outline: RZY-2863:非严格解析
    Given open the "configs.ListPage" page for uri "/configs/"
    And I click the "Create" button
    Then I will see the "configs.CreatePage" page
    When I set the parameter "LogSample" with value "aaa 111"
    And I click the "AddRule" button
    And I choose the "结构体解析" from the "ParseRule" in config
    And I choose the "raw_message" from the "SourceField" in config
    And I set the parameter "Struct" with value "<struct>"
    And I click the "EnsureAddParseRule" button
    And I wait for "ParseButton" will be visible
    And I click the "ParseButton" button
    And I wait for "CheckSuccess" will be visible
    Then I will see the element value in json "{'Result':'<result>'}"

    Examples:
      | struct         | result                                            |
      | name:3,val:3:i | Object\nname:"aaa"\nval:11\nraw_message:"aaa 111" |

  Scenario Outline: RZY-2862:严格解析
    Given open the "configs.ListPage" page for uri "/configs/"
    And I click the "Create" button
    Then I will see the "configs.CreatePage" page
    When I set the parameter "LogSample" with value "aaa 111"
    And I click the "AddRule" button
    And I choose the "结构体解析" from the "ParseRule" in config
    And I choose the "raw_message" from the "SourceField" in config
    And I set the parameter "Struct" with value "<struct>"
    And I click the "Checkbox" button
    And I click the "EnsureAddParseRule" button
    And I wait for "ParseButton" will be visible
    And I click the "ParseButton" button
    And I wait for "CheckSuccess" will be visible
    Then I will see the element value in json "{'Result':'<result>'}"
    And I click the "NextButton" button under some element
    And I click the "SwitchButton" button
    When I set the parameter "Name" with value "RZY2862严格解析"
    And I set the parameter "Logtype" with value "other"
    And I set the parameter "AppName" with value "auto_test_codec"
    And I set the parameter "Tag" with value "auto_test_codec"
    And I click the "Done" button
    Then I wait for "ConfigDone" will be visible

    Examples:
      | struct         | result                                             |
      | name:3,val:4:i | Object\nname:"aaa"\nval:111\nraw_message:"aaa 111" |

  Scenario Outline: 上传日志
    When open the "localUpload.ListPage" page for uri "/sources/input/os/"
    And I set the parameter "AppName" with value "<appName>"
    And I set the parameter "Tag" with value "<appName>"
    And I upload a file with name "/src/test/resources/testdata/log/<log>"
    And I click the "UploadButton" button
    And I wait for element "VerifyText" change text to "上传完成"

    Examples:
      | appName         | log       |
      | auto_test_codec | 结构体解析.log |

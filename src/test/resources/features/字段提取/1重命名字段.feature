@configsSmoke
Feature: 字段提取重命名字段

  @second
  Scenario Outline: 字段重命名（RZY-1590）
    Given open the "configs.ListPage" page for uri "/configs/"
    And I click the "Create" button
    Then I will see the "configs.CreatePage" page
    When I set the parameter "LogSample" with value "<log>"
    And I click the "AddRule" button
    And I choose the "JSON解析" from the "ParseRule"
    And I choose the "raw_message" from the "SourceField"
    And I click the "EnsureAddParseRule" button
    And I wait for "ParseButton" will be visible
    And I click the "ParseButton" button
    And I wait for "CheckSuccess" will be visible
    Then I will see the element value in json "{'Result':'<result>'}"
    And I click the "AddRule" button
    And I choose the "字段重命名" from the "ParseRule"
    And I set the parameter "SourceFieldInput" with value "a.b.c"
    And I set the parameter "TargetField" with value "c"
    And I click the "EnsureAddParseRule" button
    And I wait for "ParseButton" will be visible
    And I click the "ParseButton" button
    And I wait for "CheckSuccess2" will be visible
    Then I will see the element value in json "{'Result':'<result1>'}"

    Examples:
      | log                   | result                                                                 | result1                                            |
      | {"a":{"b":{"c":"d"}}} | Object\na:Object\nb:Object\nc:"d"\nraw_message:"{"a":{"b":{"c":"d"}}}" | Object\nc:"d"\nraw_message:"{"a":{"b":{"c":"d"}}}" |

  @second @configsSmoke
  Scenario Outline: RZY-2865、2866
    Given open the "configs.ListPage" page for uri "/configs/"
    And I click the "Create" button
    Then I will see the "configs.CreatePage" page
    When I set the parameter "LogSample" with value "<log>"
    And I click the "AddRule" button
    And I choose the "JSON解析" from the "ParseRule"
    And I choose the "raw_message" from the "SourceField"
    And I click the "EnsureAddParseRule" button
    And I wait for "ParseButton" will be visible
    And I click the "ParseButton" button
    And I wait for "CheckSuccess" will be visible
    Then I will see the element value in json "{'Result':'<result>'}"
    And I click the "AddRule" button
    And I choose the "字段重命名" from the "ParseRule"
    And I set the parameter "SourceFieldInput" with value "a.*.c"
    And I set the parameter "TargetField" with value "a.*.h"
    And I click the "EnsureAddParseRule" button
    And I wait for "ParseButton" will be visible
    And I click the "ParseButton" button
    And I wait for "CheckSuccess2" will be visible
    Then I will see the element value in json "{'Result':'<result1>'}"
    And I click the "NextButton" button under some element
    And I click the "SwitchButton" button
    When I set the parameter "Name" with value "RZY2865支持通配符"
    And I set the parameter "Logtype" with value "other"
    And I set the parameter "AppName" with value "auto_test_rename"
    And I set the parameter "Tag" with value "auto_test_rename"
    And I click the "Done" button
    Then I wait for "ConfigDone" will be visible

    Examples:
      | log                                 | result                                                                                                | result1                                                                                               |
      | {"a":{"b":{"c":"d"},"e":{"c":"g"}}} | Object\na:Object\nb:Object\nc:"d"\ne:Object\nc:"g"\nraw_message:"{"a":{"b":{"c":"d"},"e":{"c":"g"}}}" | Object\na:Object\nb:Object\nh:"d"\ne:Object\nh:"g"\nraw_message:"{"a":{"b":{"c":"d"},"e":{"c":"g"}}}" |

  Scenario Outline: 上传日志
    When open the "localUpload.ListPage" page for uri "/sources/input/os/"
    And I set the parameter "AppName" with value "<appName>"
    And I set the parameter "Tag" with value "<appName>"
    And I upload a file with name "/src/test/resources/testdata/log/<lg>"
    And I click the "UploadButton" button
    And I wait for element "VerifyText" change text to "上传完成"

    Examples:
      | appName          | lg        |
      | auto_test_rename | rename.log |

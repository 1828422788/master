@configsSmoke
Feature: 字段提取Hex转换

  Scenario Outline: RZY-2825：hex转换
    Given open the "configs.ListPage" page for uri "/configs/"
    And I click the "Create" button
    Then I will see the "configs.CreatePage" page
    When I set the parameter "LogSample" with value "e5a4a7e9bb91e5b1b1"
    And I click the "AddRule" button
    And I choose the "hex转换" from the "ParseRule"
    And I choose the "raw_message" from the "SourceField"
    And I set the parameter "Code" with value "utf-8"
    And I click the "EnsureAddParseRule" button
    And I wait for "ParseButton" will be visible
    And I click the "ParseButton" button
    And I wait for "CheckSuccess" will be visible
    Then I will see the element value in json "{'Result':'<result>'}"

    Examples:
      | result                    |
      | Object\nraw_message:"大黑山" |

  Scenario Outline: RZY-2826:高级模式下start_offset的使用
    Given open the "configs.ListPage" page for uri "/configs/"
    And I click the "Create" button
    Then I will see the "configs.CreatePage" page
    When I set the parameter "LogSample" with value "00000000: 696d 706f 7274 2073 7973 0a69 6d70 6f72"
    And I click the "AddRule" button
    And I choose the "hex转换" from the "ParseRule"
    And I click the "ChangeToJson" button under some element
    And I set the parameter "{"source": "raw_message","codec_type": "GBK","start_offset":10,"column_bytes":16}" to json editor
    And I click the "EnsureAddParseRule" button
    And I wait for "ParseButton" will be visible
    And I click the "ParseButton" button
    And I wait for "CheckSuccess" will be visible
    Then I will see the element value in json "{'Result':'<result>'}"
    And I click the "NextButton" button under some element
    And I click the "SwitchButton" button
    When I set the parameter "Name" with value "RZY2826高级模式下start_offset的使用"
    And I set the parameter "Logtype" with value "other"
    And I set the parameter "AppName" with value "auto_test_hex"
    And I set the parameter "Tag" with value "auto_test_hex"
    And I click the "NextButton" button
    Then I wait for "ConfigDone" will be visible

    Examples:
      | result                                 |
      | Object\nraw_message:"import sys impor" |

  Scenario Outline: 上传日志
    When open the "localUpload.ListPage" page for uri "/sources/input/os/"
    And I set the parameter "AppName" with value "<appName>"
    And I set the parameter "Tag" with value "<appName>"
    And I upload a file with name "/src/test/resources/testdata/log/<log>"
    And I click the "UploadButton" button
    And I wait for element "VerifyText" change text to "上传完成"

    Examples:
      | appName       | log     |
      | auto_test_hex | hex.log |
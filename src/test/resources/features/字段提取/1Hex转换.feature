@configsSmoke
Feature: 字段提取Hex转换

  Scenario Outline: RZY-2825：hex转换
    Given open the "configs.ListPage" page for uri "/configs/"
    And I click the "CreateButton" button
    Then I will see the "configs.CreatePage" page
    When I set the parameter "Name" with value "AutoTest"
    And I set the parameter "Logtype" with value "test"
    When I set the parameter "LogSample" with value "e5a4a7e9bb91e5b1b1"
    And I choose the "Hex转换" from the "ParseRule"
    And I alter the element "ExtractSample" class to "yw-extract-sample yw-extract-sample-container"
    And I choose the "raw_message" from the "SourceField"
    And I set the parameter "Code" with value "utf-8"
    And I click the "ParseButton" button
    And I wait for "CheckSuccess" will be visible
    Then I will see the element value in json "{'Result':'<result>'}"

    Examples:
      | result                    |
      | Object\nraw_message:"大黑山" |

  Scenario Outline: RZY-2826:高级模式下start_offset的使用
    Given open the "configs.ListPage" page for uri "/configs/"
    And I click the "CreateButton" button
    Then I will see the "configs.CreatePage" page
    When I set the parameter "Name" with value "RZY2826高级模式下start_offset的使用"
    And I set the parameter "Logtype" with value "other"
    When I set the parameter "LogSample" with value "00000000: 696d 706f 7274 2073 7973 0a69 6d70 6f72"
    And I choose the "Hex转换" from the "ParseRule"
    And I alter the element "ExtractSample" class to "yw-extract-sample yw-extract-sample-container"
    And I click the "ChangeToJson" button under some element
    And I set the parameter "{"source": "raw_message","codec_type": "GBK","start_offset":10,"column_bytes":16}" to json editor
    And I click the "ParseButton" button
    And I wait for "CheckSuccess" will be visible
    Then I will see the element value in json "{'Result':'<result>'}"
    And I click the "NextButton" button under some element
    And I click the "SwitchButton" button
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

  Scenario Outline: RZY-2866:在搜索页验证
    When open the "splSearch.SearchPage" page for uri "/search/"
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I set the parameter "SearchInput" with value "tag:<tag>"
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I click the "RightIcon" button
    Then I will see the spl search result "<result>"

    Examples:
      | tag           | result                             |
      | auto_test_hex | {'raw_message':'import sys impor'} |

#  Scenario Outline: 验证详情
#    Given open the "configs.ListPage" page for uri "/configs/"
#    When the data name is "RZY2826高级模式下start_offset的使用" then i click the "详情" button
#    Then I will see the config element "Hex转换" value is "Hex转换<result>"
#
#    Examples:
#      | result          |
#      | \n1\n1\n0\n0\n0 |
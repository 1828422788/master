@configs @configs07
Feature: 字段提取Hex转换


  @configsSmoke
  Scenario Outline: RZY-2825: hex转换
    Given open the "configs.ListPage" page for uri "/configs/"
    Then I wait for loading invisible
    And I click the "Create" button
    Then I will see the "configs.CreatePage" page
    When I set the parameter "LogSample" with value "e5a4a7e9bb91e5b1b1"
    And I click the "AddRule" button
    And I choose the "hex转换" from the "ParseRule" in config
    And I wait for "1000" millsecond
    And I choose the "raw_message" from the "SourceField" in config
    Then I wait for "1000" millsecond
    And I set the parameter "Code" with value "utf-8"
    And I click the "EnsureAddParseRule" button
    And I click the "ParseButton" button
    And I wait for "CheckSuccess" will be visible
    Then I will see the element value in json "{'Result':'<result>'}"

    Examples:
      | result                    |
      | Object\nraw_message:"大黑山" |

  Scenario Outline: RZY-2826:高级模式下start_offset的使用
    Given open the "configs.ListPage" page for uri "/configs/"
    Then I wait for loading invisible
    And I click the "Create" button
    Then I will see the "configs.CreatePage" page
    When I set the parameter "LogSample" with value "00000000: 696d 706f 7274 2073 7973 0a69 6d70 6f72"
    And I click the "AddRule" button
    And I choose the "hex转换" from the "ParseRule" in config
    And I click the "ChangeToJson" button under some element
    And I set the parameter "{"source": "raw_message","codec_type": "GBK","start_offset":10,"column_bytes":16}" to json editor in field parsing
    And I click the "EnsureAddParseRule" button
    And I wait for loading invisible
    And I click the "ParseButton" button
    And I wait for "CheckSuccess" will be visible
    Then I will see the element value in json "{'Result':'<result>'}"
    And I click the "Collapse" button
    And I click the "NextButton" button under some element
    And I switch the "SwitchButton" button to "enable"
    When I set the parameter "Name" with value "RZY2826高级模式下start_offset的使用"
    And I set the parameter "Logtype" with value "other"
    Then I wait for "1000" millsecond
    And I set the parameter "AppName" with value "<appName>"
    And I set the parameter "Tag" with value "<appName>"
    And I click the "Done" button
    Then I wait for "ConfigDone" will be visible

    Examples:
      | appName      | result                                |
      | wym_test_hex | Object\nraw_message:"import sys impor" |


  Scenario Outline: RZY-2826:上传日志，验证结果
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
      | appName       | log    | searchResult                      |
      | wym_test_hex | hex.log | {'raw_message':'import sys\nimpor'} |
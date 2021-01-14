@configsSmoke
Feature: 字段提取Hex转换

  Scenario Outline: RZY-2825: hex转换
    Given open the "configs.ListPage" page for uri "/configs/"
    Then I wait for loading invisible
    And I click the "Create" button
    Then I will see the "configs.CreatePage" page
    When I set the parameter "LogSample" with value "e5a4a7e9bb91e5b1b1"
    And I click the "AddRule" button
    And I choose the "hex转换" from the "ParseRule" in config
    And I choose the "raw_message" from the "SourceField" in config
    Then I wait for "1000" millsecond
    And I set the parameter "Code" with value "utf-8"
    And I click the "EnsureAddParseRule" button
    And I wait for "ParseButton" will be visible
    Then I wait for "100" millsecond
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
    And I wait for "ParseButton" will be visible
    Then I wait for "100" millsecond
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
#    When open the "localUpload.ListPage" page for uri "/sources/input/os/"
#    And I set the parameter "AppName" with value "<appName>"
#    And I set the parameter "Tag" with value "<appName>"
#    And I upload a file with name "/src/test/resources/testdata/log/<log>"
#    And I click the "UploadButton" button
#    And I wait for element "VerifyText" change text to "上传完成"
#    Then I wait for "40000" millsecond
#    When open the "splSearch.SearchPage" page for uri "/search/"
#    And I wait for element "SearchStatus" change text to "搜索完成!"
#    And I set the parameter "SearchInput" with value "tag:<appName>"
#    And I click the "DateEditor" button
#    And I click the "Today" button
#    And I click the "SearchButton" button
#    And I wait for element "SearchStatus" change text to "搜索完成!"
#    Then I move the mouse pointer to the "Result"
#    And I click the "RightIcon" button
#    Then I will see the spl search result "<searchResult>"

    Examples:
      | appName       | log     | result                                 | searchResult                                    |
      | wym_test_hex | hex.log | Object\nraw_message:"import sys impor" | {'raw_message':'raw_message: import sys\nimpor'} |


  Scenario Outline: hex详情验证
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
    And I wait for "ParseButton" will be visible
    Then I wait for "100" millsecond
    And I click the "ParseButton" button
    And I wait for "CheckSuccess" will be visible
    Then I will see the element value in json "{'Result':'<result>'}"
    And I click the "Collapse" button
    And I click the "NextButton" button under some element
    When I set the parameter "Name" with value "<name>"
    And I set the parameter "Logtype" with value "other"
    And I set the parameter "AppName" with value "<appName>"
    And I set the parameter "Tag" with value "<appName>"
    And I switch the "SwitchButton" button to "enable"
    And I click the "Done" button
    Then I wait for "ConfigDone" will be visible
#    When open the "localUpload.ListPage" page for uri "/sources/input/os/"
#    And I set the parameter "AppName" with value "<appName>"
#    And I set the parameter "Tag" with value "<appName>"
#    And I upload a file with name "/src/test/resources/testdata/log/<log>"
#    And I click the "UploadButton" button
#    And I wait for element "VerifyText" change text to "上传完成"
#    Then I wait for "90000" millsecond
#    Given open the "configs.ListPage" page for uri "/configs/"
#    Then I wait for loading invisible
#    When the data name is "{'column':'1','name':'<name>'}" then i click the "详情" button
#    And I wait for loading invisible
#    Then I will see the config element "<rule1>" value is "<rule1> 1 1 0 0 0"

    Examples:
      | name    | rule1 | appName       | log     | result                                 |
      | hex详情验证 | hex转换 | hex_detail | hex.log | Object\nraw_message:"import sys impor" |

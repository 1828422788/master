@configs19 @configs
Feature: 字段提取正则片段解析


  Scenario Outline: RZY-2872:建立正则片段解析规则
    Given open the "configs.ListPage" page for uri "/configs/"
    Then I wait for loading invisible
    And I click the "Create" button
    Then I will see the "configs.CreatePage" page
    When I set the parameter "LogSample" with value "2014-11-07 11:18:33 192.168.1.1 FW-LZQ-MGJZZS-ASA5505-01 %ASA-5-502103: User priv level changed: Uname: enable_15 From: 1 To: 15"
    And I click the "AddRule" button
    And I choose the "正则解析" from the "ParseRule" in config
    Then I wait for "1000" millsecond
    And I click the "ChangeToJson" button under some element
    And I set the parameter "{"source": "raw_message","multiline": false,"extract": [[{"regex": "[Uu]ser\\s[\"|']([^'\"]*)[\"|']","fields": {"user": "$1"},"name": "user_for_cisco"}, {"regex": "\\sUname:\\s(.*?)\\s","fields": {"user": "$1"},"name": "uname_for_cisco"}]],"add_fields": []}" to json editor in field parsing
    And I click the "EnsureAddParseRule" button
    And I click the "ParseButton" button
    And I wait for "CheckSuccess" will be visible
    Then I will see the element value in json "{'Result':'<result>'}"
    And I click the "Collapse" button
    And I click the "NextButton" button under some element
    When I set the parameter "Name" with value "RZY2872正则片段解析"
    And I set the parameter "Logtype" with value "other"
    And I set the parameter "AppName" with value "<appName>"
    And I set the parameter "Tag" with value "<appName>"
    And I switch the "SwitchButton" button to "enable"
    And I click the "Done" button

    Examples:
      | appName                 | result                                                                                                                                                                   |
      | wym_test_regexfragment1 | Object\nuser:"enable_15"\nraw_message:"2014-11-07 11:18:33 192.168.1.1 FW-LZQ-MGJZZS-ASA5505-01 %ASA-5-502103: User priv level changed: Uname: enable_15 From: 1 To: 15" |


  Scenario Outline: RZY-2872:上传日志，验证结果
    When open the "localUpload.ListPage" page for uri "/sources/input/os/"
    And I set the parameter "AppName" with value "<appName>"
    And I set the parameter "Tag" with value "<appName>"
    And I upload a file with name "/src/test/resources/testdata/log/<log>"
    And I click the "UploadButton" button
    Then I wait for loading invisible
    And I will see the element "VerifyText" contains "上传完成"
    And I click the "Confirm" button
    And I wait for loading invisible
    When I will see the "splSearch.SearchPage" page
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I will see the element "SearchInput" contains "appname:"<appName>" AND tag:"<appName>""
    Then I move the mouse pointer to the "Result"
    And I click the "RightIcon" button
    Then I will see the spl search result "<searchResult>"
    And I wait for "5000" millsecond

    Examples:
      | appName                 | log        | searchResult         |
      | wym_test_regexfragment1 | regex1.log | {"other.user":"enable_15"} |
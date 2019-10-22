@configsSmoke
Feature: 字段提取正则片段解析

  Scenario Outline: RZY-2872:建立正则片段解析规则
    Given open the "configs.ListPage" page for uri "/configs/"
    And I click the "CreateButton" button
    Then I will see the "configs.CreatePage" page
    When I set the parameter "LogSample" with value "2014-11-07 11:18:33 192.168.1.1 FW-LZQ-MGJZZS-ASA5505-01 %ASA-5-502103: User priv level changed: Uname: enable_15 From: 1 To: 15"
    And I click the "AddRule" button
    And I choose the "正则解析" from the "ParseRule"
    And I click the "ChangeToJson" button under some element
    And I set the parameter "{"source": "raw_message","multiline": false,"extract": [[{"regex": "[Uu]ser\\s[\"|']([^'\"]*)[\"|']","fields": {"user": "$1"},"name": "user_for_cisco"}, {"regex": "\\sUname:\\s(.*?)\\s","fields": {"user": "$1"},"name": "uname_for_cisco"}]],"add_fields": []}" to json editor
    And I click the "EnsureAddParseRule" button
    And I wait for "ParseButton" will be visible
    And I click the "ParseButton" button
    And I wait for "CheckSuccess" will be visible
    Then I will see the element value in json "{'Result':'<result>'}"

    Examples:
      | result                                                                                                                                                                   | result1                                                                                                                                                                                           |
      | Object\nuser:"enable_15"\nraw_message:"2014-11-07 11:18:33 192.168.1.1 FW-LZQ-MGJZZS-ASA5505-01 %ASA-5-502103: User priv level changed: Uname: enable_15 From: 1 To: 15" | Object\nuser:"enable_15"\nraw_message:"2014-11-07 11:18:33 192.168.1.1 FW-LZQ-MGJZZS-ASA5505-01 %ASA-5-111010: User \'enable_15\', running \'CLI\' from IP 192.168.1.11, executed \'debug http\'" |

  Scenario Outline: RZY-2872:建立正则片段解析规则
    Given open the "configs.ListPage" page for uri "/configs/"
    And I click the "CreateButton" button
    Then I will see the "configs.CreatePage" page
    And I set the parameter "LogSample" with value "2014-11-07 11:18:33 192.168.1.1 FW-LZQ-MGJZZS-ASA5505-01 %ASA-5-111010: User 'enable_15', running 'CLI' from IP 192.168.1.11, executed 'debug http'"
    And I click the "AddRule" button
    And I choose the "正则解析" from the "ParseRule"
    And I click the "ChangeToJson" button under some element
    And I set the parameter "{"source": "raw_message","multiline": false,"extract": [[{"regex": "[Uu]ser\\s[\"|']([^'\"]*)[\"|']","fields": {"user": "$1"},"name": "user_for_cisco"}, {"regex": "\\sUname:\\s(.*?)\\s","fields": {"user": "$1"},"name": "uname_for_cisco"}]],"add_fields": []}" to json editor
    And I click the "EnsureAddParseRule" button
    And I wait for "ParseButton" will be visible
    And I click the "ParseButton" button
    And I wait for "CheckSuccess" will be visible
    Then I will see the element value in json "{'Result':'<result>'}"
    And I click the "NextButton" button under some element
    And I click the "SwitchButton" button
    When I set the parameter "Name" with value "RZY2872正则片段解析"
    And I set the parameter "Logtype" with value "other"
    And I set the parameter "AppName" with value "regex"
    And I set the parameter "Tag" with value "*"
    And I click the "NextButton" button

    Examples:
      | result                                                                                                                                                                                            |
      | Object\nuser:"enable_15"\nraw_message:"2014-11-07 11:18:33 192.168.1.1 FW-LZQ-MGJZZS-ASA5505-01 %ASA-5-111010: User \'enable_15\', running \'CLI\' from IP 192.168.1.11, executed \'debug http\'" |

  Scenario Outline: 上传日志
    When open the "localUpload.ListPage" page for uri "/sources/input/os/"
    And I set the parameter "AppName" with value "<appName>"
    And I set the parameter "Tag" with value "<tag>"
    And I upload a file with name "/src/test/resources/testdata/log/<log>"
    And I click the "UploadButton" button
    And I wait for element "VerifyText" change text to "上传完成"

    Examples:
      | appName | tag | log        |
      | regex   | 1   | regex1.log |
      | regex   | 2   | regex2.log |

  Scenario Outline: RZY-2873:在搜索页验证
    When open the "splSearch.SearchPage" page for uri "/search/"
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I set the parameter "SearchInput" with value "<spl>"
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I click the "RightIcon" button
    Then I will see the spl search result "<result>"

    Examples:
      | spl                     | result                     |
      | appname:regex AND tag:1 | {"other.user":"enable_15"} |
      | appname:regex AND tag:2 | {"other.user":"enable_15"} |

  Scenario Outline: 验证详情
    Given open the "configs.ListPage" page for uri "/configs/"
    And I wait for loading complete
    When the data name is "RZY2872正则片段解析" then i click the "详情" button
    And I wait for "SmallTr" will be visible
    Then I will see the config element "正则解析" value is "正则解析<result>"

    Examples:
      | result          |
      | \n2\n2\n0\n0\n0 |
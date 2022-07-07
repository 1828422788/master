@configs @configsCustomAdvanced
Feature: 字段提取自定义配置高级算子

  @configsSmoke
  Scenario Outline: RZY-2870:创建dissect解析
    Given open the "configs.ListPage" page for uri "/configs/"
    Then I wait for loading invisible
    And I click the "Create" button
    Then I will see the "configs.CreatePage" page
    When I set the parameter "LogSample" with value "http://rizhiyi.com/index.do?id=123"
    And I click the "AddRule" button
    And I choose the "自定义解析" from the "ParseRule"
    And I choose the "dissect" from the "RuleName"
    And I set the parameter "{"enable_escape": true,"format": "http://%{domain}/%{url}?%{arg}=%{@arg:i}","source": "raw_message","strict_mode": false}" to json editor in field parsing
    And I click the "EnsureAddParseRule" button
    And I wait for loading invisible
    And I click the "ParseButton" button
    And I wait for "CheckSuccess" will be visible
    Then I will see the field extraction result "<result>"
    And I click the "Collapse" button
    And I click the "NextButton" button
    When I set the parameter "Name" with value "RZY2870创建dissect解析"
    And I set the parameter "Logtype" with value "other"
    And I set the parameter "AppName" with value "<tag>"
    And I set the parameter "Tag" with value "<tag>"
    And I switch the "SwitchButton" button to "enable"
    And I click the "Done" button
    And I will see the element "ResultMessage" contains "新建成功"

    Examples:
      | tag              | result                                                                                                        |
      | wym_test_dissect | {'domain':'rizhiyi.com','id':'123','url':'index.do','raw_message':'http://rizhiyi.com/index.do?id=123'} |

  @configsSmoke
  Scenario Outline: RZY-2870:dissect解析,上传日志，验证结果
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
      | appName          | log         | searchResult                                                           |
      | wym_test_dissect | dissect.log | {"other.id":"123","other.domain":"rizhiyi.com","other.url":"index.do"} |

  Scenario Outline: RZY-2875:创建script解析规则
    Given open the "configs.ListPage" page for uri "/configs/"
    Then I wait for loading invisible
    And I click the "Create" button
    Then I will see the "configs.CreatePage" page
    When I set the parameter "LogSample" with value "{"fields":["time","count"],"values":[1516189,5664]}"
    And I click the "AddRule" button
    And I choose the "JSON解析" from the "ParseRule"
    And I choose the "raw_message" from the "SourceField"
    And I click the "EnsureAddParseRule" button
    And I wait for loading invisible
    And I click the "ParseButton" button
    And I wait for "CheckSuccess" will be visible
    And I click the "Collapse" button
    And I click the "AddRule" button
    And I choose the "自定义解析" from the "ParseRule"
    And I choose the "script" from the "RuleName"
    And I set the parameter "{"script":"source[\"result\"] = todict(mvzip(source[\"fields\"],source[\"values\"]))"}" to json editor in field parsing
    And I click the "EnsureAddParseRule" button
    And I wait for loading invisible
    And I click the "ParseButton" button
    And I wait for "CheckSuccess2" will be visible
    Then I will see the field extraction result "<result>"
    And I click the "Collapse" button
    And I click the "NextButton" button
    When I set the parameter "Name" with value "RZY2875script解析"
    And I set the parameter "Logtype" with value "other"
    And I set the parameter "AppName" with value "<tag>"
    And I set the parameter "Tag" with value "<tag>"
    And I switch the "SwitchButton" button to "enable"
    And I click the "Done" button
    And I will see the element "ResultMessage" contains "新建成功"

    Examples:
      | tag             | result                                                                                             |
      | wym_test_script | {'result.count':'5664','result.time':'1516189','raw_message':'{"fields":["time","count"],"values":[1516189,5664]}'} |

  Scenario Outline: RZY-2875:script解析规则，上传日志，验证结果
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
      | log        | appName         | searchResult                                                |
      | script.log | wym_test_script | {"other.result.count":"5664","other.result.time":"1516189"} |

  Scenario Outline: RZY-2877:建立base64解析规则
    Given open the "configs.ListPage" page for uri "/configs/"
    Then I wait for loading invisible
    And I click the "Create" button
    Then I will see the "configs.CreatePage" page
    When I set the parameter "LogSample" with value "aGVsbG8gYmFzZTY0"
    And I click the "AddRule" button
    And I choose the "正则解析" from the "ParseRule"
    And I choose the "raw_message" from the "SourceField"
    And I set the value "(?<code>.*)" to the textarea "Regex"
    And I click the "EnsureAddParseRule" button
    And I wait for loading invisible
    And I click the "ParseButton" button
    And I wait for "CheckSuccess" will be visible
    Then I will see the field extraction result "<result>"
    And I click the "Collapse" button
    And I click the "AddRule" button
    And I choose the "base64解析" from the "ParseRule"
    And I choose the "code" from the "SourceField"
    And I click the "EnsureAddParseRule" button
    And I wait for loading invisible
    And I click the "ParseButton" button
    And I wait for "CheckSuccess2" will be visible
    Then I will see the field extraction result "<result1>"
    And I click the "Collapse" button
    And I click the "NextButton" button
    When I set the parameter "Name" with value "RZY2877base64解析"
    And I set the parameter "Logtype" with value "other"
    And I set the parameter "AppName" with value "<tag>"
    And I set the parameter "Tag" with value "<tag>"
    And I switch the "SwitchButton" button to "enable"
    And I click the "Done" button
    And I will see the element "ResultMessage" contains "新建成功"

    Examples:
      | tag             | result                                                          | result1                                                     |
      | wym_test_base64 | {'code':'aGVsbG8gYmFzZTY0','raw_message':'aGVsbG8gYmFzZTY0'}| {'code':'hello base64','raw_message':'aGVsbG8gYmFzZTY0'}|

  Scenario Outline: RZY-2877:base64解析规则,上传日志，验证结果
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
      | appName         | log        | searchResult                  |
      | wym_test_base64 | base64.log | {"other.code":"hello base64"} |

  Scenario Outline: RZY-2883:创建unicode解析规则
    Given open the "configs.ListPage" page for uri "/configs/"
    Then I wait for loading invisible
    And I click the "Create" button
    Then I will see the "configs.CreatePage" page
    When I set the parameter "LogSample" with value "PartyBasicInfoService_\u5ba2\u6237\u57fa\u672c\u4fe1\u606f\u670d\u52a1"
    And I click the "AddRule" button
    And I choose the "正则解析" from the "ParseRule"
    And I choose the "raw_message" from the "SourceField"
    And I set the value "(?<rr>.*)" to the textarea "Regex"
    And I click the "EnsureAddParseRule" button
    And I wait for loading invisible
    And I click the "ParseButton" button
    And I wait for "CheckSuccess" will be visible
    Then I will see the field extraction result "<result>"
    And I click the "Collapse" button
    And I click the "AddRule" button
    And I choose the "自定义解析" from the "ParseRule"
    And I choose the "codec" from the "RuleName"
    And I set the parameter "{"source": "rr","codec_type": "unicode_decode"}" to json editor in field parsing
    And I click the "EnsureAddParseRule" button
    And I wait for loading invisible
    And I click the "ParseButton" button
    And I wait for "CheckSuccess2" will be visible
    Then I will see the field extraction result "<result1>"
    And I click the "Collapse" button
    And I click the "NextButton" button
    When I set the parameter "Name" with value "RZY2883unicode解析"
    And I set the parameter "Logtype" with value "other"
    And I set the parameter "AppName" with value "<tag>"
    And I set the parameter "Tag" with value "<tag>"
    And I switch the "SwitchButton" button to "enable"
    And I click the "Done" button
    And I will see the element "ResultMessage" contains "新建成功"

    Examples:
      | tag              | result                                                                                                                                                                                                     | result1                                                                                                                                           |
      | wym_test_unicode | {'rr':'PartyBasicInfoService_\\\u5ba2\\\u6237\\\u57fa\\\u672c\\\u4fe1\\\u606f\\\u670d\\\u52a1','raw_message':'PartyBasicInfoService_\\\u5ba2\\\u6237\\\u57fa\\\u672c\\\u4fe1\\\u606f\\\u670d\\\u52a1'} | {'rr':'PartyBasicInfoService_客户基本信息服务','raw_message':'PartyBasicInfoService_\\\u5ba2\\\u6237\\\u57fa\\\u672c\\\u4fe1\\\u606f\\\u670d\\\u52a1'} |

  Scenario Outline: RZY-2883:unicode解析规则，上传日志，验证结果
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
      | appName          | log         | searchResult                                          |
      | wym_test_unicode | unicode.log | {"other.rr":"PartyBasicInfoService_客户基本信息服务"} |
@configsSmoke
Feature: 字段提取自定义配置高级算子

  Scenario Outline: RZY-2870:创建dissect解析
    Given open the "configs.ListPage" page for uri "/configs/"
    And I click the "CreateButton" button
    Then I will see the "configs.CreatePage" page
    When I set the parameter "LogSample" with value "http://rizhiyi.com/index.do?id=123"
    And I click the "AddRule" button
    And I choose the "自定义解析" from the "ParseRule"
    And I set the parameter "RuleName" with value "dissect"
    And I set the parameter "{"enable_escape": true,"format": "http://%{domain}/%{url}?%{arg}=%{@arg:i}","source": "raw_message","strict_mode": false}" to json editor
    And I click the "EnsureAddParseRule" button
    And I wait for "ParseButton" will be visible
    And I click the "ParseButton" button
    And I wait for "CheckSuccess" will be visible
    Then I will see the element value in json "{'Result':'<result>'}"
    And I click the "NextButton" button under some element
    And I click the "SwitchButton" button
    When I set the parameter "Name" with value "RZY2870创建dissect解析"
    And I set the parameter "Logtype" with value "other"
    And I set the parameter "AppName" with value "dissect"
    And I set the parameter "Tag" with value "dissect"
    And I click the "NextButton" button
    Then I wait for "ConfigDone" will be visible

    Examples:
      | result                                                                                                 |
      | Object\ndomain:"rizhiyi.com"\nid:123\nurl:"index.do"\nraw_message:"http://rizhiyi.com/index.do?id=123" |

  Scenario Outline: RZY-2875:创建script解析规则
    Given open the "configs.ListPage" page for uri "/configs/"
    And I click the "CreateButton" button
    Then I will see the "configs.CreatePage" page
    When I set the parameter "LogSample" with value "{"fields":["time","count"],"values":[1516189,5664]}"
    And I click the "AddRule" button
    And I choose the "JSON解析" from the "ParseRule"
    And I choose the "raw_message" from the "SourceField"
    And I click the "EnsureAddParseRule" button
    And I wait for "ParseButton" will be visible
    And I click the "ParseButton" button
    And I wait for "CheckSuccess" will be visible
    Then I will see the element value in json "{'Result':'<result>'}"
    And I click the "AddRule" button
    And I choose the "自定义解析" from the "ParseRule"
    And I set the parameter "RuleName" with value "script"
    And I set the parameter "{"script":"source[\"result\"] = todict(mvzip(source[\"fields\"],source[\"values\"]))"}" to json editor
    And I click the "EnsureAddParseRule" button
    And I wait for "ParseButton" will be visible
    And I click the "ParseButton" button
    And I wait for "CheckSuccess2" will be visible
    Then I will see the element value in json "{'Result':'<result1>'}"
    And I click the "NextButton" button under some element
    And I click the "SwitchButton" button
    When I set the parameter "Name" with value "RZY2875script解析"
    And I set the parameter "Logtype" with value "other"
    And I set the parameter "AppName" with value "script"
    And I set the parameter "Tag" with value "script"
    And I click the "NextButton" button
    Then I wait for "ConfigDone" will be visible

    Examples:
      | result                                                                                                                                              | result1                                                                                                                                                                                      |
      | Object\nfields:Array[2]\n0:"time"\n1:"count"\nvalues:Array[2]\n0:1516189\n1:5664\nraw_message:"{"fields":["time","count"],"values":[1516189,5664]}" | Object\nfields:Array[2]\n0:"time"\n1:"count"\nresult:Object\ncount:5664\ntime:1516189\nvalues:Array[2]\n0:1516189\n1:5664\nraw_message:"{"fields":["time","count"],"values":[1516189,5664]}" |

  Scenario Outline: RZY-2877:建立base64解析规则
    Given open the "configs.ListPage" page for uri "/configs/"
    And I click the "CreateButton" button
    Then I will see the "configs.CreatePage" page
    When I set the parameter "LogSample" with value "aGVsbG8gYmFzZTY0"
    And I click the "AddRule" button
    And I choose the "正则解析" from the "ParseRule"
    And I choose the "raw_message" from the "SourceField"
    And I set the parameter "Regex" with value "(?<code>.*)"
    And I click the "EnsureAddParseRule" button
    And I wait for "ParseButton" will be visible
    And I click the "ParseButton" button
    And I wait for "CheckSuccess" will be visible
    Then I will see the element value in json "{'Result':'<result>'}"
    And I click the "AddRule" button
    And I choose the "base64解析" from the "ParseRule"
    And I choose the "code" from the "SourceField"
    And I click the "EnsureAddParseRule" button
    And I wait for "ParseButton" will be visible
    And I click the "ParseButton" button
    And I wait for "CheckSuccess2" will be visible
    Then I will see the element value in json "{'Result':'<result1>'}"
    And I click the "NextButton" button under some element
    And I click the "SwitchButton" button
    When I set the parameter "Name" with value "RZY2877base64解析"
    And I set the parameter "Logtype" with value "other"
    And I set the parameter "AppName" with value "base64"
    And I set the parameter "Tag" with value "base64"
    And I click the "NextButton" button
    Then I wait for "ConfigDone" will be visible

    Examples:
      | result                                                          | result1                                                     |
      | Object\ncode:"aGVsbG8gYmFzZTY0"\nraw_message:"aGVsbG8gYmFzZTY0" | Object\ncode:"hello base64"\nraw_message:"aGVsbG8gYmFzZTY0" |

  Scenario Outline: RZY-2883:创建unicode解析规则
    Given open the "configs.ListPage" page for uri "/configs/"
    And I click the "CreateButton" button
    Then I will see the "configs.CreatePage" page
    When I set the parameter "LogSample" with value "PartyBasicInfoService_\u5ba2\u6237\u57fa\u672c\u4fe1\u606f\u670d\u52a1"
    And I click the "AddRule" button
    And I choose the "正则解析" from the "ParseRule"
    And I choose the "raw_message" from the "SourceField"
    And I set the parameter "Regex" with value "(?<rr>.*)"
    And I click the "EnsureAddParseRule" button
    And I wait for "ParseButton" will be visible
    And I click the "ParseButton" button
    And I wait for "CheckSuccess" will be visible
    Then I will see the element value in json "{'Result':'<result>'}"
    And I click the "AddRule" button
    And I choose the "自定义解析" from the "ParseRule"
    And I set the parameter "RuleName" with value "codec"
    And I set the parameter "{"source": "rr","codec_type": "unicode_decode"}" to json editor
    And I click the "EnsureAddParseRule" button
    And I wait for "ParseButton" will be visible
    And I click the "ParseButton" button
    And I wait for "CheckSuccess2" will be visible
    Then I will see the element value in json "{'Result':'<result1>'}"
    And I click the "NextButton" button under some element
    And I click the "SwitchButton" button
    When I set the parameter "Name" with value "RZY2883unicode解析"
    And I set the parameter "Logtype" with value "other"
    And I set the parameter "AppName" with value "unicode"
    And I set the parameter "Tag" with value "unicode"
    And I click the "NextButton" button
    Then I wait for "ConfigDone" will be visible

    Examples:
      | result                                                                                                                                                                                                    | result1                                                                                                                                           |
      | Object\nrr:"PartyBasicInfoService_\\\u5ba2\\\u6237\\\u57fa\\\u672c\\\u4fe1\\\u606f\\\u670d\\\u52a1"\nraw_message:"PartyBasicInfoService_\\\u5ba2\\\u6237\\\u57fa\\\u672c\\\u4fe1\\\u606f\\\u670d\\\u52a1" | Object\nrr:"PartyBasicInfoService_客户基本信息服务"\nraw_message:"PartyBasicInfoService_\\\u5ba2\\\u6237\\\u57fa\\\u672c\\\u4fe1\\\u606f\\\u670d\\\u52a1" |

  Scenario Outline: 上传日志
    When open the "localUpload.ListPage" page for uri "/sources/input/os/"
    And I set the parameter "AppName" with value "<appName>"
    And I set the parameter "Tag" with value "<tag>"
    And I upload a file with name "/src/test/resources/testdata/log/<log>"
    And I click the "UploadButton" button
    And I wait for element "VerifyText" change text to "上传完成"

    Examples:
      | appName | tag     | log         |
      | dissect | dissect | dissect.log |
      | script  | script  | script.log  |
      | base64  | base64  | base64.log  |
      | unicode | unicode | unicode.log |

  Scenario Outline: RZY-3418:在搜索页验证
    When open the "splSearch.SearchPage" page for uri "/search/"
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I set the parameter "SearchInput" with value "<spl>"
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I click the "RightIcon" button
    Then I will see the spl search result "<result>"

    Examples:
      | spl             | result                                                                                                 |
      | appname:dissect | {"other.id":"other.id：123","other.domain":"other.domain：rizhiyi.com","other.url":"other.url：index.do"} |
      | appname:script  | {"other.result.count":"other.result.count：5664","other.result.time":"other.result.time：1516189"}       |
      | appname:base64  | {"other.code":"other.code：hello base64"}                                                               |
      | appname:unicode | {"other.rr":"other.rr：PartyBasicInfoService_客户基本信息服务"}                                                 |

  Scenario: 验证详情
    Given open the "configs.ListPage" page for uri "/configs/"
    When the data name is "{'column':'1','name':'RZY2870创建dissect解析'}" then i click the "详 情" button
    And I wait for "SmallTr" will be visible
    Then I will see the config element "自定义规则" value is "自定义规则 1 1 0 0 0"

  Scenario Outline: 验证详情
    Given open the "configs.ListPage" page for uri "/configs/"
    When the data name is "{'column':'1','name':'RZY2875script解析'}" then i click the "详 情" button
    And I wait for "SmallTr" will be visible
    Then I will see the config element "自定义规则" value is "自定义规则 <result>"
    Then I will see the config element "Json解析" value is "Json解析 <result>"

    Examples:
      | result    |
      | 1 1 0 0 0 |

  Scenario Outline: 验证详情
    Given open the "configs.ListPage" page for uri "/configs/"
    When the data name is "{'column':'1','name':'RZY2877base64解析'}" then i click the "详 情" button
    And I wait for "SmallTr" will be visible
    Then I will see the config element "Base64解析" value is "Base64解析 <result>"
    Then I will see the config element "正则解析" value is "正则解析 <result>"

    Examples:
      | result    |
      | 1 1 0 0 0 |

  Scenario Outline: 验证详情
    Given open the "configs.ListPage" page for uri "/configs/"
    And I wait for loading complete
    When the data name is "{'column':'1','name':'RZY2883unicode解析'}" then i click the "详 情" button
    And I wait for "SmallTr" will be visible
    Then I will see the config element "自定义规则" value is "自定义规则 <result>"
    Then I will see the config element "正则解析" value is "正则解析 <result>"

    Examples:
      | result    |
      | 1 1 0 0 0 |

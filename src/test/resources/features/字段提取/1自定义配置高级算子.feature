@configsSmoke @configs24
Feature: 字段提取自定义配置高级算子

  Background:
    Given open the "configs.ListPage" page for uri "/configs/"
    Then I wait for loading invisible

  @configs24a
  Scenario Outline: RZY-2870:创建dissect解析+搜索页验证
    And I click the "Create" button
    Then I will see the "configs.CreatePage" page
    When I set the parameter "LogSample" with value "http://rizhiyi.com/index.do?id=123"
    And I click the "AddRule" button
    And I choose the "自定义解析" from the "ParseRule" in config
    Then I wait for "1000" millsecond
    And I choose the "dissect" from the "RuleName" in config
    Then I wait for "1000" millsecond
    And I set the parameter "{"enable_escape": true,"format": "http://%{domain}/%{url}?%{arg}=%{@arg:i}","source": "raw_message","strict_mode": false}" to json editor in field parsing
    And I click the "EnsureAddParseRule" button
    And I wait for "ParseButton" will be visible
    Then I wait for "100" millsecond
    And I click the "ParseButton" button
    And I wait for "CheckSuccess" will be visible
    Then I will see the element value in json "{'Result':'<result>'}"
    And I click the "Collapse" button
    And I click the "NextButton" button under some element
    When I set the parameter "Name" with value "RZY2870创建dissect解析"
    And I set the parameter "Logtype" with value "other"
    And I set the parameter "AppName" with value "<tag>"
    And I set the parameter "Tag" with value "<tag>"
    And I switch the "SwitchButton" button to "enable"
    And I click the "Done" button
    Then I wait for "ConfigDone" will be visible

    Examples:
      | tag              | log         | result                                                                                                 | searchResult                                                                                                 |
      | wym_test_dissect | dissect.log | Object\ndomain:"rizhiyi.com"\nid:123\nurl:"index.do"\nraw_message:"http://rizhiyi.com/index.do?id=123" | {"other.id":"other.id: 123 ","other.domain":"other.domain: rizhiyi.com ","other.url":"other.url: index.do "} |

  @configs24b
  Scenario Outline: RZY-2870:创建dissect解析详情验证
    And I click the "Create" button
    Then I will see the "configs.CreatePage" page
    When I set the parameter "LogSample" with value "http://rizhiyi.com/index.do?id=123"
    And I click the "AddRule" button
    And I choose the "自定义解析" from the "ParseRule" in config
    Then I wait for "1000" millsecond
    And I choose the "dissect" from the "RuleName" in config
    Then I wait for "1000" millsecond
    And I set the parameter "{"enable_escape": true,"format": "http://%{domain}/%{url}?%{arg}=%{@arg:i}","source": "raw_message","strict_mode": false}" to json editor in field parsing
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
    And I set the parameter "AppName" with value "<tag>"
    And I set the parameter "Tag" with value "<tag>"
    And I switch the "SwitchButton" button to "enable"
    And I click the "Done" button
    Then I wait for "ConfigDone" will be visible

    Examples:
      | name        | rule1 | tag            | log         | result                                                                                                 |
      | dissect解析详情 | 自定义解析 | dissect_detail | dissect.log | Object\ndomain:"rizhiyi.com"\nid:123\nurl:"index.do"\nraw_message:"http://rizhiyi.com/index.do?id=123" |

  @configs24c
  Scenario Outline: RZY-2875:创建script解析规则+搜索验证
    And I click the "Create" button
    Then I will see the "configs.CreatePage" page
    When I set the parameter "LogSample" with value "{"fields":["time","count"],"values":[1516189,5664]}"
    And I click the "AddRule" button
    And I choose the "JSON解析" from the "ParseRule" in config
    Given I wait for loading complete
    And I wait for "1000" millsecond
    And I choose the "raw_message" from the "SourceField" in config
    Then I wait for "1000" millsecond
    And I click the "EnsureAddParseRule" button
    And I wait for "ParseButton" will be visible
    Then I wait for "100" millsecond
    And I click the "ParseButton" button
    And I wait for "CheckSuccess" will be visible
    Then I will see the element value in json "{'Result':'<result>'}"
    And I click the "Collapse" button
    And I click the "AddRule" button
    And I choose the "自定义解析" from the "ParseRule" in config
    Given I wait for loading complete
    And I wait for "1000" millsecond
    And I choose the "script" from the "RuleName" in config
    Then I wait for "1000" millsecond
    And I set the parameter "{"script":"source[\"result\"] = todict(mvzip(source[\"fields\"],source[\"values\"]))"}" to json editor in field parsing
    And I click the "EnsureAddParseRule" button
    And I wait for "ParseButton" will be visible
    Then I wait for "100" millsecond
    And I click the "ParseButton" button
    And I wait for "CheckSuccess2" will be visible
    Then I will see the element value in json "{'Result':'<result1>'}"
    And I click the "Collapse" button
    And I click the "NextButton" button under some element
    When I set the parameter "Name" with value "RZY2875script解析"
    And I set the parameter "Logtype" with value "other"
    And I set the parameter "AppName" with value "<tag>"
    And I set the parameter "Tag" with value "<tag>"
    And I switch the "SwitchButton" button to "enable"
    And I click the "Done" button
    Then I wait for "ConfigDone" will be visible

    Examples:
      | log        | tag             | result                                                                                                                                              | result1                                                                                                                                                                                      | searchResult                                                                                         |
      | script.log | wym_test_script | Object\nfields:Array[2]\n0:"time"\n1:"count"\nvalues:Array[2]\n0:1516189\n1:5664\nraw_message:"{"fields":["time","count"],"values":[1516189,5664]}" | Object\nfields:Array[2]\n0:"time"\n1:"count"\nresult:Object\ncount:5664\ntime:1516189\nvalues:Array[2]\n0:1516189\n1:5664\nraw_message:"{"fields":["time","count"],"values":[1516189,5664]}" | {"other.result.count":"other.result.count: 5664 ","other.result.time":"other.result.time: 1516189 "} |

  @configs24d
  Scenario Outline: RZY-2875:创建script解析详情验证
    And I click the "Create" button
    Then I will see the "configs.CreatePage" page
    When I set the parameter "LogSample" with value "{"fields":["time","count"],"values":[1516189,5664]}"
    And I click the "AddRule" button
    And I choose the "JSON解析" from the "ParseRule" in config
    Given I wait for loading complete
    And I wait for "1000" millsecond
    And I choose the "raw_message" from the "SourceField" in config
    Then I wait for "1000" millsecond
    And I click the "EnsureAddParseRule" button
    And I wait for "ParseButton" will be visible
    Then I wait for "100" millsecond
    And I click the "ParseButton" button
    And I wait for "CheckSuccess" will be visible
    Then I will see the element value in json "{'Result':'<result>'}"
    And I click the "Collapse" button
    And I click the "AddRule" button
    And I choose the "自定义解析" from the "ParseRule" in config
    Given I wait for loading complete
    And I wait for "1000" millsecond
    And I choose the "script" from the "RuleName" in config
    Then I wait for "1000" millsecond
    And I set the parameter "{"script":"source[\"result\"] = todict(mvzip(source[\"fields\"],source[\"values\"]))"}" to json editor in field parsing
    And I click the "EnsureAddParseRule" button
    And I wait for "ParseButton" will be visible
    Then I wait for "100" millsecond
    And I click the "ParseButton" button
    And I wait for "CheckSuccess2" will be visible
    Then I will see the element value in json "{'Result':'<result1>'}"
    And I click the "Collapse" button
    And I click the "NextButton" button under some element
    When I set the parameter "Name" with value "<name>"
    And I set the parameter "Logtype" with value "other"
    And I set the parameter "AppName" with value "<tag>"
    And I set the parameter "Tag" with value "<tag>"
    And I switch the "SwitchButton" button to "enable"
    And I click the "Done" button
    Then I wait for "ConfigDone" will be visible

    Examples:
      | name       | rule1 | rule2  | log        | tag           | result                                                                                                                                              | result1                                                                                                                                                                                      |
      | script解析详情 | 自定义解析 | JSON解析 | script.log | script_detail | Object\nfields:Array[2]\n0:"time"\n1:"count"\nvalues:Array[2]\n0:1516189\n1:5664\nraw_message:"{"fields":["time","count"],"values":[1516189,5664]}" | Object\nfields:Array[2]\n0:"time"\n1:"count"\nresult:Object\ncount:5664\ntime:1516189\nvalues:Array[2]\n0:1516189\n1:5664\nraw_message:"{"fields":["time","count"],"values":[1516189,5664]}" |

  @configs24e
  Scenario Outline: RZY-2877:建立base64解析规则+搜索验证
    And I click the "Create" button
    Then I will see the "configs.CreatePage" page
    When I set the parameter "LogSample" with value "aGVsbG8gYmFzZTY0"
    And I click the "AddRule" button
    And I choose the "正则解析" from the "ParseRule" in config
    Given I wait for loading complete
    And I wait for "1000" millsecond
    And I choose the "raw_message" from the "SourceField" in config
    Then I wait for "1000" millsecond
    And I set the value "(?<code>.*)" to the textarea "Regex"
    And I click the "EnsureAddParseRule" button
    And I wait for "ParseButton" will be visible
    Then I wait for "100" millsecond
    And I click the "ParseButton" button
    And I wait for "CheckSuccess" will be visible
    Then I will see the element value in json "{'Result':'<result>'}"
    And I click the "Collapse" button
    And I click the "AddRule" button
    And I choose the "base64解析" from the "ParseRule" in config
    Given I wait for loading complete
    And I wait for "1000" millsecond
    And I choose the "code" from the "SourceField" in config
    Then I wait for "1000" millsecond
    And I click the "EnsureAddParseRule" button
    And I wait for "ParseButton" will be visible
    Then I wait for "100" millsecond
    And I click the "ParseButton" button
    And I wait for "CheckSuccess2" will be visible
    Then I will see the element value in json "{'Result':'<result1>'}"
    And I click the "Collapse" button
    And I click the "NextButton" button under some element
    When I set the parameter "Name" with value "RZY2877base64解析"
    And I set the parameter "Logtype" with value "other"
    And I set the parameter "AppName" with value "<tag>"
    And I set the parameter "Tag" with value "<tag>"
    And I switch the "SwitchButton" button to "enable"
    And I click the "Done" button
    Then I wait for "ConfigDone" will be visible

    Examples:
      | tag             | log        | result                                                          | result1                                                     | searchResult                               |
      | wym_test_base64 | base64.log | Object\ncode:"aGVsbG8gYmFzZTY0"\nraw_message:"aGVsbG8gYmFzZTY0" | Object\ncode:"hello base64"\nraw_message:"aGVsbG8gYmFzZTY0" | {"other.code":"other.code: hello base64 "} |


  @configs24f
  Scenario Outline: RZY-2877:建立base64解析规则详情验证
    And I click the "Create" button
    Then I will see the "configs.CreatePage" page
    When I set the parameter "LogSample" with value "aGVsbG8gYmFzZTY0"
    And I click the "AddRule" button
    And I choose the "正则解析" from the "ParseRule" in config
    Given I wait for loading complete
    And I wait for "1000" millsecond
    And I choose the "raw_message" from the "SourceField" in config
    Then I wait for "1000" millsecond
    And I set the value "(?<code>.*)" to the textarea "Regex"
    And I click the "EnsureAddParseRule" button
    And I wait for "ParseButton" will be visible
    Then I wait for "100" millsecond
    And I click the "ParseButton" button
    And I wait for "CheckSuccess" will be visible
    Then I will see the element value in json "{'Result':'<result>'}"
    And I click the "Collapse" button
    And I click the "AddRule" button
    And I choose the "base64解析" from the "ParseRule" in config
    Given I wait for loading complete
    And I wait for "1000" millsecond
    And I choose the "code" from the "SourceField" in config
    Then I wait for "1000" millsecond
    And I click the "EnsureAddParseRule" button
    And I wait for "ParseButton" will be visible
    Then I wait for "100" millsecond
    And I click the "ParseButton" button
    And I wait for "CheckSuccess2" will be visible
    Then I will see the element value in json "{'Result':'<result1>'}"
    And I click the "Collapse" button
    And I click the "NextButton" button under some element
    When I set the parameter "Name" with value "<name>"
    And I set the parameter "Logtype" with value "other"
    And I set the parameter "AppName" with value "<tag>"
    And I set the parameter "Tag" with value "<tag>"
    And I switch the "SwitchButton" button to "enable"
    And I click the "Done" button
    Then I wait for "ConfigDone" will be visible

    Examples:
      | name       | rule1    | rule2 | tag           | log        | result                                                          | result1                                                     |
      | base64解析详情 | base64解析 | 正则解析  | base64_detail | base64.log | Object\ncode:"aGVsbG8gYmFzZTY0"\nraw_message:"aGVsbG8gYmFzZTY0" | Object\ncode:"hello base64"\nraw_message:"aGVsbG8gYmFzZTY0" |


  @configs24g
  Scenario Outline: RZY-2883:创建unicode解析规则+搜索验证
    And I click the "Create" button
    Then I will see the "configs.CreatePage" page
    When I set the parameter "LogSample" with value "PartyBasicInfoService_\u5ba2\u6237\u57fa\u672c\u4fe1\u606f\u670d\u52a1"
    And I click the "AddRule" button
    And I choose the "正则解析" from the "ParseRule" in config
    Given I wait for loading complete
    And I wait for "1000" millsecond
    And I choose the "raw_message" from the "SourceField" in config
    Then I wait for "1000" millsecond
    And I set the value "(?<rr>.*)" to the textarea "Regex"
    And I click the "EnsureAddParseRule" button
    And I wait for "ParseButton" will be visible
    Then I wait for "100" millsecond
    And I click the "ParseButton" button
    And I wait for "CheckSuccess" will be visible
    Then I will see the element value in json "{'Result':'<result>'}"
    And I click the "Collapse" button
    And I click the "AddRule" button
    And I choose the "自定义解析" from the "ParseRule" in config
    Given I wait for loading complete
    And I wait for "1000" millsecond
    And I choose the "codec" from the "RuleName" in config
    Then I wait for "1000" millsecond
    And I set the parameter "{"source": "rr","codec_type": "unicode_decode"}" to json editor in field parsing
    And I click the "EnsureAddParseRule" button
    And I wait for "ParseButton" will be visible
    Then I wait for "100" millsecond
    And I click the "ParseButton" button
    And I wait for "CheckSuccess2" will be visible
    Then I will see the element value in json "{'Result':'<result1>'}"
    And I click the "Collapse" button
    And I click the "NextButton" button under some element
    When I set the parameter "Name" with value "RZY2883unicode解析"
    And I set the parameter "Logtype" with value "other"
    And I set the parameter "AppName" with value "<tag>"
    And I set the parameter "Tag" with value "<tag>"
    And I switch the "SwitchButton" button to "enable"
    And I click the "Done" button
    Then I wait for "ConfigDone" will be visible

    Examples:
      | tag              | log         | result                                                                                                                                                                                                    | result1                                                                                                                                           | searchResult                                             |
      | wym_test_unicode | unicode.log | Object\nrr:"PartyBasicInfoService_\\\u5ba2\\\u6237\\\u57fa\\\u672c\\\u4fe1\\\u606f\\\u670d\\\u52a1"\nraw_message:"PartyBasicInfoService_\\\u5ba2\\\u6237\\\u57fa\\\u672c\\\u4fe1\\\u606f\\\u670d\\\u52a1" | Object\nrr:"PartyBasicInfoService_客户基本信息服务"\nraw_message:"PartyBasicInfoService_\\\u5ba2\\\u6237\\\u57fa\\\u672c\\\u4fe1\\\u606f\\\u670d\\\u52a1" | {"other.rr":"other.rr: PartyBasicInfoService_客户基本信息服务 "} |

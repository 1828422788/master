@configs
Feature: 字段提取新建

  @first @configsSmoke
  Scenario Outline: 创建规则并关联日志（RZY-1880）
    Given open the "configs.ListPage" page for uri "/configs/"
    And I click the "CreateButton" button
    Then I will see the "configs.CreatePage" page
    When I set the parameter "Name" with value "AutoTest"
    And I set the parameter "Logtype" with value "test"
    Then I choose the "default_ParserRule" from the "Group"
    When I set the parameter "LogSample" with value "{"Name": "John Smith ", "Age": 23, "Employed": true, "Address": {"Street": "324 Chrome St", "City": "Portland, New York,Los Angeles ", "Country": "United States"}}"
    And I choose the "Json解析" from the "ParseRule"
    And I alter the element "ExtractSample" class to "yw-extract-sample yw-extract-sample-container"
    And I choose the "raw_message" from the "SourceField"
    And I click the "AddField" button
    And I set the parameter "Key" with value "key"
    And I set the parameter "Value" with value "value"
    And I click the "NextButton" button
    And I click the "SwitchButton" button
    And I set the parameter "AppName" with value "<appName>"
    And I set the parameter "Tag" with value "<tag>"
    And I click the "NextButton" button

    Examples:
      | appName | tag |
      | 108     | 1   |

  @configsSmoke
  Scenario: RZY-2861：新建字段提取
    Given open the "configs.ListPage" page for uri "/configs/"
    And I click the "CreateButton" button
    Then I will see the "configs.CreatePage" page
    When I set the parameter "Name" with value "RZY-2861新建字段提取"
    And I set the parameter "Logtype" with value "test"
    Then I choose the "default_ParserRule" from the "Group"
    When I set the parameter "LogSample" with value "192.168.1.139 - - [24/Jan/2015:17:03:49 +0800] "GET /api/v0/search/fields/?field=tag&filters=&order=desc&page=1&query=*&size=50&sourcegroup=all&sourcegroupCn=%E6%89%80%E6%9C%89%E6%97%A5%E5%BF%97&time_range=-2d,now&type=fields HTTP/1.1" 200 363 "http://alltest.rizhiyi.com/search/?query=*&time_range=-2d%2Cnow&order=desc&size=20&page=1&sourcegroup=all&type=timeline&_t=1422088066859&title=%E9%BB%98%E8%AE%A4&index=0" "Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:35.0) Gecko/20100101 Firefox/35.0""
    And I set the parameter "Source" with value "/var/log/20180821/website"
    And I choose the "正则解析" from the "ParseRule"
    And I alter the element "ExtractSample" class to "yw-extract-sample yw-extract-sample-container"
    And I choose the "raw_message" from the "SourceField"
    And I set the parameter "Regex" with value "(?<clientip>\S+) - - \[\d+/\w+/\d+:(?<time>\S+) \+0800\](.*)"
    And I click the "ParseButton" button
    And I click the "ContinueButton" button
    And I choose the "正则解析" from the "ParseRule"
    And I choose the "@source" from the "SourceField"
    And I set the parameter "Regex2" with value "/var/log/(?<date>\d{8})/website"
    And I click the "ParseButton" button
    And I click the "ContinueButton" button
    And I choose the "格式化处理" from the "ParseRule"
    And I choose the "date,time" from the "SourceField"
    And I set the parameter "FormatRule" with value "$1$2"
    And I set the parameter "TargetField" with value "timestamp"
    And I click the "ParseButton" button
    And I click the "ContinueButton" button
    And I choose the "时间戳识别" from the "ParseRule"
    And I choose the "timestamp" from the "SourceField"
    And I set the parameter "TimeFormat" with value "yyyyMMddHH:mm:ss"
    And I click the "NextButton" button under some element
    And I click the "SwitchButton" button
    And I set the parameter "AppName" with value "date"
    And I set the parameter "Tag" with value "date"
    And I click the "NextButton" button

  @configsSmoke
  Scenario Outline: RZY-2866：搜索页结果验证
    Given open the "configs.ListPage" page for uri "/configs/"
    And I click the "CreateButton" button
    Then I will see the "configs.CreatePage" page
    When I set the parameter "Name" with value "RZY-2866搜索页结果验证"
    And I set the parameter "Logtype" with value "test"
    Then I choose the "default_ParserRule" from the "Group"
    When I set the parameter "LogSample" with value "<log>"
    And I choose the "Json解析" from the "ParseRule"
    And I alter the element "ExtractSample" class to "yw-extract-sample yw-extract-sample-container"
    And I choose the "raw_message" from the "SourceField"
    And I click the "ContinueButton" button
    And I choose the "字段重命名" from the "ParseRule"
    And I set the parameter "SourceFieldInput" with value "a.*.c"
    And I set the parameter "TargetField" with value "a.*.h"
    And I click the "NextButton" button
    And I click the "SwitchButton" button
    And I set the parameter "AppName" with value "rename"
    And I set the parameter "Tag" with value "rename"
    And I click the "NextButton" button

    Examples:
      | log                                       |
      | {"a":{"b":\n{"c":"d"}\n,"e":{"c":"g"}}\n} |

  @second @configsSmoke
  Scenario: RZY-2818：新建字典规则（RZY-2819使用）
    Given open the "dictionary.ListPage" page for uri "/dictionary/"
    When I click the "UploadButton" button
    And I choose the "default_Dictionary" from the "Group"
    And I upload a file with name "/src/test/resources/testdata/dictionary/win_sys_sourcename.csv"
    And I wait for "FileName" will be visible
    And I click the "UploadFile" button

  @second @configsSmoke
  Scenario: RZY-2827：新建脱敏配置规则
    Given open the "configs.ListPage" page for uri "/configs/"
    And I click the "CreateButton" button
    Then I will see the "configs.CreatePage" page
    When I set the parameter "Name" with value "脱敏"
    And I set the parameter "Logtype" with value "replace"
    Then I choose the "default_ParserRule" from the "Group"
    When I set the parameter "LogSample" with value "qweqwe15998418361qwe 15998418361"
    And I choose the "正则解析" from the "ParseRule"
    And I alter the element "ExtractSample" class to "yw-extract-sample yw-extract-sample-container"
    And I choose the "raw_message" from the "SourceField"
    And I set the parameter "Regex" with value "(?<phone>.*)"
    And I click the "ParseButton" button
    And I click the "ContinueButton" button
    And I choose the "脱敏配置" from the "ParseRule"
    And I choose the "phone" from the "SourceField"
    And I set the parameter "Regex" with value "(\d{3})(\d{4})(\d{4})"
    And I set the parameter "ReplaceContent" with value "$1****$3"
    And I set the parameter "Prefix" with value "\w+"
    And I set the parameter "Postfix" with value "\S+"
    And I click the "ContinueButton" button
    And I choose the "脱敏配置" from the "ParseRule"
    And I choose the "phone" from the "SourceField"
    And I set the parameter "Regex" with value "(\d{3})(\d{4})(\d{4})"
    And I set the parameter "ReplaceContent" with value "$1****$3"
    And I set the parameter "Prefix" with value "\s+"
    And I click the "NextButton" button under some element
    And I click the "SwitchButton" button
    And I set the parameter "AppName" with value "replacer"
    And I set the parameter "Tag" with value "replacer"
    And I click the "NextButton" button

  @second @configsSmoke
  Scenario: RZY-2864：在搜索页验证严格解析
    Given open the "configs.ListPage" page for uri "/configs/"
    And I click the "CreateButton" button
    Then I will see the "configs.CreatePage" page
    When I set the parameter "Name" with value "RZY2864在搜索页验证严格解析"
    And I set the parameter "Logtype" with value "test"
    Then I choose the "default_ParserRule" from the "Group"
    When I set the parameter "LogSample" with value "aaa 111"
    And I choose the "结构体解析" from the "ParseRule"
    And I alter the element "ExtractSample" class to "yw-extract-sample yw-extract-sample-container"
    And I choose the "raw_message" from the "SourceField"
    And I set the parameter "Struct" with value "name:3,val:4:i"
    And I "checked" the checkbox which name is "是否严格解析"
    And I click the "NextButton" button under some element
    And I click the "SwitchButton" button
    And I set the parameter "AppName" with value "codec"
    And I set the parameter "Tag" with value "codec"
    And I click the "NextButton" button

  @second @configsSmoke
  Scenario: RZY-2867：副规则
    Given open the "configs.ListPage" page for uri "/configs/"
    And I click the "CreateButton" button
    Then I will see the "configs.CreatePage" page
    When I set the parameter "Name" with value "redirect副规则"
    And I set the parameter "Logtype" with value "other"
    Then I choose the "default_ParserRule" from the "Group"
    And I choose the "Json解析" from the "ParseRule"
    And I alter the element "ExtractSample" class to "yw-extract-sample yw-extract-sample-container"
    And I choose the "raw_message" from the "SourceField"
    And I click the "AddField" button
    And I set the parameter "Key" with value "key"
    And I set the parameter "Value" with value "value"
    And I click the "NextButton" button
    And I click the "SwitchButton" button
    And I set the parameter "AppName" with value "redirect_fu"
    And I set the parameter "Tag" with value "redirect_fu"
    And I click the "NextButton" button

  @second @configsSmoke
  Scenario: RZY-2868：主规则
    Given open the "configs.ListPage" page for uri "/configs/"
    And I click the "CreateButton" button
    Then I will see the "configs.CreatePage" page
    When I set the parameter "Name" with value "redirect主规则"
    And I set the parameter "Logtype" with value "other"
    Then I choose the "default_ParserRule" from the "Group"
    And I choose the "重定向规则" from the "ParseRule"
    And I alter the element "ExtractSample" class to "yw-extract-sample yw-extract-sample-container"
    And I choose the "redirect副规则" from the "Redirect"
    And I click the "NextButton" button
    And I click the "SwitchButton" button
    And I set the parameter "AppName" with value "redirect_zhu"
    And I set the parameter "Tag" with value "redirect_zhu"
    And I click the "NextButton" button

  @second @configsSmoke
  Scenario Outline: RZY-2870:创建dissect解析
    Given open the "configs.ListPage" page for uri "/configs/"
    And I click the "CreateButton" button
    Then I will see the "configs.CreatePage" page
    When I set the parameter "Name" with value "RZY2870创建dissect解析"
    And I set the parameter "Logtype" with value "other"
    Then I choose the "default_ParserRule" from the "Group"
    When I set the parameter "LogSample" with value "http://rizhiyi.com/index.do?id=123"
    And I choose the "自定义规则" from the "ParseRule"
    And I alter the element "ExtractSample" class to "yw-extract-sample yw-extract-sample-container"
    And I set the parameter "RuleName" with value "dissect"
    And I set the parameter "{"enable_escape": true,"format": "http://%{domain}/%{url}?%{arg}=%{@arg:i}","source": "raw_message","strict_mode": false}" to json editor
    And I click the "ParseButton" button
    And I will see the success message "验证完成"
    Then I will see the element value in json "{'Result':'<result>'}"
    And I click the "NextButton" button under some element
    And I click the "SwitchButton" button
    And I set the parameter "AppName" with value "dissect"
    And I set the parameter "Tag" with value "dissect"
    And I click the "NextButton" button

    Examples:
      | result                                                                                                 |
      | Object\ndomain:"rizhiyi.com"\nid:123\nurl:"index.do"\nraw_message:"http://rizhiyi.com/index.do?id=123" |

  @second
  Scenario Outline: RZY-2872:建立正则片段解析规则
    Given open the "configs.ListPage" page for uri "/configs/"
    And I click the "CreateButton" button
    Then I will see the "configs.CreatePage" page
    When I set the parameter "Name" with value "RZY2872正则片段解析"
    And I set the parameter "Logtype" with value "other"
    Then I choose the "default_ParserRule" from the "Group"
    When I set the parameter "LogSample" with value "2014-11-07 11:18:33 192.168.1.1 FW-LZQ-MGJZZS-ASA5505-01 %ASA-5-502103: User priv level changed: Uname: enable_15 From: 1 To: 15"
    And I choose the "正则解析" from the "ParseRule"
    And I alter the element "ExtractSample" class to "yw-extract-sample yw-extract-sample-container"
    And I click the "ChangeToJson" button under some element
    And I set the parameter "{"source": "raw_message","multiline": false,"extract": [[{"regex": "[Uu]ser\\s[\"|']([^'\"]*)[\"|']","fields": {"user": "$1"},"name": "user_for_cisco"}, {"regex": "\\sUname:\\s(.*?)\\s","fields": {"user": "$1"},"name": "uname_for_cisco"}]],"add_fields": []}" to json editor
    And I click the "ParseButton" button
    And I will see the success message "验证完成"
    Then I will see the element value in json "{'Result':'<result>'}"
    And I set the parameter "LogSample" with value "2014-11-07 11:18:33 192.168.1.1 FW-LZQ-MGJZZS-ASA5505-01 %ASA-5-111010: User 'enable_15', running 'CLI' from IP 192.168.1.11, executed 'debug http'"
    And I click the "ParseButton" button
    And I will see the success message "验证完成"
    Then I will see the element value in json "{'Result':'<result1>'}"
    And I click the "NextButton" button under some element
    And I click the "SwitchButton" button
    And I set the parameter "AppName" with value "regex"
    And I set the parameter "Tag" with value "*"
    And I click the "NextButton" button

    Examples:
      | result                                                                                                                                                                   | result1                                                                                                                                                                                           |
      | Object\nuser:"enable_15"\nraw_message:"2014-11-07 11:18:33 192.168.1.1 FW-LZQ-MGJZZS-ASA5505-01 %ASA-5-502103: User priv level changed: Uname: enable_15 From: 1 To: 15" | Object\nuser:"enable_15"\nraw_message:"2014-11-07 11:18:33 192.168.1.1 FW-LZQ-MGJZZS-ASA5505-01 %ASA-5-111010: User \'enable_15\', running \'CLI\' from IP 192.168.1.11, executed \'debug http\'" |

  @second
  Scenario Outline: RZY-2875:创建script解析规则
    Given open the "configs.ListPage" page for uri "/configs/"
    And I click the "CreateButton" button
    Then I will see the "configs.CreatePage" page
    When I set the parameter "Name" with value "RZY2875script解析"
    And I set the parameter "Logtype" with value "other"
    Then I choose the "default_ParserRule" from the "Group"
    When I set the parameter "LogSample" with value "{"fields":["time","count"],"values":[1516189,5664]}"
    And I choose the "Json解析" from the "ParseRule"
    And I alter the element "ExtractSample" class to "yw-extract-sample yw-extract-sample-container"
    And I choose the "raw_message" from the "SourceField"
    And I click the "ParseButton" button
    And I will see the success message "验证完成"
    Then I will see the element value in json "{'Result':'<result>'}"
    And I click the "ContinueButton" button
    And I choose the "自定义规则" from the "ParseRule"
    And I set the parameter "RuleName" with value "script"
    And I set the parameter "{"script":"source[\"result\"] = todict(mvzip(source[\"fields\"],source[\"values\"]))"}" to json editor
    And I click the "ParseButton" button
    And I will see the success message "验证完成"
    Then I will see the element value in json "{'Result':'<result1>'}"
    And I click the "NextButton" button under some element
    And I click the "SwitchButton" button
    And I set the parameter "AppName" with value "script"
    And I set the parameter "Tag" with value "script"
    And I click the "NextButton" button

    Examples:
      | result                                                                                                                                              | result1                                                                                                                                                                                      |
      | Object\nfields:Array[2]\n0:"time"\n1:"count"\nvalues:Array[2]\n0:1516189\n1:5664\nraw_message:"{"fields":["time","count"],"values":[1516189,5664]}" | Object\nfields:Array[2]\n0:"time"\n1:"count"\nresult:Object\ncount:5664\ntime:1516189\nvalues:Array[2]\n0:1516189\n1:5664\nraw_message:"{"fields":["time","count"],"values":[1516189,5664]}" |

  @second
  Scenario Outline: RZY-2877:建立base64解析规则
    Given open the "configs.ListPage" page for uri "/configs/"
    And I click the "CreateButton" button
    Then I will see the "configs.CreatePage" page
    When I set the parameter "Name" with value "RZY2877base64解析"
    And I set the parameter "Logtype" with value "other"
    Then I choose the "default_ParserRule" from the "Group"
    When I set the parameter "LogSample" with value "aGVsbG8gYmFzZTY0"
    And I choose the "正则解析" from the "ParseRule"
    And I alter the element "ExtractSample" class to "yw-extract-sample yw-extract-sample-container"
    And I choose the "raw_message" from the "SourceField"
    And I set the parameter "Regex" with value "(?<code>.*)"
    And I click the "ParseButton" button
    And I will see the success message "验证完成"
    And I wait for "2000" millsecond
    Then I will see the element value in json "{'Result':'<result>'}"
    And I click the "ContinueButton" button
    And I choose the "Base64解析" from the "ParseRule"
    And I choose the "code" from the "SourceField"
    And I click the "ParseButton" button
    And I will see the success message "验证完成"
    Then I will see the element value in json "{'Result':'<result1>'}"
    And I click the "NextButton" button under some element
    And I click the "SwitchButton" button
    And I set the parameter "AppName" with value "base64"
    And I set the parameter "Tag" with value "base64"
    And I click the "NextButton" button

    Examples:
      | result                                                          | result1                                                     |
      | Object\ncode:"aGVsbG8gYmFzZTY0"\nraw_message:"aGVsbG8gYmFzZTY0" | Object\ncode:"hello base64"\nraw_message:"aGVsbG8gYmFzZTY0" |

  @second
  Scenario Outline: RZY-2883:创建unicode解析规则
    Given open the "configs.ListPage" page for uri "/configs/"
    And I click the "CreateButton" button
    Then I will see the "configs.CreatePage" page
    When I set the parameter "Name" with value "RZY2883unicode解析"
    And I set the parameter "Logtype" with value "other"
    Then I choose the "default_ParserRule" from the "Group"
    When I set the parameter "LogSample" with value "PartyBasicInfoService_\u5ba2\u6237\u57fa\u672c\u4fe1\u606f\u670d\u52a1"
    And I choose the "正则解析" from the "ParseRule"
    And I alter the element "ExtractSample" class to "yw-extract-sample yw-extract-sample-container"
    And I choose the "raw_message" from the "SourceField"
    And I set the parameter "Regex" with value "(?<rr>.*)"
    And I click the "ParseButton" button
    And I will see the success message "验证完成"
    Then I will see the element value in json "{'Result':'<result>'}"
    And I click the "ContinueButton" button
    And I choose the "自定义规则" from the "ParseRule"
    And I set the parameter "RuleName" with value "codec"
    And I set the parameter "{"source": "rr","codec_type": "unicode_decode"}" to json editor
    And I click the "ParseButton" button
    And I will see the success message "验证完成"
    Then I will see the element value in json "{'Result':'<result1>'}"
    And I click the "NextButton" button under some element
    And I click the "SwitchButton" button
    And I set the parameter "AppName" with value "unicode"
    And I set the parameter "Tag" with value "unicode"
    And I click the "NextButton" button

    Examples:
      | result                                                                                                                                                                                                    | result1                                                                                                                                           |
      | Object\nrr:"PartyBasicInfoService_\\\u5ba2\\\u6237\\\u57fa\\\u672c\\\u4fe1\\\u606f\\\u670d\\\u52a1"\nraw_message:"PartyBasicInfoService_\\\u5ba2\\\u6237\\\u57fa\\\u672c\\\u4fe1\\\u606f\\\u670d\\\u52a1" | Object\nrr:"PartyBasicInfoService_客户基本信息服务"\nraw_message:"PartyBasicInfoService_\\\u5ba2\\\u6237\\\u57fa\\\u672c\\\u4fe1\\\u606f\\\u670d\\\u52a1" |

  @configsSmoke
  Scenario Outline: 上传日志
    When open the "localUpload.ListPage" page for uri "/sources/input/os/"
    And I set the parameter "AppName" with value "<appName>"
    And I set the parameter "Tag" with value "<tag>"
    And I upload a file with name "/src/test/resources/testdata/log/<log>"
    And I click the "UploadButton" button

  @first
    Examples:
      | appName | tag | log              |
      | 108     | 1   | json_sdyd_41.log |

    Examples:
      | appName | tag    | log           |
      | date    | date   | timestamp.log |
      | rename  | rename | rename.log    |

  @second
    Examples:
      | appName      | tag          | log              |
      | codec        | codec        | 结构体解析.log        |
      | redirect_zhu | redirect_zhu | json_sdyd_41.log |
      | dissect      | dissect      | dissect.log      |
      | regex        | 1            | regex1.log       |
      | regex        | 2            | regex2.log       |
      | script       | script       | script.log       |
      | base64       | base64       | base64.log       |
      | unicode      | unicode      | unicode.log      |

  @configsSmoke
  Scenario Outline: RZY-2871:搜索页验证
    When open the "splSearch.SearchPage" page for uri "/search/"
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I set the parameter "SearchInput" with value "<spl>"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I click the "RightIcon" button
    Then I will see the spl search result "<result>"

  @first
    Examples:
      | spl               | result               |
      | appname:108 tag:1 | {"test.key":"value"} |

    Examples:
      | spl            | result                              |
      | appname:rename | {"test.a.b.h":"d","test.a.e.h":"g"} |

  @second
    Examples:
      | spl                                       | result                                                                 |
      | appname:codec                             | {"test.name":"aaa","test.val":"111"}                                   |
      | appname:redirect_zhu AND tag:redirect_zhu | {"other.key":"value"}                                                  |
      | appname:dissect                           | {"other.id":"123","other.domain":"rizhiyi.com","other.url":"index.do"} |
      | appname:regex AND tag:1                   | {"other.user":"enable_15"}                                             |
      | appname:regex AND tag:2                   | {"other.user":"enable_15"}                                             |
      | appname:script                            | {"other.result.count":"5664","other.result.time":"1516189"}            |
      | appname:base64                            | {"other.code":"hello base64"}                                          |
      | appname:unicode                           | {"other.rr":"PartyBasicInfoService_客户基本信息服务"}                          |
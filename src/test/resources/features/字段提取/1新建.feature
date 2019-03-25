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

  @createEssentialData
  Scenario: 创建一个针对sequence的字段提取规则并上传日志（循序图使用）
    Given open the "configs.ListPage" page for uri "/configs/"
    And I click the "CreateButton" button
    Then I will see the "configs.CreatePage" page
    When I set the parameter "Name" with value "AutoTestForTrend"
    And I set the parameter "Logtype" with value "sequence"
    Then I choose the "default_ParserRule" from the "Group"
    When I set the parameter "LogSample" with value "1511255129000, fred, bob, query1, 111"
    And I choose the "CSV解析" from the "ParseRule"
    And I alter the element "ExtractSample" class to "yw-extract-sample yw-extract-sample-container"
    And I choose the "raw_message" from the "SourceField"
    And I drag the scroll bar to the top
    And I set the parameter "Separate" with value ","
    And I drag the scroll bar to the top
    And I set the parameter "FieldList" with value "time,from,to,relatemsg,msgid"
    And I click the "NextButton" button
    And I click the "SwitchButton" button
    And I set the parameter "AppName" with value "seq_test"
    And I set the parameter "Tag" with value "seq_test"
    And I click the "NextButton" button
    And open the "localUpload.ListPage" page for uri "/sources/input/os/"
    And I set the parameter "AppName" with value "seq_test"
    And I set the parameter "Tag" with value "seq_test"
    And I upload a file with name "/src/test/resources/testdata/log/autotest.csv"
    And I click the "UploadButton" button

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
  Scenario: RZY-2861：agent添加路径
    Given open the "agent.CreatePage" page for uri "/sources/input/agent/"
    And I click the detail with properties "{'name':'rizhiyi_server_host','column':'1'}"
    And switch to another window
    And I click the "Add" button
    And I set the parameter "Document" with value "/var/log/20180821"
    And I set the parameter "WhiteList" with value ".*\.log"
    And I click the "Next" button
    And I click the "File" button
    And I click the "Next" button
    And I set the parameter "Appname" with value "date"
    And I set the parameter "Tag" with value "date"
    And I click the "Next" button
    And I click the "Next" button

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

  @configsSmoke
  Scenario Outline: 上传日志
    When open the "localUpload.ListPage" page for uri "/sources/input/os/"
    And I set the parameter "AppName" with value "<appName>"
    And I set the parameter "Tag" with value "<tag>"
    And I upload a file with name "/src/test/resources/testdata/log/<log>"
    And I click the "UploadButton" button

    Examples:
      | appName      | tag          | log              |
      | 108          | 1            | json_sdyd_41.log |
      | date         | date         | timestamp.log    |
      | rename       | rename       | rename.log       |
      | codec        | codec        | 结构体解析.log        |
      | redirect_zhu | redirect_zhu | json_sdyd_41.log |

  @configsSmoke
  Scenario: 验证从搜索页跳转到字段提取（RZY-1881）
    When open the "splSearch.SearchPage" page for uri "/search/"
    And I set the parameter "SearchInput" with value "appname:108 tag:1"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I click the "RightIcon" button
    And I click the "EventOperate" button
    And I click the "ConfigField" button
    And switch to another window
    Then the page's title will be "字段提取"
    And I will see the "configs.CreatePage" page
    And I wait for "2000" millsecond
    Then I will see the input element "AppName" value will be "108"
    Then I will see the input element "HostName" value will be "192.168.1.164"
    Then I will see the input element "Tag" value will be "1"

  @configsSmoke
  Scenario Outline: 搜索页验证
    When open the "splSearch.SearchPage" page for uri "/search/"
    And I set the parameter "SearchInput" with value "<spl>"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I click the "RightIcon" button
    And I will see the element "<key>" name is "<value>"
    And I will see the element "<key1>" name is "<value1>"
    And I will see the element "<key2>" name is "<value2>"

    Examples:
      | spl                       | key        | value    | key1      | value1   | key2            | value2                |
      | appname:108 tag:1         | OtherValue | value    |           |          |                 |                       |
      | appname:date AND tag:date | OtherDate  | 20180821 | OtherTime | 17:03:49 | ResultTimestamp | 2019/02/21 17:03:49.0 |
      | appname:rename            | OtherAbh   | d        | OtherAeh  | g        |                 |                       |

  @second
    Examples:
      | spl                                       | key      | value | key1      | value1 | key2 | value2 |
      | appname:codec                             | TestName | aaa   | TestValue | 111    |      |        |
      | appname:redirect_zhu AND tag:redirect_zhu | OtherKey | value |           |        |      |        |

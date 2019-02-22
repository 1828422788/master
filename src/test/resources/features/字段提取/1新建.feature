@all @smoke @configs
Feature: 字段提取新建

  @configsSmoke
  Scenario Outline: 创建规则并关联日志（RZY-1880）
    Given open the "configs.ListPage" page for uri "/configs/"
    And I click the "CreateButton" button
    Then I will see the "configs.CreatePage" page
    When I set the parameter "Name" with value "AutoTest"
    And I set the parameter "Logtype" with value "test"
    Then I choose the "default_ParserRule" from the "Group"
    When I set the parameter "LogSample" with value "{"Name": "John Smith ", "Age": 23, "Employed": true, "Address": {"Street": "324 Chrome St", "City": "Portland, New York,Los Angeles ", "Country": "United States"}}"
    And I choose the "Json解析" from the "ParseRule"
    And I choose the "raw_message" from the "SourceField"
    And I click the "AddField" button
    And I set the parameter "Key" with value "key"
    And I set the parameter "Value" with value "value"
    And I click the "NextButton" button
    And I click the "SwitchButton" button
    And I set the parameter "AppName" with value "<appName>"
    And I set the parameter "Tag" with value "<tag>"
    And I click the "NextButton" button
    And open the "localUpload.ListPage" page for uri "/sources/input/os/"
    And I set the parameter "Tag" with value "<tag>"
    And I set the parameter "AppName" with value "<appName>"
    And I upload a file with name "/src/test/resources/testdata/log/json_sdyd_41.log"
    And I click the "UploadButton" button

    Examples:
      | appName | tag |
      | 108     | 1   |

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
  Scenario: 验证搜索关联日志（RZY-1880）
    Given open the "splSearch.SearchPage" page for uri "/search/"
    And I set the parameter "SearchInput" with value "appname:108 tag:1"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I click the "RightIcon" button
    Then I will see the "OtherValue" result will be "value"

  @configsSmoke
  Scenario: RZY-2861：新建字段提取
    Given open the "configs.ListPage" page for uri "/configs/"
    And I click the "CreateButton" button
    Then I will see the "configs.CreatePage" page
    When I set the parameter "Name" with value "RZY-2861"
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
    And I set the parameter "AppName" with value "date"
    And I set the parameter "Tag" with value "date"
    And I click the "NextButton" button

  @configsSmoke
  Scenario: RZY-2861：agent添加路径
    Given open the "agent.CreatePage" page for uri "/sources/input/agent/"
    And I click the detail which name is "{'name':'192.168.1.134','column':'1'}"
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
  Scenario: RZY-2861：在搜索页中验证
    When open the "splSearch.SearchPage" page for uri "/search/"
    And I set the parameter "SearchInput" with value "appname:date AND tag:date"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I click the "RightIcon" button
    And I will see the element "OtherDate" name is "20180821"
    And I will see the element "OtherTime" name is "17:03:49"
    And I will see the element "ResultTimestamp" name is "2019/02/21 17:03:49.0"
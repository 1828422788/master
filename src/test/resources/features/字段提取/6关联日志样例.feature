# new feature
# Tags: optional
@configsSmoke
Feature: 字段提取关联日志样例


  Scenario Outline: RZY-4568、4569:保存关联日志样例并查看[规则名称自定义]
    Given open the "configs.ListPage" page for uri "/configs/"
    Then I wait for loading invisible
    And I click the "Create" button
    Then I will see the "configs.CreatePage" page
    When I set the parameter "LogSample" with value "192.168.1.139 - - [24/Jan/2015:17:03:49 +0800] "GET /api/v0/search/fields/?field=tag&filters=&order=desc&page=1&query=*&size=50&sourcegroup=all&sourcegroupCn=%E6%89%80%E6%9C%89%E6%97%A5%E5%BF%97&time_range=-2d,now&type=fields HTTP/1.1" 200 363 "http://alltest.rizhiyi.com/search/?query=*&time_range=-2d%2Cnow&order=desc&size=20&page=1&sourcegroup=all&type=timeline&_t=1422088066859&title=%E9%BB%98%E8%AE%A4&index=0" "Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:35.0) Gecko/20100101 Firefox/35.0""
    And I set the parameter "Source" with value "/var/log/20180821/website"
    And I click the "AddRule" button
    And I choose the "正则解析" from the "ParseRule" in config
    And I set the parameter "RuleRemark" with value "从日志中解析出time"
    And I choose the "raw_message" from the "SourceField" in config
    And I set the parameter "Regex" with value "(?<clientip>\S+) - - \[\d+/\w+/\d+:(?<time>\S+) \+0800\](?<msg>.*)"
    And I click the "EnsureAddParseRule" button
    And I wait for "ParseButton" will be visible
    Then I wait for "100" millsecond
    And I click the "ParseButton" button
    And I wait for "CheckSuccess" will be visible
    Then I will see the element value in json "{'Result':'<result>'}"
    And I click the "AddRule" button
    And I choose the "正则解析" from the "ParseRule" in config
    And I set the parameter "RuleRemark" with value "从source中解析出date"
    And I choose the "@source" from the "SourceField" in config
    And I set the parameter "Regex" with value "/var/log/(?<date>\d{8})/website"
    And I click the "EnsureAddParseRule" button
    And I wait for "ParseButton" will be visible
    Then I wait for "100" millsecond
    And I click the "ParseButton" button
    And I wait for "CheckSuccess2" will be visible
    Then I will see the element value in json "{'Result':'<result1>'}"
    And I click the "AddRule" button
    And I choose the "格式化处理" from the "ParseRule" in config
    And I set the parameter "RuleRemark" with value "格式化一个新的时间戳"
    And I choose the "date,time" from the "SourceField" in config
    And I set the parameter "FormatRule" with value "$1 $2"
    And I set the parameter "TargetField" with value "timestampstamp"
    And I click the "EnsureAddParseRule" button
    And I wait for "ParseButton" will be visible
    Then I wait for "100" millsecond
    And I click the "ParseButton" button
    And I wait for "CheckSuccess3" will be visible
    Then I will see the element value in json "{'Result':'<result2>'}"
    Then I click the "Packup" button
    Then I click the "EventList" button
    Then I click the "ReadSavedLog" button
    Then I click the "Create" button
    Then I set the parameter "EventListLogSample" with value "192.168.1.139 - - [24/Jan/2015:17:03:49 +0800] "GET /api/v0/search/fields/?field=tag&filters=&order=desc&page=1&query=*&size=50&sourcegroup=all&sourcegroupCn=%E6%89%80%E6%9C%89%E6%97%A5%E5%BF%97&time_range=-2d,now&type=fields HTTP/1.1" 200 363 "http://alltest.rizhiyi.com/search/?query=*&time_range=-2d%2Cnow&order=desc&size=20&page=1&sourcegroup=all&type=timeline&_t=1422088066859&title=%E9%BB%98%E8%AE%A4&index=0" "Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:35.0) Gecko/20100101 Firefox/35.0""
    Then I set the parameter "EventListSource" with value "/var/log/20180821/website"
    Then I click the "Save" button
    Then I click the "ClearIcon" button
    And I click the "NextButton" button under some element
    When I set the parameter "Name" with value "<name>"
    And I set the parameter "Logtype" with value "other"
    And I set the parameter "AppName" with value "wym_test_savelog"
    And I set the parameter "Tag" with value "wym_test_savelog"
    And I click the "Done" button
    Then I wait for "ConfigDone" will be visible
    Given open the "configs.ListPage" page for uri "/configs/"
    Then I wait for loading invisible
    When the data name is "{'column':'1','name':'<name>'}" then i click the "编辑" button
    Then I will see the "configs.CreatePage" page
    Then I will see the element "RuleList" value contains "从日志中解析出time,从source中解析出date,格式化一个新的时间戳"
    Then I click the "EventList" button
    Then I click the "ReadSavedLog" button
    Then I click the "AsLogSample" button
    And I wait for "ParseButton" will be visible
    Then I wait for "1000" millsecond
    And I click the "ParseButton" button
    And I wait for "CheckSuccess3" will be visible
    Then I will see the element value in json "{'Result':'<result2>'}"

    Examples:
      | name      | result                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   | result1                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   | result2                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       |
      | wym保存日志样例 | Object\nclientip:"192.168.1.139"\nmsg:" "GET /api/v0/search/fields/?field=tag&filters=&order=desc&page=1&query=*&size=50&sourcegroup=all&sourcegroupCn=%E6%89%80%E6%9C%89%E6%97%A5%E5%BF%97&time_range=-2d,now&type=fields HTTP/1.1" 200 363 "http://alltest.rizhiyi.com/search/?query=*&time_range=-2d%2Cnow&order=desc&size=20&page=1&sourcegroup=all&type=timeline&_t=1422088066859&title=%E9%BB%98%E8%AE%A4&index=0" "Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:35.0) Gecko/20100101 Firefox/35.0""\ntime:"17:03:49"\nraw_message:"192.168.1.139 - - [24/Jan/2015:17:03:49 +0800] "GET /api/v0/search/fields/?field=tag&filters=&order=desc&page=1&query=*&size=50&sourcegroup=all&sourcegroupCn=%E6%89%80%E6%9C%89%E6%97%A5%E5%BF%97&time_range=-2d,now&type=fields HTTP/1.1" 200 363 "http://alltest.rizhiyi.com/search/?query=*&time_range=-2d%2Cnow&order=desc&size=20&page=1&sourcegroup=all&type=timeline&_t=1422088066859&title=%E9%BB%98%E8%AE%A4&index=0" "Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:35.0) Gecko/20100101 Firefox/35.0""\n@source:"/var/log/20180821/website" | Object\nclientip:"192.168.1.139"\ndate:"20180821"\nmsg:" "GET /api/v0/search/fields/?field=tag&filters=&order=desc&page=1&query=*&size=50&sourcegroup=all&sourcegroupCn=%E6%89%80%E6%9C%89%E6%97%A5%E5%BF%97&time_range=-2d,now&type=fields HTTP/1.1" 200 363 "http://alltest.rizhiyi.com/search/?query=*&time_range=-2d%2Cnow&order=desc&size=20&page=1&sourcegroup=all&type=timeline&_t=1422088066859&title=%E9%BB%98%E8%AE%A4&index=0" "Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:35.0) Gecko/20100101 Firefox/35.0""\ntime:"17:03:49"\nraw_message:"192.168.1.139 - - [24/Jan/2015:17:03:49 +0800] "GET /api/v0/search/fields/?field=tag&filters=&order=desc&page=1&query=*&size=50&sourcegroup=all&sourcegroupCn=%E6%89%80%E6%9C%89%E6%97%A5%E5%BF%97&time_range=-2d,now&type=fields HTTP/1.1" 200 363 "http://alltest.rizhiyi.com/search/?query=*&time_range=-2d%2Cnow&order=desc&size=20&page=1&sourcegroup=all&type=timeline&_t=1422088066859&title=%E9%BB%98%E8%AE%A4&index=0" "Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:35.0) Gecko/20100101 Firefox/35.0""\n@source:"/var/log/20180821/website" | Object\nclientip:"192.168.1.139"\ndate:"20180821"\nmsg:" "GET /api/v0/search/fields/?field=tag&filters=&order=desc&page=1&query=*&size=50&sourcegroup=all&sourcegroupCn=%E6%89%80%E6%9C%89%E6%97%A5%E5%BF%97&time_range=-2d,now&type=fields HTTP/1.1" 200 363 "http://alltest.rizhiyi.com/search/?query=*&time_range=-2d%2Cnow&order=desc&size=20&page=1&sourcegroup=all&type=timeline&_t=1422088066859&title=%E9%BB%98%E8%AE%A4&index=0" "Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:35.0) Gecko/20100101 Firefox/35.0""\ntime:"17:03:49"\ntimestampstamp:"20180821 17:03:49"\nraw_message:"192.168.1.139 - - [24/Jan/2015:17:03:49 +0800] "GET /api/v0/search/fields/?field=tag&filters=&order=desc&page=1&query=*&size=50&sourcegroup=all&sourcegroupCn=%E6%89%80%E6%9C%89%E6%97%A5%E5%BF%97&time_range=-2d,now&type=fields HTTP/1.1" 200 363 "http://alltest.rizhiyi.com/search/?query=*&time_range=-2d%2Cnow&order=desc&size=20&page=1&sourcegroup=all&type=timeline&_t=1422088066859&title=%E9%BB%98%E8%AE%A4&index=0" "Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:35.0) Gecko/20100101 Firefox/35.0""\n@source:"/var/log/20180821/website" |


  Scenario Outline: RZY-4574、4575、4576:使用检索日志验证-解析状态、字段[规则名称默认]
    Given open the "configs.ListPage" page for uri "/configs/"
    Then I wait for loading invisible
    And I click the "Create" button
    Then I will see the "configs.CreatePage" page
    When I set the parameter "LogSample" with value "192.168.1.139 - - [24/Jan/2015:17:03:49 +0800] "GET /api/v0/search/fields/?field=tag&filters=&order=desc&page=1&query=*&size=50&sourcegroup=all&sourcegroupCn=%E6%89%80%E6%9C%89%E6%97%A5%E5%BF%97&time_range=-2d,now&type=fields HTTP/1.1" 200 363 "http://alltest.rizhiyi.com/search/?query=*&time_range=-2d%2Cnow&order=desc&size=20&page=1&sourcegroup=all&type=timeline&_t=1422088066859&title=%E9%BB%98%E8%AE%A4&index=0" "Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:35.0) Gecko/20100101 Firefox/35.0""
    And I set the parameter "Source" with value "/var/log/20180821/website"
    And I click the "AddRule" button
    And I choose the "正则解析" from the "ParseRule" in config
    And I choose the "raw_message" from the "SourceField" in config
    And I set the parameter "Regex" with value "(?<clientip>\S+) - - \[\d+/\w+/\d+:(?<time>\S+) \+0800\](?<msg>.*)"
    And I click the "EnsureAddParseRule" button
    And I wait for "ParseButton" will be visible
    Then I wait for "100" millsecond
    And I click the "ParseButton" button
    And I wait for "CheckSuccess" will be visible
    Then I will see the element value in json "{'Result':'<result>'}"
    And I click the "AddRule" button
    And I choose the "正则解析" from the "ParseRule" in config
    And I choose the "@source" from the "SourceField" in config
    And I set the parameter "Regex" with value "/var/log/(?<date>\d{8})/website"
    And I click the "EnsureAddParseRule" button
    And I wait for "ParseButton" will be visible
    Then I wait for "100" millsecond
    And I click the "ParseButton" button
    And I wait for "CheckSuccess2" will be visible
    Then I will see the element value in json "{'Result':'<result1>'}"
    And I click the "AddRule" button
    And I choose the "格式化处理" from the "ParseRule" in config
    And I choose the "date,time" from the "SourceField" in config
    And I set the parameter "FormatRule" with value "$1 $2"
    And I set the parameter "TargetField" with value "timestampstamp"
    And I click the "EnsureAddParseRule" button
    And I wait for "ParseButton" will be visible
    Then I wait for "100" millsecond
    And I click the "ParseButton" button
    And I wait for "CheckSuccess3" will be visible
    Then I will see the element value in json "{'Result':'<result2>'}"
    Then I click the "Packup" button
    Then I click the "EventList" button
    Then I click the "ReadSavedLog" button
    Then I click the "Create" button
    Then I set the parameter "EventListLogSample" with value "192.168.1.139 - - [24/Jan/2015:17:03:49 +0800] "GET /api/v0/search/fields/?field=tag&filters=&order=desc&page=1&query=*&size=50&sourcegroup=all&sourcegroupCn=%E6%89%80%E6%9C%89%E6%97%A5%E5%BF%97&time_range=-2d,now&type=fields HTTP/1.1" 200 363 "http://alltest.rizhiyi.com/search/?query=*&time_range=-2d%2Cnow&order=desc&size=20&page=1&sourcegroup=all&type=timeline&_t=1422088066859&title=%E9%BB%98%E8%AE%A4&index=0" "Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:35.0) Gecko/20100101 Firefox/35.0""
    Then I set the parameter "EventListSource" with value "/var/log/20180821/website"
    Then I click the "Save" button
    Then I click the "ClearIcon" button
    And I click the "NextButton" button under some element
    When I set the parameter "Name" with value "<name>"
    And I set the parameter "Logtype" with value "other"
    And I click the "Done" button
    Then I wait for "ConfigDone" will be visible
    Given open the "configs.ListPage" page for uri "/configs/"
    Then I wait for loading invisible
    When the data name is "{'column':'1','name':'<name>'}" then i click the "编辑" button
    Then I will see the "configs.CreatePage" page
    Then I will see the element "RuleList" value contains "正则解析,正则解析(@source),格式化处理(date,time)"
    Then I click the "EventList" button
    Then I click the "ReadSavedLog" button
    Then I click the "UseCheckLog" button
    And I wait for "1000" millsecond
    Then I will see the element "Status" contains "成功"
    Then I click the "Field" button
    Then I choose the "date" from the "ParseField" in config
    And I will see the element "FieldTitle" value contains "字段值,出现次数"
    And I will see the element "FieldValue" value contains "20180821,1"
    Then I click the "GoBack" button
    Then I will see the element "Status" contains "成功"
#    And I click the "ParseField" button
#    And I choose the "clientip" from the "ParseField"
#    Then I wait for "5000" millsecond
#    Then I will see the element "FieldValue" value contains "192.168.1.139,1"
#    And I choose the "time" from the "ParseField" in config
#    Then I wait for "500" millsecond
#    Then I will see the element "FieldValue" value contains "17:03:49,1"

    Examples:
      | name        | result                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   | result1                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   | result2                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       |
      | wym检索日志验证状态 | Object\nclientip:"192.168.1.139"\nmsg:" "GET /api/v0/search/fields/?field=tag&filters=&order=desc&page=1&query=*&size=50&sourcegroup=all&sourcegroupCn=%E6%89%80%E6%9C%89%E6%97%A5%E5%BF%97&time_range=-2d,now&type=fields HTTP/1.1" 200 363 "http://alltest.rizhiyi.com/search/?query=*&time_range=-2d%2Cnow&order=desc&size=20&page=1&sourcegroup=all&type=timeline&_t=1422088066859&title=%E9%BB%98%E8%AE%A4&index=0" "Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:35.0) Gecko/20100101 Firefox/35.0""\ntime:"17:03:49"\nraw_message:"192.168.1.139 - - [24/Jan/2015:17:03:49 +0800] "GET /api/v0/search/fields/?field=tag&filters=&order=desc&page=1&query=*&size=50&sourcegroup=all&sourcegroupCn=%E6%89%80%E6%9C%89%E6%97%A5%E5%BF%97&time_range=-2d,now&type=fields HTTP/1.1" 200 363 "http://alltest.rizhiyi.com/search/?query=*&time_range=-2d%2Cnow&order=desc&size=20&page=1&sourcegroup=all&type=timeline&_t=1422088066859&title=%E9%BB%98%E8%AE%A4&index=0" "Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:35.0) Gecko/20100101 Firefox/35.0""\n@source:"/var/log/20180821/website" | Object\nclientip:"192.168.1.139"\ndate:"20180821"\nmsg:" "GET /api/v0/search/fields/?field=tag&filters=&order=desc&page=1&query=*&size=50&sourcegroup=all&sourcegroupCn=%E6%89%80%E6%9C%89%E6%97%A5%E5%BF%97&time_range=-2d,now&type=fields HTTP/1.1" 200 363 "http://alltest.rizhiyi.com/search/?query=*&time_range=-2d%2Cnow&order=desc&size=20&page=1&sourcegroup=all&type=timeline&_t=1422088066859&title=%E9%BB%98%E8%AE%A4&index=0" "Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:35.0) Gecko/20100101 Firefox/35.0""\ntime:"17:03:49"\nraw_message:"192.168.1.139 - - [24/Jan/2015:17:03:49 +0800] "GET /api/v0/search/fields/?field=tag&filters=&order=desc&page=1&query=*&size=50&sourcegroup=all&sourcegroupCn=%E6%89%80%E6%9C%89%E6%97%A5%E5%BF%97&time_range=-2d,now&type=fields HTTP/1.1" 200 363 "http://alltest.rizhiyi.com/search/?query=*&time_range=-2d%2Cnow&order=desc&size=20&page=1&sourcegroup=all&type=timeline&_t=1422088066859&title=%E9%BB%98%E8%AE%A4&index=0" "Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:35.0) Gecko/20100101 Firefox/35.0""\n@source:"/var/log/20180821/website" | Object\nclientip:"192.168.1.139"\ndate:"20180821"\nmsg:" "GET /api/v0/search/fields/?field=tag&filters=&order=desc&page=1&query=*&size=50&sourcegroup=all&sourcegroupCn=%E6%89%80%E6%9C%89%E6%97%A5%E5%BF%97&time_range=-2d,now&type=fields HTTP/1.1" 200 363 "http://alltest.rizhiyi.com/search/?query=*&time_range=-2d%2Cnow&order=desc&size=20&page=1&sourcegroup=all&type=timeline&_t=1422088066859&title=%E9%BB%98%E8%AE%A4&index=0" "Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:35.0) Gecko/20100101 Firefox/35.0""\ntime:"17:03:49"\ntimestampstamp:"20180821 17:03:49"\nraw_message:"192.168.1.139 - - [24/Jan/2015:17:03:49 +0800] "GET /api/v0/search/fields/?field=tag&filters=&order=desc&page=1&query=*&size=50&sourcegroup=all&sourcegroupCn=%E6%89%80%E6%9C%89%E6%97%A5%E5%BF%97&time_range=-2d,now&type=fields HTTP/1.1" 200 363 "http://alltest.rizhiyi.com/search/?query=*&time_range=-2d%2Cnow&order=desc&size=20&page=1&sourcegroup=all&type=timeline&_t=1422088066859&title=%E9%BB%98%E8%AE%A4&index=0" "Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:35.0) Gecko/20100101 Firefox/35.0""\n@source:"/var/log/20180821/website" |


  Scenario Outline: 删除已存日志
    Given open the "configs.ListPage" page for uri "/configs/"
    Then I wait for loading invisible
    And I click the "Create" button
    Then I will see the "configs.CreatePage" page
    Then I click the "EventList" button
    Then I click the "ReadSavedLog" button
    Then I click the "Create" button
    Then I set the parameter "EventListLogSample" with value "<sample>"
    Then I click the "Save" button
    Then the data name is "{'column':'3','name':'<sample>'}" then i click the "删除" button without paging in config
    Then I wait for "PopOverTip" will be visible
    And I will see the alertMessage "确认删除该日志样例？"
    Then I click the "CancelDelete" button
    Then I wait for "PopOverTip" will be invisible
    Then the data name is "{'column':'3','name':'<sample>'}" then i click the "删除" button without paging in config
    Then I wait for "PopOverTip" will be visible
    Then I click the "delete" button
    Then I wait for "1000" millsecond
    Then I will see the "SaveLogEmpty" result will be "暂无数据"

    Examples:
      | sample                             |
      | 192.168.1.200,xmxm,rzy,13800000000 |

  Scenario Outline: RZY-4578检索日志-成功
    When open the "localUpload.ListPage" page for uri "/sources/input/os/"
    And I set the parameter "AppName" with value "<appName>"
    And I set the parameter "Tag" with value "<appName>"
    And I upload a file with name "/src/test/resources/testdata/log/<log>"
    And I click the "UploadButton" button
    And I wait for element "VerifyText" change text to "上传完成"
    Then I wait for "3500" millsecond
    Given open the "configs.ListPage" page for uri "/configs/"
    Then I wait for loading invisible
    And I click the "Create" button
    Then I will see the "configs.CreatePage" page
    And I click the "AddRule" button
    And I choose the "<rule>" from the "ParseRule" in config
    Then I wait for "800" millsecond
    And I choose the "raw_message" from the "SourceField" in config
    Then I wait for "800" millsecond
    And I click the "EnsureAddParseRule" button
    And I wait for "ParseButton" will be visible
    Then I wait for "2000" millsecond
    Then I click the "EventList" button
    And I set the parameter "SearchInput" with value "tag:<appName>"
    And I click the "DateEditor" button
    And I click the "RecentOneHour" button
    And I click the "SearchButton" button
    Then I wait for loading invisible
    Then I click the "UseCheckLog" button
    And I wait for "1000" millsecond
    Then I will see the element "Status" contains "成功"

    Examples:
      | appName               | rule   | log           |
      | wym_eventlist_success | JSON解析 | eventlist.log |


  Scenario Outline: RZY-4579检索日志-失败
    When open the "localUpload.ListPage" page for uri "/sources/input/os/"
    And I set the parameter "AppName" with value "<appName>"
    And I set the parameter "Tag" with value "<appName>"
    And I upload a file with name "/src/test/resources/testdata/log/<log>"
    And I click the "UploadButton" button
    And I wait for element "VerifyText" change text to "上传完成"
    Then I wait for "3500" millsecond
    Given open the "configs.ListPage" page for uri "/configs/"
    Then I wait for loading invisible
    And I click the "Create" button
    Then I will see the "configs.CreatePage" page
    And I click the "AddRule" button
    And I choose the "<rule>" from the "ParseRule" in config
    Then I wait for "800" millsecond
    And I choose the "raw_message" from the "SourceField" in config
    Then I wait for "800" millsecond
    And I click the "EnsureAddParseRule" button
    And I wait for "ParseButton" will be visible
    Then I wait for "2000" millsecond
    Then I click the "EventList" button
    And I set the parameter "SearchInput" with value "tag:<appName>"
    And I click the "DateEditor" button
    And I click the "RecentOneHour" button
    And I click the "SearchButton" button
    Then I wait for loading invisible
    Then I click the "UseCheckLog" button
    And I wait for "1000" millsecond
    Then I will see the element "Status" contains "失败"

    Examples:
      | appName            | rule   | log     |
      | wym_eventlist_fail | JSON解析 | csv.log |

  Scenario Outline: RZY-4580查看检索字段
    When open the "localUpload.ListPage" page for uri "/sources/input/os/"
    And I set the parameter "AppName" with value "<appName>"
    And I set the parameter "Tag" with value "<appName>"
    And I upload a file with name "/src/test/resources/testdata/log/<log>"
    And I click the "UploadButton" button
    And I wait for element "VerifyText" change text to "上传完成"
    Then I wait for "3500" millsecond
    Given open the "configs.ListPage" page for uri "/configs/"
    Then I wait for loading invisible
    And I click the "Create" button
    Then I will see the "configs.CreatePage" page
    And I click the "AddRule" button
    And I choose the "<rule>" from the "ParseRule" in config
    Then I wait for "600" millsecond
    And I choose the "raw_message" from the "SourceField" in config
    Then I wait for "600" millsecond
    And I click the "EnsureAddParseRule" button
    And I wait for "ParseButton" will be visible
    Then I wait for "2000" millsecond
    Then I click the "EventList" button
    And I set the parameter "SearchInput" with value "tag:<appName>"
    And I click the "DateEditor" button
    And I click the "RecentOneHour" button
    And I click the "SearchButton" button
    Then I wait for loading invisible
    Then I click the "UseCheckLog" button
    And I wait for "1000" millsecond
    Then I click the "Field" button
    Then I choose the "Name" from the "ParseField" in config
    And I will see the element "FieldTitle" value contains "字段值,出现次数"
    And I will see the element "FieldValue" value contains "John Smith,1"
#    And I choose the "Age" from the "ParseField" in config
#    Then I wait for "500" millsecond
#    Then I will see the element "FieldValue" value contains "23,1"


    Examples:
      | appName                  | rule   | log           |
      | wym_eventlist_checkfield | JSON解析 | eventlist.log |


  Scenario Outline: RZY-4581选为日志样例
    When open the "localUpload.ListPage" page for uri "/sources/input/os/"
    And I set the parameter "AppName" with value "<appName>"
    And I set the parameter "Tag" with value "<appName>"
    And I upload a file with name "/src/test/resources/testdata/log/<log>"
    And I click the "UploadButton" button
    And I wait for element "VerifyText" change text to "上传完成"
    Then I wait for "3500" millsecond
    Given open the "configs.ListPage" page for uri "/configs/"
    Then I wait for loading invisible
    And I click the "Create" button
    Then I will see the "configs.CreatePage" page
    And I click the "AddRule" button
    And I choose the "<rule>" from the "ParseRule" in config
    Then I wait for "800" millsecond
    And I choose the "raw_message" from the "SourceField" in config
    Then I wait for "800" millsecond
    And I click the "EnsureAddParseRule" button
    And I wait for "ParseButton" will be visible
    Then I wait for "2000" millsecond
    Then I click the "EventList" button
    And I set the parameter "SearchInput" with value "tag:<appName>"
    And I click the "DateEditor" button
    And I click the "RecentOneHour" button
    And I click the "SearchButton" button
    Then I wait for loading invisible
    Then I click the "AsLogSample" button
    And I wait for "ParseButton" will be visible
    Then I wait for "1000" millsecond
    Then I set the parameter "HostNameInput" with value "666"
    And I click the "ParseButton" button
    And I wait for "CheckSuccess" will be visible
    Then I will see the element value in json "{'Result':'<result>'}"


    Examples:
      | appName                   | rule   | log           | result                                                                                                                                                                                                                                                                                                                                                                                                                                 |
      | wym_eventlist_aslogsample | JSON解析 | eventlist.log | Object\nAddress:Object\nCity:"Portland, New York,Los Angeles "\nCountry:"United States"\nStreet:"324 Chrome St"\nAge:23\nEmployed:true\nName:"John Smith "\nraw_message:"{"Name": "John Smith ", "Age": 23, "Employed": true, "Address": {"Street": "324 Chrome St", "City": "Portland, New York,Los Angeles ", "Country": "United States"}}"\n@appname:"wym_eventlist_aslogsample"\n@hostname:"666"\n@tag:"wym_eventlist_aslogsample" |


  Scenario Outline: RZY-4582保存检索日志
    When open the "localUpload.ListPage" page for uri "/sources/input/os/"
    And I set the parameter "AppName" with value "<appName>"
    And I set the parameter "Tag" with value "<appName>"
    And I upload a file with name "/src/test/resources/testdata/log/<log>"
    And I click the "UploadButton" button
    And I wait for element "VerifyText" change text to "上传完成"
    Then I wait for "3500" millsecond
    Given open the "configs.ListPage" page for uri "/configs/"
    Then I wait for loading invisible
    And I click the "Create" button
    Then I will see the "configs.CreatePage" page
    And I click the "AddRule" button
    And I choose the "<rule>" from the "ParseRule" in config
    Then I wait for "800" millsecond
    And I choose the "raw_message" from the "SourceField" in config
    Then I wait for "800" millsecond
    And I click the "EnsureAddParseRule" button
    And I wait for "ParseButton" will be visible
    Then I wait for "2000" millsecond
    Then I click the "EventList" button
    And I set the parameter "SearchInput" with value "tag:<appName>"
    And I click the "DateEditor" button
    And I click the "RecentOneHour" button
    And I click the "SearchButton" button
    Then I wait for loading invisible
    Then I click the "SaveSearchLog" button
    Then I click the "ReadSavedLog" button
    Then I wait for "1000" millsecond
    Then I will see the element "RawLog" contains "<raw>"
    Then I click the "ClearIcon" button
    And I click the "NextButton" button under some element
    When I set the parameter "Name" with value "<name>"
    And I set the parameter "Logtype" with value "other"
    And I click the "Done" button
    Then I wait for "ConfigDone" will be visible
    Given open the "configs.ListPage" page for uri "/configs/"
    Then I wait for loading invisible
    When the data name is "{'column':'1','name':'<name>'}" then i click the "编辑" button
    Then I will see the "configs.CreatePage" page
    Then I will see the element "RuleList" value contains "<rule>"
    Then I click the "EventList" button
    Then I click the "ReadSavedLog" button
    Then I wait for "1500" millsecond
    Then I will see the element "RawLog" contains "<raw>"

    Examples:
      | name      | appName             | rule   | log     | raw                                               |
      | wym保存搜索日志 | wym_saveas_checklog | JSON解析 | hex.log | 00000000: 696d 706f 7274 2073 7973 0a69 6d70 6f72 |
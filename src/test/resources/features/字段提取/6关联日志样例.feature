# new feature
# Tags: optional

Feature: 关联日志样例

  Background:
    Given open the "configs.ListPage" page for uri "/configs/"
    Then I wait for loading invisible

  Scenario Outline: RZY-4568、4569:保存关联日志样例并查看[规则名称自定义]
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

<<<<<<< HEAD
    Examples:
      | name      | result                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   | result1                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   | result2                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       |
      | wym保存日志样例 | Object\nclientip:"192.168.1.139"\nmsg:" "GET /api/v0/search/fields/?field=tag&filters=&order=desc&page=1&query=*&size=50&sourcegroup=all&sourcegroupCn=%E6%89%80%E6%9C%89%E6%97%A5%E5%BF%97&time_range=-2d,now&type=fields HTTP/1.1" 200 363 "http://alltest.rizhiyi.com/search/?query=*&time_range=-2d%2Cnow&order=desc&size=20&page=1&sourcegroup=all&type=timeline&_t=1422088066859&title=%E9%BB%98%E8%AE%A4&index=0" "Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:35.0) Gecko/20100101 Firefox/35.0""\ntime:"17:03:49"\nraw_message:"192.168.1.139 - - [24/Jan/2015:17:03:49 +0800] "GET /api/v0/search/fields/?field=tag&filters=&order=desc&page=1&query=*&size=50&sourcegroup=all&sourcegroupCn=%E6%89%80%E6%9C%89%E6%97%A5%E5%BF%97&time_range=-2d,now&type=fields HTTP/1.1" 200 363 "http://alltest.rizhiyi.com/search/?query=*&time_range=-2d%2Cnow&order=desc&size=20&page=1&sourcegroup=all&type=timeline&_t=1422088066859&title=%E9%BB%98%E8%AE%A4&index=0" "Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:35.0) Gecko/20100101 Firefox/35.0""\n@source:"/var/log/20180821/website" | Object\nclientip:"192.168.1.139"\ndate:"20180821"\nmsg:" "GET /api/v0/search/fields/?field=tag&filters=&order=desc&page=1&query=*&size=50&sourcegroup=all&sourcegroupCn=%E6%89%80%E6%9C%89%E6%97%A5%E5%BF%97&time_range=-2d,now&type=fields HTTP/1.1" 200 363 "http://alltest.rizhiyi.com/search/?query=*&time_range=-2d%2Cnow&order=desc&size=20&page=1&sourcegroup=all&type=timeline&_t=1422088066859&title=%E9%BB%98%E8%AE%A4&index=0" "Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:35.0) Gecko/20100101 Firefox/35.0""\ntime:"17:03:49"\nraw_message:"192.168.1.139 - - [24/Jan/2015:17:03:49 +0800] "GET /api/v0/search/fields/?field=tag&filters=&order=desc&page=1&query=*&size=50&sourcegroup=all&sourcegroupCn=%E6%89%80%E6%9C%89%E6%97%A5%E5%BF%97&time_range=-2d,now&type=fields HTTP/1.1" 200 363 "http://alltest.rizhiyi.com/search/?query=*&time_range=-2d%2Cnow&order=desc&size=20&page=1&sourcegroup=all&type=timeline&_t=1422088066859&title=%E9%BB%98%E8%AE%A4&index=0" "Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:35.0) Gecko/20100101 Firefox/35.0""\n@source:"/var/log/20180821/website" | Object\nclientip:"192.168.1.139"\ndate:"20180821"\nmsg:" "GET /api/v0/search/fields/?field=tag&filters=&order=desc&page=1&query=*&size=50&sourcegroup=all&sourcegroupCn=%E6%89%80%E6%9C%89%E6%97%A5%E5%BF%97&time_range=-2d,now&type=fields HTTP/1.1" 200 363 "http://alltest.rizhiyi.com/search/?query=*&time_range=-2d%2Cnow&order=desc&size=20&page=1&sourcegroup=all&type=timeline&_t=1422088066859&title=%E9%BB%98%E8%AE%A4&index=0" "Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:35.0) Gecko/20100101 Firefox/35.0""\ntime:"17:03:49"\ntimestampstamp:"20180821 17:03:49"\nraw_message:"192.168.1.139 - - [24/Jan/2015:17:03:49 +0800] "GET /api/v0/search/fields/?field=tag&filters=&order=desc&page=1&query=*&size=50&sourcegroup=all&sourcegroupCn=%E6%89%80%E6%9C%89%E6%97%A5%E5%BF%97&time_range=-2d,now&type=fields HTTP/1.1" 200 363 "http://alltest.rizhiyi.com/search/?query=*&time_range=-2d%2Cnow&order=desc&size=20&page=1&sourcegroup=all&type=timeline&_t=1422088066859&title=%E9%BB%98%E8%AE%A4&index=0" "Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:35.0) Gecko/20100101 Firefox/35.0""\n@source:"/var/log/20180821/website" |


  Scenario Outline: RZY-4574:使用检索日志验证-解析状态、字段[规则名称默认]
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
    And I wait for "500" millsecond
    Then I will see the element "Status" contains "成功"
    Then I click the "Field" button
    Then I choose the "date" from the "ParseField" in config
    And I will see the element "FieldTitle" value contains "字段值,出现次数"
    And I will see the element "FieldValue" value contains "20180821,1"
#    And I click the "ParseField" button
#    And I choose the "clientip" from the "ParseField"
#    Then I wait for "5000" millsecond
#    Then I will see the element "FieldValue" value contains "192.168.1.139,1"
#    And I choose the "time" from the "ParseField" in config
#    Then I wait for "500" millsecond
#    Then I will see the element "FieldValue" value contains "17:03:49,1"
||||||| merged common ancestors
=======
    Examples:
      | name      | result                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   | result1                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   | result2                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       |
      | wym保存日志样例 | Object\nclientip:"192.168.1.139"\nmsg:" "GET /api/v0/search/fields/?field=tag&filters=&order=desc&page=1&query=*&size=50&sourcegroup=all&sourcegroupCn=%E6%89%80%E6%9C%89%E6%97%A5%E5%BF%97&time_range=-2d,now&type=fields HTTP/1.1" 200 363 "http://alltest.rizhiyi.com/search/?query=*&time_range=-2d%2Cnow&order=desc&size=20&page=1&sourcegroup=all&type=timeline&_t=1422088066859&title=%E9%BB%98%E8%AE%A4&index=0" "Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:35.0) Gecko/20100101 Firefox/35.0""\ntime:"17:03:49"\nraw_message:"192.168.1.139 - - [24/Jan/2015:17:03:49 +0800] "GET /api/v0/search/fields/?field=tag&filters=&order=desc&page=1&query=*&size=50&sourcegroup=all&sourcegroupCn=%E6%89%80%E6%9C%89%E6%97%A5%E5%BF%97&time_range=-2d,now&type=fields HTTP/1.1" 200 363 "http://alltest.rizhiyi.com/search/?query=*&time_range=-2d%2Cnow&order=desc&size=20&page=1&sourcegroup=all&type=timeline&_t=1422088066859&title=%E9%BB%98%E8%AE%A4&index=0" "Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:35.0) Gecko/20100101 Firefox/35.0""\n@source:"/var/log/20180821/website" | Object\nclientip:"192.168.1.139"\ndate:"20180821"\nmsg:" "GET /api/v0/search/fields/?field=tag&filters=&order=desc&page=1&query=*&size=50&sourcegroup=all&sourcegroupCn=%E6%89%80%E6%9C%89%E6%97%A5%E5%BF%97&time_range=-2d,now&type=fields HTTP/1.1" 200 363 "http://alltest.rizhiyi.com/search/?query=*&time_range=-2d%2Cnow&order=desc&size=20&page=1&sourcegroup=all&type=timeline&_t=1422088066859&title=%E9%BB%98%E8%AE%A4&index=0" "Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:35.0) Gecko/20100101 Firefox/35.0""\ntime:"17:03:49"\nraw_message:"192.168.1.139 - - [24/Jan/2015:17:03:49 +0800] "GET /api/v0/search/fields/?field=tag&filters=&order=desc&page=1&query=*&size=50&sourcegroup=all&sourcegroupCn=%E6%89%80%E6%9C%89%E6%97%A5%E5%BF%97&time_range=-2d,now&type=fields HTTP/1.1" 200 363 "http://alltest.rizhiyi.com/search/?query=*&time_range=-2d%2Cnow&order=desc&size=20&page=1&sourcegroup=all&type=timeline&_t=1422088066859&title=%E9%BB%98%E8%AE%A4&index=0" "Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:35.0) Gecko/20100101 Firefox/35.0""\n@source:"/var/log/20180821/website" | Object\nclientip:"192.168.1.139"\ndate:"20180821"\nmsg:" "GET /api/v0/search/fields/?field=tag&filters=&order=desc&page=1&query=*&size=50&sourcegroup=all&sourcegroupCn=%E6%89%80%E6%9C%89%E6%97%A5%E5%BF%97&time_range=-2d,now&type=fields HTTP/1.1" 200 363 "http://alltest.rizhiyi.com/search/?query=*&time_range=-2d%2Cnow&order=desc&size=20&page=1&sourcegroup=all&type=timeline&_t=1422088066859&title=%E9%BB%98%E8%AE%A4&index=0" "Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:35.0) Gecko/20100101 Firefox/35.0""\ntime:"17:03:49"\ntimestampstamp:"20180821 17:03:49"\nraw_message:"192.168.1.139 - - [24/Jan/2015:17:03:49 +0800] "GET /api/v0/search/fields/?field=tag&filters=&order=desc&page=1&query=*&size=50&sourcegroup=all&sourcegroupCn=%E6%89%80%E6%9C%89%E6%97%A5%E5%BF%97&time_range=-2d,now&type=fields HTTP/1.1" 200 363 "http://alltest.rizhiyi.com/search/?query=*&time_range=-2d%2Cnow&order=desc&size=20&page=1&sourcegroup=all&type=timeline&_t=1422088066859&title=%E9%BB%98%E8%AE%A4&index=0" "Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:35.0) Gecko/20100101 Firefox/35.0""\n@source:"/var/log/20180821/website" |


  Scenario Outline: RZY-4574:使用检索日志验证-解析状态、字段[规则名称默认]
#    And I click the "Create" button
#    Then I will see the "configs.CreatePage" page
#    When I set the parameter "LogSample" with value "192.168.1.139 - - [24/Jan/2015:17:03:49 +0800] "GET /api/v0/search/fields/?field=tag&filters=&order=desc&page=1&query=*&size=50&sourcegroup=all&sourcegroupCn=%E6%89%80%E6%9C%89%E6%97%A5%E5%BF%97&time_range=-2d,now&type=fields HTTP/1.1" 200 363 "http://alltest.rizhiyi.com/search/?query=*&time_range=-2d%2Cnow&order=desc&size=20&page=1&sourcegroup=all&type=timeline&_t=1422088066859&title=%E9%BB%98%E8%AE%A4&index=0" "Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:35.0) Gecko/20100101 Firefox/35.0""
#    And I set the parameter "Source" with value "/var/log/20180821/website"
#    And I click the "AddRule" button
#    And I choose the "正则解析" from the "ParseRule" in config
#    And I choose the "raw_message" from the "SourceField" in config
#    And I set the parameter "Regex" with value "(?<clientip>\S+) - - \[\d+/\w+/\d+:(?<time>\S+) \+0800\](?<msg>.*)"
#    And I click the "EnsureAddParseRule" button
#    And I wait for "ParseButton" will be visible
#    Then I wait for "100" millsecond
#    And I click the "ParseButton" button
#    And I wait for "CheckSuccess" will be visible
#    Then I will see the element value in json "{'Result':'<result>'}"
#    And I click the "AddRule" button
#    And I choose the "正则解析" from the "ParseRule" in config
#    And I choose the "@source" from the "SourceField" in config
#    And I set the parameter "Regex" with value "/var/log/(?<date>\d{8})/website"
#    And I click the "EnsureAddParseRule" button
#    And I wait for "ParseButton" will be visible
#    Then I wait for "100" millsecond
#    And I click the "ParseButton" button
#    And I wait for "CheckSuccess2" will be visible
#    Then I will see the element value in json "{'Result':'<result1>'}"
#    And I click the "AddRule" button
#    And I choose the "格式化处理" from the "ParseRule" in config
#    And I choose the "date,time" from the "SourceField" in config
#    And I set the parameter "FormatRule" with value "$1 $2"
#    And I set the parameter "TargetField" with value "timestampstamp"
#    And I click the "EnsureAddParseRule" button
#    And I wait for "ParseButton" will be visible
#    Then I wait for "100" millsecond
#    And I click the "ParseButton" button
#    And I wait for "CheckSuccess3" will be visible
#    Then I will see the element value in json "{'Result':'<result2>'}"
#    Then I click the "Packup" button
#    Then I click the "EventList" button
#    Then I click the "ReadSavedLog" button
#    Then I click the "Create" button
#    Then I set the parameter "EventListLogSample" with value "192.168.1.139 - - [24/Jan/2015:17:03:49 +0800] "GET /api/v0/search/fields/?field=tag&filters=&order=desc&page=1&query=*&size=50&sourcegroup=all&sourcegroupCn=%E6%89%80%E6%9C%89%E6%97%A5%E5%BF%97&time_range=-2d,now&type=fields HTTP/1.1" 200 363 "http://alltest.rizhiyi.com/search/?query=*&time_range=-2d%2Cnow&order=desc&size=20&page=1&sourcegroup=all&type=timeline&_t=1422088066859&title=%E9%BB%98%E8%AE%A4&index=0" "Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:35.0) Gecko/20100101 Firefox/35.0""
#    Then I set the parameter "EventListSource" with value "/var/log/20180821/website"
#    Then I click the "Save" button
#    Then I click the "ClearIcon" button
#    And I click the "NextButton" button under some element
#    When I set the parameter "Name" with value "<name>"
#    And I set the parameter "Logtype" with value "other"
#    And I click the "Done" button
#    Then I wait for "ConfigDone" will be visible
#    Given open the "configs.ListPage" page for uri "/configs/"
#    Then I wait for loading invisible
    When the data name is "{'column':'1','name':'<name>'}" then i click the "编辑" button
    Then I will see the "configs.CreatePage" page
    Then I will see the element "RuleList" value contains "正则解析,正则解析(@source),格式化处理(date,time)"
    Then I click the "EventList" button
    Then I click the "ReadSavedLog" button
    Then I click the "UseCheckLog" button
    And I wait for "500" millsecond
    Then I will see the element "Status" contains "成功"
    Then I click the "Field" button
    Then I choose the "date" from the "ParseField" in config
    And I will see the element "FieldTitle" value contains "字段值,出现次数"
    And I will see the element "FieldValue" value contains "20180821,1"
    And I click the "ParseField" button
    And I choose the "clientip" from the "ParseField"
    Then I wait for "5000" millsecond
#    Then I will see the element "FieldValue" value contains "192.168.1.139,1"
#    And I choose the "time" from the "ParseField" in config
#    Then I wait for "500" millsecond
#    Then I will see the element "FieldValue" value contains "17:03:49,1"
>>>>>>> 42f844811cad3ac670394c902b1c8bead2c3c720



    Examples:
      | name      | result                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   | result1                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   | result2                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       |
      | wym检索日志验证状态 | Object\nclientip:"192.168.1.139"\nmsg:" "GET /api/v0/search/fields/?field=tag&filters=&order=desc&page=1&query=*&size=50&sourcegroup=all&sourcegroupCn=%E6%89%80%E6%9C%89%E6%97%A5%E5%BF%97&time_range=-2d,now&type=fields HTTP/1.1" 200 363 "http://alltest.rizhiyi.com/search/?query=*&time_range=-2d%2Cnow&order=desc&size=20&page=1&sourcegroup=all&type=timeline&_t=1422088066859&title=%E9%BB%98%E8%AE%A4&index=0" "Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:35.0) Gecko/20100101 Firefox/35.0""\ntime:"17:03:49"\nraw_message:"192.168.1.139 - - [24/Jan/2015:17:03:49 +0800] "GET /api/v0/search/fields/?field=tag&filters=&order=desc&page=1&query=*&size=50&sourcegroup=all&sourcegroupCn=%E6%89%80%E6%9C%89%E6%97%A5%E5%BF%97&time_range=-2d,now&type=fields HTTP/1.1" 200 363 "http://alltest.rizhiyi.com/search/?query=*&time_range=-2d%2Cnow&order=desc&size=20&page=1&sourcegroup=all&type=timeline&_t=1422088066859&title=%E9%BB%98%E8%AE%A4&index=0" "Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:35.0) Gecko/20100101 Firefox/35.0""\n@source:"/var/log/20180821/website" | Object\nclientip:"192.168.1.139"\ndate:"20180821"\nmsg:" "GET /api/v0/search/fields/?field=tag&filters=&order=desc&page=1&query=*&size=50&sourcegroup=all&sourcegroupCn=%E6%89%80%E6%9C%89%E6%97%A5%E5%BF%97&time_range=-2d,now&type=fields HTTP/1.1" 200 363 "http://alltest.rizhiyi.com/search/?query=*&time_range=-2d%2Cnow&order=desc&size=20&page=1&sourcegroup=all&type=timeline&_t=1422088066859&title=%E9%BB%98%E8%AE%A4&index=0" "Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:35.0) Gecko/20100101 Firefox/35.0""\ntime:"17:03:49"\nraw_message:"192.168.1.139 - - [24/Jan/2015:17:03:49 +0800] "GET /api/v0/search/fields/?field=tag&filters=&order=desc&page=1&query=*&size=50&sourcegroup=all&sourcegroupCn=%E6%89%80%E6%9C%89%E6%97%A5%E5%BF%97&time_range=-2d,now&type=fields HTTP/1.1" 200 363 "http://alltest.rizhiyi.com/search/?query=*&time_range=-2d%2Cnow&order=desc&size=20&page=1&sourcegroup=all&type=timeline&_t=1422088066859&title=%E9%BB%98%E8%AE%A4&index=0" "Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:35.0) Gecko/20100101 Firefox/35.0""\n@source:"/var/log/20180821/website" | Object\nclientip:"192.168.1.139"\ndate:"20180821"\nmsg:" "GET /api/v0/search/fields/?field=tag&filters=&order=desc&page=1&query=*&size=50&sourcegroup=all&sourcegroupCn=%E6%89%80%E6%9C%89%E6%97%A5%E5%BF%97&time_range=-2d,now&type=fields HTTP/1.1" 200 363 "http://alltest.rizhiyi.com/search/?query=*&time_range=-2d%2Cnow&order=desc&size=20&page=1&sourcegroup=all&type=timeline&_t=1422088066859&title=%E9%BB%98%E8%AE%A4&index=0" "Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:35.0) Gecko/20100101 Firefox/35.0""\ntime:"17:03:49"\ntimestampstamp:"20180821 17:03:49"\nraw_message:"192.168.1.139 - - [24/Jan/2015:17:03:49 +0800] "GET /api/v0/search/fields/?field=tag&filters=&order=desc&page=1&query=*&size=50&sourcegroup=all&sourcegroupCn=%E6%89%80%E6%9C%89%E6%97%A5%E5%BF%97&time_range=-2d,now&type=fields HTTP/1.1" 200 363 "http://alltest.rizhiyi.com/search/?query=*&time_range=-2d%2Cnow&order=desc&size=20&page=1&sourcegroup=all&type=timeline&_t=1422088066859&title=%E9%BB%98%E8%AE%A4&index=0" "Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:35.0) Gecko/20100101 Firefox/35.0""\n@source:"/var/log/20180821/website" |

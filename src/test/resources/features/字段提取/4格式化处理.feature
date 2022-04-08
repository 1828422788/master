@configs27 @configs
Feature: 字段提取格式化处理


  Scenario Outline: RZY-1551:删除字段
    Given open the "configs.ListPage" page for uri "/configs/"
    And I click the "Create" button
    Then I will see the "configs.CreatePage" page
    Then I click the "EventList" button
    Then I click the "ReadSavedLog" button
    Then I click the "Create" button
    Then I set the value "192.168.1.139 - - [24/Jan/2015:17:03:49 +0800] "GET /api/v0/search/fields/?field=tag&filters=&order=desc&page=1&query=*&size=50&sourcegroup=all&sourcegroupCn=%E6%89%80%E6%9C%89%E6%97%A5%E5%BF%97&time_range=-2d,now&type=fields HTTP/1.1" 200 363 "http://alltest.rizhiyi.com/search/?query=*&time_range=-2d%2Cnow&order=desc&size=20&page=1&sourcegroup=all&type=timeline&_t=1422088066859&title=%E9%BB%98%E8%AE%A4&index=0" "Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:35.0) Gecko/20100101 Firefox/35.0"" to the textarea "EventListLogSample"
    Then I set the parameter "EventListSource" with value "/var/log/20180821/website"
    Then I click the "Save" button
    Then I click the "ClearIcon" button
    When I set the parameter "LogSample" with value "192.168.1.139 - - [24/Jan/2015:17:03:49 +0800] "GET /api/v0/search/fields/?field=tag&filters=&order=desc&page=1&query=*&size=50&sourcegroup=all&sourcegroupCn=%E6%89%80%E6%9C%89%E6%97%A5%E5%BF%97&time_range=-2d,now&type=fields HTTP/1.1" 200 363 "http://alltest.rizhiyi.com/search/?query=*&time_range=-2d%2Cnow&order=desc&size=20&page=1&sourcegroup=all&type=timeline&_t=1422088066859&title=%E9%BB%98%E8%AE%A4&index=0" "Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:35.0) Gecko/20100101 Firefox/35.0""
    And I set the parameter "LogSource" with value "/var/log/20180821/website"
    And I click the "AddRule" button
    And I choose the "正则解析" from the "ParseRule" in config
    And I wait for "1000" millsecond
    And I choose the "raw_message" from the "SourceField" in config
    Then I wait for "1000" millsecond
    And I set the value "(?<clientip>\S+) - - \[\d+/\w+/\d+:(?<time>\S+) \+0800\](?<msg>.*)" to the textarea "Regex"
    And I click the "EnsureAddParseRule" button
    And I wait for loading invisible
    And I click the "ParseButton" button
    And I wait for "CheckSuccess" will be visible
    And I click the "Collapse" button
    And I click the "AddRule" button
    And I choose the "正则解析" from the "ParseRule" in config
    And I wait for "1000" millsecond
    And I choose the "@source" from the "SourceField" in config
    Then I wait for "1000" millsecond
    And I set the value "/var/log/(?<date>\d{8})/website" to the textarea "Regex"
    And I click the "EnsureAddParseRule" button
    And I wait for loading invisible
    And I click the "ParseButton" button
    And I wait for "CheckSuccess2" will be visible
    And I click the "Collapse" button
    And I click the "AddRule" button
    And I choose the "格式化处理" from the "ParseRule" in config
    And I wait for "1000" millsecond
    And I choose the "date,@ip" from the "SourceField" in config
    Then I wait for "1000" millsecond
    And I set the parameter "FormatRule" with value "$1 $2"
    And I set the parameter "TargetFieldInput" with value "timestamp"
    And I click the "EnsureAddParseRule" button
    And I wait for "ParseButton" will be visible
    Then I wait for "100" millsecond
    And I click the "ParseButton" button
    And I wait for "CheckSuccess3" will be visible
    And I click the "Collapse" button
    And I click the "AddRule" button
    And I choose the "删除字段" from the "ParseRule" in config
    And I wait for "1000" millsecond
    And I choose the "date" from the "SourceField" in config
    Then I wait for "1000" millsecond
    And I click the "EnsureAddParseRule" button
    And I wait for "ParseButton" will be visible
    Then I wait for "100" millsecond
    And I click the "ParseButton" button
    And I wait for "CheckSuccess4" will be visible
    And I wait for "2000" millsecond
    Then I will see the field extraction result "<result>"
    And I click the "NextButton" button under some element
    When I set the parameter "Name" with value "rzyuitest字段提取格式化处理1"
    And I set the parameter "Logtype" with value "other"
    And I set the parameter "AppName" with value "testrule"
    And I set the parameter "Tag" with value "rzyuitest字段提取格式化处理1"
    And I click the "Done" button
    Then I wait for "ConfigDone" will be visible

    Examples:
      | result                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                |
      | {'clientip':'"192.168.1.139"','msg':'" "GET /api/v0/search/fields/?field=tag&filters=&order=desc&page=1&query=*&size=50&sourcegroup=all&sourcegroupCn=%E6%89%80%E6%9C%89%E6%97%A5%E5%BF%97&time_range=-2d,now&type=fields HTTP/1.1" 200 363 "http://alltest.rizhiyi.com/search/?query=*&time_range=-2d%2Cnow&order=desc&size=20&page=1&sourcegroup=all&type=timeline&_t=1422088066859&title=%E9%BB%98%E8%AE%A4&index=0" "Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:35.0) Gecko/20100101 Firefox/35.0""','time':'"17:03:49"','raw_message':'"192.168.1.139 - - [24/Jan/2015:17:03:49 +0800] "GET /api/v0/search/fields/?field=tag&filters=&order=desc&page=1&query=*&size=50&sourcegroup=all&sourcegroupCn=%E6%89%80%E6%9C%89%E6%97%A5%E5%BF%97&time_range=-2d,now&type=fields HTTP/1.1" 200 363 "http://alltest.rizhiyi.com/search/?query=*&time_range=-2d%2Cnow&order=desc&size=20&page=1&sourcegroup=all&type=timeline&_t=1422088066859&title=%E9%BB%98%E8%AE%A4&index=0" "Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:35.0) Gecko/20100101 Firefox/35.0""','@source':'"/var/log/20180821/website"'} |


  Scenario Outline: RZY-1550:格式化处理
    Given open the "configs.ListPage" page for uri "/configs/"
    And I click the "Create" button
    Then I will see the "configs.CreatePage" page
    When I set the parameter "LogSample" with value "192.168.1.139 - - [24/Jan/2015:17:03:49 +0800] "GET /api/v0/search/fields/?field=tag&filters=&order=desc&page=1&query=*&size=50&sourcegroup=all&sourcegroupCn=%E6%89%80%E6%9C%89%E6%97%A5%E5%BF%97&time_range=-2d,now&type=fields HTTP/1.1" 200 363 "http://alltest.rizhiyi.com/search/?query=*&time_range=-2d%2Cnow&order=desc&size=20&page=1&sourcegroup=all&type=timeline&_t=1422088066859&title=%E9%BB%98%E8%AE%A4&index=0" "Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:35.0) Gecko/20100101 Firefox/35.0""
    And I set the parameter "LogSource" with value "/var/log/20180821/website"
    And I click the "AddRule" button
    And I choose the "正则解析" from the "ParseRule" in config
    And I wait for "1000" millsecond
    And I choose the "raw_message" from the "SourceField" in config
    Then I wait for "1000" millsecond
    And I set the value "(?<clientip>\S+) - - \[\d+/\w+/\d+:(?<time>\S+) \+0800\](?<msg>.*)" to the textarea "Regex"
    And I click the "EnsureAddParseRule" button
    And I wait for loading invisible
    And I click the "ParseButton" button
    And I wait for "CheckSuccess" will be visible
    And I click the "Collapse" button
    And I click the "AddRule" button
    And I choose the "正则解析" from the "ParseRule" in config
    And I wait for "1000" millsecond
    And I choose the "@source" from the "SourceField" in config
    And I set the value "/var/log/(?<date>\d{8})/website" to the textarea "Regex"
    And I click the "EnsureAddParseRule" button
    And I wait for loading invisible
    And I click the "ParseButton" button
    And I wait for "CheckSuccess2" will be visible
    And I click the "Collapse" button
    And I click the "AddRule" button
    And I choose the "格式化处理" from the "ParseRule" in config
    And I wait for "1000" millsecond
    And I choose the "date,time" from the "SourceField" in config
    Then I wait for "1000" millsecond
    And I set the parameter "FormatRule" with value "$1 $2"
    And I set the parameter "TargetFieldInput" with value "timestampstamp"
    And I click the "EnsureAddParseRule" button
    And I wait for loading invisible
    And I click the "ParseButton" button
    And I wait for "CheckSuccess3" will be visible
    And I click the "Collapse" button
    And I click the "AddRule" button
    And I choose the "时间戳识别" from the "ParseRule" in config
    And I wait for "1000" millsecond
    And I choose the "timestampstamp" from the "sourceField" in config
    Then I wait for "1000" millsecond
    And I set the parameter "TimeFormat" with value "yyyyMMdd HH:mm:ss"
    And I click the "EnsureAddParseRule" button
    And I wait for loading invisible
    And I click the "ParseButton" button
    And I wait for "CheckSuccess4" will be visible
    Then I will see the field extraction result "<result>"
    And I click the "Collapse" button
    And I click the "NextButton" button under some element
    When I set the parameter "Name" with value "RZY1550格式化处理"
    And I set the parameter "Logtype" with value "other"
    And I set the parameter "AppName" with value "wym_test_format"
    And I set the parameter "Tag" with value "wym_test_format"
    And I switch the "SwitchButton" button to "enable"
    And I click the "Done" button
    Then I wait for "ConfigDone" will be visible

    Examples:
      | result                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      |
      | {'clientip':'"192.168.1.139"','date':'"20180821"','msg':'" "GET /api/v0/search/fields/?field=tag&filters=&order=desc&page=1&query=*&size=50&sourcegroup=all&sourcegroupCn=%E6%89%80%E6%9C%89%E6%97%A5%E5%BF%97&time_range=-2d,now&type=fields HTTP/1.1" 200 363 "http://alltest.rizhiyi.com/search/?query=*&time_range=-2d%2Cnow&order=desc&size=20&page=1&sourcegroup=all&type=timeline&_t=1422088066859&title=%E9%BB%98%E8%AE%A4&index=0" "Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:35.0) Gecko/20100101 Firefox/35.0""','time':'"17:03:49"','timestampstamp':'"20180821 17:03:49"','timestamp':'"2018/08/21 17:03:49.0"','raw_message':'"192.168.1.139 - - [24/Jan/2015:17:03:49 +0800] "GET /api/v0/search/fields/?field=tag&filters=&order=desc&page=1&query=*&size=50&sourcegroup=all&sourcegroupCn=%E6%89%80%E6%9C%89%E6%97%A5%E5%BF%97&time_range=-2d,now&type=fields HTTP/1.1" 200 363 "http://alltest.rizhiyi.com/search/?query=*&time_range=-2d%2Cnow&order=desc&size=20&page=1&sourcegroup=all&type=timeline&_t=1422088066859&title=%E9%BB%98%E8%AE%A4&index=0" "Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:35.0) Gecko/20100101 Firefox/35.0""','@source':'"/var/log/20180821/website"'} |


  Scenario Outline: 格式化处理,上传日志，验证结果
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

    Examples:
      | appName         | log         | searchResult                                                         |
      | wym_test_format | website.log | {'other.clientip':'192.168.1.139',"other.date":"20180821",'other.time':'17:03:49','other.timestampstamp':'20180821 17:03:49'} |
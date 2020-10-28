@configsSmoke
Feature: 字段提取时间戳识别

  Background:
    Given open the "configs.ListPage" page for uri "/configs/"
    Then I wait for loading invisible

  @second
  Scenario Outline: RZY-1541:添加时间戳识别规则
    And I click the "Create" button
    Then I will see the "configs.CreatePage" page
    When I set the parameter "LogSample" with value "192.168.1.139 - - [24/Jan/2015:17:03:49 +0800] "GET /api/v0/search/fields/?field=tag&filters=&order=desc&page=1&query=*&size=50&sourcegroup=all&sourcegroupCn=%E6%89%80%E6%9C%89%E6%97%A5%E5%BF%97&time_range=-2d,now&type=fields HTTP/1.1" 200 363 "http://alltest.rizhiyi.com/search/?query=*&time_range=-2d%2Cnow&order=desc&size=20&page=1&sourcegroup=all&type=timeline&_t=1422088066859&title=%E9%BB%98%E8%AE%A4&index=0" "Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:35.0) Gecko/20100101 Firefox/35.0""
    And I click the "AddRule" button
    And I choose the "正则解析" from the "ParseRule" in config
    And I choose the "raw_message" from the "SourceField" in config
    And I set the parameter "Regex" with value "%{ApcClientIP} %{ApcIdent} %{ApcUser} %{ApcTimestamp} %{ApcRequest} %{ApcStatus} %{ApcRespLen} %{ApcReferer} %{ApcUa}"
    And I click the "EnsureAddParseRule" button
    And I wait for "ParseButton" will be visible
    Then I wait for "100" millsecond
    And I click the "ParseButton" button
    And I wait for "CheckSuccess" will be visible
    Then I will see the element value in json "{'Result':'<result>'}"
    And I click the "AddRule" button
    And I choose the "时间戳识别" from the "ParseRule" in config
    And I choose the "timestamp" from the "SourceField" in config
    And I set the parameter "TimeFormat" with value "dd/MMM/yyyy:HH:mm:ss Z"
    And I click the "EnsureAddParseRule" button
    And I wait for "ParseButton" will be visible
    Then I wait for "100" millsecond
    And I click the "ParseButton" button
    And I wait for "CheckSuccess2" will be visible
    Then I will see the element value in json "{'Result':'<result1>'}"

    Examples:
      | result                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 | result1                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           |
      | Object\nclientip:"192.168.1.139"\nmethod:"GET"\nreferer:"http://alltest.rizhiyi.com/search/?query=*&time_range=-2d%2Cnow&order=desc&size=20&page=1&sourcegroup=all&type=timeline&_t=1422088066859&title=%E9%BB%98%E8%AE%A4&index=0"\nreferer_domain:"alltest.rizhiyi.com"\nrequest_path:"/api/v0/search/fields/"\nrequest_query:"field=tag&filters=&order=desc&page=1&query=*&size=50&sourcegroup=all&sourcegroupCn=%E6%89%80%E6%9C%89%E6%97%A5%E5%BF%97&time_range=-2d,now&type=fields"\nresp_len:363\nstatus:200\ntimestamp:"24/Jan/2015:17:03:49 +0800"\nua:"Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:35.0) Gecko/20100101 Firefox/35.0"\nversion:"1.1"\nraw_message:"192.168.1.139 - - [24/Jan/2015:17:03:49 +0800] "GET /api/v0/search/fields/?field=tag&filters=&order=desc&page=1&query=*&size=50&sourcegroup=all&sourcegroupCn=%E6%89%80%E6%9C%89%E6%97%A5%E5%BF%97&time_range=-2d,now&type=fields HTTP/1.1" 200 363 "http://alltest.rizhiyi.com/search/?query=*&time_range=-2d%2Cnow&order=desc&size=20&page=1&sourcegroup=all&type=timeline&_t=1422088066859&title=%E9%BB%98%E8%AE%A4&index=0" "Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:35.0) Gecko/20100101 Firefox/35.0"" | Object\nclientip:"192.168.1.139"\nmethod:"GET"\nreferer:"http://alltest.rizhiyi.com/search/?query=*&time_range=-2d%2Cnow&order=desc&size=20&page=1&sourcegroup=all&type=timeline&_t=1422088066859&title=%E9%BB%98%E8%AE%A4&index=0"\nreferer_domain:"alltest.rizhiyi.com"\nrequest_path:"/api/v0/search/fields/"\nrequest_query:"field=tag&filters=&order=desc&page=1&query=*&size=50&sourcegroup=all&sourcegroupCn=%E6%89%80%E6%9C%89%E6%97%A5%E5%BF%97&time_range=-2d,now&type=fields"\nresp_len:363\nstatus:200\ntimestamp:"2015/01/24 17:03:49.0"\nua:"Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:35.0) Gecko/20100101 Firefox/35.0"\nversion:"1.1"\nraw_message:"192.168.1.139 - - [24/Jan/2015:17:03:49 +0800] "GET /api/v0/search/fields/?field=tag&filters=&order=desc&page=1&query=*&size=50&sourcegroup=all&sourcegroupCn=%E6%89%80%E6%9C%89%E6%97%A5%E5%BF%97&time_range=-2d,now&type=fields HTTP/1.1" 200 363 "http://alltest.rizhiyi.com/search/?query=*&time_range=-2d%2Cnow&order=desc&size=20&page=1&sourcegroup=all&type=timeline&_t=1422088066859&title=%E9%BB%98%E8%AE%A4&index=0" "Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:35.0) Gecko/20100101 Firefox/35.0"" |

  @second
  Scenario Outline: RZY-2824 2823:时间戳前缀和最大匹配长度成功
    And I click the "Create" button
    Then I will see the "configs.CreatePage" page
    When I set the parameter "LogSample" with value "<log>"
    And I click the "AddRule" button
    And I choose the "时间戳识别" from the "ParseRule" in config
    And I choose the "raw_message" from the "SourceField" in config
    And I set the parameter "TimeFormat" with value "dd/MMM/yyyy:HH:mm:ss Z"
    And I set the parameter "TimestampPrefix" with value "\["
    And I set the parameter "MaxMatchLength" with value "<length>"
    And I click the "EnsureAddParseRule" button
    And I wait for "ParseButton" will be visible
    Then I wait for "100" millsecond
    And I click the "ParseButton" button
    And I wait for "CheckSuccess" will be visible
    Then I will see the element value in json "{'Result':'<result>'}"

    Examples:
      | log                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  | length | result                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        |
      | 192.168.1.139 - - [24/Jan/2015:17:03:49 +0800] "GET /api/v0/search/fields/?field=tag&filters=&order=desc&page=1&query=*&size=50&sourcegroup=all&sourcegroupCn=%E6%89%80%E6%9C%89%E6%97%A5%E5%BF%97&time_range=-2d,now&type=fields HTTP/1.1" 200 363 "http://alltest.rizhiyi.com/search/?query=*&time_range=-2d%2Cnow&order=desc&size=20&page=1&sourcegroup=all&type=timeline&_t=1422088066859&title=%E9%BB%98%E8%AE%A4&index=0" "Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:35.0) Gecko/20100101 Firefox/35.0" | 45     | Object\ntimestamp:"2015/01/24 17:03:49.0"\nraw_message:"192.168.1.139 - - [24/Jan/2015:17:03:49 +0800] "GET /api/v0/search/fields/?field=tag&filters=&order=desc&page=1&query=*&size=50&sourcegroup=all&sourcegroupCn=%E6%89%80%E6%9C%89%E6%97%A5%E5%BF%97&time_range=-2d,now&type=fields HTTP/1.1" 200 363 "http://alltest.rizhiyi.com/search/?query=*&time_range=-2d%2Cnow&order=desc&size=20&page=1&sourcegroup=all&type=timeline&_t=1422088066859&title=%E9%BB%98%E8%AE%A4&index=0" "Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:35.0) Gecko/20100101 Firefox/35.0"" |

  @second
  Scenario Outline: RZY-2824:最大匹配长度失败
    And I click the "Create" button
    Then I will see the "configs.CreatePage" page
    When I set the parameter "LogSample" with value "<log>"
    And I click the "AddRule" button
    And I choose the "时间戳识别" from the "ParseRule" in config
    And I choose the "raw_message" from the "SourceField" in config
    And I set the parameter "TimeFormat" with value "dd/MMM/yyyy:HH:mm:ss Z"
    And I set the parameter "TimestampPrefix" with value "\["
    And I set the parameter "MaxMatchLength" with value "<length>"
    And I click the "EnsureAddParseRule" button
    And I wait for "ParseButton" will be visible
    Then I wait for "100" millsecond
    And I click the "ParseButton" button
    And I wait for "FailedMessage" will be visible
    Then I will see the element value in json "{'Result':'<result>'}"

    Examples:
      | log                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  | length | result                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     |
      | 192.168.1.139 - - [24/Jan/2015:17:03:49 +0800] "GET /api/v0/search/fields/?field=tag&filters=&order=desc&page=1&query=*&size=50&sourcegroup=all&sourcegroupCn=%E6%89%80%E6%9C%89%E6%97%A5%E5%BF%97&time_range=-2d,now&type=fields HTTP/1.1" 200 363 "http://alltest.rizhiyi.com/search/?query=*&time_range=-2d%2Cnow&order=desc&size=20&page=1&sourcegroup=all&type=timeline&_t=1422088066859&title=%E9%BB%98%E8%AE%A4&index=0" "Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:35.0) Gecko/20100101 Firefox/35.0" | 44     | Object\nraw_message:"192.168.1.139 - - [24/Jan/2015:17:03:49 +0800] "GET /api/v0/search/fields/?field=tag&filters=&order=desc&page=1&query=*&size=50&sourcegroup=all&sourcegroupCn=%E6%89%80%E6%9C%89%E6%97%A5%E5%BF%97&time_range=-2d,now&type=fields HTTP/1.1" 200 363 "http://alltest.rizhiyi.com/search/?query=*&time_range=-2d%2Cnow&order=desc&size=20&page=1&sourcegroup=all&type=timeline&_t=1422088066859&title=%E9%BB%98%E8%AE%A4&index=0" "Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:35.0) Gecko/20100101 Firefox/35.0"" |

  @second
  Scenario Outline: 搜索页验证
    And I click the "Create" button
    Then I will see the "configs.CreatePage" page
    When I set the parameter "LogSample" with value "<lg>"
    And I click the "AddRule" button
    And I choose the "正则解析" from the "ParseRule" in config
    And I choose the "raw_message" from the "SourceField" in config
    And I set the parameter "Regex" with value "%{ApcClientIP} %{ApcIdent} %{ApcUser} %{ApcTimestamp} %{ApcRequest} %{ApcStatus} %{ApcRespLen} %{ApcReferer} %{ApcUa}"
    And I click the "EnsureAddParseRule" button
    And I click the "AddRule" button
    And I choose the "时间戳识别" from the "ParseRule" in config
    And I choose the "raw_message" from the "SourceField" in config
    And I set the parameter "TimeFormat" with value "dd/MMM/yyyy:HH:mm:ss Z"
    And I click the "EnsureAddParseRule" button
    And I wait for "ParseButton" will be visible
    Then I wait for "100" millsecond
    And I click the "ParseButton" button
    And I wait for "CheckSuccess2" will be visible
    Then I will see the element value in json "{'Result':'<result>'}"
    And I click the "NextButton" button under some element
    And I click the "SwitchButton" button
    When I set the parameter "Name" with value "RZY2823时间戳前缀"
    And I set the parameter "Logtype" with value "apache"
    And I set the parameter "AppName" with value "<appName>"
    And I set the parameter "Tag" with value "<appName>"
    And I click the "Done" button
    Then I wait for "ConfigDone" will be visible
    When open the "localUpload.ListPage" page for uri "/sources/input/os/"
    And I set the parameter "AppName" with value "<appName>"
    And I set the parameter "Tag" with value "<appName>"
    And I upload a file with name "/src/test/resources/testdata/log/<log>"
    And I click the "UploadButton" button
    And I wait for element "VerifyText" change text to "上传完成"
    Then I wait for "40000" millsecond
    When open the "splSearch.SearchPage" page for uri "/search/"
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I set the parameter "SearchInput" with value "<splsearch>"
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    Then I wait for "1000" millsecond
    And I click the "RightIcon" button
    Then I wait for "1000" millsecond
    Then I will see the spl search result "<searchResult>"

    Examples:
      | splsearch                                                                        | appName            | log           | lg                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   | result                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            | searchResult                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             | startDate  | endDate    | startTime    | endTime |
      | starttime=2015-01-24:17:03:00 endtime=2015-01-25:17:04:00 tag:wym_test_timestamp | wym_test_timestamp | timestamp.log | 192.168.1.139 - - [24/Jan/2015:17:03:49 +0800] "GET /api/v0/search/fields/?field=tag&filters=&order=desc&page=1&query=*&size=50&sourcegroup=all&sourcegroupCn=%E6%89%80%E6%9C%89%E6%97%A5%E5%BF%97&time_range=-2d,now&type=fields HTTP/1.1" 200 363 "http://alltest.rizhiyi.com/search/?query=*&time_range=-2d%2Cnow&order=desc&size=20&page=1&sourcegroup=all&type=timeline&_t=1422088066859&title=%E9%BB%98%E8%AE%A4&index=0" "Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:35.0) Gecko/20100101 Firefox/35.0" | Object\nclientip:"192.168.1.139"\nmethod:"GET"\nreferer:"http://alltest.rizhiyi.com/search/?query=*&time_range=-2d%2Cnow&order=desc&size=20&page=1&sourcegroup=all&type=timeline&_t=1422088066859&title=%E9%BB%98%E8%AE%A4&index=0"\nreferer_domain:"alltest.rizhiyi.com"\nrequest_path:"/api/v0/search/fields/"\nrequest_query:"field=tag&filters=&order=desc&page=1&query=*&size=50&sourcegroup=all&sourcegroupCn=%E6%89%80%E6%9C%89%E6%97%A5%E5%BF%97&time_range=-2d,now&type=fields"\nresp_len:363\nstatus:200\ntimestamp:"2015/01/24 17:03:49.0"\nua:"Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:35.0) Gecko/20100101 Firefox/35.0"\nversion:"1.1"\nraw_message:"192.168.1.139 - - [24/Jan/2015:17:03:49 +0800] "GET /api/v0/search/fields/?field=tag&filters=&order=desc&page=1&query=*&size=50&sourcegroup=all&sourcegroupCn=%E6%89%80%E6%9C%89%E6%97%A5%E5%BF%97&time_range=-2d,now&type=fields HTTP/1.1" 200 363 "http://alltest.rizhiyi.com/search/?query=*&time_range=-2d%2Cnow&order=desc&size=20&page=1&sourcegroup=all&type=timeline&_t=1422088066859&title=%E9%BB%98%E8%AE%A4&index=0" "Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:35.0) Gecko/20100101 Firefox/35.0"" | {'apache.clientip':'apache.clientip: 192.168.1.139 ','apache.method':'apache.method: GET ','apache.referer':'apache.referer: http://alltest.rizhiyi.com/search/?query=*&time_range=-2d%2Cnow&order=desc&size=20&page=1&sourcegroup=all&type=timeline&_t=1422088066859&title=%E9%BB%98%E8%AE%A4&index=0 ','apache.referer_domain':'apache.referer_domain: alltest.rizhiyi.com ','apache.request_path':'apache.request_path: /api/v0/search/fields/ ','apache.request_query':'apache.request_query: field=tag&filters=&order=desc&page=1&query=*&size=50&sourcegroup=all&sourcegroupCn=%E6%89%80%E6%9C%89%E6%97%A5%E5%BF%97&time_range=-2d,now&type=fields ','apache.resp_len':'apache.resp_len: 363 ','apache.status':'apache.status: 200 ','apache.timestamp':'apache.timestamp: 24/Jan/2015:17:03:49 +0800 ','apache.ua':'apache.ua: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:35.0) Gecko/20100101 Firefox/35.0 ','apache.version':'apache.version: 1.1 '} | 2015-01-01 | 2015-02-01 | 00:00:00.000 |         |


  Scenario Outline: 详情验证
    And I click the "Create" button
    Then I will see the "configs.CreatePage" page
    When I set the parameter "LogSample" with value "<lg>"
    And I click the "AddRule" button
    And I choose the "正则解析" from the "ParseRule" in config
    And I choose the "raw_message" from the "SourceField" in config
    And I set the parameter "Regex" with value "%{ApcClientIP} %{ApcIdent} %{ApcUser} %{ApcTimestamp} %{ApcRequest} %{ApcStatus} %{ApcRespLen} %{ApcReferer} %{ApcUa}"
    And I click the "EnsureAddParseRule" button
    And I click the "AddRule" button
    And I choose the "时间戳识别" from the "ParseRule" in config
    And I choose the "raw_message" from the "SourceField" in config
    And I set the parameter "TimeFormat" with value "dd/MMM/yyyy:HH:mm:ss Z"
    And I click the "EnsureAddParseRule" button
    And I wait for "ParseButton" will be visible
    Then I wait for "100" millsecond
    And I click the "ParseButton" button
    And I wait for "CheckSuccess2" will be visible
    Then I will see the element value in json "{'Result':'<result>'}"
    And I click the "NextButton" button under some element
    And I click the "SwitchButton" button
    When I set the parameter "Name" with value "<name>"
    And I set the parameter "Logtype" with value "apache"
    And I set the parameter "AppName" with value "<appName>"
    And I set the parameter "Tag" with value "<appName>"
    And I click the "Done" button
    Then I wait for "ConfigDone" will be visible
    When open the "localUpload.ListPage" page for uri "/sources/input/os/"
    And I set the parameter "AppName" with value "<appName>"
    And I set the parameter "Tag" with value "<appName>"
    And I upload a file with name "/src/test/resources/testdata/log/<log>"
    And I click the "UploadButton" button
    And I wait for element "VerifyText" change text to "上传完成"
    Then I wait for "90000" millsecond
    Given open the "configs.ListPage" page for uri "/configs/"
    Then I wait for loading invisible
    When the data name is "{'column':'1','name':'<name>'}" then i click the "详情" button
    And I wait for loading invisible
    Then I will see the config element "<rule1>" value is "<rule1> 1 1 0 0 0"
    Then I will see the config element "<rule2>" value is "<rule2> 1 1 0 0 0"

    Examples:
      | name      | rule1 | rule2 | appName          | log           | lg                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   | result                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            |
      | 时间戳前缀详情验证 | 时间戳识别 | 正则解析  | timestamp_detail | timestamp.log | 192.168.1.139 - - [24/Jan/2015:17:03:49 +0800] "GET /api/v0/search/fields/?field=tag&filters=&order=desc&page=1&query=*&size=50&sourcegroup=all&sourcegroupCn=%E6%89%80%E6%9C%89%E6%97%A5%E5%BF%97&time_range=-2d,now&type=fields HTTP/1.1" 200 363 "http://alltest.rizhiyi.com/search/?query=*&time_range=-2d%2Cnow&order=desc&size=20&page=1&sourcegroup=all&type=timeline&_t=1422088066859&title=%E9%BB%98%E8%AE%A4&index=0" "Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:35.0) Gecko/20100101 Firefox/35.0" | Object\nclientip:"192.168.1.139"\nmethod:"GET"\nreferer:"http://alltest.rizhiyi.com/search/?query=*&time_range=-2d%2Cnow&order=desc&size=20&page=1&sourcegroup=all&type=timeline&_t=1422088066859&title=%E9%BB%98%E8%AE%A4&index=0"\nreferer_domain:"alltest.rizhiyi.com"\nrequest_path:"/api/v0/search/fields/"\nrequest_query:"field=tag&filters=&order=desc&page=1&query=*&size=50&sourcegroup=all&sourcegroupCn=%E6%89%80%E6%9C%89%E6%97%A5%E5%BF%97&time_range=-2d,now&type=fields"\nresp_len:363\nstatus:200\ntimestamp:"2015/01/24 17:03:49.0"\nua:"Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:35.0) Gecko/20100101 Firefox/35.0"\nversion:"1.1"\nraw_message:"192.168.1.139 - - [24/Jan/2015:17:03:49 +0800] "GET /api/v0/search/fields/?field=tag&filters=&order=desc&page=1&query=*&size=50&sourcegroup=all&sourcegroupCn=%E6%89%80%E6%9C%89%E6%97%A5%E5%BF%97&time_range=-2d,now&type=fields HTTP/1.1" 200 363 "http://alltest.rizhiyi.com/search/?query=*&time_range=-2d%2Cnow&order=desc&size=20&page=1&sourcegroup=all&type=timeline&_t=1422088066859&title=%E9%BB%98%E8%AE%A4&index=0" "Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:35.0) Gecko/20100101 Firefox/35.0"" |

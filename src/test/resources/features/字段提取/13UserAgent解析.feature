@configs @configsSmoke @configs13
Feature: 字段提取UserAgent解析


  Scenario Outline: RZY-1540:配置User Agent解析
    Given open the "configs.ListPage" page for uri "/configs/"
    Then I wait for loading invisible
    And I click the "Create" button
    Then I will see the "configs.CreatePage" page
    When I set the parameter "LogSample" with value "<logSample>"
    And I click the "AddRule" button
    And I choose the "正则解析" from the "ParseRule" in config
    And I wait for "1000" millsecond
    And I choose the "raw_message" from the "SourceField" in config
    Then I wait for "1000" millsecond
    And I set the value "<regex>" to the textarea "Regex"
    And I click the "EnsureAddParseRule" button
    And I wait for loading invisible
    And I click the "ParseButton" button
    And I wait for "CheckSuccess" will be visible
    Then I will see the field extraction result "<result>"
    And I click the "Collapse" button
    And I click the "AddRule" button
    And I choose the "<parseRule>" from the "ParseRule" in config
    And I wait for "1000" millsecond
    And I choose the "<sourceField>" from the "SourceField" in config
    And I click the "EnsureAddParseRule" button
    And I wait for loading invisible
    And I click the "ParseButton" button
    And I wait for "CheckSuccess2" will be visible
    Then I will see the field extraction result "<result1>"
    And I click the "Collapse" button
    And I click the "NextButton" button
    When I set the parameter "Name" with value "RZY1540配置UserAgent解析"
    And I set the parameter "Logtype" with value "apache"
    And I set the parameter "AppName" with value "<appName>"
    And I set the parameter "Tag" with value "<appName>"
    And I switch the "SwitchButton" button to "enable"
    And I click the "Done" button
    Then I wait for "ConfigDone" will be visible

    Examples:
      | appName        | logSample                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            | regex                                                                                                                 | parseRule      | sourceField | result                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              | result1                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              |
      | wym_test_agent | 192.168.1.139 - - [24/Jan/2015:17:03:49 +0800] "GET /api/v0/search/fields/?field=tag&filters=&order=desc&page=1&query=*&size=50&sourcegroup=all&sourcegroupCn=%E6%89%80%E6%9C%89%E6%97%A5%E5%BF%97&time_range=-2d,now&type=fields HTTP/1.1" 200 363 "http://alltest.rizhiyi.com/search/?query=*&time_range=-2d%2Cnow&order=desc&size=20&page=1&sourcegroup=all&type=timeline&_t=1422088066859&title=%E9%BB%98%E8%AE%A4&index=0" "Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:35.0) Gecko/20100101 Firefox/35.0" | %{ApcClientIP} %{ApcIdent} %{ApcUser} %{ApcTimestamp} %{ApcRequest} %{ApcStatus} %{ApcRespLen} %{ApcReferer} %{ApcUa} | user agent解析 | ua          | {'clientip':'"192.168.1.139"','method':'"GET"','referer':'"http://alltest.rizhiyi.com/search/?query=*&time_range=-2d%2Cnow&order=desc&size=20&page=1&sourcegroup=all&type=timeline&_t=1422088066859&title=%E9%BB%98%E8%AE%A4&index=0"','referer_domain':'"alltest.rizhiyi.com"','request_path':'"/api/v0/search/fields/"','request_query':'"field=tag&filters=&order=desc&page=1&query=*&size=50&sourcegroup=all&sourcegroupCn=%E6%89%80%E6%9C%89%E6%97%A5%E5%BF%97&time_range=-2d,now&type=fields"','resp_len':'363','status':'200','ua':'"Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:35.0) Gecko/20100101 Firefox/35.0"','version':'"1.1"'} | {'clientip':'"192.168.1.139"','method':'"GET"','referer':'"http://alltest.rizhiyi.com/search/?query=*&time_range=-2d%2Cnow&order=desc&size=20&page=1&sourcegroup=all&type=timeline&_t=1422088066859&title=%E9%BB%98%E8%AE%A4&index=0"','referer_domain':'"alltest.rizhiyi.com"','request_path':'"/api/v0/search/fields/"','request_query':'"field=tag&filters=&order=desc&page=1&query=*&size=50&sourcegroup=all&sourcegroupCn=%E6%89%80%E6%9C%89%E6%97%A5%E5%BF%97&time_range=-2d,now&type=fields"','resp_len':'363','status':'200','browser':'"Firefox"','browser_v':'"Firefox 35.0"','os':'"Mac OS X"','os_v':'"Mac OS X 10.10"','version':'"1.1"'}|


  Scenario Outline: RZY-1540:User Agent解析,上传日志，验证结果
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
      | appName        | log           | searchResult                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      |
      | wym_test_agent | useragent.log | {'apache.clientip':'192.168.1.139','apache.method':'GET','apache.referer':'http://alltest.rizhiyi.com/search/?query=*&time_range=-2d%2Cnow&order=desc&size=20&page=1&sourcegroup=all&type=timeline&_t=1422088066859&title=%E9%BB%98%E8%AE%A4&index=0','apache.referer_domain':'alltest.rizhiyi.com','apache.request_path':'/api/v0/search/fields/','apache.request_query':'field=tag&filters=&order=desc&page=1&query=*&size=50&sourcegroup=all&sourcegroupCn=%E6%89%80%E6%9C%89%E6%97%A5%E5%BF%97&time_range=-2d,now&type=fields','apache.resp_len':'363','apache.status':'200','apache.ua.browser':'Firefox','apache.ua.browser_v':'Firefox 35.0','apache.ua.os':'Mac OS X','apache.ua.os_v':'Mac OS X 10.10','apache.version':'1.1'} |
@configs @configsGeo
Feature: 字段提取GEO解析

  @configsSmoke
  Scenario Outline: GEO解析_ip
    Given open the "configs.ListPage" page for uri "/configs/"
    And I click the "Create" button
    Then I will see the "configs.CreatePage" page
    When I set the parameter "LogSample" with value "221.226.97.92"
    And I click the "AddRule" button
    And I choose the "geo解析" from the "ParseRule"
    And I choose the "raw_message" from the "SourceField"
    And I click the "EnsureAddParseRule" button
    And I wait for loading invisible
    And I click the "ParseButton" button
    And I wait for "CheckSuccess" will be visible
    And I will see the field extraction result "<result>"
    Examples:
      | result |
      | {'geo.city':'南京市','geo.country':'中国','geo.isp':'中国电信','geo.latitude':'32.05324','geo.longitude':'118.76635','geo.province':'江苏','raw_message':'221.226.97.92'}|


  Scenario Outline: RZY-1549:选中解析到顶层字段
    Given open the "configs.ListPage" page for uri "/configs/"
    And I click the "Create" button
    Then I will see the "configs.CreatePage" page
    When I set the parameter "LogSample" with value "192.168.1.139 - - [24/Jan/2015:17:03:49 +0800] "GET /api/v0/search/fields/?field=tag&filters=&order=desc&page=1&query=*&size=50&sourcegroup=all&sourcegroupCn=%E6%89%80%E6%9C%89%E6%97%A5%E5%BF%97&time_range=-2d,now&type=fields HTTP/1.1" 200 363 "http://alltest.rizhiyi.com/search/?query=*&time_range=-2d%2Cnow&order=desc&size=20&page=1&sourcegroup=all&type=timeline&_t=1422088066859&title=%E9%BB%98%E8%AE%A4&index=0" "Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:35.0) Gecko/20100101 Firefox/35.0""
    And I click the "AddRule" button
    And I choose the "正则解析" from the "ParseRule"
    And I choose the "raw_message" from the "SourceField"
    And I set the value "%{ApcClientIP} %{ApcIdent} %{ApcUser} %{ApcTimestamp} %{ApcRequest} %{ApcStatus} %{ApcRespLen} %{ApcReferer} %{ApcUa}" to the textarea "Regex"
    And I click the "EnsureAddParseRule" button
    And I wait for loading invisible
    And I click the "ParseButton" button
    And I wait for "CheckSuccess" will be visible
    And I will see the field extraction result "<result>"
    And I click the "Collapse" button
    And I click the "AddRule" button
    And I choose the "geo解析" from the "ParseRule"
    And I choose the "clientip" from the "SourceField"
    And I "checked" the checkbox which name is "解析到顶层字段"
    And I click the "EnsureAddParseRule" button
    And I wait for loading invisible
    And I click the "ParseButton" button
    And I wait for "CheckSuccess2" will be visible
    And I will see the field extraction result "<result1>"
    And I click the "Collapse" button
    And I click the "NextButton" button
    When I set the parameter "Name" with value "RZY1548添加GEO解析"
    And I set the parameter "Logtype" with value "apache"
    And I set the parameter "AppName" with value "<appName>"
    And I set the parameter "Tag" with value "<appName>"
    And I switch the "SwitchButton" button to "enable"
    And I click the "Done" button
    And I will see the element "ResultMessage" contains "新建成功"

    Examples:
      | appName      | result                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              | result1                                                                                                                                                                            |
      | wym_test_geo |{'clientip':'192.168.1.139','method':'GET','referer':'http://alltest.rizhiyi.com/search/?query=*&time_range=-2d%2Cnow&order=desc&size=20&page=1&sourcegroup=all&type=timeline&_t=1422088066859&title=%E9%BB%98%E8%AE%A4&index=0','referer_domain':'alltest.rizhiyi.com','request_path':'/api/v0/search/fields/','request_query':'field=tag&filters=&order=desc&page=1&query=*&size=50&sourcegroup=all&sourcegroupCn=%E6%89%80%E6%9C%89%E6%97%A5%E5%BF%97&time_range=-2d,now&type=fields','resp_len':'363','status':'200','ua':'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:35.0) Gecko/20100101 Firefox/35.0','version':'1.1'}  |{'geo.city':'private','geo.country':'private','geo.isp':'private','geo.province':'private','method':'GET','referer':'http://alltest.rizhiyi.com/search/?query=*&time_range=-2d%2Cnow&order=desc&size=20&page=1&sourcegroup=all&type=timeline&_t=1422088066859&title=%E9%BB%98%E8%AE%A4&index=0','referer_domain':'alltest.rizhiyi.com','request_path':'/api/v0/search/fields/','request_query':'field=tag&filters=&order=desc&page=1&query=*&size=50&sourcegroup=all&sourcegroupCn=%E6%89%80%E6%9C%89%E6%97%A5%E5%BF%97&time_range=-2d,now&type=fields','resp_len':'363','status':'200','ua':'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:35.0) Gecko/20100101 Firefox/35.0','version':'1.1'} |

  Scenario Outline: GEO解析搜索页验证
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
      | log     | appName       | searchResult                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   |
      | geo.log | wym_test_geo  | {'apache.geo.city':'private','apache.geo.country':'private','apache.clientip':'192.168.1.139','apache.geo.isp':'private','apache.geo.province':'private','apache.method':'GET','apache.referer':'http://alltest.rizhiyi.com/search/?query=*&time_range=-2d%2Cnow&order=desc&size=20&page=1&sourcegroup=all&type=timeline&_t=1422088066859&title=%E9%BB%98%E8%AE%A4&index=0','apache.referer_domain':'alltest.rizhiyi.com','apache.request_path':'/api/v0/search/fields/','apache.request_query':'field=tag&filters=&order=desc&page=1&query=*&size=50&sourcegroup=all&sourcegroupCn=%E6%89%80%E6%9C%89%E6%97%A5%E5%BF%97&time_range=-2d,now&type=fields','apache.resp_len':'363','apache.status':'200','apache.ua':'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:35.0) Gecko/20100101 Firefox/35.0','apache.version':'1.1'} |
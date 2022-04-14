@configs @configs16
Feature: 字段提取手机号码解析


  Scenario Outline: RZY-2802、2803
    Given open the "configs.ListPage" page for uri "/configs/"
    Then I wait for loading invisible
    And I click the "Create" button
    Then I will see the "configs.CreatePage" page
    When I set the parameter "LogSample" with value "18840824121"
    And I click the "AddRule" button
    And I choose the "手机号码解析" from the "ParseRule" in config
    And I wait for "1000" millsecond
    And I choose the "raw_message" from the "SourceField" in config
    Then I wait for "1000" millsecond
    And I click the "<check>" button
    And I click the "EnsureAddParseRule" button
    And I wait for loading invisible
    And I click the "ParseButton" button
    And I wait for "CheckSuccess" will be visible
    And I will see the field extraction result "<result>"
    And I click the "Collapse" button
    And I click the "NextButton" button
    When I set the parameter "Name" with value "<name>"
    And I set the parameter "Logtype" with value "other"
    And I set the parameter "AppName" with value "<appName>"
    And I set the parameter "Tag" with value "<appName>"
    And I switch the "SwitchButton" button to "enable"
    And I click the "Done" button
    Then I wait for "ConfigDone" will be visible

    Examples:
      | name                 | check    | result                                                                                                                                                                            | appName      |
      | RZY2802手机号码解析  |          | {'city':'"大连市"','country':'"中国"','isp':'"中国移动"','latitude':'38.94381','longitude':'121.57652','phone':'"18840824121"','province':'"辽宁"','raw_message':'"18840824121"'} | wym_test_n   |
      | RZY2803解析到顶层字段| Checkbox | {'city':'"大连市"','country':'"中国"','isp':'"中国移动"','latitude':'38.94381','longitude':'121.57652','province':'"辽宁"','raw_message':'"18840824121"'}                         | wym_test_tel |


  Scenario Outline: RZY-2802、2803 上传日志，验证结果
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
    And I wait for "5000" millsecond

    Examples:
      | log     | appName      | searchResult                                                                                                                                                                                                      |
      | tel.log | wym_test_n   | {'other.geo.city':'鞍山市','other.geo.country':'中国','other.geo.isp':'中国移动','other.geo.latitude':'41.115009','other.geo.longitude':'122.976822','other.geo.phone':'15998008888','other.geo.province':'辽宁'} |
      | tel.log | wym_test_tel | {'other.city':'鞍山市','other.country':'中国','other.isp':'中国移动','other.latitude':'41.115009','other.longitude':'122.976822','other.province':'辽宁'}                                                         |
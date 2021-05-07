@configsSmoke @configs16
Feature: 字段提取手机号码解析

  Background:
    Given open the "configs.ListPage" page for uri "/configs/"
    Then I wait for loading invisible

  Scenario Outline: RZY-2802、2803
    And I click the "Create" button
    Then I will see the "configs.CreatePage" page
    When I set the parameter "LogSample" with value "18840824121"
    And I click the "AddRule" button
    And I choose the "手机号码解析" from the "ParseRule" in config
    Given I wait for loading complete
    And I wait for "1000" millsecond
    And I choose the "raw_message" from the "SourceField" in config
    Then I wait for "1000" millsecond
    And I click the "<check>" button
    And I click the "EnsureAddParseRule" button
    And I wait for "ParseButton" will be visible
    Then I wait for "100" millsecond
    And I click the "ParseButton" button
    And I wait for "CheckSuccess" will be visible
    Then I will see the element value in json "{'Result':'<result>'}"
    And I click the "Collapse" button
    And I click the "NextButton" button under some element
    When I set the parameter "Name" with value "<name>"
    And I set the parameter "Logtype" with value "other"
    And I set the parameter "AppName" with value "<appName>"
    And I set the parameter "Tag" with value "<appName>"
    And I switch the "SwitchButton" button to "enable"
    And I click the "Done" button
    Then I wait for "ConfigDone" will be visible
#    When open the "localUpload.ListPage" page for uri "/sources/input/os/"
#    And I set the parameter "AppName" with value "<appName>"
#    And I set the parameter "Tag" with value "<appName>"
#    And I upload a file with name "/src/test/resources/testdata/log/<log>"
#    And I click the "UploadButton" button
#    And I wait for element "VerifyText" change text to "上传完成"
#    Then I wait for "20000" millsecond
#    When open the "splSearch.SearchPage" page for uri "/search/"
#    And I wait for element "SearchStatus" change text to "搜索完成!"
#    And I set the parameter "SearchInput" with value "tag:<appName>"
#    And I click the "DateEditor" button
#    And I click the "Today" button
#    And I click the "SearchButton" button
#    And I wait for element "SearchStatus" change text to "搜索完成!"
#    Then I move the mouse pointer to the "Result"
#    And I click the "RightIcon" button
#    Then I will see the spl search result "<searchResult>"

    Examples:
      | log     | name           | check    | result                                                                                                                                                          | appName      | searchResult                                                                                                                                                                                                                                                                                                                           |
      | tel.log | RZY2802手机号码解析  |          | Object\ngeo:Object\ncity:"大连市"\ncountry:"中国"\nisp:"中国移动"\nlatitude:38.94381\nlongitude:121.57652\nphone:"18840824121"\nprovince:"辽宁"\nraw_message:"18840824121" | wym_test_n   | {'other.geo.city':'other.geo.city: 鞍山市 ','other.geo.country':'other.geo.country: 中国 ','other.geo.isp':'other.geo.isp: 中国移动 ','other.geo.latitude':'other.geo.latitude: 41.115009 ','other.geo.longitude':'other.geo.longitude: 122.976822 ','other.geo.phone':'other.geo.phone: 15998008888 ','other.geo.province':'other.geo.province: 辽宁 '} |
      | tel.log | RZY2803解析到顶层字段 | Checkbox | Object\ncity:"大连市"\ncountry:"中国"\nisp:"中国移动"\nlatitude:38.94381\nlongitude:121.57652\nprovince:"辽宁"\nraw_message:"18840824121"                                  | wym_test_tel | {'other.city':'other.city: 鞍山市 ','other.country':'other.country: 中国 ','other.isp':'other.isp: 中国移动 ','other.latitude':'other.latitude: 41.115009 ','other.longitude':'other.longitude: 122.976822 ','other.province':'other.province: 辽宁 '}                                                                                                  |


  Scenario Outline: 详情验证
    And I click the "Create" button
    Then I will see the "configs.CreatePage" page
    When I set the parameter "LogSample" with value "18840824121"
    And I click the "AddRule" button
    And I choose the "手机号码解析" from the "ParseRule" in config
    Given I wait for loading complete
    And I wait for "1000" millsecond
    And I choose the "raw_message" from the "SourceField" in config
    Then I wait for "1000" millsecond
    And I click the "<check>" button
    And I click the "EnsureAddParseRule" button
    And I wait for "ParseButton" will be visible
    Then I wait for "100" millsecond
    And I click the "ParseButton" button
    And I wait for "CheckSuccess" will be visible
    Then I will see the element value in json "{'Result':'<result>'}"
    And I click the "Collapse" button
    And I click the "NextButton" button under some element
    When I set the parameter "Name" with value "<name>"
    And I set the parameter "Logtype" with value "other"
    And I set the parameter "AppName" with value "<appName>"
    And I set the parameter "Tag" with value "<appName>"
    And I switch the "SwitchButton" button to "enable"
    And I click the "Done" button
    Then I wait for "ConfigDone" will be visible
#    When open the "localUpload.ListPage" page for uri "/sources/input/os/"
#    And I set the parameter "AppName" with value "<appName>"
#    And I set the parameter "Tag" with value "<appName>"
#    And I upload a file with name "/src/test/resources/testdata/log/<log>"
#    And I click the "UploadButton" button
#    And I wait for element "VerifyText" change text to "上传完成"
#    Then I wait for "90000" millsecond
#    Given open the "configs.ListPage" page for uri "/configs/"
#    Then I wait for loading invisible
#    When the data name is "{'column':'1','name':'<name>'}" then i click the "详情" button
#    And I wait for loading invisible
#    Then I will see the config element "<rule1>" value is "<rule1> 1 1 0 0 0"


    Examples:
      | rule1  | log     | name        | check    | result                                                                                                                                                          | appName        |
      | 手机号码解析 | tel.log | 手机号码解析详情验证  |          | Object\ngeo:Object\ncity:"大连市"\ncountry:"中国"\nisp:"中国移动"\nlatitude:38.94381\nlongitude:121.57652\nphone:"18840824121"\nprovince:"辽宁"\nraw_message:"18840824121" | tel_detail     |
      | 手机号码解析 | tel.log | 解析到顶层字段详情验证 | Checkbox | Object\ncity:"大连市"\ncountry:"中国"\nisp:"中国移动"\nlatitude:38.94381\nlongitude:121.57652\nprovince:"辽宁"\nraw_message:"18840824121"                                  | tel_top_detail |

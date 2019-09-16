@configsSmoke
Feature: 字段提取手机号码解析

  Scenario Outline: RZY-2802、2803
    Given open the "configs.ListPage" page for uri "/configs/"
    And I click the "CreateButton" button
    Then I will see the "configs.CreatePage" page
    When I set the parameter "Name" with value "<name>"
    And I set the parameter "Logtype" with value "other"
    When I set the parameter "LogSample" with value "18840824121"
    And I choose the "手机号码解析" from the "ParseRule"
    And I alter the element "ExtractSample" class to "yw-extract-sample yw-extract-sample-container"
    And I choose the "raw_message" from the "SourceField"
    And I "<check>" the checkbox which name is "<label>"
    And I click the "ParseButton" button
    And I wait for "CheckSuccess" will be visible
    Then I will see the element value in json "{'Result':'<result>'}"
    And I click the "NextButton" button under some element
    And I click the "SwitchButton" button
    And I set the parameter "AppName" with value "<appName>"
    And I set the parameter "Tag" with value "<appName>"
    And I click the "NextButton" button
    Then I wait for "ConfigDone" will be visible

    Examples:
      | name           | check   | label   | result                                                                                                                                                          | appName       |
      | RZY2802手机号码解析  |         |         | Object\ngeo:Object\ncity:"大连市"\ncountry:"中国"\nisp:"中国移动"\nlatitude:38.94381\nlongitude:121.57652\nphone:"18840824121"\nprovince:"辽宁"\nraw_message:"18840824121" | auto_test_n   |
      | RZY2803解析到顶层字段 | checked | 解析到顶层字段 | Object\ncity:"大连市"\ncountry:"中国"\nisp:"中国移动"\nlatitude:38.94381\nlongitude:121.57652\nprovince:"辽宁"\nraw_message:"18840824121"                                  | auto_test_tel |

  Scenario Outline: 上传日志
    When open the "localUpload.ListPage" page for uri "/sources/input/os/"
    And I set the parameter "AppName" with value "<appName>"
    And I set the parameter "Tag" with value "<appName>"
    And I upload a file with name "/src/test/resources/testdata/log/<log>"
    And I click the "UploadButton" button
    And I wait for element "VerifyText" change text to "上传完成"

    Examples:
      | appName       | log     |
      | auto_test_n   | tel.log |
      | auto_test_tel | tel.log |

  Scenario Outline: 搜索页验证
    When open the "splSearch.SearchPage" page for uri "/search/"
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I set the parameter "SearchInput" with value "tag:<tag>"
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I click the "RightIcon" button
    Then I will see the spl search result "<result>"

    Examples:
      | tag           | result                                                                                                                                                                                                 |
      | auto_test_n   | {'other.geo.city':'鞍山市','other.geo.country':'中国','other.geo.isp':'中国移动','other.geo.latitude':'41.115009','other.geo.longitude':'122.976822','other.geo.phone':'15998008888','other.geo.province':'辽宁'} |
      | auto_test_tel | {'other.city':'鞍山市','other.country':'中国','other.isp':'中国移动','other.latitude':'41.115009','other.longitude':'122.976822','other.province':'辽宁'}                                                         |
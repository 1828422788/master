@configsSmoke
Feature: 字段提取手机号码解析

  Scenario Outline: RZY-2802、2803
    Given open the "configs.ListPage" page for uri "/configs/"
    And I click the "CreateButton" button
    Then I will see the "configs.CreatePage" page
    When I set the parameter "LogSample" with value "18840824121"
    And I click the "AddRule" button
    And I choose the "手机号码解析" from the "ParseRule"
    And I choose the "raw_message" from the "SourceField"
    And I click the "<check>" button
    And I click the "EnsureAddParseRule" button
    And I wait for "ParseButton" will be visible
    And I click the "ParseButton" button
    And I wait for "CheckSuccess" will be visible
    Then I will see the element value in json "{'Result':'<result>'}"
    And I click the "NextButton" button under some element
    And I click the "SwitchButton" button
    When I set the parameter "Name" with value "<name>"
    And I set the parameter "Logtype" with value "other"
    And I set the parameter "AppName" with value "<appName>"
    And I set the parameter "Tag" with value "<appName>"
    And I click the "NextButton" button
    Then I wait for "ConfigDone" will be visible

    Examples:
      | name           | check    | result                                                                                                                                                          | appName       |
      | RZY2802手机号码解析  |          | Object\ngeo:Object\ncity:"大连市"\ncountry:"中国"\nisp:"中国移动"\nlatitude:38.94381\nlongitude:121.57652\nphone:"18840824121"\nprovince:"辽宁"\nraw_message:"18840824121" | auto_test_n   |
      | RZY2803解析到顶层字段 | Checkbox | Object\ncity:"大连市"\ncountry:"中国"\nisp:"中国移动"\nlatitude:38.91459\nlongitude:121.61862\nprovince:"辽宁"\nraw_message:"18840824121"                                  | auto_test_tel |

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
      | tag           | result                                                                                                                                                                                                                                                                                                                          |
      | auto_test_n   | {'other.geo.city':'other.geo.city：鞍山市','other.geo.country':'other.geo.country：中国','other.geo.isp':'other.geo.isp：中国移动','other.geo.latitude':'other.geo.latitude：41.115009','other.geo.longitude':'other.geo.longitude：122.976822','other.geo.phone':'other.geo.phone：15998008888','other.geo.province':'other.geo.province：辽宁'} |
      | auto_test_tel | {'other.city':'other.city：鞍山市','other.country':'other.country：中国','other.isp':'other.isp：中国移动','other.latitude':'other.latitude：41.110626','other.longitude':'other.longitude：122.995632','other.province':'other.province：辽宁'}                                                                                                 |

  Scenario Outline: 验证详情
    Given open the "configs.ListPage" page for uri "/configs/"
    And I wait for loading complete
    When the data name is "{'column':'1','name':'<name>'}" then i click the "详 情" button
    And I wait for "SmallTr" will be visible
    Then I will see the config element "手机号码解析" value is "手机号码解析 <result>"

    Examples:
      | name           | result    |
      | RZY2802手机号码解析  | 1 1 0 0 0 |
      | RZY2803解析到顶层字段 | 1 1 0 0 0 |
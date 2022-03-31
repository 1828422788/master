@indexSetting
Feature: 路由新建（RZY-1481）

  Background:
    Given open the "index.ListPage" page for uri "/indexmatchrules/"

  Scenario Outline: RZY-1481:新建-路由规则-iisidx索引
    When I click the "AddButton" button
    Then I will see the "index.MatchRuleCreatePage" page
    And I wait for loading invisible
    When I choose the "iisidx" from the "IndexName"
    And I set the parameter "Desc" with value "<desc>"
    And I set the parameter "Rule" with value "<rule>"
    And I set the parameter "Tag" with value "<tag>"
    And I set the parameter "AppName" with value "<appName>"
    And I click the "CreateButton" button
    And I will see the success message "<message>"
    Examples:
      | appName | tag | rule              | message | desc        |
      |         | iis |                   | 保存成功    | AutoTag     |
      |         |     | \d+\s\w+\s\d+.\d+ | 保存成功    | AutoRule    |
      | IIS     |     |                   | 保存成功    | AutoUpCase  |

    @indexSettingSmoke
    Examples:
      | appName | tag | rule              | message | desc        |
      | iis     |     |                   | 保存成功    | AutoAppName |

    Examples:
      | appName | tag | rule | message                      |
      |         |     |      | appname, tag 和 匹配规则 至少需要填写一项 |
      | iis     |     |      | 保存失败 |


  @indexSettingSmoke
  Scenario: RZY-2437:新建路由配置-路由规则_sample_yotta索引
    When I click the "AddButton" button
    Then I will see the "index.MatchRuleCreatePage" page
    And I set the parameter "Desc" with value "AutoCreateForSxcTest"
    And I set the parameter "Tag" with value "sunxctest"
    And I set the parameter "AppName" with value "sunxctest"
    And I click the "CreateButton" button
    And I will see the success message "保存成功"

  @indexSettingSmoke @testupload
  Scenario Outline: 上传日志
    When open the "localUpload.ListPage" page for uri "/sources/input/os/"
    And I set the parameter "AppName" with value "<appname>"
    And I set the parameter "Tag" with value "<tag>"
    And I upload a file with name "/src/test/resources/testdata/log/apache_10.txt"
    And I click the "UploadButton" button
    And I wait for element "VerifyText" change text to "上传完成"

    Examples:
    |  appname       |   tag          |
    |  sunxctest     |   sunxctest    |
    |  iis           |   iis          |

  @indexSettingSmoke
  Scenario Outline: 验证索引数据搜索结果
    Given open the "splSearch.SearchPage" page for uri "/search/"
    And I set the parameter "SearchInput" with value "<spl>"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I wait for element "EventsTitle" change text to "事件列表"
    And I wait for element "EventNumbers" change text to "事件(10)"

    Examples:
      | spl                                              |
      | appname:sunxctest                                |
      | index=iisidx * AND appname:iis                    |



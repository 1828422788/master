@indexSetting @all
Feature: 路由新建（RZY-1481）

  Background:
    Given open the "index.ListPage" page for uri "/indexsettings/indexmatchrule/"

  Scenario Outline:
    When I click the "AddButton" button
    Then I will see the "index.MatchRuleCreatePage" page
    When I choose the "<indexName>" from the "IndexName"
    And I set the parameter "Desc" with value "<desc>"
    And I set the parameter "Rule" with value "<rule>"
    And I set the parameter "Tag" with value "<tag>"
    And I set the parameter "AppName" with value "<appName>"
    And I click the "CreateButton" button
    Then I will see the success message "<message>"

  @smoke @indexSettingSmoke
    Examples:
      | indexName | desc | appName     | tag                | rule          | message |
      | autotest  | test | iisautotest |                    |               | 保存成功    |
      | autotest  | test |             | index_testautotest |               | 保存成功    |
      | autotest  | test |             |                    | iisdxautotest | 保存成功    |

    Examples:
      | indexName | desc | appName   | tag | rule | message                              |
      |           |      |           |     |      | appname, tag 和 匹配规则 至少需要填写一项         |
      |           |      | sunxjTest |     |      | 保存失败: 没有参数, 参数：[index_id]\n错误码: FE_3 |


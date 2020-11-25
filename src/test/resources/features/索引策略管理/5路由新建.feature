@indexSetting
Feature: 路由新建（RZY-1481）

  Background:
    Given open the "index.ListPage" page for uri "/indexmatchrules/"

  @second
  Scenario Outline: RZY-1481:新建-路由规则
    When I click the "AddButton" button
    Then I will see the "index.MatchRuleCreatePage" page
    And I wait for loading invisible
    When I choose the "iisidx" from the "IndexName"
    And I set the parameter "Desc" with value "<desc>"
    And I set the parameter "Rule" with value "<rule>"
    And I set the parameter "Tag" with value "<tag>"
    And I set the parameter "AppName" with value "<appName>"
    And I click the "CreateButton" button
#    And I will see the success message "<message>"

  @indexSettingSmoke
    Examples:
      | appName | tag | rule              | message | desc        |
      | iis     |     |                   | 保存成功    | AutoAppName |
      |         | iis |                   | 保存成功    | AutoTag     |
      |         |     | \d+\s\w+\s\d+.\d+ | 保存成功    | AutoRule    |
      | IIS     |     |                   | 保存成功    | AutoUpCase  |

    Examples:
      | appName | tag | rule | message                      |
      |         |     |      | appname, tag 和 匹配规则 至少需要填写一项 |
      | iis     |     |      | 保存失败 |

  @second @indexSettingSmoke
  Scenario: RZY-2437:新建路由配置-路由规则_sample
    When I click the "AddButton" button
    Then I will see the "index.MatchRuleCreatePage" page
    And I set the parameter "Desc" with value "AutoCreateForSxcTest"
    And I set the parameter "Tag" with value "sunxctest"
    And I set the parameter "AppName" with value "sunxctest"
    And I click the "CreateButton" button
    And I will see the success message "保存成功"

@indexSetting @indexSettingSmoke
Feature: 路由编辑（RZY-1484）

  Background:
    Given open the "index.ListPage" page for uri "/indexsettings/indexmatchrule/"

  Scenario Outline:
    When the data name is "{'column':'4','name':'autotest'}" then i click the "编辑" button
    Then I will see the "index.MatchRuleCreatePage" page
    When I choose the "<indexName>" from the "IndexName"
    And I set the parameter "Desc" with value "<desc>"
    And I set the parameter "AppName" with value "<appName>"
    And I set the parameter "Rule" with value "<rule>"
    And I set the parameter "Tag" with value "<tag>"
    And I click the "SavedButton" button
    Then I will see the success message "<message>"

    Examples:
      | indexName | desc | appName     | tag | rule | message |
      |           | test | iistestauto | *   | *    | 保存成功    |

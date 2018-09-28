@indexSetting @all @smoke
Feature: 路由编辑

  Background:
    Given open the "index.ListPage" page for uri "/indexsettings/indexinfo/"
    And I click the "IndexMatchRule" button

  Scenario Outline:
    When the data name is "autotest" then i click the "编辑" button
    Then I will see the "index.MatchRuleCreatePage" page
    When I choose the "<indexName>" from the "IndexName"
    And I set the parameter "Desc" with value "<desc>"
    And I set the parameter "AppName" with value "<appName>"
    And I set the parameter "Tag" with value "<tag>"
    And I set the parameter "Rule" with value "<rule>"
    And I click the "SavedButton" button
    Then I will see the success message "<message>"

    Examples:
      | indexName | desc | appName | tag | rule | message |
      |           | test | iis     | *   | *    | 保存成功    |

@indexSetting @indexSettingSmoke
Feature: 入库优先级编辑（RZY-1487）

  Background:
    Given open the "ingestPriority.ListPage" page for uri "/ingestpriority/"
    When the data name is "AutoTestWithNothing" then i click the "编辑" button
    Then I will see the "ingestPriority.CreatePage" page

  Scenario Outline:
    When I choose the "<priority>" from the "Priority"
    And I click the "SaveButton" button
    Then I will see the success message "保存成功"

    Examples:
      | priority |
      | 中        |
      | 高        |

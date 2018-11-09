@smoke @all @resourceGroups @resourceGroupsSmoke
Feature: 资源分组清理

  Background:
    Given open the "resourceGroups.ListPage" page for uri "/account/resourcegroups/"

  Scenario Outline:
    When the data name is "<name>" then i click the "删除" button
    And I click the "MessageBoxOKButton" button

    Examples:
      | name                 |
      | AutoTestForTrend     |
      | AutoTestForKnowledge |
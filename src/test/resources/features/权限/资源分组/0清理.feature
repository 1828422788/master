@clean
Feature: 资源分组清理

  Scenario Outline:
    Given open the "resourceGroups.ListPage" page for uri "/account/resourcegroups/"
    And the data name is "<name>" then i click the "删除" button
    And I click the "MessageBoxOKButton" button
    Then I will see the success message "删除成功"

    Examples:
      | name                 |
      | AutoTestNew          |
      | AutoTestForKnowledge |

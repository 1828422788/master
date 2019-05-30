Feature: 资源分组删除（RZY-533）

  Background:
    Given open the "resourceGroups.ListPage" page for uri "/account/resourcegroups/"

  Scenario Outline:
    When the data name is "<name>" then i click the "删除" button
    And I click the "MessageBoxOKButton" button
    Then I will see the success message "删除成功"

  @smoke @all @resourceGroups @resourceGroupsSmoke
    Examples:
      | name                 |
      | sunxjAutoTest        |
      | AutoTestNew          |
      | AutoTestForKnowledge |
      | hunter_roles_m       |

  @clean
    Examples:
      | name     |
      | AutoTest |
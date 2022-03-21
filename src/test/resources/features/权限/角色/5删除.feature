@role
Feature: 角色删除（RZY-524）

  Background:
    Given open the "roles.ListPage" page for uri "/account/roles/"

  Scenario Outline: 删除角色成功
    Given the data name is "<name>" then i click the "删除" button in more menu
    And I wait for "Ensure" will be visible
    And I click the "Ensure" button
    And I wait for "SuccessMessage" will be visible
    Then I will see the success message "删除成功"

    Examples:
      | name         |
      | AutoTestCopy |
      | AutoTestEdit |

  Scenario Outline: 验证删除成功
    And open the "roles.ListPage" page for uri "/account/roles/"
    Then I wait for loading invisible
    Then I will see the search result "{'column':'0','name':'<name>','contains':'no'}"

    Examples:
      | name         |
      | AutoTestCopy |
      | AutoTestEdit |




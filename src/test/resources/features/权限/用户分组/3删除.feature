@smoke @userGroups @all @userGroupsSmoke
Feature: 用户分组删除（RZY-1180）

  Scenario Outline: 删除用户
    Given open the "userGroups.ListPage" page for uri "/account/usergroups/"
    And the data name is "{'column':'1','name':'<name>'}" then i click the "删除" button
    And I click the "MessageBoxOKButton" button
    Then I will see the success message "删除成功"
    And I refresh the website
    Then I will see the search result "{'column':'1','name':'<name>','contains':'no'}"

    Examples:
      | name            |
      | AutoTestForEdit |

  Scenario: 删除角色
    Given open the "roles.ListPage" page for uri "/account/roles/"
    Given the data name is "TempRole" then i click the "删除" button
    And I click the "MessageBoxOKButton" button

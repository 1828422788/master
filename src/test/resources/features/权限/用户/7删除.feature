@all @smoke @users @usersSmoke
Feature: 用户删除

  Scenario Outline: 删除用户成功
    Given open the "users.ListPage" page for uri "/account/users/"
    When the data name is "{'column':'1','name':'<name>'}" then i click the "删除" button
    And I click the "EnsureButton" button
    And I will see the success message "删除成功"
    And I refresh the website
    Then I will see the search result "{'column':'1','name':'<name>','contains':'no'}"

    Examples:
      | name                   |
      | SuccessEditAutoTest    |
#      | AutoTestForSavedSearch |

  Scenario: 删除用户分组
    Given open the "userGroups.ListPage" page for uri "/account/usergroups/"
    And the data name is "{'column':'1','name':'TempGroup'}" then i click the "删除" button
    And I click the "MessageBoxOKButton" button

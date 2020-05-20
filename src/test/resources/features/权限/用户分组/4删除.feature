@smoke @userGroups @all @userGroupsSmoke
Feature: 用户分组删除（RZY-1180）

#  Scenario Outline: 通过管理员删除用户分组
#    Given open the "roles.ListPage" page for uri "/account/roles/"
#    And the data name is "<name>" then i click the "授权" button
#    And I will see the "roles.AuthorizationPage" page
#    Then I click the "{'TabButton':'功能'}" button
#    And I wait for "Loading" will be invisible
#    When I "checked" the checkbox which name is "全选"
#    And I click the "SaveButton" button
#    And I will see the success message "保存成功"
#    Given I will see the "PublicNavBarPage" page
#    And I wait for "Dashboard" will be visible
#    Given I logout current user
#    And I wait for title change text to "登录"
#    And open the "LoginPage" page for uri "/auth/login/"
#    When I set the parameter "Username" with value "测试分组管理员"
#    And I set the parameter "Password" with value "All#123456"
#    And I click the "LoginButton" button
#    And I wait for title change text to "仪表盘|搜索"
#    Given open the "userGroups.ListPage" page for uri "/account/usergroups/"
#    Then the data name is "{'column':'1','name':'AutoTestForEdit'}" then i will see "编辑 删除 申请加入" button
#    When the data name is "{'column':'1','name':'AutoTestForEdit'}" then i click the "删除" button
#    And I click the "MessageBoxOKButton" button
#    Then I will see the success message "删除成功"
#
#    Examples:
#      | name             |
#      | __user_测试分组管理员__ |

  Scenario: 删除用户分组
    Given open the "userGroups.ListPage" page for uri "/account/usergroups/"
    When the data name is "{'column':'1','name':'AutoTestForEdit'}" then i click the "删除" button
    And I wait for "Ensure" will be visible
    And I click the "Ensure" button
    And I wait for "SuccessMessage" will be visible
    Then I will see the success message "删除成功"

  Scenario: 验证用户分组删除成功
    Given open the "userGroups.ListPage" page for uri "/account/usergroups/"
    Then I will see the search result "{'column':'1','name':'AutoTestForEdit','contains':'no'}"

  Scenario Outline: 删除用户成功
    Given open the "users.ListPage" page for uri "/account/users/"
    When the data name is "{'column':'1','name':'<name>'}" then i click the "删除" button
    And I wait for "Ensure" will be visible
    And I click the "Ensure" button
    And I will see the success message "删除成功"

    Examples:
      | name    |
      | 测试分组管理员 |

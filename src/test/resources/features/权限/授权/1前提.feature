Feature: 权限-background

#  @auth
  Scenario: 新建搜索权限
    Given open the "queryScopes.ListPage" page for uri "/queryscopes/"
    And I click the "Create" button
    And I set the parameter "Name" with value "SearchAuth"
    And I set the parameter "Appname" with value "*"
    And I click the "Ensure" button
    Then I will see the success message "操作成功"

#  @auth
  Scenario: 分配搜索权限给AutoTest
    Given open the "queryScopes.ListPage" page for uri "/queryscopes/"
    When the data name is "SearchAuth" then i click the "授权" button
    And I wait for loading invisible
    And I "check" the checkbox which name is "AutoTest" in tiny table
    And I click the "Ensure" button
    Then I will see the message "保存成功"

  @cleanAuth
  Scenario: 删除搜索权限
    Given open the "queryScopes.ListPage" page for uri "/queryscopes/"
    When the data name is "{'column':'1','name':'SearchAuth'}" then i click the "删除" button
    And I click the "Ensure" button
    Then I will see the success message "删除成功"

#  @auth
  Scenario Outline: 所需用户分组
    Given open the "userGroups.ListPage" page for uri "/account/usergroups/"
    And I click the "Create" button
    Then I will see the "userGroups.CreatePage" page
    When I set the parameter "UserGroupName" with value "<groupProperty>"
    When I set the parameter "UserGroupDes" with value "<UserGroupDes>"
    And I click the "CreateButton" button
    Then I wait for "SuccessMessage" will be visible

    Examples:
      | groupProperty | UserGroupDes |
      | 验证授权用户分组      | des1         |

#  @auth
  Scenario: 授权索引配置
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "__user_AutoTest__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    Then I click the "{'TabButton':'索引配置'}" button
    And I wait for "Loading" will be invisible
    And I "checked" the label before "yotta"
    And I click the "SaveButton" button
    And I will see the success message "保存成功"

#  @auth
  Scenario: 添加授权验证用户
    Given open the "users.ListPage" page for uri "/account/users/"
    And I click the "CreateUser" button
    And I will see the "users.CreatePage" page
    When I set the parameter "UserName" with value "验证授权用户"
    And I set the parameter "Email" with value "testAuthGroup@autotest.cn"
    And I set the parameter "Password" with value "All#123456"
    And I choose the "验证授权用户分组" from the "UserGroups"
    And I click the "CreateButton" button
    Then I wait for "SuccessMessage" will be visible

  @cleanAuth
  Scenario Outline: 删除用户
    Given open the "users.ListPage" page for uri "/account/users/"
    When the data name is "{'column':'1','name':'<name>'}" then i click the "删除" button
    And I click the "EnsureButton" button
    And I will see the success message "删除成功"

    Examples:
      | name   |
      | 验证授权用户 |
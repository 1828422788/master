@auth
Feature: 权限-用户

  Scenario: 验证无新建权限
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "__user_AutoTest__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    Then I click the "{'TabButton':'功能'}" button
    And I wait for "Loading" will be invisible
    When I "checked" the checkbox which name is "全选"
    And I click the "CreateUser" button
    And I click the "SaveButton" button
    And I will see the success message "保存成功"
    Given I will see the "PublicNavBarPage" page
    And I wait for "Dashboard" will be visible
    And I logout current user
    And I wait for title change text to "登录"
    And open the "LoginPage" page for uri "/auth/login/"
    When I set the parameter "Username" with value "AutoTest"
    And I set the parameter "Password" with value "all123456"
    And I click the "LoginButton" button
    And I wait for title change text to "仪表盘|搜索"
    Given open the "users.ListPage" page for uri "/account/users/"
    Then I will see the "Create" doesn't exist

  Scenario: 验证新建用户权限
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "__user_AutoTest__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    Then I click the "{'TabButton':'功能'}" button
    And I wait for "Loading" will be invisible
    When I "checked" the checkbox which name is "全选"
    And I click the "SaveButton" button
    And I will see the success message "保存成功"
    Given I will see the "PublicNavBarPage" page
    And I wait for "Dashboard" will be visible
    And I logout current user
    And I wait for title change text to "登录"
    And open the "LoginPage" page for uri "/auth/login/"
    When I set the parameter "Username" with value "AutoTest"
    And I set the parameter "Password" with value "all123456"
    And I click the "LoginButton" button
    And I wait for title change text to "仪表盘|搜索"
    Given open the "users.ListPage" page for uri "/account/users/"
    And I click the "Create" button
    And I will see the "users.CreatePage" page
    When I set the parameter "UserName" with value "AutoTestAuth"
    And I set the parameter "Email" with value "AutoTestAuth@152.cn"
    And I set the parameter "Password" with value "all123456"
    And I click the "CreateButton" button
    Then I will see the success message "创建成功"

  Scenario: 有效期限
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "__user_AutoTest__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    Then I click the "{'TabButton':'功能'}" button
    And I wait for "Loading" will be invisible
    When I "checked" the checkbox which name is "全选"
    When I "unchecked" the checkbox which name is "可修改自己账户信息"
    And I click the "SaveButton" button
    And I will see the success message "保存成功"
    Then I click the "{'TabButton':'用户'}" button
    And I wait for loading invisible
    And I "checked" the label before "AutoTestAuth"
    When the data name is "AutoTestAuth" then I click the "无期限" button without total page
    And I click the "Customize" button
    And I click the "DateEditor" button
    And I set the time input "TimeInput" to "1" minutes later
    And I click the "EnsureTime" button
    And I click the "SaveButton" button

  Scenario: 验证无可修改自己账户信息权限
    Given I will see the "PublicNavBarPage" page
    And I wait for "Dashboard" will be visible
    And I wait for loading invisible
    And I logout current user
    And I wait for title change text to "登录"
    And open the "LoginPage" page for uri "/auth/login/"
    When I set the parameter "Username" with value "AutoTest"
    And I set the parameter "Password" with value "all123456"
    And I click the "LoginButton" button
    And I wait for title change text to "仪表盘|搜索"
    Given open the "users.ListPage" page for uri "/account/users/"
    And I click the detail which name is "{'column':'1','name':'AutoTest'}"
    Then I will see the "users.EditPage" page
    Then I will see the "EditInfoButton" doesn't exist

  Scenario: 验证有效期限生效
    Given I will see the "PublicNavBarPage" page
    And I wait for "Dashboard" will be visible
    And I wait for loading invisible
    And I logout current user
    And I wait for title change text to "登录"
    And open the "LoginPage" page for uri "/auth/login/"
    When I set the parameter "Username" with value "AutoTest"
    And I set the parameter "Password" with value "all123456"
    And I click the "LoginButton" button
    And I wait for title change text to "仪表盘|搜索"
    Given open the "users.ListPage" page for uri "/account/users/"
    Then I will see the search result "{'column':'1','name':'AutoTestAuth','contains':'no'}"

  Scenario: 验证可修改自己账户信息
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "__user_AutoTest__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    And I wait for "Loading" will be invisible
    Then I click the "{'TabButton':'功能'}" button
    And I wait for "Loading" will be invisible
    When I "checked" the checkbox which name is "全选"
    And I click the "SaveButton" button
    And I will see the success message "保存成功"
    Given I will see the "PublicNavBarPage" page
    And I wait for "Dashboard" will be visible
    And I logout current user
    And I wait for title change text to "登录"
    And open the "LoginPage" page for uri "/auth/login/"
    When I set the parameter "Username" with value "AutoTest"
    And I set the parameter "Password" with value "all123456"
    And I click the "LoginButton" button
    And I wait for title change text to "仪表盘|搜索"
    Given open the "users.ListPage" page for uri "/account/users/"
    And I click the detail which name is "{'column':'1','name':'AutoTest'}"
    Then I will see the "users.EditPage" page
    And I click the "EditInfoButton" button
    And I set the parameter "FullName" with value "test"
    And I click the "SaveButton" button
    Then I will see the success message "更新成功"

  Scenario: 验证无读取权限
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "__user_AutoTest__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    And I wait for "Loading" will be invisible
    Then I click the "{'TabButton':'用户'}" button
    And I wait for "Loading" will be invisible
    And I "checked" the label before "AutoTestAuth"
    And I "unchecked" the label before "AutoTestAuth"
    And I click the "SaveButton" button
    And I will see the success message "保存成功"
    Then I click the "{'TabButton':'功能'}" button
    And I wait for "Loading" will be invisible
    When I "checked" the checkbox which name is "全选"
    And I click the "SaveButton" button
    Given I will see the "PublicNavBarPage" page
    And I wait for "Dashboard" will be visible
    And I logout current user
    And I wait for title change text to "登录"
    And open the "LoginPage" page for uri "/auth/login/"
    When I set the parameter "Username" with value "AutoTest"
    And I set the parameter "Password" with value "all123456"
    And I click the "LoginButton" button
    And I wait for title change text to "仪表盘|搜索"
    Given open the "users.ListPage" page for uri "/account/users/"
    And I wait for loading invisible
    And I click the detail which name is "{'column':'1','name':'AutoTestAuth'}"
    And I wait for loading invisible
    Then I will see the "Role" doesn't exist

  Scenario Outline: 验证有读取权限
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "__user_AutoTest__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    And I wait for "Loading" will be invisible
    Then I click the "{'TabButton':'用户'}" button
    And I wait for "Loading" will be invisible
    And I "checked" the label before "<name>"
    And I "unchecked" the label before "<name>"
    When I "checked" function "读取" from the auth table which name is "<name>"
    And I click the "SaveButton" button
    And I will see the success message "保存成功"
    Then I click the "{'TabButton':'功能'}" button
    And I wait for "Loading" will be invisible
    When I "checked" the checkbox which name is "全选"
    And I click the "SaveButton" button
    Given I will see the "PublicNavBarPage" page
    And I wait for "Dashboard" will be visible
    And I logout current user
    And I wait for title change text to "登录"
    And open the "LoginPage" page for uri "/auth/login/"
    When I set the parameter "Username" with value "AutoTest"
    And I set the parameter "Password" with value "all123456"
    And I click the "LoginButton" button
    And I wait for title change text to "仪表盘|搜索"
    Given open the "users.ListPage" page for uri "/account/users/"
    And I wait for loading invisible
    Then the data name is "{'column':'1','name':'<name>'}" then i will see "查看" button
    And I click the detail which name is "{'column':'1','name':'<name>'}"
    And I wait for "RoleAuth" will be visible
    Then I will see the "users.EditPage" page
    Then I will see the "EditInfoButton" doesn't exist

    Examples:
      | name         |
      | AutoTestAuth |

  Scenario Outline: 读取+编辑
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "__user_AutoTest__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    And I wait for "Loading" will be invisible
    Then I click the "{'TabButton':'用户'}" button
    And I wait for "Loading" will be invisible
    And I "checked" the label before "<name>"
    When I "unchecked" function "转授" from the auth table which name is "<name>"
    And I click the "SaveButton" button
    And I will see the success message "保存成功"
    Then I click the "{'TabButton':'功能'}" button
    And I wait for "Loading" will be invisible
    When I "checked" the checkbox which name is "全选"
    And I click the "SaveButton" button
    Given I will see the "PublicNavBarPage" page
    And I wait for "Dashboard" will be visible
    And I logout current user
    And I wait for title change text to "登录"
    And open the "LoginPage" page for uri "/auth/login/"
    When I set the parameter "Username" with value "AutoTest"
    And I set the parameter "Password" with value "all123456"
    And I click the "LoginButton" button
    And I wait for title change text to "仪表盘|搜索"
    Given open the "users.ListPage" page for uri "/account/users/"
    And I wait for loading invisible
    Then the data name is "{'column':'1','name':'<name>'}" then i will see "查看分组" button
    And I click the detail which name is "{'column':'1','name':'<name>'}"
    And I wait for "RoleAuth" will be visible
    Then I will see the "users.EditPage" page
    Then I will see the "EditInfoButton" doesn't exist

    Examples:
      | name         |
      | AutoTestAuth |



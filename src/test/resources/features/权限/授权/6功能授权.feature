@authorization @all @smoke @roleSmoke
Feature: 角色授权功能

  Background:
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "AutoTestRole" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    Then I click the "{'TabButton':'功能'}" button

  Scenario: 授予可解锁用户权限（RZY-765）
    When I "checked" the checkbox which name is "可解锁用户"
    And I click the "SaveButton" button
    Given open the "users.ListPage" page for uri "/account/users/"
    And I click the "CreateUser" button
    And I will see the "users.CreatePage" page
    When I set the parameter "UserName" with value "TempUser"
    And I set the parameter "Email" with value "142745@qq.com"
    And I set the parameter "Password" with value "all123456"
    And I choose the "AutoTestForUser" from the "UserGroups"
    And I click the "CreateButton" button
    Then I wait for "SuccessMessage" will be visible
    And I logout current user
    And open the "LoginPage" page for uri "/auth/login/"
    And I run a method "Login" for "10" times with parameters "{'name':'TempUser','password':'123'}"
    When I set the parameter "Username" with value "AutoTest"
    And I set the parameter "Password" with value "qqqqq11111"
    And I click the "LoginButton" button
    And I wait for "2000" millsecond
    Given open the "users.ListPage" page for uri "/account/users/"
    When the data name is "{'column':'1','name':'TempUser'}" then i click the "解锁" button
    And I logout current user
    And open the "LoginPage" page for uri "/auth/login/"
    When I set the parameter "Username" with value "TempUser"
    And I set the parameter "Password" with value "all123456"
    And I click the "LoginButton" button
    And I will see the "PublicNavBarPage" page
    And I click the "Setting" button

  Scenario: 授予可使用结算管理权限（RZY-769）
    When I "checked" the checkbox which name is "可使用结算管理"
    And I click the "SaveButton" button
    Given open the "users.ListPage" page for uri "/account/users/"
    When the data name is "{'column':'1','name':'TempUser'}" then i click the "删除" button
    And I click the "EnsureButton" button
    And I will see the success message "删除成功"
    And I logout current user
    And open the "LoginPage" page for uri "/auth/login/"
    When I set the parameter "Username" with value "AutoTest"
    And I set the parameter "Password" with value "qqqqq11111"
    And I click the "LoginButton" button
    And I wait for "2000" millsecond
    And I will see the "PublicNavBarPage" page
    And I click the "Status" button
    Then I will see the element "Running" name is "使用限额 域标识 结算管理 搜索用量"
    And open the "PublicNavBarPage" page for uri "/payments/"
    Then the page's title will be "结算管理"

  Scenario: 授予编辑所有角色权限（RZY-1214）
    When I "checked" the checkbox which name is "编辑所有角色权限"
    And I click the "SaveButton" button
    And I logout current user
    And open the "LoginPage" page for uri "/auth/login/"
    When I set the parameter "Username" with value "AutoTest"
    And I set the parameter "Password" with value "qqqqq11111"
    And I click the "LoginButton" button
    And I wait for "2000" millsecond
    Given open the "roles.ListPage" page for uri "/account/roles/"
    Then I will see the search result contains "{'column':'0','name':'admin'}"

  Scenario: 授予新建角色（RZY-1210）
    When I "checked" the checkbox which name is "可新建角色"
    And I click the "SaveButton" button
    And I logout current user
    And open the "LoginPage" page for uri "/auth/login/"
    When I set the parameter "Username" with value "AutoTest"
    And I set the parameter "Password" with value "qqqqq11111"
    And I click the "LoginButton" button
    And I wait for "2000" millsecond
    Given open the "roles.ListPage" page for uri "/account/roles/"
    Then the data name is "AutoTestRoleWithAllResource" then i will see "{'column':'3','name':'编辑 授权 复制 删除'}" button
    Given I click the "CreateRoleButton" button
    And I will see the "roles.CreatePage" page
    And I set the parameter "RoleName" with value "TempRole"
    And I click the "CreateButton" button
    Then I wait for "SuccessMessage" will be visible

  Scenario: 授予可更新最大搜索时长（RZY-1208）
    When I "checked" the checkbox which name is "可更新最大搜索时长"
    And I click the "SaveButton" button
    And I logout current user
    And open the "LoginPage" page for uri "/auth/login/"
    When I set the parameter "Username" with value "AutoTest"
    And I set the parameter "Password" with value "qqqqq11111"
    And I click the "LoginButton" button
    And I wait for "2000" millsecond
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "AutoTestRole" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    Then I click the "{'TabButton':'配置'}" button
    And I set the parameter "MaxTime" with value "1d"
    And I click the "SaveButton" button
    Then I will see the success message "保存成功"
    And I set the parameter "MaxTime" with value "1d"
    And I click the "SaveButton" button
    Then I will see the success message "保存成功"

  Scenario: 授予可转授功能权限（RZY-1211）
    When I "checked" the checkbox which name is "可转授功能权限"
    And I click the "SaveButton" button
    And I logout current user
    And open the "LoginPage" page for uri "/auth/login/"
    When I set the parameter "Username" with value "AutoTest"
    And I set the parameter "Password" with value "qqqqq11111"
    And I click the "LoginButton" button
    And I wait for "2000" millsecond
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "AutoTestRole" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    And I click the "{'TabButton':'功能'}" button
    And I will see the element "CheckboxGroup" name is "可使用结算管理\n可新建角色\n可解锁用户\n可更新最大搜索时长\n可转授功能权限"

#  Scenario: 授权查看未分配资源
#    When I "checked" the checkbox which name is "可查看未分配资源"
#    And I click the "SaveButton" button
#    Then I will see the success message "保存成功"
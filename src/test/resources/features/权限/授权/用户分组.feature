@auth
Feature: 权限-用户分组

  Scenario: 验证无新建用户分组的权限
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "__user_AutoTest__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    Then I click the "{'TabButton':'功能'}" button
    And I wait for "Loading" will be invisible
    When I "checked" the checkbox which name is "全选"
    And I "unchecked" the checkbox which name is "新建用户分组"
    And I click the "SaveButton" button
    Then I will see the success message "保存成功"
    Given I will see the "PublicNavBarPage" page
    And I wait for "Dashboard" will be visible
    Given I logout current user
    And I wait for title change text to "登录"
    And open the "LoginPage" page for uri "/auth/login/"
    When I set the parameter "Username" with value "AutoTest"
    And I set the parameter "Password" with value "all123456"
    And I click the "LoginButton" button
    And I wait for "2000" millsecond
    Given open the "userGroups.ListPage" page for uri "/account/usergroups/"
    Then I will see the "Create" doesn't exist

  Scenario: 验证新建用户分组
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "__user_AutoTest__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    Then I click the "{'TabButton':'功能'}" button
    And I wait for "Loading" will be invisible
    When I "checked" the checkbox which name is "全选"
    And I click the "SaveButton" button
    Then I will see the success message "保存成功"
    Given I will see the "PublicNavBarPage" page
    And I wait for "Dashboard" will be visible
    Given I logout current user
    And I wait for title change text to "登录"
    And open the "LoginPage" page for uri "/auth/login/"
    When I set the parameter "Username" with value "AutoTest"
    And I set the parameter "Password" with value "all123456"
    And I click the "LoginButton" button
    And I wait for "2000" millsecond
    Given open the "userGroups.ListPage" page for uri "/account/usergroups/"
    And I click the "Create" button
    Then I will see the "userGroups.CreatePage" page
    When I set the parameter "UserGroupName" with value "用户分组权限验证"
    And I click the "CreateButton" button
    Then I will see the success message "创建成功"

  Scenario Outline: 授权读取
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "__user_AutoTest__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    When I check "读取" from the "{'GroupManagement':['<name>']}"
    And I click the "SaveButton" button
    Then I will see the success message "保存成功"
    Then I click the "{'TabButton':'功能'}" button
    And I wait for "Loading" will be invisible
    When I "checked" the checkbox which name is "全选"
    And I click the "SaveButton" button
    Given I will see the "PublicNavBarPage" page
    And I wait for "Dashboard" will be visible
    Given I logout current user
    And I wait for title change text to "登录"
    And open the "LoginPage" page for uri "/auth/login/"
    When I set the parameter "Username" with value "AutoTest"
    And I set the parameter "Password" with value "all123456"
    And I click the "LoginButton" button
    And I wait for "2000" millsecond
    Given open the "userGroups.ListPage" page for uri "/account/usergroups/"
    And I wait for "Loading" will be invisible
    Then the data name is "{'column':'1','name':'<name>'}" then i will see "申请加入" button
    When I click the detail which name is "{'column':'1','name':'<name>'}"
    Then I will see the "userGroups.CreatePage" page
    Then I will see the element "UserGroupName" attribute is "disabled"

    Examples:
      | name     |
      | 用户分组权限验证 |

  Scenario Outline: 授权读取+编辑
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "__user_AutoTest__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    When I check "读取,编辑" from the "{'GroupManagement':['<name>']}"
    And I click the "SaveButton" button
    Then I will see the success message "保存成功"
    Then I click the "{'TabButton':'功能'}" button
    And I wait for "Loading" will be invisible
    When I "checked" the checkbox which name is "全选"
    And I click the "SaveButton" button
    Then I will see the success message "保存成功"
    Given I will see the "PublicNavBarPage" page
    And I wait for "Dashboard" will be visible
    Given I logout current user
    And I wait for title change text to "登录"
    And open the "LoginPage" page for uri "/auth/login/"
    When I set the parameter "Username" with value "AutoTest"
    And I set the parameter "Password" with value "all123456"
    And I click the "LoginButton" button
    And I wait for "2000" millsecond
    Given open the "userGroups.ListPage" page for uri "/account/usergroups/"
    And I wait for "Loading" will be invisible
    Then the data name is "{'column':'1','name':'<name>'}" then i will see "编辑 申请加入" button
    When the data name is "{'column':'1','name':'<name>'}" then i click the "编辑" button
    And I will see the "userGroups.EditPage" page
    And I set the parameter "UserGroupName" with value "AutoTest用户修改"
    And I click the "BasicSaveButton" button
    Then I will see the success message "更新成功"

    Examples:
      | name     |
      | 用户分组权限验证 |

  Scenario Outline: 授权读取+编辑+删除
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "__user_AutoTest__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    When I check "读取,编辑,删除" from the "{'GroupManagement':['<name>']}"
    And I click the "SaveButton" button
    Then I will see the success message "保存成功"
    Then I click the "{'TabButton':'功能'}" button
    And I wait for "Loading" will be invisible
    When I "checked" the checkbox which name is "全选"
    And I click the "SaveButton" button
    Given I will see the "PublicNavBarPage" page
    And I wait for "Dashboard" will be visible
    Given I logout current user
    And I wait for title change text to "登录"
    And open the "LoginPage" page for uri "/auth/login/"
    When I set the parameter "Username" with value "AutoTest"
    And I set the parameter "Password" with value "all123456"
    And I click the "LoginButton" button
    And I wait for "2000" millsecond
    Given open the "userGroups.ListPage" page for uri "/account/usergroups/"
    And I wait for "Loading" will be invisible
    Then the data name is "{'column':'1','name':'<name>'}" then i will see "编辑 删除 申请加入" button
    When the data name is "{'column':'1','name':'<name>'}" then i click the "编辑" button
    And I will see the "userGroups.EditPage" page
    And I set the parameter "UserGroupName" with value "AutoTest测试"
    And I click the "BasicSaveButton" button
    Then I will see the success message "更新成功"
    Given open the "userGroups.ListPage" page for uri "/account/usergroups/"
    And I wait for "Loading" will be invisible
    When the data name is "{'column':'1','name':'AutoTest测试'}" then i click the "删除" button
    And I click the "MessageBoxOKButton" button
    Then I will see the success message "删除成功"

    Examples:
      | name         |
      | AutoTest用户修改 |

  Scenario Outline: 读取+删除
    Given open the "userGroups.ListPage" page for uri "/account/usergroups/"
    And I click the "Create" button
    Then I will see the "userGroups.CreatePage" page
    When I set the parameter "UserGroupName" with value "<name>"
    And I click the "CreateButton" button
    Then I will see the success message "创建成功"
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "__user_AutoTest__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    When I check "读取,删除" from the "{'GroupManagement':['<name>']}"
    And I click the "SaveButton" button
    Then I will see the success message "保存成功"
    Then I click the "{'TabButton':'功能'}" button
    And I wait for "Loading" will be invisible
    When I "checked" the checkbox which name is "全选"
    And I click the "SaveButton" button
    Given I will see the "PublicNavBarPage" page
    And I wait for "Dashboard" will be visible
    Given I logout current user
    And I wait for title change text to "登录"
    And open the "LoginPage" page for uri "/auth/login/"
    When I set the parameter "Username" with value "AutoTest"
    And I set the parameter "Password" with value "all123456"
    And I click the "LoginButton" button
    And I wait for "2000" millsecond
    Given open the "userGroups.ListPage" page for uri "/account/usergroups/"
    And I wait for "Loading" will be invisible
    Then the data name is "{'column':'1','name':'<name>'}" then i will see "删除 申请加入" button
    When I click the detail which name is "{'column':'1','name':'<name>'}"
    Then I will see the "userGroups.CreatePage" page
    Then I will see the element "UserGroupName" attribute is "disabled"
    Given open the "userGroups.ListPage" page for uri "/account/usergroups/"
    And I wait for "Loading" will be invisible
    When the data name is "{'column':'1','name':'<name>'}" then i click the "删除" button
    And I click the "MessageBoxOKButton" button
    Then I will see the success message "删除成功"

    Examples:
      | name         |
      | AutoTest用户测试 |

  Scenario Outline: 验证无组内管理权限
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "__user_AutoTest__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    And I "checked" the label before "<name>"
    And I "unchecked" the label before "<name>"
    When I check "读取,编辑,删除" from the "{'GroupManagement':['<name>']}"
    And I click the "SaveButton" button
    Then I will see the success message "保存成功"
    Then I click the "{'TabButton':'功能'}" button
    And I wait for "Loading" will be invisible
    When I "checked" the checkbox which name is "全选"
    And I click the "SaveButton" button
    Given I will see the "PublicNavBarPage" page
    And I wait for "Dashboard" will be visible
    Given I logout current user
    And I wait for title change text to "登录"
    And open the "LoginPage" page for uri "/auth/login/"
    When I set the parameter "Username" with value "AutoTest"
    And I set the parameter "Password" with value "all123456"
    And I click the "LoginButton" button
    And I wait for "2000" millsecond
    Given open the "userGroups.ListPage" page for uri "/account/usergroups/"
    And I wait for "Loading" will be invisible
    When the data name is "{'column':'1','name':'<name>'}" then i click the "编辑" button
    And I will see the "userGroups.EditPage" page
    Then I will see the "AddMember" doesn't exist

    Examples:
      | name          |
      | AutoTestGroup |

  Scenario: 授权组内读取权限
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "__user_AutoTest__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    When I check "读取,编辑" from the "{'GroupManagement':['AutoTestGroup']}"
    When I check "读取" from the "{'IntraGroupManagement':['AutoTestGroup']}"
    And I click the "SaveButton" button
    Then I will see the success message "保存成功"
    Then I click the "{'TabButton':'功能'}" button
    And I wait for "Loading" will be invisible
    When I "checked" the checkbox which name is "全选"
    And I click the "SaveButton" button
    Given I will see the "PublicNavBarPage" page
    And I wait for "Dashboard" will be visible
    Given I logout current user
    And I wait for title change text to "登录"
    And open the "LoginPage" page for uri "/auth/login/"
    When I set the parameter "Username" with value "AutoTest"
    And I set the parameter "Password" with value "all123456"
    And I click the "LoginButton" button
    And I wait for "2000" millsecond
    Given open the "userGroups.ListPage" page for uri "/account/usergroups/"
    And I wait for "Loading" will be invisible
    When the data name is "{'column':'1','name':'AutoTestGroup'}" then i click the "编辑" button
    Then I will see the "userGroups.EditPage" page
    And I wait for "MemberItem" will be visible
    And I click the "AddMember" button
    And I wait for "CheckboxInner" will be visible
    Then I will see the "CheckboxInner" is "disabled"

  Scenario: 授权组内读取+编辑权限
    Given open the "users.ListPage" page for uri "/account/users/"
    And I click the "CreateUser" button
    And I will see the "users.CreatePage" page
    When I set the parameter "UserName" with value "测试同组用户"
    And I set the parameter "Email" with value "testGroup@yottabyte.cn"
    And I set the parameter "Password" with value "all123456"
    And I choose the "AutoTestGroup" from the "UserGroups"
    And I click the "CreateButton" button
    Then I wait for "SuccessMessage" will be visible
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "__user_AutoTest__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    When I check "读取,编辑" from the "{'GroupManagement':['AutoTestGroup']}"
    When I check "读取,编辑" from the "{'IntraGroupManagement':['AutoTestGroup']}"
    And I click the "SaveButton" button
    Then I will see the success message "保存成功"
    Then I click the "{'TabButton':'功能'}" button
    And I wait for "Loading" will be invisible
    When I "checked" the checkbox which name is "全选"
    And I click the "SaveButton" button
    Given I will see the "PublicNavBarPage" page
    And I wait for "Dashboard" will be visible
    Given I logout current user
    And I wait for title change text to "登录"
    And open the "LoginPage" page for uri "/auth/login/"
    When I set the parameter "Username" with value "AutoTest"
    And I set the parameter "Password" with value "all123456"
    And I click the "LoginButton" button
    And I wait for "2000" millsecond
    Given open the "userGroups.ListPage" page for uri "/account/usergroups/"
    And I wait for "Loading" will be invisible
    When the data name is "{'column':'1','name':'AutoTestGroup'}" then i click the "编辑" button
    Then I will see the "userGroups.EditPage" page
    And I wait for "MemberItem" will be visible
    And I click the "AddMember" button
    And I "unchecked" the label before "测试同组用户"
    And I click the "EnsureButton" button
    And I click the "SaveButton" button
    Then I will see the success message "更新成功"

#  Scenario: 授权组内读取+编辑+转授
#    Given open the "roles.ListPage" page for uri "/account/roles/"
#    And the data name is "__user_AutoTest__" then i click the "授权" button
#    And I will see the "roles.AuthorizationPage" page
#    When I check "读取,编辑" from the "{'GroupManagement':['AutoTestGroup']}"
#    When I check "读取,编辑,转授" from the "{'IntraGroupManagement':['AutoTestGroup']}"
#    And I click the "SaveButton" button
#    Then I click the "{'TabButton':'功能'}" button
#    And I wait for "Loading" will be invisible
#    When I "checked" the checkbox which name is "全选"
#    When I "unchecked" the checkbox which name is "全选"
#    And I "checked" the checkbox which name is "可查看用户分组,新建用户分组,可查看用户页"
#    And I click the "SaveButton" button
#    Then I will see the success message "保存成功"
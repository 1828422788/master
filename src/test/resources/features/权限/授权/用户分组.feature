Feature: 权限-用户分组

  Scenario: 验证无新建用户分组的权限
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "AutoTestRole" then i click the "授权" button
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
    And the data name is "AutoTestRole" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    Then I click the "{'TabButton':'功能'}" button
    And I wait for "Loading" will be invisible
    When I "checked" the checkbox which name is "全选"
    When I "unchecked" the checkbox which name is "全选"
    And I "checked" the checkbox which name is "可查看用户分组,新建用户分组"
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

  Scenario: 验证列表数据
    Given I logout current user
    And I wait for title change text to "登录"
    And open the "LoginPage" page for uri "/auth/login/"
    When I set the parameter "Username" with value "AutoTest"
    And I set the parameter "Password" with value "all123456"
    And I click the "LoginButton" button
    And I wait for "2000" millsecond
    Given open the "userGroups.ListPage" page for uri "/account/usergroups/"
    Then I will see the search result contains "{'column':'1','name':'用户分组权限验证'}"

  Scenario: 授权读取+编辑AutoTestGroup
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "AutoTestRole" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    When I check "读取,编辑" from the "{'GroupManagement':['AutoTestGroup']}"
    And I click the "SaveButton" button
    Then I click the "{'TabButton':'功能'}" button
    And I wait for "Loading" will be invisible
    When I "checked" the checkbox which name is "全选"
    When I "unchecked" the checkbox which name is "全选"
    And I "checked" the checkbox which name is "可查看用户分组,新建用户分组"
    And I click the "SaveButton" button
    Then I will see the success message "保存成功"

  Scenario: 验证授权读取+编辑AutoTestGroup
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
    Then the data name is "{'column':'1','name':'AutoTestGroup'}" then i will see "{'column':'5','name':'编辑'}" button
    When the data name is "{'column':'1','name':'AutoTestGroup'}" then i click the "编辑" button
    And I will see the "userGroups.EditPage" page
    And I set the parameter "UserGroupDes" with value "AutoTest用户修改"
    And I click the "BasicSaveButton" button
    Then I will see the success message "更新成功"

  Scenario: 授权读取+编辑+删除AutoTestGroup
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "AutoTestRole" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    When I check "读取,编辑,删除" from the "{'GroupManagement':['AutoTestGroup']}"
    And I click the "SaveButton" button
    Then I click the "{'TabButton':'功能'}" button
    And I wait for "Loading" will be invisible
    When I "checked" the checkbox which name is "全选"
    When I "unchecked" the checkbox which name is "全选"
    And I "checked" the checkbox which name is "可查看用户分组,新建用户分组"
    And I click the "SaveButton" button
    Then I will see the success message "保存成功"

  Scenario: 验证授权读取+编辑+删除AutoTestGroup
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
    Then the data name is "{'column':'1','name':'AutoTestGroup'}" then i will see "编辑 删除" button

  Scenario: 取消AutoTest同组用户授权
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "AutoTestRole" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    And I "checked" the label before "用户分组权限验证"
    And I "unchecked" the label before "用户分组权限验证"
    And I click the "SaveButton" button
    Then I click the "{'TabButton':'功能'}" button
    And I wait for "Loading" will be invisible
    When I "checked" the checkbox which name is "全选"
    When I "unchecked" the checkbox which name is "全选"
    And I "checked" the checkbox which name is "可查看用户分组,新建用户分组"
    And I click the "SaveButton" button

  Scenario: 验证无用户分组权限验证的组内管理权限
    Given I will see the "PublicNavBarPage" page
    And I wait for "Dashboard" will be visible
    Given I logout current user
    And I wait for title change text to "登录"
    And open the "LoginPage" page for uri "/auth/login/"
    When I set the parameter "Username" with value "AutoTest同组用户"
    And I set the parameter "Password" with value "all123456"
    And I click the "LoginButton" button
    And I wait for "2000" millsecond
    Given open the "userGroups.ListPage" page for uri "/account/usergroups/"
    And I wait for "Loading" will be invisible
    Then I will see the search result "{'column':'1','name':'用户分组权限验证','contains':'no'}"

  Scenario: 授权组内读取权限
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "AutoTestRole" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    When I check "读取,编辑" from the "{'GroupManagement':['AutoTestGroup']}"
    When I check "读取" from the "{'IntraGroupManagement':['AutoTestGroup']}"
    And I click the "SaveButton" button
    Then I click the "{'TabButton':'功能'}" button
    And I wait for "Loading" will be invisible
    When I "checked" the checkbox which name is "全选"
    When I "unchecked" the checkbox which name is "全选"
    And I "checked" the checkbox which name is "可查看用户分组,新建用户分组,可查看用户页"
    And I click the "SaveButton" button
    Then I will see the success message "保存成功"

  Scenario: 验证组内读取权限
    Given I will see the "PublicNavBarPage" page
    And I wait for "Dashboard" will be visible
    Given I logout current user
    And I wait for title change text to "登录"
    And open the "LoginPage" page for uri "/auth/login/"
    When I set the parameter "Username" with value "AutoTest同组用户"
    And I set the parameter "Password" with value "all123456"
    And I click the "LoginButton" button
    And I wait for "2000" millsecond
    Given open the "userGroups.ListPage" page for uri "/account/usergroups/"
    And I wait for "Loading" will be invisible
    When the data name is "{'column':'1','name':'AutoTestGroup'}" then i click the "编辑" button
    Then I will see the "userGroups.EditPage" page
    And I wait for "MemberItem" will be visible
    And I click the "AddMember" button
    Then I will see the "AutoTestGroupCheckbox" is "disabled"
    Then I will see the "AutoTestCheckbox" is "disabled"

  Scenario: 授权组内读取+编辑权限
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "AutoTestRole" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    When I check "读取,编辑" from the "{'GroupManagement':['AutoTestGroup']}"
    When I check "读取,编辑" from the "{'IntraGroupManagement':['AutoTestGroup']}"
    And I click the "SaveButton" button
    Then I click the "{'TabButton':'功能'}" button
    And I wait for "Loading" will be invisible
    When I "checked" the checkbox which name is "全选"
    When I "unchecked" the checkbox which name is "全选"
    And I "checked" the checkbox which name is "可查看用户分组,新建用户分组,可查看用户页"
    And I click the "SaveButton" button
    Then I will see the success message "保存成功"

  Scenario: 验证组内读取+编辑权限
    Given I will see the "PublicNavBarPage" page
    And I wait for "Dashboard" will be visible
    Given I logout current user
    And I wait for title change text to "登录"
    And open the "LoginPage" page for uri "/auth/login/"
    When I set the parameter "Username" with value "AutoTest同组用户"
    And I set the parameter "Password" with value "all123456"
    And I click the "LoginButton" button
    And I wait for "2000" millsecond
    Given open the "userGroups.ListPage" page for uri "/account/usergroups/"
    And I wait for "Loading" will be invisible
    When the data name is "{'column':'1','name':'AutoTestGroup'}" then i click the "编辑" button
    Then I will see the "userGroups.EditPage" page
    And I wait for "MemberItem" will be visible
    And I click the "AddMember" button
    And I click the "AutoTestCheckbox" button
    And I click the "EnsureButton" button
    And I click the "SaveButton" button
    Then I will see the success message "更新成功"

#  Scenario: 授权组内读取+编辑+转授
#    Given open the "roles.ListPage" page for uri "/account/roles/"
#    And the data name is "AutoTestRole" then i click the "授权" button
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
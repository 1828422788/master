@userGroups @all
Feature: 用户分组修改（RZY-1179）

  Scenario Outline: 编辑常规
    Given open the "userGroups.ListPage" page for uri "/account/usergroups/"
    When the data name is "{'column':'1','name':'<UserGroupName>'}" then i click the "编辑" button
    And I will see the "userGroups.EditPage" page
    And I wait for element "UserGroupName" value change text to "<UserGroupName>"
    When I set the parameter "UserGroupName" with value "<NewUserGroupName>"
    And I set the parameter "UserGroupDes" with value "<NewUserGroupDes>"
    And I click the "BasicSaveButton" button
    Then I will see the <Result>

  @smoke @userGroupsSmoke
    Examples:
      | UserGroupName     | NewUserGroupName | NewUserGroupDes | Result                 |
      | AutoTestForDelete | AutoTestForEdit  | 测试修改            | success message "更新成功" |

    Examples:
      | UserGroupName   | NewUserGroupName | NewUserGroupDes | Result                                                             |
      | AutoTestForEdit | AutoTestGroup    | NewDes          | error message "account_group_name: AutoTestGroup 已存在\n错误码: AUTH_7" |

  Scenario: 取消admin角色（验证仅有默认角色时能否保存成功）
    Given open the "userGroups.ListPage" page for uri "/account/usergroups/"
    When the data name is "{'column':'1','name':'AutoTestForEdit'}" then i click the "编辑" button
    And I will see the "userGroups.EditPage" page
    And I wait for element "UserGroupName" value change text to "AutoTestForEdit"
    And I cancel selection "__admin__" from the "UserGroupRole"
    And I click the "SaveMember" button
    Then I will see the success message "更新成功"

  Scenario: 添加用户
    Given open the "users.ListPage" page for uri "/account/users/"
    And I click the "CreateUser" button
    And I will see the "users.CreatePage" page
    When I set the parameter "UserName" with value "测试分组管理员"
    And I set the parameter "Email" with value "AutoTestAdmin@yottabyte.cn"
    And I set the parameter "Password" with value "All#123456"
    And I click the "CreateButton" button
    Then I wait for "SuccessMessage" will be visible

  Scenario: 修改用户分组的管理员
    Given open the "userGroups.ListPage" page for uri "/account/usergroups/"
    When the data name is "{'column':'1','name':'AutoTestForEdit'}" then i click the "编辑" button
    And I will see the "userGroups.EditPage" page
    And I wait for element "UserGroupName" value change text to "AutoTestForEdit"
    And I click the "AddAdmin" button
    And I wait for "NoData" will be invisible
    And I "check" the checkbox which name is "测试分组管理员" in user group
    And I click the "EnsureButton" button
    And I click the "SaveMember" button
    Then I will see the success message "更新成功"

  Scenario: 验证管理员生效
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "__user_测试分组管理员__" then i click the "授权" button
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
    When I set the parameter "Username" with value "测试分组管理员"
    And I set the parameter "Password" with value "All#123456"
    And I click the "LoginButton" button
    And I wait for title change text to "仪表盘|搜索"
    Given open the "roles.ListPage" page for uri "/account/roles/"
    When the data name is "__group_default_AutoTestForEdit__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    Then I click the "{'TabButton':'功能'}" button
    And I wait for "Loading" will be invisible
    When I "checked" the checkbox which name is "全选"
    And I click the "SaveButton" button

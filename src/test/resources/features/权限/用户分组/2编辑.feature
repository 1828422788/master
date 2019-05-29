Feature: 用户分组修改（RZY-1179）

  Background:

  @userGroups @all
  Scenario Outline: 编辑常规
    Given open the "userGroups.ListPage" page for uri "/account/usergroups/"
    And the data name is "{'column':'1','name':'<UserGroupName>'}" then i click the "编辑" button
    And I will see the "userGroups.EditPage" page
    When I set the parameter "UserGroupName" with value "<NewUserGroupName>"
    And I set the parameter "UserGroupDes" with value "<NewUserGroupDes>"
    And I click the "BasicSaveButton" button
    Then I will see the <Result>

  @smoke @userGroupsSmoke
    Examples:
      | UserGroupName     | NewUserGroupName | NewUserGroupDes | Result                 |
      | AutoTestForDelete | AutoTestForEdit  | 测试修改            | success message "更新成功" |

    Examples:
      | UserGroupName   | NewUserGroupName | NewUserGroupDes | Result                              |
      | AutoTestForEdit |                  | NewDes          | error message "分组名 不能为空"            |
      | AutoTestForEdit | AutoTestGroup    | NewDes          | error message "用户组已存在\n错误码: FE_536" |

  @all
  Scenario Outline: 编辑更多失败
    Given open the "userGroups.ListPage" page for uri "/account/usergroups/"
    And the data name is "{'column':'1','name':'<name>'}" then i click the "编辑" button
    And I will see the "userGroups.EditPage" page
    When I cancel selection "<RoleName>" from the "UserGroupRole"
    And I choose the "<NewRoleName>" from the "UserGroupRole"
    And I click the "SaveButton" button
    Then I will see the <Result>

    Examples:
      | name            | RoleName | NewRoleName | Result                  |
      | AutoTestForEdit | admin    |             | error message "角色 不能为空" |

  @userGroupsSmoke
  Scenario: 创建一个新角色
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And I click the "CreateRoleButton" button
    And I will see the "roles.CreatePage" page
    And I set the parameter "RoleName" with properties "TempRole"
    And I set the parameter "RoleDes" with value "<RoleDes>"
    And I click the "CreateButton" button
    Then I wait for "SuccessMessage" will be visible

  @all @smoke @userGroupsSmoke
  Scenario Outline: 编辑更多成功
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And I click the "CreateRoleButton" button
    And I will see the "roles.CreatePage" page
    And I set the parameter "RoleName" with value "<NewRoleName>"
    And I set the parameter "RoleDes" with value "test"
    And I click the "CreateButton" button
    Given open the "userGroups.ListPage" page for uri "/account/usergroups/"
    And the data name is "{'column':'1','name':'<name>'}" then i click the "编辑" button
    And I will see the "userGroups.EditPage" page
    And I choose the "<NewRoleName>" from the "UserGroupRole"
    And I click the "SaveButton" button
    Then I will see the <Result>
    And I click the "ReturnList" button
    Then I will see the data "{'column':'1','name':'<name>'}" values "{'column':'4','name':'<finalGroups>'}"

    Examples:
      | name            | NewRoleName | Result                 | finalGroups     |
      | AutoTestForEdit | TempRole    | success message "更新成功" | admin, TempRole |
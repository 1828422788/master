Feature: 用户分组修改（RZY-1179）

  Background:
    Given open the "userGroups.ListPage" page for uri "/account/usergroups/"

  @userGroups @all
  Scenario Outline: 编辑常规
    When the data name is "{'column':'1','name':'<UserGroupName>'}" then i click the "编辑" button
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

  Scenario: 取消admin角色（验证仅有默认角色时能否保存成功）
    When the data name is "{'column':'1','name':'AutoTestForEdit'}" then i click the "编辑" button
    And I will see the "userGroups.EditPage" page
    And I wait for loading complete
    And I cancel selection "admin" from the "UserGroupRole"
    And I click the "SaveMember" button
    Then I will see the success message "更新成功"

#  Scenario: 添加成员
#    When the data name is "{'column':'1','name':'AutoTestForEdit'}" then i click the "编辑" button
#    And I will see the "userGroups.EditPage" page
#    And I click the "AddMember" button
#    And I "check" the checkbox which name is "owner" in tiny table
#    And I click the "EnsureButton" button

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
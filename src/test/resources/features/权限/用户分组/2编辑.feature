Feature: 用户分组修改

  Background:
    Given open the "userGroups.ListPage" page for uri "/account/usergroups/"

  @userGroups @all
  Scenario Outline: 编辑常规
    Given I set the parameter "SearchInput" with value "<UserGroupName>"
    And I wait table element "SearchResultTable-1.2" change text to "<UserGroupName>"
    And I click the table "TableEditButton-1" button
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
      | AutoTest        |                  | NewDes          | error message "分组名 不能为空"            |
      | AutoTestForEdit | AutoTestForUser  | NewDes          | error message "用户组已存在\n错误码: FE_536" |

  @all
  Scenario Outline: 编辑更多失败
    Given the data name is "{'column':'1','name':'<name>'}" then i click the "编辑" button
    And I will see the "userGroups.EditPage" page
    When I cancel selection "<RoleName>" from the "UserGroupRole"
    And I choose the "<NewRoleName>" from the "UserGroupRole"
    And I click the "SaveButton" button
    Then I will see the <Result>

    Examples:
      | name            | RoleName | NewRoleName | Result                  |
      | AutoTestForEdit | admin    |             | error message "角色 不能为空" |

  @all @smoke @userGroupsSmoke
  Scenario Outline: 编辑更多成功
    Given the data name is "{'column':'1','name':'<name>'}" then i click the "编辑" button
    And I will see the "userGroups.EditPage" page
    And I choose the "<NewRoleName>" from the "UserGroupRole"
    And I click the "SaveButton" button
    Then I will see the <Result>
    And I click the "ReturnList" button
    Then I will see the data "{'column':'1','name':'<name>'}" values "{'column':'4','name':'<finalGroups>'}"

    Examples:
      | name            | NewRoleName                  | Result                 | finalGroups     |
      | AutoTestForEdit | AutoTestWithAuth&SourceGroup | success message "更新成功" | admin, AutoTest |
@userGroups @all
Feature: 用户分组修改（RZY-1179）

  Scenario Outline: 编辑常规
    Given open the "userGroups.ListPage" page for uri "/account/usergroups/"
    And I wait for loading invisible
    When the data name is "{'column':'1','name':'<UserGroupName>'}" then i click the "编辑" button
    And I will see the "userGroups.CreatePage" page
    And I wait for element "UserGroupName" value change text to "<UserGroupName>"
    When I set the parameter "UserGroupName" with value "<NewUserGroupName>"
    And I set the parameter "UserGroupDes" with value "<NewUserGroupDes>"
    And I click the "Save" button

  @smoke @userGroupsSmoke
    Examples:
      | UserGroupName     | NewUserGroupName | NewUserGroupDes |
      | AutoTestForDelete | AutoTestForEdit  | 测试修改            |

  Scenario Outline: 验证编辑是否校验重名
    Given open the "userGroups.ListPage" page for uri "/account/usergroups/"
    When the data name is "{'column':'1','name':'<UserGroupName>'}" then i click the "编辑" button
    And I will see the "userGroups.CreatePage" page
    And I wait for element "UserGroupName" value change text to "<UserGroupName>"
    When I set the parameter "UserGroupName" with value "<NewUserGroupName>"
    And I set the parameter "UserGroupDes" with value "<NewUserGroupDes>"
    And I click the "Save" button
    And I wait for "ErrorExplainMessage" will be visible
    Then I will see the element "<ErrorExplainMessage>" value contains "AUTH: 更新失败, account_group_name: AutoTestForEdit  已存在"


    Examples:
      | UserGroupName   | NewUserGroupName | NewUserGroupDes |
      | AutoTestForEdit | AutoTestGroup    | NewDes          |

@userGroups @all
Feature: 用户分组创建（RZY-545）

  Background:
    Given open the "userGroups.ListPage" page for uri "/account/usergroups/"

  Scenario Outline: 用户分组创建成功
    And I click the "Create" button
    Then I will see the "userGroups.CreatePage" page
    When I set the parameter "UserGroupName" with value "<UserGroupName>"
    When I set the parameter "UserGroupDes" with value "<UserGroupDes>"
    And I choose the "<Role>" from the "UserGroupRole"
    And I click the "CreateButton" button
    Then I will see the <Result>

  @smoke @userGroupsSmoke
    Examples:
      | UserGroupName     | UserGroupDes | Role  | Result                 |
      | AutoTestForDelete | des1         | admin | success message "创建成功" |

    Examples: 创建失败及为空校验
      | UserGroupName     | UserGroupDes | Role         | Result                              |
      |                   | des          | AutoTestRole | error message "分组名 不能为空"            |
      | AutoTestForDelete | des          | admin        | error message "用户组已存在\n错误码: FE_536" |


  Scenario Outline: 重名用户分组校验
    And I click the "CreateUserGroup" button
    Then I will see the "userGroups.CreatePage" page
    When I set the parameter "UserGroupName" with properties "group"
    And I choose the "role" from the "UserGroupOwner" with property
    And I choose the "role" from the "UserGroupRole" with property
    And I click the "CreateButton" button
    Then I will see the error message "<message>"

    Examples:
      | message             |
      | 用户组已存在\n错误码: FE_536 |
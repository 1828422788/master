@userGroups @all
Feature: 用户分组创建（RZY-545）

  Background:
    Given open the "userGroups.ListPage" page for uri "/account/usergroups/"

  @createUserGroups
  Scenario Outline: 所需用户分组
    And I click the "CreateUserGroup" button
    Then I will see the "userGroups.CreatePage" page
    When I set the parameter "UserGroupName" with value "<UserGroupName>"
    When I set the parameter "UserGroupDes" with value "<UserGroupDes>"
    And I choose the "<Owner>" from the "UserGroupOwner"
    And I choose the "<Role>" from the "UserGroupRole"
    And I click the "CreateButton" button
    Then I wait for "SuccessMessage" will be visible

    Examples:
      | UserGroupName | UserGroupDes | Owner                       | Role                        |
      | AutoTestGroup | des1         | AutoTestRole                | AutoTestRole                |
      | AutoTest      |              | AutoTestRoleWithAllResource | AutoTestRoleWithAllResource |

  Scenario Outline: 用户分组创建成功
    And I click the "CreateUserGroup" button
    Then I will see the "userGroups.CreatePage" page
    When I set the parameter "UserGroupName" with value "<UserGroupName>"
    When I set the parameter "UserGroupDes" with value "<UserGroupDes>"
    And I choose the "<Owner>" from the "UserGroupOwner"
    And I choose the "<Role>" from the "UserGroupRole"
    And I click the "CreateButton" button
    Then I will see the <Result>

  @smoke @userGroupsSmoke
    Examples:
      | UserGroupName     | UserGroupDes | Owner | Role  | Result                 |
      | AutoTestForDelete | des1         | admin | admin | success message "创建成功" |

    Examples: 创建失败及为空校验
      | UserGroupName | UserGroupDes | Owner | Role         | Result                              |
      |               | des          | admin | AutoTestRole | error message "分组名 不能为空"            |
      | AutoTest      | des          |       | AutoTestRole | error message "拥有者 不能为空"            |
      | AutoTest      |              | admin |              | error message "角色 不能为空"             |
      | AutoTest      | des          | admin | admin        | error message "用户组已存在\n错误码: FE_536" |
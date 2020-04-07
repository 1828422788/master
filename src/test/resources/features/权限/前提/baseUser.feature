@baseUser
Feature: 基础用户创建

#  Scenario Outline: 创建基本角色
#    Given open the "roles.ListPage" page for uri "/account/roles/"
#    Given I click the "CreateRoleButton" button
#    And I will see the "roles.CreatePage" page
#    And I set the parameter "RoleName" with value "<RoleName>"
#    And I set the parameter "RoleDes" with value "<RoleDes>"
#    And I click the "CreateButton" button
#    Then I wait for "SuccessMessage" will be visible
#
#    Examples:
#      | RoleName     | RoleDes |
#      | AutoTestRole | 无资源分组   |

  Scenario Outline: 所需用户分组
    Given open the "userGroups.ListPage" page for uri "/account/usergroups/"
    And I click the "Create" button
    Then I will see the "userGroups.CreatePage" page
    When I set the parameter "UserGroupName" with value "<groupProperty>"
    When I set the parameter "UserGroupDes" with value "<UserGroupDes>"
    And I click the "CreateButton" button
    Then I wait for "SuccessMessage" will be visible

    Examples:
      | groupProperty | UserGroupDes |
      | AutoTestGroup | des1         |

  Scenario: 添加基本用户
    Given open the "users.ListPage" page for uri "/account/users/"
    And I click the "CreateUser" button
    And I will see the "users.CreatePage" page
    When I set the parameter "UserName" with value "AutoTest"
    And I set the parameter "FullName" with value "AutoTestFullName"
    And I set the parameter "Email" with value "autoFullName@yottabyte.cn"
    And I set the parameter "Password" with value "All#123456"
    And I choose the "AutoTestGroup" from the "UserGroups"
    And I click the "CreateButton" button
    Then I wait for "SuccessMessage" will be visible
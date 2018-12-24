@all @role
Feature: 角色新建（RZY-517至521）

  Background:
    Given open the "roles.ListPage" page for uri "/account/roles/"

  Scenario Outline: 创建角色同时不创建资源分组
    Given I click the "CreateRoleButton" button
    And I will see the "roles.CreatePage" page
    And I set the parameter "RoleName" with value "<RoleName>"
    And I set the parameter "RoleDes" with value "<RoleDes>"
    And I click the "CreateButton" button
    Then I wait for "SuccessMessage" will be visible

  @createRole
    Examples:
      | RoleName     | RoleDes |
      | AutoTestRole | 无资源分组   |

  Scenario Outline: 创建角色同时不创建资源分组
    Given I click the "CreateRoleButton" button
    And I will see the "roles.CreatePage" page
    And I set the parameter "RoleName" with value "<RoleName>"
    And I set the parameter "RoleDes" with value "<RoleDes>"
    When I click the "CreateButton" button
    Then I will see the error message "<Result>"

    Examples:
      | RoleName     | RoleDes | Result                     |
      | AutoTestRole |         | 保存失败: 角色名称已经在\n错误码: FE_590 |
      |              | RoleDes | 填写角色名称                     |

  Scenario Outline: 创建角色同时创建资源分组（RZY-513）
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And I click the "CreateRoleButton" button
    And I will see the "roles.CreatePage" page
    And I set the parameter "RoleName" with value "<RoleName>"
    And I set the parameter "RoleDes" with value "<RoleDes>"
    And I check "<ResourceGroups>" from the "ResourceGroupCheckbox"
    When I click the "CreateButton" button
    Then I wait for "SuccessMessage" will be visible

  @createRole
    Examples:
      | RoleName                         | RoleDes       | ResourceGroups |
      | AutoTestRoleWithAllResource      | 创建所有资源分组      | all            |
      | AutoTestRoleWithAuth&SourceGroup | 资源分组：仪表盘,日志来源 | 仪表盘,日志来源       |
      | AutoTestRoleWithMacro            | 资源分组：搜索宏      | 搜索宏            |
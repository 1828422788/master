Feature: 角色新建

  Background:
    Given open the "roles.ListPage" page for uri "/account/roles/"

  @role
  Scenario Outline: 创建角色同时不创建资源分组
    Given I click the "CreateRoleButton" button
    And I will see the "roles.CreatePage" page
    And I set the parameter "RoleName" with value "<RoleName>"
    And I set the parameter "RoleDes" with value "<RoleDes>"
    When I click the "CreateButton" button
    Then I will see the <Result>

  @all @smoke @roleSmoke
    Examples:
      | RoleName | RoleDes | Result                 |
      | AutoTest | 无资源分组   | success message "创建成功" |

  @all
    Examples:
      | RoleName | RoleDes | Result                                     |
      | AutoTest |         | error message "保存失败: 角色名称已经在\n错误码: FE_590" |
      |          | RoleDes | error message "填写角色名称"                     |

  @role
  Scenario Outline: 创建角色同时创建资源分组
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And I click the "CreateRoleButton" button
    And I will see the "roles.CreatePage" page
    And I set the parameter "RoleName" with value "<RoleName>"
    And I set the parameter "RoleDes" with value "<RoleDes>"
    And I check "<ResourceGroups>" from the "ResourceGroupCheckbox"
    When I click the "CreateButton" button
    Then I will see the success message contains "创建成功"

  @all @roleSmoke @smoke
    Examples:
      | RoleName                     | RoleDes       | ResourceGroups |
      | AutoTestWithAllResource      | 创建所有资源分组      | all            |
      | AutoTestWithAuth&SourceGroup | 资源分组：仪表盘,日志来源 | 仪表盘,日志来源       |
      | AutoTestWithMacro            | 资源分组：搜索宏      | 搜索宏            |
@all @role
Feature: 角色新建（RZY-517至521）

  Background:
    Given open the "roles.ListPage" page for uri "/account/roles/"

  Scenario Outline: 创建角色同时不创建资源分组
    Given I click the "CreateRoleButton" button
    And I will see the "roles.CreatePage" page
    And I set the parameter "RoleName" with properties "<RoleName>"
    And I set the parameter "RoleDes" with value "<RoleDes>"
    And I click the "CreateButton" button
    Then I wait for "SuccessMessage" will be visible

  @createRole
    Examples:
      | RoleName | RoleDes |
      | role     | 无资源分组   |

  Scenario Outline: 创建角色同时创建资源分组（RZY-513）
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And I click the "CreateRoleButton" button
    And I will see the "roles.CreatePage" page
    And I set the parameter "RoleName" with properties "<RoleName>"
    And I set the parameter "RoleDes" with value "<RoleDes>"
    And I "checked" the checkbox which name is "同时创建对应的专属资源组"
    When I click the "CreateButton" button
    Then I wait for "SuccessMessage" will be visible

  @createRole
    Examples:
      | RoleName          | RoleDes  |
      | roleWithResources | 创建所有资源分组 |

  Scenario Outline: 角色同名校验
    Given I click the "CreateRoleButton" button
    And I will see the "roles.CreatePage" page
    And I set the parameter "RoleName" with properties "<RoleName>"
    And I set the parameter "RoleDes" with value "<RoleDes>"
    When I click the "CreateButton" button
    Then I will see the error message "<Result>"

    Examples:
      | RoleName | RoleDes | Result                     |
      | role     |         | 保存失败: 角色名称已经在\n错误码: FE_590 |

  Scenario Outline: 角色名称非空校验
    Given I click the "CreateRoleButton" button
    And I will see the "roles.CreatePage" page
    When I click the "CreateButton" button
    Then I will see the error message "<Result>"

    Examples:
      | Result |
      | 填写角色名称 |

  @roleSmoke
  Scenario Outline: 创建角色同时不创建资源分组
    Given I click the "CreateRoleButton" button
    And I will see the "roles.CreatePage" page
    And I set the parameter "RoleName" with value "<RoleName>"
    And I set the parameter "RoleDes" with value "<RoleDes>"
    And I click the "CreateButton" button
    Then I wait for "SuccessMessage" will be visible

    Examples:
      | RoleName | RoleDes |
      | RoleTest | 无资源分组   |
@all @role
Feature: 角色新建（RZY-517至521）

  Background:
    Given open the "roles.ListPage" page for uri "/account/roles/"

  Scenario Outline: 创建角色测试角色编辑
    Given I click the "Create" button
    And I will see the "roles.CreatePage" page
    And I set the parameter "RoleName" with value "<RoleName>"
    And I set the parameter "RoleDes" with value "<RoleDes>"
    And I click the "CreateButton" button
    Then I wait for "SuccessMessage" will be visible

    Examples:
      | RoleName     | RoleDes |
      | AutoTestEdit | 测试编辑功能  |

  Scenario Outline: 角色同名校验
    Given I click the "Create" button
    And I will see the "roles.CreatePage" page
    And I set the parameter "RoleName" with value "<RoleName>"
    When I click the "CreateButton" button
    Then I will see the element "ExplainErrorMessage" value contains "<Result>"

    Examples:
      | RoleName     | Result                     |
      | AutoTestEdit | AUTH: 创建失败, role_name: AutoTestEdit 已存在 |

  Scenario Outline: 角色名称非空校验
    Given I click the "Create" button
    And I will see the "roles.CreatePage" page
    When I click the "CreateButton" button
    Then I will see the element "ExplainMessage" value is "<message>"

    Examples:
      | message |
      | 请输入名称   |

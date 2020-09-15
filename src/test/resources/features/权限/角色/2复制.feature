@role @roleSmoke
Feature: 角色复制

  Background:
    Given open the "roles.ListPage" page for uri "/account/roles/"

  Scenario: 授权角色所有功能权限
    When the data name is "AutoTestEdit" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    When I "unchecked" the checkbox which name is "全选"
    When I "checked" the checkbox which name is "全选"
    And I click the "SaveButton" button
    Then I will see the success message "更新成功"

  Scenario Outline: 复制角色成功
    Given the data name is "<property>" then i click the "复制" button
    And I will see the "roles.CreatePage" page
    And I set the parameter "RoleName" with value "<newName>"
    When I click the "Copy" button
    And I wait for "SuccessMessage" will be visible
    Then I will see the success message "复制成功"

    Examples:
      | property     | newName      |
      | AutoTestEdit | AutoTestCopy |

  Scenario: 验证权限一起被复制
    When the data name is "AutoTestCopy" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    And I wait for "Loading" will be invisible
    Then I click the "{'TabButton':'功能'}" button
    And I wait for "Loading" will be invisible
    Then I will see the checkbox in auth which name is "全选" and status is "checked"

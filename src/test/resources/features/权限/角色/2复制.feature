@role @roleSmoke
Feature: 角色复制

  Background:
    Given open the "roles.ListPage" page for uri "/account/roles/"

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
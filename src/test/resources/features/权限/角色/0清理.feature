@clean
Feature: 角色清理

  Background:
    Given open the "roles.ListPage" page for uri "/account/roles/"

  Scenario Outline:
    When the data name is "<name>" then i click the "删除" button
    And I click the "MessageBoxOKButton" button

    Examples:
      | name                             |
      | AutoTestRole                     |
      | AutoTestRoleWithAllResource      |
      | AutoTestRoleWithAuth&SourceGroup |
      | AutoTestRoleWithMacro            |
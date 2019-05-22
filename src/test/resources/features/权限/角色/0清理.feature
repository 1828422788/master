@clean @role @cleanRole
Feature: 角色清理

  Background:
    Given open the "roles.ListPage" page for uri "/account/roles/"

  Scenario Outline:
    When the data properties is "<property>" then i click the "删除" button
    And I click the "MessageBoxOKButton" button

    Examples:
      | property          |
      | roleWithResources |
      | role              |
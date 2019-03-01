@all @smoke @role @roleSmoke
Feature: 角色删除（RZY-524）

  Background:
    Given open the "roles.ListPage" page for uri "/account/roles/"

  Scenario Outline: 删除角色成功
    Given the data name is "<name>" then i click the "删除" button
    And I click the "MessageBoxOKButton" button
    Then I will see the success message "删除成功"
    And open the "roles.ListPage" page for uri "/account/roles/"
    Then I will see the search result "{'column':'0','name':'<name>','contains':'no'}"

    Examples:
      | name         |
      | AutoTestCopy |

@all @smoke @role @roleSmoke
Feature: 角色查询（RZY-523）

  Background:
    Given open the "roles.ListPage" page for uri "/account/roles/"

  Scenario Outline:
    When I set the search input with "<name>"
    Then I will see the search result "{'column':'0','name':'<name>'}"

    Examples:
      | name     |
      | AutoTest |
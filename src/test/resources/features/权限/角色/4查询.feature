@role
Feature: 角色查询（RZY-523）

  Background:
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And I wait for loading invisible

  Scenario Outline:
    When I set the parameter "TextFilter" with value "<name>"
    And I wait for loading invisible
    Then I will see the search result "{'column':'0','name':'<name>'}"

    Examples:
      | name         |
      | AutoTestEdit |
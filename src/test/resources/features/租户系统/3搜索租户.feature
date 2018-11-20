Feature: 租户搜索

  Background:
    Given open the "tenant.ListPage" page for uri "/domain/tenant/"

  Scenario Outline:
    When I set the parameter "SearchInput" with value "<name>"
    Then I will see the search result "{'column':'1','name':'<name>'}"

    Examples:
      | name |
      | auto |
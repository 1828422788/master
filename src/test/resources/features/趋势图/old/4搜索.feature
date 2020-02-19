@all @smoke @trend @trendSmoke
Feature: 趋势图搜索

  Background:
    Given open the "trend.ListPage" page for uri "/trend/"

  Scenario Outline:
    When I set the parameter "SearchInput" with value "<name>"
    And I click the "Search" button
    And I wait for loading invisible
    Then I will see the search result "{'column':'0','name':'<name>'}"

    Examples:
      | name      |
      | 单值sample1 |
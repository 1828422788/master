@smoke @spl @all @splSmoke
Feature: 已存搜索查询（RZY-157）

  Scenario Outline:
    Given open the "splSearch.SearchPage" page for uri "/search/"
    When I click the "OpenSavedSearchButton" button
    And I wait for loading invisible
    And I set the parameter "SearchSavedList" with value "<name>"
    Then I will see the search result contains "{'column':'1','name':'<name>'}"
    Then I will see the search result contains "{'column':'3','name':'索引模式'}"

    Examples:
      | name     |
      | AutoTest |

  Scenario: 按照分组搜索
    Given open the "splSearch.SavedSearchPage" page for uri "/savedsearches/"
    And I choose the "default_SavedSearch" from the "GroupList"
    And I wait for loading invisible
    Then I will see the search result contains "{'column':'1','name':'AutoTest'}"
@offline @offlineTaskSmoke
Feature: 下载列表搜索（RZY-178）

  Background:
    Given open the "splSearch.OfflineTaskPage" page for uri "/download/"

  Scenario Outline:
    Given I set the search input with "<name>"
    And I click the "Search" button
    And I wait for loading invisible
    Then I will see the search result "{'column':'0','name':'<name>'}"

    Examples:
      | name     |
      | autotest |
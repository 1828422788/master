@offlineTask @all @smoke
Feature: 离线任务搜索

  Background:
    Given open the "splSearch.OfflineTaskPage" page for uri "/offlinetask/"

  Scenario Outline:
    Given I set the search input with "<name>"
    Then I will see the search result "{'column':'0','name':'<name>'}"

    Examples:
      | name     |
      | AutoTest |
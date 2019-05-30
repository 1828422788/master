@offlineTaskSmoke
Feature: 离线任务删除

  Background:
    Given open the "splSearch.OfflineTaskPage" page for uri "/offlinetask/"

  Scenario Outline:
    And I wait for "EmptyElement" will be visible
    When the data name is "<name>" then i click the "删除" button
    And I click the "EnsureButton" button

    Examples:
      | name                        |
      | autotest                    |
      | recentlyOfflineAutoTest     |
      | transactionofflineAutoTest2 |
      | transactionofflineAutoTest1 |
      | WholeTimeOfflineAutoTest    |

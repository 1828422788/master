@clean
Feature: 离线任务清理

  Background:
    Given open the "splSearch.OfflineTaskPage" page for uri "/offlinetask/"

  Scenario Outline:
    When the data name is "<name>" then i click the "删除" button
    And I click the "EnsureButton" button
    Then I will see the success message "删除成功"

    Examples:
      | name                        |
      | WholeTimeOfflineAutoTest    |
      | transactionofflineAutoTest1 |
      | transactionofflineAutoTest2 |
      | offlineAutoTest1            |
      | offlineAutoTest2            |
      | recentlyOfflineAutoTest     |
      | autotest                    |
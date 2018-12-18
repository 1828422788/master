@offlineTask @all @smoke
Feature: 离线任务删除

  Background:
    Given open the "splSearch.OfflineTaskPage" page for uri "/offlinetask/"

  Scenario Outline:
    When the data name is "<name>" then i click the "删除" button
    And I click the "EnsureButton" button
    Then I will see the success message "删除成功"

    Examples:
      | name                         |
      | recentlyOfflineAutoTest      |
      | transactionofflineAutoTest2  |
      | transactionofflineAutoTest1  |
      | WholeTimeOfflineAutoTest     |
      | realTimeOfflineAutoTest      |
      | ThirtySecondsOfflineAutoTest |
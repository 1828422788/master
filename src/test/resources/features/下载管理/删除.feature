@offlineTask @offlineTaskSmoke
Feature: 下载删除（RZY-175）

  Background:
    Given open the "splSearch.OfflineTaskPage" page for uri "/download/"

  Scenario Outline:
    When the data name is "<name>" then i click the "删除" button
    And I click the "EnsureButton" button

    Examples:
      | name           |
      | autotest2.json |
      | autotest2.txt  |
      | autotest.json  |
      | autotest.csv   |
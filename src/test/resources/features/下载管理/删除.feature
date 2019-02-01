@offlineTask @all @smoke
Feature: 下载删除（RZY-175）

  Background:
    Given open the "splSearch.OfflineTaskPage" page for uri "/download/"

  Scenario Outline:
    When the data name is "<name>" then i click the "删除" button
    And I click the "EnsureButton" button
    And I refresh the website
    Then I will see the search result "{'column':'0','name':'<name>','contains':'no'}"

    Examples:
      | name           |
      | autotest2.json |
#      | autotest1.json |
      | autotest2.txt  |
      | autotest.json  |
      | autotest.csv   |


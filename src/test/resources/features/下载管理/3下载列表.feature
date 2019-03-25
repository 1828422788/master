@offlineTask @offlineTaskSmoke
Feature: 下载列表查看并下载

  Background:
    Given open the "splSearch.OfflineTaskPage" page for uri "/download/"

  Scenario Outline:
    Given the data name is "<name>" then i click the "下载" button
    Then I embedding the file "<name>" into report

    Examples:
      | name           |
      | autotest.csv   |
      | autotest.json  |
      | autotest2.json |
      | autotest2.txt  |


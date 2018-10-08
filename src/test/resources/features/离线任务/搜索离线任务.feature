@offlineTask @all @smoke
Feature: 离线任务搜索

  Background:
    Given open the "splSearch.OfflineTaskPage" page for uri "/offlinetask/"

  Scenario Outline:
    Given search "<searchName>" and I will see the column number "1" contains "<name>"

    Examples:
      | searchName           | name     |
      | {'input':'AutoTest'} | AutoTest |
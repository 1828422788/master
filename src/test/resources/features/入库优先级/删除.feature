@indexSetting @indexSettingSmoke @priority
Feature: 入库优先级删除（RZY-1486）

  Background:
    Given open the "ingestPriority.ListPage" page for uri "/ingestpriority/"

  Scenario Outline:
    When the data name is "<name>" then i click the "更多" button
    And I c
    And I click the "EnsureButton" button
    And I refresh the website
    And I wait for loading invisible
    Then I will see the search result "{'column':'0','name':'<name>','contains':'no'}"

    Examples:
      | name                 |
      | AutoTestWithTag  |
      | autotest      |
      | AutoTestHighPriority |
      |top_info_s_proc_status|

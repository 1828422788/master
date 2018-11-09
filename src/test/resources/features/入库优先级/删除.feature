@all @indexSetting @smoke @indexSettingSmoke
Feature: 入库优先级删除

  Background:
    Given open the "ingestPriority.ListPage" page for uri "/ingestpriority/"

  Scenario Outline:
    When the data name is "<name>" then i click the "删除" button
    And I click the "EnsureButton" button
    Then I will see the success message "删除成功"
    And I refresh the website
    Then I will see the search result "{'column':'0','name':'<name>','contains':'no'}"

    Examples:
      | name                 |
      | AutoTest             |
      | AutoTestWithTag      |
      | AutoTestHighPriority |

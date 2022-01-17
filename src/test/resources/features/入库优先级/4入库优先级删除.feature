@indexSetting @indexSettingSmoke @priority
Feature: 入库优先级删除（RZY-1486）

  Background:
    Given open the "ingestPriority.ListPage" page for uri "/ingestpriority/"

  Scenario Outline:入库优先级删除

    Given the data name is "<name>" then i click the "删除" button
    And I click the "EnsureButton" button
    And I refresh the website
    And I wait for loading invisible
    Then I will see the search result "{'column':'0','name':'<name>','contains':'no'}"

    Examples:
      | name                 |
      | ln_low_priority  |
      | Autotest      |
      | ln_mid_priority |
      | ln_high_priority|

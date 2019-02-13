@indexSetting @all @indexSettingSmoke
Feature: topic删除（RZY-2429）

  Background:
    Given open the "index.TopicSetting" page for uri "/indexsettings/topicsettings/"

  Scenario:
    When the data name is "AutoTest" then i click the "删除" button
    And I click the "EnsureDelete" button
    And I refresh the website
    Then I will see the search result "{'column':'0','name':'AutoTest','contains':'no'}"

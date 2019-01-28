@indexSetting @all
Feature: topic删除（RZY-2429）

  Background:
    Given open the "index.TopicSetting" page for uri "/indexsettings/topicsettings/"

  Scenario:
    When the data name is "AutoTest" then i click the "删除" button
    And I click the "EnsureDelete" button
    Then I will see the success message "删除成功"

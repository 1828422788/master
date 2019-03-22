@indexSetting @all @smoke @indexSettingSmoke
Feature: 索引信息禁用（RZY-1475）

  Background:
    Given open the "index.ListPage" page for uri "/indexsettings/indexinfo/"

  Scenario:
    Given I close "autotest" without paging
    Then I will see the message "禁用成功"
    Given I open "autotest" without paging
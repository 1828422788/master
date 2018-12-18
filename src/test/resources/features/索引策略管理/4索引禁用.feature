@indexSetting @all @smoke @indexSettingSmoke
Feature: 索引信息禁用（RZY-1475）

  Background:
    Given open the "index.ListPage" page for uri "/indexsettings/indexinfo/"

  Scenario:
    Given I disabled the data "autotest"
    Then I will see the success message "禁用成功"
    And I disabled the data "autotest"




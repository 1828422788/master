@indexSetting @all @smoke
Feature: 禁用索引信息

  Background:
    Given open the "index.ListPage" page for uri "/indexsettings/indexinfo/"

  Scenario:
    Given I disabled the data "autotest"
    Then I will see the success message "禁用成功"
    And I disabled the data "autotest"




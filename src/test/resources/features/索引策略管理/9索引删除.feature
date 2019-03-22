@indexSetting @all @smoke @indexSettingSmoke
Feature: 索引信息删除（RZY-1476）

  Background:
    Given open the "index.ListPage" page for uri "/indexsettings/indexinfo/"

  Scenario:
    Given the data name is "autotest" then i click the "删除" button without paging
    And I click the "EnsureButton" button
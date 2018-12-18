@indexSetting @all @smoke @indexSettingSmoke
Feature: 路由删除（RZY-1482）

  Background:
    Given open the "index.ListPage" page for uri "/indexsettings/indexinfo/"
    And I click the "IndexMatchRule" button

  Scenario:
    Given the data name is "autotest" then i click the "删除" button
    When I click the "EnsureButton" button
    Then I will see the success message "删除成功"

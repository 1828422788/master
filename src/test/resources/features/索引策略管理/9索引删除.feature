@indexSetting @all @smoke
Feature: 删除索引信息

  Background:
    Given open the "index.ListPage" page for uri "/indexsettings/indexinfo/"

  Scenario:
    Given the data name is "autotest" then i click the "删除" button
    When I click the "EnsureButton" button
    Then I will see the success message "删除成功"
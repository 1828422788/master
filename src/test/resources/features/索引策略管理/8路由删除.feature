@indexSetting @all @smoke @indexSettingSmoke
Feature: 路由删除（RZY-1482）

  Background:
    Given open the "index.ListPage" page for uri "/indexsettings/indexmatchrule/"

  Scenario Outline:
    Given the data name is "{'column':'<num>','name':'<name>'}" then i click the "删除" button
    When I click the "EnsureButton" button
    Then I will see the message "删除成功"

    Examples:
      | num | name               |
      | 0   | iistestauto        |
      | 1   | index_testautotest |
      | 2   | iisdxautotest      |
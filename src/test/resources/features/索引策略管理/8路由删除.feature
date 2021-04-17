@clean @cleanSecond @cleanIndex @indexSettingSmoke @indexSetting
Feature: 路由删除（RZY-1482）

  Background:
    Given open the "index.ListPage" page for uri "/indexmatchrules/"

  Scenario Outline:
    Given the data name is "{'column':'<num>','name':'<name>'}" then i click the "删除" button
    Then I click the "Ensure" button

    Examples:
      | num | name                 |
      | 3   | AutoCreateForSxcTest |
      | 3   | AutoUpCase |
      | 3   | AutoRule             |
      | 3   | AutoTag              |
      | 3   | AutoAppName          |
      | 3   | AutoTestForsxcSize   |
      | 3   | AutoTestForsxc       |
      | 3   | AutoTest |
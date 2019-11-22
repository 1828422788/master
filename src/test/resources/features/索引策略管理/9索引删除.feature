@clean @cleanSecond @cleanIndex
Feature: 索引信息删除（RZY-1476）

  Background:
    Given open the "index.ListPage" page for uri "/indexsettings/indexinfo/"

  Scenario Outline:
    Given the data name is "{'column':'1','name':'<name>'}" then i click the "删除" button
    And I click the "Ensure" button

    Examples:
      | name       |
      | indexerror |
      | error      |
      | sunxctime  |
      | sunxcsize  |
      | iisidx     |
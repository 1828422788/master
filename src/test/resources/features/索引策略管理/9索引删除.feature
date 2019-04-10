@clean @cleanSecond
Feature: 索引信息删除（RZY-1476）

  Background:
    Given open the "index.ListPage" page for uri "/indexsettings/indexinfo/"

  Scenario Outline:
    Given the data name is "<name>" then i click the "删除" button without paging
    And I click the "EnsureButton" button

    Examples:
      | name       |
      | indexerror |
      | error      |
      | sunxctime  |
      | sunxcsize  |
      | iisidx     |
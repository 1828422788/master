@clean @cleanSecond
Feature: 字典管理删除

  Background:
    Given open the "dictionary.ListPage" page for uri "/dictionary/"

  Scenario Outline: 删除字典管理
    When the data name is "<name>" then i click the "删除" button
    And I click the "EnsureButton" button

    Examples:
      | name                   |
      | win_sys_sourcename.csv |
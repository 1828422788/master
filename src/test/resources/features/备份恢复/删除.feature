@backup @all @smoke
Feature: 备份恢复删除（RZY-1501）

  Background:
    Given open the "backup.ListPage" page for uri "/backup/"

  Scenario Outline: 删除appName
    Given the data name "<name>" in table "AppNameTable" then i click the "删除" button
    When I click the "EnsureButton" button
    Then take a screenshot with name "1501：备份恢复-删除成功"

    Examples:
      | name |
      | iis  |
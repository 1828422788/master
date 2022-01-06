@backup @backupSmoke @third
Feature: 备份策略删除（RZY-1501）

  Background:
    Given open the "backup.ListPage" page for uri "/backup/"

  Scenario Outline: 删除备份策略
    Given the data name "<name>" in table "AppNameTable" then i click the "删除" button
    And I click the "EnsureButton" button
    And I will see the element "HelpMessage" name is "删除策略成功"
    And I will see the element "DataListNum" name is "数据列表(4)"

    Examples:
      | name      |
      | ln*       |
      | TESTBACK  |
      | testbackup|
      | _name     |
      | testln    |
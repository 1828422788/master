@clean @cleanSecond @cleanIndex @indexSettingSmoke @indexSetting
Feature: 索引信息删除（RZY-1476）

  Background:
    Given open the "index.ListPage" page for uri "/indexsettings/"
    And I wait for loading invisible

  Scenario Outline:索引信息删除
    When the data name is "{'column':'1','name':'<name>'}" then i click the "删除" button in more menu
    And I wait for loading invisible
    And I click the "Ensure" button

    Examples:
      | name       |
      | indexerror |
      | error      |
      | sunxctime  |
      | sunxcsize  |
      | iisidx     |
      | index_data  |
      | index_freez  |
      | index_sink     |
      | indexnumber1   |
      | indexnumber    |
      | indexcompact   |
      | indexcompact1  |
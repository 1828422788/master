@indexSetting @all @smoke @indexSettingSmoke
Feature: 索引信息搜索

  Background:
    Given open the "index.ListPage" page for uri "/indexsettings/indexinfo/"

  Scenario Outline:
    Given I set the search input with "<name>"
    Given I will see the search result without paging contains "{'column':'0','name':'<name>'}"

    Examples:
      | name     |
      | autotest |
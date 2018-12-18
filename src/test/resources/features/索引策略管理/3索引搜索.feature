@indexSetting @all @smoke @indexSettingSmoke
Feature: 索引信息搜索

  Background:
    Given open the "index.ListPage" page for uri "/indexsettings/indexinfo/"

  Scenario Outline:
    Given search "<searchName>" and I will see the column number "1" contains "<name>"

    Examples:
      | searchName           | name     |
      | {'input':'autotest'} | autotest |
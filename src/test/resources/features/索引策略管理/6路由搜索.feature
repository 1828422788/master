@indexSetting @indexSettingSmoke
Feature: 路由搜索

  Background:
    Given open the "index.ListPage" page for uri "/indexsettings/indexmatchrule/"

  Scenario Outline:
    Given search "<searchName>" and I will see the column number "5" contains "<name>"

    Examples:
      | searchName           | name     |
      | {'input':'autotest'} | autotest |
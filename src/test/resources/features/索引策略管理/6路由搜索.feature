@indexSetting @all @indexSettingSmoke @smoke
Feature: 路由搜索

  Background:
    Given open the "index.ListPage" page for uri "/indexsettings/indexinfo/"
    Then I click the "IndexMatchRule" button

  Scenario Outline:
    Given search "<searchName>" and I will see the column number "1" contains "<name>"

    Examples:
      | searchName           | name     |
      | {'input':'autotest'} | autotest |
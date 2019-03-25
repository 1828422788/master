@indexSetting @indexSettingSmoke
Feature: 入库优先级搜索

  Background:
    Given open the "ingestPriority.ListPage" page for uri "/ingestpriority/"

  Scenario Outline:
    When search "{'input':'<name>'}" and I will see the column number "1" contains "<name>"

    Examples:
      | name     |
      | AutoTest |
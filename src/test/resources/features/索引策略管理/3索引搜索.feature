@indexSetting @indexSettingSmoke
Feature: 索引信息搜索

  Background:
    Given open the "index.ListPage" page for uri "/indexsettings/indexinfo/"
    And I wait for loading invisible

  Scenario Outline:
    When I set the parameter "SearchInput" with value "<searchName>"
    And I wait for loading invisible
    Then I will see the search result without paging "{'column':'0','name':'<searchName>'}"

    Examples:
      | searchName |
      | error      |
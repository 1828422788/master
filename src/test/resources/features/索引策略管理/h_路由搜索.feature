@indexSetting
Feature: 路由搜索

  Background:
    Given open the "index.ListPage" page for uri "/indexmatchrules/"

  Scenario Outline:
    When I set the parameter "TextFilter" with value "<searchName>"
    And I wait for loading invisible
    Then I will see the search result "{'column':'0','name':'<searchName>'}"

    Examples:
      | searchName |
      | sunxctest	       |
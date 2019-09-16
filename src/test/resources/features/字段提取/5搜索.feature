@all @smoke @configs @configsSmoke
Feature: 字段提取搜索

  Background:
    Given open the "configs.ListPage" page for uri "/configs/"

  Scenario:
    When I set the parameter "SearchInput" with value "主规则"
    And I click the "Search" button
    And I wait for loading invisible
    Then I will see the search result "{'column':'0','name':'主规则'}"

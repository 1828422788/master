@all @smoke @app @appSmoke
Feature: 应用搜索

  Background:
    Given open the "app.ListPage" page for uri "/app/list/"

  Scenario Outline:
    When I set the parameter "SearchInput" with value "<appName>"
    And I wait for loading invisible
    Then I will see the search result "{'column':'0','name':'<appName>'}"

    Examples:
      | appName  |
      | AlertApp |

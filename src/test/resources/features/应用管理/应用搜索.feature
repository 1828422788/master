@all @smoke @app
Feature: 应用搜索

  Background:
    Given open the "app.ListPage" page for uri "/app/list/"
    And I wait for loading invisible

  Scenario Outline:
    When I set the parameter "SearchInput" with value "<appName>"
    And I wait for loading invisible
    Then I will see the search result "{'column':'0','name':'<appName>'}"

    Examples:
      | appName  |
      | AlertApp |

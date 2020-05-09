@all @smoke @configs @configsSmoke
Feature: 字段提取复制

  Scenario Outline:
    Given open the "configs.ListPage" page for uri "/configs/"
    Then I wait for loading invisible
    When the data name is "{'column':'1','name':'<name>'}" then i click the "复制" button
    And I refresh the website
    Then I will see the search result contains "{'column':'1','name':'<name>(副本)'}"

    Examples:
      | name        |
      | RZY3417多值字段 |
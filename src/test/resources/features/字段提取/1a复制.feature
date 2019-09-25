@all @smoke @configs @configsSmoke
Feature: 字段提取复制

  Background:
    Given open the "configs.ListPage" page for uri "/configs/"

  Scenario Outline:
    When the data name is "<name>" then i click the "复制" button
    And I refresh the website
    Then I will see the search result contains "{'column':'0','name':'<name>(副本)'}"

    Examples:
      | name        |
      | RZY3417多值字段 |
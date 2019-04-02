@all @smoke @trend @trendSmoke
Feature: 趋势图复制（RZY-1889）

  Background:
    Given open the "trend.ListPage" page for uri "/trend/"

  Scenario Outline:
    When the data name is "<name>" then i click the "复制" button
    And I refresh the website
    Then I will see the search result contains "{'column':'0','name':'<name>(副本)'}"

    Examples:
      | name         |
      | 矩阵热力图sample1 |
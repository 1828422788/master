@all @smoke @trend @trendSmoke
Feature: 趋势图分组

  Background:
    Given open the "trend.ListPage" page for uri "/trend/"

  Scenario Outline:
    When the data name is "<name>" then i click the "分组" button
    And I cancel selection "<group>" from the "Group"
    And I click the "Ensure" button
    And I will see the error message "至少选择一个分组"
    And I choose the "<extraGroup>" from the "Group"
    And I click the "Ensure" button
    And I refresh the website
    Then I will see the data "<name>" values "{'column':'3','name':'<extraGroup>'}"

    Examples:
      | name     | group           | extraGroup                    |
      | AutoTest | AutoTestForAuth | AutoTestForAuth,default_Trend |
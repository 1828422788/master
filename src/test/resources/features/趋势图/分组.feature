@all @smoke @trend
Feature: 趋势图分组

  Background:
    Given open the "trend.ListPage" page for uri "/trend/"

  Scenario Outline:
    When the data name is "AutoTest" then i click the "分组" button
    And I cancel selection "<group>" from the "Group"
    And I click the "Ensure" button
    And I will see the error message "至少选择一个分组"
    And I choose the "<group>" from the "Group"
    And I will see the success message "保存成功"
#    And I refresh the website
#    And I

    Examples:
      | group         |
      | default_Trend |
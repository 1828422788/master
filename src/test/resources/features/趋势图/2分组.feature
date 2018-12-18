@all @smoke @trend @trendSmoke
Feature: 趋势图分组（RZY-1890）

  Background:
    Given open the "trend.ListPage" page for uri "/trend/"

  Scenario Outline:
    When the data name is "<name>" then i click the "分组" button
    And I <group>
    And I click the "Ensure" button
    And I will see the error message "保存成功"

    Examples:
      | name      | group                                                               |
      | AutoTest1 | cancel selection "default_Trend" from the "Group"                   |
      | AutoTest1 | choose the "AutoTestWithAllResource,default_Trend" from the "Group" |
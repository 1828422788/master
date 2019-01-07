@all @smoke @trend @trendSmoke
Feature: 趋势图分组（RZY-1890）

  Background:
    Given open the "trend.ListPage" page for uri "/trend/"

  Scenario Outline:
    When the data name is "曲线图sample2" then i click the "分组" button
    And I <group>
    And I click the "Ensure" button
    And I will see the error message "保存成功"

    Examples:
      | group                                                               |
      | cancel selection "default_Trend" from the "Group"                   |
      | choose the "AutoTestWithAllResource,default_Trend" from the "Group" |
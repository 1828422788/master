@dragAndDropView @trendView
Feature: 展示趋势图

  Scenario Outline: compare_view
    Given open the "trend.ListPage" page for uri "/trend/"
    When I set the parameter "SearchInput" with value "拖拽_<name>"
    And I wait for "3000" millsecond
    And the data name is "{'column':'0','name':'拖拽_<name>'}" then i click the "展示趋势图" button
    And switch to window "查看趋势图"
    And I close all tabs except main tab
    Then I will see the "trend.ViewPage" page
    And I wait for "ChartName" will be visible
    And I wait for "ChartView" will be visible
    And I drag the scroll bar to the element "ChartView"
    And I wait for "3000" millsecond
    And I will see the element "ChartName" contains "拖拽_<name>"
    And take part of "ChartView" with name "actual/拖拽_<name>"
    And I compare source image "actual/拖拽_<name>" with target image "expect/拖拽_<name>"

    Examples:
      | name                |
      | Table_对比_2        |
      | Table_2             |
      | Radar_对比          |
      | Radar               |
      | Funnel              |
      | Wordcloud           |
      | Single_area         |
      | Single_trend        |
      | Single_Background   |
      | Heatmap             |
      | Multiaxis_曲散      |
      | Multiaxis_柱面      |
      | Bar                 |
      | Rose                |
      | Pie                 |
      | Table_对比_1        |
      | Table_1             |
      | Area_无数值         |
      | Column_对比         |
      | Area_对比           |
      | Line_对比           |
      | Column_Pile         |
      | Scatter             |
      | Area_Pile           |
      | Line                |
      | Column_timechart    |
      | Scatter_timechart   |
      | Area_timechart      |
      | Line_timechart      |

  @dragAndDropViewDataset
  Scenario Outline: compare_view_dataset
    Given open the "trend.ListPage" page for uri "/trend/"
    When I set the parameter "SearchInput" with value "数据集_<name>"
    And I wait for "3000" millsecond
    And the data name is "{'column':'0','name':'数据集_<name>'}" then i click the "展示趋势图" button
    And switch to window "查看趋势图"
    And I close all tabs except main tab
    Then I will see the "trend.ViewPage" page
    And I wait for "ChartName" will be visible
    And I wait for "ChartView" will be visible
    And I drag the scroll bar to the element "ChartView"
    And I wait for "3000" millsecond
    And I will see the element "ChartName" contains "数据集_<name>"
    And take part of "ChartView" with name "actual/数据集_<name>"
    And I compare source image "actual/数据集_<name>" with target image "expect/数据集_<name>"

    Examples:
      | name            |
      | Line_单         |
      | Area_单         |
      | Column_全部_单  |
      | Column_任一_单  |
      | Column_表达式_单|
      | Area_追加       |
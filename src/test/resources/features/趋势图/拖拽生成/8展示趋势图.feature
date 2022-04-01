@dragAndDropView @trendView
Feature: 展示趋势图

  Scenario Outline: compare_view
    Given open the "trend.ListPage" page for uri "/trend/"
    And I wait for loading invisible
    When I set the parameter "SearchInput" with value "拖拽_<name>"
    And I wait for loading invisible
    And the data name is "{'column':'0','name':'拖拽_<name>'}" then i click the "展示趋势图" button in more menu
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
      | Matrixheatmap       |
      | Radar_对比          |
      | Radar_Switch        |
      | Radar               |
      | Funnel              |
      | Wordcloud           |
      | Ring_2              |
      | Ring_1              |
      | Single_IconField    |
      | Single_SecondTitle  |
      | Single_Icon         |
      | Single_area         |
      | Single_trend        |
      | Single_Background   |
      | Regionmap_Jiangsu_下钻|
      | Regionmap_China_下钻|
      | Regionmap_World_下钻|
      | Regionmap_China     |
      | Regionmap_World     |
      | Heatmap             |
      | Multiaxis_对比      |
      | Multiaxis_曲散      |
      | Multiaxis_柱面      |
      | Force               |
      | Sankey              |
      | Chord               |
      | Sunburst            |
      | Flame_DrillOut      |
      | Flame_DrillIn       |
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
    And the data name is "{'column':'0','name':'数据集_<name>'}" then i click the "展示趋势图" button in more menu
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
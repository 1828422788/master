@dragAndDrop @dragAndDropView
Feature: 展示趋势图

  Scenario Outline: compare_view
    Given open the "trend.ListPage" page for uri "/trend/"
    When I set the parameter "SearchInput" with value "<name>"
    And I wait for "2000" millsecond
    And the data name is "{'column':'0','name':'<name>'}" then i click the "展示趋势图" button
    And switch to window "查看趋势图"
    And I close all tabs except main tab
    Then I will see the "trend.ViewPage" page
    And I wait for "ChartName" will be visible
    And I wait for "ChartView" will be visible
#    And I will see the "NoData" doesn't exist
    And I drag the scroll bar to the element "ChartView"
    And I wait for "3000" millsecond
    And I will see the element "ChartName" contains "<name>"
    And take part of "ChartView" with name "actual_view/<name>"
#    And I compare source image "actual/<name>" with target image "expect/<name>"

    Examples:
      | name                     |
      | 拖拽_Table_对比_2        |
      | 拖拽_Table_2             |
      | 拖拽_Radar_对比          |
      | 拖拽_Radar               |
      | 拖拽_Funnel              |
      | 拖拽_Wordcloud           |
      | 拖拽_Single_area         |
      | 拖拽_Single_trend        |
      | 拖拽_Single_Background   |
      | 拖拽_Heatmap             |
      | 拖拽_Bar                 |
      | 拖拽_Rose                |
      | 拖拽_Pie                 |
      | 拖拽_Table_对比_1        |
      | 拖拽_Table_1             |
      | 拖拽_Area_无数值         |
      | 拖拽_Column_对比         |
      | 拖拽_Area_对比           |
      | 拖拽_Line_对比           |
      | 拖拽_Column_Pile         |
      | 拖拽_Scatter             |
      | 拖拽_Area_Pile           |
      | 拖拽_Line                |
      | 拖拽_Column_timechart    |
      | 拖拽_Scatter_timechart   |
      | 拖拽_Area_timechart      |
      | 拖拽_Line_timechart      |
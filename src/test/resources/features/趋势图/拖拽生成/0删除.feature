@cleanDragAndDrop
Feature: 趋势图删除

  Scenario Outline: delete
    Given open the "trend.ListPage" page for uri "/trend/"
    When I set the parameter "SearchInput" with value "<name>"
    And I wait for "2000" millsecond
    And the data name is "{'column':'0','name':'<name>'}" then i click the "删除" button
    Then I will see the message "确认删除 [<name>] ?"
    When I click the "EnsureButton" button
    Then I will see the success message "删除成功"

    Examples:
      | name                     |
      | 拖拽_Funnel              |
      | 拖拽_Wordcloud           |
      | 拖拽_Single_area         |
      | 拖拽_Single_trend        |
      | 拖拽_Single_Background   |
      | 拖拽_Heatmap             |
      | 拖拽_Bar                 |
      | 拖拽_Rose                |
      | 拖拽_Pie                 |
      | 拖拽_Column_Pile         |
      | 拖拽_Scatter             |
      | 拖拽_Area_Pile           |
      | 拖拽_Line                |
      | 拖拽_Column_timechart    |
      | 拖拽_Scatter_timechart   |
      | 拖拽_Area_timechart      |
      | 拖拽_Line_timechart      |
@cleanDragAndDrop
Feature: 趋势图删除

  Scenario Outline: delete_dd
    Given open the "trend.ListPage" page for uri "/trend/"
    When I set the parameter "SearchInput" with value "拖拽_<name>"
    And I wait for "2000" millsecond
    And the data name is "{'column':'0','name':'拖拽_<name>'}" then i click the "删除" button
    Then I will see the message "确认删除 [拖拽_<name>] ?"
    When I click the "EnsureButton" button
    Then I will see the success message "删除成功"

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

    @cleanDragAndDropDataset
    Scenario Outline: delete_dataset
      Given open the "trend.ListPage" page for uri "/trend/"
      When I set the parameter "SearchInput" with value "数据集_<name>"
      And I wait for "2000" millsecond
      And the data name is "{'column':'0','name':'数据集_<name>'}" then i click the "删除" button
      Then I will see the message "确认删除 [数据集_<name>] ?"
      When I click the "EnsureButton" button
      Then I will see the success message "删除成功"

    Examples:
      | name            |
      | Line_单         |
      | Area_单         |
      | Column_全部_单  |
      | Column_任一_单  |
      | Column_表达式_单|
      | Area_追加       |
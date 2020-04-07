@reportFromTrend
Feature: 报表新建_从趋势图

  Background:
    Given open the "report.ListPage" page for uri "/reports/"
    And I click the "NewReportButton" button
    Then I will see the "report.CreatePage" page

  Scenario Outline: new_report_trends4
    When I set the parameter "Name" with value "<name>"
    And I set the parameter "Describe" with value "AutoCreate"
    And I choose the "AutoTest" from the "Tag"
    And I choose the "PDF" from the "ReportType"
    And I set the parameter "Hour" with value "7"
    And I set the parameter "Minute" with value "00"
    And I click the "NextButton" button
    Then I wait for "ChartListButton" will be visible
    When I choose the "<chart1>" from the "ChartList"
    And I click the "ChartListButton" button
    Then I will see the element "ChosenTrendLast" contains "<chart1>"
    When I choose the "<chart2>" from the "ChartList"
    And I click the "ChartListButton" button
    Then I will see the element "ChosenTrendLast" contains "<chart2>"
    When I choose the "<chart3>" from the "ChartList"
    And I click the "ChartListButton" button
    Then I will see the element "ChosenTrendLast" contains "<chart3>"
    When I choose the "<chart4>" from the "ChartList"
    And I click the "ChartListButton" button
    Then I will see the element "ChosenTrendLast" contains "<chart4>"
    When I click the "FinishButton" button
    Then I will see the success message "保存成功"
    And I click the "EnsureButton" button

    @reportOrderCreate
    Examples:
      |    name          |   chart1              |    chart2                       |    chart3              |    chart4                       |
      | test序列_Order_1 | LineChart_2477        | AreaChart_2005                  | ScatterChart_2491      | ColumnChart_2499                |
      | test序列_Order_2 | LineChart_2479_Smooth | LineChart_2479_ConnectEmptyData | AreaChart_2483_Smooth  | AreaChart_2483_ConnectEmptyData |
      | test序列_Order_3 | AreaChart_Pile        | ColumnChart_Pile                | ColumnChart_2500_limit | ScatterChart_2492_limit         |
      | test序列_Order_4 | ScatterChart_bubbles  |                                 |                        |                                 |

    @reportDimensionCreate
    Examples:
      |    name                |   chart1       |    chart2       |    chart3    |    chart4    |
      | test维度_Dimension_1   | Pie_2503       | Rose_2858       | Bar_2676     | Sun_2850      |
      | test维度_Dimension_2   | Pie_只展示名称  | Rose_只展示名称 | Pie_展示全部  | Rose_展示全部 |
      | test维度_Dimension_3   | Pie_不展示      | Rose_不展示     | Bar_不展示   |               |

    @reportConnectionCreate
    Examples:
      |    name                 |   chart1         |    chart2       |    chart3    |    chart4       |
      | test关系_Connection_1   | Chord_2505       | Sankey_2507     | Force_2511   | Force_repulsion  |
      | test关系_Connection_2   |Sankey_Multistage  |                |              |                  |

    @reportCompoundCreate
    Examples:
      |    name                 |   chart1         |    chart2       |    chart3    |    chart4       |
      | test复合_Compound_1     | Multiaxis_2523   | Rangeline_2516  |              |                 |

    @reportMapCreate
    Examples:
      |    name         |   chart1            |    chart2                  |    chart3              |    chart4               |
      | test地图_Map_1  | Regionmap_2545      | Regionmap_China_2546       | Regionmap_Jiangsu_2547 |                         |
      | test地图_Map_2  | Heatmap_2539        | Attackmap_World_2542       | Attackmap_China_2543   |                         |
      | test地图_Map_3  | Statisticalmap_2797 | Statisticalmap_2797_param  | Statisticalmap_2098    |Statisticalmap_2098_param|

    @reportOtherCreate
    Examples:
      |    name           |   chart1        |    chart2             |    chart3        |    chart4         |
      | test其他_Other_1  | Single_2549     | Wordcloud_2625        | Radar_2633       | Funnel_2654       |
      | test其他_Other_3  | Chain_2831      | Chain_2982            | Sequence_2805    |                   |

    @reportTimechartCreate
    Examples:
      |    name           |   chart1              |    chart2               |    chart3             |     chart4            |
      | test_timechart_1  | timechart_3092_line   | timechart_3093_line     | timechart_3094_area   | timechart_3095_area   |
      | test_timechart_2  | timechart_3096_scatter| timechart_3097_scatter  | timechart_3098_column | timechart_3099_column |
      | test_timechart_3  | timechart_3247_line   | timechart_3248_area     | timechart_3249_scatter| timechart_3250_column |



  Scenario Outline: new_report_trends5
    When I set the parameter "Name" with value "<name>"
    And I set the parameter "Describe" with value "AutoCreate"
    And I choose the "AutoTest" from the "Tag"
    And I choose the "PDF" from the "ReportType"
    And I set the parameter "Hour" with value "7"
    And I set the parameter "Minute" with value "00"
    And I click the "NextButton" button
    Then I wait for "ChartListButton" will be visible
    When I choose the "<chart1>" from the "ChartList"
    And I click the "ChartListButton" button
    Then I will see the element "ChosenTrendLast" contains "<chart1>"
    When I choose the "<chart2>" from the "ChartList"
    And I click the "ChartListButton" button
    Then I will see the element "ChosenTrendLast" contains "<chart2>"
    When I choose the "<chart3>" from the "ChartList"
    And I click the "ChartListButton" button
    Then I will see the element "ChosenTrendLast" contains "<chart3>"
    When I choose the "<chart4>" from the "ChartList"
    And I click the "ChartListButton" button
    Then I will see the element "ChosenTrendLast" contains "<chart4>"
    When I choose the "<chart5>" from the "ChartList"
    And I click the "ChartListButton" button
    Then I will see the element "ChosenTrendLast" contains "<chart5>"
    When I click the "FinishButton" button
    Then I will see the success message "保存成功"
    And I click the "EnsureButton" button

    @reportDimensionCreate
    Examples:
      |    name              |   chart1                |    chart2                |    chart3                |    chart4                  | chart5                     |
      | test维度_Dimension_4 | Bar_只展示名称_柱状外左侧 | Bar_只展示名称_柱状外右侧 | Bar_只展示名称_柱状内中央 | Bar_只展示名称_柱状内靠左侧 | Bar_只展示名称_柱状内靠右侧 |
      | test维度_Dimension_5 | Bar_展示全部_柱状外左侧   | Bar_展示全部_柱状外右侧  | Bar_展示全部_柱状内中央    | Bar_展示全部_柱状内靠左侧   | Bar_展示全部_柱状内靠右侧  |

    @reportOtherCreate
    Examples:
      |    name                  |   chart1      |    chart2      |    chart3        |    chart4                   | chart5                        |
      | test其他_Other_ring      | Ring_onefield | Ring_twofields | Ring_table_3r_2c  | Ring_table_1r_4c            | Ring_table_1r_3c_colors       |
      | test其他_Other_Single_1  | Single_icon   | Single_cnt     | Single_font1      | Single_font2                | Single_backgr                 |
      | test其他_Other_Single_2  | Single_trend  | Single_rangeF  | Single_rangeB     | Single_prec1_1000on__before |Single_prec2_1000off_back_after|
      | test其他_Other_2         | Radar_2635    | Funnel_2858    |Matrixheatmap_2660 | Matrixheatmap_2661          |    Table_Test                 |


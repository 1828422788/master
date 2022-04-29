@reportFromTrendAndDownload
Feature: 趋势图保存为报表

  Background:
    Given open the "report.ListPage" page for uri "/reports/"

  @reportFromTrend
  Scenario Outline: 添加趋势图
    And I click the "NewReportButton" button
    Then I will see the "report.CreatePage" page
    And I wait for element "SelectedUser" change text to username
    When I set the parameter "Name" with value "<name>"
    And I set the parameter "Describe" with value "AutoCreate"
    And I choose the "PDF" from the "ReportType"
    And I set the parameters "Hour" and "Minute" as "5" minutes later from now
    And I click the "NextButton" button
    Then I wait for "ChartListButton" will be visible
    When I choose the "<chart1>" from the "ChartList"
    And I click the "ChartListButton" button
#    Then I will see the element "ChosenTrendLast" contains "<chart1>"
    When I choose the "<chart2>" from the "ChartList"
    And I click the "ChartListButton" button
#    Then I will see the element "ChosenTrendLast" contains "<chart2>"
    When I choose the "<chart3>" from the "ChartList"
    And I click the "ChartListButton" button
#    Then I will see the element "ChosenTrendLast" contains "<chart3>"
    When I choose the "<chart4>" from the "ChartList"
    And I click the "ChartListButton" button
#    Then I will see the element "ChosenTrendLast" contains "<chart4>"
    When I choose the "<chart5>" from the "ChartList"
    And I click the "ChartListButton" button
#    Then I will see the element "ChosenTrendLast" contains "<chart5>"
    And I click the "Layout1" button
    And I will see the "Badge1" is display
    When I click the "FinishButton" button
    And I wait for "ResultMessage" will be visible
    And I will see the element "ResultMessage" contains "新建成功"

    @reportOrderCreate
    Examples:
      |    name               |   chart1              |    chart2                       |    chart3              |    chart4                       | chart5  |
      | test序列_Order_1      | LineChart_2477        | AreaChart_2005                  | ScatterChart_2491      | ColumnChart_2499                |           |
      | test序列_Order_2      | LineChart_2479_Smooth | LineChart_2479_ConnectEmptyData | AreaChart_2483_Smooth  | AreaChart_2483_ConnectEmptyData |           |
      | test序列_Order_3      | AreaChart_Pile        | ColumnChart_Pile                | ColumnChart_2500_limit | ScatterChart_2492_limit         |           |
      | test序列_Order_4      | ScatterChart_bubbles  |                                 |                        |                                 |           |
#      | test序列_Order_4_分面 | LineChart_分面        | AreaChart_分面                  | ScatterChart_分面      | ColumnChart_分面                |           |

    @reportDimensionCreate
    Examples:
      |    name              |   chart1                  |    chart2                 |    chart3                 |    chart4                   | chart5                      |
      | test维度_Dimension_1 | Pie_2503                  | Rose_2858                 | Bar_2676                  | Sun_2850                    |                             |
      | test维度_Dimension_2 | Pie_只展示名称            | Rose_只展示名称           | Pie_全部展示              | Rose_全部展示               |                             |
      | test维度_Dimension_3 | Pie_不展示                | Rose_不展示               | Bar_不展示                | Flame_DrillIn               |                             |
      | test维度_Dimension_4 | Bar_只展示名称_柱状外左侧 | Bar_只展示名称_柱状外右侧 | Bar_只展示名称_柱状内中央 | Bar_只展示名称_柱状内靠左侧 | Bar_只展示名称_柱状内靠右侧 |
      | test维度_Dimension_5 | Bar_全部展示_柱状外左侧   | Bar_全部展示_柱状外右侧   | Bar_全部展示_柱状内中央   | Bar_全部展示_柱状内靠左侧   | Bar_全部展示_柱状内靠右侧   |
#      | test维度_Dimension_6_分面   | Pie_全部展示_分面| Rose_只展示名称_分面| Bar_全部展示_分面| Sun_分面      |         |

    @reportConnectionCreate
    Examples:
      |    name                 |   chart1         |    chart2       |    chart3    |    chart4        |  chart5 |
      | test关系_Connection_1   | Chord_2505       | Sankey_2507     | Force_2511   | Force_repulsion  |         |
      | test关系_Connection_2   |Sankey_Multistage |                 |              |                  |         |

    @reportCompoundCreate
    Examples:
      |    name                 |   chart1         |    chart2       |    chart3          |    chart4       | chart5|
      | test复合_Compound_1     | Multiaxis_2523   | Multiaxis_4841  | Rangeline_2516     |                 |        |

    @reportMapCreate
    Examples:
      |    name           |   chart1            |    chart2                  |    chart3                   |    chart4               | chart5|
      | test地图_Map_1    | Regionmap_2545      | Regionmap_China_2546       | Regionmap_Jiangsu_2547      |                         |         |
      | test地图_Map_2    | Heatmap_2539        | Attackmap_World_2542       | Attackmap_China_2543        |                         |         |
#      | test地图_Map_3_n  | Geostatsmap_2797    | Geostatsmap_2797_param     | Geostatsmap_2098            |Geostatsmap_2098_param   |         |
      | test地图_Map_white| Regionmap_2545_white| Regionmap_China_2546_white | Regionmap_Jiangsu_2547_white|                         |         |
#      | test地图_分面     | Regionmap_分面      | Heatmap_分面               |                             |                         |        |

    @reportOtherCreate
    Examples:
      |    name                 |   chart1            |    chart2             |    chart3        |    chart4         | chart5    |
      | test其他_Other_1        | Single_2549         | Wordcloud_2625        | Radar_2633       | Funnel_2654       |             |
#      | test其他_Other_3        | Sequence_2805       | NetworkNode           |                  |                   |           |
#      | test其他_Other_chain    | Chain_2831          | Chain_2982            | Chain_2831_tree  | Chain_2982_tree   |          |
#      | test其他_Other_分面     | Wordcloud_分面      | Liquidfill_分面       | Chain_2831_tree  | Chain_2982_tree   |           |
#      | test其他_Other_liquid   |Ring_table_3r_2c  |Ring_table_1r_3c_colors|           |
      | test其他_Other_2         | Ring_onefield | Ring_twofields |Liquidfill_percent |                             |                               |
      | test其他_Other_Single_1  | Single_icon   | Single_cnt     | Single_仅数值字段 | Single_仅展示字段           | Single_backgr                 |
      | test其他_Other_Single_2  | Single_trend  | Single_rangeF  | Single_rangeB     | Single_prec1_1000on__before |Single_prec2_1000off_back_after|
      | test其他_Other_2         | Radar_2635    | Funnel_2858    |Matrixheatmap_2660 | Matrixheatmap_2661          |    Table_Test                 |

    @reportTimechartCreate
    Examples:
      |    name           |   chart1              |    chart2               |    chart3             |     chart4            | chart5              |
      | test_timechart_1  | timechart_3096_scatter| timechart_3097_scatter  | timechart_3099_column |  timechart_3092_line  |timechart_3093_line  |
      | test_timechart_2  | timechart_3247_line   | timechart_3248_area     | timechart_3249_scatter| timechart_3250_column |timechart_3095_area  |
#      | test_timechart_3  | timechart_column_pile | timechart_area_pile     |                       |                       |                     |
      | test_sparkline    | sparkline             |                         |                       |                       |                     |

  @downloadReportTrend
  Scenario Outline: check_type_pdf
    When I set the parameter "TextFilter" with value "<name>"
    And I wait for loading invisible
    And the data name is "{'column':'1','name':'<name>'}" then i click the "<name>" button
    And I wait for element "SelectedReport" change text to "<name>"
    Then I will see the element "LastGeneratedReport" contains ".pdf"
    And I click the "Download" button
    And I wait for "4000" millsecond
    And I download the latest report to local
    And I wait for "4000" millsecond

    Examples:
      |          name                  |
      | test序列_Order_1               |
      | test序列_Order_2               |
      | test序列_Order_3               |
      | test序列_Order_4               |
#      | test序列_Order_4_分面          |
      | test维度_Dimension_1           |
      | test维度_Dimension_2           |
      | test维度_Dimension_3           |
      | test维度_Dimension_4           |
      | test维度_Dimension_5           |
#      | test维度_Dimension_6_分面      |
      | test关系_Connection_1          |
      | test关系_Connection_2          |
      | test复合_Compound_1            |
      | test地图_Map_1                 |
      | test地图_Map_2                 |
#      | test地图_Map_3_n               |
      | test地图_Map_white             |
#      | test地图_分面                  |
      | test其他_Other_1               |
#      | test其他_Other_3               |
#      | test其他_Other_chain           |
#      | test其他_Other_分面            |
#      | test其他_Other_liquid          |
      | test其他_Other_2               |
      | test其他_Other_Single_1        |
      | test其他_Other_Single_2        |
      | test其他_Other_2               |
      | test_timechart_1               |
      | test_timechart_2               |
#      | test_timechart_3               |
      | test_sparkline                 |


Feature: 报表_删除

  Scenario Outline: delete_report
    When open the "report.ListPage" page for uri "/reports/"
    And I wait for loading invisible
    And I set the parameter "SearchInput" with value "<name>"
    And I wait for loading invisible
    And the data name is "{'column':'1','name':'<name>'}" then i click the "删除" button
    And I wait for "Message" will be visible
    Then I will see the message "此操作将删除 [<name>], 是否继续？"
    When I click the "EnsureButton" button
    And I wait for "500" millsecond
    And I wait for "Message" will be visible
    Then I will see the message "删除成功"
    And I click the "EnsureButton" button

    @cleanReport @cleanAllReports
    Examples:
      |   name                |
      |  test_report_EXCEL    |
      |  test_report_URL      |
      |  test_report_PDF      |
      |  test_report_crontab  |
      |  test_report_每月     |
      |  test_report_每周     |
      |  test_report_每天     |

    @cleanReport @cleanAllReports
    Examples:
      |   name                |
      |  test_downFirst       |
      |  test_upLast          |
      |  test_downBottomFirst |
      |  test_upTopLast       |
      |  test_deleteFirst     |
      |  test_deleteLast      |
      |  test_10trends        |
      |  test_5trends         |

    @cleanReportFromTrend
    Examples:
      |          name                  |
      | test序列_Order_1               |
      | test序列_Order_2               |
      | test序列_Order_3               |
      | test序列_Order_4               |
      | test维度_Dimension_1           |
      | test维度_Dimension_2           |
      | test维度_Dimension_3           |
      | test维度_Dimension_4           |
      | test维度_Dimension_5           |
      | test维度_Dimension_6_分面      |
      | test关系_Connection_1          |
      | test关系_Connection_2          |
      | test复合_Compound_1            |
      | test地图_Map_1                 |
      | test地图_Map_2                 |
      | test地图_Map_3_n               |
      | test地图_Map_white             |
      | test其他_Other_1               |
      | test其他_Other_2               |
      | test其他_Other_3               |
      | test其他_Other_ring            |
      | test其他_Other_Single_1        |
      | test其他_Other_Single_2        |
      | test其他_Other_chain           |
      | test其他_Other_liquid          |
      | test其他_Other_sparkline       |
      | test_timechart_1               |
      | test_timechart_2               |
      | test_timechart_3               |



  @cleanReport @cleanReportPDF @cleanReportCharts @cleanAllReports
  Scenario Outline: delete_report_charts_pdf
    When open the "report.ListPage" page for uri "/reports/"
    And I wait for loading invisible
    And I set the parameter "SearchInput" with value "<name>_PDF"
    And I wait for loading invisible
    And the data name is "{'column':'1','name':'<name>_PDF'}" then i click the "删除" button
    Then I will see the message "此操作将删除 [<name>_PDF], 是否继续？"
    When I click the "EnsureButton" button
    And I wait for "500" millsecond
    And I wait for "Message" will be visible
    Then I will see the message "删除成功"
    And I click the "EnsureButton" button

    Examples:
      |          name        |
      |   LineChart          |
      |   AreaChart          |
      |   AreaChart_Pile     |
      |   ColumnChart_Pile   |
      |   ScatterChart       |
      |   Timechart1         |
      |   Timechart2         |
      |   Pie                |
      |   Rose               |
      |   Bar                |
      |   Sun                |
      |   Bar1               |
      |   Bar2               |
      |   Sunburst           |
      |   Pie_1              |
      |   Pie_2              |
      |   Flame              |
      |   Chord              |
      |   Sankey             |
      |   Force              |
      |   Sankey_Mult        |
      |   Rangeline          |
      |   Multiaxis          |
      |   Multiaxis_2        |
      |   Heatmap            |
      |   Attackmap_World    |
      |   Attackmap_China    |
      |   Regionmap_World    |
      |   Regionmap_China    |
      |   Regionmap_Jiangsu_1|
      |   Regionmap_Jiangsu_2|
      |   Single             |
      |   Single_icon        |
      |   Single_font        |
      |   Single_range_backgr|
      |   Ring_1             |
      |   Ring_2             |
      |   Liquidfill         |
      |   Wordcloud          |
      |   Radar              |
      |   Funnel             |
      |   Matrixheatmap      |
      |   Table              |

  @cleanReportEXCEL @cleanReportCharts @cleanAllReports
  Scenario Outline: delete_report_charts_excel
    When open the "report.ListPage" page for uri "/reports/"
    And I wait for loading invisible
    And I set the parameter "SearchInput" with value "<name>_EXCEL"
    And I wait for loading invisible
    And the data name is "{'column':'1','name':'<name>_EXCEL'}" then i click the "删除" button
    Then I will see the message "此操作将删除 [<name>_EXCEL], 是否继续？"
    When I click the "EnsureButton" button
    And I wait for "500" millsecond
    Then I will see the message "删除成功"
    And I click the "EnsureButton" button

    Examples:
      |          name        |
      |   LineChart          |
      |   AreaChart          |
      |   AreaChart_Pile     |
      |   ColumnChart_Pile   |
      |   ScatterChart       |
      |   Timechart1         |
      |   Timechart2         |
      |   Pie                |
      |   Rose               |
      |   Bar                |
      |   Sun                |
      |   Bar1               |
      |   Bar2               |
      |   Sunburst           |
      |   Pie_1              |
      |   Pie_2              |
      |   Flame              |
      |   Chord              |
      |   Sankey             |
      |   Force              |
      |   Sankey_Mult        |
      |   Rangeline          |
      |   Multiaxis          |
      |   Multiaxis_2        |
      |   Heatmap            |
      |   Attackmap_World    |
      |   Attackmap_China    |
      |   Regionmap_World    |
      |   Regionmap_China    |
      |   Regionmap_Jiangsu_1|
      |   Regionmap_Jiangsu_2|
      |   Single             |
#      |   Single_icon        |
#      |   Single_font        |
      |   Single_range_backgr|
      |   Ring_1             |
      |   Ring_2             |
      |   Liquidfill         |
      |   Wordcloud          |
      |   Radar              |
      |   Funnel             |
      |   Matrixheatmap      |
      |   Table              |

  @cleanReportWORD @cleanReportCharts @cleanAllReports
  Scenario Outline: delete_report_charts_word
    When open the "report.ListPage" page for uri "/reports/"
    And I wait for loading invisible
    And I set the parameter "SearchInput" with value "<name>_WORD"
    And I wait for loading invisible
    And the data name is "{'column':'1','name':'<name>_WORD'}" then i click the "删除" button
    Then I will see the message "此操作将删除 [<name>_WORD], 是否继续？"
    When I click the "EnsureButton" button
    And I wait for "500" millsecond
    Then I will see the message "删除成功"
    And I click the "EnsureButton" button

    Examples:
      |          name        |
      |   LineChart          |
      |   AreaChart          |
      |   AreaChart_Pile     |
      |   ColumnChart_Pile   |
      |   ScatterChart       |
      |   Timechart1         |
      |   Timechart2         |
      |   Pie                |
      |   Rose               |
      |   Bar                |
      |   Sun                |
      |   Bar1               |
      |   Bar2               |
      |   Sunburst           |
      |   Pie_1              |
      |   Pie_2              |
      |   Flame              |
      |   Chord              |
      |   Sankey             |
      |   Force              |
      |   Sankey_Mult        |
      |   Rangeline          |
      |   Multiaxis          |
      |   Multiaxis_2        |
      |   Heatmap            |
      |   Attackmap_World    |
      |   Attackmap_China    |
      |   Regionmap_World    |
      |   Regionmap_China    |
      |   Regionmap_Jiangsu_1|
      |   Regionmap_Jiangsu_2|
      |   Single             |
      |   Single_icon        |
      |   Single_font        |
      |   Single_range_backgr|
      |   Ring_1             |
      |   Ring_2             |
      |   Liquidfill         |
      |   Wordcloud          |
      |   Radar              |
      |   Funnel             |
      |   Matrixheatmap      |
      |   Table              |
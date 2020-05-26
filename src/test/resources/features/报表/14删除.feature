@clean
Feature: 报表_删除

  Scenario Outline: delete_report
    When open the "report.ListPage" page for uri "/reports/"
    And I set the parameter "SearchInput" with value "<name>"
    And I wait for "Loading" will be invisible
    And the data name is "{'column':'1','name':'<name>'}" then i click the "删除" button
    Then I will see the message "此操作将删除 [<name>], 是否继续？"
    When I click the "EnsureButton" button
    And I wait for "500" millsecond
    Then I will see the message "删除成功"
    And I click the "EnsureButton" button

    @cleanReport @cleanKate
    Examples:
      |   name                |
      |  test_report_EXCEL    |
      |  test_report_URL      |
      |  test_report_PDF      |
      |  test_report_crontab  |
      |  test_report_每月     |
      |  test_report_每周     |
      |  test_report_每天     |

    @cleanReport @cleanKate
    Examples:
      |   name                |
      |  test_downFirst       |
      |  test_upLast          |
      |  test_downBottomFirst |
      |  test_upTopLast       |
      |  test_deleteFirst     |
      |  test_deleteLast      |
      |  test_10trends        |

    @cleanReportFromTrend @cleanReportTimechart
    Examples:
      |    name               |
      | test_timechart_1      |
      | test_timechart_2      |
      | test_timechart_3      |


    @cleanReportFromTrend @cleanReportOther
    Examples:
      |    name               |
      |test其他_Other_Single_2|
      |test其他_Other_Single_1|
      | test其他_Other_ring   |
      | test其他_Other_3      |
      | test其他_Other_2      |
      | test其他_Other_1      |

    @cleanReportFromTrend @cleanReportMap
    Examples:
      |    name               |
      | test地图_Map_3        |
      | test地图_Map_2        |
      | test地图_Map_1        |

    @cleanReportFromTrend @cleanReportCompound
    Examples:
      |    name               |
      | test复合_Compound_1   |

    @cleanReportFromTrend @cleanReportConnection
    Examples:
      |    name               |
      | test关系_Connection_2 |
      | test关系_Connection_1 |

    @cleanReportFromTrend @cleanReportOrder
    Examples:
      |    name               |
      | test序列_Order_4      |
      | test序列_Order_3      |
      | test序列_Order_2      |
      | test序列_Order_1      |

    @cleanReportFromTrend @cleanReportDimension
    Examples:
      |    name               |
      | test维度_Dimension_5  |
      | test维度_Dimension_4  |
      | test维度_Dimension_3  |
      | test维度_Dimension_2  |
      | test维度_Dimension_1  |



  @cleanReport @cleanReportPDF @cleanReportCharts @cleanKate
  Scenario Outline: delete_report_charts_pdf
    When open the "report.ListPage" page for uri "/reports/"
    And I set the parameter "SearchInput" with value "<name>_PDF"
    And I wait for "Loading" will be invisible
    And the data name is "{'column':'1','name':'<name>_PDF'}" then i click the "删除" button
    Then I will see the message "此操作将删除 [<name>_PDF], 是否继续？"
    When I click the "EnsureButton" button
    And I wait for "500" millsecond
    Then I will see the message "删除成功"
    And I click the "EnsureButton" button

    Examples:
      |          name        |
      |   Table              |
      |   Matrixheatmap      |
      |   Funnel             |
      |   Radar              |
      |   Wordcloud          |
      |   Liquidfill         |
      |   Single_range_backgr|
      |   Single_font        |
      |   Single_icon        |
      |   Single             |
      |   Regionmap_Jiangsu  |
      |   Regionmap_China    |
      |   Regionmap_World    |
      |   Attackmap_China    |
      |   Attackmap_World    |
      |   Heatmap            |
      |   Multiaxis          |
      |   Rangeline          |
      |   Sankey_Mult        |
      |   Force              |
      |   Sankey             |
      |   Chord              |
      |   Bar2               |
      |   Bar1               |
      |   Sun                |
      |   Bar                |
      |   Rose               |
      |   Pie                |
      |   ScatterChart       |
      |   ColumnChart_Pile   |
      |   AreaChart_Pile     |
      |   AreaChart          |
      |   LineChart          |

  @cleanReportEXCEL @cleanReportCharts
  Scenario Outline: delete_report_charts_excel
    When open the "report.ListPage" page for uri "/reports/"
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
      |   Table              |
      |   Matrixheatmap      |
      |   Funnel             |
      |   Radar              |
      |   Wordcloud          |
      |   Liquidfill         |
      |   Single_range_backgr|
#      |   Single_font        |
#      |   Single_icon        |
      |   Single             |
      |   Regionmap_Jiangsu  |
      |   Regionmap_China    |
      |   Regionmap_World    |
      |   Attackmap_China    |
      |   Attackmap_World    |
      |   Heatmap            |
      |   Multiaxis          |
      |   Rangeline          |
      |   Sankey_Mult        |
      |   Force              |
      |   Sankey             |
      |   Chord              |
      |   Bar2               |
      |   Bar1               |
      |   Sun                |
      |   Bar                |
      |   Rose               |
      |   Pie                |
      |   ScatterChart       |
      |   ColumnChart_Pile   |
      |   AreaChart_Pile     |
      |   AreaChart          |
      |   LineChart          |

  @cleanReportData
  Scenario Outline: delete
    Given open the "trend.ListPage" page for uri "/trend/"
    When I set the parameter "SearchInput" with value "<name>"
    And I wait for loading invisible
    And the data name is "{'column':'0','name':'<name>'}" then i click the "删除" button
    Then I will see the message "确认删除 [<name>] ?"
    When I click the "EnsureButton" button
    Then I will see the success message "删除成功"

    Examples:
      |   name                 |
      | table_Order            |
      | table_Dimension        |
      | table_Sun              |
      | table_Chord            |
      | table_Sankey           |
      | table_Force            |
      | table_Sankey_Mult      |
      | table_Rangeline        |
      | table_Multiaxis        |
      | table_Heatmap          |
      | table_Regionmap        |
      | table_Attackmap_World  |
      | table_Attackmap_China  |
      | table_Regionmap_Jiangsu|
      | table_Single           |
      | table_Wordcloud        |
      | table_Radar_Matr       |
      | table_Funnel           |
      | table_Single_Range     |
      | table_Liquidfill       |




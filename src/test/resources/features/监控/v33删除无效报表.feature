@dellagacyreport
Feature: 删除冗余报表

  Scenario Outline: 删除冗余报表
    When open the "report.ListPage" page for uri "/reports/"
    And I set the parameter "SearchInput" with value "<name>"
    And I wait for "2000" millsecond
    And the data name is "{'column':'1','name':'<name>'}" then i click the "删除" button
    Then I will see the message "此操作将删除 [<name>], 是否继续？"
    When I click the "EnsureButton" button
    And I wait for "500" millsecond
    Then I will see the message "删除成功"
    And I click the "EnsureButton" button

    Examples:
      | name |
      |word_empty|
      |topic|
      |tab|
      |evthue|
      |evday|
      |evmont|
      |test123|
      |test_trend|
      |timechart_report134|
      |report_source134|
      |test134|
      |test_134_mod|
      |report134|
      |report_bar|
      |line|
      |area|
      |scatter|
      |bars |
      |connections|
      |sankey|
      |connections_copy|
      |powermap|
      |interval|
      |manyY|
      |attackmap|
      |zonemap|
      |singlevalue|
      |wordcloud|
      |sequence|
      |radar|
      |funnel|
      |heatgraph|
      |piediagram|
      |rosediagram|
      |bardiagram1|
      |bardiagram2|
      |bardiagram3|
      |bardiagram4|
      |bardiagram5 |
      |bardiagramDefaultColorOut|
      |bardiagramDefaultColorInside|
      |bardiagramDefaultColorOutside2|
      |test_bar_diagram|
      |red bar diagram|
      |sundiagram|
      |sundiagramcolor|
      |chain|
      |test1|
      |test123|
      |sequence|
      |graphs1|
      |test1|
      |graphs2|
      |graphs3|
      |graphs1 - url|
      |graphs2 - url|
      |graphs3 - url|
      |graphs1 - xls|
      |graphs2 - xls|
      |graphs3 - xls|
      |bar test|
      |test_bar_changed|
      |limit|
      |lim|
      |report123|
      |改为雷达图sample2|
      |single_trend|
      |xls|
      |url_report|
      |sun_test|
      |test|
      |test_change|
      |test|
      |LineChart_PDF|
      |Multiaxis_PDF|
      |AreaChart_PDF|
      |Radar_PDF|
      |Test_Tag|
      |test_report_每周|
      |test_report_每月|
      |test1|
      |Multiaxis_PDF|
      |LineChart_PDF|
      |test|
      |test_bold|
      |test_colors_bold|
      |zdv|
      |昨日全站清分日报|
      |lvtest|
      |gc_test|
      |LineChart_PDF|
      |LineChart_PDF|
      |AreaChart_PDF|
      |LineChart_EXCEL|
      |AreaChart_EXCEL|
      |AreaChart_Pile_PDF|
      |ColumnChart_Pile_PDF|
      |AreaChart_Pile_EXCEL|
      |ColumnChart_Pile_EXCEL|
      |ScatterChart_PDF|
      |ScatterChart_EXCEL|
      |Pie_PDF|
      |Rose_PDF|
      |Bar_PDF|
      |Pie_EXCEL|
      |Rose_EXCEL|
      |Bar_EXCEL|
      |Sun_PDF|
      |Sun_EXCEL|
      |Bar1_PDF|
      |Bar2_PDF|
      |Bar1_EXCEL|
      |Bar2_EXCEL|
      |Chord_PDF|
      |Sankey_PDF|
      |Chord_EXCEL|
      |Sankey_EXCEL|
      |Force_PDF|
      |Force_EXCEL|
      |Sankey_Mult_PDF|
      |Sankey_Mult_EXCEL|
      |Rangeline_PDF|
      |Rangeline_EXCEL|
      |Multiaxis_PDF|
      |Multiaxis_EXCEL|
      |Heatmap_PDF|
      |Heatmap_EXCEL|
      |Attackmap_World_PDF|
      |Attackmap_China_PDF|
      |Attackmap_World_EXCEL|
      |Attackmap_China_EXCEL|
      |Regionmap_World_PDF|
      |Regionmap_China_PDF|
      |Regionmap_Jiangsu_PDF|
      |Regionmap_World_EXCEL|
      |Regionmap_China_EXCEL|
      |Regionmap_Jiangsu_EXCEL|
      |Single_PDF|
      |Single_EXCEL|
      |Single_icon_PDF|
      |Single_font_PDF|
      |Single_range_backgr_PDF|
      |Single_range_backgr_EXCEL|
      |Liquidfill_PDF|
      |Liquidfill_EXCEL|
      |Wordcloud_PDF|
      |Wordcloud_EXCEL|
      |Radar_PDF|
      |Radar_EXCEL|
      |Funnel_PDF|
      |Funnel_EXCEL|
      |Matrixheatmap_EXCEL|
      |Table_PDF|
      |Table_EXCEL|
      |test_hf|
      |AutoTestCreate|
      |test_123|
      |AutoTestCreate|
      |test|
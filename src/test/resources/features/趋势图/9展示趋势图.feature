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
    And take part of "ChartView" with name "actual/<name>"
    And I compare source image "actual/<name>" with target image "expect/<name>"

    @viewTrendOrder @trendView
    Examples:
      | name                                     |
      | ColumnChart_分面                         |
      | ScatterChart_分面                        |
      | AreaChart_分面                           |
      | LineChart_分面                           |
      | ScatterChart_2492_limit                  |
      | ColumnChart_2500_limit                   |
      | AreaChart_2483_ConnectEmptyData          |
      | AreaChart_2483_Smooth                    |
      | LineChart_2479_ConnectEmptyData          |
      | LineChart_2479_Smooth                    |
      | ScatterChart_bubbles                     |
      | ColumnChart_Pile                         |
      | AreaChart_Pile                           |
      | ColumnChart_2499                         |
      | ScatterChart_2491                        |
      | AreaChart_2005                           |
      | LineChart_2477                           |

    @viewTrendDimension @trendView
    Examples:
      | name                                     |
      | Flame_图外钻取_分面                      |
      | Flame_图内钻取                           |
      | Sun_分面                                 |
      | Bar_展示全部_分面                        |
      | Rose_只展示名称_分面                     |
      | Pie_展示全部_分面                        |
      | Rose_展示全部                            |
      | Pie_展示全部                             |
      | Rose_只展示名称                          |
      | Pie_只展示名称                           |
      | Bar_不展示                               |
      | Rose_不展示                              |
      | Pie_不展示                               |
      | Bar_展示全部_柱状内靠右侧                 |
      | Bar_展示全部_柱状内靠左侧                 |
      | Bar_展示全部_柱状内中央                   |
      | Bar_展示全部_柱状外右侧                   |
      | Bar_展示全部_柱状外左侧                   |
      | Bar_展示全部_柱状外两侧                   |
      | Bar_只展示名称_柱状内靠右侧               |
      | Bar_只展示名称_柱状内靠左侧               |
      | Bar_只展示名称_柱状内中央                 |
      | Bar_只展示名称_柱状外右侧                 |
      | Bar_只展示名称_柱状外左侧                 |
      | Sun_2850                                 |
      | Bar_2676                                 |
      | Rose_2858                                |
      | Pie_2503                                 |




    @viewTrendCompound @trendView
    Examples:
      | name                                     |
      | Multiaxis_4841                           |
      | Multiaxis_2523                           |
      | Rangeline_2516                           |

    @viewTrendMap @trendView
    Examples:
      | name                                     |
      | Regionmap_分面                           |
      | Heatmap_分面                             |
      | Regionmap_Jiangsu_2547_white             |
      | Regionmap_China_2546_white               |
      | Regionmap_2545_white                     |
      | Regionmap_Jiangsu_2547                   |
      | Regionmap_China_2546                     |
      | Attackmap_China_2543                     |
      | Attackmap_World_2542                     |
      | Regionmap_2545                           |
      | Heatmap_2539                             |






    @viewTrendTimechart @trendView
    Examples:
      | name                                     |
      | sparkline                                |
      | timechart_area_pile                      |
      | timechart_column_pile                    |
      | timechart_3250_column                    |
      | timechart_3249_scatter                   |
      | timechart_3248_area                      |
      | timechart_3247_line                      |
      | timechart_3099_column                    |
      | timechart_3097_scatter                   |
      | timechart_3096_scatter                   |
      | timechart_3095_area                      |
      | timechart_3093_line                      |
      | timechart_3092_line                      |

    @viewTrendStatistics
    Examples:
      | name                        |
      | 807_事件计数_曲线图         |
      | 808_事件计数_面积图         |
      | 810_事件计数_散点图         |
      | 809_事件计数_柱状图         |
      | 2718_事件计数_独立数统计    |
      | 812_时间分段_计数           |
      | 813_时间分段_独立数         |
      | 2721_时间分段_总计          |
      | 2722_时间分段_平均值        |
      | 2723_时间分段_最大值        |
      | 2724_时间分段_最小值        |
      | 814_数值分段_整数           |
      | 3137_数值分段_实数          |
      | 815_1h                      |
      | 815_3600s                   |
      | 815_60m                     |
      | 816_500                     |
      | 816_1000                    |
      | 817_饼图_5                  |
      | 817_饼图_20                 |
      | 817_条形图_10               |
      | 817_条形图_50               |
      | 2725_7d                     |
      | 2725_1w                     |
      | 2727_总计_曲线图_1小时      |
      | 2727_平均值_面积图_60分钟   |
      | 2727_最大值_散点图_60分钟   |
      | 2727_最小值_柱状图_3600秒   |
      | 2727_总计_曲线图_7天        |
      | 2727_平均值_面积图_1周      |
      | 2727_柱状图_1_clientip      |
      | 819_累计百分比_80_75        |
      | 2730_累计百分比_实数        |
      | 821_百分位等级_100          |
      | 3136_百分位等级_1262-50     |
      | 822_chart_step1             |
      | 822_chart_step2             |
      | 822_chart_step3	            |
      | 825_world                   |
      | 825_china                   |
      | 825_sichuan                 |

  Scenario Outline: compare_view_element
    Given open the "trend.ListPage" page for uri "/trend/"
    When I set the parameter "SearchInput" with value "<name>"
    And I wait for "2000" millsecond
    And the data name is "{'column':'0','name':'<name>'}" then i click the "展示趋势图" button
    And switch to window "查看趋势图"
    And I close all tabs except main tab
    Then I will see the "trend.ViewPage" page
    And I wait for "ChartName" will be visible
    And I wait for "ChartView" will be visible
    And I will see the element "ChartName" contains "<name>"
    Then I will see the "trend.CreatePage" page
    And I wait for "<element>" will be visible
    And I wait for "3000" millsecond
    And take part of "StatisticalChart" with name "actual/<name>"
    And I compare source image "actual/<name>" with target image "expect/<name>"

    @viewTrendConnection @trendView
    Examples:
      | name                                     | element                      |
      | Force_分面                               | ForceElement                 |
      | Sankey_分面                              | SankeyElement                |
      | Chord_分面                               | ChordElement                 |
      | Sankey_Multistage                        | SankeyElement                |
      | Force_repulsion                          | ForceElement                 |
      | Force_2511                               | ForceElement                 |
      | Sankey_2507                              | SankeyElement                |
      | Chord_2505                               | ChordElement                 |

    @viewTrendStatMap @trendView
    Examples:
      | name                                     | element                   |
      | Statisticalmap_2098_param                | MapSettings               |
      | Statisticalmap_2098                      | MapSettings               |
      | Statisticalmap_2797_param                | MapSettings               |
      | Statisticalmap_2797                      | MapSettings               |
      | Statisticalmap_Google                    | MapSettings               |
      | Statisticalmap_Gtimg                     | MapSettings               |
      | Statisticalmap_OSM                       | MapSettings               |
      | Statisticalmap_Amap                      | MapSettings               |
      | Statisticalmap_ArcGIS                    | MapSettings               |

    @viewTrendOther @trendView
    Examples:
      | name                            |    element               |
      | sunburst                        | SunElement               |
      | NetworkNode                     | NetworkElement           |
      | Chain_2831_tree                 | ChainTreeElement         |
      | Chain_2982_tree                 | ChainTreeElement         |
      | Table_Test                      | Header                   |
      | Sequence_2805                   | SequenceElement          |
      | Chain_2982                      | ChainTableElement        |
      | Chain_2831                      | ChainTableElement        |
      | Matrixheatmap_2661              | MatrixheatmapElement     |
      | Matrixheatmap_2660              | MatrixheatmapElement     |
      | Funnel_2858                     | FunnelElement            |
      | Radar_2635                      | RadarElement             |
      | Liquidfill_分面                 | LiquidfillElement        |
      | Liquidfill_percent              | LiquidfillElement        |
      | Ring_table_1r_3c_colors         | RingElement_1            |
      | Ring_table_1r_4c                | RingElement_1            |
      | Ring_table_3r_2c                | RingElement_1            |
      | Ring_twofields                  | RingElement_1            |
      | Ring_onefield                   | RingElement_1            |
      | Single_仅展示字段               | SingleElement            |
      | Single_仅数值字段               | SingleElement            |
      | Single_Sparkline_分面           | SingleElement            |
      | Single_Sparkline_Background     | SingleElement            |
      | Single_prec2_1000off_back_after | SingleElement            |
      | Single_prec1_1000on__before     | SingleElement            |
      | Single_rangeB                   | SingleElement            |
      | Single_rangeF                   | SingleElement            |
      | Single_trend                    | SingleElement            |
      | Single_backgr                   | SingleElement            |
      | Single_cnt                      | SingleElement            |
      | Single_icon                     | SingleElement            |
      | Funnel_2654                     | FunnelElement            |
      | Radar_2633                      | RadarElement             |
      | Wordcloud_分面                  | WordcloudElement         |
      | Wordcloud_2625                  | WordcloudElement         |
      | Single_2549                     | SingleElement            |











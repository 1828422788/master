@trendView
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

    @viewTrendOrder
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

    @viewTrendDimension
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


    @viewTrendConnection
    Examples:
      | name                                     |
#      | Force_分面                               |
      | Sankey_分面                              |
      | Chord_分面                               |
      | Sankey_Multistage                        |
#      | Force_repulsion                          |
#      | Force_2511                               |
      | Sankey_2507                              |
      | Chord_2505                               |

    @viewTrendCompound
    Examples:
      | name                                     |
      | Multiaxis_4841                           |
      | Multiaxis_2523                           |
      | Rangeline_2516                           |

    @viewTrendMap
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

    @viewTrendStatMap
    Examples:
      | name                                     |
      | Statisticalmap_2098_param                |
      | Statisticalmap_2098                      |
      | Statisticalmap_2797_param                |
      | Statisticalmap_2797                      |
      | Statisticalmap_Google                    |
      | Statisticalmap_Gtimg                     |
      | Statisticalmap_OSM                       |
      | Statisticalmap_Amap                      |
      | Statisticalmap_ArcGIS                    |


    @viewTrendOther
    Examples:
      | name                            |
      | sunburst                        |
      | NetworkNode                     |
      | Chain_2831_tree                 |
      | Chain_2982_tree                 |
      | Table_Test                      |
      | Sequence_2805                   |
      | Chain_2982                      |
      | Chain_2831                      |
      | Matrixheatmap_2661              |
      | Matrixheatmap_2660              |
      | Funnel_2858                     |
      | Radar_2635                      |
      | Liquidfill_分面                 |
      | Liquidfill_percent              |
      | Ring_table_1r_3c_colors         |
      | Ring_table_1r_4c                |
      | Ring_table_3r_2c                |
      | Ring_twofields                  |
      | Ring_onefield                   |
      | Single_仅展示字段               |
      | Single_仅数值字段               |
      | Single_Sparkline_分面           |
      | Single_Sparkline_Background     |
      | Single_prec2_1000off_back_after |
      | Single_prec1_1000on__before     |
      | Single_rangeB                   |
      | Single_rangeF                   |
      | Single_trend                    |
      | Single_backgr                   |
      | Single_font2                    |
      | Single_font1                    |
      | Single_cnt                      |
      | Single_icon                     |
      | Funnel_2654                     |
      | Radar_2633                      |
#      | Wordcloud_分面                  |
#      | Wordcloud_2625                  |
      | Single_2549                     |

    @viewTrendTimechart
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









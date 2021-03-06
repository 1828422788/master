@cleanTrend
Feature: 趋势图删除（RZY-1891）

  Scenario Outline: delete
    Given open the "trend.ListPage" page for uri "/trend/"
    When I set the parameter "TextFilter" with value "<name>"
    And I wait for "2000" millsecond
    And the data name is "{'column':'0','name':'<name>'}" then i click the "删除" button
    Then I will see the message "确认删除 [<name>] ?"
    When I click the "EnsureButton" button
    Then I will see the success message "删除成功"

    @cleanTrendOrder
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

    @cleanTrendDimension
    Examples:
      | name                                     |
      | Pie_3                                    |
      | Pie_2                                    |
      | Flame_DrillOut_分面                      |
      | Flame_DrillIn                            |
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

    @cleanTrendConnection
    Examples:
      | name                                     |
      | Force_分面                               |
      | Sankey_分面                              |
      | Chord_分面                               |
      | Sankey_Multistage                        |
      | Force_repulsion                          |
      | Force_2511                               |
      | Sankey_2507                              |
      | Chord_2505                               |

    @cleanTrendCompound
    Examples:
      | name                                     |
      | Multiaxis_4841                           |
      | Multiaxis_2523                           |
      | Rangeline_2516                           |

    @cleanTrendStatMap
    Examples:
      | name                                     |
      | Geostatsmap_Google                    |
      | Geostatsmap_Gtimg                     |
      | Geostatsmap_OSM                       |
      | Geostatsmap_Amap                      |
      | Geostatsmap_ArcGIS                    |
      | Geostatsmap_2098_param                |
      | Geostatsmap_2098                      |
      | Geostatsmap_2797_param                |
      | Geostatsmap_2797                      |

    @cleanTrendMap
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

    @cleanTrendOther
    Examples:
      | name                                     |
      | sunburst                                 |
      | NetworkNode                              |
      | Chain_2831_tree                          |
      | Chain_2982_tree                          |
      | Table_Test                               |
      | Sequence_2805                            |
      | Chain_2982                               |
      | Chain_2831                               |
      | Matrixheatmap_2661                       |
      | Matrixheatmap_2660                       |
      | Funnel_2858                              |
      | Radar_2635                               |
      | Liquidfill_分面                          |
      | Liquidfill_percent                       |
      | Ring_table_1r_3c_colors                  |
      | Ring_table_1r_4c                         |
      | Ring_table_3r_2c                         |
      | Ring_twofields                           |
      | Ring_onefield                            |
      | Single_仅展示字段                        |
      | Single_仅数值字段                        |
      | Single_Sparkline_分面                    |
      | Single_Sparkline_Background              |
      | Single_prec2_1000off_back_after          |
      | Single_prec1_1000on__before              |
      | Single_rangeB                            |
      | Single_rangeF                            |
      | Single_trend                             |
      | Single_backgr                            |
      | Single_cnt                               |
      | Single_icon                              |
      | Funnel_2654                              |
      | Radar_2633                               |
      | Wordcloud_分面                           |
      | Wordcloud_2625                           |
      | Single_2549                              |

    @cleanTrendTimechart
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

    @cleanTrendStatistics
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










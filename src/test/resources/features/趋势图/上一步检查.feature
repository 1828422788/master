Feature: 趋势图_上一步

  Scenario Outline: check_button_back
    Given open the "trend.ListPage" page for uri "/trend/"
    When I set the parameter "TextFilter" with value "<name>"
    And I wait for "2000" millsecond
    When the data name is "<name>" then i click the "编辑" button
    And I will see the "trend.CreatePage" page
    And I wait for "Header" will be visible
    And I click the "NextButton" button
    And I wait for "1000" millsecond
    And I wait for "<element>" will be visible
    And I click the "NextButton" button
    And I wait for "NameInput" will be visible
    And I click the "BackButton" button
    And I wait for "<element>" will be visible
    And I wait for "3000" millsecond
    And I click the "NextButton" button
    And I will see the input element "NameInput" value will be "<name>"

    @trendBackOrder @trendBack
    Examples:
      | name                                     | element     |
      | ColumnChart_分面                         | Type        |
      | ScatterChart_分面                        | Type        |
      | AreaChart_分面                           | Type        |
      | LineChart_分面                           | Type        |
      | ScatterChart_2492_limit                  | Type        |
      | ColumnChart_2500_limit                   | Type        |
      | AreaChart_2483_ConnectEmptyData          | Type        |
      | AreaChart_2483_Smooth                    | Type        |
      | LineChart_2479_ConnectEmptyData          | Type        |
      | LineChart_2479_Smooth                    | Type        |
      | ScatterChart_bubbles                     | Type        |
      | ColumnChart_Pile                         | Type        |
      | AreaChart_Pile                           | Type        |
      | ColumnChart_2499                         | Type        |
      | ScatterChart_2491                        | Type        |
      | AreaChart_2005                           | Type        |
      | LineChart_2477                           | Type        |

    @trendBackDimension @trendBack
    Examples:
      | name                                     | element     |
      | Flame_图外钻取_分面                      | Type        |
      | Sun_分面                                 | Type        |
      | Pie_全部展示_分面                        | Type        |
      | Pie_全部展示                             | Type        |
      | Pie_只展示名称                           | Type        |
      | Pie_不展示                               | Type        |
      | Bar_全部展示_柱状外两侧                   | Type        |
      | Bar_只展示名称_柱状外左侧                 | Type        |
      | Sun_2850                                 | Type        |
      | Pie_2503                                 | Type        |


    @trendBackConnection @trendBack
    Examples:
      | name                                     | element     |
      | Force_分面                               | Type        |
      | Sankey_分面                              | Type        |
      | Chord_分面                               | Type        |
      | Sankey_Multistage                        | Type        |
      | Force_repulsion                          | Type        |
      | Chord_2505                               | Type        |

    @trendBackCompound @trendBack
    Examples:
      | name                                     | element     |
      | Multiaxis_4841                           | Type        |
      | Multiaxis_2523                           | Type        |
      | Rangeline_2516                           | Type        |

    @trendBackMap @trendBack
    Examples:
      | name                                     | element     |
      | Regionmap_分面                           | Type        |
      | Regionmap_Jiangsu_2547_white             | Type        |
      | Regionmap_China_2546                     | Type        |
      | Attackmap_World_2542                     | Type        |
      | Heatmap_2539                             | Type        |

    @trendBackStatMap @trendBack
    Examples:
      | name                                     | element     |
      | Geostatsmap_2098_param                | Type        |
      | Geostatsmap_2797                      | Type        |
      | Geostatsmap_Google                    | Type        |


    @trendBackOther @trendBack
    Examples:
      | name                            | element     |
      | sunburst                        | Settings    |
      | NetworkNode                     | Type        |
      | Chain_2831_tree                 | Type        |
      | Table_Test                      | Type        |
      | Sequence_2805                   | Type        |
      | Chain_2982                      | Type        |
      | Matrixheatmap_2661              | Type        |
      | Funnel_2858                     | Type        |
      | Radar_2635                      | Type        |
      | Liquidfill_分面                 | Type        |
      | Ring_table_1r_3c_colors         | Type        |
      | Single_仅展示字段               | Type        |
      | Single_Sparkline_分面           | Type        |
      | Single_prec2_1000off_back_after | Type        |
      | Single_rangeB                   | Type        |
      | Single_trend                    | Type        |
      | Single_font2                    | Type        |
      | Single_icon                     | Type        |
      | Funnel_2654                     | Type        |
      | Radar_2633                      | Type        |
      | Wordcloud_2625                  | Type        |

    @trendBackTimechart @trendBack
    Examples:
      | name                                     | element   |
      | sparkline                                | Type       |
      | timechart_area_pile                      | Settings   |
      | timechart_column_pile                    | Settings   |
      | timechart_3250_column                    | Settings   |
      | timechart_3249_scatter                   | Settings   |
      | timechart_3248_area                      | Settings   |
      | timechart_3247_line                      | Settings   |
      | timechart_3099_column                    | Settings   |
      | timechart_3097_scatter                   | Settings   |
      | timechart_3096_scatter                   | Settings   |
      | timechart_3095_area                      | Settings   |
      | timechart_3093_line                      | Settings   |
      | timechart_3092_line                      | Settings   |

    @trendBackStatistics
    Examples:
      | name                        |  element    |
      | 807_事件计数_曲线图         | Chart        |
      | 2718_事件计数_独立数统计    | Chart        |
      | 812_时间分段_计数           | Chart        |
      | 2721_时间分段_总计          | Chart        |
      | 814_数值分段_整数           | Chart        |
      | 3137_数值分段_实数          | Chart        |
      | 815_1h                      | Chart        |
      | 816_500                     | Chart        |
      | 817_饼图_5                  | Chart        |
      | 817_条形图_10               | Chart        |
      | 2725_7d                     | Chart        |
      | 2727_总计_曲线图_1小时      | Chart        |
      | 2727_柱状图_1_clientip      | Chart        |
      | 819_累计百分比_80_75        | Chart        |
      | 2730_累计百分比_实数        | Chart        |
      | 821_百分位等级_100          | Chart        |
      | 3136_百分位等级_1262-50     | Chart        |
      | 822_chart_step3	            | Chart        |
      | 825_sichuan                 | Chart        |

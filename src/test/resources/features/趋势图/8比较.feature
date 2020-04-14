@compareTrend
Feature: 趋势图比较

  Scenario Outline: compare
    Given open the "trend.ListPage" page for uri "/trend/"
    When I set the parameter "SearchInput" with value "<name>"
    And I wait for loading invisible
    And the data name is "{'column':'0','name':'<name>'}" then i click the "编辑" button
    Then I will see the "trend.CreatePage" page
    And I wait for "Header" will be visible
    And I click the "NextButton" button

    And I wait for "Chart" will be visible
    And I wait for "2000" millsecond
    And take part of "Chart" with name "aftersave/<name>"
    Then I compare source image "expect/<name>.png" with target image "aftersave/<name>.png"
    And I click the "NextButton" button
    And I click the "NextButton" button
    Then I wait for "SuccessUpdate" will be visible

    @compareTrendOrder
    Examples:
      | name                                     |
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


    @compareTrendDimension
    Examples:
      | name                                     |
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
      | Bar_只展示名称_柱状内靠右侧               |
      | Bar_只展示名称_柱状内靠左侧               |
      | Bar_只展示名称_柱状内中央                 |
      | Bar_只展示名称_柱状外右侧                 |
      | Bar_只展示名称_柱状外左侧                 |
      | Sun_2850                                 |
      | Bar_2676                                 |
      | Rose_2858                                |
      | Pie_2503                                 |


    @compareTrendConnection
    Examples:
      | name                                     |
      | Sankey_Multistage                        |
      | Force_repulsion                          |
      | Force_2511                               |
      | Sankey_2507                              |
      | Chord_2505                               |

    @compareTrendCompound
    Examples:
      | name                                     |
      | Multiaxis_2523                           |
      | Rangeline_2516                           |

    @compareTrendMap
    Examples:
      | name                                     |
      | Regionmap_Jiangsu_2547                   |
      | Regionmap_China_2546                     |
      | Attackmap_China_2543                     |
      | Attackmap_World_2542                     |
      | Regionmap_2545                           |
      | Heatmap_2539                             |

    @compareTrendTimechart
    Examples:
      | name                                     |
      | timechart_3250_column                    |
      | timechart_3249_scatter                   |
      | timechart_3248_area                      |
      | timechart_3247_line                      |
      | timechart_3099_column                    |
      | timechart_3098_column                    |
      | timechart_3097_scatter                   |
      | timechart_3096_scatter                   |
      | timechart_3095_area                      |
      | timechart_3094_area                      |
      | timechart_3093_line                      |
      | timechart_3092_line                      |

  Scenario Outline: compare_others
    Given open the "trend.ListPage" page for uri "/trend/"
    When I set the parameter "SearchInput" with value "<name>"
    And I wait for loading invisible
    And the data name is "{'column':'0','name':'<name>'}" then i click the "编辑" button
    Then I will see the "trend.CreatePage" page
    And I wait for "Header" will be visible
    And I click the "NextButton" button

    And I wait for "StatisticalChart" will be visible
    And I wait for "2000" millsecond
    And take part of "StatisticalChart" with name "aftersave/<name>"
    Then I compare source image "expect/<name>.png" with target image "aftersave/<name>.png"
    And I click the "NextButton" button
    And I click the "NextButton" button
    Then I wait for "SuccessUpdate" will be visible

    @compareTrendOther
    Examples:
      | name                                     |
      | Table_Test                               |
      | Sequence_2805                            |
      | Chain_2982                               |
      | Chain_2831                               |
      | Matrixheatmap_2661                       |
      | Matrixheatmap_2660                       |
      | Funnel_2858                              |
      | Radar_2635                               |
      | Liquidfill_percent                       |
      | Ring_table_1r_3c_colors                  |
      | Ring_table_1r_4c                         |
      | Ring_table_3r_2c                         |
      | Ring_twofields                           |
      | Ring_onefield                            |
      | Single_prec2_1000off_back_after          |
      | Single_prec1_1000on__before              |
      | Single_rangeB                            |
      | Single_rangeF                            |
      | Single_trend                             |
      | Single_backgr                            |
      | Single_font2                             |
      | Single_font1                             |
      | Single_cnt                               |
      | Single_icon                              |
      | Funnel_2654                              |
      | Radar_2633                               |
      | Wordcloud_2625                           |
      | Single_2549                              |

    @compareTrendMap
    Examples:
      | name                                     |
      | Statisticalmap_2098_param                |
      | Statisticalmap_2098                      |
      | Statisticalmap_2797_param                |
      | Statisticalmap_2797                      |






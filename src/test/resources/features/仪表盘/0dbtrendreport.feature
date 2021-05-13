@dbtrendreport

Feature: 仪表盘输入项

  Scenario Outline: 新建仪表盘
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I click the "Create" button
    When I set the parameter "DashBoardName" with value "仪表盘<name>"
    And I click the "Ensure" button
    Then I will see the success message "新建仪表盘成功"
    And I wait for loading invisible
    When I set the parameter "SearchNameInput" with value "仪表盘<name>"
    And I wait for loading invisible
    And I click the detail which name is "仪表盘<name>"
    Then I will see the "dashboard.DetailPage" page
    When I set the parameter "TagName" with value "<name>"
    And I click the "EnsureCreateTagButton" button
    And I wait for loading complete
    When I click the "AddEventButton" button
    And I wait for "500" millsecond
    And I click the "AddChart" button
    And I wait for "SpinDot" will be invisible
    And I set the parameter "SearchChartInput" with value "<name>"
    And I wait for loading invisible
    And I "checked" the checkbox which name is "<name>"
    And I click the "Ensure" button
    And I back to before

    @dbTimechart
    Examples:
      | name                   |
      | Matrixheatmap_2661     |
      | sparkline              |
      | timechart_area_pile    |
      | timechart_column_pile  |
      | timechart_3250_column  |
      | timechart_3249_scatter |
      | timechart_3248_area    |
      | timechart_3247_line    |
      | timechart_3099_column  |
      | timechart_3097_scatter |
      | timechart_3096_scatter |
      | timechart_3095_area    |
      | timechart_3093_line    |
      | timechart_3092_line    |

    @dbStatistics
    Examples:
      | name                |
      | 807_事件计数_曲线图        |
      | 808_事件计数_面积图        |
      | 810_事件计数_散点图        |
      | 809_事件计数_柱状图        |
      | 2718_事件计数_独立数统计     |
      | 812_时间分段_计数         |
      | 813_时间分段_独立数        |
      | 2721_时间分段_总计        |
      | 2722_时间分段_平均值       |
      | 2723_时间分段_最大值       |
      | 2724_时间分段_最小值       |
      | 814_数值分段_整数         |
      | 3137_数值分段_实数        |
      | 815_1h              |
      | 815_3600s           |
      | 815_60m             |
      | 816_500             |
      | 816_1000            |
      | 817_饼图_5            |
      | 817_饼图_20           |
      | 817_条形图_10          |
      | 817_条形图_50          |
      | 2725_7d             |
      | 2725_1w             |
      | 2727_总计_曲线图_1小时     |
      | 2727_平均值_面积图_60分钟   |
      | 2727_最大值_散点图_60分钟   |
      | 2727_最小值_柱状图_3600秒  |
      | 2727_总计_曲线图_7天      |
      | 2727_平均值_面积图_1周     |
      | 2727_柱状图_1_clientip |
      | 819_累计百分比_80_75     |
      | 2730_累计百分比_实数       |
      | 821_百分位等级_100       |
      | 3136_百分位等级_1262-50  |
      | 822_chart_step1     |
      | 822_chart_step2     |
      | 822_chart_step3     |
      | 825_world           |
      | 825_china           |
      | 825_sichuan         |
    @viewTrendOrderdb
    Examples:
      | name                            | element             |
      | ColumnChart_分面                  | ColumnChartElement  |
      | ScatterChart_分面                 | ScatterChartElement |
      | AreaChart_分面                    | AreaChartElement    |
      | LineChart_分面                    | LineChartElement    |
      | ScatterChart_2492_limit         | BackToChart         |
      | ColumnChart_2500_limit          | BackToChart         |
      | AreaChart_2483_ConnectEmptyData | AreaChartElement    |
      | AreaChart_2483_Smooth           | AreaChartElement    |
      | LineChart_2479_ConnectEmptyData | LineChartElement    |
      | LineChart_2479_Smooth           | LineChartElement    |
      | ScatterChart_bubbles            | ScatterChartElement |
      | ColumnChart_Pile                | ColumnChartElement  |
      | AreaChart_Pile                  | AreaChartElement    |
      | ColumnChart_2499                | ColumnChartElement  |
      | ScatterChart_2491               | ScatterChartElement |
      | AreaChart_2005                  | AreaChartElement    |
      | LineChart_2477                  | LineChartElement    |

    @viewTrendDimensiondb
    Examples:
      | name              | element            |
      | Flame_DrillOut_分面 | FlameElement       |
      | Flame_DrillIn     | FlameElement       |
      | Sun_分面            | SunElement         |
      | Bar_全部展示_分面       | BarElement         |
      | Rose_只展示名称_分面     | PieElement         |
      | Pie_全部展示_分面       | PieElement         |
      | Rose_全部展示         | PieElement         |
      | Pie_全部展示          | PieElement         |
      | Rose_只展示名称        | PieElement         |
      | Pie_只展示名称         | PieElement         |
      | Bar_不展示           | BarElement         |
      | Rose_不展示          | PieNoLabelsElement |
      | Pie_不展示           | PieNoLabelsElement |
      | Bar_全部展示_柱状内靠右侧   | BarElement         |
      | Bar_全部展示_柱状内靠左侧   | BarElement         |
      | Bar_全部展示_柱状内中央    | BarElement         |
      | Bar_全部展示_柱状外右侧    | BarElement         |
      | Bar_全部展示_柱状外左侧    | BarElement         |
      | Bar_全部展示_柱状外两侧    | BarElement         |
      | Bar_只展示名称_柱状内靠右侧  | BarElement         |
      | Bar_只展示名称_柱状内靠左侧  | BarElement         |
      | Bar_只展示名称_柱状内中央   | BarElement         |
      | Bar_只展示名称_柱状外右侧   | BarElement         |
      | Bar_只展示名称_柱状外左侧   | BarElement         |
      | Sun_2850          | SunElement         |
      | Bar_2676          | BarElement         |
      | Rose_2858         | PieElement         |
      | Pie_2503          | PieElement         |

    @viewTrendConnectiondb
    Examples:
      | name              | element       |
      | Force_分面          | ForceElement  |
      | Sankey_分面         | SankeyElement |
      | Chord_分面          | ChordElement  |
      | Sankey_Multistage | SankeyElement |
      | Force_repulsion   | ForceElement  |
      | Force_2511        | ForceElement  |
      | Sankey_2507       | SankeyElement |
      | Chord_2505        | ChordElement  |

    @viewTrendCompounddb
    Examples:
      | name           | element          |
      | Multiaxis_4841 | AreaChartElement |
      | Multiaxis_2523 | AreaChartElement |
      | Rangeline_2516 | RangelineElement |

    @viewTrendMapdb
    Examples:
      | name                         | element               |
      | Regionmap_分面                 | RegionmapDarkElement  |
      | Heatmap_分面                   | HeatmapElement        |
      | Regionmap_Jiangsu_2547_white | RegionmapLightElement |
      | Regionmap_China_2546_white   | RegionmapLightElement |
      | Regionmap_2545_white         | RegionmapLightElement |
      | Regionmap_Jiangsu_2547       | RegionmapDarkElement  |
      | Regionmap_China_2546         | RegionmapDarkElement  |
      | Attackmap_China_2543         | AttackmapElement      |
      | Attackmap_World_2542         | AttackmapElement      |
      | Regionmap_2545               | RegionmapDarkElement  |
      | Heatmap_2539                 | HeatmapElement        |

    @viewTrendStatMapdb
    Examples:
      | name                   | element     |
      | Geostatsmap_2098_param | MapSettings |
      | Geostatsmap_2098       | MapSettings |
      | Geostatsmap_2797_param | MapSettings |
      | Geostatsmap_2797       | MapSettings |
      | Geostatsmap_Google     | MapSettings |
      | Geostatsmap_Gtimg      | MapSettings |
      | Geostatsmap_OSM        | MapSettings |
      | Geostatsmap_Amap       | MapSettings |
      | Geostatsmap_ArcGIS     | MapSettings |

    @viewTrendOtherdb
    Examples:
      | name                            | element              |
      | sunburst                        | SunElement           |
      | NetworkNode                     | NetworkElement       |
      | Chain_2831_tree                 | ChainTreeElement     |
      | Chain_2982_tree                 | ChainTreeElement     |
      | Table_Test                      | Header               |
      | Sequence_2805                   | SequenceElement      |
      | Chain_2982                      | ChainTableElement    |
      | Chain_2831                      | ChainTableElement    |
      | Matrixheatmap_2661              | MatrixheatmapElement |
      | Matrixheatmap_2660              | MatrixheatmapElement |
      | Funnel_2858                     | FunnelElement        |
      | Radar_2635                      | RadarElement         |
      | Liquidfill_分面                   | LiquidfillElement    |
      | Liquidfill_percent              | LiquidfillElement    |
      | Ring_table_1r_3c_colors         | RingElement_1        |
      | Ring_table_1r_4c                | RingElement_1        |
      | Ring_table_3r_2c                | RingElement_1        |
      | Ring_twofields                  | RingElement_1        |
      | Ring_onefield                   | RingElement_1        |
      | Single_仅展示字段                    | SingleElement        |
      | Single_仅数值字段                    | SingleElement        |
      | Single_Sparkline_分面             | SingleElement        |
      | Single_Sparkline_Background     | SingleElement        |
      | Single_prec2_1000off_back_after | SingleElement        |
      | Single_prec1_1000on__before     | SingleElement        |
      | Single_rangeB                   | SingleElement        |
      | Single_rangeF                   | SingleElement        |
      | Single_trend                    | SingleElement        |
      | Single_backgr                   | SingleElement        |
      | Single_cnt                      | SingleElement        |
      | Single_icon                     | SingleElement        |
      | Funnel_2654                     | FunnelElement        |
      | Radar_2633                      | RadarElement         |
      | Wordcloud_分面                    | WordcloudElement     |
      | Wordcloud_2625                  | WordcloudElement     |
      | Single_2549                     | SingleElement        |

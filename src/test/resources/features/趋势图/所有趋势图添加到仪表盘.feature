@addAllTrendsToDashboard
Feature:所有趋势图添加到仪表盘

  Background:
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for "2000" millsecond

  Scenario Outline: 创建仪表盘
    When I click the "Create" button
    And I set the parameter "DashBoardName" with value "所有趋势图_<name>"
    And I click the "Ensure" button
    And I wait for "SuccessMessage" will be visible
    Then I will see the success message "新建仪表盘成功"

    Examples:
      | name |
      | 序列 |
      | 维度 |
      | 关系 |
      | 复合 |
      | 地图 |
      | 其他 |

  Scenario Outline: 新建第一个tag
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    When I click the detail which name is "所有趋势图_<name>"
    And switch to window "仪表盘"
    And I close all tabs except main tab
    Then I will see the "dashboard.DetailPage" page
    When I set the parameter "TagName" with value "<tag>"
    And I click the "Ensure" button
    Then I wait for "SettingIcon" will be visible

    Examples:
      | name |    tag       |
      | 序列 | LineChart    |
      | 维度 | Pie          |
      | 关系 | Chord        |
      | 复合 | Rangeline    |
      | 地图 | Heatmap      |
      | 其他 | Single       |

  Scenario Outline:  添加页签
    And I set the parameter "TextFilter" with value "所有趋势图_<folder>"
    And I wait for "2000" millsecond
    When I click the detail which name is "所有趋势图_<folder>"
    And switch to window "仪表盘"
    And I close all tabs except main tab
    Then I will see the "dashboard.DetailPage" page
    And I click the "ShowDashboards" button
    And I wait for "LastTag" will be visible
    And I open the context menu of the "LastDashboard" element
    And I wait for "500" millsecond
    And I wait for "CreateNewTag" will be visible
    And I click the "CreateNewTag" button
    When I set the parameter "TagName" with value "<tag>"
    And I click the "Ensure" button
    And I wait for "3000" millsecond

    Examples:
      | folder   |  tag         |
      | 序列     | AreaChart    |
      | 序列     | ColumnChart  |
      | 序列     | ScatterChart |
      | 维度     | Rose         |
      | 维度     | Bar          |
      | 维度     | Bar2         |
      | 维度     | Sun          |
      | 维度     | Flame        |
      | 关系     | Sankey       |
      | 关系     | Force        |
      | 复合     | Multiaxis    |
      | 地图     | Attackmap    |
      | 地图     | Regionmap    |
      | 地图     | Geostatsmap  |
      | 其他     | Ring         |
      | 其他     | Liquidfill   |
      | 其他     | Wordcloud    |
      | 其他     | Sequence     |
      | 其他     | Radar        |
      | 其他     | Funnel       |
      | 其他     | Matrixheatmap|
      | 其他     | Chain        |
      | 其他     | NetworkNode  |
      | 其他     | Table        |

  Scenario Outline:  添加趋势图
    And I set the parameter "TextFilter" with value "所有趋势图_<folder>"
    And I wait for "2000" millsecond
    When I click the detail which name is "所有趋势图_<folder>"
    And switch to window "仪表盘"
    And I close all tabs except main tab
    Then I will see the "dashboard.DetailPage" page
    And I click the "ShowDashboards" button
    And I wait for "LastTag" will be visible
    And I wait for "500" millsecond
    And I set the parameter "SearchTagInput" with value "<tag>"
    And I wait for "500" millsecond
    And I click the Element with text "<tag>"
    And I click the "SettingIcon" button
    And I switch the dashboard "OpenEdit" button to "enable"
    And I click the "SettingIcon" button
    And I wait for "2000" millsecond
    Then I click the "AddEventButton" button
    And I click the "AddChart" button
    And I wait for "SpinDot" will be invisible
    And I set the parameter "SearchChartInput" with value "<chart>"
    And I wait for loading invisible
    And I click the "{'Checkbox':'<chart>'}" button
    And I click the "Ensure" button
    And I wait for "SuccessMessage" will be visible
    Then I wait for element "SuccessMessage" change text to "添加成功"

    Examples:
      | folder   |  tag         | chart                           |
      | 序列     | LineChart    | LineChart_2477                  |
      | 序列     | LineChart    | LineChart_2479_Smooth           |
      | 序列     | LineChart    | LineChart_2479_ConnectEmptyData |
      | 序列     | LineChart    | LineChart_分面                  |
      | 序列     | AreaChart    | AreaChart_2005                  |
      | 序列     | AreaChart    | AreaChart_Pile                  |
      | 序列     | AreaChart    | AreaChart_2483_Smooth           |
      | 序列     | AreaChart    | AreaChart_2483_ConnectEmptyData |
      | 序列     | AreaChart    | AreaChart_分面                  |
      | 序列     | ColumnChart  | ColumnChart_2499                |
      | 序列     | ColumnChart  | ColumnChart_Pile                |
      | 序列     | ColumnChart  | ColumnChart_2500_limit          |
      | 序列     | ColumnChart  | ColumnChart_分面                |
      | 序列     | ScatterChart | ScatterChart_2491               |
      | 序列     | ScatterChart | ScatterChart_bubbles            |
      | 序列     | ScatterChart | ScatterChart_2492_limit         |
      | 序列     | ScatterChart | ScatterChart_分面               |
      | 维度     | Pie          | Pie_2503                        |
      | 维度     | Pie          | Pie_不展示                      |
      | 维度     | Pie          | Pie_只展示名称                  |
      | 维度     | Pie          | Pie_全部展示                    |
      | 维度     | Pie          | Pie_全部展示_分面               |
      | 维度     | Pie          | Pie_2                           |
      | 维度     | Pie          | Pie_3                           |
      | 维度     | Rose         | Rose_2858                       |
      | 维度     | Rose         | Rose_不展示                     |
      | 维度     | Rose         | Rose_只展示名称                 |
      | 维度     | Rose         | Rose_全部展示                   |
      | 维度     | Rose         | Rose_只展示名称_分面            |
      | 维度     | Bar          | Bar_2676                        |
      | 维度     | Bar          | Bar_只展示名称_柱状外左侧       |
      | 维度     | Bar          | Bar_只展示名称_柱状外右侧       |
      | 维度     | Bar          | Bar_只展示名称_柱状内中央       |
      | 维度     | Bar          | Bar_只展示名称_柱状内靠左侧     |
      | 维度     | Bar          | Bar_只展示名称_柱状内靠右侧     |
      | 维度     | Bar2         | Bar_全部展示_柱状外左侧         |
      | 维度     | Bar2         | Bar_全部展示_柱状外右侧         |
      | 维度     | Bar2         | Bar_全部展示_柱状内中央         |
      | 维度     | Bar2         | Bar_全部展示_柱状内靠左侧       |
      | 维度     | Bar2         | Bar_全部展示_柱状内靠右侧       |
      | 维度     | Bar2         | Bar_全部展示_柱状外两侧         |
      | 维度     | Bar2         | Bar_不展示                      |
      | 维度     | Bar2         | Bar_全部展示_分面               |
      | 维度     | Sun          | Sun_2850                        |
      | 维度     | Sun          | Sun_分面                        |
      | 维度     | Flame        | Flame_DrillIn                   |
      | 维度     | Flame        | Flame_DrillOut_分面             |
      | 关系     | Chord        | Chord_2505                      |
      | 关系     | Chord        | Chord_分面                      |
      | 关系     | Sankey       | Sankey_2507                     |
      | 关系     | Sankey       | Sankey_Multistage               |
      | 关系     | Sankey       | Sankey_分面                     |
      | 关系     | Force        | Force_2511                      |
      | 关系     | Force        | Force_repulsion                 |
      | 关系     | Force        | Force_分面                      |
      | 复合     | Rangeline    | Rangeline_2516                  |
      | 复合     | Multiaxis    | Multiaxis_2523                  |
      | 复合     | Multiaxis    | Multiaxis_4841                  |
      | 地图     | Heatmap      | Heatmap_2539                    |
      | 地图     | Heatmap      | Heatmap_分面                    |
      | 地图     | Attackmap    | Attackmap_China_2543            |
      | 地图     | Attackmap    | Attackmap_World_2542            |
      | 地图     | Regionmap    | Regionmap_2545                  |
      | 地图     | Regionmap    | Regionmap_China_2546            |
      | 地图     | Regionmap    | Regionmap_Jiangsu_2547          |
      | 地图     | Regionmap    | Regionmap_2545_white            |
      | 地图     | Regionmap    | Regionmap_China_2546_white      |
      | 地图     | Regionmap    | Regionmap_Jiangsu_2547_white    |
      | 地图     | Geostatsmap  | Geostatsmap_2098_param          |
      | 地图     | Geostatsmap  | Geostatsmap_2098                |
      | 地图     | Geostatsmap  | Geostatsmap_2797_param          |
      | 地图     | Geostatsmap  | Geostatsmap_2797                |
      | 地图     | Geostatsmap  | Geostatsmap_Google              |
      | 地图     | Geostatsmap  | Geostatsmap_Gtimg               |
      | 地图     | Geostatsmap  | Geostatsmap_OSM                 |
      | 地图     | Geostatsmap  | Geostatsmap_Amap                |
      | 地图     | Geostatsmap  | Geostatsmap_ArcGIS              |
      | 其他     | Single       | Single_2549                     |
      | 其他     | Single       | Single_icon                     |
      | 其他     | Single       | Single_backgr                   |
      | 其他     | Single       | Single_rangeB                   |
      | 其他     | Single       | Single_trend                    |
      | 其他     | Single       | Single_prec1_1000on__before     |
      | 其他     | Single       | Single_prec2_1000off_back_after |
      | 其他     | Single       | Single_Sparkline_Background     |
      | 其他     | Single       | Single_Sparkline_分面           |
      | 其他     | Single       | Single_仅数值字段               |
      | 其他     | Ring         | Ring_onefield                   |
      | 其他     | Ring         | Ring_twofields                  |
      | 其他     | Ring         | Ring_table_1r_3c_colors         |
      | 其他     | Ring         | Ring_table_1r_4c                |
      | 其他     | Ring         | Ring_table_3r_2c                |
      | 其他     | Liquidfill   | Liquidfill_percent              |
      | 其他     | Liquidfill   | Liquidfill_分面                 |
      | 其他     | Wordcloud    | Wordcloud_2625                  |
      | 其他     | Wordcloud    | Wordcloud_分面                  |
      | 其他     | Sequence     | Sequence_2805                   |
      | 其他     | Radar        | Radar_2633                      |
      | 其他     | Radar        | Radar_2635                      |
      | 其他     | Funnel       | Funnel_2654                     |
      | 其他     | Funnel       | Funnel_2858                     |
      | 其他     | Matrixheatmap| Matrixheatmap_2660              |
      | 其他     | Matrixheatmap| Matrixheatmap_2661              |
      | 其他     | Chain        | Chain_2831                      |
      | 其他     | Chain        | Chain_2982                      |
      | 其他     | Chain        | Chain_2982_tree                 |
      | 其他     | Chain        | Chain_2831_tree                 |
      | 其他     | NetworkNode  | NetworkNode                     |
      | 其他     | Table        | Table_Test                      |

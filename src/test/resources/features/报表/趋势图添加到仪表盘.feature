@addTrendToDashboardSaveAsReport
Feature:趋势图添加到仪表盘保存为报表

  Background:
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible

  @addTrendToDashboard
  Scenario Outline: create_dashboards
    When I click the "Create" button
    And I set the parameter "DashBoardName" with value "<name>"
    And I click the "Ensure" button
    And I wait for "SuccessMessage" will be visible
    Then I will see the success message "新建仪表盘成功"

  Examples:
    |    name     |
    | 趋势图_序列 |
    | 趋势图_维度 |
    | 趋势图_关系 |
    | 趋势图_复合 |
    | 趋势图_地图 |
    | 趋势图_其他 |

  @addTrendToDashboard
  Scenario Outline: 新建第一个tag
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    When I click the detail which name is "<name>"
    And switch to window "仪表盘"
    And I close all tabs except main tab
    Then I will see the "dashboard.DetailPage" page
    When I set the parameter "TagName" with value "<tag>"
    And I click the "Ensure" button
    Then I wait for "SettingIcon" will be visible
    
    Examples:
      |    name     |    tag       |
      | 趋势图_序列 | LineChart    |
      | 趋势图_维度 | Pie          |
      | 趋势图_关系 | Chord        |
      | 趋势图_复合 | Rangeline    |
      | 趋势图_地图 | Heatmap      |
      | 趋势图_其他 | Single       |

  @addTrendToDashboard
  Scenario Outline:  add_tabs
    And I set the parameter "TextFilter" with value "趋势图_<folder>"
    And I wait for loading invisible
    When I click the detail which name is "趋势图_<folder>"
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
    | 其他     | Ring         |
    | 其他     | Liquidfill   |
    | 其他     | Wordcloud    |
    | 其他     | Radar        |
    | 其他     | Funnel       |
    | 其他     | Matrixheatmap|
    | 其他     | Table        |

  @addTrendToDashboard
  Scenario Outline:  add_trends
    And I set the parameter "TextFilter" with value "趋势图_<folder>"
    And I wait for loading invisible
    When I click the detail which name is "趋势图_<folder>"
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
      | 序列     | AreaChart    | AreaChart_2005                  |
      | 序列     | AreaChart    | AreaChart_Pile                  |
      | 序列     | AreaChart    | AreaChart_2483_Smooth           |
      | 序列     | AreaChart    | AreaChart_2483_ConnectEmptyData |
      | 序列     | ColumnChart  | ColumnChart_2499                |
      | 序列     | ColumnChart  | ColumnChart_Pile                |
      | 序列     | ColumnChart  | ColumnChart_2500_limit          |
      | 序列     | ScatterChart | ScatterChart_2491               |
      | 序列     | ScatterChart | ScatterChart_bubbles            |
      | 序列     | ScatterChart | ScatterChart_2492_limit         |
      | 维度     | Pie          | Pie_2503                        |
      | 维度     | Pie          | Pie_不展示                      |
      | 维度     | Pie          | Pie_只展示名称                  |
      | 维度     | Pie          | Pie_全部展示                    |
      | 维度     | Pie          | Pie_2                           |
      | 维度     | Pie          | Pie_3                           |
      | 维度     | Rose         | Rose_2858                       |
      | 维度     | Rose         | Rose_不展示                     |
      | 维度     | Rose         | Rose_只展示名称                 |
      | 维度     | Rose         | Rose_全部展示                   |
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
      | 维度     | Bar2         | Bar_不展示                      |
      | 维度     | Sun          | Sun_2850                        |
      | 维度     | Flame        | Flame_DrillIn                   |
      | 关系     | Chord        | Chord_2505                      |
      | 关系     | Sankey       | Sankey_2507                     |
      | 关系     | Sankey       | Sankey_Multistage               |
      | 关系     | Force        | Force_2511                      |
      | 关系     | Force        | Force_repulsion                 |
      | 复合     | Rangeline    | Rangeline_2516                  |
      | 复合     | Multiaxis    | Multiaxis_2523                  |
      | 复合     | Multiaxis    | Multiaxis_4841                  |
      | 地图     | Heatmap      | Heatmap_2539                    |
      | 地图     | Attackmap    | Attackmap_China_2543            |
      | 地图     | Attackmap    | Attackmap_World_2542            |
      | 地图     | Regionmap    | Regionmap_2545                  |
      | 地图     | Regionmap    | Regionmap_China_2546            |
      | 地图     | Regionmap    | Regionmap_Jiangsu_2547          |
      | 其他     | Single       | Single_2549                     |
      | 其他     | Single       | Single_icon                     |
      | 其他     | Single       | Single_cnt                      |
      | 其他     | Single       | Single_backgr                   |
      | 其他     | Single       | Single_rangeF                   |
      | 其他     | Single       | Single_rangeB                   |
      | 其他     | Ring         | Ring_onefield                   |
      | 其他     | Ring         | Ring_twofields                  |
      | 其他     | Liquidfill   | Liquidfill_percent              |
      | 其他     | Wordcloud    | Wordcloud_2625                  |
      | 其他     | Radar        | Radar_2633                      |
      | 其他     | Radar        | Radar_2635                      |
      | 其他     | Funnel       | Funnel_2654                     |
      | 其他     | Funnel       | Funnel_2858                     |
      | 其他     | Matrixheatmap| Matrixheatmap_2660              |
      | 其他     | Matrixheatmap| Matrixheatmap_2661              |
      | 其他     | Table        | Table_Test                      |

  @trendDashboardSaveAsReport
  Scenario Outline: 存为报表
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I set the parameter "TextFilter" with value "趋势图_<dashboard_name>"
    And I wait for loading invisible
    When I click the detail which name is "趋势图_<dashboard_name>"
    And switch to window "仪表盘"
    And I close all tabs except main tab
    Then I will see the "dashboard.DetailPage" page
    And I click the "ShowDashboards" button
    And I wait for "LastTag" will be visible
    And I set the parameter "SearchTagInput" with value "<chart>"
    And I wait for "500" millsecond
    And I click the Element with text "<chart>"
    And I wait for "3000" millsecond
    And I click the "SettingIcon" button
    And I click the "SaveAs" button
    And I click the "SaveAsReport" button
    And switch to another window
    And I close all tabs except main tab
    Then I will see the "report.CreatePage" page
    And I set the parameter "Name" with value "趋势图_仪表盘保存为报表_<chart>"
    And I choose the "PDF" from the "ReportType"
    And I set the parameters "Hour" and "Minute" as "3" minutes later from now
    And I click the "NextButton" button
    And I wait for "TopoTitle" will be visible
    And I click the "FinishButton" button
    And I wait for "3000" millsecond
    Then I will see the text "新建成功" exist in page

    Examples:
      | dashboard_name|  chart       |
      | 序列          | LineChart    |
      | 序列          | AreaChart    |
      | 序列          | ColumnChart  |
      | 序列          | ScatterChart |
      | 维度          | Pie          |
      | 维度          | Rose         |
      | 维度          | Bar          |
      | 维度          | Bar2         |
      | 维度          | Sun          |
      | 维度          | Flame        |
      | 关系          | Chord        |
      | 关系          | Sankey       |
      | 关系          | Force        |
      | 复合          | Rangeline    |
      | 复合          | Multiaxis    |
      | 地图          | Heatmap      |
      | 地图          | Attackmap    |
      | 地图          | Regionmap    |
      | 其他          | Single       |
      | 其他          | Ring         |
      | 其他          | Liquidfill   |
      | 其他          | Wordcloud    |
      | 其他          | Funnel       |
      | 其他          | Radar        |
      | 其他          | Matrixheatmap|
      | 其他          | Table        |

  @downloadTrendDashboardSaveAsReport
  Scenario Outline: 下载PDF报表
    Given open the "report.ListPage" page for uri "/reports/"
    And I wait for loading invisible
    When I set the parameter "TextFilter" with value "趋势图_仪表盘保存为报表_<chart>"
    And I wait for loading invisible
    And the data name is "{'column':'1','name':'趋势图_仪表盘保存为报表_<chart>'}" then i click the "趋势图_仪表盘保存为报表_<chart>" button
    And I wait for element "SelectedReport" change text to "趋势图_仪表盘保存为报表_<chart>"
    Then I will see the element "LastGeneratedReport" contains ".pdf"
    And I click the "Download" button
    And I wait for "4000" millsecond
    And I download the latest report to local
    And I wait for "2000" millsecond

    Examples:
      |  chart       |
      | LineChart    |
      | AreaChart    |
      | ColumnChart  |
      | ScatterChart |
      | Pie          |
      | Rose         |
      | Bar          |
      | Bar2         |
      | Sun          |
      | Flame        |
      | Chord        |
      | Sankey       |
      | Force        |
      | Rangeline    |
      | Multiaxis    |
      | Heatmap      |
      | Attackmap    |
      | Regionmap    |
      | Single       |
      | Ring         |
      | Liquidfill   |
      | Wordcloud    |
      | Funnel       |
      | Radar        |
      | Matrixheatmap|
      | Table        |
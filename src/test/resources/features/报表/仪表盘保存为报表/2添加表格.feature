@saveDashboardAsReport  @addTablesToDashboard
Feature:2添加表格

  Background:
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for "2000" millsecond

  Scenario Outline:  add_trends
    And I set the parameter "SearchInput" with value "仪表盘_<folder>"
    And I wait for "2000" millsecond
    When I click the detail which name is "仪表盘_<folder>"
    Then I will see the "dashboard.DetailPage" page
    And I wait for "TagIcon" will be visible
    And I click the "TagIcon" button
    And I wait for "500" millsecond
    And I set the parameter "SearchTagInput" with value "<tag>"
    And I wait for "500" millsecond
    And I click the Element with text "<tag>"
    And I wait for "2000" millsecond
    Then I click the "AddEventButton" button
    And I click the "AddChart" button
    And I wait for "SpinDot" will be invisible
    And I set the parameter "SearchChartInput" with value "报表测试"
    And I wait for loading invisible
    And I click the "{'Checkbox':'报表测试'}" button
    And I click the "Ensure" button
    And I wait for "5000" millsecond
    When the chart title is "报表测试" then I click the button which classname is "yotta-icon yotta-icon-DotEmblemOutlined" in dashboard
    And I click the "Configs" button
    And I wait for "ChartTitle" will be visible
    And I set the parameter "ChartTitle" with value "<chart>"
    And I set the value "starttime="now/d" endtime="now/d+24h" <spl>" to the textarea "Spl"
    And I set the parameter "ChartDesc" with value "<description>"
    And I click the "Ensure" button
    And I wait for "SuccessMessage" will be visible
    Then I will see the success message "配置成功"

    Examples:
      | folder   |  tag         | chart               | description                                                         |  spl      |
      | 序列     | LineChart    | LineChart           | FirstLabel__个_Smooth_1_25_FirstPosition                            | tag:sample04061424_chart \| stats count() by apache.clientip,apache.method  |
      | 序列     | AreaChart    | AreaChart           | SecondLabel_AscendingOrder_pcs._ConnectEmptyData__20_SecondPosition | tag:sample04061424_chart \| stats count() by apache.clientip,apache.method  |
      | 序列     | AreaChart    | AreaChart_Pile      | ThirdLabel_DescendingOrder_pcs._Pile_2_25_ThirdPosition             | tag:sample04061424_chart \| stats count() by apache.clientip,apache.method  |
      | 序列     | ColumnChart  | ColumnChart_Pile    | ThirdLabel_DescendingOrder_个_Pile_0_20_ThirdPosition               | tag:sample04061424_chart \| stats count() by apache.clientip,apache.method  |
      | 序列     | ScatterChart | ScatterChart        | SecondLabel_个_Bubbles_FirstPosition                                | tag:sample04061424_chart \| stats count() by apache.clientip,apache.method  |
      | 维度     | Pie          | Pie                 | 只展示名称_Red                                                      | tag:sample04061424_chart \| stats count(apache.clientip) as ip_count by apache.clientip \| sort by ip_count \| limit 5 |
      | 维度     | Rose         | Rose                | 全部展示_Green                                                      | tag:sample04061424_chart \| stats count(apache.clientip) as ip_count by apache.clientip \| sort by ip_count \| limit 5 |
      | 维度     | Bar          | Bar                 | 不展示_Yellow                                                       | tag:sample04061424_chart \| stats count(apache.clientip) as ip_count by apache.clientip \| sort by ip_count \| limit 5 |
      | 维度     | Bar          | Bar1                | 只展示名称_柱状外右侧_Red                                           | tag:sample04061424_chart \| stats count(apache.clientip) as ip_count by apache.clientip \| sort by ip_count \| limit 5 |
      | 维度     | Bar          | Bar2                | 全部展示_柱状内靠左侧_Green                                         | tag:sample04061424_chart \| stats count(apache.clientip) as ip_count by apache.clientip \| sort by ip_count \| limit 5 |
      | 维度     | Sun          | Sun                 | DarkBlue                                                            | tag:sample04061424_chart \| stats count() by apache.status,apache.geo.province, apache.geo.city |
      | 关系     | Chord        | Chord               | Chord_Red                                                           | tag:sample04061424_chart \| stats count() as cnt by apache.status,apache.method \| sort by cnt, apache.status |
      | 关系     | Sankey       | Sankey              | Yellow                                                              | tag:sample04061424_chart  AND NOT apache.clientip:221.226.97.92 AND NOT apache.clientip:117.136.79.162 \| stats count() by apache.clientip,apache.resp_len,apache.method \| limit 2 |
      | 关系     | Sankey       | Sankey_Mult         | Red_Multistage                                                      | tag:t_with \|transaction json.sid keepevicted=true with states a,b,c in json.module results by flow \| stats count() by fromstate,tostate \| limit 3 |
      | 关系     | Force        | Force               | Green_repuls50                                                      | tag:sample04061424_chart \| stats count() by apache.clientip,apache.request_path \| limit 10 |
      | 复合     | Rangeline    | Rangeline           |                                                                     | tag:sample04061424_chart \| bucket timestamp span=1h as ts \| stats count() as cnt by ts \| esma cnt timefield=ts|
      | 复合     | Multiaxis    | Multiaxis           | Group_Red                                                           | tag:sample04061424_display \| stats count(apache.resp_len), max(apache.resp_len), min(apache.resp_len), sum(apache.status), avg(apache.resp_len) by apache.resp_len,apache.status \| limit 10 |
      | 复合     | Multiaxis    | Multiaxis_2         | Green_Red_Orange                                                    | tag:sample04061424_display \| stats count(apache.resp_len), max(apache.resp_len), min(apache.resp_len), sum(apache.status), avg(apache.resp_len) by apache.resp_len,apache.status \| limit 10 |
      | 地图     | Heatmap      | Heatmap             |                                                                     | tag:sample04061424_chart \| stats count() by apache.geo.city |
      | 地图     | Attackmap    | Attackmap_China     |                                                                     | tag:sample04061424_chart \| parse field=apache.request_query "^gw_address=(?<gw_address>\d+\.\d+\.\d+\.\d+)" \| stats count() as cnt, min(apache.geo.latitude) as client_lat, min(apache.geo.longitude) as client_lon by apache.clientip, gw_address \| eval gw_lat=39.5427 \| eval gw_lon=116.2317 \|eval clientlon= 114.109467 \| eval clientlat=22.39642 |
      | 地图     | Attackmap    | Attackmap_World     |                                                                     | tag:sample04061424_chart \| parse field=apache.request_query "^gw_address=(?<gw_address>\d+\.\d+\.\d+\.\d+)" \| stats count() as cnt, min(apache.geo.latitude) as client_lat, min(apache.geo.longitude) as client_lon by apache.clientip, gw_address \| eval gw_lat=39.5427 \| eval gw_lon=116.2317 \|eval clientlon= -0.127758 \| eval clientlat=51.507    |
      | 地图     | Regionmap    | Regionmap_Jiangsu   |                                                                     | tag:sample04061424_chart \| stats count() by apache.geo.city |
      | 地图     | Regionmap    | Regionmap_China     |                                                                     | tag:sample04061424_chart \| stats count() by apache.geo.country, apache.geo.province, apache.geo.city |
      | 地图     | Regionmap    | Regionmap_World     |                                                                     | tag:sample04061424_chart \| stats count() by apache.geo.country, apache.geo.province, apache.geo.city           |
      | 其他     | Single       | Single              | Green                                                               | tag:sample04061424_chart \| stats count() as cnt \| eval icon=if(cnt>300,"thumbs-down","thumbs-up")|
      | 其他     | Single       | Single_icon         | Red_icon                                                            | tag:sample04061424_chart \| stats count() as cnt \| eval icon=if(cnt>300,"thumbs-down","thumbs-up")|
      | 其他     | Single       | Single_font         | Orange_font-awesome-flag                                            | tag:sample04061424_chart \| stats count() as cnt \| eval icon=if(cnt>300,"thumbs-down","thumbs-up")|
      | 其他     | Single       | Single_range_backgr | Yellow_range                                                        | tag:sample04061424_chart \| stats count() as cnt \| eval cnt = 99 \| eval icon=if(cnt>1000000,"thumbs-down","thumbs-up")|
      | 其他     | Liquidfill   | Liquidfill          | Green                                                               | tag:sample04061424_chart \| stats count() as cnt\| eval cnt_perc=cnt/1000 |
      | 其他     | Wordcloud    | Wordcloud           | Green                                                               | tag:sample04061424_chart \| stats count() by apache.geo.city |
      | 其他     | Radar        | Radar               | DarkBlue                                                            | tag:sample04061424_chart \| stats count() by apache.status,apache.geo.city |
      | 其他     | Funnel       | Funnel              | FirstPosition_LightGreen                                            | tag:sample04061424_chart \| stats count() by apache.clientip \| limit 5 |
      | 其他     | Matrixheatmap| Matrixheatmap       |                                                                     | tag:sample04061424_chart \| stats count() by apache.status,apache.geo.city |
      | 其他     | Table        | Table               |                                                                     | tag:sample04061424_chart \| stats count() by apache.status,apache.geo.city \| limit 5 |

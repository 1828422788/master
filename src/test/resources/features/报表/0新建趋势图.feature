@reportCreateData
Feature: 报表_新建趋势图_表格
# 21
# sample04061424_chart for Today and Yesterday
# sample04061424_display for Today and Yesterday
# t_with for Today and Yesterday

  Background:
    Given open the "trend.ListPage" page for uri "/trend/"
    And I click the "NewTrendButton" button
    Then I will see the "trend.CreatePage" page

  Scenario Outline: table
    When I set the parameter "SearchInput" with value "<spl>"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for "Header" will be visible
    And I click the "NextButton" button
    And I wait for "Header" will be visible
    And I click the "NextButton" button
    When I set the parameter "NameInput" with value "<name>"
    And I set the parameter "DescribeInput" with value "AutoCreate"
    And I choose the "auto_package" from the "GroupField"
    And I choose the "TrendApp" from the "AppField"
    And I click the "NextButton" button
    Then I wait for "SuccessCreate" will be visible

   Examples:
    |   name                 |   spl                                                                                                                   |
    | table_Order            |  tag:sample04061424_chart  \| stats count() by apache.clientip,apache.method                                             |
    | table_Dimension        |  tag:sample04061424_chart  \| stats count(apache.clientip) as ip_count by apache.clientip \| sort by ip_count \| limit 5 |
    | table_Sun              |  tag:sample04061424_chart  \| stats count() by apache.status,apache.geo.province, apache.geo.city                        |
    | table_Chord            |  tag:sample04061424_chart  \| stats count() by apache.clientip,apache.request_path  |
    | table_Sankey           |  tag:sample04061424_chart  AND NOT apache.clientip:221.226.97.92 AND NOT apache.clientip:117.136.79.162 \| stats count() by apache.clientip,apache.resp_len,apache.method \| limit 4 |
    | table_Force            |  tag:sample04061424_chart  \| stats count() by apache.clientip,apache.request_path \|limit 10      |
    | table_Sankey_Mult      |  tag:t_with \|transaction json.sid with states a,b,c in json.module results by flow \| stats count() by fromstate,tostate \| limit 3 |
    | table_Rangeline        |  tag:sample04061424_chart \| bucket timestamp span=1h as ts \| stats count\(\) as cnt by ts \| esma cnt timefield=ts  |
    | table_Multiaxis        |  tag:sample04061424_display \| stats count(apache.resp_len), max(apache.resp_len), min(apache.resp_len), sum(apache.status), avg(apache.resp_len) by apache.resp_len,apache.status \| limit 10|
    | table_Heatmap          |  tag:sample04061424_chart \| stats count() by apache.geo.city                                                                                                                        |
    #regionmap_china
    | table_Regionmap        |  tag:sample04061424_chart \| stats count() by apache.geo.country, apache.geo.province, apache.geo.city                                                                               |
    | table_Attackmap_World  |  tag:sample04061424_chart \| parse field=apache.request_query \"\^gw_address=(\?<gw_address>\\\d+\\\.\\\d+\\\.\\\d+\\\.\\\d+)\" \| stats count() as cnt, min(apache.geo.latitude) as client_lat, min(apache.geo.longitude) as client_lon by apache.clientip, gw_address \| eval gw_lat=39.5427 \| eval gw_lon=116.2317 \|eval clientlon= -0.127758 \| eval clientlat=51.507   |
    | table_Attackmap_China  |  tag:sample04061424_chart \| parse field=apache.request_query \"\^gw_address=(\?<gw_address>\\\d+\\\.\\\d+\\\.\\\d+\\\.\\\d+)\" \| stats count() as cnt, min(apache.geo.latitude) as client_lat, min(apache.geo.longitude) as client_lon by apache.clientip, gw_address \| eval gw_lat=39.5427 \| eval gw_lon=116.2317 \|eval clientlon= 114.109467 \| eval clientlat=22.39642 |
    | table_Regionmap_Jiangsu|  tag:sample04061424_chart \| stats count() by apache.geo.city                                                             |
    | table_Single           |  tag:sample04061424_chart \| stats count\(\) as cnt \| eval icon=if\(cnt\>300,\"thumbs-down\",\"thumbs-up\"\)|
    | table_Wordcloud        |  tag:sample04061424_chart \| stats count() by apache.geo.city|
    #radar, matrixheatmap
    | table_Radar_Matr       |  tag:sample04061424_chart \| stats count() by apache.status,apache.geo.city|
    | table_Funnel           |  tag:sample04061424_chart \| stats count() by apache.clientip \| limit 5|
    | table_Single_Range     |  tag:sample04061424_chart \| stats count\(\) as cnt \| eval cnt = 99 \| eval icon=if\(cnt\>1000000,\"thumbs-down\",\"thumbs-up\"\)|
    | table_Liquidfill       |  tag:sample04061424_chart \| stats count() as cnt\| eval cnt_perc=cnt/1000|


  Scenario Outline: linechart
    When I set the parameter "SearchInput" with value "starttime=\"now/d-24h\" endtime=\"now/d\" tag:sample04061424_chart  \| stats count() as cnt by apache.clientip,apache.method  \| sort by cnt, apache.clientip "
    And I wait for "1000" millsecond
    And I click the "SearchButton" button
    And I wait for "Loading" will be invisible
    And I wait for "Header" will be visible
    And I click the "NextButton" button

    And I wait for "Type" will be visible
    And I click the "Type" button
    And I click the "Order" button
    And I click the "<chartType>" button

    And I click the "Type" button
    And I wait for "Chart" will be visible
    Then I click the "NextButton" button

    When I set the parameter "NameInput" with value "<chartType>_<caseNum>"
    And I set the parameter "DescribeInput" with value "AutoCreate"
    And I click the "NextButton" button
    Then I wait for "SuccessCreate" will be visible


    Examples:
      |   chartType   |caseNum  |
      |    LineChart  |  2477   |
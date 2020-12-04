@reportCreateData @createEssentialData
Feature: 报表_新建趋势图_表格

  Background:
    Given open the "trend.ListPage" page for uri "/trend/"
    And I click the "NewTrendButton" button
    Then I will see the "trend.CreatePage" page

  Scenario Outline: table
    When I set the parameter "SearchInput" with value "<spl>"
    And I click the "SearchButton" button
    And I wait for "Header" will be visible
    And I click the "NextButton" button under some element
    And I wait for "Header" will be visible
    And I click the "NextButton" button under some element
    When I set the parameter "NameInput" with value "<name>"
    And I set the parameter "TagInput" with value "auto_package"
    And I set the parameter "DescribeInput" with value "AutoCreate"
#    And I choose the "auto_package" from the "GroupField"
    And I click the "NextButton" button under some element
    Then I wait for "SuccessCreate" will be visible

   Examples:
    |   name                 |   spl                                                                                                                   |
    | table_Order            |  starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424_chart  \| stats count() by apache.clientip,apache.method                                             |
    | table_Dimension        |  starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424_chart  \| stats count(apache.clientip) as ip_count by apache.clientip \| sort by ip_count \| limit 5 |
    | table_Sun              |  starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424_chart  \| stats count() by apache.status,apache.geo.province, apache.geo.city                        |
    | table_Chord            |  starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424_chart  \| stats count() by apache.clientip,apache.request_path  |
    | table_Sankey           |  starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424_chart  AND NOT apache.clientip:221.226.97.92 AND NOT apache.clientip:117.136.79.162 \| stats count() by apache.clientip,apache.resp_len,apache.method \| limit 4 |
    | table_Force            |  starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424_chart  \| stats count() by apache.clientip,apache.request_path \|limit 10      |
    | table_Sankey_Mult      |  starttime=\"now/d\" endtime=\"now/d+24h\" tag:t_with \|transaction json.sid keepevicted=true with states a,b,c in json.module results by flow \| stats count() by fromstate,tostate \| limit 3 |
    | table_Rangeline        |  starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424_chart \| bucket timestamp span=1h as ts \| stats count\(\) as cnt by ts \| esma cnt timefield=ts  |
    | table_Multiaxis        |  starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424_display \| stats count(apache.resp_len), max(apache.resp_len), min(apache.resp_len), sum(apache.status), avg(apache.resp_len) by apache.resp_len,apache.status \| limit 10|
    | table_Heatmap          |  starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424_chart \| stats count() by apache.geo.city                                                                                                                        |
    #regionmap_china
    | table_Regionmap        |  starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424_chart \| stats count() by apache.geo.country, apache.geo.province, apache.geo.city                                                                               |
    | table_Attackmap_World  |  starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424_chart \| parse field=apache.request_query \"\^gw_address=(\?<gw_address>\\\d+\\\.\\\d+\\\.\\\d+\\\.\\\d+)\" \| stats count() as cnt, min(apache.geo.latitude) as client_lat, min(apache.geo.longitude) as client_lon by apache.clientip, gw_address \| eval gw_lat=39.5427 \| eval gw_lon=116.2317 \|eval clientlon= -0.127758 \| eval clientlat=51.507   |
    | table_Attackmap_China  |  starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424_chart \| parse field=apache.request_query \"\^gw_address=(\?<gw_address>\\\d+\\\.\\\d+\\\.\\\d+\\\.\\\d+)\" \| stats count() as cnt, min(apache.geo.latitude) as client_lat, min(apache.geo.longitude) as client_lon by apache.clientip, gw_address \| eval gw_lat=39.5427 \| eval gw_lon=116.2317 \|eval clientlon= 114.109467 \| eval clientlat=22.39642 |
    | table_Regionmap_Jiangsu|  starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424_chart \| stats count() by apache.geo.city                                                             |
    | table_Single           |  starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424_chart \| stats count\(\) as cnt \| eval icon=if\(cnt\>300,\"thumbs-down\",\"thumbs-up\"\)|
    | table_Wordcloud        |  starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424_chart \| stats count() by apache.geo.city|
    #radar, matrixheatmap
    | table_Radar_Matr       |  starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424_chart \| stats count() by apache.status,apache.geo.city|
    | table_Funnel           |  starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424_chart \| stats count() by apache.clientip \| limit 5|
    | table_Single_Range     |  starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424_chart \| stats count\(\) as cnt \| eval cnt = 99 \| eval icon=if\(cnt\>1000000,\"thumbs-down\",\"thumbs-up\"\)|
    | table_Liquidfill       |  starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424_chart \| stats count() as cnt\| eval cnt_perc=cnt/1000|

@linecharttest
  Scenario Outline: linechart
    When I set the parameter "SearchInput" with value "tag:sample04061424_chart  \| stats count() as cnt by apache.clientip,apache.method  \| sort by cnt, apache.clientip "
    And I click the "DateEditor" button
    And I click the "Today" button
    And I wait for "1000" millsecond
    And I click the "SearchButton" button
    And I wait for "Loading" will be invisible
    And I wait for "Header" will be visible
    And I click the "NextButton" button under some element

    And I wait for "Type" will be visible
    And I click the "Type" button
    And I click the "Order" button
    And I click the "<chartType>" button

    And I click the "Type" button
    And I wait for "Chart" will be visible
    Then I click the "NextButton" button under some element

    When I set the parameter "NameInput" with value "<chartType>"
    And I set the parameter "DescribeInput" with value "AutoCreate"
    And I click the "NextButton" button under some element
    Then I wait for "SuccessCreate" will be visible


    Examples:
      |   chartType   |
      |    LineChart  |
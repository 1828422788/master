@logDisplay
Feature: 高级搜索视图

  Background:
    Given open the "splSearch.SearchPage" page for uri "/search/"

  Scenario Outline: sample
    When I set the parameter "SearchInput" with value "<spl>"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait element "SearchStatus" change text to "搜索完成!"
    Then I will see the "splSearch.StatisticalPage" page
    And I click the "Type" button
    Then I will see the "trend.CreatePage" page
    And I click the "<chartType>" button
    And I click the "<chart>" button
    And I wait for loading invisible
    And I display the element "ChartTypePopover"
    And I wait for "1000" millsecond
    Then take a screenshot with name "<caseNum>：日志展现-高级搜索视图-<name>sample"

    Examples:
      | spl                                                                                                                     | chartType | chart         | caseNum | name  |
      | tag:*display \| stats count() by apache.clientip,apache.resp_len \| limit 10                                            |           | Line          | 2770    | 曲线图   |
      | tag:sample04061424_chart \| stats count() by apache.clientip,apache.method                                              |           | Area          | 2771    | 面积图   |
      | tag:sample04061424_chart \| stats count() by apache.clientip,apache.method                                              |           | Scatter       | 2769    | 散点图   |
      | tag:sample04061424_chart \| stats count() by apache.clientip,apache.method                                              |           | Column        | 2768    | 柱状图   |
      | tag:sample04061424_chart \| stats count(apache.clientip) as ip_count by apache.clientip \| sort by ip_count \| limit 10 | Dimension | Pie           | 833     | 饼状图   |
      | tag:sample04061424_chart \| stats count(apache.clientip) as ip_count by apache.clientip \| sort by ip_count \| limit 10 | Dimension | Rose          | 2776    | 玫瑰图   |
      | tag:sample04061424_chart \| stats count(apache.clientip) as ip_count by apache.clientip \| sort by ip_count \| limit 10 | Dimension | Bar           | 2778    | 条形图   |
      | tag:sample04061424_chart \| stats count() by apache.status,apache.geo.province, apache.geo.city                         | Dimension | Sunburst      | 2782    | 旭日图   |
      | tag:sample04061424_chart \| stats count() by apache.clientip,apache.request_path                                        | Relation  | Chord         | 834     | 和弦图   |
#      | appname:* \| transaction json.aid,json.bid,json.cid,json.did,json.eid,json.fid with states a,b,c,d,e,f in json.module results by flow \| stats count() by fromstate,tostate              | Relation  | Sankey        | 2783    | 桑基图     |
      | tag:sample04061424_chart \| stats count() by apache.clientip,apache.request_path \|limit 10                             | Relation  | Force         | 2784    | 力图    |
      | * \| stats avg(raw_message_length) as avg_length, count(apache.clientip) as ip_count by appname \| sort by ip_count     | Compound  | Multiaxis     | 2785    | 多Y轴图  |
      | tag:sample04061424_chart \| stats count() by apache.geo.city                                                            | Map       | Heatmap       | 1229    | 热力地图  |
      | tag:sample04061424_chart \| stats count() by apache.geo.country, apache.geo.province, apache.geo.city                   | Map       | Regionmap     | 2790    | 区划地图  |
      | tag:vendors_461 \| geostats latfield=vendors.VendorLatitude longfield=vendors.VendorLongitude count() as cnt            | Map       | Geostatsmap   | 2795    | 统计地图  |
      | tag:sample04061424_chart  \| stats count() as cnt \| eval icon=if(cnt>1000000,"thumbs-down","thumbs-up")                | Other     | Single        | 2303    | 单值    |
      | tag:sample04061424_chart \| stats count() by apache.geo.city                                                            | Other     | Wordcloud     | 2804    | 字符云图  |
      | tag:sample04061424_chart \| stats count() by apache.status,apache.geo.city                                              | Other     | Matrixheatmap | 2810    | 矩阵热力图 |
#      | tag:v99 \| geostats binspanlat=22.5 binspanlat=45.0 latfield=vendors.VendorLatitude longfield=vendors.VendorLongitude maxzoomlevel=3 sum(vendors.Weight)  by vendors.VendorStateProvince | Map       | Geostatsmap   | 2797    | 统计地图-权重 |

  Scenario Outline: 区间图sample
    When I set the parameter "SearchInput" with value "<spl>"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait element "SearchStatus" change text to "搜索完成!"
    Then I will see the "splSearch.StatisticalPage" page
    And I click the "Type" button
    Then I will see the "trend.CreatePage" page
    And I click the "<chartType>" button
    And I click the "<chart>" button
    And I click the "Setting" button
    And I choose the "ts" from the "SettingSelect"
    And I click the "Yaxis" button
    And I choose the "count_" from the "SettingSelect"
    And I choose the "count_" from the "Predict"
    And I choose the "upper" from the "TopLimit"
    And I choose the "lower" from the "LowerLimit"
    And I click the "Generate" button
    And I wait for "1000" millsecond
    Then take a screenshot with name "<caseNum>：日志展现-高级搜索视图-<name>sample"

    Examples:
      | spl                                                                                                                                                                                                                                          | chartType | chart     | caseNum | name |
      | * \| bucket timestamp span=3h as ts\| stats count(appname) as count_ by ts \| movingavg count_,5 as ma \| rollingstd count_,5 as rs\| eval lower=ma-3*rs\| eval upper=ma+3*rs \| eval outlier=if(count_>upper\|\|count_<lower, count_, null) | Compound  | Rangeline | 835     | 区间图  |

  Scenario: 曲线图（RZY-832）
    When I set the parameter "SearchInput" with value "tag:sample04061424* | stats count(apache.clientip) as ip_count by appname | sort by ip_count"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait element "SearchStatus" change text to "搜索完成!"
    Then I will see the "splSearch.StatisticalPage" page
    And I click the "Type" button
    Then I will see the "trend.CreatePage" page
    And I click the "Line" button
    And I click the "Setting" button
    And I click the "Yaxis" button
    And I set the parameter "Unit" with value "个"
    And I click the "Smooth" button
    And I click the "ConnectEmptyData" button
    And I click the "Generate" button
    And I wait for "1000" millsecond
    Then take a screenshot with name "832：日志展现-高级搜索视图-曲线图"

  Scenario: 面积图（RZY-2767）
    When I set the parameter "SearchInput" with value "tag:sample04061424_chart | stats count() by apache.clientip,apache.method"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait element "SearchStatus" change text to "搜索完成!"
    Then I will see the "splSearch.StatisticalPage" page
    And I click the "Type" button
    Then I will see the "trend.CreatePage" page
    And I click the "Area" button
    And I click the "Setting" button
    And I click the "Group" button
    And I click the "Pile" button
    And I click the "Generate" button
    And I wait for "1000" millsecond
    Then take a screenshot with name "2767：日志展现-高级搜索视图-面积图"

  Scenario: 柱状图（RZY-2773）
    When I set the parameter "SearchInput" with value "tag:sample04061424_chart | stats count() by apache.clientip,apache.method"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait element "SearchStatus" change text to "搜索完成!"
    Then I will see the "splSearch.StatisticalPage" page
    And I click the "Type" button
    Then I will see the "trend.CreatePage" page
    And I click the "Column" button
    And I click the "Setting" button
    And I click the "Group" button
    And I click the "Pile" button
    And I click the "AddField" button
    And I choose the "apache.clientip" from the "SecondSettingSelect"
    And I click the "Generate" button
    And I wait for "1000" millsecond
    Then take a screenshot with name "2773：日志展现-高级搜索视图-柱状图"

  Scenario Outline: 散点图（RZY-2772）
    When I set the parameter "SearchInput" with value "<spl>"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait element "SearchStatus" change text to "搜索完成!"
    Then I will see the "splSearch.StatisticalPage" page
    And I click the "Type" button
    Then I will see the "trend.CreatePage" page
    And I click the "<chart>" button
    And I wait for loading invisible
    And I click the "Setting" button
    And I click the "<tag>" button
    And I click the "<order>" button
    And I click the "Yaxis" button
    And I set the parameter "Unit" with value "<unit>"
    And I click the "<smooth>" button
    And I click the "<connectEmptyData>" button
    And I set the parameter "Min" with value "<min>"
    And I set the parameter "Max" with value "<max>"
    And I click the "Bubble" button
    And I click the "AccordingField" button
    And I choose the "count()" from the "BubbleSize"
    And I click the "Example" button
    And I click the "<position>" button
    And I click the "Exhibition" button
    And I click the "StartColour" button
    And I click the "<colour>" button
    And I click the "Generate" button
    And I wait for "1000" millsecond
    Then take a screenshot with name "2772：日志展现-高级搜索视图-散点图"

    Examples:
      | spl                                                                          | chart   | tag        | order           | unit | smooth | connectEmptyData | min | max | position      | colour |
      | tag:*display \| stats count() by apache.clientip,apache.resp_len \| limit 10 | Scatter | Horizontal | DescendingOrder | g    |        |                  | 1   | 11  | FirstPosition | Purple |

  Scenario: 循序图（RZY-2805）
    When I set the parameter "SearchInput" with value "*| stats count() by hostname,apache.clientip |limit 10"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait element "SearchStatus" change text to "搜索完成!"
    Then I will see the "splSearch.StatisticalPage" page
    And I click the "Type" button
    Then I will see the "trend.CreatePage" page
    And I click the "Other" button
    And I click the "Sequence" button
    And I click the "Setting" button
    And I choose the "hostname" from the "SettingSelect"
    And I click the "Source" button
    And I choose the "apache.clientip" from the "SettingSelect"
    And I click the "Target" button
    And I choose the "hostname" from the "SettingSelect"
    And I click the "Divide" button
    And I choose the "apache.clientip" from the "SettingSelect"
    And I click the "Mark" button
    And I choose the "apache.clientip" from the "SettingSelect"
    And I click the "Generate" button
    And I wait for "1000" millsecond
    Then take a screenshot with name "2805：日志展现-高级搜索视图-循序图sample"

  Scenario: 调用链（RZY-2812）
    When I set the parameter "SearchInput" with value "tag:gf_dapper* AND dapper.msg.traceId:"511f8756ce1d0b8a" dapper.msg.duration:>0  | table dapper.msg.id, dapper.msg.parentId, dapper.class, dapper.msg.duration, dapper.msg.timestamp,dapper.msg.binaryAnnotations[].value, collector_recv_timestamp"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait element "SearchStatus" change text to "搜索完成!"
    Then I will see the "splSearch.StatisticalPage" page
    And I click the "Type" button
    Then I will see the "trend.CreatePage" page
    And I click the "Other" button
    And I click the "Tracing" button
    And I click the "Setting" button
    And I choose the "dapper.class" from the "SettingSelect"
    And I choose the "dapper.msg.parentId" from the "ParentId"
    And I choose the "dapper.msg.id" from the "ChildId"
    And I click the "Time" button
    And I choose the "dapper.msg.timestamp" from the "SettingSelect"
    And I choose the "dapper.msg.duration" from the "KeepTime"
    And I click the "Info" button
    And I choose the "dapper.msg.binaryAnnotations[].value" from the "SettingSelect"
    And I click the "Generate" button
    And I wait for "1000" millsecond
    Then take a screenshot with name "2812：日志展现-高级搜索视图-调用链"

  Scenario: 统计地图（RZY-2796）
    When I set the parameter "SearchInput" with value "tag:vendors_461 | geostats latfield=vendors.VendorLatitude longfield=vendors.VendorLongitude count() as cnt"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait element "SearchStatus" change text to "搜索完成!"
    Then I will see the "splSearch.StatisticalPage" page
    And I click the "Type" button
    Then I will see the "trend.CreatePage" page
    And I click the "Map" button
    And I click the "Geostatsmap" button
    And I click the "Setting" button
    And I set the parameter "Transparency" with value "0.5"
    And I set the parameter "MinRadius" with value "10"
    And I set the parameter "MaxRadius" with value "50"
    And I click the "Generate" button
    And I wait for "1000" millsecond
    Then take a screenshot with name "2796：日志展现-高级搜索视图-统计地图"

  Scenario: 攻击地图（RZY-2302）
    When I set the parameter "SearchInput" with value "logtype:apache | parse field=apache.request_query "^gw_address=(?<gw_address>\d+\.\d+\.\d+\.\d+)" | stats count() as cnt, min(apache.geo.latitude) as client_lat, min(apache.geo.longitude) as client_lon by apache.clientip, gw_address | eval gw_lat=39.5427 | eval gw_lon=116.2317"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait element "SearchStatus" change text to "搜索完成!"
    Then I will see the "splSearch.StatisticalPage" page
    And I click the "Type" button
    Then I will see the "trend.CreatePage" page
    And I click the "Map" button
    And I click the "Attackmap" button
    And I click the "Setting" button
    And I choose the "apache.clientip" from the "SettingSelect"
    And I choose the "client_lon" from the "Longitude"
    And I choose the "client_lat" from the "Latitude"
    And I click the "Target" button
    And I choose the "gw_address" from the "SettingSelect"
    And I choose the "gw_lon" from the "Longitude"
    And I choose the "gw_lat" from the "Latitude"
    And I click the "Weight" button
    And I choose the "cnt" from the "SettingSelect"
    And I click the "Generate" button
    And I wait for "1000" millsecond
    Then take a screenshot with name "2302：日志展现-高级搜索视图-攻击地图"

  Scenario: 旭日图（RZY-2781）
    When I set the parameter "SearchInput" with value "tag:sample04061424_chart | stats count() by apache.status,apache.geo.province, apache.geo.city"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait element "SearchStatus" change text to "搜索完成!"
    Then I will see the "splSearch.StatisticalPage" page
    And I click the "Type" button
    Then I will see the "trend.CreatePage" page
    And I click the "Dimension" button
    And I click the "Sunburst" button
    And I click the "Setting" button
    And I click the "Divide" button
    And I click the "Delete" button
    And I click the "Generate" button
    And I wait for "1000" millsecond
    Then take a screenshot with name "2781：日志展现-高级搜索视图-旭日图"

  Scenario Outline: 多Y轴图1（RZY-2786）
    When I set the parameter "SearchInput" with value "<spl>"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait element "SearchStatus" change text to "搜索完成!"
    Then I will see the "splSearch.StatisticalPage" page
    And I click the "Type" button
    Then I will see the "trend.CreatePage" page
    And I click the "<chartType>" button
    And I click the "<chart>" button
    And I wait for loading invisible
    And I click the "Setting" button
    And I click the "<tag>" button
    And I click the "<order>" button
    And I click the "Yaxis" button
    And I choose the "max(apache.resp_len)" from the "SettingSelect"
    And I choose the "面积图" from the "Type"
    And I click the "Smooth" button
    And I click the "ConnectEmptyData" button
    And I set the parameter "Unit" with value "面"
    And I set the parameter "Min" with value "1"
    And I set the parameter "Max" with value "170000"
    And I click the "AddField" button
    And I choose the "min(apache.resp_len)" from the "FiledValue2"
    And I choose the "柱状图" from the "Type"
    And I set the parameter "Unit" with value "柱"
    And I set the parameter "Min" with value "2"
    And I click the "AddField" button
    And I choose the "sum(apache.status)" from the "FiledValue3"
    And I choose the "散点图" from the "Type"
    And I set the parameter "Unit" with value "散"
    And I set the parameter "Max" with value "49000"
    And I click the "Exhibition" button
    And I click the "StartColour" button
    And I click the "Red" button
    And I click the "Generate" button
    And I wait for "1000" millsecond
    Then take a screenshot with name "2786：日志展现-高级搜索视图-多Y轴图1"

    Examples:
      | spl                                                                                                                                                                             | chartType | chart     | tag        | order          |
      | tag:*display \| stats count(apache.resp_len), max(apache.resp_len), min(apache.resp_len), sum(apache.status), avg(apache.resp_len) by apache.resp_len,apache.status \| limit 10 | Compound  | Multiaxis | Horizontal | AscendingOrder |

  Scenario: 饼状图1（RZY-2774）
    When I set the parameter "SearchInput" with value "tag:sample04061424_chart | stats count(apache.clientip) as ip_count by apache.clientip | sort by ip_count | limit 10"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait element "SearchStatus" change text to "搜索完成!"
    Then I will see the "splSearch.StatisticalPage" page
    And I click the "Type" button
    Then I will see the "trend.CreatePage" page
    And I click the "Dimension" button
    And I click the "Pie" button
    And I wait for loading invisible
    And I click the "Setting" button
    And I click the "Exhibition" button
    And I click the "StartColour" button
    And I click the "Yellow" button
    And I click the "Generate" button
    And I wait for "1000" millsecond
    Then take a screenshot with name "2774：日志展现-高级搜索视图-饼状图1"

  Scenario: 条形图1（RZY-2779）
    When I set the parameter "SearchInput" with value "tag:*display | stats count() by apache.clientip,apache.resp_len | limit 10"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait element "SearchStatus" change text to "搜索完成!"
    Then I will see the "splSearch.StatisticalPage" page
    And I click the "Type" button
    Then I will see the "trend.CreatePage" page
    And I click the "Dimension" button
    And I click the "Bar" button
    And I wait for loading invisible
    And I click the "Setting" button
    And I click the "Exhibition" button
    And I click the "StartColour" button
    And I click the "Orange" button
    And I choose the "展示全部" from the "Label"
    And I choose the "柱状外左侧" from the "Label"
    And I click the "Generate" button
    And I wait for "1000" millsecond
    Then take a screenshot with name "2779：日志展现-高级搜索视图-条形图1"

  Scenario: 条形图2（RZY-2780）
    When I set the parameter "SearchInput" with value "tag:*display | stats count() by apache.clientip,apache.resp_len | limit 10"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait element "SearchStatus" change text to "搜索完成!"
    Then I will see the "splSearch.StatisticalPage" page
    And I click the "Type" button
    Then I will see the "trend.CreatePage" page
    And I click the "Dimension" button
    And I click the "Bar" button
    And I wait for loading invisible
    And I click the "Setting" button
    And I click the "Exhibition" button
    And I click the "StartColour" button
    And I click the "Yellow" button
    And I choose the "展示全部" from the "Label"
    And I choose the "柱状内中央" from the "Label"
    And I click the "Generate" button
    And I wait for "1000" millsecond
    Then take a screenshot with name "2780：日志展现-高级搜索视图-条形图2"

  Scenario: 行政区划地图钻取sample（RZY-2792）
    When I set the parameter "SearchInput" with value "tag:sample04061424_chart | stats count() by apache.geo.country, apache.geo.province, apache.geo.city"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait element "SearchStatus" change text to "搜索完成!"
    Then I will see the "splSearch.StatisticalPage" page
    And I click the "Type" button
    Then I will see the "trend.CreatePage" page
    And I click the "Map" button
    And I click the "Regionmap" button
    And I wait for loading invisible
    And I click the "Setting" button
    And I click the "GoingDown" button
    And I choose the "apache.geo.province" from the "Province"
    And I choose the "apache.geo.city" from the "City"
    And I click the "Generate" button
    And I wait for "1000" millsecond
    Then take a screenshot with name "2792：日志展现-高级搜索视图-区划地图钻取sample"
@timedTaskSmoke
Feature: 高级搜索视图（截图并保存为定时任务）

  Background:
    Given open the "splSearch.SearchPage" page for uri "/search/"
    And I wait element "SearchStatus" change text to "搜索完成!"

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
    Then take part of "Chart" with name "../UI_test_screenshot/timedtask/<caseNum>"
    And I will see the "splSearch.SearchPage" page
    And I click the "SaveAsOther" button
    And I click the "TimedTask" button
    And I set the parameter "TaskName" with value "<taskName>"
    And I set the parameter "Describe" with value "UIAutoCreate"
    And I choose the "default_SavedSchedule" from the "GroupComboBox"
    And I set the parameter "CrontabInput" with value "0 0 0/10 * * ?"
    And I click the "EnsureCrontab" button
    Then I will see the success message "保存成功"

  @first
    Examples:
      | spl                                                                                                          | chartType | chart       | caseNum | taskName                     |
      | tag:vendors_461 \| geostats latfield=vendors.VendorLatitude longfield=vendors.VendorLongitude count() as cnt | Map       | Geostatsmap | 2795    | RZY-2936:task_地图-统计地图_sample |

  @second
    Examples:
      | spl                                                                                                                                          | chartType | chart         | caseNum | taskName                       |
      | tag:*display \| stats count() by apache.clientip,apache.resp_len \| limit 10                                                                 |           | Line          | 2770    | RZY-2901:task_序列-曲线图_sample    |
      | tag:sample04061424_chart \| stats count() by apache.clientip,apache.method                                                                   |           | Area          | 2771    | RZY-2903:task_序列-面积图_sample    |
      | tag:sample04061424_chart \| stats count() by apache.clientip,apache.method                                                                   |           | Scatter       | 2769    | RZY-2905:task_序列-散点图_sample    |
      | tag:sample04061424_chart \| stats count() by apache.clientip,apache.method                                                                   |           | Column        | 2768    | RZY-2907:task_序列-柱状图_sample    |
      | tag:sample04061424_chart \| stats count(apache.clientip) as ip_count by apache.clientip \| sort by ip_count \| limit 10                      | Dimension | Pie           | 833     | RZY-2909:task_维度_饼状图_sample    |
      | tag:sample04061424_chart \| stats count(apache.clientip) as ip_count by apache.clientip \| sort by ip_count \| limit 10                      | Dimension | Rose          | 2776    | RZY-2912:task_维度_玫瑰图_sample    |
      | tag:sample04061424_chart \| stats count(apache.clientip) as ip_count by apache.clientip \| sort by ip_count \| limit 10                      | Dimension | Bar           | 2778    | RZY-2914:task_维度_条形图_sample    |
      | tag:sample04061424_chart \| stats count() by apache.clientip,apache.request_path                                                             | Relation  | Chord         | 834     | RZY-2919:task_关系_和弦图_sample    |
      | tag:sample04061424_chart AND NOT apache.clientip:221.226.97.92 \| stats count() by apache.clientip,apache.resp_len,apache.method \| limit 10 | Relation  | Sankey        | 2783    | RZY-2921:task_关系_桑基图_sample    |
      | tag:sample04061424_chart \| stats count() by apache.clientip,apache.request_path \| limit 10                                                 | Relation  | Force         | 2784    | RZY-2923:task_关系_力图_sample     |
      | * \| stats avg(raw_message_length) as avg_length, count(apache.clientip) as ip_count by appname \| sort by ip_count                          | Compound  | Multiaxis     | 2785    | RZY-2927:task_复合_多Y轴图_sample   |
      | tag:sample04061424_chart \| stats count() by apache.geo.city                                                                                 | Map       | Heatmap       | 1229    | RZY-2929:task_地图-热力地图_sample   |
      | tag:sample04061424_chart \| stats count() by apache.geo.country, apache.geo.province, apache.geo.city                                        | Map       | Regionmap     | 2790    | RZY-2933:task_地图-行政区划地图_sample |
      | tag:sample04061424_chart  \| stats count() as cnt \| eval icon=if(cnt>1000000,\"thumbs-down\",\"thumbs-up\")                                 | Other     | Single        | 2303    | RZY-2939:task_其它_单值_sample     |
      | tag:sample04061424_chart \| stats count() by apache.geo.city                                                                                 | Other     | Wordcloud     | 2804    | RZY-2946:task_其它_字符云图_sample   |
      | tag:sample04061424_chart \| stats count() by apache.status,apache.geo.city                                                                   | Other     | Radar         | 2807    | RZY-2950:task_其它_雷达图_sample    |
      | tag:sample04061424_chart \| stats count() by apache.status,apache.clientip \| limit 10                                                       | Other     | Funnel        | 2449    | RZY-2952:task_其它_漏斗图sample     |
      | tag:sample04061424_chart \| stats count() by apache.status,apache.geo.city                                                                   | Other     | Matrixheatmap | 2810    | RZY-2954:task_其它_矩阵热力图_sample  |

  @third
    Examples:
      | spl                                                                                                                                                                                              | chartType | chart       | caseNum | taskName                 |
      | tag:sample04061424_chart \| stats count() by apache.status,apache.geo.province, apache.geo.city                                                                                                  | Dimension | Sunburst    | 2782    | RZY-2918:task_维度_旭日图1    |
      | tag:vendors_461 \| geostats binspanlat=22.5 binspanlat=45.0 latfield=vendors.VendorLatitude longfield=vendors.VendorLongitude maxzoomlevel=3 sum(vendors.Weight)  by vendors.VendorStateProvince | Map       | Geostatsmap | 2797    | RZY-2938:task_地图-统计地图_权重 |
      | tag:sample04061424_chart \| stats count(apache.clientip) as ip_count by apache.clientip \| sort by ip_count \| limit 10                                                                          | Dimension | Rose        | 2777    | RZY-2913:task_维度_玫瑰图1    |
      | tag:sample04061424_chart \| stats count() by apache.geo.city                                                                                                                                     | Map       | Heatmap     | 1229    | RZY-2930:task_地图-热力地图    |

  @second
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
    Then take part of "Chart" with name "../UI_test_screenshot/timedtask/835"
    And I will see the "splSearch.SearchPage" page
    And I click the "SaveAsOther" button
    And I click the "TimedTask" button
    And I set the parameter "TaskName" with value "RZY-2925:task_复合_区间图_sample"
    And I set the parameter "Describe" with value "UIAutoCreate"
    And I choose the "default_SavedSchedule" from the "GroupComboBox"
    And I set the parameter "CrontabInput" with value "0 0 0/10 * * ?"
    And I click the "EnsureCrontab" button
    Then I will see the success message "保存成功"

    Examples:
      | spl                                                                                                                                                                                                                                          | chartType | chart     | caseNum | name |
      | * \| bucket timestamp span=3h as ts\| stats count(appname) as count_ by ts \| movingavg count_,5 as ma \| rollingstd count_,5 as rs\| eval lower=ma-3*rs\| eval upper=ma+3*rs \| eval outlier=if(count_>upper\|\|count_<lower, count_, null) | Compound  | Rangeline | 835     | 区间图  |

  @second
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
    Then take part of "Chart" with name "../UI_test_screenshot/timedtask/2805"
    And I will see the "splSearch.SearchPage" page
    And I click the "SaveAsOther" button
    And I click the "TimedTask" button
    And I set the parameter "TaskName" with value "RZY-2948:task_其它_循序图_sample"
    And I set the parameter "Describe" with value "UIAutoCreate"
    And I choose the "default_SavedSchedule" from the "GroupComboBox"
    And I set the parameter "CrontabInput" with value "0 0 0/10 * * ?"
    And I click the "EnsureCrontab" button
    Then I will see the success message "保存成功"

  @second
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
    Then take part of "Chart" with name "../UI_test_screenshot/timedtask/2792"
    And I will see the "splSearch.SearchPage" page
    And I click the "SaveAsOther" button
    And I click the "TimedTask" button
    And I set the parameter "TaskName" with value "RZY-2934:task_地图-行政区划地图_钻取_sample"
    And I set the parameter "Describe" with value "UIAutoCreate"
    And I choose the "default_SavedSchedule" from the "GroupComboBox"
    And I set the parameter "CrontabInput" with value "0 0 0/10 * * ?"
    And I click the "EnsureCrontab" button
    Then I will see the success message "保存成功"

  @second
  Scenario: 地图-行政区划地图1_中国
    When I set the parameter "SearchInput" with value "tag:sample04061424_chart | stats count() by apache.geo.province"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait element "SearchStatus" change text to "搜索完成!"
    Then I will see the "splSearch.StatisticalPage" page
    And I click the "Type" button
    Then I will see the "trend.CreatePage" page
    And I click the "Map" button
    And I click the "Regionmap" button
    And I click the "Setting" button under some element
    And I click the "Region" button
    And I click the "China" button
    And I click the "Generate" button
    And I wait for "1000" millsecond
    Then take part of "Chart" with name "../UI_test_screenshot/timedtask/2903"
    And I will see the "splSearch.SearchPage" page
    And I click the "SaveAsOther" button
    And I click the "TimedTask" button
    And I set the parameter "TaskName" with value "RZY-2935:task_地图-行政区划地图1_中国"
    And I set the parameter "Describe" with value "UIAutoCreate"
    And I choose the "default_SavedSchedule" from the "GroupComboBox"
    And I set the parameter "CrontabInput" with value "0 0 0/10 * * ?"
    And I click the "EnsureCrontab" button
    Then I will see the success message "保存成功"

  @second
  Scenario: 其它_水球图_sample
    When I set the parameter "SearchInput" with value "tag:sample04061424_chart | stats pct_ranks(apache.resp_len,25) as p | eval res = p.25/100"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait element "SearchStatus" change text to "搜索完成!"
    Then I will see the "splSearch.StatisticalPage" page
    And I click the "Type" button
    Then I will see the "trend.CreatePage" page
    And I click the "Other" button
    And I click the "Liquidfill" button
    And I click the "Setting" button under some element
    And I wait for loading invisible
    And I choose the "res" from the "SettingSelect"
    And I click the "Generate" button
    And I wait for "1000" millsecond
    Then take part of "Chart" with name "../UI_test_screenshot/timedtask/2801"
    And I will see the "splSearch.SearchPage" page
    And I click the "SaveAsOther" button
    And I click the "TimedTask" button
    And I set the parameter "TaskName" with value "RZY-2944:task_其它_水球图_sample"
    And I set the parameter "Describe" with value "UIAutoCreate"
    And I choose the "default_SavedSchedule" from the "GroupComboBox"
    And I set the parameter "CrontabInput" with value "0 0 0/10 * * ?"
    And I click the "EnsureCrontab" button
    Then I will see the success message "保存成功"

  @second
  Scenario: 攻击地图（RZY-2302）
    When I set the parameter "SearchInput" with value "logtype:apache | parse field=apache.request_query \"^gw_address=(?<gw_address>\\d+\\.\\d+\\.\\d+\\.\\d+)\" | stats count() as cnt, min(apache.geo.latitude) as client_lat, min(apache.geo.longitude) as client_lon by apache.clientip, gw_address | eval gw_lat=39.5427 | eval gw_lon=116.2317"
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
    Then take part of "Chart" with name "../UI_test_screenshot/timedtask/2302"
    And I will see the "splSearch.SearchPage" page
    And I click the "SaveAsOther" button
    And I click the "TimedTask" button
    And I set the parameter "TaskName" with value "RZY-2931:task_地图-攻击地图_sample"
    And I set the parameter "Describe" with value "UIAutoCreate"
    And I choose the "default_SavedSchedule" from the "GroupComboBox"
    And I set the parameter "CrontabInput" with value "0 0 0/10 * * ?"
    And I click the "EnsureCrontab" button
    Then I will see the success message "保存成功"

  @second
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
    Then take part of "Chart" with name "../UI_test_screenshot/timedtask/2781"
    And I will see the "splSearch.SearchPage" page
    And I click the "SaveAsOther" button
    And I click the "TimedTask" button
    And I set the parameter "TaskName" with value "RZY-2917:task_维度_旭日图_sample"
    And I set the parameter "Describe" with value "UIAutoCreate"
    And I choose the "default_SavedSchedule" from the "GroupComboBox"
    And I set the parameter "CrontabInput" with value "0 0 0/10 * * ?"
    And I click the "EnsureCrontab" button
    Then I will see the success message "保存成功"

  @second
  Scenario: 调用链（RZY-2812、2814）
    When I set the parameter "SearchInput" with value "tag:gf_dapper* AND dapper.msg.traceId:\"511f8756ce1d0b8a\" dapper.msg.duration:>0 | table dapper.msg.id, dapper.msg.parentId, dapper.class, dapper.msg.duration, dapper.msg.timestamp,dapper.msg.binaryAnnotations[].value, collector_recv_timestamp"
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
    And I wait for loading invisible
    Then take part of "Chart" with name "../UI_test_screenshot/timedtask/2812"
    And I click the "Setting" button
    And I click the "Time" button
    And I choose the "collector_recv_timestamp" from the "SettingSelect"
    And I click the "Generate" button
    And I wait for loading invisible
    Then take part of "Chart" with name "../UI_test_screenshot/timedtask/2814改时间"
    And I click the "Setting" button
    And I click the "Exhibition" button
    And I click the "StartColour" button
    And I click the "Green" button
    And I click the "Generate" button
    And I wait for loading invisible
    Then take part of "Chart" with name "../UI_test_screenshot/timedtask/2814改颜色"
    And I will see the "splSearch.SearchPage" page
    And I click the "SaveAsOther" button
    And I click the "TimedTask" button
    And I set the parameter "TaskName" with value "RZY-2957:task_其它_调用链1"
    And I set the parameter "Describe" with value "UIAutoCreate"
    And I choose the "default_SavedSchedule" from the "GroupComboBox"
    And I set the parameter "CrontabInput" with value "0 0 0/10 * * ?"
    And I click the "EnsureCrontab" button
    Then I will see the success message "保存成功"

  @third
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
    Then take part of "Chart" with name "../UI_test_screenshot/timedtask/2786"
    And I will see the "splSearch.SearchPage" page
    And I click the "SaveAsOther" button
    And I click the "TimedTask" button
    And I set the parameter "TaskName" with value "RZY-2928:task_复合_多Y轴图"
    And I set the parameter "Describe" with value "UIAutoCreate"
    And I choose the "default_SavedSchedule" from the "GroupComboBox"
    And I set the parameter "CrontabInput" with value "0 0 0/10 * * ?"
    And I click the "EnsureCrontab" button
    Then I will see the success message "保存成功"

    Examples:
      | spl                                                                                                                                                                             | chartType | chart     | tag        | order          |
      | tag:*display \| stats count(apache.resp_len), max(apache.resp_len), min(apache.resp_len), sum(apache.status), avg(apache.resp_len) by apache.resp_len,apache.status \| limit 10 | Compound  | Multiaxis | Horizontal | AscendingOrder |

  @third
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
    And I click the "Setting" button
    And I click the "Exhibition" button
    And I click the "StartColour" button
    And I click the "Yellow" button
    And I click the "Generate" button
    And I wait for "1000" millsecond
    Then take part of "Chart" with name "../UI_test_screenshot/timedtask/2774"
    And I will see the "splSearch.SearchPage" page
    And I click the "SaveAsOther" button
    And I click the "TimedTask" button
    And I set the parameter "TaskName" with value "RZY-2910:task_维度-饼状图1"
    And I set the parameter "Describe" with value "UIAutoCreate"
    And I choose the "default_SavedSchedule" from the "GroupComboBox"
    And I set the parameter "CrontabInput" with value "0 0 0/10 * * ?"
    And I click the "EnsureCrontab" button
    Then I will see the success message "保存成功"

  @third
  Scenario: 饼状图2（RZY-2775）
    When I set the parameter "SearchInput" with value "tag:*display | stats count() by apache.clientip,apache.resp_len | limit 10"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait element "SearchStatus" change text to "搜索完成!"
    Then I will see the "splSearch.StatisticalPage" page
    And I click the "Type" button
    Then I will see the "trend.CreatePage" page
    And I click the "Dimension" button
    And I click the "Pie" button
    And I click the "Setting" button
    And I click the "Exhibition" button
    And I click the "StartColour" button
    And I click the "Orange" button
    And I click the "Generate" button
    And I wait for "1000" millsecond
    Then take part of "Chart" with name "../UI_test_screenshot/timedtask/2775"
    And I will see the "splSearch.SearchPage" page
    And I click the "SaveAsOther" button
    And I click the "TimedTask" button
    And I set the parameter "TaskName" with value "RZY-2911:task_维度-饼状图2"
    And I set the parameter "Describe" with value "UIAutoCreate"
    And I choose the "default_SavedSchedule" from the "GroupComboBox"
    And I set the parameter "CrontabInput" with value "0 0 0/10 * * ?"
    And I click the "EnsureCrontab" button
    Then I will see the success message "保存成功"

  @third
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
    Then take part of "Chart" with name "../UI_test_screenshot/timedtask/2779"
    And I will see the "splSearch.SearchPage" page
    And I click the "SaveAsOther" button
    And I click the "TimedTask" button
    And I set the parameter "TaskName" with value "RZY-2915:task_维度-条形图1"
    And I set the parameter "Describe" with value "UIAutoCreate"
    And I choose the "default_SavedSchedule" from the "GroupComboBox"
    And I set the parameter "CrontabInput" with value "0 0 0/10 * * ?"
    And I click the "EnsureCrontab" button
    Then I will see the success message "保存成功"

  @third
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
    Then take part of "Chart" with name "../UI_test_screenshot/timedtask/2780"
    And I will see the "splSearch.SearchPage" page
    And I click the "SaveAsOther" button
    And I click the "TimedTask" button
    And I set the parameter "TaskName" with value "RZY-2916:task_维度-条形图2"
    And I set the parameter "Describe" with value "UIAutoCreate"
    And I choose the "default_SavedSchedule" from the "GroupComboBox"
    And I set the parameter "CrontabInput" with value "0 0 0/10 * * ?"
    And I click the "EnsureCrontab" button
    Then I will see the success message "保存成功"

  @third
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
    Then take part of "Chart" with name "../UI_test_screenshot/timedtask/2796"
    And I will see the "splSearch.SearchPage" page
    And I click the "SaveAsOther" button
    And I click the "TimedTask" button
    And I set the parameter "TaskName" with value "RZY-2937:task_地图-统计地图_透明"
    And I set the parameter "Describe" with value "UIAutoCreate"
    And I choose the "default_SavedSchedule" from the "GroupComboBox"
    And I set the parameter "CrontabInput" with value "0 0 0/10 * * ?"
    And I click the "EnsureCrontab" button
    Then I will see the success message "保存成功"

  @third
  Scenario: RZY-2799:其它_单值_图标
    When I set the parameter "SearchInput" with value "tag:sample04061424_chart | stats count() as cnt | eval icon=if(cnt>1000000,\"thumbs-down\",\"thumbs-up\")"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait element "SearchStatus" change text to "搜索完成!"
    Then I will see the "splSearch.StatisticalPage" page
    And I click the "Type" button
    Then I will see the "trend.CreatePage" page
    And I click the "Other" button
    And I click the "Single" button
    And I click the "Setting" button
    And I click the "Icon" button
    And I click the "AccordingField" button
    And I choose the "icon" from the "SettingSelect"
    And I click the "Generate" button
    And I wait for "1000" millsecond
    Then take part of "Chart" with name "../UI_test_screenshot/timedtask/2799其它单值图标按字段icon"
    And I click the "Setting" button
    And I choose the "cnt" from the "SettingSelect"
    And I click the "Generate" button
    And I wait for "1000" millsecond
    Then take part of "Chart" with name "../UI_test_screenshot/timedtask/2799其它单值图标按字段cnt"
    And I click the "Setting" button
    And I click the "AccordingName" button
    And I set the parameter "IconName" with value "font-awesome-flag"
    And I click the "Generate" button
    And I wait for "1000" millsecond
    Then take part of "Chart" with name "../UI_test_screenshot/timedtask/2799其它单值图标按名称fontawesomeflag"
    And I click the "Setting" button
    And I set the parameter "IconName" with value "font-awesome"
    And I click the "Generate" button
    And I wait for "1000" millsecond
    Then take part of "Chart" with name "../UI_test_screenshot/timedtask/2799其它单值图标按名称fontawesome"
    And I will see the "splSearch.SearchPage" page
    And I click the "SaveAsOther" button
    And I click the "TimedTask" button
    And I set the parameter "TaskName" with value "RZY-2940:task_其它_单值_图标"
    And I set the parameter "Describe" with value "UIAutoCreate"
    And I choose the "default_SavedSchedule" from the "GroupComboBox"
    And I set the parameter "CrontabInput" with value "0 0 0/10 * * ?"
    And I click the "EnsureCrontab" button
    Then I will see the success message "保存成功"

  @third
  Scenario: RZY-2799:其它_单值_背景
    When I set the parameter "SearchInput" with value "tag:sample04061424_chart | stats count() as cnt | eval icon=if(cnt>1000000,\"thumbs-down\",\"thumbs-up\")"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait element "SearchStatus" change text to "搜索完成!"
    Then I will see the "splSearch.StatisticalPage" page
    And I click the "Type" button
    Then I will see the "trend.CreatePage" page
    And I click the "Other" button
    And I click the "Single" button
    And I click the "Setting" button
    And I click the "Exhibition" button
    And I click the "Background" button
    And I click the "Generate" button
    And I wait for "1000" millsecond
    Then take part of "Chart" with name "../UI_test_screenshot/timedtask/2800"
    And I will see the "splSearch.SearchPage" page
    And I click the "SaveAsOther" button
    And I click the "TimedTask" button
    And I set the parameter "TaskName" with value "RZY-2941:task_其它_单值_背景"
    And I set the parameter "Describe" with value "UIAutoCreate"
    And I choose the "default_SavedSchedule" from the "GroupComboBox"
    And I set the parameter "CrontabInput" with value "0 0 0/10 * * ?"
    And I click the "EnsureCrontab" button
    Then I will see the success message "保存成功"

  @third
  Scenario: 其它_单值_按趋势
    When I set the parameter "SearchInput" with value "tag:sample04061424_chart | stats count() as cnt | eval icon=if(cnt>1000000,\"thumbs-down\",\"thumbs-up\")"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait element "SearchStatus" change text to "搜索完成!"
    Then I will see the "splSearch.StatisticalPage" page
    And I click the "Type" button
    Then I will see the "trend.CreatePage" page
    And I click the "Other" button
    And I click the "Single" button
    And I click the "Setting" button
    And I click the "Exhibition" button
    And I click the "AccordingTrend" button
    And I choose the "一天前" from the "SettingSelect"
    And I click the "Generate" button
    And I wait for "1000" millsecond
    Then take part of "Chart" with name "../UI_test_screenshot/timedtask/1369"
    And I will see the "splSearch.SearchPage" page
    And I click the "SaveAsOther" button
    And I click the "TimedTask" button
    And I set the parameter "TaskName" with value "RZY-2942:task_其它_单值-按趋势"
    And I set the parameter "Describe" with value "UIAutoCreate"
    And I choose the "default_SavedSchedule" from the "GroupComboBox"
    And I set the parameter "CrontabInput" with value "0 0 0/10 * * ?"
    And I click the "EnsureCrontab" button
    Then I will see the success message "保存成功"

  @third
  Scenario: 其它_单值设置-按区间
    When I set the parameter "SearchInput" with value "tag:sample04061424_chart | stats count() as cnt | eval icon=if(cnt>1000000,\"thumbs-down\",\"thumbs-up\")"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait element "SearchStatus" change text to "搜索完成!"
    Then I will see the "splSearch.StatisticalPage" page
    And I click the "Type" button
    Then I will see the "trend.CreatePage" page
    And I click the "Other" button
    And I click the "Single" button
    And I click the "Setting" button
    And I click the "Exhibition" button
    And I click the "AccordingArea" button
    And I set the parameter "MinRange" with value "0"
    And I set the parameter "MaxRange" with value "100"
    And I click the "AddRange" button
    And I set the parameter "MinRange" with value "100"
    And I set the parameter "MaxRange" with value "1000"
    And I click the "StartColour" button
    And I click the "Red" button
    And I click the "Generate" button
    And I wait for "1000" millsecond
    Then take part of "Chart" with name "../UI_test_screenshot/timedtask/1370"
    And I will see the "splSearch.SearchPage" page
    And I click the "SaveAsOther" button
    And I click the "TimedTask" button
    And I set the parameter "TaskName" with value "RZY-2943:task_其它_单值设置-按区间"
    And I set the parameter "Describe" with value "UIAutoCreate"
    And I choose the "default_SavedSchedule" from the "GroupComboBox"
    And I set the parameter "CrontabInput" with value "0 0 0/10 * * ?"
    And I click the "EnsureCrontab" button
    Then I will see the success message "保存成功"

  @third
  Scenario: 其它_雷达图1
    When I set the parameter "SearchInput" with value "tag:sample04061424_chart|stats count() by apache.status,apache.geo.city"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait element "SearchStatus" change text to "搜索完成!"
    Then I will see the "splSearch.StatisticalPage" page
    And I click the "Type" button
    Then I will see the "trend.CreatePage" page
    And I click the "Other" button
    And I click the "Radar" button
    And I click the "Setting" button
    And I click the "Divide" button
    And I choose the "apache.geo.city" from the "SettingSelect"
    And I click the "SwitchLabel" button
    And I click the "Exhibition" button
    And I click the "StartColour" button
    And I click the "Green" button
    And I click the "Generate" button
    And I wait for "1000" millsecond
    Then take part of "Chart" with name "../UI_test_screenshot/timedtask/2808"
    And I will see the "splSearch.SearchPage" page
    And I click the "SaveAsOther" button
    And I click the "TimedTask" button
    And I set the parameter "TaskName" with value "RZY-2951:task_其它_雷达图1"
    And I set the parameter "Describe" with value "UIAutoCreate"
    And I choose the "default_SavedSchedule" from the "GroupComboBox"
    And I set the parameter "CrontabInput" with value "0 0 0/10 * * ?"
    And I click the "EnsureCrontab" button
    Then I will see the success message "保存成功"

  @third
  Scenario: 其它_矩阵热力图1
    When I set the parameter "SearchInput" with value "tag:sample04061424_chart|stats count() by apache.status,apache.geo.city"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait element "SearchStatus" change text to "搜索完成!"
    Then I will see the "splSearch.StatisticalPage" page
    And I click the "Type" button
    Then I will see the "trend.CreatePage" page
    And I click the "Other" button
    And I click the "Matrixheatmap" button
    And I click the "Setting" button
    And I choose the "apache.geo.city" from the "SettingSelect"
    And I click the "Yaxis" button
    And I set the parameter "Segments" with value "5"
    And I click the "Generate" button
    And I wait for "1000" millsecond
    Then take part of "Chart" with name "../UI_test_screenshot/timedtask/2811"
    And I will see the "splSearch.SearchPage" page
    And I click the "SaveAsOther" button
    And I click the "TimedTask" button
    And I set the parameter "TaskName" with value "RZY-2955:task_其它_矩阵热力图1"
    And I set the parameter "Describe" with value "UIAutoCreate"
    And I choose the "default_SavedSchedule" from the "GroupComboBox"
    And I set the parameter "CrontabInput" with value "0 0 0/10 * * ?"
    And I click the "EnsureCrontab" button
    Then I will see the success message "保存成功"

  @third
  Scenario: 其它_循序图1
    When I set the parameter "SearchInput" with value "appname:seq_test | table timestamp,sequence.from, sequence.to,sequence.relatemsg,sequence.msgid"
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
    And I choose the "timestamp" from the "SettingSelect"
    And I click the "Source" button
    And I choose the "sequence.from" from the "SettingSelect"
    And I click the "Target" button
    And I choose the "sequence.to" from the "SettingSelect"
    And I click the "Divide" button
    And I choose the "sequence.msgid" from the "SettingSelect"
    And I click the "Mark" button
    And I choose the "sequence.relatemsg" from the "SettingSelect"
    And I click the "Generate" button
    And I wait for "1000" millsecond
    Then take part of "Chart" with name "../UI_test_screenshot/timedtask/2806"
    And I will see the "splSearch.SearchPage" page
    And I click the "SaveAsOther" button
    And I click the "TimedTask" button
    And I set the parameter "TaskName" with value "RZY-2949:task_其它_循序图1"
    And I set the parameter "Describe" with value "UIAutoCreate"
    And I choose the "default_SavedSchedule" from the "GroupComboBox"
    And I set the parameter "CrontabInput" with value "0 0 0/10 * * ?"
    And I click the "EnsureCrontab" button
    Then I will see the success message "保存成功"

  @third
  Scenario: 其它_漏斗图1
    When I set the parameter "SearchInput" with value "tag:sample04061424_chart | stats count() by apache.status,apache.geo.city,apache.clientip"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait element "SearchStatus" change text to "搜索完成!"
    Then I will see the "splSearch.StatisticalPage" page
    And I click the "Type" button
    Then I will see the "trend.CreatePage" page
    And I click the "Other" button
    And I click the "Funnel" button
    And I click the "Setting" button
    And I click the "Divide" button
    And I choose the "apache.clientip" from the "SettingSelect"
    And I click the "Example" button
    And I click the "SecondPosition" button
    And I click the "Exhibition" button
    And I click the "StartColour" button
    And I click the "LightGreen" button
    And I click the "Generate" button
    And I wait for "1000" millsecond
    Then take part of "Chart" with name "../UI_test_screenshot/timedtask/2809"
    And I will see the "splSearch.SearchPage" page
    And I click the "SaveAsOther" button
    And I click the "TimedTask" button
    And I set the parameter "TaskName" with value "RZY-2953:task_其它_漏斗图1"
    And I set the parameter "Describe" with value "UIAutoCreate"
    And I choose the "default_SavedSchedule" from the "GroupComboBox"
    And I set the parameter "CrontabInput" with value "0 0 0/10 * * ?"
    And I click the "EnsureCrontab" button
    Then I will see the success message "保存成功"


  @third
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
    Then take part of "Chart" with name "../UI_test_screenshot/timedtask/832"
    And I will see the "splSearch.SearchPage" page
    And I click the "SaveAsOther" button
    And I click the "TimedTask" button
    And I set the parameter "TaskName" with value "RZY-2902:task_序列-曲线图"
    And I set the parameter "Describe" with value "UIAutoCreate"
    And I choose the "default_SavedSchedule" from the "GroupComboBox"
    And I set the parameter "CrontabInput" with value "0 0 0/10 * * ?"
    And I click the "EnsureCrontab" button
    Then I will see the success message "保存成功"

  @third
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
    Then take part of "Chart" with name "../UI_test_screenshot/timedtask/2767"
    And I will see the "splSearch.SearchPage" page
    And I click the "SaveAsOther" button
    And I click the "TimedTask" button
    And I set the parameter "TaskName" with value "RZY-2904:task_序列-面积图"
    And I set the parameter "Describe" with value "UIAutoCreate"
    And I choose the "default_SavedSchedule" from the "GroupComboBox"
    And I set the parameter "CrontabInput" with value "0 0 0/10 * * ?"
    And I click the "EnsureCrontab" button
    Then I will see the success message "保存成功"

  @third
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
    Then take part of "Chart" with name "../UI_test_screenshot/timedtask/2773"
    And I will see the "splSearch.SearchPage" page
    And I click the "SaveAsOther" button
    And I click the "TimedTask" button
    And I set the parameter "TaskName" with value "RZY-2908:task_序列-柱状图"
    And I set the parameter "Describe" with value "UIAutoCreate"
    And I choose the "default_SavedSchedule" from the "GroupComboBox"
    And I set the parameter "CrontabInput" with value "0 0 0/10 * * ?"
    And I click the "EnsureCrontab" button
    Then I will see the success message "保存成功"

  @third
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
    Then take part of "Chart" with name "../UI_test_screenshot/timedtask/2772"
    And I will see the "splSearch.SearchPage" page
    And I click the "SaveAsOther" button
    And I click the "TimedTask" button
    And I set the parameter "TaskName" with value "RZY-2906:task_序列-散点图"
    And I set the parameter "Describe" with value "UIAutoCreate"
    And I choose the "default_SavedSchedule" from the "GroupComboBox"
    And I set the parameter "CrontabInput" with value "0 0 0/10 * * ?"
    And I click the "EnsureCrontab" button
    Then I will see the success message "保存成功"

    Examples:
      | spl                                                                          | chart   | tag        | order           | unit | smooth | connectEmptyData | min | max | position      | colour |
      | tag:*display \| stats count() by apache.clientip,apache.resp_len \| limit 10 | Scatter | Horizontal | DescendingOrder | g    |        |                  | 1   | 11  | FirstPosition | Purple |

  Scenario: RZY-2794:地图-行政区划地图2_江苏省
    When I set the parameter "SearchInput" with value "tag:sample04061424_chart | stats count() by apache.geo.city"
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
    And I click the "Region" button
    And I click the "Jiangsu" button
    And I click the "Generate" button
    And I wait for "1000" millsecond
    Then take part of "Chart" with name "../UI_test_screenshot/timedtask/2794"

  Scenario Outline: RZY-3092、3247、3094、3248、3096、3249、3098
    When I set the parameter "SearchInput" with value "<spl>"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait element "SearchStatus" change text to "搜索完成!"
    Then I will see the "trend.CreatePage" page
    And I wait for "1000" millsecond
    Then take part of "Chart" with name "../UI_test_screenshot/timedtask/<num>"

    Examples:
      | spl                                                                                                                                                                                                                  | num  |
      | tag:\"sample04061424_display\" \| timechart cont=true span=30m rendertype=\"line\" count() min(apache.resp_len) by apache.status                                                                                     | 3092 |
      | tag:\"sample04061424_display\"\| timechart sep=\"-sep分格-\" format=\"$VAL-分格2-$AGG\" cont=true span=30m bins=100 startindex=0 endindex=8 limit=5 rendertype=\"line\" count() min(apache.resp_len) by apache.status    | 3247 |
      | tag:\"sample04061424_display\" \| timechart cont=true span=30m rendertype=\"area\" count() min(apache.resp_len) by apache.status                                                                                     | 3094 |
      | tag:\"sample04061424_display\"\| timechart sep=\"-sep分格-\" format=\"$VAL-分格2-$AGG\" cont=true span=30m bins=100 startindex=0 endindex=8 limit=5 rendertype=\"area\" count() min(apache.resp_len) by apache.status    | 3248 |
      | tag:\"sample04061424_display\" \| timechart cont=true span=30m rendertype=\"scatter\" count() min(apache.resp_len) by apache.status                                                                                  | 3096 |
      | tag:\"sample04061424_display\"\| timechart sep=\"-sep分格-\" format=\"$VAL-分格2-$AGG\" cont=true span=30m bins=100 startindex=0 endindex=8 limit=5 rendertype=\"scatter\" count() min(apache.resp_len) by apache.status | 3249 |
      | tag:\"sample04061424_display\" \| timechart cont=true span=30m rendertype=\"column\" count() min(apache.resp_len) by apache.status                                                                                   | 3098 |

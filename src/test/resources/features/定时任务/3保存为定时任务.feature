@saveAsTimedTask
Feature: 定时任务保存为

# 26

  Background:
    Given open the "splSearch.SearchPage" page for uri "/search/"
    And I wait for element "SearchStatus" change text to "搜索完成!"


  Scenario Outline: sample(RZY-3328-3338)
    Given I set the parameter "SearchInput" with value "<spl>"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I will see the "trend.CreatePage" page
    And I click the "Type" button
    And I click the "<type>" button
    And I click the "<chartType>" button

    And I click the "Type" button
    And I wait for "Chart" will be visible
    And I click the "SaveAsSchedule" button
    And I will see the "splSearch.SearchPage" page
    And I set the parameter "Describe" with value "AutoCreate"

    And I click the "Crontab" button
    And I set the parameter "CrontabInput" with value "0 */30 * * * ?"
    And I set the parameter "TaskName" with value "<caseNum>_<chartType>"
    And I click the "EnsureButton" button
    And I wait for "TimeTaskEnsure" will be visible
    Then I will see the success message "保存成功"

    Examples:
      |   caseNum   |  type       | chartType     |  spl  |
      |   3328      |  Order      | LineChart     |  tag:sample04061424_chart \| stats count() by apache.clientip,apache.method \| limit 10 |
      |   3329      |  Order      | AreaChart     |  tag:sample04061424_chart \| stats count() by apache.clientip,apache.method \| limit 10 |
      |   3330      |  Order      | ScatterChart  |  tag:sample04061424_chart \| stats count() by apache.clientip,apache.method \| limit 10 |
      |   3331      |  Order      | ColumnChart   |  tag:sample04061424_chart \| stats count() by apache.clientip,apache.method \| limit 10 |
      |   3332      |  Dimension  | Pie           |  tag:sample04061424_chart  \| stats count(apache.clientip) as ip_count by apache.clientip \| sort by ip_count \| limit 5 |
      |   3333      |  Dimension  | Rose          |  tag:sample04061424_chart  \| stats count(apache.clientip) as ip_count by apache.clientip \| sort by ip_count \| limit 5 |
      |   3334      |  Dimension  | Bar           |  tag:sample04061424_chart  \| stats count(apache.clientip) as ip_count by apache.clientip \| sort by ip_count \| limit 5 |
      |   3335      |  Dimension  | Sun           |  tag:sample04061424_chart  \| stats count() by apache.status,apache.geo.province, apache.geo.city|
      |   3336      |  Connection | Chord         |  tag:sample04061424_chart  \| stats count() by apache.clientip,apache.request_path  |
      |   3337      |  Connection | Sankey        |  tag:sample04061424_chart  AND NOT apache.clientip:221.226.97.92 AND NOT apache.clientip:117.136.79.162 \| stats count() by apache.clientip,apache.resp_len,apache.method \| limit 4 |
      |   3338      |  Connection | Force         |  tag:sample04061424_chart  \| stats count() by apache.clientip,apache.request_path \|limit 10      |

  Scenario Outline: sample_compound_rangeline(RZY-3339)
    Given I set the parameter "SearchInput" with value "<spl>"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I will see the "trend.CreatePage" page
    And I click the "Type" button
    And I click the "Compound" button
    And I click the "<chartType>" button

    And I click the "Settings" button
    And I will see the "trend.CreatePage" page
    And I click the "Xaxis" button
    And I choose the "<xValue>" from the "FieldValue"
    And I click the "Yaxis" button
    And I choose the "<actualValue>" from the "Actual"
    And I choose the "<predictedValue>" from the "Predict"
    And I choose the "<upperValue>" from the "TopLimit"
    And I choose the "<lowerValue>" from the "LowerLimit"
    And I click the "Generate" button
    And I click the "Settings" button

    And I wait for "Chart" will be visible
    And I click the "SaveAsSchedule" button
    And I will see the "splSearch.SearchPage" page
    And I set the parameter "Describe" with value "AutoCreate"

    And I click the "Crontab" button
    And I set the parameter "CrontabInput" with value "0 */30 * * * ?"
    And I set the parameter "TaskName" with value "<caseNum>_<chartType>"
    And I click the "EnsureButton" button
    And I wait for "TimeTaskEnsure" will be visible
    Then I will see the success message "保存成功"

    Examples:
      |   caseNum   | chartType     | xValue | actualValue|  predictedValue| upperValue | lowerValue |  spl  |
      |   3339      | Rangeline     |   ts   |   cnt      |   _predict_cnt |    upper95 |    lower95 |  tag: sample04061424_chart \| bucket timestamp span=1h as ts \| stats count\(\) as cnt by ts \| esma cnt timefield=ts  |

  Scenario Outline: sample_compound_multiaxis(RZY-3340)
    Given I set the parameter "SearchInput" with value "<spl>"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I will see the "trend.CreatePage" page
    And I click the "Type" button
    And I click the "Compound" button
    And I click the "<chartType>" button

    And I click the "Settings" button
    And I click the "Xaxis" button
    And I choose the "apache.resp_len" from the "FieldValue"
    And I click the "FirstLabel" button
    And I click the "AscendingOrder" button
    And I click the "Yaxis" button
    And I choose the "max(apache.resp_len)" from the "FieldValue"
    And I choose the "面积图" from the "TypeChartField"
    And I set the parameter "Unit" with value "面"
    And I click the "Smooth" button
    And I click the "ConnectEmptyData" button
    And I set the parameter "Min" with value "1"
    And I set the parameter "Max" with value "170000"

    And I click the "AddField" button
    And I drag the scroll bar to the element "FieldValue"
    And I choose the "min(apache.resp_len)" from the "FieldValue"
    And I choose the "柱状图" from the "TypeChartField"
    And I set the parameter "Unit" with value "柱"
    And I set the parameter "Min" with value "2"
    And I set the parameter "Max" with value ""

    And I click the "Exhibition" button
    And I click the "AddColor" button
    And I click the "Red" button
    And I click the "Generate" button

    And I click the "Settings" button

    And I wait for "Chart" will be visible
    And I click the "SaveAsSchedule" button
    And I will see the "splSearch.SearchPage" page
    And I set the parameter "Describe" with value "AutoCreate"

    And I click the "Crontab" button
    And I set the parameter "CrontabInput" with value "0 */30 * * * ?"
    And I set the parameter "TaskName" with value "<caseNum>_<chartType>"
    And I click the "EnsureButton" button
    And I wait for "TimeTaskEnsure" will be visible
    Then I will see the success message "保存成功"

    Examples:
      |   caseNum   | chartType     |   spl  |
      |   3340      | Multiaxis     |  tag: sample04061424_display \| stats count(apache.resp_len), max(apache.resp_len), min(apache.resp_len), sum(apache.status), avg(apache.resp_len) by apache.resp_len,apache.status \| limit 5 |

  Scenario Outline: sample_map(RZY-3341,3344)
    Given I set the parameter "SearchInput" with value "<spl>"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I will see the "trend.CreatePage" page
    And I click the "Type" button
    And I click the "Map" button
    And I click the "<chartType>" button

    And I click the "Type" button
    And I wait for "<chart>" will be visible
    And I click the "SaveAsSchedule" button
    And I will see the "splSearch.SearchPage" page
    And I set the parameter "Describe" with value "AutoCreate"

    And I click the "Crontab" button
    And I set the parameter "CrontabInput" with value "0 */30 * * * ?"
    And I set the parameter "TaskName" with value "<caseNum>_<chartType>"
    And I click the "EnsureButton" button
    And I wait for "TimeTaskEnsure" will be visible
    Then I will see the success message "保存成功"

    Examples:
      |   caseNum   | chartType          | chart            |  spl  |
      |   3341      |   Heatmap          | Chart            | tag:sample04061424_chart \| stats count() by apache.geo.city |
      |   3344      |   Statisticalmap   | StatisticalChart | tag:vendors_461 \| geostats latfield=vendors.VendorLatitude longfield=vendors.VendorLongitude count() as cnt|


  Scenario Outline: sample_attackmap(RZY-3342)
    Given I set the parameter "SearchInput" with value "<spl>"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I will see the "trend.CreatePage" page
    And I click the "Type" button
    And I click the "Map" button
    And I click the "<chartType>" button

    And I click the "Settings" button
    And I click the "Source" button
    And I choose the "apache.clientip" from the "FieldValue"
    And I choose the "clientlon" from the "FieldLongitude"
    And I choose the "clientlat" from the "FieldLatitude"
    And I click the "Target" button
    And I choose the "gw_address" from the "FieldValue"
    And I choose the "gw_lon" from the "FieldLongitude"
    And I choose the "gw_lat" from the "FieldLatitude"
    And I click the "Weight" button
    And I choose the "cnt" from the "FieldValue"
    And I click the "Region" button
    And I click the "Select<regionBut>" button
    And I click the "Generate" button
    And I click the "Settings" button

    And I wait for "Chart" will be visible
    And I click the "SaveAsSchedule" button
    And I will see the "splSearch.SearchPage" page
    And I set the parameter "Describe" with value "AutoCreate"

    And I click the "Crontab" button
    And I set the parameter "CrontabInput" with value "0 */30 * * * ?"
    And I set the parameter "TaskName" with value "<caseNum>_<chartType>"
    And I click the "EnsureButton" button
    And I wait for "TimeTaskEnsure" will be visible
    Then I will see the success message "保存成功"

    Examples:
      |   caseNum   | chartType   |  spl  |
      |   3342      | Attackmap   | tag:sample04061424_chart \| parse field=apache.request_query \"\^gw_address=(\?<gw_address>\\\d+\\\.\\\d+\\\.\\\d+\\\.\\\d+)\" \| stats count() as cnt, min(apache.geo.latitude) as client_lat, min(apache.geo.longitude) as client_lon by apache.clientip, gw_address \| eval gw_lat=39.5427 \| eval gw_lon=116.2317 \|eval clientlon= -0.127758 \| eval clientlat=51.507   |

  Scenario Outline: sample_regionmap(RZY-3343)
    Given I set the parameter "SearchInput" with value "<spl>"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I will see the "trend.CreatePage" page
    And I click the "Type" button
    And I click the "Map" button
    And I click the "<chartType>" button

    And I click the "Settings" button
    And I click the "Divide" button
    And I choose the "apache.geo.province" from the "FieldValue"
    And I click the "Region" button
    And I click the "SelectChina" button
    And I click the "GoingDown" button
    And I choose the "apache.geo.province" from the "Province"
    And I choose the "apache.geo.city" from the "City"
    And I click the "Generate" button
    And I click the "Settings" button

    And I wait for "Chart" will be visible
    And I click the "SaveAsSchedule" button
    And I will see the "splSearch.SearchPage" page
    And I set the parameter "Describe" with value "AutoCreate"

    And I click the "Crontab" button
    And I set the parameter "CrontabInput" with value "0 */30 * * * ?"
    And I set the parameter "TaskName" with value "<caseNum>_<chartType>"
    And I click the "EnsureButton" button
    And I wait for "TimeTaskEnsure" will be visible
    Then I will see the success message "保存成功"

    Examples:
      |   caseNum   | chartType   |  spl  |
      |   3343      | Regionmap   | tag:sample04061424_chart \| stats count() by apache.geo.country, apache.geo.province, apache.geo.city|

  Scenario Outline: sample_single(RZY-3345)
    Given I set the parameter "SearchInput" with value "<spl>"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I will see the "trend.CreatePage" page
    And I click the "Type" button
    And I click the "Other" button
    And I click the "<chartType>" button

    And I click the "Settings" button
    And I click the "Exhibition" button
    And I click the "AccordingTrend" button
    And I set the parameter "FontSize" with value "150"
    And I choose the "一周前" from the "ContrastTime"
    And I click the "Generate" button
    And I click the "Settings" button

    And I wait for "StatisticalChart" will be visible
    And I click the "SaveAsSchedule" button
    And I will see the "splSearch.SearchPage" page
    And I set the parameter "Describe" with value "AutoCreate"

    And I click the "Crontab" button
    And I set the parameter "CrontabInput" with value "0 */30 * * * ?"
    And I set the parameter "TaskName" with value "<caseNum>_<chartType>"
    And I click the "EnsureButton" button
    And I wait for "TimeTaskEnsure" will be visible
    Then I will see the success message "保存成功"

    Examples:
      |   caseNum   | chartType   |  spl  |
      |   3345      | Single      | tag:sample04061424_chart \| stats count\(\) as cnt \| eval icon=if\(cnt\>1000000,\"thumbs-down\",\"thumbs-up\"\) |

  Scenario Outline: sample_ring(RZY-4411)
    Given I set the parameter "SearchInput" with value "<spl>"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I will see the "trend.CreatePage" page
    And I click the "Type" button
    And I click the "Other" button
    And I click the "<chartType>" button

    And I click the "Settings" button
    And I choose the "count_perc" from the "FieldValue"
    And I click the "Compare" button
    And I click the "AddField" button
    And I choose the "count2_perc" from the "FieldValue"
    And I click the "Generate" button
    And I click the "Settings" button

    And I wait for "1500" millsecond
    And I wait for "StatisticalChart" will be visible
    And I click the "SaveAsSchedule" button
    And I will see the "splSearch.SearchPage" page
    And I set the parameter "Describe" with value "AutoCreate"

    And I click the "Crontab" button
    And I set the parameter "CrontabInput" with value "0 */30 * * * ?"
    And I set the parameter "TaskName" with value "<caseNum>_<chartType>"
    And I click the "EnsureButton" button
    And I wait for "TimeTaskEnsure" will be visible
    Then I will see the success message "保存成功"

    Examples:
      |   caseNum   | chartType   |  spl  |
      |   4411      | Ring        | tag:sample04061424_chart \| stats count(apache.clientip) as ip_count by apache.clientip \| sort by ip_count \|eval count_perc=ip_count/50 \| eval count2_perc=ip_count/200 \| limit 6 |

  Scenario Outline: sample_liquidfill(RZY-3346)
    Given I set the parameter "SearchInput" with value "<spl>"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I will see the "trend.CreatePage" page
    And I click the "Type" button
    And I click the "Other" button
    And I click the "<chartType>" button

    And I click the "Settings" button
    And I choose the "cnt_perc" from the "FieldValue"
    And I click the "Generate" button
    And I click the "Settings" button

    And I wait for "StatisticalChart" will be visible
    And I click the "SaveAsSchedule" button
    And I will see the "splSearch.SearchPage" page
    And I set the parameter "Describe" with value "AutoCreate"

    And I click the "Crontab" button
    And I set the parameter "CrontabInput" with value "0 */30 * * * ?"
    And I set the parameter "TaskName" with value "<caseNum>_<chartType>"
    And I click the "EnsureButton" button
    And I wait for "TimeTaskEnsure" will be visible
    Then I will see the success message "保存成功"

    Examples:
      |   caseNum   | chartType   |  spl  |
      |   3346      | Liquidfill  | tag:sample04061424_chart \| stats count() as cnt\| eval cnt_perc=cnt/1000 |

  Scenario Outline: sample_others(RZY-3347,3349,3350)
    Given I set the parameter "SearchInput" with value "<spl>"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I will see the "trend.CreatePage" page
    And I click the "Type" button
    And I click the "Other" button
    And I click the "<chartType>" button

    And I wait for "1500" millsecond
    And I wait for "StatisticalChart" will be visible
    And I click the "SaveAsSchedule" button
    And I will see the "splSearch.SearchPage" page
    And I set the parameter "Describe" with value "AutoCreate"

    And I click the "Crontab" button
    And I set the parameter "CrontabInput" with value "0 */30 * * * ?"
    And I set the parameter "TaskName" with value "<caseNum>_<chartType>"
    And I click the "EnsureButton" button
    And I wait for "TimeTaskEnsure" will be visible
    Then I will see the success message "保存成功"

    Examples:
      |   caseNum   | chartType   |  spl  |
      |   3347      | Wordcloud   | tag:sample04061424_chart \| stats count() by apache.geo.city |
      |   3349      | Radar       | tag:sample04061424_chart \| stats count() by apache.status,apache.geo.city |
      |   3350      | Funnel      | tag:sample04061424_chart \| stats count() by apache.clientip \| limit 5 |

  Scenario Outline: sample_sequence(RZY-3348)
    Given I set the parameter "SearchInput" with value "<spl>"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I will see the "trend.CreatePage" page
    And I click the "Type" button
    And I click the "Other" button
    And I click the "<chartType>" button

    And I click the "Settings" button
    And I click the "TimeSequence" button
    And I choose the "hostname" from the "FieldValue"
    And I click the "Source" button
    And I choose the "apache.clientip" from the "FieldValue"
    And I click the "Target" button
    And I choose the "hostname" from the "FieldValue"
    And I click the "Divide" button
    And I choose the "apache.clientip" from the "FieldValue"
    And I click the "Mark" button
    And I choose the "count()" from the "FieldValue"
    And I click the "Generate" button

    And I click the "Settings" button
    And I wait for "ChartView" will be visible
    And I wait for "2000" millsecond
    And I click the "SaveAsSchedule" button
    And I will see the "splSearch.SearchPage" page
    And I set the parameter "Describe" with value "AutoCreate"

    And I click the "Crontab" button
    And I set the parameter "CrontabInput" with value "0 */30 * * * ?"
    And I set the parameter "TaskName" with value "<caseNum>_<chartType>"
    And I click the "EnsureButton" button
    And I wait for "TimeTaskEnsure" will be visible
    Then I will see the success message "保存成功"

    Examples:
      | caseNum |  chartType |   spl   |
      |  3348   |  Sequence  |tag:sample04061424_chart \| stats count() by hostname,apache.clientip \|limit 4|

  Scenario Outline: sample_matrixheatmap(RZY-3351)
    Given I set the parameter "SearchInput" with value "<spl>"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I will see the "trend.CreatePage" page
    And I click the "Type" button
    And I click the "Other" button
    And I click the "<chartType>" button

    And I click the "Settings" button
    And I click the "Xaxis" button
    And I choose the "<xValue>" from the "FieldValue"
    And I click the "Yaxis" button
    And I choose the "<yValue>" from the "FieldValue"
    And I set the parameter "Segments" with value "<segNum>"
    And I click the "Generate" button

    And I click the "Settings" button
    And I wait for "ChartView" will be visible
    And I wait for "2000" millsecond
    And I click the "SaveAsSchedule" button
    And I will see the "splSearch.SearchPage" page
    And I set the parameter "Describe" with value "AutoCreate"

    And I click the "Crontab" button
    And I set the parameter "CrontabInput" with value "0 */30 * * * ?"
    And I set the parameter "TaskName" with value "<caseNum>_<chartType>"
    And I click the "EnsureButton" button
    And I wait for "TimeTaskEnsure" will be visible
    Then I will see the success message "保存成功"

    Examples:
      | caseNum |     chartType   |  xValue         |  yValue       | segNum |   spl   |
      |  3351   |  Matrixheatmap  |  count()        | apache.status |  10    | tag:sample04061424_chart \| stats count() by hostname,apache.clientip \|limit 4|

  Scenario Outline: sample_chain(RZY-3352)
    Given I set the parameter "SearchInput" with value "<spl>"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I will see the "trend.CreatePage" page
    And I click the "Type" button
    And I click the "Other" button
    And I click the "<chartType>" button

    And I click the "Settings" button
    And I choose the "<function>" from the "Function"
    And I choose the "<parentIDvalue>" from the "ParentId"
    And I choose the "<childIDvalue>" from the "ChildId"
    And I click the "Time" button
    And I choose the "<starttime>" from the "StartTime"
    And I choose the "<duration>" from the "KeepTime"
    And I click the "Divide" button
    And I choose the "<childIDvalue>" from the "FieldValue"
    And I click the "Info" button
    And I choose the "<infoValue>" from the "InfoField"
    And I click the "Generate" button

    And I click the "Settings" button
    And I wait for "ChartView" will be visible
    And I wait for "2000" millsecond
    And I click the "SaveAsSchedule" button
    And I will see the "splSearch.SearchPage" page
    And I set the parameter "Describe" with value "AutoCreate"

    And I click the "Crontab" button
    And I set the parameter "CrontabInput" with value "0 */30 * * * ?"
    And I set the parameter "TaskName" with value "<caseNum>_<chartType>"
    And I click the "EnsureButton" button
    And I wait for "TimeTaskEnsure" will be visible
    Then I will see the success message "保存成功"

    Examples:
      | caseNum |  chartType |function     |  parentIDvalue       | childIDvalue  |      starttime         | duration            | infoValue                             |   spl   |
      |  3352   |  Chain     |dapper.class | dapper.msg.parentId  | dapper.msg.id |dapper.msg.timestamp    | dapper.msg.duration |  dapper.msg.binaryAnnotations[].value | tag:gf_dapper* AND dapper.msg.traceId:\"511f8756ce1d0b8a\" dapper.msg.duration:\>0 \| table dapper.msg.id, dapper.msg.parentId, dapper.class, dapper.msg.duration, dapper.msg.timestamp,dapper.msg.binaryAnnotations[].value, collector_recv_timestamp|

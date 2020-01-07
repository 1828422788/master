Feature: 高级搜索视图_其它
#18 (15)

  # tag:sample04061424_chart should be uploaded
  Background:
    Given open the "splSearch.SearchPage" page for uri "/search/"
    And I wait for element "SearchStatus" change text to "搜索完成!"

  Scenario Outline: 其它(RZY-2303,2804,2807,2449)
    When I set the parameter "SearchInput" with value "<spl>"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I will see the "trend.CreatePage" page
    And I click the "Type" button
    And I click the "Other" button
    And I click the "<chartType>" button
    And I wait for "1500" millsecond
    And I wait for "ChartView" will be visible
    And I drag the scroll bar to the element "ChartView"
    Then take part of "ChartView" with name "日志展现/高级搜索视图/其它/<caseNum>_<chartType>"

    Examples:
      |  chartType    |caseNum  |   spl   |
      |   Single      | 2303    | tag:sample04061424_chart \| stats count\(\) as cnt \| eval icon=if\(cnt\>1000000,\"thumbs-down\",\"thumbs-up\"\) |
      |   Wordcloud   | 2804    | tag:sample04061424_chart \| stats count() by apache.geo.city |
      |   Radar       | 2807    | tag:sample04061424_chart \| stats count() by apache.status,apache.geo.city |
      |   Funnel      | 2449    | tag:sample04061424_chart \| stats count() by apache.clientip \| limit 5 |

  Scenario Outline: 其它_单值_icon(RZY-2799)
    When I set the parameter "SearchInput" with value "<spl>"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I will see the "trend.CreatePage" page
    And I click the "Type" button
    And I click the "Other" button
    And I click the "<chartType>" button
    And I click the "Settings" button
    And I click the "Icon" button
    And I click the "AccordingField" button
    And I choose the "<iconValue>" from the "FieldValue"
    And I click the "Generate" button
    And I wait for "1500" millsecond
    And I wait for "ChartView" will be visible
    And I drag the scroll bar to the element "ChartView"
    Then take part of "ChartView" with name "日志展现/高级搜索视图/其它/<caseNum>_<chartType>/<caseNum>_<iconValue>"

    Examples:
      |  chartType    |   iconValue  |  caseNum  |   spl   |
      |   Single      |    icon      |   2799    | tag:sample04061424_chart \| stats count\(\) as cnt \| eval icon=if\(cnt\>1000000,\"thumbs-down\",\"thumbs-up\"\) |
      |   Single      |    cnt       |   2799    | tag:sample04061424_chart \| stats count\(\) as cnt \| eval icon=if\(cnt\>1000000,\"thumbs-down\",\"thumbs-up\"\) |


  Scenario Outline: 其它_单值_font(RZY-2799)
    When I set the parameter "SearchInput" with value "<spl>"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I will see the "trend.CreatePage" page
    And I click the "Type" button
    And I click the "Other" button
    And I click the "<chartType>" button
    And I click the "Settings" button
    And I click the "Icon" button
    And I click the "AccordingName" button
    And I set the parameter "IconName" with value "<fontValue>"
    And I click the "Generate" button
    And I wait for "1500" millsecond
    And I wait for "ChartView" will be visible
    And I drag the scroll bar to the element "ChartView"
    Then take part of "ChartView" with name "日志展现/高级搜索视图/其它/<caseNum>_<chartType>/<caseNum>_<fontValue>"

    Examples:
      |  chartType    |   fontValue       |  caseNum  |   spl   |
      |   Single      | font-awesome-flag |   2799    | tag:sample04061424_chart \| stats count\(\) as cnt \| eval icon=if\(cnt\>1000000,\"thumbs-down\",\"thumbs-up\"\) |
      |   Single      | font-awesome      |   2799    | tag:sample04061424_chart \| stats count\(\) as cnt \| eval icon=if\(cnt\>1000000,\"thumbs-down\",\"thumbs-up\"\) |

  Scenario Outline: 其它_单值_背景(RZY-2800)
    When I set the parameter "SearchInput" with value "<spl>"
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
    And I click the "Background" button
    And I click the "Generate" button
    And I wait for "1500" millsecond
    And I wait for "ChartView" will be visible
    And I drag the scroll bar to the element "ChartView"
    Then take part of "ChartView" with name "日志展现/高级搜索视图/其它/<caseNum>_<chartType>"

    Examples:
      |  chartType    |  caseNum  |   spl   |
      |   Single      |   2800    | tag:sample04061424_chart \| stats count\(\) as cnt \| eval icon=if\(cnt\>1000000,\"thumbs-down\",\"thumbs-up\"\) |


  Scenario Outline: 其它_单值_按趋势(RZY-1369)
    When I set the parameter "SearchInput" with value "<spl>"
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
    And I choose the "<timeValue>" from the "ContrastTime"
    And I click the "Generate" button
    And I wait for "1500" millsecond
    And I wait for "ChartView" will be visible
    And I drag the scroll bar to the element "ChartView"
    Then take part of "ChartView" with name "日志展现/高级搜索视图/其它/<caseNum>_<chartType>"

    Examples:
      |  chartType    |  caseNum  | timeValue    |   spl   |
      |   Single      |   1369    | 一周前        |tag:sample04061424_chart \| stats count\(\) as cnt \| eval icon=if\(cnt\>1000000,\"thumbs-down\",\"thumbs-up\"\) |

  Scenario Outline: 其它_单值_按区间(RZY-1370)
    When I set the parameter "SearchInput" with value "<spl>"
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
    And I click the "AccordingArea" button
    And I set the parameter "MinRange" with value "<minVal1>"
    And I set the parameter "MaxRange" with value "<maxVal1>"
    And I click the "AddColor" button
    And I click the "<color1>" button
    And I click the "AddRange" button
    And I set the parameter "MinRange" with value "<minVal2>"
    And I set the parameter "MaxRange" with value "<maxVal2>"
    And I click the "AddColor" button
    And I click the "<color2>" button
    And I click the "<colorFill>" button
    And I click the "Generate" button
    And I wait for "1500" millsecond
    And I wait for "ChartView" will be visible
    And I drag the scroll bar to the element "ChartView"
    Then take part of "ChartView" with name "日志展现/高级搜索视图/其它/<caseNum>_<chartType>/<caseNum>_<chartType>_<colorFill>"

    Examples:
      |  chartType    |  caseNum  | minVal1 | maxVal1  |  color1  | minVal2 | maxVal2  |  color2  | colorFill     |   spl   |
      |   Single      |   1370    | 0       |  100     |   Green  |  100    |   1000   |    Red   |  Font         |tag:sample04061424_chart \| stats count\(\) as cnt \| eval icon=if\(cnt\>1000000,\"thumbs-down\",\"thumbs-up\"\) |
      |   Single      |   1370    | 0       |  100     |   Green  |  100    |   1000   |    Red   |  Background   |tag:sample04061424_chart \| stats count\(\) as cnt \| eval cnt = 99 \| eval icon=if\(cnt\>1000000,\"thumbs-down\",\"thumbs-up\"\) |

  Scenario Outline: 其它_雷达图(RZY-2808)
    When I set the parameter "SearchInput" with value "<spl>"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I will see the "trend.CreatePage" page
    And I click the "Type" button
    And I click the "Other" button
    And I click the "<chartType>" button
    And I click the "Settings" button
    And I click the "Divide" button
    And I choose the "<divField>" from the "FieldValue"
    And I click the "UnifyMetric" button
    And I click the "Indicator" button
    And I choose the "<divField>" from the "FieldValue"
    And I click the "Exhibition" button
    And I click the "AddColor" button
    And I click the "<color1>" button
    And I click the "Generate" button
    And I wait for "1500" millsecond
    And I wait for "ChartView" will be visible
    And I drag the scroll bar to the element "ChartView"
    Then take part of "ChartView" with name "日志展现/高级搜索视图/其它/<caseNum>_<chartType>"

    Examples:
      |  chartType    | divField       | color1 | caseNum  |   spl   |
      |   Radar       | apache.geo.city| Yellow | 2808    | tag:sample04061424_chart \| stats count() by apache.status,apache.geo.city |

  Scenario Outline: 其它_漏斗图(RZY-2809)
    When I set the parameter "SearchInput" with value "<spl>"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I will see the "trend.CreatePage" page
    And I click the "Type" button
    And I click the "Other" button
    And I click the "<chartType>" button
    And I click the "Settings" button
    And I click the "Value" button
    And I choose the "<countValue>" from the "FieldValue"
    And I click the "Divide" button
    And I choose the "<divValue>" from the "FieldValue"
    And I click the "Example" button
    And I click the "FirstPosition" button
    And I click the "Exhibition" button
    And I click the "AddColor" button
    And I click the "<color1>" button
    And I click the "Generate" button
    And I wait for "1500" millsecond
    And I wait for "ChartView" will be visible
    And I drag the scroll bar to the element "ChartView"
    Then take part of "ChartView" with name "日志展现/高级搜索视图/其它/<caseNum>_<chartType>"

    Examples:
      |  chartType    | countValue |  divValue      |  color1   |caseNum  |   spl   |
      |   Funnel      |  count()   | apache.geo.city|LightGreen |2809    | tag:sample04061424_chart \| stats count() by apache.status,apache.geo.city |

  Scenario Outline: 其它_矩阵热力图(RZY-2810,2811)
    When I set the parameter "SearchInput" with value "<spl>"
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
    And I wait for "1500" millsecond
    And I wait for "ChartView" will be visible
    And I drag the scroll bar to the element "ChartView"
    Then take part of "ChartView" with name "日志展现/高级搜索视图/其它/<caseNum>_<chartType>"

    Examples:
      |  chartType     |  xValue         |  yValue       | segNum |caseNum  |   spl   |
      |  Matrixheatmap |  count()        | apache.status |  10    |2810    | tag:sample04061424_chart \| stats count() by apache.status,apache.geo.city |
      |  Matrixheatmap | apache.geo.city |    count()    |  5     |2811    | tag:sample04061424_chart \| stats count() by apache.status,apache.geo.city |


  Scenario Outline: 其它_调用链(RZY-2812,2814)
    When I set the parameter "SearchInput" with value "<spl>"
    And I click the "DateEditor" button
    And I click the "ThisMonth" button
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
    And I wait for "1500" millsecond
    And I wait for "ChartView" will be visible
    And I drag the scroll bar to the element "ChartView"
    Then take part of "ChartView" with name "日志展现/高级搜索视图/其它/<caseNum>_<chartType>"

    Examples:
      |  chartType |  function     |  parentIDvalue       | childIDvalue  |      starttime         | duration            | infoValue                             | caseNum |   spl   |
      |  Chain     |  dapper.class | dapper.msg.parentId  | dapper.msg.id |dapper.msg.timestamp    | dapper.msg.duration |  dapper.msg.binaryAnnotations[].value | 2812    |tag:gf_dapper\* AND dapper.msg.traceId:\"511f8756ce1d0b8a\" dapper.msg.duration:\>0 \| table dapper.msg.id, dapper.msg.parentId, dapper.class, dapper.msg.duration, dapper.msg.timestamp,dapper.msg.binaryAnnotations\[\].value, collector_recv_timestamp|
      |  Chain     |  dapper.class | dapper.msg.parentId  | dapper.msg.id |collector_recv_timestamp| dapper.msg.duration |  dapper.msg.binaryAnnotations[].value | 2814    |tag:gf_dapper\* AND dapper.msg.traceId:\"511f8756ce1d0b8a\" dapper.msg.duration:\>0 \| table dapper.msg.id, dapper.msg.parentId, dapper.class, dapper.msg.duration, dapper.msg.timestamp,dapper.msg.binaryAnnotations\[\].value, collector_recv_timestamp|


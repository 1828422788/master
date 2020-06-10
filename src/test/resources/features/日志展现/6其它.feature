@all @logDisplay @logDisplayOther
Feature: 日志展现_其它
#16 (19) bug

  # tag:sample04061424_chart should be uploaded for Yesterday
  Background:
    Given open the "splSearch.SearchPage" page for uri "/search/"
    And I wait for element "SearchStatus" change text to "搜索完成!"

    # the chart is different every time, can not compare
  Scenario Outline: others(RZY-2804)
    When I set the parameter "SearchInput" with value "<spl>"
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I will see the "trend.CreatePage" page
    And I click the "Type" button
    And I click the "Other" button
    And I click the "<chartType>" button

    And I click the "Type" button
    And I wait for "ChartView" will be visible
    And I drag the scroll bar to the element "ChartView"
    And I wait for "2000" millsecond
    And take part of "ChartView" with name "actual/高级搜索视图/6其它/<caseNum>_<chartType>"
#    Then I compare source image "actual/高级搜索视图/6其它/<caseNum>_<chartType>" with target image "expect/高级搜索视图/6其它/<caseNum>_<chartType>"

    Examples:
      |  chartType    |caseNum  |   spl   |
      |   Wordcloud   | 2804    | starttime=\"now/d-24h\" endtime=\"now/d\" tag:sample04061424_chart \| stats count() by apache.geo.city |

  Scenario Outline: liquidfill
    When I set the parameter "SearchInput" with value "<spl>"
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I will see the "trend.CreatePage" page
    And I click the "Type" button
    And I click the "Other" button
    And I click the "<chartType>" button
    And I click the "Settings" button
    And I choose the "cnt_perc" from the "FieldValue" in config
    And I click the "Exhibition" button
    And I click the "AddColor" button
    And I click the "Orange" button
    And I choose the "1" from the "Precision" in config
    And I click the "Generate" button

    And I click the "Settings" button
    And I wait for "ChartView" will be visible
    And I drag the scroll bar to the element "ChartView"
    And I wait for "2000" millsecond
    And take part of "ChartView" with name "actual/高级搜索视图/6其它/<chartType>_<caseNum>"
    Then I compare source image "actual/高级搜索视图/6其它/<chartType>_<caseNum>" with target image "expect/高级搜索视图/6其它/<chartType>_<caseNum>"

    Examples:
      | chartType  | caseNum | spl                                                                       |
      | Liquidfill | percent | starttime=\"now/d-24h\" endtime=\"now/d\" tag:sample04061424_chart \| stats count() as cnt\| eval cnt_perc=cnt/1000 |

  Scenario Outline: liquidfill_facet
    When I set the parameter "SearchInput" with value "<spl>"
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I will see the "trend.CreatePage" page
    And I click the "Type" button
    And I click the "Other" button
    And I click the "<chartType>" button
    And I click the "Settings" button
    And I choose the "cnt" from the "FieldValue" in config
    And I click the "Facet" button
    And I click the "AddField" button
    And I choose the "apache.method" from the "FieldValue"
    And I set the parameter "RowNum" with value "1"
    And I set the parameter "ColumnNum" with value "2"
    And I click the "Exhibition" button
    And I click the "AddColor" button
    And I click the "Red" button
    And I click the "Generate" button

    And I click the "Settings" button
    And I wait for "StatisticalChart" will be visible
    And I drag the scroll bar to the element "StatisticalChart"
    And I wait for "2000" millsecond
    And take part of "StatisticalChart" with name "actual/高级搜索视图/6其它/<chartType>_<caseNum>"
    Then I compare source image "actual/高级搜索视图/6其它/<chartType>_<caseNum>" with target image "expect/高级搜索视图/6其它/<chartType>_<caseNum>"

    Examples:
      | chartType  | caseNum | spl                                                                       |
      | Liquidfill | 分面    | starttime=\"now/d-24h\" endtime=\"now/d\" tag:sample04061424_chart \| stats count(apache.clientip) as ip_count by apache.clientip, apache.method \| sort by apache.clientip \| limit 2 \| eval cnt = ip_count/10|

@funnel
  Scenario Outline: others(RZY-2807,2449)
    When I set the parameter "SearchInput" with value "<spl>"
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I will see the "trend.CreatePage" page
    And I click the "Type" button
    And I click the "Other" button
    And I click the "<chartType>" button

    And I click the "Type" button
    And I wait for "ChartView" will be visible
    And I drag the scroll bar to the element "ChartView"
    And I wait for "2000" millsecond
    And take part of "ChartView" with name "actual/高级搜索视图/6其它/<caseNum>_<chartType>"
    Then I compare source image "actual/高级搜索视图/6其它/<caseNum>_<chartType>" with target image "expect/高级搜索视图/6其它/<caseNum>_<chartType>"

    Examples:
      |  chartType    |caseNum  |   spl   |
      |   Radar       | 2807    | starttime=\"now/d-24h\" endtime=\"now/d\" tag:sample04061424_chart \| stats count() by apache.status,apache.geo.city |
      |   Funnel      | 2449    | starttime=\"now/d-24h\" endtime=\"now/d\" tag:sample04061424_chart \| stats count() as cnt by apache.clientip \| sort by cnt, apache.clientip \|limit 5 |


  Scenario Outline: radar(RZY-2808)
    When I set the parameter "SearchInput" with value "<spl>"
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I will see the "trend.CreatePage" page
    And I click the "Type" button
    And I click the "Other" button
    And I click the "<chartType>" button
    And I click the "Settings" button
    And I click the "Divide" button
    And I choose the "<divField>" from the "FieldValue" in config
    And I click the "Indicator" button
    And I choose the "<divField>" from the "FieldValue" in config
    And I click the "UnifyMetric" button
    And I click the "Exhibition" button
    And I click the "AddColor" button
    And I click the "<color1>" button
    And I click the "Generate" button

    And I click the "Settings" button
    And I wait for "ChartView" will be visible
    And I drag the scroll bar to the element "ChartView"
    And I wait for "2000" millsecond
    And take part of "ChartView" with name "actual/高级搜索视图/6其它/<caseNum>_<chartType>"
    Then I compare source image "actual/高级搜索视图/6其它/<caseNum>_<chartType>" with target image "expect/高级搜索视图/6其它/<caseNum>_<chartType>"

    Examples:
      |  chartType    | divField       | color1   | caseNum  |   spl   |
      |   Radar       | apache.geo.city| DarkBlue | 2808    | starttime=\"now/d-24h\" endtime=\"now/d\" tag:sample04061424_chart \| stats count() by apache.status,apache.geo.city |

    @funnel
  Scenario Outline: funnel(RZY-2809)
    When I set the parameter "SearchInput" with value "<spl>"
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I will see the "trend.CreatePage" page
    And I click the "Type" button
    And I click the "Other" button
    And I click the "<chartType>" button
    And I click the "Settings" button
    And I click the "Value" button
    And I choose the "<countValue>" from the "FieldValue" in config
    And I click the "Divide" button
    And I choose the "<divValue>" from the "FieldValue" in config
    And I click the "Example" button
    And I click the "FirstPosition" button
    And I click the "Exhibition" button
    And I click the "AddColor" button
    And I click the "<color1>" button
    And I click the "Generate" button

    And I wait for "1000" millsecond
    And I click the "Settings" button
    And I wait for "ChartView" will be visible
    And I drag the scroll bar to the element "ChartView"
    And I wait for "2000" millsecond
    And take part of "ChartView" with name "actual/高级搜索视图/6其它/<caseNum>_<chartType>"
    Then I compare source image "actual/高级搜索视图/6其它/<caseNum>_<chartType>" with target image "expect/高级搜索视图/6其它/<caseNum>_<chartType>"

    Examples:
      |  chartType    | countValue |  divValue      |  color1   |caseNum  |   spl   |
      |   Funnel      |  cnt       | apache.geo.city|LightGreen |2809    | starttime=\"now/d-24h\" endtime=\"now/d\" tag:sample04061424_chart \| stats count() as cnt by apache.geo.city \| sort by cnt, +apache.geo.city |

  Scenario Outline: matrixheatmap(RZY-2810,2811)
    When I set the parameter "SearchInput" with value "<spl>"
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I will see the "trend.CreatePage" page
    And I click the "Type" button
    And I click the "Other" button
    And I click the "<chartType>" button
    And I click the "Settings" button
    And I click the "Xaxis" button
    And I choose the "<xValue>" from the "FieldValue" in config
    And I click the "Yaxis" button
    And I choose the "<yValue>" from the "FieldValue" in config
    And I set the parameter "Segments" with value "<segNum>"
    And I click the "Generate" button

    And I click the "Settings" button
    And I wait for "ChartView" will be visible
    And I drag the scroll bar to the element "ChartView"
    And I wait for "2000" millsecond
    And take part of "ChartView" with name "actual/高级搜索视图/6其它/<caseNum>_<chartType>"
    Then I compare source image "actual/高级搜索视图/6其它/<caseNum>_<chartType>" with target image "expect/高级搜索视图/6其它/<caseNum>_<chartType>"

    Examples:
      |  chartType     |  xValue         |  yValue       | segNum |caseNum  |   spl   |
      |  Matrixheatmap |  count()        | apache.status |  10    |2810    |starttime=\"now/d-24h\" endtime=\"now/d\" tag:sample04061424_chart \| stats count() by apache.status,apache.geo.city |
      |  Matrixheatmap | apache.geo.city |    count()    |  5     |2811    |starttime=\"now/d-24h\" endtime=\"now/d\" tag:sample04061424_chart \| stats count() by apache.status,apache.geo.city |

  Scenario Outline: chain(RZY-2812,2814)
    When I set the parameter "SearchInput" with value "<spl>"
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I will see the "trend.CreatePage" page
    And I click the "Type" button
    And I click the "Other" button
    And I click the "<chartType>" button
    And I click the "Settings" button
    And I choose the "<function>" from the "Function" in config
    And I choose the "<parentIDvalue>" from the "ParentId" in config
    And I choose the "<childIDvalue>" from the "ChildId" in config
    And I click the "Time" button
    And I choose the "<starttime>" from the "StartTime" in config
    And I choose the "<duration>" from the "KeepTime" in config
    And I click the "Divide" button
    And I choose the "<childIDvalue>" from the "FieldValue" in config
    And I click the "Info" button
    And I choose the "<infoValue>" from the "InfoField" in config
    And I click the "Exhibition" button
    And I click the "AddColor" button
    And I click the "<color>" button
    And I choose the "<precision>" from the "Precision" in config
    And I click the "Generate" button

    And I click the "Settings" button
    And I wait for "ChartView" will be visible
    And I drag the scroll bar to the element "ChartView"
    And I wait for "2000" millsecond
    And take part of "ChartView" with name "actual/高级搜索视图/6其它/<caseNum>_<chartType>"
    Then I compare source image "actual/高级搜索视图/6其它/<caseNum>_<chartType>" with target image "expect/高级搜索视图/6其它/<caseNum>_<chartType>"

    Examples:
      |  chartType | color  | precision |function     |  parentIDvalue       | childIDvalue  |      starttime         | duration            | infoValue                             | caseNum |   spl   |
      |  Chain     | Green  | 1         |dapper.class | dapper.msg.parentId  | dapper.msg.id |dapper.msg.timestamp    | dapper.msg.duration |  dapper.msg.binaryAnnotations[].value | 2812    |starttime=\"now/d-24h\" endtime=\"now/d\" tag:gf_dapper* AND dapper.msg.traceId:\"511f8756ce1d0b8a\" dapper.msg.duration:\>0 \| table dapper.msg.id, dapper.msg.parentId, dapper.class, dapper.msg.duration, dapper.msg.timestamp,dapper.msg.binaryAnnotations[].value, timestamp|
      |  Chain     | Red    | 2         |dapper.class | dapper.msg.parentId  | dapper.msg.id |               timestamp| dapper.msg.duration |  dapper.msg.binaryAnnotations[].value | 2814    |starttime=\"now/d-24h\" endtime=\"now/d\" tag:gf_dapper* AND dapper.msg.traceId:\"511f8756ce1d0b8a\" dapper.msg.duration:\>0 \| table dapper.msg.id, dapper.msg.parentId, dapper.class, dapper.msg.duration, dapper.msg.timestamp,dapper.msg.binaryAnnotations[].value, timestamp|

  Scenario Outline: sequence(RZY-2805)
    When I set the parameter "SearchInput" with value "<spl>"
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I will see the "trend.CreatePage" page
    And I click the "Type" button
    And I click the "Other" button
    And I click the "<chartType>" button
    And I click the "Settings" button
    And I click the "TimeSequence" button
    And I choose the "<timeSeq>" from the "FieldValue" in config
    And I click the "Source" button
    And I choose the "<source>" from the "FieldValue" in config
    And I click the "Target" button
    And I choose the "<target>" from the "FieldValue" in config
    And I click the "Divide" button
    And I choose the "<segmentation>" from the "FieldValue" in config
    And I click the "Mark" button
    And I choose the "<mark>" from the "FieldValue" in config
    And I click the "Generate" button

    And I click the "Settings" button
    And I wait for "ChartView" will be visible
    And I drag the scroll bar to the element "ChartView"
    And I wait for "2000" millsecond
    And take part of "ChartView" with name "actual/高级搜索视图/6其它/<caseNum>_<chartType>"
    Then I compare source image "actual/高级搜索视图/6其它/<caseNum>_<chartType>" with target image "expect/高级搜索视图/6其它/<caseNum>_<chartType>"

    Examples:
      |  chartType |  timeSeq  |  source         | target    |   segmentation    | mark   | caseNum |   spl   |
      |  Sequence  | hostname  | apache.clientip | hostname  |  apache.clientip  | count()|  2805   |starttime=\"now/d-24h\" endtime=\"now/d\" tag:sample04061424_chart \| stats count() by hostname,apache.clientip \|limit 4|

  Scenario Outline: chain_tree(RZY-2812,2814)
    When I set the parameter "SearchInput" with value "<spl>"
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I will see the "trend.CreatePage" page
    And I click the "Type" button
    And I click the "Other" button
    And I click the "<chartType>" button
    And I click the "Settings" button
    And I choose the "<function>" from the "Function" in config
    And I choose the "<parentIDvalue>" from the "ParentId" in config
    And I choose the "<childIDvalue>" from the "ChildId" in config
    And I click the "Time" button
    And I choose the "<starttime>" from the "StartTime" in config
    And I choose the "<duration>" from the "KeepTime" in config
    And I click the "Divide" button
    And I choose the "<childIDvalue>" from the "FieldValue" in config
    And I click the "Info" button
    And I choose the "<infoValue>" from the "InfoField" in config
    And I click the "Exhibition" button
    And I click the "AddColor" button
    And I click the "<color>" button
    And I choose the "<precision>" from the "Precision" in config
    And I choose the "tree" from the "TracingType" in config
    And I click the "Generate" button

    And I click the "Settings" button
    And I wait for "ChartView" will be visible
    And I drag the scroll bar to the element "ChartView"
    And I wait for "2000" millsecond
    And take part of "ChartView" with name "actual/高级搜索视图/6其它/<caseNum>_<chartType>"
    Then I compare source image "actual/高级搜索视图/6其它/<caseNum>_<chartType>" with target image "expect/高级搜索视图/6其它/<caseNum>_<chartType>"

    Examples:
      |  chartType | color  | precision |function     |  parentIDvalue       | childIDvalue  |      starttime         | duration            | infoValue                             | caseNum   |   spl   |
      |  Chain     | Green  | 1         |dapper.class | dapper.msg.parentId  | dapper.msg.id |dapper.msg.timestamp    | dapper.msg.duration |  dapper.msg.binaryAnnotations[].value | 2812_tree |starttime=\"now/d-24h\" endtime=\"now/d\" tag:gf_dapper* AND dapper.msg.traceId:\"511f8756ce1d0b8a\" dapper.msg.duration:\>0 \| table dapper.msg.id, dapper.msg.parentId, dapper.class, dapper.msg.duration, dapper.msg.timestamp,dapper.msg.binaryAnnotations[].value, timestamp|
      |  Chain     | Red    | 2         |dapper.class | dapper.msg.parentId  | dapper.msg.id |               timestamp| dapper.msg.duration |  dapper.msg.binaryAnnotations[].value | 2814_tree |starttime=\"now/d-24h\" endtime=\"now/d\" tag:gf_dapper* AND dapper.msg.traceId:\"511f8756ce1d0b8a\" dapper.msg.duration:\>0 \| table dapper.msg.id, dapper.msg.parentId, dapper.class, dapper.msg.duration, dapper.msg.timestamp,dapper.msg.binaryAnnotations[].value, timestamp|

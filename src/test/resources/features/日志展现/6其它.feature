@all @logDisplay @logDisplayOther
Feature: 日志展现_6其它

  Background:
    Given open the "splSearch.SearchPage" page for uri "/search/"
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I drag the element "SearchPageSvg" to the "left" side

  @logDisplaySmoke
  Scenario Outline: 字符云图(RZY-2804)
    When I set the parameter "SearchInput" with value "<spl>"
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I will see the "trend.CreatePage" page
    And I click the "Type" button
    And I click the "Other" button
    And I click the "<chartType>" button

    And I click the "Type" button
    And I wait for "Chart" will be visible
    And I wait for "<chartType>Element" will be visible
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I wait for "Chart" will be visible
    And I wait for "2000" millsecond
    And I wait for "<chartType>Element" will be visible
    And I wait for "2000" millsecond
    And take part of "Chart" with name "actual/高级搜索视图/6其它_<caseNum>_<chartType>"
#    Then I compare source image "actual/高级搜索视图/6其它_<caseNum>_<chartType>" with target image "expect/高级搜索视图/6其它_<caseNum>_<chartType>"

    Examples:
      |  chartType    |caseNum  |   spl   |
      |   Wordcloud   | 2804    | starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424_chart \| stats count() by apache.geo.city |


  Scenario Outline: 字符云图_分面
    When I set the parameter "SearchInput" with value "<spl>"
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I will see the "trend.CreatePage" page
    And I click the "Type" button
    And I click the "Other" button
    And I click the "<chartType>" button

    And I click the "Settings" button
    And I click the "Facet" button
    And I choose the "apache.method" from the "FieldValue"
    And I set the parameter "RowNum" with value "1"
    And I set the parameter "ColumnNum" with value "2"
    And I click the "Generate" button

    And I click the "Settings" button
    And I wait for "Chart" will be visible
    And I wait for "2000" millsecond
    And I wait for "<chartType>Element" will be visible
    And I wait for "2000" millsecond
    And take part of "Chart" with name "actual/高级搜索视图/6其它_<caseNum>_<chartType>"
#    Then I compare source image "actual/高级搜索视图/6其它_<caseNum>_<chartType>" with target image "expect/高级搜索视图/6其它_<caseNum>_<chartType>"

    Examples:
      |  chartType    |caseNum  |   spl   |
      |   Wordcloud   | 分面    | starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424_chart \| stats count() by apache.geo.city, apache.method \| limit 7 |

  Scenario Outline: 水球图
    When I set the parameter "SearchInput" with value "<spl>"
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I will see the "trend.CreatePage" page
    And I click the "Type" button
    And I click the "Other" button
    And I click the "<chartType>" button
    And I click the "Settings" button
    And I choose the "cnt_perc" from the "FieldValue"
    And I click the "Exhibition" button
    And I click the "AddColor" button
    And I click the "Orange" button
    And I wait for "1000" millsecond
    And I choose the "1" from the "Precision"
    And I click the "Generate" button

    And I click the "Settings" button
    And I wait for "Chart" will be visible
    And I wait for "<chartType>Element" will be visible
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I wait for "Chart" will be visible
    And I wait for "2000" millsecond
    And I wait for "<chartType>Element" will be visible
    And I wait for "2000" millsecond
    And take part of "Chart" with name "actual/高级搜索视图/6其它_<chartType>_<caseNum>"
    Then I compare source image "actual/高级搜索视图/6其它_<chartType>_<caseNum>" with target image "expect/高级搜索视图/6其它_<chartType>_<caseNum>"

    Examples:
      | chartType  | caseNum | spl                                                                       |
      | Liquidfill | percent | starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424_chart \| stats count() as cnt\| eval cnt_perc=cnt/1000 |

  @logDisplaySmoke
  Scenario Outline: 水球图_分面
    When I set the parameter "SearchInput" with value "<spl>"
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I will see the "trend.CreatePage" page
    And I click the "Type" button
    And I click the "Other" button
    And I click the "<chartType>" button
    And I click the "Settings" button
    And I choose the "cnt" from the "FieldValue"
    And I click the "Facet" button
    And I choose the "apache.method" from the "FieldValue"
    And I set the parameter "RowNum" with value "1"
    And I set the parameter "ColumnNum" with value "2"
    And I click the "Exhibition" button
    And I click the "AddColor" button
    And I click the "Red" button
    And I wait for "1000" millsecond
    And I click the "Generate" button

    And I click the "Settings" button
    And I wait for "Chart" will be visible
    And I wait for "<chartType>Element" will be visible
    And I wait for "2000" millsecond
    And take part of "Chart" with name "actual/高级搜索视图/6其它_<chartType>_<caseNum>"
    Then I compare source image "actual/高级搜索视图/6其它_<chartType>_<caseNum>" with target image "expect/高级搜索视图/6其它_<chartType>_<caseNum>"

    Examples:
      | chartType  | caseNum | spl                                                                       |
      | Liquidfill | 分面    | starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424_chart \| stats count(apache.clientip) as ip_count by apache.clientip, apache.method \| sort by apache.clientip \| limit 2 \| eval cnt = ip_count/10 \| sort by cnt|

  @logDisplaySmoke
  Scenario Outline: 雷达图_漏斗图(RZY-2807,2449)
    When I set the parameter "SearchInput" with value "starttime=\"now/d\" endtime=\"now/d+24h\" <spl>"
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I will see the "trend.CreatePage" page
    And I click the "Type" button
    And I click the "Other" button
    And I click the "<chartType>" button

    And I wait for "2000" millsecond
    And I click the "Type" button
    And I wait for "Chart" will be visible
    And I wait for "<chartType>Element" will be visible
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I wait for "Chart" will be visible
    And I wait for "<chartType>Element" will be visible
    And I wait for "2000" millsecond
    And take part of "Chart" with name "actual/高级搜索视图/6其它_<caseNum>_<chartType>"
    Then I compare source image "actual/高级搜索视图/6其它_<caseNum>_<chartType>" with target image "expect/高级搜索视图/6其它_<caseNum>_<chartType>"

    Examples:
      |  chartType    |caseNum  |   spl   |
      |   Radar       | 2807    |  tag:sample04061424_chart \| stats count() by apache.status,apache.geo.city |
      |   Funnel      | 2449    |  tag:sample04061424_chart \| stats count() as cnt by apache.clientip \| sort by cnt, apache.clientip \|limit 5 |

  Scenario Outline: 雷达图(RZY-2808)
    When I set the parameter "SearchInput" with value "<spl>"
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I will see the "trend.CreatePage" page
    And I click the "Type" button
    And I click the "Other" button
    And I click the "<chartType>" button
    And I click the "Settings" button
    And I click the "Divide" button
    And I click the "DeleteLast" button
    And I choose the "<divField>" from the "FieldValue"
    And I click the "Indicator" button
    And I choose the "<divField>" from the "FieldValue"
    And I wait for "1500" millsecond
    And I click the "UnifyMetric" button
    And I click the "Exhibition" button
    And I click the "AddColor" button
    And I click the "<color1>" button
    And I wait for "1000" millsecond
    And I click the "Generate" button

    And I click the "Settings" button
    And I wait for "Chart" will be visible
    And I wait for "<chartType>Element" will be visible
    And I wait for "2000" millsecond
    And take part of "Chart" with name "actual/高级搜索视图/6其它_<caseNum>_<chartType>"
    Then I compare source image "actual/高级搜索视图/6其它_<caseNum>_<chartType>" with target image "expect/高级搜索视图/6其它_<caseNum>_<chartType>"

    Examples:
      |  chartType    | divField       | color1   | caseNum  |   spl   |
      |   Radar       | apache.geo.city| DarkBlue | 2808    | starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424_chart \| stats count() by apache.status,apache.geo.city |


  Scenario Outline: 漏斗图(RZY-2809)
    When I set the parameter "SearchInput" with value "<spl>"
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I will see the "trend.CreatePage" page
    And I click the "Type" button
    And I click the "Other" button
    And I click the "<chartType>" button
    And I wait for "2000" millsecond
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
    And I wait for "1000" millsecond
    And I click the "Generate" button

    And I wait for "1000" millsecond
    And I click the "Settings" button
    And I wait for "Chart" will be visible
    And I wait for "<chartType>Element" will be visible
    And I wait for "2000" millsecond
    And take part of "Chart" with name "actual/高级搜索视图/6其它_<caseNum>_<chartType>"
    Then I compare source image "actual/高级搜索视图/6其它_<caseNum>_<chartType>" with target image "expect/高级搜索视图/6其它_<caseNum>_<chartType>"

    Examples:
      |  chartType    | countValue |  divValue      |  color1   |caseNum  |   spl   |
      |   Funnel      |  cnt       | apache.geo.city|LightGreen |2809    | starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424_chart \| stats count() as cnt by apache.geo.city \| sort by cnt, +apache.geo.city |

  Scenario Outline: 矩阵热力图(RZY-2810,2811)
    When I set the parameter "SearchInput" with value "starttime=\"now/d\" endtime=\"now/d+24h\" <spl>"
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
    And I wait for "1000" millsecond
    And I click the "Generate" button

    And I click the "Settings" button
    And I wait for "Chart" will be visible
    And I wait for "<chartType>Element" will be visible
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I wait for "Chart" will be visible
    And I wait for "2000" millsecond
    And I wait for "<chartType>Element" will be visible
    And I wait for "2000" millsecond
    And take part of "Chart" with name "actual/高级搜索视图/6其它_<caseNum>_<chartType>"
    Then I compare source image "actual/高级搜索视图/6其它_<caseNum>_<chartType>" with target image "expect/高级搜索视图/6其它_<caseNum>_<chartType>"

    @logDisplaySmoke
    Examples:
      |  chartType     |  xValue         |  yValue       | segNum |caseNum  |   spl   |
      |  Matrixheatmap |  count()        | apache.status |  10    |2810    | tag:sample04061424_chart \| stats count() by apache.status,apache.geo.city |

    Examples:
      |  chartType     |  xValue         |  yValue       | segNum |caseNum  |   spl   |
      |  Matrixheatmap | apache.geo.city |    count()    |  5     |2811    | tag:sample04061424_chart \| stats count() by apache.status,apache.geo.city |

  Scenario Outline: 调用链(RZY-2812,2814)
    When I set the parameter "SearchInput" with value "starttime=\"now/d\" endtime=\"now/d+24h\" <spl>"
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
    And I click the "Info" button
    And I wait for "2000" millsecond
    And I cancel all selections from the "InfoColumn" except value "<column>"
    And I choose the "<infoValue>" from the "InfoField"
    And I click the "Divide" button
    And I choose the "<childIDvalue>" from the "FieldValue"
    And I click the "Exhibition" button
    And I click the "AddColor" button
    And I click the "<color>" button
    And I wait for "1000" millsecond
    And I choose the "<precision>" from the "Precision"
    And I click the "Generate" button

    And I click the "Settings" button
    And I wait for "Chart" will be visible
    And I wait for "ChainTableElement" will be visible
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I wait for "Chart" will be visible
    And I wait for "2000" millsecond
    And I wait for "ChainTableElement" will be visible
    And I wait for "2000" millsecond
    And take part of "Chart" with name "actual/高级搜索视图/6其它_<caseNum>_<chartType>"
    Then I compare source image "actual/高级搜索视图/6其它_<caseNum>_<chartType>" with target image "expect/高级搜索视图/6其它_<caseNum>_<chartType>"

    @logDisplaySmoke
    Examples:
      |  chartType | color  | precision |  column           |function     |  parentIDvalue       | childIDvalue  |      starttime         | duration            | infoValue                             | caseNum |   spl   |
      |  Chain     | Green  | 1         |dapper.msg.duration|dapper.class | dapper.msg.parentId  | dapper.msg.id |dapper.msg.timestamp    | dapper.msg.duration |  dapper.msg.binaryAnnotations[].value | 2812    | tag:gf_dapper_* AND dapper.msg.traceId:\"511f8756ce1d0b8a\" dapper.msg.duration:\>0 \| table dapper.msg.id, dapper.msg.parentId, dapper.class, dapper.msg.duration, dapper.msg.timestamp,dapper.msg.binaryAnnotations[].value, timestamp \| sort by dapper.msg.duration|

    Examples:
      |  chartType | color  | precision |  column           |function     |  parentIDvalue       | childIDvalue  |      starttime         | duration            | infoValue                             | caseNum |   spl   |
      |  Chain     | Red    | 2         |timestamp          |dapper.class | dapper.msg.parentId  | dapper.msg.id |               timestamp| dapper.msg.duration |  dapper.msg.binaryAnnotations[].value | 2814    | tag:gf_dapper_* AND dapper.msg.traceId:\"511f8756ce1d0b8a\" dapper.msg.duration:\>0 \| table dapper.msg.id, dapper.msg.parentId, dapper.class, dapper.msg.duration, dapper.msg.timestamp,dapper.msg.binaryAnnotations[].value, timestamp \| sort by dapper.msg.duration|

  @logDisplaySmoke
  Scenario Outline: 循序图(RZY-2805)
    When I set the parameter "SearchInput" with value "<spl>"
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I will see the "trend.CreatePage" page
    And I click the "Type" button
    And I click the "Other" button
    And I click the "<chartType>" button
    And I click the "Settings" button
    And I click the "TimeSequence" button
    And I choose the "<timeSeq>" from the "FieldValue"
    And I click the "Source" button
    And I choose the "<source>" from the "FieldValue"
    And I click the "Target" button
    And I choose the "<target>" from the "FieldValue"
    And I click the "Divide" button
    And I choose the "<segmentation>" from the "FieldValue"
    And I click the "Mark" button
    And I choose the "<mark>" from the "FieldValue"
    And I click the "Generate" button

    And I click the "Settings" button
    And I wait for "Chart" will be visible
    And I wait for "<chartType>Element" will be visible
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I wait for "Chart" will be visible
    And I wait for "<chartType>Element" will be visible
    And I wait for "2000" millsecond
    And take part of "Chart" with name "actual/高级搜索视图/6其它_<caseNum>_<chartType>"
    Then I compare source image "actual/高级搜索视图/6其它_<caseNum>_<chartType>" with target image "expect/高级搜索视图/6其它_<caseNum>_<chartType>"

    Examples:
      |  chartType |  timeSeq  |  source         | target    |   segmentation    | mark   | caseNum |   spl   |
      |  Sequence  | hostname  | apache.clientip | hostname  |  apache.clientip  | count()|  2805   |starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424_chart \| stats count() by hostname,apache.clientip \|limit 4|


  Scenario Outline: 调用链_tree(RZY-2812,2814)
    When I set the parameter "SearchInput" with value "starttime=\"now/d\" endtime=\"now/d+24h\" <spl>"
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
    And I wait for "2000" millsecond
    And I cancel all selections from the "InfoColumn" except value "<infoValue>"
    And I click the "Exhibition" button
    And I click the "AddColor" button
    And I click the "<color>" button
    And I wait for "1000" millsecond
    And I choose the "<precision>" from the "Precision"
    And I choose the "tree" from the "TracingType"
    And I wait for "1000" millsecond
    And I click the "Generate" button

    And I click the "Settings" button
    And I wait for "Chart" will be visible
    And I wait for "ChainTreeElement" will be visible
    And I wait for "2000" millsecond
    And take part of "Chart" with name "actual/高级搜索视图/6其它_<caseNum>_<chartType>"
    Then I compare source image "actual/高级搜索视图/6其它_<caseNum>_<chartType>" with target image "expect/高级搜索视图/6其它_<caseNum>_<chartType>"

    Examples:
      |  chartType | color  | precision |function     |  parentIDvalue       | childIDvalue  |      starttime         | duration            | infoValue                             | caseNum   |   spl   |
      |  Chain     | Green  | 1         |dapper.class | dapper.msg.parentId  | dapper.msg.id |dapper.msg.timestamp    | dapper.msg.duration |  dapper.msg.binaryAnnotations[].value | 2812_tree | tag:gf_dapper_* AND dapper.msg.traceId:\"511f8756ce1d0b8a\" dapper.msg.duration:\>0 \| table dapper.msg.id, dapper.msg.parentId, dapper.class, dapper.msg.duration, dapper.msg.timestamp,dapper.msg.binaryAnnotations[].value, timestamp \| sort by dapper.msg.duration|
      |  Chain     | Red    | 2         |dapper.class | dapper.msg.parentId  | dapper.msg.id |               timestamp| dapper.msg.duration |  dapper.msg.binaryAnnotations[].value | 2814_tree | tag:gf_dapper_* AND dapper.msg.traceId:\"511f8756ce1d0b8a\" dapper.msg.duration:\>0 \| table dapper.msg.id, dapper.msg.parentId, dapper.class, dapper.msg.duration, dapper.msg.timestamp,dapper.msg.binaryAnnotations[].value, timestamp \| sort by dapper.msg.duration|

  Scenario Outline: 网络节点图1
    When I set the parameter "SearchInput" with value "starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424_chart | stats count() as cnt by apache.method, apache.geo.province, apache.geo.city | sort by +apache.geo.province, cnt, apache.go.city | limit 10"
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I will see the "trend.CreatePage" page
    And I click the "Type" button
    And I click the "Other" button
    And I click the "<chartType>" button

    And I click the "Type" button
    And I wait for "Chart" will be visible
    And I wait for "<chartType>Element" will be visible
    And I click the Circle "<node>" button
    And I wait for "2000" millsecond
    And I drag the scroll bar to the element "Chart"
    And I wait for "2000" millsecond
    And take part of "Chart" with name "actual/高级搜索视图/6其它_<chartType>_<node>"
    Then I compare source image "actual/高级搜索视图/6其它_<chartType>_<node>" with target image "expect/高级搜索视图/6其它_<chartType>_<node>"

    Examples:
      |  chartType    | node             |
      |  NetworkNode  |                  |
      |  NetworkNode  | ClickPOST        |

  Scenario Outline: 网络节点图2
    When I set the parameter "SearchInput" with value "starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424_chart | stats count() as cnt by apache.method, apache.geo.province, apache.geo.city | sort by +apache.geo.province, cnt, apache.go.city | limit 10"
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I will see the "trend.CreatePage" page
    And I click the "Type" button
    And I click the "Other" button
    And I click the "<chartType>" button

    And I click the "Settings" button
    And I click the "Exhibition" button
    And I set the parameter "Repulsion" with value "<repValue>"
    And I click the "AddColor" button
    And I click the "<color>" button
    And I wait for "1000" millsecond
    And I click the "Generate" button
    And I click the "Settings" button
    And I wait for "Chart" will be visible

    And I wait for "<chartType>Element" will be visible
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I wait for "Chart" will be visible
    And I wait for "<chartType>Element" will be visible
    And I wait for "2000" millsecond
    And take part of "Chart" with name "actual/高级搜索视图/6其它_<chartType>_<color>_<repValue>"
    Then I compare source image "actual/高级搜索视图/6其它_<chartType>_<color>_<repValue>" with target image "expect/高级搜索视图/6其它_<chartType>_<color>_<repValue>"

    Examples:
      |  chartType    | color      | repValue  |
      |  NetworkNode  | Red        | 20        |

  @logDisplaySmoke
  Scenario Outline: 网络节点图3
    When I set the parameter "SearchInput" with value "starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424_chart | stats count() as cnt by apache.method, apache.geo.province, apache.geo.city | sort by +apache.geo.province, cnt, apache.go.city | limit 10"
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I will see the "trend.CreatePage" page
    And I click the "Type" button
    And I click the "Other" button
    And I click the "<chartType>" button

    And I click the "Settings" button
    And I click the "Indicators" button
    And I click the "AddIndicator" button
    And I choose the "cnt" from the "FieldValue"
    And I wait for "2000" millsecond
    And I click the "AddRange" button
    And I set the parameter "MinRange" with value "5"
    And I set the parameter "MaxRange" with value "7"
    And I click the "AddColor" button
    And I click the "<color>" button
    And I click the "AddRange" button
    And I set the parameter "MinRange" with value "7"
    And I set the parameter "MaxRange" with value "8"
    And I wait for "1000" millsecond
    And I click the "Generate" button
    And I click the "Settings" button
    And I wait for "Chart" will be visible
    And I wait for "<chartType>Element" will be visible
    And I click the Circle "Click<node>" button
    And I wait for "2000" millsecond
    And I drag the scroll bar to the element "Chart"
    And I wait for "2000" millsecond
    And take part of "Chart" with name "actual/高级搜索视图/6其它_<chartType>_<node>_<color>"
    Then I compare source image "actual/高级搜索视图/6其它_<chartType>_<node>_<color>" with target image "expect/高级搜索视图/6其它_<chartType>_<node>_<color>"

    Examples:
      |  chartType    | node        | color   |
      |  NetworkNode  | Beijing     | Red     |

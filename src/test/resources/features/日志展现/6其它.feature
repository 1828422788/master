@all @logDisplay @logDisplayOther
Feature: 日志展现_其它
#16 (19) bug

  # tag:sample04061424_chart should be uploaded for Today
  Background:
    Given open the "splSearch.SearchPage" page for uri "/search/"
    And I wait for element "SearchStatus" change text to "搜索完成!"

  Scenario Outline: others(RZY-2804,2807,2449)
    When I set the parameter "SearchInput" with value "<spl>"
    And I click the "DateEditor" button
    And I click the "Today" button
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
#    Then I compare source image "src/test/resources/expect/日志展现/高级搜索视图/6其它/<caseNum>_<chartType>.png" with target image "target/cucumber-html-reports/embeddings/actual_img/日志展现/高级搜索视图/6其它/<caseNum>_<chartType>.png"

    Examples:
      |  chartType    |caseNum  |   spl   |
      |   Wordcloud   | 2804    | tag:sample04061424_chart \| stats count() by apache.geo.city |
      |   Radar       | 2807    | tag:sample04061424_chart \| stats count() by apache.status,apache.geo.city |
      |   Funnel      | 2449    | tag:sample04061424_chart \| stats count() by apache.clientip \| limit 5 |


  Scenario Outline: radar(RZY-2808)
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
    And I click the "Indicator" button
    And I choose the "<divField>" from the "FieldValue"
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
#    Then I compare source image "src/test/resources/expect/日志展现/高级搜索视图/6其它/<caseNum>_<chartType>.png" with target image "target/cucumber-html-reports/embeddings/actual_img/日志展现/高级搜索视图/6其它/<caseNum>_<chartType>.png"

    Examples:
      |  chartType    | divField       | color1   | caseNum  |   spl   |
      |   Radar       | apache.geo.city| DarkBlue | 2808    | tag:sample04061424_chart \| stats count() by apache.status,apache.geo.city |

  Scenario Outline: funnel(RZY-2809)
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

    And I wait for "1000" millsecond
    And I click the "Settings" button
    And I wait for "ChartView" will be visible
    And I drag the scroll bar to the element "ChartView"
    And I wait for "2000" millsecond
    And take part of "ChartView" with name "actual/高级搜索视图/6其它/<caseNum>_<chartType>"
#    Then I compare source image "src/test/resources/expect/日志展现/高级搜索视图/6其它/<caseNum>_<chartType>.png" with target image "target/cucumber-html-reports/embeddings/actual_img/日志展现/高级搜索视图/6其它/<caseNum>_<chartType>.png"

    Examples:
      |  chartType    | countValue |  divValue      |  color1   |caseNum  |   spl   |
      |   Funnel      |  count()   | apache.geo.city|LightGreen |2809    | tag:sample04061424_chart \| stats count() by apache.status,apache.geo.city |

  Scenario Outline: matrixheatmap(RZY-2810,2811)
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

    And I click the "Settings" button
    And I wait for "ChartView" will be visible
    And I drag the scroll bar to the element "ChartView"
    And I wait for "2000" millsecond
    And take part of "ChartView" with name "actual/高级搜索视图/6其它/<caseNum>_<chartType>"
#    Then I compare source image "src/test/resources/expect/日志展现/高级搜索视图/6其它/<caseNum>_<chartType>.png" with target image "target/cucumber-html-reports/embeddings/actual_img/日志展现/高级搜索视图/6其它/<caseNum>_<chartType>.png"

    Examples:
      |  chartType     |  xValue         |  yValue       | segNum |caseNum  |   spl   |
      |  Matrixheatmap |  count()        | apache.status |  10    |2810    | tag:sample04061424_chart \| stats count() by apache.status,apache.geo.city |
      |  Matrixheatmap | apache.geo.city |    count()    |  5     |2811    | tag:sample04061424_chart \| stats count() by apache.status,apache.geo.city |

  Scenario Outline: chain(RZY-2812,2814)
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
    And I click the "Exhibition" button
    And I click the "AddColor" button
    And I click the "<color>" button
    And I choose the "<precision>" from the "Precision"
    And I click the "Generate" button

    And I click the "Settings" button
    And I wait for "ChartView" will be visible
    And I drag the scroll bar to the element "ChartView"
    And I wait for "2000" millsecond
    And take part of "ChartView" with name "actual/高级搜索视图/6其它/<caseNum>_<chartType>"
#    Then I compare source image "src/test/resources/expect/日志展现/高级搜索视图/6其它/<caseNum>_<chartType>.png" with target image "target/cucumber-html-reports/embeddings/actual_img/日志展现/高级搜索视图/6其它/<caseNum>_<chartType>.png"

    Examples:
      |  chartType | color  | precision |function     |  parentIDvalue       | childIDvalue  |      starttime         | duration            | infoValue                             | caseNum |   spl   |
      |  Chain     | Green  | 1         |dapper.class | dapper.msg.parentId  | dapper.msg.id |dapper.msg.timestamp    | dapper.msg.duration |  dapper.msg.binaryAnnotations[].value | 2812    |tag:dapper_auto AND dapper.msg.traceId:\"511f8756ce1d0b8a\" dapper.msg.duration:\>0 \| table dapper.msg.id, dapper.msg.parentId, dapper.class, dapper.msg.duration, dapper.msg.timestamp,dapper.msg.binaryAnnotations[].value, collector_recv_timestamp|
      |  Chain     | Red    | 2         |dapper.class | dapper.msg.parentId  | dapper.msg.id |collector_recv_timestamp| dapper.msg.duration |  dapper.msg.binaryAnnotations[].value | 2814    |tag:dapper_auto AND dapper.msg.traceId:\"511f8756ce1d0b8a\" dapper.msg.duration:\>0 \| table dapper.msg.id, dapper.msg.parentId, dapper.class, dapper.msg.duration, dapper.msg.timestamp,dapper.msg.binaryAnnotations[].value, collector_recv_timestamp|

  Scenario Outline: sequence(RZY-2805)
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
    And I wait for "ChartView" will be visible
    And I drag the scroll bar to the element "ChartView"
    And I wait for "2000" millsecond
    And take part of "ChartView" with name "actual/高级搜索视图/6其它/<caseNum>_<chartType>"
#    Then I compare source image "src/test/resources/expect/日志展现/高级搜索视图/6其它/<caseNum>_<chartType>.png" with target image "target/cucumber-html-reports/embeddings/actual_img/日志展现/高级搜索视图/6其它/<caseNum>_<chartType>.png"

    Examples:
      |  chartType |  timeSeq  |  source         | target    |   segmentation    | mark   | caseNum |   spl   |
      |  Sequence  | hostname  | apache.clientip | hostname  |  apache.clientip  | count()|  2805   |tag:sample04061424_chart \| stats count() by hostname,apache.clientip \|limit 4|


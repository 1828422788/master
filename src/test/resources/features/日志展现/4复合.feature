Feature: 高级搜索视图_复合
#4(3)

  # tag:sample04061424_chart should be uploaded
  Background:
    Given open the "splSearch.SearchPage" page for uri "/search/"
    And I wait for element "SearchStatus" change text to "搜索完成!"


  Scenario Outline: 复合_区间图(RZY-835)
    When I set the parameter "SearchInput" with value "<spl>"
    And I click the "DateEditor" button
    And I click the "ThisMonth" button
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
    And I wait for "Chart" will be visible
    And I wait for "1500" millsecond
    And I drag the scroll bar to the element "Chart"
    Then take part of "Chart" with name "日志展现/高级搜索视图/复合/<caseNum>_<chartType>"

    Examples:
      | xValue | actualValue|  predictedValue| upperValue | lowerValue |   chartType   |   caseNum  |   spl   |
      |   ts   |   count_   |     count_     |    upper   |     lower  |    Rangeline  |    835_1   |  * \| bucket timestamp span=3h as ts \| stats count(appname) as count_ by ts \| movingavg count_,5 as ma \| rollingstd count_,5 as rs \| eval lower=ma-3*rs \| eval upper=ma+3*rs \| eval outlier=if(count_>upper \|\|count_<lower, count_, null)  |
      |   ts   |   cnt      |   _predict_cnt |    upper95 |    lower95 |    Rangeline  |    835_2   | tag:sample04061424_apachesample_dawn \| bucket timestamp span=1h as ts \| stats count\(\) as cnt by ts \| esma cnt timefield=ts  |


  Scenario Outline: 复合_多Y轴图(RZY-2785,2786)
    When I set the parameter "SearchInput" with value "<spl>"
    And I click the "DateEditor" button
    And I click the "ThisMonth" button
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I will see the "trend.CreatePage" page
    And I click the "Type" button
    And I click the "Compound" button
    And I click the "<chartType>" button
    And I wait for "Chart" will be visible
    And I wait for "1500" millsecond
    And I drag the scroll bar to the element "Chart"
    Then take part of "Chart" with name "日志展现/高级搜索视图/复合/<caseNum>_<chartType>"

    Examples:
      |   chartType   |   caseNum  |   spl   |
      |   Multiaxis   |    2785    |  * \| stats avg(raw_message_length) as avg_length, count(apache.clientip) as ip_count by appname \| sort by ip_count |
      |   Multiaxis   |    2786    | tag:sample04061424_chart \| stats count(apache.resp_len), max(apache.resp_len), min(apache.resp_len), sum(apache.status), avg(apache.resp_len) by apache.resp_len,apache.status \| limit 10|

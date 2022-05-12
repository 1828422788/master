@saveAsTrend @saveAsTrendCompound
Feature: 保存为趋势图_复合

  Background:
    Given open the "splSearch.SearchPage" page for uri "/search/"
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I drag the element "SearchPageSvg" to the "left" side

  Scenario Outline: compound_rangeline(rzy-2516)
    When I set the parameter "SearchInput" with value "<spl>"
    And I wait for "1000" millsecond
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I will see the "trend.CreatePage" page

    And I wait for "Type" will be visible
    And I wait for "2000" millsecond
    And I click the "Type" button
    And I click the "Compound" button
    And I click the "<chartType>" button
    And I click the "Settings" button
    And I click the "Xaxis" button
    And I choose the "<xValue>" from the "FieldValue"
    And I click the "Yaxis" button
    And I choose the "<actualValue>" from the "Actual"
    And I choose the "<predictedValue>" from the "Predict"
    And I choose the "<upperValue>" from the "Outlier"
    And I choose the "<upperValue>" from the "TopLimit"
    And I choose the "<lowerValue>" from the "LowerLimit"
    And I click the "Generate" button

    And I click the "Settings" button
    And I wait for "2000" millsecond
    And I wait for "Chart" will be visible
    And I drag the scroll bar to the element "Chart"
#    And I wait for "2000" millsecond
#    And take part of "Chart" with name "actual/保存为趋势图/<chartType>_<caseNum>"
#    And I compare source image "actual/保存为趋势图/<chartType>_<caseNum>" with target image "expect/保存为趋势图/<chartType>_<caseNum>"
    And I click the "SaveAsTrend" button

    When I set the parameter "NameInput" with value "<chartType>_<caseNum>"
    And I set the parameter "DescribeInput" with value "AutoCreate"
    And I click the "EnsureButton" button
    Then I will see the success message "创建成功"

    Examples:
      | xValue | actualValue|  predictedValue| upperValue | lowerValue |   chartType   |   caseNum  |   spl   |
      |   ts   |   cnt      |   _predict_cnt |    upper95 |    lower95 |    Rangeline  |    2516    | starttime=\"now/d\" endtime=\"now/d+24h\" tag: sample04061424_chart \| bucket timestamp span=1h as ts \| stats count() as cnt by ts \| esma cnt timefield=ts  |

  Scenario Outline: compound_multiaxis_1
    When I set the parameter "SearchInput" with value "starttime=\"now/d\" endtime=\"now/d+24h\" tag: sample04061424_display | stats count(apache.resp_len), max(apache.resp_len), min(apache.resp_len), sum(apache.status), avg(apache.resp_len) by apache.resp_len,apache.status | limit 10"
    And I wait for "1000" millsecond
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I will see the "trend.CreatePage" page

    And I wait for "Type" will be visible
    And I wait for "2000" millsecond
    And I click the "Type" button
    And I click the "Compound" button
    And I click the "<chartType>" button

    And I click the "Settings" button
    And I click the "Xaxis" button
    And I choose the "apache.resp_len" from the "FieldValue"
    And I click the "FirstLabel" button
    And I click the "AscendingOrder" button

    And I click the "Yaxis" button
    And I set the parameter "Min" with value "1"
    And I set the parameter "Max" with value "170000"
    And I set the parameter "Unit" with value "面"
    And I choose the "max(apache.resp_len)" from the "FieldValue"
    And I choose the "面积图" from the "TypeChartField"
    And I click the "Smooth" button
    And I click the "ConnectEmptyData" button

    And I click the "AddField" button
    And I click the "Yaxis2" button
    And I set the parameter "Unit" with value "柱"
    And I set the parameter "Min" with value "2"
    And I set the parameter "Max" with value ""
    And I click the "AddConfigFields" button
    And I choose the "min(apache.resp_len)" from the "FieldValue"
    And I choose the "柱状图" from the "TypeChartField"

    And I click the "AddField" button
    And I click the "Yaxis3" button
    And I set the parameter "Unit" with value "散"
    And I set the parameter "Min" with value ""
    And I set the parameter "Max" with value "49000"
    And I click the "AddConfigFields" button
    And I choose the "sum(apache.status)" from the "FieldValue"
    And I choose the "散点图" from the "TypeChartField"

    And I click the "Exhibition" button
    And I click the "AddColor" button
    And I click the "Red" button
    And I click the "Generate" button

    And I click the "Settings" button
    And I wait for "2000" millsecond
    And I wait for "Chart" will be visible
    And I drag the scroll bar to the element "Chart"
#    And I wait for "2000" millsecond
#    And take part of "Chart" with name "actual/保存为趋势图/<chartType>_<caseNum>"
#    And I compare source image "actual/保存为趋势图/<chartType>_<caseNum>" with target image "expect/保存为趋势图/<chartType>_<caseNum>"
    And I click the "SaveAsTrend" button

    When I set the parameter "NameInput" with value "<chartType>_<caseNum>"
    And I set the parameter "DescribeInput" with value "AutoCreate"
    And I click the "EnsureButton" button
    Then I will see the success message "创建成功"

    Examples:
      |   chartType   |  caseNum  |
      |   Multiaxis   |   2523    |

  Scenario Outline: compound_multiaxis_2
    When I set the parameter "SearchInput" with value "starttime=\"now/d\" endtime=\"now/d+24h\" tag: sample04061424_display | stats count(apache.resp_len), max(apache.resp_len), min(apache.resp_len), sum(apache.status), avg(apache.resp_len) by apache.resp_len,apache.status | limit 10"
    And I wait for "1000" millsecond
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I will see the "trend.CreatePage" page

    And I wait for "Type" will be visible
    And I wait for "2000" millsecond
    And I click the "Type" button
    And I click the "Compound" button
    And I click the "<chartType>" button

    And I click the "Settings" button
    And I click the "Xaxis" button
    And I choose the "apache.resp_len" from the "FieldValue"
    And I click the "FirstLabel" button
    And I click the "AscendingOrder" button
    And I click the "Group" button
    And I click the "DeleteFirst" button

    And I click the "Yaxis" button
    And I set the parameter "Min" with value "1"
    And I set the parameter "Max" with value "170000"
    And I set the parameter "Unit" with value "面"
    And I choose the "max(apache.resp_len)" from the "FieldValue"
    And I choose the "面积图" from the "TypeChartField"
    And I drag the element "SliderHandle" by "-60" pixels
    And I click the "AddColor" button
    And I click the "Green" button
    And I click the "Smooth" button
    And I click the "ConnectEmptyData" button

    And I click the "AddField" button
    And I click the "Yaxis2" button
    And I set the parameter "Unit" with value "柱"
    And I set the parameter "Min" with value "2"
    And I set the parameter "Max" with value ""
    And I click the "AddConfigFields" button
    And I choose the "min(apache.resp_len)" from the "FieldValue"
    And I choose the "柱状图" from the "TypeChartField"
    And I click the "AddColor" button
    And I click the "Red" button

    And I click the "AddField" button
    And I click the "Yaxis3" button
    And I set the parameter "Unit" with value "散"
    And I set the parameter "Min" with value ""
    And I set the parameter "Max" with value "49000"
    And I click the "AddConfigFields" button
    And I choose the "sum(apache.status)" from the "FieldValue"
    And I choose the "散点图" from the "TypeChartField"
    And I click the "AddColor" button
    And I click the "Orange" button

    And I click the "Generate" button

    And I click the "Settings" button
    And I wait for "2000" millsecond
    And I wait for "Chart" will be visible
    And I drag the scroll bar to the element "Chart"
#    And I wait for "2000" millsecond
#    And take part of "Chart" with name "actual/保存为趋势图/<chartType>_<caseNum>"
#    And I compare source image "actual/保存为趋势图/<chartType>_<caseNum>" with target image "expect/保存为趋势图/<chartType>_<caseNum>"
    And I click the "SaveAsTrend" button

    When I set the parameter "NameInput" with value "<chartType>_<caseNum>"
    And I set the parameter "DescribeInput" with value "AutoCreate"
    And I click the "EnsureButton" button
    Then I will see the success message "创建成功"

    Examples:
      |   chartType   |  caseNum  |
      |   Multiaxis   |   4841    |

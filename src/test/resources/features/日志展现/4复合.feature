@all @logDisplay @logDisplayCompound
Feature: 日志展现_4复合

  Background:
    Given open the "splSearch.SearchPage" page for uri "/search/"
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I drag the element "SearchPageSvg" to the "left" side

  @logDisplaySmoke
  Scenario Outline: 区间图(RZY-835)
    When I set the parameter "SearchInput" with value "<spl>"
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I will see the "trend.CreatePage" page
    And I click the "Type" button
    And I click the "Compound" button
    And I click the "<chartType>" button
    And I click the "Settings" button
    And I will see the "trend.CreatePage" page
    And I click the "Xaxis" button
    And I choose the "<xValue>" from the "FieldValue" in config
    And I click the "Yaxis" button
    And I choose the "<actualValue>" from the "Actual" in config
    And I choose the "<predictedValue>" from the "Predict" in config
    And I choose the "<upperValue>" from the "Outlier" in config
    And I choose the "<upperValue>" from the "TopLimit" in config
    And I choose the "<lowerValue>" from the "LowerLimit" in config
    And I click the "Generate" button

    And I click the "Settings" button
    And I wait for "Chart" will be visible
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I wait for "Chart" will be visible
    And I wait for "2000" millsecond
    And I wait for "<chartType>Element" will be visible
    And I will see the "LineChartElement" is display
    And I will see the "ScatterChartElement" is display
    And I move the mouse pointer to the "Type"
    And I wait for "2000" millsecond
    And take part of "Chart" with name "actual/高级搜索视图/4复合_<caseNum>_<chartType>"
    Then I compare source image "actual/高级搜索视图/4复合_<caseNum>_<chartType>" with target image "expect/高级搜索视图/4复合_<caseNum>_<chartType>"

    Examples:
      | xValue | actualValue|  predictedValue| upperValue | lowerValue |   chartType   |   caseNum  |   spl   |
      |   ts   |   cnt      |   _predict_cnt |    upper95 |    lower95 |    Rangeline  |    835     | starttime=\"now/d\" endtime=\"now/d+24h\" tag: sample04061424_chart \| bucket timestamp span=1h as ts \| stats count\(\) as cnt by ts \| esma cnt timefield=ts  |

  @logDisplaySmoke
  Scenario Outline: 多y轴图(RZY-2786)
    When I set the parameter "SearchInput" with value "<spl>"
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I will see the "trend.CreatePage" page
    And I click the "Type" button
    And I click the "Compound" button
    And I click the "<chartType>" button

    And I click the "Settings" button
    And I click the "Xaxis" button
    And I choose the "apache.resp_len" from the "FieldValue" in config
    And I click the "FirstLabel" button
    And I click the "AscendingOrder" button

    And I click the "Yaxis" button
    And I set the parameter "Min" with value "1"
    And I set the parameter "Max" with value "170000"
    And I set the parameter "Unit" with value "面"
    And I choose the "max(apache.resp_len)" from the "FieldValue" in config
    And I choose the "面积图" from the "TypeChartField" in config
    And I click the "Smooth" button
    And I click the "ConnectEmptyData" button

    And I click the "AddField" button
    And I click the "Yaxis2" button
    And I set the parameter "Unit" with value "柱"
    And I set the parameter "Min" with value "2"
    And I set the parameter "Max" with value ""
    And I click the "AddConfigFields" button
    And I choose the "min(apache.resp_len)" from the "FieldValue" in config
    And I choose the "柱状图" from the "TypeChartField" in config

    And I click the "AddField" button
    And I click the "Yaxis3" button
    And I set the parameter "Unit" with value "散"
    And I set the parameter "Min" with value ""
    And I set the parameter "Max" with value "49000"
    And I click the "AddConfigFields" button
    And I choose the "sum(apache.status)" from the "FieldValue" in config
    And I choose the "散点图" from the "TypeChartField" in config

    And I click the "Exhibition" button
    And I click the "AddColor" button
    And I click the "Red" button
    And I click the "Generate" button

    And I click the "Settings" button
    And I wait for "Chart" will be visible
#    And I click the "SearchButton" button
#    And I wait for element "SearchStatus" change text to "搜索完成!"
#    And I wait for "Chart" will be visible
    And I wait for "2000" millsecond
    And I will see the element "FieldAxis_1" contains "max(apache.resp_len)"
    And I will see the element "MinAxis_1" contains "1 面"
    And I will see the element "MaxAxis_1" contains "170K 面"
    And I will see the element "FieldAxis_2" contains "min(apache.resp_len)"
    And I will see the element "MinAxis_2" contains "2 柱"
    And I will see the element "MaxAxis_2" contains "150K 柱"
    And I will see the element "FieldAxis_3" contains "sum(apache.status)"
    And I will see the element "MinAxis_3" contains "0 散"
    And I will see the element "MaxAxis_3" contains "49K 散"
    And I will see the element "Legend" contains "200"
    And I will see the element "Legend" contains "404"
    And I move the mouse pointer to the "Type"
    And I wait for "2000" millsecond
    And take part of "Chart" with name "actual/高级搜索视图/4复合_<caseNum>_<chartType>"
    Then I compare source image "actual/高级搜索视图/4复合_<caseNum>_<chartType>" with target image "expect/高级搜索视图/4复合_<caseNum>_<chartType>"

    Examples:
      |   chartType   | caseNum  |   spl   |
      |   Multiaxis   |   2786   | starttime=\"now/d\" endtime=\"now/d+24h\" tag: sample04061424_display \| stats count(apache.resp_len), max(apache.resp_len), min(apache.resp_len), sum(apache.status), avg(apache.resp_len) by apache.resp_len,apache.status \| limit 10|

  Scenario Outline: 多y轴图(RZY-4842)
    When I set the parameter "SearchInput" with value "<spl>"
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I will see the "trend.CreatePage" page
    And I click the "Type" button
    And I click the "Compound" button
    And I click the "<chartType>" button

    And I click the "Settings" button
    And I click the "Xaxis" button
    And I choose the "apache.resp_len" from the "FieldValue" in config
    And I click the "FirstLabel" button
    And I click the "AscendingOrder" button
    And I click the "Group" button
    And I click the "DeleteFirst" button

    And I click the "Yaxis" button
    And I set the parameter "Min" with value "1"
    And I set the parameter "Max" with value "170000"
    And I set the parameter "Unit" with value "面"
    And I choose the "max(apache.resp_len)" from the "FieldValue" in config
    And I choose the "面积图" from the "TypeChartField" in config
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
    And I choose the "min(apache.resp_len)" from the "FieldValue" in config
    And I choose the "柱状图" from the "TypeChartField" in config
    And I click the "AddColor" button
    And I click the "Red" button

    And I click the "AddField" button
    And I click the "Yaxis3" button
    And I set the parameter "Unit" with value "散"
    And I set the parameter "Min" with value ""
    And I set the parameter "Max" with value "49000"
    And I click the "AddConfigFields" button
    And I choose the "sum(apache.status)" from the "FieldValue" in config
    And I choose the "散点图" from the "TypeChartField" in config
    And I click the "AddColor" button
    And I click the "Orange" button
    And I click the "Generate" button

    And I click the "Settings" button
    And I wait for "Chart" will be visible
    And I drag the scroll bar to the element "Chart"
    And I will see the element "FieldAxis_1" contains "max(apache.resp_len)"
    And I will see the element "MinAxis_1" contains "1 面"
    And I will see the element "MaxAxis_1" contains "170K 面"
    And I will see the element "FieldAxis_2" contains "min(apache.resp_len)"
    And I will see the element "MinAxis_2" contains "2 柱"
    And I will see the element "FieldAxis_3" contains "sum(apache.status)"
    And I will see the element "MinAxis_3" contains "0 散"
    And I will see the element "MaxAxis_3" contains "49K 散"
    And I will see the element "Legend" contains "max(apache.resp_len)"
    And I will see the element "Legend" contains "min(apache.resp_len)"
    And I will see the element "Legend" contains "sum(apache.status)"
    And I move the mouse pointer to the "Type"
    And I wait for "2000" millsecond
    And take part of "Chart" with name "actual/高级搜索视图/4复合_<caseNum>_<chartType>"
    Then I compare source image "actual/高级搜索视图/4复合_<caseNum>_<chartType>" with target image "expect/高级搜索视图/4复合_<caseNum>_<chartType>"

    Examples:
      |   chartType   | caseNum  |   spl   |
      |   Multiaxis   |   4842   | starttime=\"now/d\" endtime=\"now/d+24h\" tag: sample04061424_display \| stats count(apache.resp_len), max(apache.resp_len), min(apache.resp_len), sum(apache.status), avg(apache.resp_len) by apache.resp_len,apache.status \| limit 10|

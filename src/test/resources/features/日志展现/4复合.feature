@all @logDisplay @logDisplayCompound
Feature: 日志展现_复合
#4(3)

  # tag:sample04061424_chart should be uploaded for Yesterday
  Background:
    Given open the "splSearch.SearchPage" page for uri "/search/"
    And I wait for element "SearchStatus" change text to "搜索完成!"

  Scenario Outline: compound(RZY-835)
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
    And I choose the "<upperValue>" from the "TopLimit" in config
    And I choose the "<lowerValue>" from the "LowerLimit" in config
    And I click the "Generate" button

    And I click the "Settings" button
    And I wait for "Chart" will be visible
    And I drag the scroll bar to the element "Chart"
    And I wait for "2000" millsecond
    And take part of "Chart" with name "actual/高级搜索视图/4复合/<caseNum>_<chartType>"
    Then I compare source image "actual/高级搜索视图/4复合/<caseNum>_<chartType>" with target image "expect/高级搜索视图/4复合/<caseNum>_<chartType>"

    Examples:
      | xValue | actualValue|  predictedValue| upperValue | lowerValue |   chartType   |   caseNum  |   spl   |
      |   ts   |   cnt      |   _predict_cnt |    upper95 |    lower95 |    Rangeline  |    835     | starttime=\"now/d-24h\" endtime=\"now/d\" tag: sample04061424_chart \| bucket timestamp span=1h as ts \| stats count\(\) as cnt by ts \| esma cnt timefield=ts  |


  Scenario Outline: manyy(RZY-2785,2786)
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
    And I choose the "max(apache.resp_len)" from the "FieldValue" in config
    And I choose the "面积图" from the "TypeChartField"
    And I set the parameter "Unit" with value "面"
    And I click the "Smooth" button
    And I click the "ConnectEmptyData" button
    And I set the parameter "Min" with value "1"
    And I set the parameter "Max" with value "170000"

    And I click the "AddField" button
    And I drag the scroll bar to the element "FieldValue"
    And I choose the "min(apache.resp_len)" from the "FieldValue" in config
    And I choose the "柱状图" from the "TypeChartField"
    And I set the parameter "Unit" with value "柱"
    And I set the parameter "Min" with value "2"
    And I set the parameter "Max" with value ""

    And I click the "AddField" button
    And I drag the scroll bar to the element "FieldValue"
    And I choose the "sum(apache.status)" from the "FieldValue" in config
    And I choose the "散点图" from the "TypeChartField"
    And I set the parameter "Unit" with value "散"
    And I set the parameter "Min" with value ""
    And I set the parameter "Max" with value "49000"

    And I click the "Exhibition" button
    And I click the "AddColor" button
    And I click the "Red" button
    And I click the "Generate" button

    And I click the "Settings" button
    And I wait for "Chart" will be visible
    And I drag the scroll bar to the element "Chart"
    And I wait for "2000" millsecond
    And take part of "Chart" with name "actual/高级搜索视图/4复合/<caseNum>_<chartType>"
    Then I compare source image "actual/高级搜索视图/4复合/<caseNum>_<chartType>" with target image "expect/高级搜索视图/4复合/<caseNum>_<chartType>"

    Examples:
      |   chartType   | caseNum  |   spl   |
      |   Multiaxis   |   2786   | starttime=\"now/d-24h\" endtime=\"now/d\" tag: sample04061424_display \| stats count(apache.resp_len), max(apache.resp_len), min(apache.resp_len), sum(apache.status), avg(apache.resp_len) by apache.resp_len,apache.status \| limit 10|

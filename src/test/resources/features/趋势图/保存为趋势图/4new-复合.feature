@saveAsTrend @saveAsTrendCompound
Feature: 保存为趋势图_复合
# 2
# sample04061424_chart for yesterday
# sample04061424_display for today
# uncomment comparison

  Background:
    Given open the "splSearch.SearchPage" page for uri "/search/"
    And I wait for element "SearchStatus" change text to "搜索完成!"

  Scenario Outline: compound_rangeline(rzy-2516)
    When I set the parameter "SearchInput" with value "<spl>"
    And I click the "DateEditor" button
    And I click the "Yesterday" button
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
    And I click the "Settings" button
    And I drag the scroll bar to the element "Chart"
    And I wait for "2000" millsecond
    And take part of "Chart" with name "saveAsTrend/<chartType>_<caseNum>"
#    Then I compare source image "src/test/resources/expect/趋势图/<chartType>_<caseNum>.png" with target image "target/cucumber-html-reports/embeddings/actual_img/日志展现_趋势图/<chartType>_<caseNum>.png"
    And I click the "SaveAsTrend" button

    When I set the parameter "NameInput" with value "<chartType>_<caseNum>"
    And I set the parameter "DescribeInput" with value "AutoCreate"
    And I click the "CreateEnsureButton" button
    Then I will see the success message "创建成功"

    Examples:
      | xValue | actualValue|  predictedValue| upperValue | lowerValue |   chartType   |   caseNum  |   spl   |
      |   ts   |   cnt      |   _predict_cnt |    upper95 |    lower95 |    Rangeline  |    2516    | tag: sample04061424_chart \| bucket timestamp span=1h as ts \| stats count\(\) as cnt by ts \| esma cnt timefield=ts  |


  Scenario Outline: compound_manyY(rzy-2523)
    When I set the parameter "SearchInput" with value "tag: sample04061424_display | stats count(apache.resp_len), max(apache.resp_len), min(apache.resp_len), sum(apache.status), avg(apache.resp_len) by apache.resp_len,apache.status | limit 10"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I will see the "trend.CreatePage" page

    And I wait for "Type" will be visible
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

    And I click the "AddField" button
    And I drag the scroll bar to the element "FieldValue"
    And I choose the "sum(apache.status)" from the "FieldValue"
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
    And take part of "Chart" with name "saveAsTrend/<chartType>_<caseNum>"
#    Then I compare source image "src/test/resources/expect/趋势图/<chartType>_<caseNum>.png" with target image "target/cucumber-html-reports/embeddings/actual_img/日志展现_趋势图/<chartType>_<caseNum>.png"
    And I click the "SaveAsTrend" button

    When I set the parameter "NameInput" with value "<chartType>_<caseNum>"
    And I set the parameter "DescribeInput" with value "AutoCreate"
    And I click the "CreateEnsureButton" button
    Then I will see the success message "创建成功"

    Examples:
      |   chartType   |  caseNum  |
      |   Multiaxis   |   2523    |


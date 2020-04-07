Feature: 拖拽生成趋势图图表类型

  Background:
    Given open the "trend.ListPage" page for uri "/trend/"
    And I click the "NewTrendButton" button
    Then I will see the "trend.CreatePage" page

  Scenario Outline: drag_and_drop_sequence(RZY-3595)
    When I set the parameter "SearchInput" with value "logtype:apache"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for "CheckBox" will be visible
    And I "checked" the checkbox which name is "timestamp"
    And I click the "NextButton" button

    And I wait for "Type" will be visible
    And I click the "Type" button
    And I wait for "Order" will be visible
    And I click the "Order" button
    And I click the "<chartType>" button
    And I click the "Type" button

    #problem
    And I drag the element "DragText" to the "XField"

    And I wait for "Chart" will be visible
    And I drag the scroll bar to the element "Chart"
    And I wait for "2000" millsecond
    And take part of "Chart" with name "trend_拖拽/<caseNum>_<chartType>"
    And I click the "NextButton" button

    When I set the parameter "NameInput" with value "拖拽_<chartType>_<caseNum>"
    And I set the parameter "DescribeInput" with value "AutoCreate"
    And I choose the "AutoTest" from the "GroupField"
    And I choose the "无数集app之api全部测试用例" from the "AppField"
    And I click the "FinishButton" button
    Then I wait for "SuccessCreate" will be visible

    Examples:
      |   chartType   |caseNum  |  spl  |
      |    LineChart  |  3595   | logtype:apache|
      |   AreaChart   |  3595   | tag:sample04061424_chart  \| bucket timestamp span = 30m as ts \| stats count()  as cnt by apache.status,ts \|sort by cnt \| limit 20 |
      |  ScatterChart |  3595   | tag:sample04061424_chart  \| stats count() by apache.clientip,apache.resp_len \| limit 10                    |
      |  ColumnChart  |  3595   | tag:sample04061424_chart  \| stats count() by apache.clientip,apache.method|
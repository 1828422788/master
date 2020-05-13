@report @all @reportSelectTrend
Feature: 报表新建_选择

  Background:
    Given open the "report.ListPage" page for uri "/reports/"
    And I click the "NewReportButton" button
    Then I will see the "report.CreatePage" page
    And I wait for element "SelectedUser" change text to "ctest"

  Scenario Outline: new_report_10_trends
    When I set the parameter "Name" with value "test_10trends"
    And I set the parameter "Hour" with value "05"
    And I set the parameter "Minute" with value "00"
    And I choose the "PDF" from the "ReportType"
    And I click the "NextButton" button
    And I wait for "2000" millsecond
    Then I wait for "ChartListButton" will be visible
    When I choose the "<chart1>" from the "ChartListDropdown"
    And I click the "ChartListButton" button
#    Then I will see the element "ChosenTrendLast" contains "<chart1>"
    When I choose the "<chart2>" from the "ChartListDropdown"
    And I click the "ChartListButton" button
    Then I will see the element "ChosenTrendLast" contains "<chart2>"
    When I choose the "<chart3>" from the "ChartListDropdown"
    And I click the "ChartListButton" button
    Then I will see the element "ChosenTrendLast" contains "<chart3>"
    When I choose the "<chart4>" from the "ChartListDropdown"
    And I click the "ChartListButton" button
    Then I will see the element "ChosenTrendLast" contains "<chart4>"
    When I choose the "<chart5>" from the "ChartListDropdown"
    And I click the "ChartListButton" button
    Then I will see the element "ChosenTrendLast" contains "<chart5>"
    When I choose the "<chart6>" from the "ChartListDropdown"
    And I click the "ChartListButton" button
    Then I will see the element "ChosenTrendLast" contains "<chart6>"
    When I choose the "<chart7>" from the "ChartListDropdown"
    And I click the "ChartListButton" button
    Then I will see the element "ChosenTrendLast" contains "<chart7>"
    When I choose the "<chart8>" from the "ChartListDropdown"
    And I click the "ChartListButton" button
    Then I will see the element "ChosenTrendLast" contains "<chart8>"
    When I choose the "<chart9>" from the "ChartListDropdown"
    And I click the "ChartListButton" button
    Then I will see the element "ChosenTrendLast" contains "<chart9>"
    When I choose the "<chart10>" from the "ChartListDropdown"
    And I click the "ChartListButton" button
    Then I will see the element "ChosenTrendLast" contains "<chart10>"
    When I choose the "<chart11>" from the "ChartListDropdown"
    Then I will see the error message "每个用户最多保存十个趋势图"
    When I click the "FinishButton" button
    Then I will see the success message "保存成功"
    And I click the "EnsureButton" button

    Examples:
      |   chart1      |    chart2      |  chart3   |    chart4   |    chart5    |  chart6     |   chart7        |   chart8      |     chart9      |    chart10   |     chart11     |
      | table_Order   |table_Dimension | table_Sun | table_Chord | table_Sankey | table_Force | table_Rangeline | table_Heatmap | table_Regionmap | table_Single | table_Wordcloud |

  Scenario Outline: new_report_moveTrends
    When I set the parameter "Name" with value "<caseNum>"
    And I set the parameter "Hour" with value "05"
    And I set the parameter "Minute" with value "00"
    And I choose the "AutoTest" from the "Tag"
    And I choose the "PDF" from the "ReportType"
    And I click the "NextButton" button
    And I wait for "2000" millsecond
    Then I wait for "ChartListButton" will be visible
    When I choose the "table_Order" from the "ChartListDropdown"
    And I click the "ChartListButton" button
    Then I will see the element "ChosenTrendLast" contains "table_Order"
    When I choose the "table_Dimension" from the "ChartListDropdown"
    And I click the "ChartListButton" button
    Then I will see the element "ChosenTrendLast" contains "table_Dimension"
    When I choose the "table_Sun" from the "ChartListDropdown"
    And I click the "ChartListButton" button
    Then I will see the element "ChosenTrendLast" contains "table_Sun"
    When I click the "<button>" button
    Then I will see the element "ChosenTrendFirst" contains "<trendFirst>"
    And I will see the element "ChosenTrendLast" contains "<trendLast>"
    When I click the "FinishButton" button
    Then I will see the success message "保存成功"
    And I click the "EnsureButton" button

    Examples:
      |     button           |  trendFirst        |  trendLast       | caseNum             |
      | LastTrendDelete      |  table_Order       | table_Dimension  | test_deleteLast     |
      | FirstTrendDelete     |  table_Dimension   | table_Sun        | test_deleteFirst    |
      | LastTrendUpTop       |  table_Sun         | table_Dimension  | test_upTopLast      |
      | FirstTrendDownBottom |  table_Dimension   | table_Order      | test_downBottomFirst|
      | LastTrendUp          |  table_Order       | table_Dimension  | test_upLast         |
      | FirstTrendDown       |  table_Dimension   | table_Sun        | test_downFirst      |

  Scenario: new_report_modifyTrend_cancel
    When I set the parameter "Name" with value "test_modify_cancel"
    And I set the parameter "Hour" with value "05"
    And I set the parameter "Minute" with value "00"
    And I choose the "AutoTest" from the "Tag"
    And I choose the "PDF" from the "ReportType"
    And I click the "NextButton" button
    And I wait for "2000" millsecond
    Then I wait for "ChartListButton" will be visible
    When I choose the "LineChart_2477" from the "ChartList"
    And I click the "ChartListButton" button
    Then I will see the element "ChosenTrendLast" contains "LineChart_2477"
    When I click the "ChosenTrendLast" button
    Then I will see the element "TrendDescription" contains "AutoCreate"
    And I will see the element "TrendSpl" contains "starttime="now/d-24h" endtime="now/d" tag:sample04061424_chart | stats count() as cnt by apache.clientip,apache.method | sort by cnt, apache.clientip"
    And I will see the element "TrendData" contains ""
    And I will see the element "TrendChart" contains "line"
    When I click the "EditButton" button
    Then I set the parameter "TrendNameField" with value "test"
    And I set the parameter "TrendDescribeField" with value "test"
    And I click the "TrendChartType" button
    And I click the "AreaChart" button
    When I click the "CancelButton" button
    Then I will see the element "TrendDescription" contains "AutoCreate"
    And I will see the element "TrendSpl" contains "starttime="now/d-24h" endtime="now/d" tag:sample04061424_chart | stats count() as cnt by apache.clientip,apache.method | sort by cnt, apache.clientip"
    And I will see the element "TrendData" contains ""
    And I will see the element "TrendChart" contains "line"

  Scenario Outline: new_report_type_without_trend
    When I set the parameter "Name" with value "test_no_trends_<type>"
    And I set the parameter "Describe" with value "AutoCreate"
    And I choose the "<type>" from the "ReportType"
    And I set the parameter "Hour" with value "05"
    And I set the parameter "Minute" with value "00"
    And I click the "NextButton" button
    Then I wait for "FinishButton" will be visible
    When I click the "FinishButton" button
    Then I will see the message "至少选择一个趋势图"

    Examples:
      |   type    |
      |   PDF     |
      |   URL     |
      |   EXCEL   |
      |   WORD    |






@report @all @reportSelectTrend
Feature: 报表新建_选择

  Background:
    Given open the "report.ListPage" page for uri "/reports/"
    And I click the "NewReportButton" button
    Then I will see the "report.CreatePage" page
    And I wait for element "SelectedUser" change text to "admin"

  Scenario Outline: new_report_10_trends
    When I set the parameter "Name" with value "test_10trends"
    And I set the parameter "Hour" with value "05"
    And I set the parameter "Minute" with value "00"
    And I choose the "AutoTest" from the "Tag"
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
      |   chart1         |    chart2      |    chart3         |    chart4        |    chart5      |    chart6        |   chart7             |   chart8              |     chart9                     |    chart10            |     chart11                     |
      | LineChart_2477   | AreaChart_2005 | ScatterChart_2491 | ColumnChart_2499 | AreaChart_Pile | ColumnChart_Pile | ScatterChart_bubbles | LineChart_2479_Smooth | LineChart_2479_ConnectEmptyData| AreaChart_2483_Smooth | AreaChart_2483_ConnectEmptyData |

  Scenario Outline: new_report_moveTrends
    When I set the parameter "Name" with value "<caseNum>"
    And I set the parameter "Hour" with value "05"
    And I set the parameter "Minute" with value "00"
    And I choose the "AutoTest" from the "Tag"
    And I choose the "PDF" from the "ReportType"
    And I click the "NextButton" button
    And I wait for "2000" millsecond
    Then I wait for "ChartListButton" will be visible
    When I choose the "LineChart_2477" from the "ChartListDropdown"
    And I click the "ChartListButton" button
    Then I will see the element "ChosenTrendLast" contains "LineChart_2477"
    When I choose the "AreaChart_2005" from the "ChartListDropdown"
    And I click the "ChartListButton" button
    Then I will see the element "ChosenTrendLast" contains "AreaChart_2005"
    When I choose the "ScatterChart_2491" from the "ChartListDropdown"
    And I click the "ChartListButton" button
    Then I will see the element "ChosenTrendLast" contains "ScatterChart_2491"
    When I click the "<button>" button
    Then I will see the element "ChosenTrendFirst" contains "<trendFirst>"
    And I will see the element "ChosenTrendLast" contains "<trendLast>"
    When I click the "FinishButton" button
    Then I will see the success message "保存成功"
    And I click the "EnsureButton" button

    Examples:
      |     button           |  trendFirst      |  trendLast        | caseNum             |
      | LastTrendDelete      |  LineChart_2477  | AreaChart_2005    | test_deleteLast     |
      | FirstTrendDelete     |  AreaChart_2005  | ScatterChart_2491 | test_deleteFirst    |
      | LastTrendUpTop       | ScatterChart_2491| AreaChart_2005    | test_upTopLast      |
      | FirstTrendDownBottom |  AreaChart_2005  | LineChart_2477    | test_downBottomFirst|
      | LastTrendUp          | LineChart_2477   | AreaChart_2005    | test_upLast         |
      | FirstTrendDown       | AreaChart_2005   | ScatterChart_2491 | test_downFirst      |

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
    And I will see the element "TrendSpl" contains "tag:sample04061424_chart | stats count() as cnt by apache.clientip,apache.method | sort by cnt, apache.clientip"
    And I will see the element "TrendData" contains ""
    And I will see the element "TrendChart" contains "line"
    When I click the "EditButton" button
    Then I set the parameter "TrendNameField" with value "test"
    And I set the parameter "TrendDescribeField" with value "test"
    And I click the "TrendChartType" button
    And I click the "AreaChart" button
    When I click the "CancelButton" button
    Then I will see the element "TrendDescription" contains "AutoCreate"
    And I will see the element "TrendSpl" contains "tag:sample04061424_chart | stats count() as cnt by apache.clientip,apache.method | sort by cnt, apache.clientip"
    And I will see the element "TrendData" contains ""
    And I will see the element "TrendChart" contains "line"






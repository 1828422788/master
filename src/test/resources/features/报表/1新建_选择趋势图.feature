@report @allReports @reportSelectTrend
Feature: 报表新建_选择

  Background:
    Given open the "report.ListPage" page for uri "/reports/"
    And I click the "NewReportButton" button
    Then I will see the "report.CreatePage" page
    And I wait for element "SelectedUser" change text to username

  Scenario: new_report_10_trends
    When I set the parameter "Name" with value "test_10trends"
    And I set the parameters "Hour" and "Minute" as "5" minutes later from now
    And I choose the "PDF" from the "ReportType"
    And I click the "NextButton" button under some element
    And I wait for "2000" millsecond
    Then I wait for "ChartListButton" will be visible
    When I choose the "报表测试" from the "ChartList"
    And I click the "ChartListButton" button
    And I click the "ChosenTrendLast" button
    And I wait for "1000" millsecond
    And I click the "EditButton" button
    And I set the parameter "TrendNameField" with value "报表测试_1"
    And I click the "EnsureButton" button
    Then I will see the element "ChosenTrendLast" contains "报表测试_1"
    When I choose the "报表测试" from the "ChartList"
    And I click the "ChartListButton" button
    And I click the "ChosenTrendLast" button
    And I wait for "1000" millsecond
    And I click the "EditButton" button
    And I set the parameter "TrendNameField" with value "报表测试_2"
    And I click the "EnsureButton" button
    Then I will see the element "ChosenTrendLast" contains "报表测试_2"
    When I choose the "报表测试" from the "ChartList"
    And I click the "ChartListButton" button
    And I click the "ChosenTrendLast" button
    And I wait for "1000" millsecond
    And I click the "EditButton" button
    And I set the parameter "TrendNameField" with value "报表测试_3"
    And I click the "EnsureButton" button
    Then I will see the element "ChosenTrendLast" contains "报表测试_3"
    When I choose the "报表测试" from the "ChartList"
    And I click the "ChartListButton" button
    And I click the "ChosenTrendLast" button
    And I wait for "1000" millsecond
    And I click the "EditButton" button
    And I set the parameter "TrendNameField" with value "报表测试_4"
    And I click the "EnsureButton" button
    Then I will see the element "ChosenTrendLast" contains "报表测试_4"
    When I choose the "报表测试" from the "ChartList"
    And I click the "ChartListButton" button
    And I click the "ChosenTrendLast" button
    And I wait for "1000" millsecond
    And I click the "EditButton" button
    And I set the parameter "TrendNameField" with value "报表测试_5"
    And I click the "EnsureButton" button
    Then I will see the element "ChosenTrendLast" contains "报表测试_5"
    When I choose the "报表测试" from the "ChartList"
    And I click the "ChartListButton" button
    And I click the "ChosenTrendLast" button
    And I wait for "1000" millsecond
    And I click the "EditButton" button
    And I set the parameter "TrendNameField" with value "报表测试_6"
    And I click the "EnsureButton" button
    Then I will see the element "ChosenTrendLast" contains "报表测试_6"
    When I choose the "报表测试" from the "ChartList"
    And I click the "ChartListButton" button
    And I click the "ChosenTrendLast" button
    And I wait for "1000" millsecond
    And I click the "EditButton" button
    And I set the parameter "TrendNameField" with value "报表测试_7"
    And I click the "EnsureButton" button
    Then I will see the element "ChosenTrendLast" contains "报表测试_7"
    When I choose the "报表测试" from the "ChartList"
    And I click the "ChartListButton" button
    And I click the "ChosenTrendLast" button
    And I click the "EditButton" button
    And I set the parameter "TrendNameField" with value "报表测试_8"
    And I click the "EnsureButton" button
    Then I will see the element "ChosenTrendLast" contains "报表测试_8"
    When I choose the "报表测试" from the "ChartList"
    And I click the "ChartListButton" button
    And I click the "ChosenTrendLast" button
    And I wait for "1000" millsecond
    And I click the "EditButton" button
    And I set the parameter "TrendNameField" with value "报表测试_9"
    And I click the "EnsureButton" button
    Then I will see the element "ChosenTrendLast" contains "报表测试_9"
    When I choose the "报表测试" from the "ChartList"
    And I click the "ChartListButton" button
    And I click the "ChosenTrendLast" button
    And I wait for "1000" millsecond
    And I click the "EditButton" button
    And I set the parameter "TrendNameField" with value "报表测试_10"
    And I click the "EnsureButton" button
    Then I will see the element "ChosenTrendLast" contains "报表测试_10"
    And I wait for "AlertMessage" will be visible
    And I will see the element "AlertMessage" contains "每个报表最多保存10个趋势图"
    And I wait for "DisabledChartList" will be visible

  Scenario Outline: new_report_moveTrends
    When I set the parameter "Name" with value "<caseNum>"
    And I set the parameters "Hour" and "Minute" as "5" minutes later from now
    And I choose the "PDF" from the "ReportType"
    And I click the "NextButton" button under some element
    And I wait for "2000" millsecond
    Then I wait for "ChartListButton" will be visible
    When I choose the "报表测试" from the "ChartList"
    And I click the "ChartListButton" button
    And I click the "ChosenTrendLast" button
    And I wait for "1000" millsecond
    And I click the "EditButton" button
    And I set the parameter "TrendNameField" with value "报表测试_1"
    And I click the "EnsureButton" button
    Then I will see the element "ChosenTrendLast" contains "报表测试_1"
    When I choose the "报表测试" from the "ChartList"
    And I click the "ChartListButton" button
    And I click the "ChosenTrendLast" button
    And I wait for "1000" millsecond
    And I click the "EditButton" button
    And I set the parameter "TrendNameField" with value "报表测试_2"
    And I click the "EnsureButton" button
    Then I will see the element "ChosenTrendLast" contains "报表测试_2"
    When I choose the "报表测试" from the "ChartList"
    And I click the "ChartListButton" button
    And I click the "ChosenTrendLast" button
    And I wait for "1000" millsecond
    And I click the "EditButton" button
    And I set the parameter "TrendNameField" with value "报表测试_3"
    And I click the "EnsureButton" button
    Then I will see the element "ChosenTrendLast" contains "报表测试_3"
    And I click the "ChosenTrendLast" button
    And I drag the scroll bar to the element "TopOfThePage"
    And I wait for "2000" millsecond
    When I click the "<button>" button
    Then I will see the element "ChosenTrendFirst" contains "<trendFirst>"
    And I will see the element "ChosenTrendLast" contains "<trendLast>"
    When I click the "FinishButton" button under some element
    And I wait for "ResultMessage" will be visible
    And I will see the element "ResultMessage" contains "新建成功"

    Examples:
      |     button           |  trendFirst   |  trendLast  | caseNum             |
      | LastTrendDelete      |  报表测试_1   | 报表测试_2  | test_deleteLast     |
      | FirstTrendDelete     |  报表测试_2   | 报表测试_3  | test_deleteFirst    |
#      | LastTrendUpTop       |  报表测试_3   | 报表测试_2  | test_upTopLast      |
#      | FirstTrendDownBottom |  报表测试_2   | 报表测试_1  | test_downBottomFirst|
#      | LastTrendUp          |  报表测试_1   | 报表测试_2  | test_upLast         |
#      | FirstTrendDown       |  报表测试_2   | 报表测试_3  | test_downFirst      |

  Scenario: new_report_modifyTrend_cancel
    When I set the parameter "Name" with value "test_modify_cancel"
    And I set the parameters "Hour" and "Minute" as "5" minutes later from now
    And I choose the "PDF" from the "ReportType"
    And I click the "NextButton" button under some element
    And I wait for "2000" millsecond
    Then I wait for "ChartListButton" will be visible
    When I choose the "报表测试" from the "ChartList"
    And I click the "ChartListButton" button
    Then I will see the element "ChosenTrendLast" contains "报表测试"
    When I click the "ChosenTrendLast" button
    Then I will see the element "TrendDescription" contains "AutoCreate"
    And I will see the element "TrendSpl" contains "tag:sample04061424_chart | stats count()"
    And I will see the element "TrendData" contains ""
    And I will see the element "TrendChart" contains "table"
    When I click the "EditButton" button
    Then I set the parameter "TrendNameField" with value "test"
    And I set the parameter "TrendDescribeField" with value "test"
    And I click the "TrendChartType" button
    And I click the "Order" button
    And I click the "AreaChart" button
    When I click the "CancelButton" button
    Then I will see the element "TrendDescription" contains "AutoCreate"
    And I will see the element "TrendSpl" contains "tag:sample04061424_chart | stats count()"
    And I will see the element "TrendData" contains ""
    And I will see the element "TrendChart" contains "table"

  Scenario Outline: new_report_modifyTrend_prompt
    When I set the parameter "Name" with value "test_prompt"
    And I set the parameters "Hour" and "Minute" as "5" minutes later from now
    And I choose the "PDF" from the "ReportType"
    And I click the "NextButton" button under some element
    And I wait for "2000" millsecond
    Then I wait for "ChartListButton" will be visible
    When I choose the "报表测试" from the "ChartList"
    And I click the "ChartListButton" button
    Then I will see the element "ChosenTrendLast" contains "报表测试"
    When I click the "ChosenTrendLast" button
    When I click the "EditButton" button
    Then I set the parameter "TrendNameField" with value "<name>"
    And I set the value "<spl>" to the textarea "TrendSplField"
    Then I click the "EnsureButton" button
    And I wait for "TipText" will be visible
    And I will see the element "TipText" contains "<message>"

  Examples:
    | name |    spl                 |  message        |
    |      | * \| stats count()     | 名称不能为空    |
    | test |                        | 搜索内容不能为空|

  Scenario Outline: new_report_type_without_trend
    When I set the parameter "Name" with value "test_no_trends_<type>"
    And I set the parameter "Describe" with value "AutoCreate"
    And I choose the "<type>" from the "ReportType"
    And I set the parameters "Hour" and "Minute" as "5" minutes later from now
    And I click the "NextButton" button under some element
    Then I wait for "FinishButton" will be visible
    When I click the "FinishButton" button under some element
    And I wait for "ErrorMessage" will be visible
    Then I will see the error message "至少选择一个趋势图"

    Examples:
      |   type    |
      |   PDF     |
      |   URL     |
      |   EXCEL   |
      |   WORD    |






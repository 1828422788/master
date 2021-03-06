@report @allReports @reportLayout
Feature: 报表_3_布局设计

  Background:
    Given open the "report.ListPage" page for uri "/reports/"

  Scenario Outline: new_report_layout_1
    And I click the "NewReportButton" button
    Then I will see the "report.CreatePage" page
    And I wait for element "SelectedUser" change text to username
    When I set the parameter "Name" with value "report_Layout_<layout>"
    And I set the parameters "Hour" and "Minute" as "3" minutes later from now
    And I choose the "PDF" from the "ReportType"
    And I click the "NextButton" button
    And I wait for "2000" millsecond
    Then I wait for "ChartListButton" will be visible
    When I choose the "报表测试" from the "ChartList"
    And I click the "ChartListButton" button

    And I click the "Layout<layout>" button
    And I will see the "Badge1" is display
    When I click the "Complete" button
    And I wait for "ResultMessage" will be visible
    And I will see the element "ResultMessage" contains "新建成功"

    Examples:
    | layout |
    | 1      |
    | 2      |

  Scenario Outline: new_report_layout_2
    And I click the "NewReportButton" button
    Then I will see the "report.CreatePage" page
    And I wait for element "SelectedUser" change text to username
    When I set the parameter "Name" with value "report_Layout_<layout>"
    And I set the parameters "Hour" and "Minute" as "3" minutes later from now
    And I choose the "PDF" from the "ReportType"
    And I click the "NextButton" button
    And I wait for "2000" millsecond
    Then I wait for "ChartListButton" will be visible
    When I choose the "报表测试" from the "ChartList"
    And I click the "ChartListButton" button
    And I click the "ChosenTrendLast" button
    And I wait for "1000" millsecond
    And I click the "EditButton" button
    And I set the parameter "TrendNameField" with value "报表测试_1"
    And I click the "EnsureButton" button
    Then I will see the element "LastTrendTitle" contains "报表测试_1"
    When I choose the "报表测试" from the "ChartList"
    And I click the "ChartListButton" button
    And I click the "ChosenTrendLast" button
    And I wait for "1000" millsecond
    And I click the "EditButton" button
    And I set the parameter "TrendNameField" with value "报表测试_2"
    And I click the "EnsureButton" button
    Then I will see the element "LastTrendTitle" contains "报表测试_2"
    When I choose the "报表测试" from the "ChartList"
    And I click the "ChartListButton" button
    And I click the "ChosenTrendLast" button
    And I wait for "1000" millsecond
    And I click the "EditButton" button
    And I set the parameter "TrendNameField" with value "报表测试_3"
    And I click the "EnsureButton" button
    Then I will see the element "LastTrendTitle" contains "报表测试_3"

    And I click the "Layout<layout>" button
    And I will see the "Badge1" is display
    And I will see the "Badge2" is display
    And I will see the "Badge3" is display
    And I will see the "Badge4" doesn't exist
    When I click the "FinishButton" button
    And I wait for "ResultMessage" will be visible
    And I will see the element "ResultMessage" contains "新建成功"

    Examples:
      | layout |
      | 3      |
      | 4      |
      | 5      |
      | 6      |
      | 7      |
      | 8      |
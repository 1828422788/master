@report @reportLimit @allReports
Feature: 报表_7_趋势图个数限制

  Scenario Outline: change_limit_error
    Given open the "system.CustomConfigs" page for uri "/system/"
    And I wait for "2000" millsecond
    And I drag the scroll bar to the element "TrendLimit"
    And I will see the input element "TrendLimit" value will be "10"
    And I wait for "SuccessMessage" will be invisible
    When I set the parameter "TrendLimit" with value "<input>"
    And I let element "TrendLimit" lose focus
    And I wait for "Message" will be visible
    Then I will see the message "报表中趋势图个数限制须为数字"

  Examples:
    |  input    |
    |  abc      |
    |           |

  Scenario: change_limit
    Given open the "system.CustomConfigs" page for uri "/system/"
    And I wait for "2000" millsecond
    And I drag the scroll bar to the element "TrendLimit"
    And I will see the input element "TrendLimit" value will be "10"
    And I wait for "SuccessMessage" will be invisible
    When I set the parameter "TrendLimit" with value "5"
    And I let element "TrendLimit" lose focus
    And I wait for "SuccessMessage" will be visible
    Then I will see the success message "更新成功"

  Scenario: new_report_5_trends
    Given open the "report.ListPage" page for uri "/reports/"
    And I wait for "Loading" will be invisible
    And I click the "NewReportButton" button under some element
    Then I will see the "report.CreatePage" page
    And I wait for element "SelectedUser" change text to username
    When I set the parameter "Name" with value "test_5trends"
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
    When I choose the "报表测试" from the "ChartList"
    And I click the "ChartListButton" button
    And I click the "ChosenTrendLast" button
    And I wait for "1000" millsecond
    And I click the "EditButton" button
    And I set the parameter "TrendNameField" with value "报表测试_4"
    And I click the "EnsureButton" button
    Then I will see the element "LastTrendTitle" contains "报表测试_4"
    When I choose the "报表测试" from the "ChartList"
    And I click the "ChartListButton" button
    And I click the "ChosenTrendLast" button
    And I wait for "1000" millsecond
    And I click the "EditButton" button
    And I set the parameter "TrendNameField" with value "报表测试_5"
    And I click the "EnsureButton" button
    Then I will see the element "LastTrendTitle" contains "报表测试_5"
    And I wait for "AlertMessage" will be visible
    And I will see the element "AlertMessage" contains "每个报表最多保存5个趋势图"
    And I wait for "DisabledChartList" will be visible


  Scenario: change_limit_default
    Given open the "system.CustomConfigs" page for uri "/system/"
    And I wait for "2000" millsecond
    And I drag the scroll bar to the element "TrendLimit"
    And I will see the input element "TrendLimit" value will be "5"
    And I wait for "SuccessMessage" will be invisible
    When I set the parameter "TrendLimit" with value "10"
    And I let element "TrendLimit" lose focus
    And I wait for "SuccessMessage" will be visible
    Then I will see the success message "更新成功"


@report @reportLimit @allReports
Feature: 报表_趋势图个数限制

  Scenario Outline: change_limit_error
    Given open the "system.CustomConfigs" page for uri "/system/"
    And I wait for "2000" millsecond
    And I drag the scroll bar to the element "TrendLimit"
    And I will see the input element "TrendLimit" value will be "10"
    And I wait for "SuccessMessage" will be invisible
    When I set the parameter "TrendLimit" with value "<input>"
    And I let element "TrendLimit" lose focus
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
    Then I will see the success message "更新成功"

  Scenario Outline: new_report_5_trends
    Given open the "report.ListPage" page for uri "/reports/"
    And I click the "NewReportButton" button
    Then I will see the "report.CreatePage" page
    And I wait for element "SelectedUser" change text to username
    When I set the parameter "Name" with value "test_5trends"
    And I set the parameters "Hour" and "Minute" as "5" minutes later from now
    And I choose the "PDF" from the "ReportType"
    And I click the "NextButton" button under some element
    And I wait for "2000" millsecond
    Then I wait for "ChartListButton" will be visible
    When I choose the "<chart1>" from the "ChartList"
    And I click the "ChartListButton" button
    Then I will see the element "ChosenTrendLast" contains "<chart1>"
    When I choose the "<chart2>" from the "ChartList"
    And I click the "ChartListButton" button
    Then I will see the element "ChosenTrendLast" contains "<chart2>"
    When I choose the "<chart3>" from the "ChartList"
    And I click the "ChartListButton" button
    Then I will see the element "ChosenTrendLast" contains "<chart3>"
    When I choose the "<chart4>" from the "ChartList"
    And I click the "ChartListButton" button
    Then I will see the element "ChosenTrendLast" contains "<chart4>"
    When I choose the "<chart5>" from the "ChartList"
    And I click the "ChartListButton" button
    Then I will see the element "ChosenTrendLast" contains "<chart5>"
    When I choose the "<chart6>" from the "ChartList"
    Then I will see the error message "每个报表最多保存5个趋势图"
    When I click the "FinishButton" button under some element
    And I wait for "EnsureButton" will be visible
    Then I will see the success message "保存成功"
    And I click the "EnsureButton" button

    Examples:
      |   chart1      |    chart2      |  chart3   |    chart4   |    chart5    |  chart6     |
      | table_Order   |table_Dimension | table_Sun | table_Chord | table_Sankey | table_Force |

  Scenario: change_limit_default
    Given open the "system.CustomConfigs" page for uri "/system/"
    And I wait for "2000" millsecond
    And I drag the scroll bar to the element "TrendLimit"
    And I will see the input element "TrendLimit" value will be "5"
    And I wait for "SuccessMessage" will be invisible
    When I set the parameter "TrendLimit" with value "10"
    And I let element "TrendLimit" lose focus
    And I wait for "500" millsecond
    Then I will see the success message "更新成功"


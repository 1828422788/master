@reportTextEditor @report
Feature: 报表_富文本编辑_8_限制

  Scenario: change_limit
    Given open the "system.CustomConfigs" page for uri "/system/"
    And I wait for "2000" millsecond
    And I drag the scroll bar to the element "TrendLimit"
    And I will see the input element "TrendLimit" value will be "10"
    And I wait for "SuccessMessage" will be invisible
    When I set the parameter "TrendLimit" with value "3"
    And I let element "TrendLimit" lose focus
    And I wait for "SuccessMessage" will be visible
    Then I will see the success message "更新成功"

  Scenario: new_report_5_trends
    Given open the "report.ListPage" page for uri "/reports/"
    And I click the "NewReportButton" button
    Then I will see the "report.CreatePage" page
    And I wait for element "SelectedUser" change text to username
    When I set the parameter "Name" with value "test_5trends_WORD"
    And I set the parameters "Hour" and "Minute" as "5" minutes later from now
    And I choose the "WORD" from the "ReportType"
    And I click the "NextButton" button
    And I will see the "report.CreatePageWORD" page

    And I click the element "AddTable" in word report
    And I click the element "AddTable3x2" in word report
    And I wait for "TableElement" will be visible
    And I select all text in row "1" and column "1" of the table in word report
    And I choose the "报表测试" from the "ChartList"
    And I wait for "1000" millsecond
    And I will see the element "LastAddedTrend" contains "报表测试"
    And I click the element "TextArea" in word report
    And I select all text in row "1" and column "2" of the table in word report
    And I choose the "报表测试" from the "ChartList"
    And I wait for "1000" millsecond
    And I will see the element "LastAddedTrend" contains "报表测试(1)"
    And I click the element "TextArea" in word report
    And I select all text in row "1" and column "3" of the table in word report
    And I choose the "报表测试" from the "ChartList"
    And I wait for "1000" millsecond
    And I will see the element "LastAddedTrend" contains "报表测试(2)"
    And I click the element "TextArea" in word report
    And I select all text in row "2" and column "1" of the table in word report
    And I choose the "报表测试" from the "ChartList"
    And I will see the message contains "每个报表最多保存3个趋势图"


  Scenario: change_limit_default
    Given open the "system.CustomConfigs" page for uri "/system/"
    And I wait for "2000" millsecond
    And I drag the scroll bar to the element "TrendLimit"
    And I will see the input element "TrendLimit" value will be "3"
    And I wait for "SuccessMessage" will be invisible
    When I set the parameter "TrendLimit" with value "10"
    And I let element "TrendLimit" lose focus
    And I wait for "SuccessMessage" will be visible
    Then I will see the success message "更新成功"
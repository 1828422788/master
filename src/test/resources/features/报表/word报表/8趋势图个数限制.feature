@reportTextEditor
Feature: 报表_富文本编辑_限制

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
    And I click the "NewReportButton" button under some element
    Then I will see the "report.CreatePage" page
    And I wait for element "SelectedUser" change text to username
    When I set the parameter "Name" with value "test_5trends_WORD"
    And I set the parameters "Hour" and "Minute" as "5" minutes later from now
    And I choose the "WORD" from the "ReportType"
    And I click the "NextButton" button under some element
    Then I wait for "ChartListButtonWord" will be visible
    And I wait for "5000" millsecond

    And I click the "AddTable" button
    And I click the "AddTable3x2" button
    And I wait for "2000" millsecond
    And I select all text in row "1" and column "1" of the table in word report
    And I set the parameter "ChartListInput" with value "报表测试"
    And I click the button with text "报表测试"
    And I wait for "2000" millsecond
    And I will see the element "LastAddedTrend" contains "报表测试"
    And I select all text in row "1" and column "2" of the table in word report
    And I set the parameter "ChartListInput" with value "报表测试"
    And I click the button with text "报表测试"
    And I wait for "2000" millsecond
    And I will see the element "LastAddedTrend" contains "报表测试(1)"
    And I select all text in row "1" and column "3" of the table in word report
    And I set the parameter "ChartListInput" with value "报表测试"
    And I click the button with text "报表测试"
    And I wait for "2000" millsecond
    And I will see the element "LastAddedTrend" contains "报表测试(2)"
    And I select all text in row "2" and column "1" of the table in word report
    And I set the parameter "ChartListInput" with value "报表测试"
    And I click the button with text "报表测试"
    And I wait for "2000" millsecond
    And I will see the element "LastAddedTrend" contains "报表测试(3)"
    And I select all text in row "2" and column "2" of the table in word report
    And I set the parameter "ChartListInput" with value "报表测试"
    And I click the button with text "报表测试"
    And I wait for "2000" millsecond
    And I will see the element "LastAddedTrend" contains "报表测试(4)"
    And I select all text in row "2" and column "3" of the table in word report
    And I set the parameter "ChartListInput" with value "报表测试"
    And I click the button with text "报表测试"
    And I wait for "ErrorMessage" will be visible
    Then I will see the error message "每个报表最多保存5个趋势图"
    And I will see the element "LastAddedTrend" contains "报表测试(4)"

    And I set the parameter "TextArea" with value "Lorem ipsum dolor sit amet, consectetur adipiscing elit. "
    And I set the parameter "ChartListInput" with value "报表测试"
    And I click the button with text "报表测试"
    And I wait for "2000" millsecond
    And I will see the element "LastAddedTrend" contains "报表测试"
    And I will see the "ErrorMessage" doesn't exist
    
    When I click the "FinishButton" button under some element
    And I wait for "EnsureButton" will be visible
    Then I will see the success message "保存成功"
    And I click the "EnsureButton" button


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


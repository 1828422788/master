@reportTextEditor @report
Feature:报表_富文本编辑_趋势图

  Background:
    Given open the "report.ListPage" page for uri "/reports/"
    And I click the "NewReportButton" button under some element
    Then I will see the "report.CreatePage" page
    And I wait for element "SelectedUser" change text to username
    And I set the parameter "Describe" with value "AutoCreate"
    And I set the parameters "Hour" and "Minute" as "5" minutes later from now
    And I choose the "WORD" from the "ReportType"

  Scenario Outline: empty_report
    When I set the parameter "Name" with value "empty_word_report"
    And I click the "NextButton" button under some element
    And I will see the "report.CreatePageWORD" page
    Then I wait for "ChartListButtonWord" will be visible
    And I wait for "5000" millsecond

    And I set the parameter "<inputSearch>" with value "<name>"
    And I click the button with text "<name>"
    And I will see the "<element>" is display
    And I click the "EditButton" button
    And I will see the input element "TrendNameField" value will be "<name>"
    Then I click the "EnsureButton" button
    And I wait for "2000" millsecond
    And I click the element "Undo" in word report
    And I click the element "Undo" in word report
    And I will see the "<element>" doesn't exist
    And I click the element "Redo" in word report
    And I will see the "<element>" is display
    And I click the "EditButton" button
    And I will see the input element "TrendNameField" value will be "<name>"
    Then I click the "EnsureButton" button

    And I wait for "TextArea" will be visible
    And I set the parameter "TextArea" with value "Lorem ipsum dolor sit amet, consectetur adipiscing elit. "

    When I click the "FinishButton" button under some element
    And I wait for "ErrorMessage" will be visible
    Then I will see the error message "至少选择一个趋势图"

    Examples:
      | name         | inputSearch           |  element            |
      | 报表测试     | ChartListInput        |TrendElement         |
      | 单值报表测试 | SingleChartListInput  |SingleTrendElement   |

  Scenario Outline: trend_delete_parts
    When I set the parameter "Name" with value "delete_parts"
    And I click the "NextButton" button under some element
    And I will see the "report.CreatePageWORD" page
    Then I wait for "ChartListButtonWord" will be visible
    And I wait for "5000" millsecond

    And I set the parameter "<inputSearch>" with value "<name>"
    And I click the button with text "<name>"
    And I will see the "<element>" is display
    And I wait for "2000" millsecond

    And I click the element "DeleteTrendName" in word report
    And I will see the "Trend_Name" doesn't exist
    And I will see the "<element>" is display
    And I click the element "Undo" in word report
    And I will see the "Trend_Name" is display

    And I click the element "DeleteTrendDescription" in word report
    And I will see the "Trend_Description" doesn't exist
    And I will see the "<element>" is display
    And I click the element "Undo" in word report
    And I will see the "Trend_Description" is display

    And I click the element "DeleteTrendTimerange" in word report
    And I will see the "Trend_Timerange" doesn't exist
    And I will see the "<element>" is display
    And I click the element "Undo" in word report
    And I will see the "Trend_Timerange" is display

    And I click the element "DeleteTrendChart" in word report
    And I will see the "Trend_Chart" doesn't exist
    And I will see the "<element>" doesn't exist
    And I wait for "2000" millsecond

    When I click the "FinishButton" button under some element
    And I wait for "ErrorMessage" will be visible
    Then I will see the error message "至少选择一个趋势图"

    Examples:
      | name         | inputSearch           |  element            |
      | 报表测试     | ChartListInput        |TrendElement         |
      | 单值报表测试 | SingleChartListInput  |SingleTrendElement   |

    Scenario: single_trend
      When I set the parameter "Name" with value "SingleTrend"
      And I click the "NextButton" button under some element
      And I will see the "report.CreatePageWORD" page
      Then I wait for "ChartListButtonWord" will be visible
      And I wait for "5000" millsecond

      And I set the parameter "SingleChartListInput" with value "单值报表测试"
      And I click the button with text "单值报表测试"
      And I will see the "SingleTrendElement" is display
      And I wait for "2000" millsecond
      And I click the "EditButton" button
      And I will see the "DisabledType" is display
      Then I click the "EnsureButton" button

      When I click the "FinishButton" button under some element
      And I wait for "ResultMessage" will be visible
      And I will see the element "ResultMessage" contains "新建成功"


  Scenario: single_trend_table
    When I set the parameter "Name" with value "SingleTrend_Table"
    And I click the "NextButton" button under some element
    And I will see the "report.CreatePageWORD" page
    Then I wait for "ChartListButtonWord" will be visible
    And I wait for "5000" millsecond

    And I set the parameter "SingleChartListInput" with value "单值报表测试"
    And I click the button with text "单值报表测试"
    And I will see the "SingleTrendElement" is display
    And I wait for "2000" millsecond

    And I click the element "AddTable" in word report
    And I click the element "AddTable3x3" in word report
    And I wait for "2000" millsecond
    And I will see the "TableElement" is display

    And I drag the element "Trend_Name" to the "Cell11"
    And I click the element "Cell11" in word report
    And I wait for "2000" millsecond
    And I drag the element "Trend_Description" to the "Cell12"
    And I click the element "Cell12" in word report
    And I wait for "2000" millsecond
    And I drag the element "Trend_Chart" to the "Cell21"
    And I click the element "Cell21" in word report
    And I wait for "2000" millsecond
    And I drag the element "Trend_Timerange" to the "Cell22"
    And I click the element "Cell22" in word report
    And I wait for "2000" millsecond
    And I will see the "SingleTrendElement" doesn't exist

    And I click the "EditButton" button
    And I will see the "DisabledType" is display
    Then I click the "EnsureButton" button
    And I wait for "2000" millsecond

    When I click the "FinishButton" button under some element
    And I wait for "ResultMessage" will be visible
    And I will see the element "ResultMessage" contains "新建成功"

  Scenario: single_trend_header_footer
    When I set the parameter "Name" with value "SingleTrend_HF"
    And I click the "NextButton" button under some element
    And I will see the "report.CreatePageWORD" page
    Then I wait for "ChartListButtonWord" will be visible
    And I wait for "5000" millsecond

    And I set the parameter "SingleChartListInput" with value "单值报表测试"
    And I click the button with text "单值报表测试"
    And I will see the "SingleTrendElement" is display
    And I wait for "2000" millsecond

    And I click the element "Header" in word report
    And I wait for "2000" millsecond
    And I drag the element "Trend_Chart" to the "HeaderText"
    And I click the element "HeaderText" in word report
    And I wait for "2000" millsecond
    And I click the element "Footer" in word report
    And I wait for "2000" millsecond
    And I drag the element "Trend_Timerange" to the "FooterText"
    And I click the element "FooterText" in word report
    And I click the element "DeleteTrendDescription" in word report
    And I wait for "2000" millsecond
    And I will see the "Trend_Description" doesn't exist

    And I click the "EditButton" button
    And I will see the "DisabledType" is display
    Then I click the "EnsureButton" button
    And I wait for "2000" millsecond

    When I click the "FinishButton" button under some element
    And I wait for "ResultMessage" will be visible
    And I will see the element "ResultMessage" contains "新建成功"

  Scenario Outline: change_type
    When I set the parameter "Name" with value "ChangeToPDF<name_report>"
    And I click the "NextButton" button under some element
    And I will see the "report.CreatePageWORD" page
    Then I wait for "ChartListButtonWord" will be visible
    And I wait for "5000" millsecond

    And I set the parameter "<inputSearch>" with value "<name>"
    And I click the button with text "<name>"
    And I will see the "<element>" is display
    And I will see the element "LastAddedTrend" contains "<name>"
    And I wait for "2000" millsecond

    And I will see the "report.CreatePage" page
    And I click the "BackButton" button under some element
    And I choose the "PDF" from the "ReportType"
    And I click the "NextButton" button under some element
    Then I will see the element "ChosenTrendLast" contains "<name>"

    When I click the "FinishButton" button under some element
    And I wait for "ResultMessage" will be visible
    And I will see the element "ResultMessage" contains "新建成功"

    Examples:
      | name         | inputSearch           |  element            | name_report |
      | 报表测试     | ChartListInput        |TrendElement         |             |
      | 单值报表测试 | SingleChartListInput  |SingleTrendElement   | _Single     |





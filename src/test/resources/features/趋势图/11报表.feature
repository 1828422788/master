@all @trend @reportTrend
Feature: 趋势图新建_报表


  Scenario Outline: create_report
    Given open the "trend.ListPage" page for uri "/trend/"
    And I click the "NewTrendButton" button
    Then I will see the "trend.CreatePage" page
    And I wait for "Loading" will be invisible
    When I set the parameter "SearchInput" with value "starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424_chart | stats count() by apache.clientip,apache.method"
    And I click the "SearchButton" button
    And I wait for "Loading" will be invisible
    And I wait for "Header" will be visible
    And I click the "NextButton" button under some element
    And I wait for "2000" millsecond

    And I wait for "Type" will be visible
    And I click the "Type" button
    And I click the "Order" button
    And I click the "LineChart" button

    And I click the "Type" button
    And I wait for "StatisticalChart" will be visible

    And I click the "NextButton" button under some element
    When I set the parameter "NameInput" with value "<trend_name>"
    And I set the parameter "DescribeInput" with value "AutoCreate"
    And I click the "NextButton" button under some element
    Then I wait for "SuccessCreate" will be visible
    When I click the "Report" button

    And switch to window "编辑报表"
    And I close all tabs except main tab
    Then I will see the "report.CreatePage" page
    And I wait for "3000" millsecond
    And I wait for element "SelectedUser" change text to username
    And I wait for "3000" millsecond
    When I set the parameter "Name" with value "Report_Test_<type>"
    And I set the parameter "Describe" with value "AutoCreate"
    And I choose the "test_app" from the "App" in config
    And I choose the "<type>" from the "ReportType" in config
    And I choose the "ekaterina.kiseleva@yottabyte.cn" from the "EmailInput" in config
    And I will see the element "SubjectNote" contains "注: 可用变量: 报表名称：<%report_name%>，发送时间：<%report_time%>"
    And I set the parameter "Subject" with value " 报表名称：<%report_name%>，发送时间：<%report_time%>"
    And I set the parameter "Hour" with value "16"
    And I set the parameter "Minute" with value "45"
    And I click the "NextButton" button under some element
    Then I will see the "report.CreatePage<page>" page
    And I wait for "5000" millsecond
    Then I will see the element "<added_trend>" contains "<trend_name>"
    When I click the "FinishButton" button under some element
    Then I will see the success message "保存成功"
    And I click the "EnsureButton" button

    Examples:
      |   type  |  trend_name    | added_trend      |   page    |
      | PDF     |  Trend_Test_1  | ChosenTrendLast  |           |
      | WORD    |  Trend_Test_2  | LastAddedTrend   |   WORD    |


  Scenario Outline: delete_trend_report
    When open the "trend.ListPage" page for uri "/trend/"
    And I wait for "2000" millsecond
    And  the data name is "{'column':'0','name':'<trend_name>'}" then i click the "删除" button
    Then I will see the message "确认删除 [<trend_name>] ?"
    When I click the "EnsureButton" button
    Then I will see the success message "删除成功"
    When open the "report.ListPage" page for uri "/reports/"
    And I wait for "2000" millsecond
    And the data name is "{'column':'1','name':'<report_name>'}" then i click the "删除" button
    Then I will see the message "此操作将删除 [<report_name>], 是否继续？"
    When I click the "EnsureButton" button
    And I wait for "500" millsecond
    Then I will see the message "删除成功"
    And I click the "EnsureButton" button

    Examples:
      |  trend_name    |   report_name    |
      |  Trend_Test_1  | Report_Test_PDF  |
      |  Trend_Test_2  | Report_Test_WORD |


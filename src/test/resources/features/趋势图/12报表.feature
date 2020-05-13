@all @trend @reportTrend
Feature: 趋势图新建_报表


  Scenario Outline: create_report
    Given open the "trend.ListPage" page for uri "/trend/"
    And I click the "NewTrendButton" button
    Then I will see the "trend.CreatePage" page
    When I set the parameter "SearchInput" with value "starttime=\"now/d-24h\" endtime=\"now/d\" tag:sample04061424_chart | stats count() by apache.clientip,apache.method"
    And I click the "SearchButton" button
    And I wait for "Header" will be visible
    And I click the "NextButton" button

    And I wait for "Type" will be visible
    And I click the "Type" button
    And I click the "Order" button
    And I click the "LineChart" button

    And I click the "Type" button
    And I wait for "Chart" will be visible

    And I click the "NextButton" button
    When I set the parameter "NameInput" with value "<trend_name>"
    And I set the parameter "DescribeInput" with value "AutoCreate"
    And I click the "NextButton" button
    Then I wait for "SuccessCreate" will be visible
    When I click the "Report" button

    And switch to window "编辑报表"
    And I close all tabs except main tab
    And I wait for loading invisible
    Then I will see the "report.CreatePage" page
    And I wait for "3000" millsecond
    When I set the parameter "Name" with value "<report_name>"
    And I set the parameter "Describe" with value "AutoCreate"
#    And I will see the element "SelectedUser" contains "admin"
    And I choose the "AutoTest" from the "Tag"
    And I choose the "TrendApp" from the "App"
    And I choose the "PDF" from the "ReportType"
    And I choose the "ekaterina.kiseleva@yottabyte.cn" from the "EmailInput"
    And I will see the element "SubjectNote" contains "注: 可用变量: 报表名称：<%report_name%>，发送时间：<%report_time%>"
    And I set the parameter "Subject" with value " 报表名称：<%report_name%>，发送时间：<%report_time%>"
    And I set the parameter "Hour" with value "16"
    And I set the parameter "Minute" with value "45"
    And I click the "NextButton" button
    Then I will see the element "ChosenTrendLast" contains "<trend_name>"
    When I click the "FinishButton" button
    Then I will see the success message "保存成功"
    And I click the "EnsureButton" button

    Examples:
      | trend_name    | report_name   |
      | Trend_Test    | Report_Test   |


  Scenario: delete_trend_report
    When open the "trend.ListPage" page for uri "/trend/"
    And  the data name is "{'column':'0','name':'Trend_Test'}" then i click the "删除" button
    Then I will see the message "确认删除 [Trend_Test] ?"
    When I click the "EnsureButton" button
    Then I will see the success message "删除成功"
    When open the "report.ListPage" page for uri "/reports/"
    And the data name is "{'column':'1','name':'Report_Test'}" then i click the "删除" button
    Then I will see the message "此操作将删除 [Report_Test], 是否继续？"
    When I click the "EnsureButton" button
    And I wait for "500" millsecond
    Then I will see the message "删除成功"
    And I click the "EnsureButton" button

@report @all @reportBasic
Feature: 报表新建_执行计划

  Background:
    Given open the "report.ListPage" page for uri "/reports/"
    And I click the "NewReportButton" button
    Then I will see the "report.CreatePage" page
    And I wait for element "SelectedUser" change text to username

  Scenario Outline: new_report_error_message
    When I set the parameter "Name" with value "<name>"
    And I set the parameter "Hour" with value "<hour>"
    And I set the parameter "Minute" with value "<minute>"
    And I click the "NextButton" button
    Then I will see the message "<message_text>"

    Examples:
    |   name      |  hour   | minute   | message_text                                  |
    |             |         |          | 名称不能为空                                   |
    | test_report |         |          | 请输入小时                                     |
    | test_report |   25    |          | 小时输入错误，时间可输入范围为0~23              |
    | test_report |   15    |          | 请输入分钟                                     |
    | test_report |   15    |  67      | 分钟输入错误，时间可输入范围为0~59              |

  Scenario Outline: new_report_success_day
    When I set the parameter "Name" with value "test_report_<period>"
    And I set the parameter "Describe" with value "AutoCreate"
    And I choose the "auto_package" from the "Tag"
    And I choose the "PDF" from the "ReportType"
    And I choose the "<period>" from the "Period"
    And I set the parameter "Hour" with value "<hour>"
    And I set the parameter "Minute" with value "<minute>"
    And I click the "NextButton" button
    Then I wait for "ChartListButton" will be visible
    When I choose the "table_Order" from the "ChartList"
    And I click the "ChartListButton" button
    Then I will see the element "ChosenTrendLast" contains "table_Order"
    When I click the "FinishButton" button
    Then I will see the success message "保存成功"
    And I click the "EnsureButton" button
    And I will see the "report.ListPage" page
    And I will see the data "{'column':'1','name':'test_report_<period>'}" values "{'column':'4','name':'每日 <hour>时<minute>分'}"

    Examples:
      |    period    |  hour   |   minute  |
      |    每天      |  16     |  10        |

  Scenario Outline: new_report_success_period
    When I set the parameter "Name" with value "test_report_<period>"
    And I set the parameter "Describe" with value "AutoCreate"
    And I choose the "auto_package" from the "Tag"
    And I choose the "PDF" from the "ReportType"
    And I choose the "<period>" from the "Period"
    And I choose the "<day>" from the "Day"
    And I set the parameter "Hour" with value "<hour>"
    And I set the parameter "Minute" with value "<minute>"
    And I click the "NextButton" button
    Then I wait for "ChartListButton" will be visible
    When I choose the "table_Order" from the "ChartList"
    And I click the "ChartListButton" button
    Then I will see the element "ChosenTrendLast" contains "table_Order"
    When I click the "FinishButton" button
    Then I will see the success message "保存成功"
    And I click the "EnsureButton" button
    And I will see the "report.ListPage" page
    And I will see the data "{'column':'1','name':'test_report_<period>'}" values "{'column':'4','name':'<period><day> <hour>时<minute>分'}"

  Examples:
    |    period    |   day    |  hour   |   minute  |
    |    每周      |  三      |  16     |  10        |
    |    每月      |  25日    |  16     |  10        |


  Scenario Outline: new_report_error_message_crontab
    When I set the parameter "Name" with value "<name>"
    And I click the "CrontabButton" button
    And I set the parameter "Crontab" with value "<crontab>"
    And I click the "NextButton" button
    Then I will see the message "<message_text>"

    Examples:
      |   name       |  crontab | message_text                                  |
      | test_report  |          | crontab模式下, 执行计划不能为零或空             |
      | test_report  |   test   | 非法crontab表达式, 请检查后重试                 |


  Scenario: new_report_success_crontab
    When I set the parameter "Name" with value "test_report_crontab"
    And I set the parameter "Describe" with value "AutoCreate"
    And I choose the "auto_package" from the "Tag"
    And I choose the "PDF" from the "ReportType"
    And I set the parameter "Crontab" with value "0 0/15 9 ? * MON-FRI"
    And I click the "NextButton" button
    Then I wait for "ChartListButton" will be visible
    When I choose the "table_Order" from the "ChartList"
    And I click the "ChartListButton" button
    Then I will see the element "ChosenTrendLast" contains "table_Order"
    When I click the "FinishButton" button
    Then I will see the success message "保存成功"
    And I click the "EnsureButton" button
    And I will see the "report.ListPage" page
    And I will see the data "{'column':'1','name':'test_report_crontab'}" values "{'column':'4','name':'0 0/15 9 ? * MON-FRI'}"
    
  Scenario: new_report_fields
    When I set the parameter "Name" with value "test_report"
    And I set the parameter "Describe" with value "AutoCreate"
    And I choose the "auto_package" from the "Tag"
    And I choose the "TrendApp" from the "App"
    And I choose the "PDF" from the "ReportType"
    And I choose the "ekaterina.kiseleva@yottabyte.cn" from the "EmailInput"
    And I will see the element "SubjectNote" contains "注: 可用变量: 报表名称：<%report_name%>，发送时间：<%report_time%>"
    And I set the parameter "Subject" with value " 报表名称：<%report_name%>，发送时间：<%report_time%>"
    And I set the parameter "Hour" with value "05"
    And I set the parameter "Minute" with value "00"
    And I click the "NextButton" button
    Then I wait for "FinishButton" will be visible

  Scenario Outline: new_report_type
    When I set the parameter "Name" with value "test_report_<type>"
    And I set the parameter "Describe" with value "AutoCreate"
    And I choose the "<type>" from the "ReportType"
    And I set the parameter "Hour" with value "05"
    And I set the parameter "Minute" with value "00"
    And I click the "NextButton" button
    Then I wait for "ChartListButton" will be visible
    When I choose the "table_Order" from the "ChartList"
    And I click the "ChartListButton" button
    Then I will see the element "ChosenTrendLast" contains "table_Order"
    When I click the "FinishButton" button
    Then I will see the success message "保存成功"
    And I click the "EnsureButton" button

    Examples:
      |   type    |
      |   PDF     |
      |   URL     |
      |   EXCEL   |




    

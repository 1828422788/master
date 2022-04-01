@report @allReports @reportBasic
Feature: 报表_1a_基本设置

  Background:
    Given open the "report.ListPage" page for uri "/reports/"
    And I click the "NewReportButton" button under some element
    Then I will see the "report.CreatePage" page
    And I wait for element "SelectedUser" change text to username

  @reportSmoke
  Scenario Outline: 报表类型
    When I set the parameter "Name" with value "test_report_<type>"
    And I set the parameter "Describe" with value "AutoCreate"
    And I choose the "<type>" from the "ReportType"
    And I set the parameters "Hour" and "Minute" as "3" minutes later from now
    And I click the "NextButton" button under some element
    Then I wait for "ChartListButton" will be visible
    When I choose the "报表测试" from the "ChartList"
    And I click the "ChartListButton" button
    Then I will see the element "LastTrendTitle" contains "报表测试"
    When I click the "Complete" button under some element
    And I wait for "ResultMessage" will be visible
    And I will see the element "ResultMessage" contains "新建成功"

    Examples:
      |   type    |
      |   PDF     |
      |   URL     |
      |   EXCEL   |

  Scenario Outline: 检查提示
    When I set the parameter "Name" with value "<name>"
    And I set the parameter "Hour" with value "<hour>"
    And I set the parameter "Minute" with value "<minute>"
    And I click the "NextButton" button under some element
    And I wait for "TipText" will be visible
    And I will see the element "TipText" contains "<message_text>"

    Examples:
    |   name      |  hour   | minute   | message_text                                  |
    |             |         |          | 名称不能为空                                   |
    | test_report |         |          | 请输入小时                                     |
    | test_report |   25    |          | 小时输入错误，时间可输入范围为0~23              |
    | test_report |   15    |          | 请输入分钟                                     |
    | test_report |   15    |  67      | 分钟输入错误，时间可输入范围为0~59              |

  Scenario: 名称为空
    When I set the parameter "Name" with value " "
    And I click the "NextButton" button under some element
    And I wait for "TipText" will be visible
    And I will see the element "TipText" contains "名称不能为空"

  Scenario Outline: 执行计划_每天
    When I set the parameter "Name" with value "test_report_<period>"
    And I set the parameter "Describe" with value "AutoCreate"
    And I choose the "PDF" from the "ReportType"
    And I wait for "2000" millsecond
    And I choose the "test_app" from the "App" in config
    And I wait for "2000" millsecond
    And I choose the "<period>" from the "Period"
    And I set the parameter "Hour" with value "<hour>"
    And I set the parameter "Minute" with value "<minute>"
    And I click the "NextButton" button under some element
    Then I wait for "ChartListButton" will be visible
    When I choose the "报表测试" from the "ChartList"
    And I click the "ChartListButton" button
    Then I will see the element "LastTrendTitle" contains "报表测试"
    When I click the "Complete" button under some element
    And I wait for "ResultMessage" will be visible
    And I will see the element "ResultMessage" contains "新建成功"
    And I click the "ReturnButton" button
    And I will see the "report.ListPage" page
    And I wait for "Loading" will be invisible
    And I will see the data "{'column':'1','name':'test_report_<period>'}" values "{'column':'4','name':'每日 <hour>时<minute>分'}"

    Examples:
      |    period    |  hour   |   minute  |
      |    每天      |  16     |  10        |

  Scenario Outline: 执行计划-2个（每周，每月）
    When I set the parameter "Name" with value "test_report_<period>"
    And I set the parameter "Describe" with value "AutoCreate"
    And I choose the "PDF" from the "ReportType"
    And I choose the "<period>" from the "Period"
    And I wait for "1000" millsecond
    And I choose the "<day>" from the "Day"
    And I set the parameter "Hour" with value "<hour>"
    And I set the parameter "Minute" with value "<minute>"
    And I click the "NextButton" button under some element
    Then I wait for "ChartListButton" will be visible
    When I choose the "报表测试" from the "ChartList"
    And I click the "ChartListButton" button
    Then I will see the element "LastTrendTitle" contains "报表测试"
    When I click the "Complete" button under some element
    And I wait for "ResultMessage" will be visible
    And I will see the element "ResultMessage" contains "新建成功"
    And I click the "ReturnButton" button
    And I will see the "report.ListPage" page
    And I wait for "Loading" will be invisible
    And I will see the data "{'column':'1','name':'test_report_<period>'}" values "{'column':'4','name':'<period><day> <hour>时<minute>分'}"

  Examples:
    |    period    |   day    |  hour   |   minute  |
    |    每周      |  三      |  16     |  10        |
    |    每月      |  25日    |  16     |  10        |

  @reportSmoke
  Scenario Outline: 执行计划_每年
    When I set the parameter "Name" with value "test_report_<period>"
    And I set the parameter "Describe" with value "AutoCreate"
    And I choose the "PDF" from the "ReportType"
    And I wait for "2000" millsecond
    And I choose the "test_app" from the "App" in config
    And I choose the "<period>" from the "Period"
    And I wait for "1000" millsecond
    And I choose the "<month>" from the "Month"
    And I wait for "1000" millsecond
    And I choose the "<day>" from the "Day"
    And I set the parameter "Hour" with value "<hour>"
    And I set the parameter "Minute" with value "<minute>"
    And I click the "NextButton" button under some element
    Then I wait for "ChartListButton" will be visible
    When I choose the "报表测试" from the "ChartList"
    And I click the "ChartListButton" button
    Then I will see the element "LastTrendTitle" contains "报表测试"
    When I click the "Complete" button under some element
    And I wait for "ResultMessage" will be visible
    And I will see the element "ResultMessage" contains "新建成功"
    And I click the "ReturnButton" button
    And I will see the "report.ListPage" page
    And I wait for "Loading" will be invisible
    And I will see the data "{'column':'1','name':'test_report_<period>'}" values "{'column':'4','name':'<period><month><day> <hour>时<minute>分'}"

    Examples:
      |    period    |  month  |  day  |  hour   |   minute  |
      |    每年      |  3月    | 1日   |  16     |  10       |

  Scenario Outline: 提示_crontab
    When I set the parameter "Name" with value "<name>"
    And I set the parameter "Crontab" with value "<crontab>"
    And I click the "NextButton" button under some element
    And I wait for "TipText" will be visible
    And I will see the element "TipText" contains "<message_text>"

    Examples:
      |   name       |  crontab | message_text                                  |
      | test_report  |          | crontab模式下, 执行计划不能为零或空             |
      | test_report  |   test   | 非法crontab表达式, 请检查后重试                 |


  @reportSmoke
  Scenario: 执行计划_crontab
    When I set the parameter "Name" with value "test_report_crontab"
    And I set the parameter "Describe" with value "AutoCreate"
    And I choose the "PDF" from the "ReportType"
    And I wait for "2000" millsecond
    And I choose the "auto_package" from the "Tag" in config
    And I set the parameter "Crontab" with value "0 0/15 9 ? * MON-FRI"
    And I click the "Parse" button
    And I wait for "EnsureButton" will be visible
    And I will see the element "ParseResult" contains "09:00:00"
    And I will see the element "ParseResult" contains "09:15:00"
    And I will see the element "ParseResult" contains "09:30:00"
    And I will see the element "ParseResult" contains "09:45:00"
    And I click the "EnsureButton" button
    And I click the "NextButton" button under some element
    Then I wait for "ChartListButton" will be visible
    When I choose the "报表测试" from the "ChartList"
    And I click the "ChartListButton" button
    Then I will see the element "LastTrendTitle" contains "报表测试"
    When I click the "Complete" button under some element
    And I wait for "ResultMessage" will be visible
    And I will see the element "ResultMessage" contains "新建成功"
    And I click the "ReturnButton" button
    And I will see the "report.ListPage" page
    And I wait for "Loading" will be invisible
    And I will see the data "{'column':'1','name':'test_report_crontab'}" values "{'column':'4','name':'0 0/15 9 ? * MON-FRI'}"
    
  Scenario Outline: 检查tooltip
    When I set the parameter "Name" with value "test_report"
    And I set the parameter "Describe" with value "AutoCreate"
    And I choose the "test_app" from the "App" in config
    And I wait for "2000" millsecond
    And I choose the "PDF" from the "ReportType"
    And I will see the element "SubjectNote" contains "注: 可用变量: 报表名称：<%report_name%>，发送时间：<%report_time%>"
    And I set the parameter "Subject" with value " 报表名称：<%report_name%>，发送时间：<%report_time%>"
    And I move the mouse pointer to the "ExecutionTip"
    And I wait for "TipElement" will be visible
    And I will see the element "TipElement" contains "<tipText>"
    And I set the parameters "Hour" and "Minute" as "5" minutes later from now
    And I choose the "ekaterina.kiseleva@yottabyte.cn" from the "EmailInput"
    And I click the "NextButton" button under some element
    Then I wait for "Complete" will be visible

    Examples:
    |   tipText      |
    | 「定时」\n选择“每天”，报表内容为昨天数据\n选择“每周”，报表内容为上周数据\n选择“每月”，报表内容为上月数据\n选择“每年”，报表内容为上年数据\n「crontab」\n报表内容与趋势图保存的时间范围相关|
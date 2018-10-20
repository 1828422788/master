@report @all
Feature: 报表新建

  Background:
    Given I delete from "Report" where "{'name':['自动化测试','sxjautotest','测试Excel','乱码测试&$¥#']}"
    And open the "report.ListPage" page for uri "/reports/"

  Scenario Outline: 执行计划为定时
    Given I click the "CreateButton" button
    Then I will see the "report.CreatePage" page
    And I set the parameter "Name" with value "<name>"
    And I set the parameter "Describe" with value "<describe>"
    And I choose the "<runningUser>" from the "RunningUser"
    And I choose the "<reportGroup>" from the "ReportGroup"
    And I choose the "<reportType>" from the "ReportType"
    And I choose the "<email>" from the "Email"
    And I set the parameter "Subject" with value "<subject>"
    And I set the parameter "Hour" with value "<hour>"
    And I set the parameter "Minute" with value "<minute>"
    Then I click the "NextButton" button
    Then I choose the "<chartLists>" from the "ChartList"
    Then I click the "<layout>" button
    Then I click the "Save" button
    Then I will see the success message "<result>"

  @smoke
    Examples: 保存成功
      | name        | describe | runningUser | reportGroup    | reportType | email                     | subject                                    | hour | minute | chartLists | layout  | result |
      | sxjautotest | autotest | owner       | default_Report | PDF        | sun.xiaojing@yottabyte.cn | 报表名称：<%report_name%>, 发送时间：<%report_time%> | 11   | 30     | rose       | Layout1 | 保存成功   |
      | 自动化测试       | 测试word   | owner       | default_Report | WORD       | sun.xiaojing@yottabyte.cn | 报表名称：<%report_name%>, 发送时间：<%report_time%> | 11   | 30     | rose       | Layout1 | 保存成功   |
      | 测试Excel     | 测试excel  | owner       | default_Report | EXCEL      | sun.xiaojing@yottabyte.cn | 报表名称：<%report_name%>, 发送时间：<%report_time%> | 11   | 30     | rose       | Layout1 | 保存成功   |
      | 乱码测试&$¥#    | 测试url    | owner       | default_Report | URL        | sun.xiaojing@yottabyte.cn | 报表名称：<%report_name%>, 发送时间：<%report_time%> | 11   | 30     | rose       | Layout1 | 保存成功   |

    Examples: 保存失败
      | name  | describe | runningUser | reportGroup    | reportType | email                     | subject                                    | hour | minute | chartLists | layout  | result    |
      | 自动化测试 |          | owner       | default_Report | PDF        | sun.xiaojing@yottabyte.cn | 报表名称：<%report_name%>, 发送时间：<%report_time%> | 11   | 30     |            | Layout1 | 报表内容 不能为空 |

  Scenario Outline: 执行计划为crontab
    Given I click the "CreateButton" button
    Then I will see the "report.CreatePage" page
    And I set the parameter "Name" with value "<name>"
    And I set the parameter "Describe" with value "<describe>"
    And I choose the "<runningUser>" from the "RunningUser"
    And I choose the "<reportGroup>" from the "ReportGroup"
    And I choose the "<reportType>" from the "ReportType"
    And I choose the "<email>" from the "Email"
    And I set the parameter "Subject" with value "<subject>"
    Then I set the parameter "Crontab" with value "<crontab>"
    Then I click the "NextButton" button
    Then I choose the "<chartLists>" from the "ChartList"
    Then I click the "<layout>" button
    Then I click the "Save" button
    Then I will see the success message "<result>"

  @smoke
    Examples: 保存成功
      | name        | describe | runningUser | reportGroup    | reportType | email                     | subject                                    | crontab              | chartLists | layout  | result |
      | autotest    |          | owner       | default_Report | PDF        | sun.xiaojing@yottabyte.cn | 报表名称：<%report_name%>, 发送时间：<%report_time%> | 0 * * * * ?          | rose       | Layout1 | 保存成功   |
      | sxjautotest |          | owner       | default_Report | PDF        | sun.xiaojing@yottabyte.cn | 报表名称：<%report_name%>, 发送时间：<%report_time%> | 0 0-2 9 * * ?        | rose       | Layout1 | 保存成功   |
      | 自动化测试       |          | owner       | default_Report | PDF        | sun.xiaojing@yottabyte.cn | 报表名称：<%report_name%>, 发送时间：<%report_time%> | 0 0/15 9 ? * MON-FRI | rose       | Layout1 | 保存成功   |
      | 自动化测试       |          | owner       | default_Report | PDF        | sun.xiaojing@yottabyte.cn | 报表名称：<%report_name%>, 发送时间：<%report_time%> | 0 5 9 1/3 * ?        | rose       | Layout1 | 保存成功   |


    Examples: 保存失败
      | name          | describe | runningUser | reportGroup    | reportType | email | subject | crontab     | chartLists | layout  | result                        |
      | sunxjautotest |          | owner       | default_Report | PDF        |       | test    | 0 ? * * * ? | rose       | Layout1 | 无效参数, 参数：[crontab]\n错误码: FE_7 |


  Scenario Outline:
    Given I click the "CreateButton" button
    Then I will see the "report.CreatePage" page
    And I set the parameter "Name" with value "<name>"
    And I set the parameter "Describe" with value "<describe>"
    And I choose the "<runningUser>" from the "RunningUser"
    And I choose the "<reportGroup>" from the "ReportGroup"
    And I choose the "<reportType>" from the "ReportType"
    And I choose the "<email>" from the "Email"
    And I set the parameter "Subject" with value "<subject>"
    And I set the parameter "Hour" with value "<hour>"
    And I set the parameter "Minute" with value "<minute>"
    Then I click the "NextButton" button
    Then I will see the success message "<result>"

    Examples: 执行下一步失败
      | name | describe | runningUser | reportGroup    | reportType | email | subject | hour | minute | result    |
      |      |          |             |                |            |       |         |      |        | 名称 不能为空   |
      | test |          |             |                |            |       |         |      |        | 报表分组 不能为空 |
      | test |          |             | default_Report |            |       |         |      |        | 邮件主题 不能为空 |
      | test |          |             | default_Report |            |       | test    |      |        | 请输入小时     |
      | test |          |             | default_Report |            |       | test    | 11   |        | 请输入分钟     |

  Scenario Outline: 执行crontab失败
    Given I click the "CreateButton" button
    Then I will see the "report.CreatePage" page
    And I set the parameter "Name" with value "<name>"
    And I set the parameter "Describe" with value "<describe>"
    And I choose the "<runningUser>" from the "RunningUser"
    And I choose the "<reportGroup>" from the "ReportGroup"
    And I choose the "<reportType>" from the "ReportType"
    And I choose the "<email>" from the "Email"
    And I set the parameter "Subject" with value "<subject>"
    Then I set the parameter "Crontab" with value "<crontab>"
    Then I click the "NextButton" button
    Then I will see the success message "<result>"

    Examples:
      | name          | describe | runningUser | reportGroup    | reportType | email | subject | crontab | result                 |
      | sunxjautotest |          | owner       | default_Report | PDF        |       | test    |         | crontab模式下, 执行计划不能为零或空 |



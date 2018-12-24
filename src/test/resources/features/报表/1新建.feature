@report @all
Feature: 报表新建（RZY-116）

  Background:
    Given open the "report.ListPage" page for uri "/reports/"

  @smoke @reportSmoke
  Scenario Outline: 曲线图类型报表，每日11：10执行
    Given I click the "CreateButton" button
    Then I will see the "report.CreatePage" page
    And I set the parameter "Name" with value "<name>"
    And I set the parameter "Describe" with value "<describe>"
    And I choose the "<runningUser>" from the "RunningUser"
    And I choose the "<reportGroup>" from the "ReportGroup"
    And I choose the "<reportType>" from the "ReportType"
    And I set the parameter "EmailInput" with value "<email>"
    And I click the "Email" button
    And I display the element "Scrollbar"
    And I set the parameter "Subject" with value "<subject>"
    And I set the parameter "Hour" with value "<hour>"
    And I set the parameter "Minute" with value "<minute>"
    And I click the "NextButton" button
    And I choose the "<chartLists>" from the "ChartList"
    And I click the "Arrow" button
    And I click the "EditButton" button
    And I click the "ParameterSetting" button
    And I will see the "trend.CreatePage" page
    And I click the "Left" button
    And I click the "Yaxis" button
    And I set the parameter "Unit" with value "个"
    And I set the parameter "Min" with value "500"
    And I set the parameter "Max" with value "7000"
    And I click the "Example" button
    And I click the "FirstPosition" button
    And I will see the "report.CreatePage" page
    And I display the element "SettingContent"
    And I click the "SaveTrend" button
    And I click the "<layout>" button
    And I wait for "TopoTitle" will be visible
    And I click the "Save" button
    Then I will see the success message "保存成功"

    Examples: 保存成功
      | name          | describe                                                                         | runningUser | reportGroup    | reportType | email                     | subject                       | hour | minute | chartLists  | layout  |
      | 曲线图类型报表(word) | x轴:appname，标签2，排序默认，y轴:count()，单位个，开启平滑，开启连接空数据，范围500-7000，分组:logotype，图例left，紫色 | owner       | default_Report | WORD       | wang.yueming@yottabyte.cn | 报表名称：<%report_name%>, 第一种布局方式 | 11   | 10     | 曲线图AutoTest | Layout1 |

  @smoke @reportSmoke
  Scenario Outline: 面积图+散点图报表，11：11执行
    Given I click the "CreateButton" button
    Then I will see the "report.CreatePage" page
    And I set the parameter "Name" with value "<name>"
    And I set the parameter "Describe" with value "<describe>"
    And I choose the "<runningUser>" from the "RunningUser"
    And I choose the "<reportGroup>" from the "ReportGroup"
    And I choose the "<reportType>" from the "ReportType"
    And I set the parameter "EmailInput" with value "<email>"
    And I click the "Email" button
    And I display the element "Scrollbar"
    And I set the parameter "Subject" with value "<subject>"
    And I set the parameter "Hour" with value "<hour>"
    And I set the parameter "Minute" with value "<minute>"
    And I click the "NextButton" button
    And I choose the "面积图AutoTest" from the "ChartList"
    And I click the "Arrow" button
    And I click the "EditButton" button
    And I click the "ParameterSetting" button
    And I will see the "trend.CreatePage" page
    And I click the "Left" button
    And I click the "Yaxis" button
    And I set the parameter "Unit" with value "个"
    And I click the "Smooth" button
    And I set the parameter "Min" with value ""
    And I set the parameter "Max" with value "5000"
    And I click the "Example" button
    And I click the "ThirdPosition" button
    And I will see the "report.CreatePage" page
    And I display the element "SettingContent"
    And I click the "SaveTrend" button
    And I wait for "1000" millsecond
    And I choose the "散点图AutoTest" from the "ChartList"
    And I wait for "1000" millsecond
    And I click the "Arrow" button
    And I click the "EditButton" button
    And I click the "ParameterSetting" button
    And I will see the "trend.CreatePage" page
    And I click the "AscendingOrder2" button
    And I click the "Yaxis" button
    And I set the parameter "Min" with value "0"
    And I set the parameter "Max" with value ""
    And I will see the "report.CreatePage" page
    And I display the element "SettingContent"
    And I click the "SaveTrend" button
    And I click the "<layout>" button
    And I wait for "TopoTitle" will be visible
    And I click the "Save" button
    Then I will see the success message "保存成功"

  @smoke @reportSmoke
    Examples: 保存成功
      | name          | describe | runningUser | reportGroup    | reportType | email                     | subject                       | hour | minute | layout  |
      | 面积图散点图报表(PDF) |          | owner       | default_Report | PDF        | wang.yueming@yottabyte.cn | 报表名称：<%report_name%>, 第二种布局方式 | 11   | 11     | Layout2 |

  @smoke @reportSmoke
  Scenario Outline: 柱状图+饼状图+玫瑰图报表，11：12执行
    Given I click the "CreateButton" button
    Then I will see the "report.CreatePage" page
    And I set the parameter "Name" with value "<name>"
    And I set the parameter "Describe" with value "<describe>"
    And I choose the "<runningUser>" from the "RunningUser"
    And I choose the "<reportGroup>" from the "ReportGroup"
    And I choose the "<reportType>" from the "ReportType"
    And I set the parameter "EmailInput" with value "<email>"
    And I click the "Email" button
    And I display the element "Scrollbar"
    And I set the parameter "Subject" with value "<subject>"
    And I set the parameter "Hour" with value "<hour>"
    And I set the parameter "Minute" with value "<minute>"
    And I click the "NextButton" button
    And I choose the "柱状图AutoTest" from the "ChartList"
    And I click the "Arrow" button
    And I click the "EditButton" button
    And I click the "ParameterSetting" button
    And I will see the "trend.CreatePage" page
    And I click the "Yaxis" button
    And I set the parameter "Min" with value ""
    And I set the parameter "Max" with value ""
    And I click the "Example" button
    And I click the "SecondPosition" button
    And I will see the "report.CreatePage" page
    And I display the element "SettingContent"
    And I click the "SaveTrend" button
    And I wait for "1000" millsecond
    And I choose the "饼状图AutoTest" from the "ChartList"
    And I wait for "1000" millsecond
    And I choose the "玫瑰图AutoTest" from the "ChartList"
    And I click the "<layout>" button
    And I wait for "TopoTitle" will be visible
    And I click the "Save" button
    Then I will see the success message "保存成功"

  @smoke @reportSmoke
    Examples: 保存成功
      | name            | describe | runningUser | reportGroup    | reportType | email                     | subject                       | hour | minute | layout  |
      | 柱状饼状玫瑰图报表(PDF)3 |          | owner       | default_Report | PDF        | wang.yueming@yottabyte.cn | 报表名称：<%report_name%>, 第3种布局方式 | 11   | 12     | Layout3 |
      | 柱状饼状玫瑰图报表(PDF)5 |          | owner       | default_Report | PDF        | wang.yueming@yottabyte.cn | 报表名称：<%report_name%>, 第5种布局方式 | 11   | 12     | Layout5 |
      | 柱状饼状玫瑰图报表(PDF)6 |          | owner       | default_Report | PDF        | wang.yueming@yottabyte.cn | 报表名称：<%report_name%>, 第6种布局方式 | 11   | 12     | Layout6 |

  @smoke @reportSmoke
  Scenario Outline: 条形图+和弦图+桑基图+力图报表，11：12执行
    Given I click the "CreateButton" button
    Then I will see the "report.CreatePage" page
    And I set the parameter "Name" with value "<name>"
    And I set the parameter "Describe" with value "<describe>"
    And I choose the "<runningUser>" from the "RunningUser"
    And I choose the "<reportGroup>" from the "ReportGroup"
    And I choose the "<reportType>" from the "ReportType"
    And I set the parameter "EmailInput" with value "<email>"
    And I click the "Email" button
    And I display the element "Scrollbar"
    And I set the parameter "Subject" with value "<subject>"
    And I set the parameter "Hour" with value "<hour>"
    And I set the parameter "Minute" with value "<minute>"
    And I click the "NextButton" button
    And I choose the "条形图AutoTest" from the "ChartList"
    And I wait for "1000" millsecond
    And I choose the "和弦图AutoTest" from the "ChartList"
    And I wait for "1000" millsecond
    And I choose the "桑基图AutoTest" from the "ChartList"
    And I wait for "1000" millsecond
    And I choose the "力图AutoTest" from the "ChartList"
    And I click the "<layout>" button
    And I wait for "TopoTitle" will be visible
    And I click the "Save" button
    Then I will see the success message "保存成功"

  @smoke @reportSmoke
    Examples: 保存成功
      | name             | describe | runningUser | reportGroup    | reportType | email                     | subject                       | hour | minute | layout  |
      | 条形和弦桑基力图报表(PDF)4 |          | owner       | default_Report | PDF        | wang.yueming@yottabyte.cn | 报表名称：<%report_name%>, 第4种布局方式 | 11   | 12     | Layout4 |
      | 条形和弦桑基力图报表(PDF)7 |          | owner       | default_Report | PDF        | wang.yueming@yottabyte.cn | 报表名称：<%report_name%>, 第4种布局方式 | 11   | 12     | Layout7 |
      | 条形和弦桑基力图报表(URL)  |          | owner       | default_Report | URL        | wang.yueming@yottabyte.cn | 报表名称：<%report_name%>, 第4种布局方式 | 11   | 12     | Layout4 |

  @smoke @reportSmoke
  Scenario Outline: 条形图+和弦图+桑基图+力图+区间图+多Y轴图报表，11：13执行
    Given I click the "CreateButton" button
    Then I will see the "report.CreatePage" page
    And I set the parameter "Name" with value "<name>"
    And I set the parameter "Describe" with value "<describe>"
    And I choose the "<runningUser>" from the "RunningUser"
    And I choose the "<reportGroup>" from the "ReportGroup"
    And I choose the "<reportType>" from the "ReportType"
    And I set the parameter "EmailInput" with value "<email>"
    And I click the "Email" button
    And I display the element "Scrollbar"
    And I set the parameter "Subject" with value "<subject>"
    And I set the parameter "Hour" with value "<hour>"
    And I set the parameter "Minute" with value "<minute>"
    And I click the "NextButton" button
    And I choose the "条形图AutoTest" from the "ChartList"
    And I wait for "1000" millsecond
    And I choose the "和弦图AutoTest" from the "ChartList"
    And I wait for "1000" millsecond
    And I choose the "桑基图AutoTest" from the "ChartList"
    And I wait for "1000" millsecond
    And I choose the "力图AutoTest" from the "ChartList"
    And I wait for "1000" millsecond
    And I choose the "区间图AutoTest" from the "ChartList"
    And I wait for "1000" millsecond
    And I choose the "多Y轴图AutoTest" from the "ChartList"
    And I click the "<layout>" button
    And I wait for "TopoTitle" will be visible
    And I click the "Save" button
    Then I will see the success message "保存成功"

  @smoke @reportSmoke
    Examples: 保存成功
      | name                   | describe | runningUser | reportGroup    | reportType | email                     | subject                       | hour | minute | layout  |
      | 条形和弦桑基区间多Y轴力图报表(PDF)   |          | owner       | default_Report | PDF        | wang.yueming@yottabyte.cn | 报表名称：<%report_name%>, 第8种布局方式 | 11   | 13     | Layout8 |
      | 条形和弦桑基区间多Y轴力图报表(excel) |          | owner       | default_Report | EXCEL      | wang.yueming@yottabyte.cn | 报表名称：<%report_name%>, 第8种布局方式 | 11   | 13     | Layout8 |

  Scenario Outline: 执行计划为定时（保存失败）
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
    And I click the "NextButton" button
    And I choose the "<chartLists>" from the "ChartList"
    And I click the "<layout>" button
    And I click the "Save" button
    Then I will see the success message "<result>"

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
    And I set the parameter "Crontab" with value "<crontab>"
    And I click the "NextButton" button
    And I choose the "<chartLists>" from the "ChartList"
    And I click the "<layout>" button
    And I wait for "TopoTitle" will be visible
    And I click the "Save" button
    Then I will see the success message "<result>"

  @smoke @reportSmoke
    Examples: 保存成功
      | name      | describe | runningUser | reportGroup    | reportType | email                     | subject                                    | crontab              | chartLists | layout  | result |
      | autotest  |          | owner       | default_Report | PDF        | sun.xiaojing@yottabyte.cn | 报表名称：<%report_name%>, 发送时间：<%report_time%> | 0 * * * * ?          | AutoTest1  | Layout1 | 保存成功   |
      | autotest1 |          | owner       | default_Report | PDF        | sun.xiaojing@yottabyte.cn | 报表名称：<%report_name%>, 发送时间：<%report_time%> | 0 0-2 9 * * ?        | AutoTest1  | Layout1 | 保存成功   |
      | autotest2 |          | owner       | default_Report | PDF        | sun.xiaojing@yottabyte.cn | 报表名称：<%report_name%>, 发送时间：<%report_time%> | 0 0/15 9 ? * MON-FRI | AutoTest1  | Layout1 | 保存成功   |
      | autotest3 |          | owner       | default_Report | PDF        | sun.xiaojing@yottabyte.cn | 报表名称：<%report_name%>, 发送时间：<%report_time%> | 0 5 9 1/3 * ?        | AutoTest1  | Layout1 | 保存成功   |


    Examples: 保存失败
      | name          | describe | runningUser | reportGroup    | reportType | email | subject | crontab     | chartLists | layout  | result                        |
      | sunxjautotest |          | owner       | default_Report | PDF        |       | test    | 0 ? * * * ? | AutoTest1  | Layout1 | 无效参数, 参数：[crontab]\n错误码: FE_7 |


  Scenario Outline: 执行下一步失败
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

    Examples:
      | name | describe | runningUser | reportGroup    | reportType | email | subject | hour | minute | result    |
      |      |          |             |                |            |       |         |      |        | 名称 不能为空   |
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



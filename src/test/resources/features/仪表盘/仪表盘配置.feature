@dashboard @dashboardSmoke
Feature: 仪表盘配置

  Scenario Outline: 添加下拉菜单类型的过滤项（RZY-1869）
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I click the detail which name is "FirstAutoTest"
    Then I will see the "dashboard.DetailPage" page
    When I click the "AddEventButton" button
    And I choose the "<eventList>" from the "EventList"
    And I set the parameter "FilterTitle" with value "<title>"
    And I set the parameter "FilterToken" with value "<token>"
    And I set the parameter "FilterField" with value "<field>"
    And I choose the "<inputType>" from the "InputType"
    And I click the "Radio" button
    And I set the parameter "ChoiceValue" with value "json"
    And I click the "AddChoiceValueButton" button
    And I set the parameter "ChoiceValue" with value "<choiceValue>"
    And I click the "AddChoiceValueButton" button
    And I set the parameter "ChoiceValue" with value "http"
    And I click the "AddChoiceValueButton" button
    And I choose the "<choiceValue>" from the "DefaultDropdownList"
    Then I click the "EnsureCreateFilter" button

    Examples:
      | eventList | title  | token  | field   | inputType | choiceValue |
      | 添加过滤项     | filter | filter | appname | 下拉菜单      | java        |

  Scenario Outline: RZY-1668、1669添加输入项
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I click the detail which name is "FirstAutoTest"
    Then I will see the "dashboard.DetailPage" page
    When I click the "AddEventButton" button
    And I choose the "添加输入项" from the "EventList"
    And I set the parameter "FilterTitle" with value "<filter>"
    And I set the parameter "FilterToken" with value "<filter>"
    And I set the parameter "FilterDefaultValue" with value "<defaultValue>"
    Then I click the "EnsureCreateInput" button

    Examples:
      | filter           | defaultValue |
      | input            | appname      |
      | double_quotation | aa           |

  Scenario Outline: 创建仪表盘所用趋势图
    Given open the "trend.ListPage" page for uri "/trend/"
    And I click the "Create" button
    Then I will see the "trend.CreatePage" page
    When I set the parameter "NameInput" with value "<name>"
    And I click the "NextButton" button
    And I wait for "SearchInput" will be visible
    And I set the parameter "SearchInput" with value "<spl>"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for "Header" will be visible
    And I click the "NextButton" button
    And I wait for "Header" will be visible
    And I click the "NextButton" button
    And I click the "NextButton" button
    Then I will see the element "SuccessCreate" name is "新建成功！"

    Examples:
      | name         | spl                                                                                       |
      | 仪表盘所用趋势图     | *\|stats count() by 'appname'                                                             |
      | 仪表盘1669所用趋势图 | (appname:\"aa\") \|bucket timestamp span=6h as ts \|stats count(\'tag\') as \'tag\' by ts |

  Scenario: 验证RZY-1668:单引号包裹
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I click the detail which name is "FirstAutoTest"
    Then I will see the "dashboard.DetailPage" page
    When I click the "AddEventButton" button
    And I choose the "添加图表" from the "EventList"
    And I set the parameter "TrendName" with value "仪表盘"
    And I click the "DashboardTrend" button
    And I click the "EnsureAddTrend" button
    And I wait for "ChartSetting" will be visible
    And I set value with element "TableList"
    And I click the "ChartSetting" button
    And I choose the "通用配置" from the "Configs"
    And I set the parameter "Spl" with value "* | stats count() by ${input|s}"
    And I click the "SettingEnsure" button
    Then I compare with list "TableList"
    And I click the "DeleteChart" button
    And I click the "EnsureDeleteChart" button

  Scenario: 验证RZY-1669:双引号包裹
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I click the detail which name is "FirstAutoTest"
    Then I will see the "dashboard.DetailPage" page
    When I click the "AddEventButton" button
    And I choose the "添加图表" from the "EventList"
    And I set the parameter "TrendName" with value "仪表盘"
    And I click the "DashboardTrend1669" button
    And I click the "EnsureAddTrend" button
    And I wait for "ChartSetting" will be visible
    And I set value with element "TableList"
    And I click the "ChartSetting" button
    And I choose the "通用配置" from the "Configs"
    And I set the parameter "Spl" with value ""
    And I set the parameter "Spl" with value "(appname:${double_quotation|d})  |bucket timestamp span=6h as ts |stats count('tag') as 'tag' by ts"
    And I click the "SettingEnsure" button
    Then I compare with list "TableList"

#  @first
#  Scenario Outline: 配置邮箱
#    Given open the "system.CustomConfigs" page for uri "/system/custom/configs/"
#    When I set the parameter "SMTPPort" with value "<port>"
#    And I set the parameter "SMTPAddress" with value "<address>"
#    And I set the parameter "SendEmail" with value "<sendEmail>"
#    And I set the parameter "EmailPassword" with value "<password>"
#    And I let element "EmailPassword" lose focus
#
#    Examples:
#      | port | address          | sendEmail           | password |
#      | 465  | smtp.vip.163.com | dfuture@vip.163.com | wym0601  |
#
#  @first
#  Scenario: RZY-235:新建报表
#    Given open the "dashboard.ListPage" page for uri "/dashboard/"
#    And I click the detail which name is "UI自动化创建"
#    Then I will see the "dashboard.DetailPage" page
#    And I click the "SaveAsReportButton" button
#    And switch to window "报表"
#    Then I will see the "report.CreatePage" page
#    And I set the parameter "Name" with value "仪表盘创建报表"
#    And I set the parameter "Describe" with value "AutoTest"
#    And I choose the "default_Report" from the "ReportGroup"
#    And I set the parameter "EmailInput" with value "wang.yueming@yottabyte.cn"
#    And I click the "Email" button
#    And I hide the element "Scrollbar"
#    And I set the parameter "Subject" with value "<%report_name%>"
#    And I set the parameter "Hour" with value "17"
#    And I set the parameter "Minute" with value "03"
#    And I click the "NextButton" button
#    And I click the "Save" button
#    Then I will see the success message "保存成功"

#  Scenario: RZY-1278:title字段
#    Given open the "dashboard.ListPage" page for uri "/dashboard/"
#    And I click the detail which name is "UI自动化创建"
#    Then I will see the "dashboard.DetailPage" page
#    And I click the "Type" button
#    And I click the "Single" button
#    And I click the "Setting" button
#    And I choose the "ts" from the "FieldValue"
#    And I click the "Generate" button
#    And I display the element "Content"
#    And I click the "Config" button
#    And I click the "Edit" button
#    And I set the parameter "{"title": "趋势图1","description": "AutoCreate","row": 1,"column": 1,"sizex": 12,"sizey": 4,"search": {"query": "(appname:${double_quotation|d})  |bucket timestamp span=6h as ts |stats count('tag') as 'tag' by ts","startTime": "now/d","endTime": "now"},"chart": {"chartType": "table"}}" to json editor
#    And I click the "Check" button
#    And I click the "EnsureEdit" button
#    Then I will see the element "TrendTitle" name is "趋势图1"
#
#  Scenario: RZY-1279:description字段
#    Given open the "dashboard.ListPage" page for uri "/dashboard/"
#    And I click the detail which name is "UI自动化创建"
#    Then I will see the "dashboard.DetailPage" page
#    And I click the "Config" button
#    And I click the "Edit" button
#    And I alter the element "JsonEditor" class to " ace_editor ace-github ace_focus"
#    And I click the "Input" button under some element
#    And I set the parameter "{"title": "趋势图1","description": "测试描述","row": 1,"column": 1,"sizex": 12,"sizey": 4,"search": {"query": "(appname:${double_quotation|d})  |bucket timestamp span=6h as ts |stats count('tag') as 'tag' by ts","startTime": "now/d","endTime": "now"},"chart": {"chartType": "table"}}" to json editor
#    And I click the "Check" button
#    And I click the "EnsureEdit" button
#    And I click the "TotalPage" button
#    And I click the "Remark" button
#    Then I will see the element "RemarkInfo" name is "测试描述"
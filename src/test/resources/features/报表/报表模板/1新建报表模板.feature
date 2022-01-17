@report @reportTemplate @templateCreate
Feature: 报表模板_1新建

  Background:
    Given open the "report.ListPage" page for uri "/reports/"
    And I wait for "Loading" will be invisible
    And I click the "TemplateManager" button under some element
    And I wait for "Loading" will be invisible
    Then I will see the "report.CreateTemplatePage" page
    And I click the "NewTemplate" button
    And I wait for "TemplateName" will be visible

  Scenario: 名称为空格
    When I set the parameter "TemplateName" with value " "
    And I click the "Next" button
    And I wait for "TipText" will be visible
    Then I will see the element "TipText" contains "名称不能为空"

  Scenario Outline: 检查提示
    When I set the parameter "TemplateName" with value "<name>"
    And I click the "Next" button
    And I wait for "TipText" will be visible
    Then I will see the element "TipText" contains "<tip>"

  Examples:
    | name  | tip           |
    |       | 名称不能为空  |
    | name  | 请上传模板文件|

  Scenario: 模板为空
    When I set the parameter "TemplateName" with value "empty_template"
    And I upload a file with name "/src/test/resources/testdata/reportTemplate/empty_template.docx"
    And I wait for "UploadingProgress" will be invisible
    And I wait for "TipText" will be visible
    Then I will see the element "TipText" contains "未检测到趋势图相关变量，请检查模板后重新上传"

  Scenario: 未添加趋势图
    When I set the parameter "TemplateName" with value "template"
    And I upload a file with name "/src/test/resources/testdata/reportTemplate/template.docx"
    And I wait for "UploadingProgress" will be invisible
    And I will see the "TipText" doesn't exist
    And I click the "Next" button
    Then I wait for "TrendListButton" will be visible
    Then I will see the text "请对照右侧模板预览添加趋势图，添加后根据数字序号，对应word报表中趋势图的展示位置。" exist in page
    When I click the "Finish" button
    Then I will see the text "请添加趋势图" exist in page
    And I will see the "ResultMessage" doesn't exist

  @reportSmoke
  Scenario: 添加趋势图
    When I set the parameter "TemplateName" with value "template"
    And I upload a file with name "/src/test/resources/testdata/reportTemplate/template.docx"
    And I wait for "UploadingProgress" will be invisible
    And I will see the "TipText" doesn't exist
    And I click the "Next" button
    Then I wait for "TrendListButton" will be visible
    When I choose the "报表测试" from the "TrendList"
    And I wait for "SelectedTrend" will be visible
    And I click the "Finish" button
    And I wait for "ResultMessage" will be visible
    And I will see the element "ResultMessage" contains "新建成功"
    And I click the "Return" button
    And I wait for "Loading" will be invisible
    And I wait for "2000" millsecond
    Then I will see the data "{'column':'0','name':'template'}" values "{'column':'2','name':'template.docx'}"
    And I will see the data "{'column':'0','name':'template'}" values "{'column':'3','name':'1'}"

  Scenario: 趋势图_检查数据集
    When I set the parameter "TemplateName" with value "template_chart"
    And I upload a file with name "/src/test/resources/testdata/reportTemplate/template.docx"
    And I wait for "UploadingProgress" will be invisible
    And I will see the "TipText" doesn't exist
    And I click the "Next" button
    Then I wait for "TrendListButton" will be visible

    When I choose the "报表测试_数据集" from the "TrendList"
    And I wait for "SelectedTrend" will be visible
    And I click the "SelectedTrend" button
    Then I will see the "report.CreatePage" page
    And I will see the element "TrendData" contains "(tag:sample04061424_chart) OR (tag:sample04061424_display)"
    And I click the "EditButton" button
    And I wait for "3000" millsecond
    And I will see the element "TrendDatasetField" contains "(tag:sample04061424_chart) OR (tag:sample04061424_display)"
    And I set the value "starttime="now/d" endtime="now/d+24h" * | stats count()" to the textarea "TrendSplField"
    Then I click the "EnsureButton" button

  Scenario: 修改趋势图
    When I set the parameter "TemplateName" with value "template_chart"
    And I upload a file with name "/src/test/resources/testdata/reportTemplate/template.docx"
    And I wait for "UploadingProgress" will be invisible
    And I will see the "TipText" doesn't exist
    And I click the "Next" button
    Then I wait for "TrendListButton" will be visible

    When I choose the "报表测试" from the "TrendList"
    And I wait for "SelectedTrend" will be visible
    And I click the "SelectedTrend" button
    Then I will see the "report.CreatePage" page
    And I click the "EditButton" button

    Then I set the parameter "TrendNameField" with value "LineChart"
    And I set the parameter "TrendDescribeField" with value "LineChart_Red"
    And I set the value "starttime="now/d" endtime="now/d+24h" tag:sample04061424_chart  | stats count() by apache.clientip,apache.method" to the textarea "TrendSplField"
    And I click the "TrendChartType" button
    And I click the "LineChart" button
    When I click the "ParameterSetting" button
    And I wait for "FieldValue" will be visible
    And I wait for "1000" millsecond
    And I set the parameter "FieldValue" with value "apache.clientip"
    And I click the "Yaxis" button
    And I wait for "1000" millsecond
    And I set the parameter "FieldValue" with value "count()"
    And I click the "Group" button
    And I set the parameter "GroupField" with value "apache.method" and press enter
    And I wait for "1000" millsecond
    And I click the "Exhibition" button
    And I click the "AddColor" button
    And I click the "Red" button
    And I wait for "1000" millsecond
    When I click the "ParameterSetting" button
    Then I click the "EnsureButton" button
    Then I will see the "report.CreateTemplatePage" page

    And I click the "Finish" button
    And I wait for "3000" millsecond
    And I wait for "ResultMessage" will be visible
    And I will see the element "ResultMessage" contains "新建成功"

  Scenario: 添加有表格的模板
    When I set the parameter "TemplateName" with value "table"
    And I upload a file with name "/src/test/resources/testdata/reportTemplate/table.docx"
    And I wait for "UploadingProgress" will be invisible
    And I will see the "TipText" doesn't exist
    And I click the "Next" button
    Then I wait for "TrendListButton" will be visible
    When I choose the "报表测试" from the "TrendList"
    And I wait for "SelectedTrend" will be visible
    And I click the "Finish" button
    Then I will see the text "请添加趋势图" exist in page
    When I choose the "报表测试" from the "TrendList"
    And I wait for "3000" millsecond
    And I click the "Finish" button
    And I wait for "ResultMessage" will be visible
    And I will see the element "ResultMessage" contains "新建成功"
    And I click the "Return" button
    And I wait for "Loading" will be invisible
    And I wait for "2000" millsecond
    Then I will see the data "{'column':'0','name':'table'}" values "{'column':'2','name':'table.docx'}"
    And I will see the data "{'column':'0','name':'table'}" values "{'column':'3','name':'2'}"

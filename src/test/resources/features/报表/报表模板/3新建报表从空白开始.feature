@report @reportTemplate @reportUsingTemplate_empty
Feature: 报表模板_3从空白开始

  Background:
    Given open the "report.ListPage" page for uri "/reports/"
    And I wait for "Loading" will be invisible

  Scenario:  检查提示
    And I click the "NewReportButton" button under some element
    Then I will see the "report.CreatePage" page
    And I wait for "2000" millsecond
    And I wait for element "SelectedUser" change text to username
    When I set the parameter "Name" with value "test"
    And I choose the "WORD" from the "ReportType"
    And I set the parameters "Hour" and "Minute" as "3" minutes later from now
    And I click the "UseTemplate" button
    And I click the "NextButton" button
    And I wait for "TipText" will be visible
    Then I will see the element "TipText" contains "请选择或上传模板文件"

  Scenario:  修改编辑方式
    And I click the "NewReportButton" button under some element
    Then I will see the "report.CreatePage" page
    And I wait for "2000" millsecond
    And I wait for element "SelectedUser" change text to username
    When I set the parameter "Name" with value "test"
    And I choose the "WORD" from the "ReportType"
    And I set the parameters "Hour" and "Minute" as "3" minutes later from now
    And I click the "UseTemplate" button
    And I click the "NextButton" button
    And I wait for "TipText" will be visible
    Then I will see the element "TipText" contains "请选择或上传模板文件"
    When I click the "RichTextEditing" button
    And I click the "NextButton" button
    Then I will see the "report.CreatePageWORD" page
    Then I wait for "ChartListButtonWord" will be visible
    And I wait for "TextArea" will be visible

  Scenario: 新报表模板
    And I click the "TemplateManager" button under some element
    And I wait for "Loading" will be invisible
    Then I will see the "report.CreateTemplatePage" page
    And I click the "NewTemplate" button
    And I wait for "TemplateName" will be visible
    When I set the parameter "TemplateName" with value "template2"
    And I upload a file with name "/src/test/resources/testdata/reportTemplate/template2.docx"
    And I wait for "UploadingProgress" will be invisible
    And I will see the "TipText" doesn't exist
    And I click the "Next" button
    Then I wait for "TrendListButton" will be visible
    When I choose the "报表测试" from the "TrendList"
    And I wait for "SelectedTrend" will be visible
    And I click the "Finish" button
    And I wait for "ResultMessage" will be visible
    And I will see the element "ResultMessage" contains "新建成功"


  Scenario: 新报表使用模板，选择模板
    And I click the "NewReportButton" button under some element
    Then I will see the "report.CreatePage" page
    And I wait for "2000" millsecond
    And I wait for element "SelectedUser" change text to username
    When I set the parameter "Name" with value "报表_选择模板"
    And I choose the "WORD" from the "ReportType"
    And I set the parameters "Hour" and "Minute" as "5" minutes later from now
    And I click the "UseTemplate" button
    And I click the "SelectTemplate" button
    And I set the parameter "SearchTemplate" with value "template2"
    Then I will see the "template_chart" doesn't exist
    When I wait for "2000" millsecond 
    And I "checked" the checkbox which name is "template2"
    And I click the "EnsureButton" button
    Then I will see the input element "TemplateFileName" value will be "template2.docx"
    When I click the "NextButton" button
    Then I will see the "TemplateList" doesn't exist
    And I will see the "report.CreateTemplatePage" page
    And I wait for "TrendListButton" will be visible
    And I will see the text "对照右侧模板预览中的趋势图变量序号，添加对应的趋势图。" exist in page
    And I will see the text "测试报表" is not existed in page
    When I choose the "报表测试" from the "TrendList"
    And I wait for "SelectedTrend" will be visible
    And I click the "Finish" button
    And I wait for "ResultMessage" will be visible
    Then I will see the element "ResultMessage" contains "新建成功"

  @reportSmoke
  Scenario: 新报表使用模板，上传模板
    And I click the "NewReportButton" button under some element
    Then I will see the "report.CreatePage" page
    And I wait for "2000" millsecond
    And I wait for element "SelectedUser" change text to username
    When I set the parameter "Name" with value "报表_上传模板"
    And I choose the "WORD" from the "ReportType"
    And I set the parameters "Hour" and "Minute" as "10" minutes later from now
    And I click the "UseTemplate" button
    And I click the "SelectTemplate" button
    And I click the "UploadTemplate" button
    And I upload a file with name "/src/test/resources/testdata/reportTemplate/template2.docx"
    And I wait for "UploadingProgress" will be invisible
    And I click the "EnsureButton" button
    Then I will see the input element "TemplateFileName" value will be "template2.docx"
    When I click the "NextButton" button
    Then I will see the "TemplateList" doesn't exist
    And I will see the "report.CreateTemplatePage" page
    And I wait for "TrendListButton" will be visible
    And I will see the text "对照右侧模板预览中的趋势图变量序号，添加对应的趋势图。" exist in page
    And I will see the text "测试报表" is not existed in page
    When I choose the "报表测试" from the "TrendList"
    And I wait for "SelectedTrend" will be visible
    And I click the "Finish" button
    And I wait for "ResultMessage" will be visible
    Then I will see the element "ResultMessage" contains "新建成功"

  Scenario: 修改趋势图
    When the data name is "{'column':'1','name':'报表_上传模板'}" then i click the "编辑" button
    Then I will see the "report.CreatePage" page
    And I wait for element "SelectedUser" change text to username
    And I set the parameters "Hour" and "Minute" as "3" minutes later from now
    Then I will see the input element "TemplateFileName" value will be "template2.docx"
    And I click the "NextButton" button under some element
    And I wait for "LastTrendTitle" will be visible
    Then I will see the element "LastTrendTitle" contains "报表测试"
    And I choose the "下载到本地预览" from the "Preview"
    And I wait for "SuccessMessage" will be visible
    And I will see the element "SuccessMessage" contains "正在生成测试报表，请稍后查看报表历史页"
    And I click the "ChosenTrendLast" button
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
    When I click the "FinishButton" button under some element
    And I wait for "ResultMessage" will be visible
    And I will see the element "ResultMessage" contains "更新成功"


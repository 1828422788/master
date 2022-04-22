@report @reportTemplate @deleteReportTemplate
Feature: 报表模板_2使用模板

  Background:
    Given open the "report.ListPage" page for uri "/reports/"
    And I wait for loading invisible

  Scenario: 缺少模板
    And I click the "NewReportUsingTemplate" button
    Then I will see the "report.CreatePage" page
    And I wait for "2000" millsecond
    And I wait for element "SelectedUser" change text to username
    When I set the parameter "Name" with value "test"
    And I wait for "2000" millsecond
    And I set the parameters "Hour" and "Minute" as "4" minutes later from now
    And I click the "NextButton" button
    Then I wait for "TemplatesList" will be visible
    When I click the "Complete" button
    And I wait for "ErrorMessage" will be visible
    Then I will see the error message "至少选择一个趋势图"

  @reportSmoke
  Scenario: 新建报表使用模板_添加有数据集的趋势图
    And I click the "NewReportUsingTemplate" button
    Then I will see the "report.CreatePage" page
    And I wait for "2000" millsecond
    And I wait for element "SelectedUser" change text to username
    When I set the parameter "Name" with value "使用模板_数据集"
    And I wait for "2000" millsecond
    And I set the parameters "Hour" and "Minute" as "3" minutes later from now
    And I click the "NextButton" button
    Then I wait for "TemplatesList" will be visible
    When I choose the "template" from the "Templates"
    Then I will see the element "LastTrendTitle" contains "报表测试"
    And I click the "FirstTrendDelete" button
    And I will see the "report.CreateTemplatePage" page
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

    When I click the "FinishButton" button
    And I wait for "ResultMessage" will be visible
    And I will see the element "ResultMessage" contains "新建成功"

  Scenario: 新建报表使用模板
    And I click the "NewReportUsingTemplate" button
    Then I will see the "report.CreatePage" page
    And I wait for "2000" millsecond
    And I wait for element "SelectedUser" change text to username
    When I set the parameter "Name" with value "使用模板_图表_红色"
    And I wait for "2000" millsecond
    And I set the parameters "Hour" and "Minute" as "4" minutes later from now
    And I click the "NextButton" button
    Then I wait for "TemplatesList" will be visible
    When I choose the "template_chart" from the "Templates"
    Then I will see the element "LastTrendTitle" contains "LineChart"
    When I click the "Complete" button
    And I wait for "ResultMessage" will be visible
    And I will see the element "ResultMessage" contains "新建成功"

  Scenario: 下载到本地预览
    When I set the parameter "SearchInput" with value "使用模板_图表_红色"
    And I wait for "2000" millsecond
    And the data name is "{'column':'1','name':'使用模板_图表_红色'}" then i click the "编辑" button
    Then I will see the "report.CreatePage" page
    And I wait for element "SelectedUser" change text to username
    And I click the "NextButton" button
    And I wait for "5000" millsecond
    And I choose the "下载到本地预览" from the "Preview"
    And I wait for "SuccessMessage" will be visible
    And I will see the element "SuccessMessage" contains "正在生成测试报表，请稍后查看报表历史页"
    When I click the "Complete" button
    And I wait for "ResultMessage" will be visible
    And I will see the element "ResultMessage" contains "更新成功"

  Scenario: 改报表名称
    When I set the parameter "SearchInput" with value "使用模板_图表_红色"
    And I wait for "2000" millsecond
    And the data name is "{'column':'1','name':'使用模板_图表_红色'}" then i click the "编辑" button
    Then I will see the "report.CreatePage" page
    And I wait for element "SelectedUser" change text to username
    When I set the parameter "Name" with value "使用模板_图表_绿色"
    And I click the "NextButton" button
    And I wait for "3000" millsecond
    When I click the "Complete" button
    And I wait for "ResultMessage" will be visible
    And I will see the element "ResultMessage" contains "更新成功"

  Scenario: 改变模板的内容
    When I click the "TemplateManager" button
    And I wait for loading invisible
    And I set the parameter "SearchInput" with value "template_chart"
    And I wait for "2000" millsecond
    And the data name is "{'column':'0','name':'template_chart'}" then i click the "编辑" button
    Then I will see the "report.CreateTemplatePage" page
    And I wait for loading invisible
    And I wait for "TemplateName" will be visible
    And I will see the input element "TemplateName" value will be "template_chart"
    And I will see the element "UploadedFile" contains "template.docx"
    When I click the "Next" button
    And I wait for "SelectedTrend" will be visible
    And I click the "SelectedTrend" button
    Then I will see the "report.CreatePage" page
    And I click the "EditButton" button
    And I set the parameter "TrendDescribeField" with value "LineChart_Green"
    When I click the "ParameterSetting" button
    And I click the "Exhibition" button
    And I click the "AddColor" button
    And I click the "Green" button
    And I wait for "1000" millsecond
    When I click the "ParameterSetting" button
    Then I click the "EnsureButton" button
    Then I will see the "report.CreateTemplatePage" page
    And I click the "Finish" button
    And I wait for "3000" millsecond
    And I wait for "ResultMessage" will be visible
    And I will see the element "ResultMessage" contains "更新成功"
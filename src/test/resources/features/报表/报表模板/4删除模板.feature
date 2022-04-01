@report @reportTemplate @deleteReportTemplate
Feature: 报表模板_4删除

  Background:
    Given open the "report.ListPage" page for uri "/reports/"
    And I wait for loading invisible

  Scenario: 新建模板
    And I click the "TemplateManager" button under some element
    And I wait for loading invisible
    Then I will see the "report.CreateTemplatePage" page
    And I click the "NewTemplate" button
    And I wait for "TemplateName" will be visible
    When I set the parameter "TemplateName" with value "test_template"
    And I upload a file with name "/src/test/resources/testdata/reportTemplate/template.docx"
    And I wait for "UploadingProgress" will be invisible
    And I will see the "TipText" doesn't exist
    And I click the "Next" button
    Then I wait for "TrendListButton" will be visible
    When I choose the "报表测试" from the "TrendList"
    And I wait for "SelectedTrend" will be visible
    And I click the "Finish" button
    And I wait for "ResultMessage" will be visible
    Then I will see the element "ResultMessage" contains "新建成功"

  Scenario: 删除模板，检查提示
    When I click the "TemplateManager" button under some element
    And I wait for loading invisible
    And I set the parameter "SearchInput" with value "test_template"
    And I wait for "2000" millsecond
    And the data name is "{'column':'0','name':'test_template'}" then i click the "删除" button
    Then I will see the message "该模板已关联以下0个报表，删除后无法恢复，是否继续删除操作？"
    And I click the "Cancel" button

  Scenario: 新建报表使用模板
    And I click the "newReportUsingTemplate" button under some element
    Then I will see the "report.CreatePage" page
    And I wait for "2000" millsecond
    And I wait for element "SelectedUser" change text to username
    When I set the parameter "Name" with value "报表_使用模板"
    And I wait for "2000" millsecond
    And I set the parameter "Crontab" with value "0 0/1 * * * ?"
    And I click the "NextButton" button under some element
    Then I wait for "TemplatesList" will be visible
    When I choose the "test_template" from the "Templates"
    Then I will see the element "LastTrendTitle" contains "报表测试"
    When I click the "Complete" button under some element
    And I wait for "ResultMessage" will be visible
    And I will see the element "ResultMessage" contains "新建成功"
    And I wait for "100000" millsecond

  Scenario: 检查生成报表成功
    When I set the parameter "SearchInput" with value "报表_使用模板"
    And I wait for loading invisible
    And I wait for "50000" millsecond
    And the data name is "{'column':'1','name':'报表_使用模板'}" then i click the "报表_使用模板" button
    Then I will see the element "FirstGeneratedReport" contains ".docx"

  Scenario: 删除模板
    When I click the "TemplateManager" button under some element
    And I wait for loading invisible
    And I set the parameter "SearchInput" with value "test_template"
    And I wait for "2000" millsecond
    And the data name is "{'column':'0','name':'test_template'}" then i click the "删除" button
    Then I will see the element "Message" contains "该模板已关联以下1个报表，删除后无法恢复，是否继续删除操作？"
    And I will see the element "Message" contains "报表_使用模板"
    When I click the "Ensure" button
    And I wait for "SuccessMessage" will be visible
    Then I will see the success message "删除成功"
    And I wait for "30000" millsecond

  Scenario: 检查tooltip
    When I set the parameter "SearchInput" with value "报表_使用模板"
    And I wait for loading invisible
    Then I wait for "Tooltip" will be visible
    When I move the mouse pointer to the "Tooltip"
    And I wait for "TooltipElement" will be visible
    Then I will see the element "TooltipElement" contains "缺少模板"
    And I wait for "30000" millsecond

  Scenario: 检查生成报表失败
    When I set the parameter "SearchInput" with value "报表_使用模板"
    And I wait for loading invisible
    And the data name is "{'column':'1','name':'报表_使用模板'}" then i click the "报表_使用模板" button
    Then I will see the element "LastGeneratedReport" contains "_错误信息"
    When I click the "Check" button
    Then I wait for "Message" will be visible
    And I will see the element "Message" contains "cannot get report template, template id:"

  Scenario: 添加模板
    When I set the parameter "SearchInput" with value "报表_使用模板"
    And I wait for loading invisible
    And the data name is "{'column':'1','name':'报表_使用模板'}" then i click the "编辑" button
    Then I will see the "report.CreatePage" page
    And I wait for "2000" millsecond
    And I wait for element "SelectedUser" change text to username
    And I wait for "2000" millsecond
    And I click the "FixedTime" button
    And I set the parameters "Hour" and "Minute" as "2" minutes later from now
    And I click the "NextButton" button under some element
    Then I wait for "TemplatesList" will be visible   
    When I click the "Complete" button
    Then I will see the text "请添加趋势图" exist in page
    When I choose the "template" from the "Templates"
    Then I will see the element "LastTrendTitle" contains "报表测试"
    When I click the "Complete" button under some element
    And I wait for "ResultMessage" will be visible
    And I will see the element "ResultMessage" contains "更新成功"
    And I wait for "120000" millsecond

  Scenario: 检查生成报表成功2
    When I set the parameter "SearchInput" with value "报表_使用模板"
    And I wait for loading invisible
    And I wait for "60000" millsecond
    And the data name is "{'column':'1','name':'报表_使用模板'}" then i click the "报表_使用模板" button
    Then I will see the element "LastGeneratedReport" contains ".docx"    

@app @appSmoke
Feature: 应用报表（RZY-2127）

  Scenario: 新建趋势图
    Given open the "trend.ListPage" page for uri "/trend/"
    And I click the "Create" button
    Then I will see the "trend.CreatePage" page
    And I set the parameter "NameInput" with value "AutoTestForReport"
    And I choose the "ReportApp" from the "AppDropdown"
    And I click the "NextButton" button
    And I set the parameter "SearchInput" with value "tag:*display | stats count() by apache.clientip,apache.resp_len | limit 10 "
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for "Header" will be visible
    And I click the "NextButton" button
    And I click the "NextButton" button
    Then I wait for "SuccessCreate" will be visible

  Scenario: 新建报表
    Given open the "app.ListPage" page for uri "/app/list/"
    When the data name is "ReportApp" then i click the "打开" button
    Then I will see the "app.AppPage" page
    And I will see the element "Title" name is "ReportApp"
    Then I will see the "report.ListPage" page
    When I click the "Create" button
    And I will see the "app.AppPage" page
    And I will see the element "OldTitle" name is "ReportApp"
    Then I will see the "report.CreatePage" page
    And I set the parameter "Name" with value "AutoAppReport"
    And I set the parameter "Subject" with value "AutoTest"
    And I set the parameter "Hour" with value "1"
    And I set the parameter "Minute" with value "1"
    And I click the "NextButton" button
    Then I will see the "app.AppPage" page
    And I will see the element "OldTitle" name is "ReportApp"
    Then I will see the "report.CreatePage" page
    And I choose the "AutoTestForReport" from the "ChartList"
    And I wait for "TopoTitle" will be visible
    And I click the "Save" button
    Then I will see the success message "保存成功"
    And I will see the "app.AppPage" page
    Then I will see the element "OldTitle" name is "ReportApp"

  Scenario: 禁用报表
    Given open the "app.ListPage" page for uri "/app/list/"
    When the data name is "ReportApp" then i click the "打开" button
    Then I will see the "app.AppPage" page
    And I will see the element "Title" name is "ReportApp"
    Then I will see the "report.ListPage" page
    When the data name is "{'column':'1','name':'AutoAppReport'}" then I "close" the switch
    Then I will see the success message "禁用成功"
    And I will see the "app.AppPage" page
    Then I will see the element "Title" name is "ReportApp"

  Scenario: 编辑报表
    Given open the "app.ListPage" page for uri "/app/list/"
    When the data name is "ReportApp" then i click the "打开" button
    Then I will see the "app.AppPage" page
    And I will see the element "Title" name is "ReportApp"
    Then I will see the "report.ListPage" page
    When the data name is "{'column':'1','name':'AutoAppReport'}" then i click the "编辑" button
    And I will see the "app.AppPage" page
    And I will see the element "OldTitle" name is "ReportApp"
    Then I will see the "report.CreatePage" page
    And I set the parameter "Name" with value "AutoAppForReport"
    And I click the "NextButton" button
    And I click the "Save" button
    Then I will see the success message "保存成功"

  Scenario Outline: 报表标签
    Given open the "app.ListPage" page for uri "/app/list/"
    When the data name is "ReportApp" then i click the "打开" button
    Then I will see the "app.AppPage" page
    And I will see the element "Title" name is "ReportApp"
    Then I will see the "report.ListPage" page
    When the data name is "{'column':'1','name':'<name>'}" then i click the "标签" button
    And I set the parameter "Tag" with value "测试标签"
    And I choose the "测试标签" from the "TagDropdown"
    And I click the "Ensure" button
    And I wait for "SuccessMessage" will be visible

    Examples:
      | name             |
      | AutoAppForReport |

  Scenario: 根据标签查找
    Given open the "app.ListPage" page for uri "/app/list/"
    When the data name is "ReportApp" then i click the "打开" button
    Then I will see the "app.AppPage" page
    And I will see the element "Title" name is "ReportApp"
    Then I will see the "report.ListPage" page
    And I choose the "测试标签" from the "ResourceDropdown"
    And I wait for loading invisible
    Then I will see the search result "{'column':'1','name':'AutoAppForReport'}"
    And I will see the "app.AppPage" page
    Then I will see the element "Title" name is "ReportApp"

  Scenario: 已生成报表
    Given open the "app.ListPage" page for uri "/app/list/"
    When the data name is "ReportApp" then i click the "打开" button
    Then I will see the "app.AppPage" page
    And I will see the element "Title" name is "ReportApp"
    Then I will see the "report.ListPage" page
    And I click the "Report" button
    Then I will see the "app.AppPage" page
    And I will see the element "OldTitle" name is "ReportApp"
    Then I will see the "report.ListPage" page
    And I click the "ReturnList" button
    Then I will see the "app.AppPage" page
    And I will see the element "Title" name is "ReportApp"

  Scenario: 删除报表及趋势图
    Given open the "trend.ListPage" page for uri "/trend/"
    When the data name is "AutoTestForReport" then i click the "删除" button
    And I click the "Ensure" button
    Then I will see the success message "删除成功"
    Given open the "report.ListPage" page for uri "/reports/"
    When the data name is "{'column':'1','name':'AutoAppForReport'}" then i click the "删除" button
    And I click the "Ensure" button
    Then I will see the message "删除成功"

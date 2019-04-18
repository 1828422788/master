@app @appSmoke
Feature: 应用趋势图

  Background:
    Given open the "app.ListPage" page for uri "/app/list/"
    When the data name is "AutoTestAppWithAllResources" then i click the "打开" button
    Then I will see the "app.AppPage" page
    And I click the "Trend" button
    Then I will see the "trend.ListPage" page

  Scenario Outline: 新建趋势图并存为报表
    When I click the "CreateButton" button
    And I will see the "app.AppPage" page
    And I will see the element "Title" name is "AutoTest...pWithAllResources"
    Then I will see the "trend.CreatePage" page
    When I set the parameter "NameInput" with value "<name>"
    And I choose the "AutoTestRoleWithAllResource" from the "GroupDropdown"
    And I click the "NextButton" button
    And I set the parameter "SearchInput" with value "<spl>"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for "Header" will be visible
    And I click the "NextButton" button
    And I click the "ChartType" button
    And I click the "<chart>" button
    And I click the "<chartType>" button
    And I display the element "ChartTypePopover"
    And I wait for loading invisible
    And I click the "Save" button
    And I click the "Report" button
    And switch to another window
    And I will see the "app.AppPage" page
    And I will see the element "Title" name is "AutoTest...pWithAllResources"
    And I will see the "report.CreatePage" page
    And I set the parameter "Name" with value "<reportName>"
    And I choose the "AutoTestRoleWithAllResource" from the "ReportGroup"
    And I set the parameter "EmailInput" with value "wang.yueming@yottabyte.cn"
    And I click the "Email" button
    And I display the element "Scrollbar"
    And I set the parameter "Subject" with value "报表名称：<%report_name%>"
    And I set the parameter "Hour" with value "<hour>"
    And I set the parameter "Minute" with value "<minute>"
    And I click the "NextButton" button
    And I wait for "TrendTitle" will be visible
    And I will see the element "TrendTitle" name is "<name>"
    And I click the "Save" button

    Examples:
      | name    | spl                                                                          | chart | chartType | reportName | hour | minute |
      | AutoApp | tag:*display \| stats count() by apache.clientip,apache.resp_len \| limit 10 | Order | Line      | AutoApp    | 11   | 50     |

  Scenario: 搜索趋势图
    When I set the parameter "SearchInput" with value "Auto"
    And I click the "Search" button
    And I wait for loading invisible
    Then I will see the search result "{'column':'0','name':'AutoApp'}"
    And I will see the "app.AppPage" page
    And I will see the element "Title" name is "AutoTest...pWithAllResources"

  Scenario: 编辑趋势图
    When the data name is "AutoApp" then i click the "编辑" button
    And I will see the "app.AppPage" page
    And I will see the element "Title" name is "AutoTest...pWithAllResources"
    Then I will see the "trend.CreatePage" page
    When I set the parameter "NameInput" with value "AutoAppTrend"
    And I click the "NextButton" button
    And I wait for "Header" will be visible
    And I click the "NextButton" button
    Then I click the "Save" button

  Scenario Outline: 复制趋势图
    When the data name is "<name>" then i click the "复制" button
    And I refresh the website
    Then I will see the search result contains "{'column':'0','name':'<name>(副本)'}"

    Examples:
      | name         |
      | AutoAppTrend |

  Scenario Outline: 趋势图分组
    When the data name is "<name>" then i click the "分组" button
    And I cancel selection "AutoTestRoleWithAllResource" from the "Group"
    And I click the "Ensure" button
    And I refresh the website
    Then I will see the search result "{'contains':'no','column':'0','name':'<name>'}"

    Examples:
      | name         |
      | AutoAppTrend |

  Scenario Outline: 趋势图删除
    When the data name is "<name>" then i click the "删除" button
    And I click the "EnsureButton" button
    And I will see the success message "删除成功"
    And I refresh the website
    Then I will see the search result "{'column':'0','name':'<name>','contains':'no'}"

    Examples:
      | name             |
      | AutoAppTrend(副本) |

  Scenario: 修改分组
    Given open the "trend.ListPage" page for uri "/trend/"
    When the data name is "AutoAppTrend" then i click the "分组" button
    And I choose the "AutoTestRoleWithAllResource" from the "Group"
    And I click the "Ensure" button
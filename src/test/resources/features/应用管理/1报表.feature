@app @appSmoke
Feature: 应用报表（RZY-2127）

  Background:
    Given open the "app.ListPage" page for uri "/app/list/"
    When the data name is "AutoTestAppWithAllResources" then i click the "打开" button
    Then I will see the "app.AppPage" page
    And I click the "Report" button
    Then I will see the "report.ListPage" page

  Scenario: 新建报表
    When I click the "CreateButton" button
    And I will see the "app.AppPage" page
    And I will see the element "Title" name is "AutoTest...pWithAllResources"
    Then I will see the "report.CreatePage" page
    And I set the parameter "Name" with value "AutoAppReport"
    And I choose the "AutoTestRoleWithAllResource" from the "ReportGroup"
    And I set the parameter "Subject" with value "AutoTest"
    And I set the parameter "Hour" with value "1"
    And I set the parameter "Minute" with value "1"
    And I click the "NextButton" button
    And I choose the "AutoAppTrend" from the "ChartList"
    And I wait for "TopoTitle" will be visible
    And I click the "Save" button
    Then I will see the success message "保存成功"

  Scenario: 禁用报表
    When I disabled the data "AutoAppReport"
    Then I will see the success message "禁用成功"

  Scenario: 编辑报表
    When the data name is "AutoAppReport" then i click the "编辑" button
    And I will see the "app.AppPage" page
    And I will see the element "Title" name is "AutoTest...pWithAllResources"
    Then I will see the "report.CreatePage" page
    And I set the parameter "Name" with value "AutoAppForReport"
    And I click the "NextButton" button
    And I click the "Save" button
    Then I will see the success message "保存成功"

  Scenario Outline: 报表分组
    When the data name is "<name>" then i click the "分组" button
    And I cancel selection "AutoTestRoleWithAllResource" from the "ChangeGroup"
    And I click the "Ensure" button
    And I refresh the website
    Then I will see the search result "{'contains':'no','column':'0','name':'<name>'}"

    Examples:
      | name             |
      | AutoAppForReport |

  Scenario: 删除报表及趋势图
    When the data name is "AutoApp" then i click the "删除" button
    Then I click the "DeleteEnsure" button
    Given open the "report.ListPage" page for uri "/reports/"
    When the data name is "AutoAppForReport" then i click the "删除" button
    Then I click the "DeleteEnsure" button
    Given open the "trend.ListPage" page for uri "/trend/"
    When the data name is "AutoAppTrend" then i click the "删除" button
    Then I click the "EnsureButton" button
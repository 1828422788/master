@trend @acceleration @accelerationReport
Feature: 趋势图加速_3报表引用趋势图

  Scenario Outline: 新建报表
    Given open the "report.ListPage" page for uri "/reports/"
    And I click the "NewReportButton" button under some element
    Then I will see the "report.CreatePage" page
    And I wait for element "SelectedUser" change text to username
    When I set the parameter "Name" with value "<name>"
    And I set the parameter "Describe" with value "AutoCreate"
    And I choose the "PDF" from the "ReportType"
    And I set the parameters "Hour" and "Minute" as "<min>" minutes later from now
    And I click the "NextButton" button under some element
    Then I wait for "ChartListButton" will be visible
    When I choose the "趋势图_报表(复制)" from the "ChartList"
    And I click the "ChartListButton" button
    Then I will see the element "LastTrendTitle" contains "趋势图_报表(复制)"
    When I choose the "<trend>" from the "ChartListReference"
    And I click the "ChartListButton" button
    Then I will see the element "LastTrendTitle" contains "<trend>"
    When I click the "Complete" button under some element
    And I wait for "ResultMessage" will be visible
    And I will see the element "ResultMessage" contains "新建成功"

  Examples:
    | name                 | trend             | min  |
    | 报表引用趋势图_执行  | 趋势图_报表(引用) | 3    |
    | 报表引用趋势图_预览  | 趋势图_报表(预览) | 0    |
    
  Scenario: 报表预览
    Given open the "report.ListPage" page for uri "/reports/"
    When I set the parameter "SearchInput" with value "报表引用趋势图_预览"
    And I wait for "Loading" will be invisible
    And the data name is "{'column':'1','name':'报表引用趋势图_预览'}" then i click the "编辑" button
    Then I will see the "report.CreatePage" page
    And I wait for element "SelectedUser" change text to username
    And I click the "NextButton" button under some element
    And I wait for "LastTrendTitle" will be visible
    And I choose the "下载到本地预览" from the "Preview"
    And I wait for "SuccessMessage" will be visible
    And I will see the element "SuccessMessage" contains "正在生成测试报表，请稍后查看报表历史页"
    When I click the "Complete" button under some element
    And I wait for "ResultMessage" will be visible
    And I will see the element "ResultMessage" contains "更新成功"
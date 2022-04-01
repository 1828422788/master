@dashboardConfig @dashboard20
Feature: 仪表盘标签操作

  Background:
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible


  Scenario Outline: 新建仪表盘
    And I click the "Create" button
    When I set the parameter "DashBoardName" with value "<name>"
    Then I click the "Ensure" button
    And I wait for "SuccessMessage" will be visible
    Then I will see the success message "新建仪表盘成功"

    Examples:
      | name  |
      | 接收标签页 |
      | 标签页移出 |


  Scenario: 新建标签页
    And I click the detail which name is "标签页移出"
    And switch to window "仪表盘"
    And I close all tabs except main tab
    Then I will see the "dashboard.DetailPage" page
    When I set the parameter "TagName" with value "第一个标签"
    And I click the "Ensure" button
    Then I wait for "SettingIcon" will be visible


  Scenario: 移出标签页(RZY-230)
    And I click the detail which name is "标签页移出"
    And switch to window "仪表盘"
    And I close all tabs except main tab
    Then I will see the "dashboard.DetailPage" page
    And I click the "SettingIcon" button
    And I switch the dashboard "OpenEdit" button to "enable"
    And I wait for "SuccessMessage" will be invisible
    And I click the "MoveoutTag" button
    And I wait for loading invisible
    And I "checked" the checkbox which name is "接收标签页"
    And I click the "Ensure" button
    And I wait for loading complete
    And I wait for "3000" millsecond
    And I back to before


  Scenario: 验证标签页移出成功(RZY-230)
    Then I will see the data "标签页移出" values "{'column':'2','name':'-'}"
    Then I will see the data "接收标签页" values "{'column':'2','name':'第一个标签'}"


  Scenario: 切换标签页 RZY-4698
    And I click the detail which name is "接收标签页"
    And switch to window "仪表盘"
    And I close all tabs except main tab
    Then I will see the "dashboard.DetailPage" page
    And I click the "ShowDashboards" button
    And I wait for "LastTag" will be visible
    And I open the context menu of the "LastDashboard" element
    And I wait for "2000" millsecond
    And I click the "CreateNewTag" button
    And I set the parameter "TagName" with value "第二个标签"
    And I click the "Ensure" button
    And I wait for loading complete
    Then I will see the element "LastTag" value is "第二个标签"


  Scenario: 高级编辑 RZY-4485
    Then I will see the data "标签页移出" values "{'column':'2','name':'-'}"
    Then I will see the data "接收标签页" values "{'column':'2','name':'第一个标签, 第二个标签'}"
    And I click the detail which name is "接收标签页"
    And switch to window "仪表盘"
    And I close all tabs except main tab
    Then I will see the "dashboard.DetailPage" page
    And I click the "SettingIcon" button
    And I switch the dashboard "OpenEdit" button to "enable"
    And I click the "SuperEdit" button
    Then I set the parameter "{  "name": "验证高级编辑",  "editable": false,  "showFilters": false,  "theme": "day",  "showTitle": true,  "activeDrilldown": false,  "refresh": {    "on": false,    "time": 3,    "unit": "m"  },  "filters": []}" to json editor
    And I wait for "500" millsecond
    And I click the "Check" button
    Then I click the "Ensure" button
    And I wait for loading invisible
    And I wait for "2000" millsecond
    Then I will see the element "TagPageName" value is "验证高级编辑"
    And I click the "SettingIcon" button
    Then I will see the "EditLayout,RemoveTag,ManualRefresh,AutoRefresh" is "disabled"


  Scenario: 验证标签页
    Then I will see the data "标签页移出" values "{'column':'2','name':'-'}"
    Then I will see the data "接收标签页" values "{'column':'2','name':'验证高级编辑, 第二个标签'}"

  @cleanDashboard
  Scenario Outline: 删除仪表盘
    When the data name is "<name>" then i click the "删除" button in more menu
    And I wait for "Ensure" will be visible
    And I click the "Ensure" button
    And I wait for "500" millsecond
    Then I will see the success message "删除仪表盘成功"

    Examples:
      | name  |
      | 标签页移出 |
      | 接收标签页 |

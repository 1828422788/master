Feature: 仪表盘标签操作

  @dashboard @dashboardSmoke
  Scenario Outline: 新建仪表盘
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the "Create" button
    When I set the parameter "DashBoardName" with value "<name>"
    Then I click the "Ensure" button
    Then I will see the success message "新建仪表盘成功"

    Examples:
      | name  |
      | 接收标签页 |
      | 标签页移出 |

  @dashboard @dashboardSmoke
  Scenario: 新建标签页
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "标签页移出"
    Then I will see the "dashboard.DetailPage" page
    When I set the parameter "TagName" with value "第一个标签"
    And I click the "EnsureCreateTagButton" button
    And I wait for loading complete
    And I wait for "3000" millsecond
    And I back to before

  @dashboard @dashboardSmoke
  Scenario: 移出标签页(RZY-230)
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "标签页移出"
    Then I will see the "dashboard.DetailPage" page
    And I click the "SettingIcon" button
    And I click the "MoveoutTag" button
    And I wait for loading invisible
    And I "checked" the checkbox which name is "接收标签页"
    And I click the "Ensure" button
    And I wait for loading complete
    And I wait for "3000" millsecond
    And I back to before

  @dashboard @dashboardSmoke
  Scenario: 验证标签页移出成功(RZY-230)
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    Then I will see the data "标签页移出" values "{'column':'2','name':'-'}"
    Then I will see the data "接收标签页" values "{'column':'2','name':'第一个标签'}"


  @dashboard @dashboardSmoke
  Scenario: 切换标签页 RZY-4698
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "接收标签页"
    Then I will see the "dashboard.DetailPage" page
    When I click the "TagPageName" button
    And I wait for "2000" millsecond
    And I click the "AddTag" button
    And I set the parameter "TagName" with value "第二个标签"
    And I click the "EnsureCreateTagButton" button
    And I wait for loading complete
    And I wait for "3000" millsecond
    When I click the "TagPageName" button
    And I wait for "2000" millsecond
    And I click the "SecondTag" button
    Then I will see the element "TagPageName" value is "第二个标签"

  @dashboard @dashboardSmoke
  Scenario: 高级编辑 RZY-4485
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "接收标签页"
    Then I will see the "dashboard.DetailPage" page
    And I click the "SettingIcon" button
    And I wait for "1000" millsecond
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

  @cleanDashboard
  Scenario Outline: 删除仪表盘
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    When the data name is "<name>" then i click the "删除" button
    And I wait for "Ensure" will be visible
    And I click the "Ensure" button
    And I wait for "500" millsecond
    Then I will see the success message "删除仪表盘成功"

    Examples:
      | name  |
      | 标签页移出 |
      | 接收标签页 |

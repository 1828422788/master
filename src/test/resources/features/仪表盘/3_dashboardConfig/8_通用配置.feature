@dashboardConfig @dashboard36
Feature: 仪表盘通用配置

  Scenario Outline: 新建仪表盘
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I click the "Create" button
    When I set the parameter "DashBoardName" with value "<name>"
    And I click the "Ensure" button
    Then I will see the success message "新建仪表盘成功"

    Examples:
      | name   |
      | 测试通用配置 |

  Scenario: 新建标签页
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "测试通用配置"
    And switch to window "仪表盘"
    And I close all tabs except main tab
    Then I will see the "dashboard.DetailPage" page
    When I set the parameter "TagName" with value "chart"
    And I click the "Ensure" button
    Then I wait for "SettingIcon" will be visible

  Scenario: 添加事件列表
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "测试通用配置"
    And switch to window "仪表盘"
    And I close all tabs except main tab
    Then I will see the "dashboard.DetailPage" page
    And I click the "SettingIcon" button
    And I switch the dashboard "OpenEdit" button to "enable"
    And I click the "SettingIcon" button
    And I wait for "SuccessMessage" will be invisible
    And I choose the "添加事件列表" from the "AddItemMenu"
    And I set the parameter "EventName" with value "测试高级编辑"
    And I set the parameter "Spl" with value "*"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "Ensure" button

  Scenario: 修改图表标题  RZY-290
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "测试通用配置"
    And switch to window "仪表盘"
    And I close all tabs except main tab
    Then I will see the "dashboard.DetailPage" page
    And I click the "SettingIcon" button
    And I switch the dashboard "OpenEdit" button to "enable"
    And I click the "SettingIcon" button
    And I wait for "SuccessMessage" will be invisible
    When the chart title is "测试高级编辑" then I click the button which classname is "yotta-icon yotta-icon-DotEmblem" in dashboard
    And I click the "Configs" button
    And I wait for loading invisible
    And I set the parameter "ChartTitle" with value "测试通用配置"
    And I click the "Ensure" button
    And I wait for element "SuccessMessage" change text to "配置成功"
    Then I will see the element "CustomTitle" name is "测试通用配置"

  Scenario: 修改spl RZY-291,RZY-292,RZY-293
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "测试通用配置"
    And switch to window "仪表盘"
    And I close all tabs except main tab
    Then I will see the "dashboard.DetailPage" page
    And I click the "SettingIcon" button
    And I switch the dashboard "OpenEdit" button to "enable"
    And I click the "SettingIcon" button
    And I wait for "SuccessMessage" will be invisible
    When the chart title is "测试通用配置" then I click the button which classname is "yotta-icon yotta-icon-DotEmblem" in dashboard
    And I click the "Configs" button
    And I wait for loading invisible
    And I set the parameter "Spl" with value ""
    And I click the "Ensure" button
    And I will see the text "请填写查询语句" exist in page
    And I click the "OpenInSearch" button
    And I will see the error message "查询语句错误"
    And I set the parameter "Spl" with value "tag:sample04061424_display OR tag:sample04061424_chart OR tag:sample04061424 | stats count() by apache.geo.city"
    And I click the "Ensure" button
    And I wait for element "SuccessMessage" change text to "配置成功"
    And I wait for "SuccessMessage" will be invisible
    When the chart title is "测试通用配置" then I click the button which classname is "yotta-icon yotta-icon-DotEmblem" in dashboard
    And I click the "Configs" button
    And I wait for loading invisible
    And I wait for "OpenInSearch" will be visible
    And I click the "DateEditor" button
    And I click the "Yesterday" button
    And I click the "OpenInSearch" button
    And switch to another window
    And I close all tabs except main tab
    Then I will see the "splSearch.SearchPage" page
    Then I will see the element "SearchInput" name is "tag:sample04061424_display OR tag:sample04061424_chart OR tag:sample04061424 | stats count() by apache.geo.city"
    Then I will see the "TimeRange" result will be "昨天"

  Scenario: 修改图表描述 RZY-295
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "测试通用配置"
    And switch to window "仪表盘"
    And I close all tabs except main tab
    Then I will see the "dashboard.DetailPage" page
    And I click the "SettingIcon" button
    And I switch the dashboard "OpenEdit" button to "enable"
    And I click the "SettingIcon" button
    And I wait for "SuccessMessage" will be invisible
    When the chart title is "测试通用配置" then I click the button which classname is "yotta-icon yotta-icon-DotEmblem" in dashboard
    And I click the "Configs" button
    And I wait for loading invisible
    And I set the parameter "ChartDesc" with value "测试描述"
    And I click the "Ensure" button
    And I move the mouse pointer to the "Describe"
    Then I will see the text "测试描述" exist in page

  @cleanDashboard
  Scenario Outline: 删除仪表盘
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    When the data name is "<name>" then i click the "删除" button in more menu
    And I click the "Ensure" button
    Then I will see the success message "删除仪表盘成功"

    Examples:
      | name   |
      | 测试通用配置 |
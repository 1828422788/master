@dashboard @dashboardSmoke
Feature: 仪表盘通用配置

  Scenario Outline: 新建仪表盘
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I click the "Create" button
    When I set the parameter "DashBoardName" with value "<name>"
    And I click the "Ensure" button
    Then I will see the success message "新建成功"

    Examples:
      | name   |
      | 测试通用配置 |

  Scenario: 新建标签页
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I click the detail which name is "测试通用配置"
    Then I will see the "dashboard.DetailPage" page
    When I set the parameter "TagName" with value "chart"
    And I click the "EnsureCreateTagButton" button
    And I wait for loading complete

  Scenario: 添加事件列表
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I click the detail which name is "测试通用配置"
    Then I will see the "dashboard.DetailPage" page
    And I wait for "AddEventButton" will be visible
    When I click the "AddEventButton" button
    And I choose the "添加事件列表" from the "EventList"
    And I set the parameter "TagName" with value "测试高级编辑"
    And I set the parameter "Spl" with value "*"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "AddEventEnsure" button

  Scenario: 修改图表标题
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I click the detail which name is "测试通用配置"
    Then I will see the "dashboard.DetailPage" page
    And I click the "ChartSetting" button
    And I click the "Configs" button
    And I set the parameter "ChartTitle" with value "测试通用配置"
    And I click the "SettingEnsure" button
    And I wait for "SettingEnsure" will be invisible
    Then I will see the element "CustomTitle" name is "测试通用配置"

  Scenario: 修改spl
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I click the detail which name is "测试通用配置"
    Then I will see the "dashboard.DetailPage" page
    And I click the "ChartSetting" button
    And I click the "Configs" button
    And I set the parameter "Spl" with value "*|stats count() by apache.geo.city"
    And I click the "SettingEnsure" button
    And I wait for "SettingEnsure" will be invisible
    And I click the "ChartSetting" button
    And I click the "Configs" button
    And I wait for "OpenInSearch" will be visible
    And I click the "OpenInSearch" button
    And switch to another window
    Then I will see the "splSearch.SearchPage" page
    Then I will see the element "SearchInput" name is "*|stats count() by apache.geo.city"

  Scenario: 修改图表描述
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I click the detail which name is "测试通用配置"
    Then I will see the "dashboard.DetailPage" page
    And I click the "ChartSetting" button
    And I click the "Configs" button
    And I set the parameter "ChartDesc" with value "描述信息"
    And I click the "SettingEnsure" button
    And I wait for "SettingEnsure" will be invisible
    And I click the "CustomTitle" button
    And I click the "Describe" button
    Then I will see the "DescribeText" result will be "描述信息"

  Scenario Outline: 删除仪表盘
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    When the data name is "<name>" then i click the "删除" button
    And I wait for "Ensure" will be visible
    And I click the "Ensure" button
    Then I will see the success message "删除成功"

    Examples:
      | name   |
      | 测试通用配置 |
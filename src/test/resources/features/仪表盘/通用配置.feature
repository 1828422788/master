@tongyongpeizhiybp
Feature: 仪表盘通用配置

  @dashboard @dashboardSmoke
  Scenario Outline: 新建仪表盘
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I click the "Create" button
    When I set the parameter "DashBoardName" with value "<name>"
    And I click the "Ensure" button
    And I wait for "500" millsecond
    Then I will see the success message "新建仪表盘成功"

    Examples:
      | name   |
      | 测试通用配置 |

  @dashboard @dashboardSmoke
  Scenario: 新建标签页
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "测试通用配置"
    Then I will see the "dashboard.DetailPage" page
    When I set the parameter "TagName" with value "chart"
    And I click the "Ensure" button
    And I wait for loading complete
    And I back to before

  @dashboard @dashboardSmoke
  Scenario: 添加事件列表
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "测试通用配置"
    Then I will see the "dashboard.DetailPage" page
    And I wait for "AddEventButton" will be visible
    When I click the "AddEventButton" button
    And I click the "AddEvent" button
    And I set the parameter "EventName" with value "测试高级编辑"
    And I set the parameter "Spl" with value "*"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "Ensure" button

  @dashboard @dashboardSmoke
  Scenario: 修改图表标题
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "测试通用配置"
    Then I will see the "dashboard.DetailPage" page
    And I wait for "500" millsecond
    When the chart title is "测试高级编辑" then I click the button which classname is "anticon css-ifnfqv ant-dropdown-trigger" in dashboard
    And I click the "Configs" button
    And I wait for loading invisible
    And I set the parameter "ChartTitle" with value "测试通用配置"
    And I click the "Ensure" button
    And I wait for "Ensure" will be invisible
    Then I will see the element "CustomTitle" name is "测试通用配置"

  @dashboard @dashboardSmoke
  Scenario: 修改spl
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "测试通用配置"
    Then I will see the "dashboard.DetailPage" page
    When the chart title is "测试通用配置" then I click the button which classname is "anticon css-ifnfqv ant-dropdown-trigger" in dashboard
    And I click the "Configs" button
    And I wait for loading invisible
    And I set the parameter "Spl" with value "*|stats count() by apache.geo.city"
    And I click the "Ensure" button
    And I wait for "Ensure" will be invisible
    When the chart title is "测试通用配置" then I click the button which classname is "anticon css-ifnfqv ant-dropdown-trigger" in dashboard
    And I click the "Configs" button
    And I wait for "OpenInSearch" will be visible
    And I click the "OpenInSearch" button
    And switch to another window
    Then I will see the "splSearch.SearchPage" page
    Then I will see the element "SearchInput" name is "*|stats count() by apache.geo.city"

  @dashboard @dashboardSmoke
  Scenario: 修改图表描述
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "测试通用配置"
    Then I will see the "dashboard.DetailPage" page
    When the chart title is "测试通用配置" then I click the button which classname is "anticon css-ifnfqv ant-dropdown-trigger" in dashboard
    And I click the "Configs" button
    And I wait for loading invisible
    And I set the parameter "ChartDesc" with value "描述信息"
    And I click the "Ensure" button
    And I wait for "Ensure" will be invisible
    And I click the "CustomTitle" button
    And I click the "Describe" button
    Then I will see the "DescribeText" result will be "测试描述"

  @cleanDashboard
  Scenario Outline: 删除仪表盘
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    When the data name is "<name>" then i click the "删除" button
    And I wait for "Ensure" will be visible
    And I click the "Ensure" button
    And I wait for "500" millsecond
    Then I will see the success message "删除仪表盘成功"

    Examples:
      | name   |
      | 测试通用配置 |
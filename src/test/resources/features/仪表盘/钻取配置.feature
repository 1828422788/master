Feature: 仪表盘钻取配置

  @dashboard @dashboardSmoke
  Scenario Outline: 新建仪表盘
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I click the "Create" button
    When I set the parameter "DashBoardName" with value "<name>"
    And I click the "Ensure" button
    Then I will see the success message "新建仪表盘成功"

    Examples:
      | name   |
      | 测试钻取配置 |
      | 钻取跳转   |

  @dashboard @dashboardSmoke
  Scenario: 新建趋势图
    And open the "trend.ListPage" page for uri "/trend/"
    And I click the "CreateButton" button
    And I click the "Create" button
    Then I will see the "trend.CreatePage" page
    And I set the parameter "SearchInput" with value "tag:sample04061424_chart | stats count() by apache.geo.country, apache.geo.province, apache.geo.city"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for "Header" will be visible
    And I click the "NextButton" button
    And I wait for "Header" will be visible
    And I click the "NextButton" button
    When I set the parameter "NameInput" with value "仪表盘钻取配置"
    And I click the "NextButton" button
    And I wait for "SuccessCreate" will be visible

  @dashboard @dashboardSmoke
  Scenario Outline: 新建标签页
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "<name>"
    Then I will see the "dashboard.DetailPage" page
    When I set the parameter "TagName" with value "chart"
    And I click the "Ensure" button
    And I wait for loading complete

    Examples:
      | name   |
      | 测试钻取配置 |
      | 钻取跳转   |

  @dashboard @dashboardSmoke
  Scenario: 添加图表
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "测试钻取配置"
    Then I will see the "dashboard.DetailPage" page
    And I wait for "AddEventButton" will be visible
    When I click the "AddEventButton" button
    And I click the "AddChart" button
    And I wait for "SpinDot" will be invisible
    And I set the parameter "SearchChartInput" with value "仪表盘钻取配置"
    And I wait for loading invisible
    And I "checked" the checkbox which name is "仪表盘钻取配置"
    And I click the "Ensure" button
    Then I wait for element "SuccessMessage" change text to "添加成功"

  @dashboard @dashboardSmoke
  Scenario: 开启钻取配置
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "测试钻取配置"
    Then I will see the "dashboard.DetailPage" page
    And I click the "SettingIcon" button
    And I click the "OpenDrilldown" button
    And I wait for "500" millsecond
    Then I will see the success message "钻取功能已启用"

  @dashboard @dashboardSmoke
  Scenario: 在当前页面跳转到搜索页-自动
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "测试钻取配置"
    Then I will see the "dashboard.DetailPage" page
    And I wait for "Progress" will be invisible
    When the chart title is "仪表盘钻取配置" then I click the button which classname is "anticon css-ifnfqv ant-dropdown-trigger" in dashboard
    And I click the "DrillSetting" button
    And I choose the "跳转到搜索页" from the "DrillAction"
    And I "unchecked" the checkbox which name is "在浏览器新标签页中打开"
    And I click the "Ensure" button
    And I click the "Jiangsu" button
    Then I wait for title change text to "搜索"
    And I will see the "splSearch.SearchPage" page
    Then I will see the "SearchInput" result will be "tag:sample04061424_chart AND 'apache.geo.province':江苏"

  @dashboard @dashboardSmoke
  Scenario: 在新标签页跳转到搜索页-自动
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "测试钻取配置"
    Then I will see the "dashboard.DetailPage" page
    And I wait for "Progress" will be invisible
    When the chart title is "仪表盘钻取配置" then I click the button which classname is "anticon css-ifnfqv ant-dropdown-trigger" in dashboard
    And I click the "DrillSetting" button
    And I choose the "跳转到搜索页" from the "DrillAction"
    And I "checked" the checkbox which name is "在浏览器新标签页中打开"
    And I click the "Ensure" button
    And I click the "Jiangsu" button
    And switch to another window
    And I will see the "splSearch.SearchPage" page
    Then I will see the "SearchInput" result will be "tag:sample04061424_chart AND 'apache.geo.province':江苏"

  @dashboard @dashboardSmoke
  Scenario: 在当前页面跳转到搜索页-自定义
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "测试钻取配置"
    Then I will see the "dashboard.DetailPage" page
    And I wait for "Progress" will be invisible
    When the chart title is "仪表盘钻取配置" then I click the button which classname is "anticon css-ifnfqv ant-dropdown-trigger" in dashboard
    And I click the "DrillSetting" button
    And I choose the "跳转到搜索页" from the "DrillAction"
    And I click the "Custom" button
    And I set the parameter "Spl" with value "tag:*display | stats count() by apache.clientip,apache.resp_len | limit 10"
    And I click the "DateEditor" button
    And I click the "Shortcut" button
    And I click the "Today" button
    And I "unchecked" the checkbox which name is "在浏览器新标签页中打开"
    And I click the "Ensure" button
    And I click the "Jiangsu" button
    Then I wait for title change text to "搜索"
    And I will see the "splSearch.SearchPage" page
    Then I will see the "SearchInput" result will be "tag:*display | stats count() by apache.clientip,apache.resp_len | limit 10"
    Then I will see the input element "TimeRange" value will contains "今天"

  @dashboard @dashboardSmoke
  Scenario: 在新标签页跳转到搜索页-自定义
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "测试钻取配置"
    Then I will see the "dashboard.DetailPage" page
    And I wait for "Progress" will be invisible
    When the chart title is "仪表盘钻取配置" then I click the button which classname is "anticon css-ifnfqv ant-dropdown-trigger" in dashboard
    And I click the "DrillSetting" button
    And I choose the "跳转到搜索页" from the "DrillAction"
    And I click the "Custom" button
    And I set the parameter "Spl" with value "tag:*display | stats count() by apache.clientip,apache.resp_len | limit 10"
    And I click the "DateEditor" button
    And I click the "Shortcut" button
    And I click the "Today" button
    And I "checked" the checkbox which name is "在浏览器新标签页中打开"
    And I click the "Ensure" button
    And I click the "Jiangsu" button
    And switch to another window
    And I will see the "splSearch.SearchPage" page
    Then I will see the "SearchInput" result will be "tag:*display | stats count() by apache.clientip,apache.resp_len | limit 10"
    Then I will see the input element "TimeRange" value will contains "今天"

  @dashboard @dashboardSmoke
  Scenario Outline: 在当前页面跳转到自定义URL
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "测试钻取配置"
    Then I will see the "dashboard.DetailPage" page
    And I wait for "Progress" will be invisible
    When the chart title is "仪表盘钻取配置" then I click the button which classname is "anticon css-ifnfqv ant-dropdown-trigger" in dashboard
    And I click the "DrillSetting" button
    And I wait for "DrillAction" will be visible
    And I choose the "跳转到自定义URL" from the "DrillAction"
    And I set the parameter "Url" with value "<url>"
    And I "unchecked" the checkbox which name is "在浏览器新标签页中打开"
    And I click the "Ensure" button
    And I click the "Jiangsu" button
    Then I wait for title change text to "<title>"

    Examples:
      | url                    | title     |
      | https://www.baidu.com/ | 百度一下，你就知道 |
      | /alerts/               | 监控        |

  @dashboard @dashboardSmoke
  Scenario Outline: 在新标签跳转到自定义URL
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "测试钻取配置"
    Then I will see the "dashboard.DetailPage" page
    And I wait for "Progress" will be invisible
    When the chart title is "仪表盘钻取配置" then I click the button which classname is "anticon css-ifnfqv ant-dropdown-trigger" in dashboard
    And I click the "DrillSetting" button
    And I choose the "跳转到自定义URL" from the "DrillAction"
    And I set the parameter "Url" with value "<url>"
    And I "checked" the checkbox which name is "在浏览器新标签页中打开"
    And I click the "Ensure" button
    And I wait for "Jiangsu" will be visible
    And I click the "Jiangsu" button
    And switch to another window
    Then the page's title will be "<title>"

    Examples:
      | url                    | title     |
      | https://www.baidu.com/ | 百度一下，你就知道 |
      | /trend/                | 趋势图       |

  @dashboard @dashboardSmoke
  Scenario: 新建标签页钻取所需趋势图
    And open the "trend.ListPage" page for uri "/trend/"
    And I click the "CreateButton" button
    And I click the "Create" button
    Then I will see the "trend.CreatePage" page
    And I set the parameter "SearchInput" with value "tag:sample04061424_chart AND 'apache.geo.province':江苏 | stats count()"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for "Header" will be visible
    And I click the "NextButton" button
    And I wait for "Header" will be visible
    And I click the "NextButton" button
    When I set the parameter "NameInput" with value "测试标签钻取"
    And I click the "NextButton" button
    And I wait for "SuccessCreate" will be visible

  @dashboard @dashboardSmoke
  Scenario: 仪表盘添加钻取趋势图
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "钻取跳转"
    Then I will see the "dashboard.DetailPage" page
    And I wait for "AddEventButton" will be visible
    When I click the "AddEventButton" button
    And I click the "AddChart" button
    And I set the parameter "SearchChartInput" with value "测试标签钻取"
    And I wait for loading invisible
    And I click the "{'Checkbox':'测试标签钻取'}" button
    And I click the "Ensure" button
    Then I wait for element "SuccessMessage" change text to "添加成功"

  @dashboard @dashboardSmoke
  Scenario Outline: 仪表盘添加输入项
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "钻取跳转"
    Then I will see the "dashboard.DetailPage" page
    When I click the "AddEventButton" button
    And I click the "AddInput" button
    And I set the parameter "FilterTitle" with value "<filter>"
    And I set the parameter "FilterToken" with value "<filter>"
    And I set the parameter "FilterDefaultValue" with value "<defaultValue>"
    Then I click the "Ensure" button

    Examples:
      | filter | defaultValue |
      | city   | 苏州市          |

  @dashboard @dashboardSmoke
  Scenario: 修改仪表盘配置
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "钻取跳转"
    Then I will see the "dashboard.DetailPage" page
    When the chart title is "测试标签钻取" then I click the button which classname is "anticon css-ifnfqv ant-dropdown-trigger" in dashboard
    And I click the "Configs" button
    And I wait for loading invisible
    And I set the parameter "Spl" with value "tag:sample04061424_chart AND apache.geo.city:${city}| stats count() by apache.geo.country, apache.geo.province, apache.geo.city"
    And I click the "Ensure" button
    And I wait for "500" millsecond
    Then I will see the success message "配置成功"

  @dashboard @dashboardSmoke
  Scenario: 跳转到标签页(后三步待验证)
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "测试钻取配置"
    Then I will see the "dashboard.DetailPage" page
    And I wait for "Progress" will be invisible
    When the chart title is "仪表盘钻取配置" then I click the button which classname is "anticon css-ifnfqv ant-dropdown-trigger" in dashboard
    And I click the "DrillSetting" button
    And I wait for "DrillAction" will be visible
    And I choose the "跳转到标签页" from the "DrillAction"
    And I click the "TargetTag" button
    And I choose the "钻取跳转" from the "DashboardMenu"
    And I choose the "chart" from the "DashboardMenu"
    And I click the "TargetParam" button
    And I choose the "city" from the "InputGroup"
    And I hide the element "ParamDropdown"
    And I click the "ParamValue" button
    And I click the "ClickValue" button
    And I click the "Ensure" button
    And I click the "Nanjing" button
    And switch to another window
    And I close all tabs except main tab
    And I wait for "Progress" will be invisible
    Then I will see the element "GeoCity" attribute "Value" is "南京市"

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
      | 钻取跳转   |
      | 测试钻取配置 |

  @cleanDashboard
  Scenario Outline: 删除仪表盘所建趋势图
    Given open the "trend.ListPage" page for uri "/trend/"
    When the data name is "<name>" then i click the "删除" button
    And I wait for "Ensure" will be visible
    And I click the "Ensure" button
    And I wait for "500" millsecond
    And I will see the success message "删除成功"

    Examples:
      | name    |
      | 测试标签钻取  |
      | 仪表盘钻取配置 |
@dashboard @dashboardSmoke
Feature: 仪表盘钻取配置

  Scenario Outline: 新建仪表盘
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I click the "Create" button
    When I set the parameter "DashBoardName" with value "<name>"
    And I click the "Ensure" button
    Then I will see the success message "新建成功"

    Examples:
      | name   |
      | 测试钻取配置 |

  Scenario: 新建趋势图
    And open the "trend.ListPage" page for uri "/trend/"
    And I click the "Create" button
    Then I will see the "trend.CreatePage" page
    When I set the parameter "NameInput" with value "仪表盘钻取配置"
    And I click the "NextButton" button
    And I set the parameter "SearchInput" with value "tag:sample04061424_chart | stats count() by apache.geo.country, apache.geo.province, apache.geo.city"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for "Header" will be visible
    And I click the "NextButton" button
    And I click the "NextButton" button
    Then I will see the element "SuccessCreate" name is "新建成功！"

  Scenario: 新建标签页
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I click the detail which name is "测试钻取配置"
    Then I will see the "dashboard.DetailPage" page
    When I set the parameter "TagName" with value "chart"
    And I click the "EnsureCreateTagButton" button
    And I wait for loading complete

  Scenario: 添加图表
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I click the detail which name is "测试钻取配置"
    Then I will see the "dashboard.DetailPage" page
    And I click the "AddButton" button
    And I choose the "添加图表" from the "EventList"
    And I check "仪表盘钻取配置" from the "CheckBox"
    And I click the "EnsureAddTrend" button
    And I wait for "ChartSetting" will be visible

  Scenario: 在当前页面跳转到搜索页-自动
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I click the detail which name is "测试钻取配置"
    Then I will see the "dashboard.DetailPage" page
    And I wait for "Progress" will be invisible
    And I click the "ChartSetting" button
    And I click the "DrillSetting" button
    And I click the "DrillAction" button
    And I choose the "跳转到搜索页" from the "LastDropdownList"
    And I "unchecked" the checkbox which name is "在浏览器新标签页中打开"
    And I click the "SettingEnsure" button
    Then I will see the success message "配置保存成功"
    And I click the "Jiangsu" button
    Then I wait for title change text to "搜索"
    And I will see the "splSearch.SearchPage" page
    Then I will see the "SearchInput" result will be "tag:sample04061424_chart AND 'apache.geo.province':江苏"

  Scenario: 在新标签页跳转到搜索页-自动
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I click the detail which name is "测试钻取配置"
    Then I will see the "dashboard.DetailPage" page
    And I wait for "Progress" will be invisible
    And I click the "ChartSetting" button
    And I click the "DrillSetting" button
    And I click the "DrillAction" button
    And I choose the "跳转到搜索页" from the "LastDropdownList"
    And I "checked" the checkbox which name is "在浏览器新标签页中打开"
    And I click the "SettingEnsure" button
    Then I will see the success message "配置保存成功"
    And I click the "Jiangsu" button
    Then I wait for title change text to "搜索"
    And I will see the "splSearch.SearchPage" page
    Then I will see the "SearchInput" result will be "tag:sample04061424_chart AND 'apache.geo.province':江苏"

  Scenario Outline: 在当前页面跳转到自定义URL
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I click the detail which name is "测试钻取配置"
    Then I will see the "dashboard.DetailPage" page
    And I wait for "Progress" will be invisible
    And I click the "ChartSetting" button
    And I click the "DrillSetting" button
    And I click the "DrillAction" button
    And I choose the "跳转到自定义URL" from the "LastDropdownList"
    And I set the parameter "Url" with value "<url>"
    And I "unchecked" the checkbox which name is "在浏览器新标签页中打开"
    And I click the "SettingEnsure" button
    Then I will see the success message "配置保存成功"
    And I click the "Jiangsu" button
    Then I wait for title change text to "<title>"

    Examples:
      | url                    | title     |
      | https://www.baidu.com/ | 百度一下，你就知道 |
      | /alerts/               | 监控        |

  Scenario Outline: 在新标签跳转到自定义URL
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I click the detail which name is "测试钻取配置"
    Then I will see the "dashboard.DetailPage" page
    And I wait for "Progress" will be invisible
    And I click the "ChartSetting" button
    And I click the "DrillSetting" button
    And I click the "DrillAction" button
    And I choose the "跳转到自定义URL" from the "LastDropdownList"
    And I set the parameter "Url" with value "<url>"
    And I "checked" the checkbox which name is "在浏览器新标签页中打开"
    And I click the "SettingEnsure" button
    Then I will see the success message "配置保存成功"
    And I click the "Jiangsu" button
    And switch to another window
    Then the page's title will be "<title>"

    Examples:
      | url                    | title     |
      | https://www.baidu.com/ | 百度一下，你就知道 |
      | /trend/                | 趋势图       |
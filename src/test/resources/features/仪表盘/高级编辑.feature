@dashboard @dashboardSmoke
Feature: 仪表盘高级编辑

  Scenario Outline: 新建仪表盘
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I click the "Create" button
    When I set the parameter "DashBoardName" with value "<name>"
    And I click the "Ensure" button
    Then I will see the success message "新建成功"

    Examples:
      | name   |
      | 测试高级编辑 |

  Scenario: 新建趋势图
    And open the "trend.ListPage" page for uri "/trend/"
    And I click the "Create" button
    Then I will see the "trend.CreatePage" page
    When I set the parameter "NameInput" with value "仪表盘所有"
    And I click the "NextButton" button
    And I set the parameter "SearchInput" with value "tag:*display | stats count() by apache.clientip,apache.resp_len | limit 10 "
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for "Header" will be visible
    And I click the "NextButton" button
    And I click the "NextButton" button
    Then I will see the element "SuccessCreate" name is "新建成功！"

  Scenario: 新建标签页
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I click the detail which name is "测试高级编辑"
    Then I will see the "dashboard.DetailPage" page
    When I set the parameter "TagName" with value "chart"
    And I click the "EnsureCreateTagButton" button
    And I wait for loading complete

  Scenario: 添加图表
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I click the detail which name is "测试高级编辑"
    Then I will see the "dashboard.DetailPage" page
    And I click the "AddButton" button
    And I choose the "添加图表" from the "EventList"
    And I check "仪表盘所有" from the "CheckBox"
    And I click the "EnsureAddTrend" button

  Scenario: 图表高级配置
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I click the detail which name is "测试高级编辑"
    Then I will see the "dashboard.DetailPage" page
    And I wait for "ChartSetting" will be visible
    And I click the "ChartSetting" button
    And I click the "Edit" button
    And I set the parameter "JsonEditor" with value "test"

  Scenario Outline: 删除仪表盘
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    When the data name is "<name>" then i click the "删除" button
    And I wait for "Ensure" will be visible
    And I click the "Ensure" button
    Then I will see the success message "仪表盘删除成功"

    Examples:
      | name   |
      | 测试高级编辑 |
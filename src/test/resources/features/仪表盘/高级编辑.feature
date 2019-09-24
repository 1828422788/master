@dashboard @dashboardSmoke
Feature: 仪表盘高级编辑

  Scenario Outline: 新建仪表盘
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I click the "CreateButton" button
    When I set the parameter "DashBoardName" with value "<name>"
    Then I click the "EnsureCreateButton" button

    Examples:
      | name   |
      | 测试高级编辑 |

  Scenario Outline: 新建趋势图
    Given open the "trend.ListPage" page for uri "/trend/"
    And I click the "CreateButton" button
    Then I will see the "trend.CreatePage" page
    When I set the parameter "NameInput" with value "<name>"
    And I set the parameter "DescribeInput" with value "AutoCreate"
    And I choose the "default_Trend" from the "GroupDropdown"
    And I click the "NextButton" button
    And I set the parameter "SearchInput" with value "<spl>"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for "Header" will be visible
    And I click the "NextButton" button
    And I wait for "Header" will be visible
    And I click the "Save" button

    Examples:
      | name   | spl                                                                                            |
      | 仪表盘趋势图 | tag:*display \| stats avg(apache.status) as a_\|eval icon=if(a_>300,"thumbs-down","thumbs-up") |

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
    And I check "仪表盘趋势图" from the "CheckBox"
    And I click the "EnsureAddTrend" button
    And I wait for "ChartSetting" will be visible
    And I click the "ChartSetting" button
    And I click the "Edit" button
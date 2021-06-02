@dashboard41 @dashboardChart
Feature: 仪表盘_1_2_面积图

  @dashboard @dashboardSmoke
  Scenario Outline: 新建仪表盘
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I click the "Create" button
    When I set the parameter "DashBoardName" with value "<name>"
    And I click the "Ensure" button
    Then I will see the success message "新建仪表盘成功"

    Examples:
      | name   |
      | 仪表盘面积图 |

  @dashboard @dashboardSmoke
  Scenario Outline: 创建仪表盘所用趋势图
    And open the "trend.ListPage" page for uri "/trend/"
    And I click the "NewTrendButton" button
#    And I click the "Create" button
    Then I will see the "trend.CreatePageDash" page
    And I set the parameter "SearchInput" with value "<spl>"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for "Header" will be visible
    And I click the "NextButton" button
    And I wait for loading invisible
    And I wait for "Header" will be visible
    And I click the "NextButton" button
    And I wait for "500" millsecond
    When I set the parameter "NameInput" with value "<name>"
    And I wait for "500" millsecond
    And I click the "Complete" button
    And I wait for "SuccessCreate" will be visible

    Examples:
      | spl                                                                                                                    | name   |
      | tag:sample04061424_display \| bucket timestamp span=30m as ts \| stats count() as cnt by apache.status,ts \| sort by cnt \| limit 20 | 仪表盘面积图 |

  @dashboard @dashboardSmoke
  Scenario Outline: 新建标签页
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "仪表盘<name>"
    And switch to window "仪表盘"
    And I close all tabs except main tab
    Then I will see the "dashboard.DetailPage" page
    When I set the parameter "TagName" with value "<name>"
    And I click the "EnsureCreateTagButton" button
    And I wait for loading complete
    And I back to before

    Examples:
      | name |
      | 面积图  |

  @dashboard @dashboardSmoke
  Scenario Outline: 添加图表
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "<name>"
    And switch to window "仪表盘"
    And I close all tabs except main tab
    Then I will see the "dashboard.DetailPage" page
    And I wait for "AddEventButton" will be visible
    When I click the "AddEventButton" button
    And I wait for "500" millsecond
    And I click the "AddChart" button
    And I wait for "SpinDot" will be invisible
    And I set the parameter "SearchChartInput" with value "<name>"
    And I wait for loading invisible
    And I click the "{'Checkbox':'<name>'}" button
    And I click the "Ensure" button

    Examples:
      | name   |
      | 仪表盘面积图 |

  @dashboard @dashboardSmoke
  Scenario Outline: 修改为面积图 RZY-302
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "<name>"
    And switch to window "仪表盘"
    And I close all tabs except main tab
    Then I will see the "dashboard.DetailPage" page
    And I wait for "Progress" will be invisible
    And I wait for "ChartType" will be visible
    And I click the "ChartType" button
    And I wait for "1000" millsecond
    Then I will see the "trend.CreatePageDash" page
    And I wait for "Order" will be visible
    And I click the "Order" button under some element
    And I click the "<targetName>" button
#    And I hide the element "Content"
    And I wait for "1000" millsecond
    And I click the "SettingChart" button under some element
    And I choose the "ts" from the "DataValue"
    And I wait for "1000" millsecond
    And I click the "DescendingOrder" button
    And I click the "ShowAllLabels" button
    And I click the "Yaxis" button
    And I choose the "cnt" from the "DataValue"
    And I wait for "1000" millsecond
    And I set the parameter "Unit" with value "个"
    And I wait for "1000" millsecond
    And I click the "Smooth" button
    And I wait for "1000" millsecond
    And I click the "ConnectEmptyData" button
    And I wait for "1000" millsecond
    And I set the parameter "Min" with value "10"
    And I set the parameter "Max" with value "220"
    And I wait for "1000" millsecond
    And I click the "Group" button
    And I click the "DataValue" button
    And I wait for "500" millsecond
    And I click the "CleanDatevalue" button
    And I wait for "1000" millsecond
    And I click the "Yaxis" button
    And I wait for "1000" millsecond
    And I click the "Group" button
#    And I move the mouse pointer to the "DataValue"
    And I choose the "apache.status" from the "DataValue"
    And I wait for "1000" millsecond
    And I click the "Pile" button
    And I click the "Exhibition" button
    And I click the "StartColour" button
    And I click the "Orange" button
    Then I click the "Generate" button
    And I wait for "1000" millsecond
    And I click the "SettingChart" button under some element
    Then I will see the "dashboard.DetailPage" page
    And I wait for "2000" millsecond
    And I click the "TrendTitle" button
    And I wait for "3000" millsecond

    Examples:
      | name   | targetName  |
      | 仪表盘面积图 | AreaChart |

#  @cleanDashboard
#  Scenario Outline: 删除仪表盘
#    Given open the "dashboard.ListPage" page for uri "/dashboard/"
#    When the data name is "<name>" then i click the "删除" button in more menu
#    And I wait for "Ensure" will be visible
#    And I click the "Ensure" button
#    And I wait for "500" millsecond
#    Then I will see the success message "删除仪表盘成功"
#
#    Examples:
#      | name   |
#      | 仪表盘面积图 |
#
#  @cleanDashboard
#  Scenario Outline: 删除仪表盘所建趋势图
#    Given open the "trend.ListPage" page for uri "/trend/"
#    When the data name is "<name>" then i click the "删除" button in more menu
#    And I wait for "Ensure" will be visible
#    And I click the "Ensure" button
#    And I wait for "500" millsecond
#    And I will see the success message "删除成功"
#
#    Examples:
#      | name   |
#      | 仪表盘面积图 |
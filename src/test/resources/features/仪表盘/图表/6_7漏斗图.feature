@dashboard23 @dashboardChart
Feature: 仪表盘_6_7_漏斗图

  @dashboard
  Scenario Outline: 新建仪表盘
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I click the "Create" button
    When I set the parameter "DashBoardName" with value "<name>"
    And I click the "Ensure" button
    Then I will see the success message "新建仪表盘成功"

    Examples:
      | name   |
      | 仪表盘漏斗图 |

  @dashboard
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
    When I set the parameter "NameInput" with value "<name>"
    And I click the "Complete" button
    And I wait for "SuccessCreate" will be visible

    Examples:
      | spl                                                         | name   |
      | tag:sample04061424_display \| stats count() by apache.clientip \| limit 8 | 仪表盘漏斗图 |

  @dashboard
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
      | 漏斗图  |

  @dashboard
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
      | 仪表盘漏斗图 |

  @dashboard
  Scenario Outline: 修改为漏斗图 RZY-3402
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "<name>"
    And switch to window "仪表盘"
    And I close all tabs except main tab
    Then I will see the "dashboard.DetailPage" page
    And I wait for "Progress" will be invisible
    And I click the "ChartType" button
    And I wait for "1000" millsecond
    Then I will see the "trend.CreatePageDash" page
    And I wait for "Other" will be visible
    And I click the "Other" button
    And I click the "Funnel" button
#    And I hide the element "Content"
    And I wait for "1000" millsecond
    And I click the "SettingChart" button under some element
    And I choose the "count()" from the "DataValue"
    And I click the "Divide" button
    And I choose the "apache.clientip" from the "DataValue"
    Then I click the "Generate" button
    And I wait for "1000" millsecond
#    Then I hide the element "SettingContent"
    And I click the "SettingChart" button under some element
    Then I will see the "dashboard.DetailPage" page
    And I wait for "2000" millsecond
    And I click the "TrendTitle" button

    Examples:
      | name   |
      | 仪表盘漏斗图 |

#  @cleanDashboard
#  Scenario Outline: 删除仪表盘
#    Given open the "dashboard.ListPage" page for uri "/dashboard/"
#    When the data name is "<name>" then i click the "删除" button in more menu
#    And I wait for "Ensure" will be visible
#    And I click the "Ensure" button
#    Then I will see the success message "删除仪表盘成功"
#
#    Examples:
#      | name   |
#      | 仪表盘漏斗图 |
#
#  @cleanDashboard
#  Scenario Outline: 删除仪表盘所建趋势图
#    Given open the "trend.ListPage" page for uri "/trend/"
#    When the data name is "<name>" then i click the "删除" button in more menu
#    And I wait for "Ensure" will be visible
#    And I click the "Ensure" button
#    And I will see the success message "删除成功"
#
#    Examples:
#      | name   |
#      | 仪表盘漏斗图 |
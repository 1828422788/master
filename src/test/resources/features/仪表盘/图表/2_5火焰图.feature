@dashboard24 @dashboardChart
Feature: 仪表盘_2_5_火焰图

  @dashboard @dashboardSmoke
  Scenario Outline: 新建仪表盘
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I click the "Create" button
    When I set the parameter "DashBoardName" with value "<name>"
    And I click the "Ensure" button
    Then I will see the success message "新建仪表盘成功"

    Examples:
      | name    |
      | 仪表盘火焰图 |

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
    And I wait for "5000" millsecond
    And I back to before

    Examples:
      | name |
      | 火焰图 |

  @dashboard @dashboardSmoke
  Scenario Outline: 创建仪表盘所用趋势图
    And open the "trend.ListPage" page for uri "/trend/"
    And I click the "NewTrendButton" button
#    And I click the "Create" button
    Then I will see the "trend.CreatePageDash" page
    And I set the parameter "SearchInput" with value "<spl>"
    And I wait for "500" millsecond
    And I click the "DateEditor" button
    And I click the "Today" button
#    And I click the "FenPianQuYang" button
#    And I alter the input element "FenPianQuYang" value to "0"
    And I wait for "1000" millsecond
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
      |   spl                                                                                                                                                                                                                                                                                  | name    |
      | starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424_chart AND (apache.status:200) AND NOT (apache.geo.city:黔东南苗族侗族自治州) AND NOT (apache.geo.city:南京市)   \| stats count() as cnt by apache.method, apache.status, apache.geo.province, apache.geo.city \| sort by apache.method, apache.status, apache.geo.province, apache.geo.city | 仪表盘火焰图 |

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
      | name    |
      | 仪表盘火焰图 |

  @dashboard @dashboardSmoke
  Scenario Outline: 修改为火焰图 RZY-4901
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
    And I wait for "Dimension" will be visible
    And I click the "Dimension" button
    And I click the "Flame" button
    And I click the "SettingChart" button under some element
    And I click the "Divide" button
    And I wait for "500" millsecond
    And I click the "DeleteFirst" button
    And I wait for "500" millsecond
    And I click the "DeleteFirst" button
    And I wait for "500" millsecond
    And I click the "Facet" button
    And I wait for "500" millsecond
    And I choose the "apache.method" from the "DataValue"
    And I wait for "1500" millsecond
    And I set the parameter "ColumnNum" with value "2"
    And I wait for "500" millsecond
    And I click the "Generate" button
    And I wait for "3000" millsecond
    And I click the "SettingChart" button under some element
    Then I will see the "dashboard.DetailPage" page
    And I wait for "2000" millsecond
    And I move the mouse pointer to the "TrendTitle"
    And I click the "TrendTitle" button
    And I wait for "3000" millsecond

    Examples:
      | name    |
      | 仪表盘火焰图 |

  @dashboard @dashboardSmoke
  Scenario Outline: 火焰图操作 RZY-4902
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "<name>"
    And switch to window "仪表盘"
    And I close all tabs except main tab
    Then I will see the "dashboard.DetailPage" page
    And I wait for "Progress" will be invisible
    And I click the Circle "ShanDong" button
    And I wait for "1000" millsecond
    Then I will see the text "四川" is not existed in page
    Then I will see the text "北京市" is not existed in page
    Then I will see the text "深圳市" exist in page
    Then I will see the text "济南市" exist in page
    And I wait for "1000" millsecond
    And I click the Circle "BackIcon" button
    Then I will see the text "四川" exist in page
    Then I will see the text "北京市" exist in page
    Then I will see the text "济南市" is not existed in page
    And I wait for "1000" millsecond

    Examples:
      | name    |
      | 仪表盘火焰图 |

#  @cleanDashboard
#  Scenario Outline: 删除仪表盘
#    Given open the "dashboard.ListPage" page for uri "/dashboard/"
#    When the data name is "<name>" then i click the "删除" button in more menu
#    And I wait for "Ensure" will be visible
#    And I click the "Ensure" button
#    Then I will see the success message "删除仪表盘成功"
#
#    Examples:
#      | name    |
#      | 仪表盘火焰图 |
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
#      | name    |
#      | 仪表盘火焰图 |
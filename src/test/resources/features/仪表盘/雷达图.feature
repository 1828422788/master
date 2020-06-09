Feature: 仪表盘雷达图

  @dashboard
  Scenario Outline: 新建仪表盘
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I click the "Create" button
    When I set the parameter "DashBoardName" with value "<name>"
    And I click the "Ensure" button
    Then I will see the success message "新建仪表盘成功"

    Examples:
      | name   |
      | 仪表盘雷达图 |

  @dashboard
  Scenario Outline: 创建仪表盘所用趋势图
    And open the "trend.ListPage" page for uri "/trend/"
    And I click the "CreateButton" button
    And I click the "Create" button
    Then I will see the "trend.CreatePage" page
    And I set the parameter "SearchInput" with value "<spl>"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for "Header" will be visible
    And I click the "NextButton" button
    And I wait for "Header" will be visible
    And I click the "NextButton" button
    When I set the parameter "NameInput" with value "<name>"
    And I click the "NextButton" button
    And I wait for "SuccessCreate" will be visible

    Examples:
      | spl                                                                        | name   |
      | tag:*display \| stats count() by apache.clientip,apache.status \| limit 10 | 仪表盘雷达图 |

  @dashboard
  Scenario Outline: 新建标签页
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I click the detail which name is "仪表盘<name>"
    Then I will see the "dashboard.DetailPage" page
    When I set the parameter "TagName" with value "<name>"
    And I click the "EnsureCreateTagButton" button
    And I wait for loading complete

    Examples:
      | name |
      | 雷达图  |

  @dashboard
  Scenario Outline: 添加图表
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I click the detail which name is "<name>"
    Then I will see the "dashboard.DetailPage" page
    And I wait for "AddEventButton" will be visible
    When I click the "AddEventButton" button
    And I click the "AddChart" button
    And I wait for "SpinDot" will be invisible
    And I set the parameter "SearchChartInput" with value "<name>"
    And I wait for loading invisible
    And I click the "{'Checkbox':'<name>'}" button
    And I click the "Ensure" button

    Examples:
      | name   |
      | 仪表盘雷达图 |

  @dashboard
  Scenario: 修改为雷达图
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I click the detail which name is "仪表盘雷达图"
    Then I will see the "dashboard.DetailPage" page
    And I wait for "Progress" will be invisible
    And I click the "ChartType" button
    Then I will see the "trend.CreatePage" page
    And I wait for "Other" will be visible
    And I click the "Other" button
    And I click the "Radar" button
    And I hide the element "Content"
    And I wait for "1000" millsecond
    And I click the "Setting" button under some element
    And I choose the "count()" from the "DataValue"
    And I click the "Indicator" button
    And I choose the "apache.clientip" from the "DataValue"
    And I click the "UnifiedMetric" button
    And I click the "Divide" button
    And I click the "AddField" button
    And I choose the "apache.clientip" from the "DataValue"
    Then I click the "Generate" button
    And I wait for "1000" millsecond
    Then I hide the element "SettingContent"
    Then I will see the "dashboard.DetailPage" page
    And I wait for "Progress" will be invisible
    And take part of "FullScreen" with name "dashboard/仪表盘雷达图"
    Then I compare source image "dashboard/仪表盘雷达图" with target image "dashboard/Radar"

  @cleanDashboard
  Scenario Outline: 删除仪表盘
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    When the data name is "<name>" then i click the "删除" button
    And I wait for "Ensure" will be visible
    And I click the "Ensure" button
    Then I will see the success message "删除仪表盘成功"

    Examples:
      | name   |
      | 仪表盘雷达图 |

  @cleanDashboard
  Scenario Outline: 删除仪表盘所建趋势图
    Given open the "trend.ListPage" page for uri "/trend/"
    When the data name is "<name>" then i click the "删除" button
    And I wait for "Ensure" will be visible
    And I click the "Ensure" button
    And I will see the success message "删除成功"

    Examples:
      | name   |
      | 仪表盘雷达图 |
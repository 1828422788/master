Feature: 仪表盘矩阵热力图

  @dashboard
  Scenario Outline: 新建仪表盘
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I click the "Create" button
    When I set the parameter "DashBoardName" with value "<name>"
    And I click the "Ensure" button
    Then I will see the success message "新建仪表盘成功"

    Examples:
      | name     |
      | 仪表盘矩阵热力图 |

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
      | spl                                                         | name     |
      | tag:sample04061424_display \| stats count() by apache.clientip \| limit 8 | 仪表盘矩阵热力图 |

  @dashboard
  Scenario Outline: 新建标签页
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "仪表盘<name>"
    Then I will see the "dashboard.DetailPage" page
    When I set the parameter "TagName" with value "<name>"
    And I click the "EnsureCreateTagButton" button
    And I wait for loading complete
    And I back to before

    Examples:
      | name  |
      | 矩阵热力图 |

  @dashboard
  Scenario: 添加图表
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "仪表盘矩阵热力图"
    Then I will see the "dashboard.DetailPage" page
    And I wait for "AddEventButton" will be visible
    When I click the "AddEventButton" button
    And I click the "AddChart" button
    And I wait for "SpinDot" will be invisible
    And I set the parameter "SearchChartInput" with value "仪表盘矩阵热力图"
    And I wait for loading invisible
    And I click the "{'Checkbox':'仪表盘矩阵热力图'}" button
    And I click the "Ensure" button

  @dashboard
  Scenario: 修改为矩阵热力图 RZY-3403
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "仪表盘矩阵热力图"
    Then I will see the "dashboard.DetailPage" page
    And I wait for "Progress" will be invisible
    And I click the "ChartType" button
    Then I will see the "trend.CreatePage" page
    And I wait for "Other" will be visible
    And I click the "Other" button under some element
    And I click the "Matrixheatmap" button
    And I hide the element "Content"
    And I wait for "1000" millsecond
    And I click the "Setting" button under some element
    And I choose the "apache.clientip" from the "DataValue"
    And I click the "Horizontal" button under some element
    And I click the "Yaxis" button
    And I choose the "count()" from the "DataValue"
    And I set the parameter "Segments" with value "10"
    Then I click the "Generate" button
    And I wait for "1000" millsecond
    Then I hide the element "SettingContent"
    Then I will see the "dashboard.DetailPage" page
    And I click the "TrendTitle" button
    And take part of "FullScreen" with name "dashboard/仪表盘矩阵热力图"
#    Then I compare source image "dashboard/仪表盘矩阵热力图" with target image "dashboard/Matrixheatmap"

  @cleanDashboard
  Scenario Outline: 删除仪表盘
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    When the data name is "<name>" then i click the "删除" button
    And I wait for "Ensure" will be visible
    And I click the "Ensure" button
    Then I will see the success message "删除仪表盘成功"

    Examples:
      | name     |
      | 仪表盘矩阵热力图 |

  @cleanDashboard
  Scenario Outline: 删除仪表盘所建趋势图
    Given open the "trend.ListPage" page for uri "/trend/"
    When the data name is "<name>" then i click the "删除" button
    And I wait for "Ensure" will be visible
    And I click the "Ensure" button
    And I will see the success message "删除成功"

    Examples:
      | name     |
      | 仪表盘矩阵热力图 |
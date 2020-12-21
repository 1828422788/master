Feature: 仪表盘环形比例图

  @dashboard @dashboardSmoke
  Scenario Outline: 新建仪表盘
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I click the "Create" button under some element
    When I set the parameter "DashBoardName" with value "<name>"
    And I click the "Ensure" button
    Then I will see the success message "新建仪表盘成功"

    Examples:
      | name     |
      | 仪表盘环形比例图 |

  @dashboard @dashboardSmoke
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
      | spl                                                          | name     |
      | appname:huawei \| stats count() as num \| eval p = num/28000 | 仪表盘环形比例图 |

  @dashboard @dashboardSmoke
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
      | 环形比例图 |

  @dashboard @dashboardSmoke
  Scenario Outline: 添加图表
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "<name>"
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
      | name     |
      | 仪表盘环形比例图 |

  @dashboard @dashboardSmoke
  Scenario: 修改为环形比例图 RZY-4388
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "仪表盘环形比例图"
    Then I will see the "dashboard.DetailPage" page
    And I wait for "Progress" will be invisible
    And I wait for "500" millsecond
    And I click the "ChartType" button
    And I wait for "1000" millsecond
    Then I will see the "trend.CreatePage" page
    And I wait for "2000" millsecond
    And I wait for "Other" will be visible
    And I click the "Other" button under some element
    And I click the "Annular" button
    And I hide the element "Content"
    And I wait for "1000" millsecond
    And I click the "Setting" button under some element
    And I choose the "p" from the "DataValue"
    And I click the "Compare" button
    And I click the "AddField" button
    And I choose the "p" from the "DataValue"
    And I click the "DivideSide" button
    And I click the "AddField" button
    And I choose the "num" from the "DataValue"
    And I set the parameter "LayoutRow" with value "2"
    And I set the parameter "LayoutColumn" with value "2"
    And I click the "Exhibition" button
    And I choose the "2" from the "DataPrecision"
    Then I click the "Generate" button
    And I wait for "1000" millsecond
    And I click the "Setting" button under some element
#    Then I hide the element "SettingContent"
    Then I will see the "dashboard.DetailPage" page
    And I click the "TrendTitle" button
    And I wait for "3000" millsecond
#    And take part of "FullScreen" with name "dashboard/仪表盘环形比例图"
#    Then I compare source image "dashboard/仪表盘环形比例图" with target image "dashboard/Annular"

  @dashboard @dashboardSmoke
  Scenario: 修改展示
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "仪表盘环形比例图"
    Then I will see the "dashboard.DetailPage" page
    And I wait for "Progress" will be invisible
    And I click the "ChartType" button
    Then I will see the "trend.CreatePage" page
    And I click the "Setting" button under some element
    And I wait for "1000" millsecond
    And I click the "Exhibition" button under some element
    And I click the "AccordingArea" button under some element
    And I wait for "MinRange" will be visible
    And I set the parameter "MinRange" with value "0.1"
    And I wait for "MaxRange" will be visible
    And I set the parameter "MaxRange" with value "0.2"
    And I click the "RangeColor" button
    And I wait for "Yellow" will be visible
    And I click the "Yellow" button
    And I choose the "3" from the "DataPrecision"
    Then I click the "Generate" button
    And I wait for "1000" millsecond
    Then I hide the element "SettingContent"
    Then I will see the "dashboard.DetailPage" page
    And I wait for "2000" millsecond
    And I click the "TrendTitle" button under some element
#    And take part of "FullScreen" with name "dashboard/仪表盘环形比例图修改展示区间"
#    Then I compare source image "dashboard/仪表盘环形比例图修改展示区间" with target image "dashboard/AnnularChangeRange"

  @cleanDashboard
  Scenario Outline: 删除仪表盘
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    When the data name is "<name>" then i click the "删除" button
    And I wait for "Ensure" will be visible
    And I click the "Ensure" button
    Then I will see the success message "删除仪表盘成功"

    Examples:
      | name     |
      | 仪表盘环形比例图 |

  @cleanDashboard
  Scenario Outline: 删除仪表盘所建趋势图
    Given open the "trend.ListPage" page for uri "/trend/"
    When the data name is "<name>" then i click the "删除" button
    And I wait for "Ensure" will be visible
    And I click the "Ensure" button
    And I will see the success message "删除成功"

    Examples:
      | name     |
      | 仪表盘环形比例图 |

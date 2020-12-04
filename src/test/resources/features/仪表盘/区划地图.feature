Feature: 仪表盘区划地图

  @dashboard @dashboardSmoke
  Scenario Outline: 新建仪表盘
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I click the "Create" button
    When I set the parameter "DashBoardName" with value "<name>"
    And I click the "Ensure" button
    Then I will see the success message "新建仪表盘成功"

    Examples:
      | name    |
      | 仪表盘区划地图 |

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
      | spl                                                                                            | name    |
      | tag:sample04061424 \| stats count() by apache.geo.country,apache.geo.province,apache.geo.city | 仪表盘区划地图 |

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
      | name |
      | 区划地图 |

  @dashboard @dashboardSmoke
  Scenario Outline: 添加图表
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
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
      | name    |
      | 仪表盘区划地图 |

  @dashboard @dashboardSmoke
  Scenario Outline: 修改为区划地图
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "<name>"
    Then I will see the "dashboard.DetailPage" page
    And I wait for "Progress" will be invisible
    And I click the "ChartType" button
    Then I will see the "trend.CreatePage" page
    And I wait for "Map" will be visible
    And I click the "Map" button
    And I click the "<targetName>" button
    And I hide the element "Content"
    And I wait for "1000" millsecond
    And I click the "Setting" button under some element
    And I choose the "count()" from the "DataValue"
    And I click the "Divide" button
    And I choose the "apache.geo.country" from the "DataValue"
    Then I click the "Generate" button
    And I wait for "1000" millsecond
    And I click the "Setting" button under some element
#    Then I hide the element "SettingContent"
#    And I wait for "Progress" will be invisible
    Then I will see the "dashboard.DetailPage" page
    And I wait for "2000" millsecond
    And I click the "TrendTitle" button
    And I wait for "3000" millsecond
#    And I wait for "1000" millsecond
#    Then I hide the element "SettingContent"
#    And I wait for "Progress" will be invisible
#    Then I will see the "dashboard.DetailPage" page
#    And I click the "TrendTitle" button
#    And take part of "FullScreen" with name "dashboard/<name>"
#    Then I compare source image "dashboard/<name>" with target image "dashboard/<targetName>"

    Examples:
      | name    | targetName |
      | 仪表盘区划地图 | Regionmap  |

  @dashboard @dashboardSmoke
  Scenario: 区划地图下钻 RZY-3399
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "仪表盘区划地图"
    Then I will see the "dashboard.DetailPage" page
    And I click the "SettingIcon" button
    And I switch the dashboard "OpenDrilldown" button to "enable"
#    And I click the "OpenDrilldown" button
    And I wait for "500" millsecond
    When the chart title is "仪表盘区划地图" then I click the button which classname is "anticon css-ifnfqv ant-dropdown-trigger" in dashboard
    And I click the "DrillSetting" button
    And I choose the "地图向下钻取" from the "DrillAction"
    And I wait for "1000" millsecond
    And I choose the "apache.geo.province" from the "ProvinceDrillAction"
    And I wait for "1000" millsecond
    And I choose the "apache.geo.city" from the "CityDrillAction"
    And I click the "Ensure" button
    And I click the "ChinaPoint" button
    And I wait for "NeimengguText" will be visible
    And I click the "Neimenggu" button
    And I wait for "TongliaoshiText" will be visible

  @dashboard @dashboardSmoke
  Scenario Outline: 地图下钻 RZY-3769
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "<name>"
    Then I will see the "dashboard.DetailPage" page
    When the chart title is "<name>" then I click the button which classname is "anticon css-ifnfqv ant-dropdown-trigger" in dashboard
    And I click the "Edit" button
    Then I will see the "TextLayer" result will contain "<json>"

    Examples:
      | name        | json                                                                                                                                                                                                                                                                                                                                                                           |
      | 仪表盘区划地图 |  \n  "drilldown": {\n    "type": "map"\n  } |

  @cleanDashboard
  Scenario Outline: 删除仪表盘
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    When the data name is "<name>" then i click the "删除" button
    And I wait for "Ensure" will be visible
    And I click the "Ensure" button
    Then I will see the success message "删除仪表盘成功"

    Examples:
      | name    |
      | 仪表盘区划地图 |

  @cleanDashboard
  Scenario Outline: 删除仪表盘所建趋势图
    Given open the "trend.ListPage" page for uri "/trend/"
    When the data name is "<name>" then i click the "删除" button
    And I wait for "Ensure" will be visible
    And I click the "Ensure" button
    And I will see the success message "删除成功"

    Examples:
      | name    |
      | 仪表盘区划地图 |
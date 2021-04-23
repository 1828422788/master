Feature: 仪表盘循序图

  @dashboard
  Scenario Outline: 新建仪表盘
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I click the "Create" button
    When I set the parameter "DashBoardName" with value "<name>"
    And I click the "Ensure" button
    Then I will see the success message "新建仪表盘成功"

    Examples:
      | name   |
      | 仪表盘循序图 |

  @dashboard
  Scenario Outline: 创建仪表盘所用趋势图
    And open the "trend.ListPage" page for uri "/trend/"
    And I click the "NewTrendButton" button
#    And I click the "Create" button
    Then I will see the "trend.CreatePageDash" page
    And I wait for "2000" millsecond
    And I set the parameter "SearchInput" with value "<spl>"
    And I click the "DateEditor" button
    And I click the "Today" button
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
      | spl                                                                                                        | name   |
      | tag:sample04061424_chart \|sort by +apache.clientip\| stats count() by hostname,apache.clientip \|limit 5  | 仪表盘循序图 |

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
      | name |
      | 循序图  |

  @dashboard
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
      | name   |
      | 仪表盘循序图 |

  @dashboard
  Scenario Outline: 修改为循序图 RZY-3757,RZY-315
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "<name>"
    Then I will see the "dashboard.DetailPage" page
    And I wait for "Progress" will be invisible
    And I wait for "500" millsecond
    And I click the "ChartType" button
    And I wait for "1000" millsecond
    Then I will see the "trend.CreatePageDash" page
    And I wait for "2000" millsecond
    And I wait for "Other" will be visible
    And I click the "Other" button under some element
    And I wait for "<image>" will be visible
    And I click the "<image>" button
#    And I hide the element "Content"
    And I wait for "1000" millsecond
    And I click the "SettingChart" button under some element
    And I choose the "hostname" from the "DataValue"
    And I wait for "500" millsecond
    And I click the "Source" button
    And I choose the "apache.clientip" from the "DataValue"
    And I wait for "500" millsecond
    And I click the "Target" button
    And I choose the "hostname" from the "DataValue"
    And I wait for "500" millsecond
    And I click the "Divide" button
    And I choose the "apache.clientip" from the "DataValue"
    And I wait for "500" millsecond
    And I click the "Mark" button
    And I choose the "apache.clientip" from the "DataValue"
    And I wait for "500" millsecond
    Then I click the "Generate" button
    And I wait for "1000" millsecond
    And I click the "SettingChart" button under some element
#    Then I hide the element "SettingContent"
    Then I will see the "dashboard.DetailPage" page
    And I wait for "2000" millsecond
    And I click the "TrendTitle" button under some element
    And I wait for "3000" millsecond
#    And take part of "FullScreen" with name "dashboard/<name>"
#    Then I compare source image "dashboard/<name>" with target image "dashboard/<image>"

    Examples:
      | name   | image    |
      | 仪表盘循序图 | Sequence |

  @dashboard
  Scenario Outline: 验证配置是否在高级编辑中体现 RZY-3757 RZY-1366
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "<name>"
    Then I will see the "dashboard.DetailPage" page
    When the chart title is "<name>" then I click the button which classname is "yotta-icon yotta-icon-DotEmblemOutlined" in dashboard
    And I click the "Edit" button
#    Then I will see the "TextLayer" result will be "<json>"
    Then I will see the dashboard highEditor text will contain "<json>"

    Examples:
      | name   | json                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 |
      | 仪表盘循序图 | \n  "chart": {\n    "chartType": "sequence",\n    "field": "hostname",\n    "fromField": "apache.clientip",\n    "toField": "hostname",\n    "labelField": "apache.clientip",\n    "category": "apache.clientip"\n  }\n} |

  @dashboard
  Scenario Outline: 两个字段为同一个值 RZY-1365:
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "<name>"
    Then I will see the "dashboard.DetailPage" page
    When the chart title is "<name>" then I click the button which classname is "yotta-icon yotta-icon-DotEmblemOutlined" in dashboard
    And I click the "Edit" button
    Then I set the parameter "<json>" to json editor
    And I wait for "500" millsecond
    And I click the "Check" button
    Then I will see the success message "校验通过"
    Then I click the "Ensure" button
    Then I wait for element "SuccessMessage" change text to "配置成功"
    And I wait for "2000" millsecond
    And take part of "FullScreen" with name "dashboard/<name>1365"
#    Then I compare source image "dashboard/<name>1365" with target image "dashboard/Sequence1365"

    Examples:
      | name   | json                                                                                                                                                                                                                                                                                                                                                                          |
      | 仪表盘循序图 | {"title": "仪表盘循序图","description": "","x": 0,"y": 0,"w": 12,"h": 5,"search": {"query": "tag:sample04061424_chart \| stats count() by hostname,apache.clientip \|limit 5","startTime": "now/d","endTime": "now"},"chart": {"chartType": "sequence","field": "hostname","fromField": "hostname","toField": "hostname","labelField": "apache.clientip","category": "apache.clientip"}} |

  @cleanDashboard
  Scenario Outline: 删除仪表盘
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    When the data name is "<name>" then i click the "删除" button in more menu
    And I wait for "Ensure" will be visible
    And I click the "Ensure" button
    Then I will see the success message "删除仪表盘成功"

    Examples:
      | name   |
      | 仪表盘循序图 |

  @cleanDashboard
  Scenario Outline: 删除仪表盘所建趋势图
    Given open the "trend.ListPage" page for uri "/trend/"
    When the data name is "<name>" then i click the "删除" button in more menu
    And I wait for "Ensure" will be visible
    And I click the "Ensure" button
    And I will see the success message "删除成功"

    Examples:
      | name   |
      | 仪表盘循序图 |
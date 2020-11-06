@dashboard
Feature: 仪表盘区间图

  @dashboard @dashboardSmoke
  Scenario Outline: 新建仪表盘
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I click the "Create" button
    When I set the parameter "DashBoardName" with value "<name>"
    And I click the "Ensure" button
    Then I will see the success message "新建仪表盘成功"

    Examples:
      | name   |
      | 仪表盘区间图 |

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
      | spl                                                                                                                        | name   |
      | tag:*display \| bucket timestamp span=1h as ts \| stats count('apache.status') as 'count' by ts \| esma count timefield=ts | 仪表盘区间图 |

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
      | 区间图  |

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
      | name   |
      | 仪表盘区间图 |

  @dashboard @dashboardSmoke
  Scenario Outline: 修改为区间图 RZY-308
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "<name>"
    Then I will see the "dashboard.DetailPage" page
    And I wait for "Progress" will be invisible
    And I wait for "500" millsecond
    And I click the "ChartType" button
    Then I will see the "trend.CreatePage" page
    And I wait for "Compound" will be visible
    And I click the "Compound" button
    And I click the "<targetName>" button
    And I hide the element "Content"
    And I wait for "3000" millsecond
    And I click the "Setting" button under some element
    And I choose the "ts" from the "DataValue"
    And I click the "Yaxis" button
    And I choose the "count" from the "Actual"
    And I choose the "_predict_count" from the "Predict"
    And I choose the "upper95" from the "TopLimit"
    And I choose the "lower95" from the "LowerLimit"
    Then I click the "Generate" button
    And I wait for "1000" millsecond
    Then I hide the element "SettingContent"
    And I wait for "Progress" will be invisible
    Then I will see the "dashboard.DetailPage" page
    And I click the "TrendTitle" button
    And take part of "FullScreen" with name "dashboard/<name>"
#    Then I compare source image "dashboard/<name>" with target image "dashboard/<targetName>"

    Examples:
      | name   | targetName |
      | 仪表盘区间图 | Rangeline  |

  @dashboard
  Scenario Outline: 验证配置是否在高级编辑中体现 RZY-3703
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "<name>"
    Then I will see the "dashboard.DetailPage" page
    When the chart title is "<name>" then I click the button which classname is "anticon css-ifnfqv ant-dropdown-trigger" in dashboard
    And I click the "Edit" button
    Then I will see the "TextLayer" result will contain "<json>"
#    Then I will see the "TextLayer" result will be "<json>"

    Examples:
      | name    | json                                                                                                                                                                                                                                                                                                                                                                           |
      | 仪表盘区间图 |  \n  "chart": {\n    "chartType": "rangeline",\n    "xAxis": {\n      "field": "ts"\n    },\n    "precision": "",\n    "yAxis": {\n      "field": "count",\n      "predictField": "_predict_count",\n      "anomalyField": ""\n    },\n    "boundary": {\n      "upperField": "upper95",\n      "lowerField": "lower95"\n    } |

  @dashboard
  Scenario: 修改chartType为其他值 RZY-3704
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "仪表盘区间图"
    Then I will see the "dashboard.DetailPage" page
    And I wait for "500" millsecond
    When the chart title is "仪表盘区间图" then I click the button which classname is "anticon css-ifnfqv ant-dropdown-trigger" in dashboard
    And I click the "Edit" button
    And I set the parameter "{"title": "仪表盘区间图","description": "","x": 0,"y": 0,"w": 12,"h": 5,"search": {"query": "tag:*display | bucket timestamp span=1h as ts | stats count('apache.status') as 'count' by ts | esma count timefield=ts","startTime": "now/d","endTime": "now"},"chart": {"chartType": "qwertyuiop","xAxis": {"field": "ts"},"precision": "","yAxis": {"field": "count","predictField": "_predict_count","anomalyField": ""},"boundary": {"upperField": "upper95","lowerField": "lower95"}}}" to json editor
    And I wait for "500" millsecond
    And I click the "Check" button
    Then I wait for element "ErrorMessage" change text to "chart -> chartType 字段值不支持qwertyuiop"

  @dashboard
  Scenario: 修改yAxis:field为不存在 RZY-3706
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "仪表盘区间图"
    Then I will see the "dashboard.DetailPage" page
    And I wait for "500" millsecond
    When the chart title is "仪表盘区间图" then I click the button which classname is "anticon css-ifnfqv ant-dropdown-trigger" in dashboard
    And I click the "Edit" button
    And I set the parameter "{"title": "仪表盘区间图","description": "","x": 0,"y": 0,"w": 12,"h": 5,"search": {"query": "tag:*display | bucket timestamp span=1h as ts | stats count('apache.status') as 'count' by ts | esma count timefield=ts","startTime": "now/d","endTime": "now"},"chart": {"chartType": "rangeline","xAxis": {"field": "ts"},"precision": "","yAxis": {"field": "countqwerty","predictField": "","anomalyField": ""},"boundary": {"upperField": "upper95","lowerField": "lower95"}}}" to json editor
    And I wait for "500" millsecond
    And I click the "Check" button
    Then I will see the success message "校验通过"
    And I click the "Ensure" button
    Then I wait for element "SuccessMessage" change text to "配置成功"
    And I wait for "2000" millsecond
    Then I wait for "NoData" will be visible

  @cleanDashboard
  Scenario Outline: 删除仪表盘
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    When the data name is "<name>" then i click the "删除" button
    And I wait for "Ensure" will be visible
    And I click the "Ensure" button
    And I wait for "500" millsecond
    Then I will see the success message "删除仪表盘成功"

    Examples:
      | name   |
      | 仪表盘区间图 |

  @cleanDashboard
  Scenario Outline: 删除仪表盘所建趋势图
    Given open the "trend.ListPage" page for uri "/trend/"
    When the data name is "<name>" then i click the "删除" button
    And I wait for "Ensure" will be visible
    And I click the "Ensure" button
    And I wait for "500" millsecond
    And I will see the success message "删除成功"

    Examples:
      | name   |
      | 仪表盘区间图 |
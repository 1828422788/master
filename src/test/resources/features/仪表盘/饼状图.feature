Feature: 仪表盘饼状图

  @dashboard @dashboardSmoke
  Scenario Outline: 新建仪表盘
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I click the "Create" button
    When I set the parameter "DashBoardName" with value "<name>"
    And I click the "Ensure" button
    Then I will see the success message "新建仪表盘成功"

    Examples:
      | name   |
      | 仪表盘饼状图 |

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
      | spl                                                                          | name   |
      | tag:sample04061424_display \| stats count() by apache.clientip,apache.resp_len \| limit 10 | 仪表盘饼状图 |

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
      | 饼状图  |

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
      | 仪表盘饼状图 |

  @dashboard @dashboardSmoke
  Scenario Outline: 修改为饼状图 RZY-298
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "<name>"
    Then I will see the "dashboard.DetailPage" page
    And I wait for "Progress" will be invisible
    And I click the "ChartType" button
    Then I will see the "trend.CreatePage" page
    And I wait for "Dimension" will be visible
    And I click the "Dimension" button under some element
    And I click the "<targetName>" button
    And I hide the element "Content"
    And I wait for "1000" millsecond
    And I click the "Setting" button under some element
    And I choose the "count()" from the "DataValue"
    And I click the "Divide" button
    And I click the "AddField" button
    And I choose the "apache.clientip" from the "DataValue"
    Then I click the "Generate" button
    And I wait for "1000" millsecond
    And I click the "Setting" button under some element
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
      | name   | targetName |
      | 仪表盘饼状图 | Pie  |

  @dashboard
  Scenario Outline: 验证配置是否在高级编辑中体现 RZY-3695
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
      | 仪表盘饼状图 |  \n  "chart": {\n    "chartType": "pie",\n    "field": "count()",\n    "byFields": [\n      "apache.clientip"\n    ],\n    "precision": "",\n    "useFlameDrillDown": false\n  } |

  @dashboard
  Scenario: 修改为不存在的字段 RZY-3697
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "仪表盘饼状图"
    Then I will see the "dashboard.DetailPage" page
    And I wait for "500" millsecond
    Then I wait for "PieData" will be visible
    When the chart title is "仪表盘饼状图" then I click the button which classname is "anticon css-ifnfqv ant-dropdown-trigger" in dashboard
    And I click the "Edit" button
    Then I set the parameter "{"title": "仪表盘饼状图","description": "","x": 0,"y": 0,"w": 12,"h": 5,"search": {"query": "tag:sample04061424_display | stats count() by apache.clientip,apache.resp_len | limit 10","startTime": "now/d","endTime": "now"},"chart": {"chartType": "pie","field": "count()qwert","byFields": ["apache.resp_lenasdfg"],"precision": "","useFlameDrillDown": false}}" to json editor
    And I wait for "500" millsecond
    And I click the "Check" button
    Then I will see the success message "校验通过"
    Then I click the "Ensure" button
    And I wait for "3000" millsecond
    Then I will see the "PieData" is not exist

  @dashboard @dashboardSmoke
  Scenario Outline: chartType字段 RZY-1317,RZY-1318,RZY-1319,RZY-3692
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "仪表盘饼状图"
    Then I will see the "dashboard.DetailPage" page
    And I wait for "Progress" will be invisible
    When the chart title is "仪表盘饼状图" then I click the button which classname is "anticon css-ifnfqv ant-dropdown-trigger" in dashboard
    And I click the "Edit" button
    Then I set the parameter "{  "title": "仪表盘饼状图",  "description": "",  "x": 0,  "y": 0,  "w": 12,  "h": 5,  "search": {    "query": "tag:sample04061424_display | stats count() by apache.clientip,apache.resp_len | limit 10",    "startTime": "now/d",    "endTime": "now"  },  "chart": {    "chartType": "<chartType>",    "field": "count()",    "byFields": [      "apache.clientip"    ],    "precision": "",    "useFlameDrillDown": false  }}" to json editor
    And I wait for "500" millsecond
    And I click the "Check" button
    And I wait for "500" millsecond
    Then I will see the success message "校验通过"
    And I wait for "500" millsecond
    Then I click the "Ensure" button
    And I wait for loading invisible
    And I wait for "2000" millsecond
    Then take part of "DimensionChart" with name "actual/<image>"
    And I compare source image "actual/<image>" with target image "expect/<image>"

    Examples:
      | chartType |   image                |
      | rose      | 维度图_chartType_rose  |
      | bar      | 维度图_chartType_bar   |
      | sunburst  | 维度图_chartType_sunburst  |
      | pie     | 维度图_chartType_pie   |

  @dashboard @dashboardSmoke
  Scenario Outline: field byFields RZY-3696
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "仪表盘饼状图"
    Then I will see the "dashboard.DetailPage" page
    And I wait for "Progress" will be invisible
    When the chart title is "仪表盘饼状图" then I click the button which classname is "anticon css-ifnfqv ant-dropdown-trigger" in dashboard
    And I click the "Edit" button
    Then I set the parameter "{  "title": "仪表盘饼状图",  "description": "",  "x": 0,  "y": 0,  "w": 12,  "h": 5,  "search": {    "query": "tag:sample04061424_display | stats count() by apache.clientip,apache.resp_len | limit 10",    "startTime": "now/d",    "endTime": "now"  },  "chart": {    "chartType": "pie",    "field": "<field>",    "byFields": [      "<byField>"    ],    "precision": "",    "useFlameDrillDown": false  }}" to json editor
    And I wait for "500" millsecond
    And I click the "Check" button
    Then I will see the success message "校验通过"
    And I wait for "500" millsecond
    Then I click the "Ensure" button
    And I wait for loading invisible
    And I wait for "2000" millsecond
    Then take part of "DimensionChart" with name "actual/<image>"
#    And I compare source image "actual/<image>" with target image "expect/<image>"

    Examples:
      | field         | byField               |   image                 |
      | count()       | apache.resp_len       | 维度图_byField_existed   |
#      | count()qwerty | apache.resp_lenasdfg  | 维度图_byField_noexisted |

  @cleanDashboard
  Scenario Outline: 删除仪表盘
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    When the data name is "<name>" then i click the "删除" button
    And I wait for "Ensure" will be visible
    And I click the "Ensure" button
    And I wait for "500" millsecond
    Then I will see the success message "删除仪表盘成功"

    Examples:
      | name   |
      | 仪表盘饼状图 |

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
      | 仪表盘饼状图 |
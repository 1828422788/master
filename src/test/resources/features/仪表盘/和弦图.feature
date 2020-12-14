Feature: 仪表盘和弦图

  @dashboard @dashboardSmoke
  Scenario Outline: 新建仪表盘
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I click the "Create" button
    When I set the parameter "DashBoardName" with value "<name>"
    And I click the "Ensure" button
    Then I will see the success message "新建仪表盘成功"

    Examples:
      | name   |
      | 仪表盘和弦图 |

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
      | spl                                                                                                                                                                                                            | name   |
      | tag:sample04061424_display \| stats count() by apache.clientip,apache.x_forward,apache.resp_len,apache.method \| rename apache.clientip as apache.x_forward_group\| rename apache.method as apache.resp_len_group\| limit 20 | 仪表盘和弦图 |

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
      | 和弦图  |

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
      | 仪表盘和弦图 |

  @dashboard @dashboardSmoke
  Scenario Outline: 修改为和弦图 RZY-305
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "<name>"
    Then I will see the "dashboard.DetailPage" page
    And I wait for "Progress" will be invisible
    And I click the "ChartType" button
    And I wait for "1000" millsecond
    Then I will see the "trend.CreatePage" page
    And I wait for "2000" millsecond
    And I wait for "Relation" will be visible
    And I click the "Relation" button
    And I click the "<targetName>" button
    And I hide the element "Content"
    And I wait for "2000" millsecond
    And I click the "Setting" button under some element
    And I choose the "apache.x_forward" from the "DataValue"
    And I wait for "1000" millsecond
    And I click the "Target" button
    And I choose the "apache.resp_len" from the "DataValue"
    And I wait for "1000" millsecond
    And I click the "Weight" button
    And I choose the "count()" from the "DataValue"
    And I wait for "1000" millsecond
    Then I click the "Generate" button
    And I wait for "1000" millsecond
    And I click the "Setting" button under some element
#    Then I hide the element "SettingContent"
#    And I wait for "Progress" will be invisible
    Then I will see the "dashboard.DetailPage" page
    And I wait for "2000" millsecond
    And I click the "TrendTitle" button
    And I wait for "3000" millsecond
#    And take part of "FullScreen" with name "dashboard/<name>"
#    Then I compare source image "dashboard/<name>" with target image "dashboard/<targetName>"

    Examples:
      | name   | targetName |
      | 仪表盘和弦图 | Chord      |

  @dashboard
  Scenario Outline: 验证配置是否在高级编辑中体现 RZY-3698
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
      | 仪表盘和弦图 |  \n  "chart": {\n    "chartType": "chord",\n    "fromField": "apache.x_forward",\n    "toField": "apache.resp_len",\n    "weightField": "count()",\n    "repulsionField": 8,\n    "precision": ""\n  } |

  @dashboard @dashboardSmoke
  Scenario Outline: chartType字段 RZY-1321,RZY-1322,RZY-1323
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "仪表盘和弦图"
    Then I will see the "dashboard.DetailPage" page
    And I wait for "Progress" will be invisible
    When the chart title is "仪表盘和弦图" then I click the button which classname is "anticon css-ifnfqv ant-dropdown-trigger" in dashboard
    And I click the "Edit" button
    Then I set the parameter "{  "title": "仪表盘和弦图",  "description": "",  "x": 0,  "y": 0,  "w": 12,  "h": 5,  "search": {    "query": "tag:*display | stats count() by apache.clientip,apache.x_forward,apache.resp_len,apache.method | rename apache.clientip as apache.x_forward_group| rename apache.method as apache.resp_len_group| limit 20",    "startTime": "now/d",    "endTime": "now"  },  "chart": {    "chartType": "<chartType>",    "fromField": "apache.x_forward",    "toField": "apache.resp_len",    "weightField": "count()",    "repulsionField": 8,    "precision": ""  }}" to json editor
    And I wait for "500" millsecond
    And I click the "Check" button
    Then I will see the success message "校验通过"
    And I wait for "500" millsecond
    Then I click the "Ensure" button
    And I wait for loading invisible
    And I wait for "2000" millsecond
    Then take part of "ChordChart" with name "actual/<image>"
    And I compare source image "actual/<image>" with target image "expect/<image>"

    Examples:
      | chartType |   image                |
      | force     | 和弦图_chartType_force  |
      | sankey    | 和弦图_chartType_sankey |
      | chord     | 和弦图_chartType_chord  |

  @dashboard @dashboardSmoke
  Scenario: 交换fromField和toField字段 RZY-1324
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "仪表盘和弦图"
    Then I will see the "dashboard.DetailPage" page
    And I wait for "Progress" will be invisible
    When the chart title is "仪表盘和弦图" then I click the button which classname is "anticon css-ifnfqv ant-dropdown-trigger" in dashboard
    And I click the "Edit" button
    Then I set the parameter "{  "title": "仪表盘和弦图",  "description": "",  "x": 0,  "y": 0,  "w": 12,  "h": 5,  "search": {    "query": "tag:*display | stats count() by apache.clientip,apache.x_forward,apache.resp_len,apache.method | rename apache.clientip as apache.x_forward_group| rename apache.method as apache.resp_len_group| limit 20",    "startTime": "now/d",    "endTime": "now"  },  "chart": {    "chartType": "sankey",    "fromField": "apache.resp_len",    "toField": "apache.x_forward",    "weightField": "count()",    "repulsionField": 8,    "precision": ""  }}" to json editor
    And I wait for "500" millsecond
    And I click the "Check" button
    Then I will see the success message "校验通过"
    And I wait for "500" millsecond
    Then I click the "Ensure" button
    And I wait for loading invisible
    And I wait for "2000" millsecond
    Then take part of "ChordChart" with name "actual/和弦图_fromField_toField"
    And I compare source image "actual/和弦图_fromField_toField" with target image "expect/和弦图_fromField_toField"

  @dashboard @dashboardSmoke
  Scenario: weightField字段修改为不存在的值 RZY-3701
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "仪表盘和弦图"
    Then I will see the "dashboard.DetailPage" page
    And I wait for "Progress" will be invisible
    When the chart title is "仪表盘和弦图" then I click the button which classname is "anticon css-ifnfqv ant-dropdown-trigger" in dashboard
    And I click the "Edit" button
    Then I set the parameter "{  "title": "仪表盘和弦图",  "description": "",  "x": 0,  "y": 0,  "w": 12,  "h": 5,  "search": {    "query": "tag:*display | stats count() by apache.clientip,apache.x_forward,apache.resp_len,apache.method | rename apache.clientip as apache.x_forward_group| rename apache.method as apache.resp_len_group| limit 20",    "startTime": "now/d",    "endTime": "now"  },  "chart": {    "chartType": "chord",    "fromField": "apache.x_forward",    "toField": "apache.resp_len",    "weightField": "qwertcount()",    "repulsionField": 8,    "precision": ""  }}" to json editor
    And I wait for "500" millsecond
    And I click the "Check" button
    Then I will see the success message "校验通过"
    And I wait for "500" millsecond
    Then I click the "Ensure" button
    And I wait for loading invisible
    And I wait for "2000" millsecond
    Then take part of "ChordChart" with name "actual/和弦图_weightField"
    And I compare source image "actual/和弦图_weightField" with target image "expect/和弦图_weightField"

  @cleanDashboard
  Scenario Outline: 删除仪表盘
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    When the data name is "<name>" then i click the "删除" button
    And I wait for "Ensure" will be visible
    And I click the "Ensure" button
    Then I will see the success message "删除仪表盘成功"

    Examples:
      | name   |
      | 仪表盘和弦图 |

  @cleanDashboard
  Scenario Outline: 删除仪表盘所建趋势图
    Given open the "trend.ListPage" page for uri "/trend/"
    When the data name is "<name>" then i click the "删除" button
    And I wait for "Ensure" will be visible
    And I click the "Ensure" button
    And I wait for "500" millsecond
    And I will see the success message "删除成功"

    Examples:
      | name       |
      | 仪表盘和弦图 |
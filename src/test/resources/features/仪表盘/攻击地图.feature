Feature: 仪表盘攻击地图

  @dashboard @dashboardSmoke
  Scenario Outline: 新建仪表盘
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I click the "Create" button
    When I set the parameter "DashBoardName" with value "<name>"
    And I click the "Ensure" button
    Then I will see the success message "新建仪表盘成功"

    Examples:
      | name    |
      | 仪表盘攻击地图 |

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
      | spl                                                                                                                                                                                                                                                                                    | name    |
      | tag:sample04061424_chart \| parse field=apache.request_query \"^gw_address=(?<gw_address>\\\d+\\\.\\\d+\\\.\\\d+\\\.\\\d+)\" \| stats count() as cnt, min(apache.geo.latitude) as client_lat, min(apache.geo.longitude) as client_lon by apache.clientip, gw_address \| eval gw_lat=39.5427 \| eval gw_lon=116.2317 | 仪表盘攻击地图 |

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
      | 攻击地图 |

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
      | 仪表盘攻击地图 |

  @dashboard @dashboardSmoke
  Scenario Outline: 修改为攻击地图 RZY-314,RZY-3761
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "<name>"
    Then I will see the "dashboard.DetailPage" page
    And I wait for "Progress" will be invisible
    And I wait for "500" millsecond
    And I click the "ChartType" button
    Then I will see the "trend.CreatePage" page
    And I wait for "2000" millsecond
    And I wait for "Map" will be visible
    And I click the "Map" button
    And I click the "<targetName>" button
    And I hide the element "Content"
    And I wait for "1000" millsecond
    And I click the "Setting" button under some element
    And I choose the "apache.clientip" from the "DataValue"
    And I choose the "client_lon" from the "Longitude"
    And I choose the "client_lat" from the "Latitude"
    And I click the "Target" button
    And I choose the "gw_address" from the "DataValue"
    And I choose the "gw_lon" from the "Longitude"
    And I choose the "gw_lat" from the "Latitude"
    And I click the "Weight" button
    And I choose the "cnt" from the "DataValue"
    Then I click the "Generate" button
    And I wait for "1000" millsecond
    And I click the "Setting" button under some element
#    Then I hide the element "SettingContent"
#    And I wait for "Progress" will be invisible
    Then I will see the "dashboard.DetailPage" page
    And I wait for "2000" millsecond
    And I click the "TrendTitle" button under some element
    And I wait for "3000" millsecond
#    And take part of "FullScreen" with name "dashboard/<name>"
#    Then I compare source image "dashboard/<name>" with target image "dashboard/<targetName>"

    Examples:
      | name    | targetName |
      | 仪表盘攻击地图 | Attackmap  |

  @dashboard
  Scenario Outline: 验证配置是否在高级编辑中体现 RZY-3761
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
      | 仪表盘攻击地图 |  \n  "chart": {\n    "chartType": "attackmap",\n    "from": {\n      "field": "apache.clientip",\n      "longitudeField": "client_lon",\n      "latitudeField": "client_lat"\n    },\n    "to": {\n      "field": "gw_address",\n      "longitudeField": "gw_lon",\n      "latitudeField": "gw_lat"\n    },\n    "weight": {\n      "field": "cnt"\n    } |
#      | 仪表盘攻击地图 | {\n  "title": "仪表盘攻击地图",\n  "description": "",\n  "x": 0,\n  "y": 0,\n  "w": 12,\n  "h": 5,\n  "search": {\n    "query": "tag:sample* \| parse field=apache.request_query \\"^gw_address=(?<gw_address>,\n    "startTime": "now/d",\n    "endTime": "now"\n  },\n  "chart": {\n    "chartType": "attackmap",\n    "from": {\n      "field": "apache.clientip",\n      "longitudeField": "client_lon",\n      "latitudeField": "client_lat"\n    },\n    "to": {\n      "field": "gw_address",\n      "longitudeField": "gw_lon",\n      "latitudeField": "gw_lat"\n    },\n    "weight": {\n      "field": "cnt"\n    } |

  @cleanDashboard
  Scenario Outline: 删除仪表盘
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    When the data name is "<name>" then i click the "删除" button
    And I wait for "Ensure" will be visible
    And I click the "Ensure" button
    Then I will see the success message "删除仪表盘成功"

    Examples:
      | name    |
      | 仪表盘攻击地图 |

  @cleanDashboard
  Scenario Outline: 删除仪表盘所建趋势图
    Given open the "trend.ListPage" page for uri "/trend/"
    When the data name is "<name>" then i click the "删除" button
    And I wait for "Ensure" will be visible
    And I click the "Ensure" button
    And I will see the success message "删除成功"

    Examples:
      | name    |
      | 仪表盘攻击地图 |
@dashboard5_1 @dashboardChart
Feature: 仪表盘_5_1_热力地图

  Background:
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I set the parameter "TextFilter" with value "仪表盘热力地图"
    And I wait for loading invisible
    And I click the detail which name is "仪表盘热力地图"
    And switch to window "仪表盘"
    And I close all tabs except main tab
    Then I will see the "dashboard.DetailPage" page
    And I click the "SettingIcon" button
    And I switch the dashboard "OpenEdit" button to "enable"
    And I click the "SettingIcon" button
    And I wait for "SuccessMessage" will be invisible

  Scenario Outline: 修改为热力地图 RZY-313
    And I click the "ChartType" button
    And I wait for "1000" millsecond
    Then I will see the "trend.CreatePageDash" page
    And I wait for "Map" will be visible
    And I click the "Map" button
    And I click the "<targetName>" button
    And I wait for "1000" millsecond
    And I click the "SettingChart" button
    And I choose the "count()" from the "DataValue"
    And I click the "Divide" button
#    And I choose the "apache.geo.city" from the "DataValue"
    Then I click the "Generate" button
    And I wait for "1000" millsecond
    And I click the "SettingChart" button
    Then I will see the "dashboard.DetailPage" page
    And I wait for "2000" millsecond
    And I click the "TrendTitle" button

    Examples:
      | name    | targetName |
      | 仪表盘热力地图 | Heatmap    |

  Scenario Outline: 验证配置是否在高级编辑中体现 RZY-3758
    When the chart title is "<name>" then I click the button which classname is "yotta-icon yotta-icon-DotEmblem" in dashboard
    And I click the "Edit" button
    Then I will see the dashboard highEditor text will contain "<json>"

    Examples:
      | name        | json                                      |
      | 仪表盘热力地图 |   "chart": {\n    "chartType": "heatmap",\n    "field": "count()",\n    "byFields": [\n      "apache.geo.city"\n    ]\n  }   |


  Scenario: 修改field为空 RZY-3759
    When the chart title is "仪表盘热力地图" then I click the button which classname is "yotta-icon yotta-icon-DotEmblem" in dashboard
    And I click the "Edit" button
    And I wait for "500" millsecond
    And I set the parameter "{"title": "仪表盘热力地图","description": "","x": 0,"y": 0,"w": 12,"h": 5,"search": {"query": "appname:apache | stats count() by apache.geo.city","startTime": "now/d","endTime": "now"},"chart": {"chartType": "heatmap","field": "","category": "apache.geo.city"}}" to json editor
    And I wait for "500" millsecond
    And I click the "Check" button
    And I wait for "ErrorMessage" will be visible
    And I will see the element "ErrorMessage" contains "chart -> field 字段值不能为空"
#    Then I wait for element "ErrorMessage" change text to "chart -> field 字段值不能为空"


  Scenario: 修改field为不存在 RZY-3759
    When the chart title is "仪表盘热力地图" then I click the button which classname is "yotta-icon yotta-icon-DotEmblem" in dashboard
    And I click the "Edit" button
    And I set the parameter "{"title": "仪表盘热力地图","description": "","x": 0,"y": 0,"w": 12,"h": 5,"search": {"query": "appname:apache | stats count() by apache.geo.city","startTime": "now/d","endTime": "now"},"chart": {"chartType": "heatmap","field": "qwertcount()","category": "apache.geo.city"}}" to json editor
    And I wait for "500" millsecond
    And I click the "Check" button
    And I wait for "SuccessMessage" will be visible
    Then I will see the success message "校验通过"
    And I wait for "SuccessMessage" will be invisible
    And I click the "Ensure" button
    And I wait for "SuccessMessage" will be visible
    Then I will see the success message "配置成功"
    And I wait for "2000" millsecond
    Then I wait for "NoData" will be visible


  Scenario: 修改field为'apache.clientip' RZY-3759
    When the chart title is "仪表盘热力地图" then I click the button which classname is "yotta-icon yotta-icon-DotEmblem" in dashboard
    And I click the "Edit" button
    Then I set the parameter "{"title": "仪表盘热力地图","description": "","x": 0,"y": 0,"w": 12,"h": 5,"search": {"query": "appname:apache | stats count() by apache.geo.city","startTime": "now/d","endTime": "now"},"chart": {"chartType": "heatmap","field": "apache.geo.city","category": ""}}" to json editor
    And I wait for "500" millsecond
    And I click the "Check" button
    And I wait for "SuccessMessage" will be visible
    Then I will see the success message "校验通过"
    And I wait for "SuccessMessage" will be invisible
    And I click the "Ensure" button
    And I wait for "SuccessMessage" will be visible
    Then I will see the success message "配置成功"
    And I wait for "2000" millsecond
    Then I wait for "NoData" will be visible


  Scenario: 修改category为其他值 RZY-3760
    When the chart title is "仪表盘热力地图" then I click the button which classname is "yotta-icon yotta-icon-DotEmblem" in dashboard
    And I click the "Edit" button
    Then I set the parameter "{"title": "仪表盘热力地图","description": "","x": 0,"y": 0,"w": 12,"h": 5,"search": {"query": "appname:apache | stats count() by apache.geo.city","startTime": "now/d","endTime": "now"},"chart": {"chartType": "heatmap","field": "count()","category": "qwerty"}}" to json editor
    And I wait for "500" millsecond
    And I click the "Check" button
    And I wait for "SuccessMessage" will be visible
    Then I will see the success message "校验通过"
    And I wait for "SuccessMessage" will be invisible
    And I click the "Ensure" button
    And I wait for "SuccessMessage" will be visible
    Then I will see the success message "配置成功"
    And I wait for "2000" millsecond
    Then I wait for "NoData" will be visible
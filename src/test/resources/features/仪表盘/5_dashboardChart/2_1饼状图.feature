@dashboard2_1 @dashboardChart
Feature: 仪表盘_2_1_饼状图

  Background:
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I set the parameter "TextFilter" with value "仪表盘饼状图"
    And I wait for loading invisible
    And I click the detail which name is "仪表盘饼状图"
    And switch to window "仪表盘"
    And I close all tabs except main tab
    Then I will see the "dashboard.DetailPage" page
    And I click the "SettingIcon" button
    And I switch the dashboard "OpenEdit" button to "enable"
    And I click the "SettingIcon" button
    And I wait for "SuccessMessage" will be invisible

  @dashboardChartSmoke
  Scenario Outline: 修改为饼状图 RZY-298
    And I click the "ChartType" button
    And I wait for "1000" millsecond
    Then I will see the "trend.CreatePageDash" page
    And I wait for "Dimension" will be visible
    And I click the "Dimension" button
    And I click the "<targetName>" button
    And I wait for "1000" millsecond
    And I click the "SettingChart" button
    And I choose the "count()" from the "DataValue"
    And I wait for "1000" millsecond
    And I click the "Divide" button
    And I wait for "1000" millsecond
    Then I click the "Generate" button
    And I wait for "1000" millsecond
    And I click the "SettingChart" button
    Then I will see the "dashboard.DetailPage" page
    And I wait for "2000" millsecond
    And I click the "TrendTitle" button
    And I wait for "3000" millsecond

    Examples:
      | name   | targetName |
      | 仪表盘饼状图 | Pie  |


  Scenario Outline: 验证配置是否在高级编辑中体现 RZY-3695
    When the chart title is "<name>" then I click the button which classname is "yotta-icon yotta-icon-DotEmblem" in dashboard
    And I click the "Edit" button
    And I wait for "300" millsecond
    Then I will see the dashboard highEditor text will contain "<json>"

    Examples:
      | name    | json                                                                                                                                                                                                                                                                                                                                                                           |
      | 仪表盘饼状图 |  "chart": {\n    "chartType": "pie",\n    "field": "count()",\n    "byFields": [\n      "apache.clientip"\n    ],\n    "precision": "",\n    "useFlameDrillDown": false |


  Scenario: 修改为不存在的字段 RZY-3697
    When the chart title is "仪表盘饼状图" then I click the button which classname is "yotta-icon yotta-icon-DotEmblem" in dashboard
    And I click the "Edit" button
    And I wait for "300" millsecond
    Then I set the parameter "{"title": "仪表盘饼状图","description": "","x": 0,"y": 0,"w": 12,"h": 5,"search": {"query": "tag:sample04061424_display | stats count() by apache.clientip,apache.resp_len | limit 10","startTime": "now/d","endTime": "now"},"chart": {"chartType": "pie","field": "count()qwert","byFields": ["apache.resp_lenasdfg"],"precision": "","useFlameDrillDown": false}}" to json editor
    And I wait for "500" millsecond
    And I click the "Check" button
    And I wait for "SuccessMessage" will be visible
    Then I will see the success message "校验通过"
    And I wait for "SuccessMessage" will be invisible
    And I click the "Ensure" button
    And I wait for "SuccessMessage" will be visible
    Then I will see the success message "配置成功"
    And I wait for "3000" millsecond
    Then I will see the "PieData" doesn't exist

 
  Scenario Outline: chartType字段 RZY-1317,RZY-1318,RZY-1319,RZY-3692
    When the chart title is "仪表盘饼状图" then I click the button which classname is "yotta-icon yotta-icon-DotEmblem" in dashboard
    And I click the "Edit" button
    And I wait for "300" millsecond
    Then I set the parameter "{  "title": "仪表盘饼状图",  "description": "",  "x": 0,  "y": 0,  "w": 12,  "h": 5,  "search": {    "query": "tag:sample04061424_display | stats count() by apache.clientip,apache.resp_len | limit 10",    "startTime": "now/d",    "endTime": "now"  },  "chart": {    "chartType": "<chartType>",    "field": "count()",    "byFields": [      "apache.clientip"    ],    "precision": "",    "useFlameDrillDown": false  }}" to json editor
    And I wait for "500" millsecond
    And I click the "Check" button
    And I wait for "SuccessMessage" will be visible
    Then I will see the success message "校验通过"
    And I wait for "SuccessMessage" will be invisible
    And I click the "Ensure" button
    And I wait for "SuccessMessage" will be visible
    Then I will see the success message "配置成功"
    And I wait for loading invisible
    And I wait for "2000" millsecond
    Then take part of "DimensionChart" with name "actual/<image>"
    # And I compare source image "actual/<image>" with target image "expect/<image>"

    Examples:
      | chartType |   image                |
      | rose      | 维度图_chartType_rose  |
      | bar      | 维度图_chartType_bar   |
      | sunburst  | 维度图_chartType_sunburst  |
    
    @dashboardChartSmoke
    Examples:
      | chartType |   image                |
      | pie     | 维度图_chartType_pie   |

  Scenario Outline: field byFields RZY-3696
    When the chart title is "仪表盘饼状图" then I click the button which classname is "yotta-icon yotta-icon-DotEmblem" in dashboard
    And I click the "Edit" button
    And I wait for "300" millsecond
    Then I set the parameter "{  "title": "仪表盘饼状图",  "description": "",  "x": 0,  "y": 0,  "w": 12,  "h": 5,  "search": {    "query": "tag:sample04061424_display | stats count() by apache.clientip,apache.resp_len | limit 10",    "startTime": "now/d",    "endTime": "now"  },  "chart": {    "chartType": "pie",    "field": "<field>",    "byFields": [      "<byField>"    ],    "precision": "",    "useFlameDrillDown": false  }}" to json editor
    And I wait for "500" millsecond
    And I click the "Check" button
    And I wait for "SuccessMessage" will be visible
    Then I will see the success message "校验通过"
    And I wait for "SuccessMessage" will be invisible
    And I click the "Ensure" button
    And I wait for "SuccessMessage" will be visible
    Then I will see the success message "配置成功"
    And I wait for loading invisible
    And I wait for "2000" millsecond
    Then take part of "DimensionChart" with name "actual/<image>"
    # And I compare source image "actual/<image>" with target image "expect/<image>"

    Examples:
      | field         | byField               |   image                 |
      | count()       | apache.resp_len       | 维度图_byField_existed   |
#      | count()qwerty | apache.resp_lenasdfg  | 维度图_byField_noexisted |
@dashboard5_2 @dashboardChart
Feature: 仪表盘_5_2_攻击地图

  Background:
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I set the parameter "TextFilter" with value "仪表盘攻击地图"
    And I wait for loading invisible
    And I click the detail which name is "仪表盘攻击地图"
    And switch to window "仪表盘"
    And I close all tabs except main tab
    Then I will see the "dashboard.DetailPage" page
    And I click the "SettingIcon" button
    And I switch the dashboard "OpenEdit" button to "enable"
    And I click the "SettingIcon" button
    And I wait for "SuccessMessage" will be invisible

  Scenario Outline: 修改为攻击地图 RZY-314,RZY-3761
    And I click the "ChartType" button
    And I wait for "1000" millsecond
    Then I will see the "trend.CreatePageDash" page
    And I wait for "2000" millsecond
    And I wait for "Map" will be visible
    And I click the "Map" button
    And I click the "<targetName>" button
#    And I hide the element "Content"
    And I wait for "1000" millsecond
    And I click the "SettingChart" button
    And I choose the "apache.clientip" from the "DataValue"
    And I wait for "1000" millsecond
    And I choose the "client_lon" from the "Longitude"
    And I wait for "1000" millsecond
    And I choose the "client_lat" from the "Latitude"
    And I wait for "1000" millsecond
    And I click the "Target" button
    And I choose the "gw_address" from the "DataValue"
    And I wait for "1000" millsecond
    And I choose the "gw_lon" from the "Longitude"
    And I wait for "1000" millsecond
    And I choose the "gw_lat" from the "Latitude"
    And I wait for "1000" millsecond
    And I click the "Weight" button
    And I choose the "cnt" from the "DataValue"
    And I wait for "1500" millsecond
    Then I click the "Generate" button
    And I wait for "1000" millsecond
    And I click the "SettingChart" button
    Then I will see the "dashboard.DetailPage" page
    And I wait for "2000" millsecond
    And I click the "TrendTitle" button
    And I wait for "3000" millsecond
#    And take part of "FullScreen" with name "dashboard/<name>"
#    Then I compare source image "dashboard/<name>" with target image "dashboard/<targetName>"

    Examples:
      | name    | targetName |
      | 仪表盘攻击地图 | Attackmap  |


  Scenario Outline: 验证配置是否在高级编辑中体现 RZY-3761
    When the chart title is "<name>" then I click the button which classname is "yotta-icon yotta-icon-DotEmblem" in dashboard
    And I click the "Edit" button
    Then I will see the "TextLayer" result will contain "<json>"
#    Then I will see the "TextLayer" result will be "<json>"

    Examples:
      | name    | json                                                                                                                                                                                                                                                                                                                                                                           |
      | 仪表盘攻击地图 |  \n  "chart": {\n    "chartType": "attackmap",\n    "from": {\n      "field": "apache.clientip",\n      "longitudeField": "client_lon",\n      "latitudeField": "client_lat"\n    },\n    "to": {\n      "field": "gw_address",\n      "longitudeField": "gw_lon",\n      "latitudeField": "gw_lat"\n    },\n    "weight": {\n      "field": "cnt"\n    } |
#      | 仪表盘攻击地图 | {\n  "title": "仪表盘攻击地图",\n  "description": "",\n  "x": 0,\n  "y": 0,\n  "w": 12,\n  "h": 5,\n  "search": {\n    "query": "tag:sample* \| parse field=apache.request_query \\"^gw_address=(?<gw_address>,\n    "startTime": "now/d",\n    "endTime": "now"\n  },\n  "chart": {\n    "chartType": "attackmap",\n    "from": {\n      "field": "apache.clientip",\n      "longitudeField": "client_lon",\n      "latitudeField": "client_lat"\n    },\n    "to": {\n      "field": "gw_address",\n      "longitudeField": "gw_lon",\n      "latitudeField": "gw_lat"\n    },\n    "weight": {\n      "field": "cnt"\n    } |

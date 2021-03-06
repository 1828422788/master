@dashboard3_1 @dashboardChart
Feature: 仪表盘_3_1_和弦图

  Background:
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I set the parameter "TextFilter" with value "仪表盘和弦图"
    And I wait for loading invisible
    And I click the detail which name is "仪表盘和弦图"
    And switch to window "仪表盘"
    And I close all tabs except main tab
    Then I will see the "dashboard.DetailPage" page
    And I click the "SettingIcon" button
    And I switch the dashboard "OpenEdit" button to "enable"
    And I click the "SettingIcon" button
    And I wait for "SuccessMessage" will be invisible

  Scenario Outline: 修改为和弦图 RZY-305
    And I click the "ChartType" button
    And I wait for "1000" millsecond
    Then I will see the "trend.CreatePageDash" page
    And I wait for "2000" millsecond
    And I wait for "Relation" will be visible
    And I click the "Relation" button
    And I click the "<targetName>" button
    And I wait for "2000" millsecond
    And I click the "Setting" button
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
    And I click the "Setting" button
    Then I will see the "dashboard.DetailPage" page
    And I wait for "2000" millsecond
    And I click the "TrendTitle" button
    And I wait for "3000" millsecond
#    And take part of "FullScreen" with name "dashboard/<name>"
#    Then I compare source image "dashboard/<name>" with target image "dashboard/<targetName>"

    Examples:
      | name   | targetName |
      | 仪表盘和弦图 | Chord      |


  Scenario Outline: 验证配置是否在高级编辑中体现 RZY-3698
    When the chart title is "<name>" then I click the button which classname is "yotta-icon yotta-icon-DotEmblem" in dashboard
    And I click the "Edit" button
    Then I will see the "TextLayer" result will contain "<json>"

    Examples:
      | name    | json                                                                                                                                                                                                                                                                                                                                                                           |
      | 仪表盘和弦图 |  "chart": {\n    "chartType": "chord",\n    "fromField": "apache.x_forward",\n    "toField": "apache.resp_len",\n    "weightField": "count()",\n    "repulsionField": 50,\n    "precision": ""\n  } |

  Scenario Outline: chartType字段 RZY-1321,RZY-1322,RZY-1323
    When the chart title is "仪表盘和弦图" then I click the button which classname is "yotta-icon yotta-icon-DotEmblem" in dashboard
    And I click the "Edit" button
    Then I set the parameter "{  "title": "仪表盘和弦图",  "description": "",  "x": 0,  "y": 0,  "w": 12,  "h": 5,  "search": {    "query": "tag:*display | stats count() by apache.clientip,apache.x_forward,apache.resp_len,apache.method | rename apache.clientip as apache.x_forward_group| rename apache.method as apache.resp_len_group| limit 20",    "startTime": "now/d",    "endTime": "now"  },  "chart": {    "chartType": "<chartType>",    "fromField": "apache.x_forward",    "toField": "apache.resp_len",    "weightField": "count()",    "repulsionField": 8,    "precision": ""  }}" to json editor
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
    Then take part of "ChordChart" with name "actual/<image>"

    Examples:
      | chartType |   image                |
      | force     | 和弦图_chartType_force  |
      | sankey    | 和弦图_chartType_sankey |
      | chord     | 和弦图_chartType_chord  |

  Scenario: 交换fromField和toField字段 RZY-1324
    When the chart title is "仪表盘和弦图" then I click the button which classname is "yotta-icon yotta-icon-DotEmblem" in dashboard
    And I click the "Edit" button
    Then I set the parameter "{  "title": "仪表盘和弦图",  "description": "",  "x": 0,  "y": 0,  "w": 12,  "h": 5,  "search": {    "query": "tag:*display | stats count() by apache.clientip,apache.x_forward,apache.resp_len,apache.method | rename apache.clientip as apache.x_forward_group| rename apache.method as apache.resp_len_group| limit 20",    "startTime": "now/d",    "endTime": "now"  },  "chart": {    "chartType": "sankey",    "fromField": "apache.resp_len",    "toField": "apache.x_forward",    "weightField": "count()",    "repulsionField": 8,    "precision": ""  }}" to json editor
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
    Then take part of "ChordChart" with name "actual/和弦图_fromField_toField"

  Scenario: weightField字段修改为不存在的值 RZY-3701
    When the chart title is "仪表盘和弦图" then I click the button which classname is "yotta-icon yotta-icon-DotEmblem" in dashboard
    And I click the "Edit" button
    Then I set the parameter "{  "title": "仪表盘和弦图",  "description": "",  "x": 0,  "y": 0,  "w": 12,  "h": 5,  "search": {    "query": "tag:*display | stats count() by apache.clientip,apache.x_forward,apache.resp_len,apache.method | rename apache.clientip as apache.x_forward_group| rename apache.method as apache.resp_len_group| limit 20",    "startTime": "now/d",    "endTime": "now"  },  "chart": {    "chartType": "chord",    "fromField": "apache.x_forward",    "toField": "apache.resp_len",    "weightField": "qwertcount()",    "repulsionField": 8,    "precision": ""  }}" to json editor
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
    Then take part of "ChordChart" with name "actual/和弦图_weightField"

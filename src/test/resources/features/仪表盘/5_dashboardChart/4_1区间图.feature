@dashboard4_1 @dashboardChart
Feature: 仪表盘_4_1_区间图

  Background:
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I set the parameter "TextFilter" with value "仪表盘区间图"
    And I wait for loading invisible
    And I click the detail which name is "仪表盘区间图"
    And switch to window "仪表盘"
    And I close all tabs except main tab
    Then I will see the "dashboard.DetailPage" page
    And I click the "SettingIcon" button
    And I switch the dashboard "OpenEdit" button to "enable"
    And I click the "SettingIcon" button
    And I wait for "SuccessMessage" will be invisible

  Scenario Outline: 修改为区间图 RZY-308
    And I click the "ChartType" button
    And I wait for "1000" millsecond
    Then I will see the "trend.CreatePageDash" page
    And I wait for "2000" millsecond
    And I wait for "Compound" will be visible
    And I click the "Compound" button
    And I click the "<targetName>" button
    And I wait for "3000" millsecond
    And I click the "Setting" button
    And I choose the "ts" from the "DataValue"
    And I click the "Yaxis" button
    And I choose the "count" from the "Actual"
    And I wait for "1000" millsecond
    And I choose the "_predict_count" from the "Predict"
    And I wait for "1000" millsecond
    And I choose the "upper95" from the "TopLimit"
    And I wait for "1000" millsecond
    And I choose the "lower95" from the "LowerLimit"
    And I wait for "2000" millsecond
    Then I click the "Generate" button
    And I wait for "1000" millsecond
    And I click the "Setting" button
    Then I will see the "dashboard.DetailPage" page
    And I wait for "2000" millsecond
    And I click the "TrendTitle" button
    And I wait for "3000" millsecond

    Examples:
      | name   | targetName |
      | 仪表盘区间图 | Rangeline  |


  Scenario Outline: 验证配置是否在高级编辑中体现 RZY-3703
    When the chart title is "<name>" then I click the button which classname is "yotta-icon yotta-icon-DotEmblem" in dashboard
    And I click the "Edit" button
    Then I will see the "TextLayer" result will contain "<json>"

    Examples:
      | name    | json                                                                                                                                                                                                                                                                                                                              |
      | 仪表盘区间图 |  \n  "chart": {\n    "chartType": "rangeline",\n    "xAxis": {\n      "field": "ts"\n    },\n    "precision": "",\n    "yAxis": {\n      "field": "count",\n      "predictField": "_predict_count",\n      "anomalyField": ""\n    },\n    "boundary": {\n      "upperField": "upper95",\n      "lowerField": "lower95"\n    } |


  Scenario: 修改chartType为其他值 RZY-3704
    When the chart title is "仪表盘区间图" then I click the button which classname is "yotta-icon yotta-icon-DotEmblem" in dashboard
    And I click the "Edit" button
    And I set the parameter "{"title": "仪表盘区间图","description": "","x": 0,"y": 0,"w": 12,"h": 5,"search": {"query": "tag:sample04061424_display | bucket timestamp span=1h as ts | stats count('apache.status') as 'count' by ts | esma count timefield=ts","startTime": "now/d","endTime": "now"},"chart": {"chartType": "qwertyuiop","xAxis": {"field": "ts"},"precision": "","yAxis": {"field": "count","predictField": "_predict_count","anomalyField": ""},"boundary": {"upperField": "upper95","lowerField": "lower95"}}}" to json editor
    And I wait for "500" millsecond
    And I click the "Check" button
    And I wait for "ErrorMessage" will be visible
    And I will see the element "ErrorMessage" contains "chart -> chartType 字段值不支持qwertyuiop"
#    Then I wait for element "ErrorMessage" change text to "chart -> chartType 字段值不支持qwertyuiop"


  Scenario: 修改xAxis:field-ma RZY-3705
    When the chart title is "仪表盘区间图" then I click the button which classname is "yotta-icon yotta-icon-DotEmblem" in dashboard
    And I click the "Edit" button
    And I set the parameter "{  "title": "仪表盘区间图",  "description": "",  "x": 0,  "y": 0,  "w": 12,  "h": 5,  "search": {    "query": "tag:sample04061424_display | bucket timestamp span=1h as ts | stats count('apache.status') as 'count' by ts | esma count timefield=ts",    "startTime": "now/d",    "endTime": "now"  },  "chart": {    "chartType": "rangeline",    "xAxis": {      "field": "ma"    },    "precision": "",    "yAxis": {      "field": "count",      "predictField": "_predict_count",      "anomalyField": ""    },    "boundary": {      "upperField": "upper95",      "lowerField": "lower95"    }  }}" to json editor
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
    Then take part of "SectionChartArea" with name "actual/区间图_xAxis_ma"
#    And I compare source image "actual/区间图_xAxis_ma" with target image "expect/区间图_xAxis_ma"


  Scenario: 修改xAxis:field-qwert RZY-3705
    When the chart title is "仪表盘区间图" then I click the button which classname is "yotta-icon yotta-icon-DotEmblem" in dashboard
    And I click the "Edit" button
    And I set the parameter "{  "title": "仪表盘区间图",  "description": "",  "x": 0,  "y": 0,  "w": 12,  "h": 5,  "search": {    "query": "tag:sample04061424_display | bucket timestamp span=1h as ts | stats count('apache.status') as 'count' by ts | esma count timefield=ts",    "startTime": "now/d",    "endTime": "now"  },  "chart": {    "chartType": "rangeline",    "xAxis": {      "field": "ma"    },    "precision": "",    "yAxis": {      "field": "count",      "predictField": "_predict_count",      "anomalyField": ""    },    "boundary": {      "upperField": "upper95",      "lowerField": "lower95"    }  }}" to json editor
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
    Then take part of "SectionChartArea" with name "actual/区间图_xAxis_qwert"
#    And I compare source image "actual/区间图_xAxis_qwert" with target image "expect/区间图_xAxis_qwert"


  Scenario: 修改yAxis:field为不存在 RZY-3706
    When the chart title is "仪表盘区间图" then I click the button which classname is "yotta-icon yotta-icon-DotEmblem" in dashboard
    And I click the "Edit" button
    And I set the parameter "{"title": "仪表盘区间图","description": "","x": 0,"y": 0,"w": 12,"h": 5,"search": {"query": "tag:sample04061424_display | bucket timestamp span=1h as ts | stats count('apache.status') as 'count' by ts | esma count timefield=ts","startTime": "now/d","endTime": "now"},"chart": {"chartType": "rangeline","xAxis": {"field": "ts"},"precision": "","yAxis": {"field": "countqwerty","predictField": "","anomalyField": ""},"boundary": {"upperField": "upper95","lowerField": "lower95"}}}" to json editor
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


  Scenario Outline: upperField和lowerField RZY-3708
    When the chart title is "仪表盘区间图" then I click the button which classname is "yotta-icon yotta-icon-DotEmblem" in dashboard
    And I click the "Edit" button
    And I set the parameter "{  "title": "仪表盘区间图",  "description": "",  "x": 0,  "y": 0,  "w": 12,  "h": 5,  "search": {    "query": "tag:sample04061424_display | bucket timestamp span=1h as ts | stats count('apache.status') as 'count' by ts | esma count timefield=ts",    "startTime": "now/d",    "endTime": "now"  },  "chart": {    "chartType": "rangeline",    "xAxis": {      "field": "ts"    },    "precision": "",    "yAxis": {      "field": "count",      "predictField": "_predict_count",      "anomalyField": ""    },    "boundary": {      "upperField": "<upperField>",      "lowerField": "<lowerField>"    }  }}" to json editor
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
    Then take part of "SectionChartArea" with name "actual/<iamge>"
#    And I compare source image "actual/<iamge>" with target image "expect/<iamge>"

    Examples:
      | upperField   | lowerField |     iamge      |
      |    upper95   |   qwert    | 区间图_upperField |
      |     qwert    |  lower95   | 区间图_lowerField |


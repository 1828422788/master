@dashboard4_2 @dashboardChart
Feature: 仪表盘_4_2_多Y轴图

  Scenario Outline: 新建仪表盘
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for "2000" millsecond
    And I click the "Create" button
    When I set the parameter "DashBoardName" with value "<name>"
    And I click the "Ensure" button
    And I wait for "SuccessMessage" will be visible
    Then I will see the success message "新建仪表盘成功"

    Examples:
      | name    |
      | 仪表盘多Y轴图 |

  Scenario Outline: 创建仪表盘所用趋势图
    And open the "trend.ListPage" page for uri "/trend/"
    And I click the "NewTrendButton" button
    Then I will see the "trend.CreatePageDash" page
    And I set the parameter "SearchInput" with value "<spl>"
    And I click the "DateEditor" button
    And I click the "Today" button
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
      | spl                                                                                                                                                                             | name    |
      | tag:sample04061424_display \| stats count(apache.resp_len), max(apache.resp_len), min(apache.resp_len), sum(apache.status), avg(apache.resp_len) by apache.resp_len,apache.status \| limit 10 | 仪表盘多Y轴图 |

  Scenario Outline: 新建标签页
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for "2000" millsecond
    And I set the parameter "SearchInput" with value "仪表盘<name>"
    And I wait for "2000" millsecond
    And I click the detail which name is "仪表盘<name>"
    And switch to window "仪表盘"
    And I close all tabs except main tab
    Then I will see the "dashboard.DetailPage" page
    When I set the parameter "TagName" with value "<name>"
    And I click the "EnsureCreateTagButton" button
    And I wait for "2000" millsecond
    And I back to before

    Examples:
      | name |
      | 多Y轴图 |

  Scenario Outline: 添加图表
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for "2000" millsecond
    And I set the parameter "SearchInput" with value "<name>"
    And I wait for "2000" millsecond
    And I click the detail which name is "<name>"
    And switch to window "仪表盘"
    And I close all tabs except main tab
    Then I will see the "dashboard.DetailPage" page
    And I click the "SettingIcon" button
    And I switch the dashboard "OpenEdit" button to "enable"
    And I click the "SettingIcon" button
    And I wait for "AddEventButton" will be visible
    When I click the "AddEventButton" button
    And I wait for "500" millsecond
    And I click the "AddChart" button
    And I wait for "SpinDot" will be invisible
    And I set the parameter "SearchChartInput" with value "<name>"
    And I wait for loading invisible
    And I click the "{'Checkbox':'<name>'}" button
    And I click the "Ensure" button
    And I wait for "SuccessMessage" will be visible
    Then I wait for element "SuccessMessage" change text to "添加成功"

    Examples:
      | name    |
      | 仪表盘多Y轴图 |

  Scenario Outline: 修改为多Y轴图 RZY-309
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for "2000" millsecond
    And I set the parameter "SearchInput" with value "<name>"
    And I wait for "2000" millsecond
    And I click the detail which name is "<name>"
    And switch to window "仪表盘"
    And I close all tabs except main tab
    Then I will see the "dashboard.DetailPage" page
    And I click the "SettingIcon" button
    And I switch the dashboard "OpenEdit" button to "enable"
    And I click the "SettingIcon" button
    And I click the "ChartType" button
    And I wait for "1000" millsecond
    Then I will see the "trend.CreatePageDash" page
    And I wait for "2000" millsecond
    And I wait for "Compound" will be visible
    And I click the "Compound" button
    And I click the "<targetName>" button
    And I wait for "1000" millsecond
    And I click the "SettingChart" button under some element
    And I choose the "apache.resp_len" from the "DataValue"
    And I wait for "3000" millsecond
    And I click the "Yaxis" button
    And I click the "AddField" button
    And I click the "YaxisTwo" button
    And I click the "AddConfigFields" button
    And I choose the "max(apache.resp_len)" from the "DataValue2"
    And I wait for "500" millsecond
    And I choose the "柱状图" from the "TypeDropdown"
    And I set the parameter "Unit" with value "柱"
    And I set the parameter "Min" with value "2"
    And I click the "Group" button
    And I click the "Exhibition" button
    And I click the "StartColour" button
    And I click the "Red" button
    And I wait for "500" millsecond
    Then I click the "Generate" button
    And I wait for "3000" millsecond
    And I click the "SettingChart" button under some element
    Then I will see the "dashboard.DetailPage" page
    And I wait for "2000" millsecond
    And I move the mouse pointer to the "TrendTitle"
    And I click the "TrendTitle" button
    And I wait for "3000" millsecond
#    And take part of "FullScreen" with name "dashboard/<name>"
#    Then I compare source image "dashboard/<name>" with target image "dashboard/<targetName>"

    Examples:
      | name    | targetName |
      | 仪表盘多Y轴图 | Multiaxis  |


  Scenario Outline: 验证配置是否在高级编辑中体现 RZY-3725
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for "2000" millsecond
    And I set the parameter "SearchInput" with value "<name>"
    And I wait for "2000" millsecond
    And I click the detail which name is "<name>"
    And switch to window "仪表盘"
    And I close all tabs except main tab
    Then I will see the "dashboard.DetailPage" page
    And I click the "SettingIcon" button
    And I switch the dashboard "OpenEdit" button to "enable"
    And I click the "SettingIcon" button
    And I wait for "SuccessMessage" will be invisible
    When the chart title is "<name>" then I click the button which classname is "yotta-icon yotta-icon-DotEmblem" in dashboard
    And I click the "Edit" button
    Then I will see the dashboard highEditor text will contain "<json>"
#    Then I will see the "TextAce" result will be "<json>"

    Examples:
      | name    | json                                                                                                                                                                                                                                                                                                                                                                           |
      | 仪表盘多Y轴图 |  "chart": {\n    "chartType": "multiaxis",\n    "xAxis": {\n      "field": "apache.resp_len",\n      "labelRotate": "left",\n      "sortOrder": "default"\n    },\n    "yAxis": [\n      {\n        "fields": [\n          {\n            "color": "#2A76E4",\n            "connectNull": false,\n            "name": "count(apache.resp_len)",\n            "smooth": false,\n            "type": "line"\n          }\n        ],\n        "range": {\n          "max": "",\n          "min": ""\n        },\n        "unit": ""\n      },\n      {\n        "fields": [\n          {\n            "color": "#5C9DF5",\n            "connectNull": false,\n            "name": "max(apache.resp_len)",\n            "opacity": 0.6,\n            "smooth": false,\n            "type": "column"\n          }\n        ],\n        "range": {\n          "max": "",\n          "min": 2\n        },\n        "unit": "柱"\n      }\n    ],\n    "precision": "",\n    "showAllXAxisLabels": false,\n    "labelInterval": "",\n    "customLabel": "",\n    "byFields": [\n      "apache.status"\n    ],\n    "legend": {\n      "placement": "bottom"\n    }\n  } |


  Scenario Outline: 同一个Y轴多个字段 RZY-4856,RZY-1332
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for "2000" millsecond
    And I set the parameter "SearchInput" with value "<name>"
    And I wait for "2000" millsecond
    And I click the detail which name is "<name>"
    And switch to window "仪表盘"
    And I close all tabs except main tab
    Then I will see the "dashboard.DetailPage" page
    And I click the "SettingIcon" button
    And I switch the dashboard "OpenEdit" button to "enable"
    And I click the "SettingIcon" button
    And I click the "SettingChart" button
    Then I will see the "trend.CreatePageDash" page
    And I wait for "2000" millsecond
    And I click the "Yaxis" button
    And I click the "YaxisTwo" button
    And I click the "AddConfigFields" button
    And I wait for "1000" millsecond
    And I choose the "avg(apache.resp_len)" from the "FieldThreeValue"
    And I wait for "1000" millsecond
    And I choose the "面积图" from the "FieldThreeType"
    And I set the parameter "Unit" with value "柱"
    And I set the parameter "Max" with value "200000"
    And I wait for "500" millsecond
    Then I click the "Generate" button
    And I wait for "3000" millsecond
    And I click the "SettingChart" button under some element
    Then I will see the "dashboard.DetailPage" page
    And I wait for "2000" millsecond
    And I move the mouse pointer to the "TrendTitle"
    And I click the "TrendTitle" button
    And I wait for "3000" millsecond
    Then take part of "MultiYaxisArea" with name "actual/<image>"
    # And I compare source image "actual/<image>" with target image "expect/<image>"

    Examples:
      | name        | image                   |
      | 仪表盘多Y轴图 | 多Y轴图_multiFieldInAxis |

  Scenario: 验证边界值范围生效 RZY-4857
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for "2000" millsecond
    And I set the parameter "SearchInput" with value "<name>"
    And I wait for "2000" millsecond
    And I click the detail which name is "仪表盘多Y轴图"
    And switch to window "仪表盘"
    And I close all tabs except main tab
    Then I will see the "dashboard.DetailPage" page
    Then I wait for "MultiYminValue" will be visible
    Then I wait for "MultiYmaxValue" will be visible

  Scenario Outline: labelRotate-left-right-horizontal-vertical RZY-1325,RZY-1326,RZY-1327,RZY-1328
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for "2000" millsecond
    And I set the parameter "SearchInput" with value "<name>"
    And I wait for "2000" millsecond
    And I click the detail which name is "<name>"
    And switch to window "仪表盘"
    And I close all tabs except main tab
    Then I will see the "dashboard.DetailPage" page
    And I click the "SettingIcon" button
    And I switch the dashboard "OpenEdit" button to "enable"
    And I click the "SettingIcon" button
    And I wait for "SuccessMessage" will be invisible
    When the chart title is "<name>" then I click the button which classname is "yotta-icon yotta-icon-DotEmblem" in dashboard
    And I click the "Edit" button
    Then I set the parameter "{  "title": "仪表盘多Y轴图",  "x": 0,  "y": 0,  "w": 12,  "h": 5,  "search": {    "query": "tag:sample04061424_display | stats count(apache.resp_len), max(apache.resp_len), min(apache.resp_len), sum(apache.status), avg(apache.resp_len) by apache.resp_len,apache.status | limit 10",    "startTime": "now/d",    "endTime": "now"  },  "chart": {    "chartType": "multiaxis",    "xAxis": {      "field": "apache.resp_len",      "labelRotate": "<labelRotate>",      "sortOrder": "default"    },    "yAxis": [      {        "fields": [          {            "color": "#2A76E4",            "connectNull": false,            "name": "count(apache.resp_len)",            "smooth": false,            "type": "line"          }        ],        "range": {},        "unit": ""      },      {        "fields": [          {            "color": "#5C9DF5",            "connectNull": false,            "name": "max(apache.resp_len)",            "opacity": 0.6,            "smooth": false,            "type": "column"          },          {            "color": "#5C9DF5",            "connectNull": false,            "name": "avg(apache.resp_len)",            "opacity": 0.6,            "smooth": false,            "type": "area"          }        ],        "range": {          "max": 200000,          "min": 2        },        "unit": "柱"      }    ],    "precision": "",    "showAllXAxisLabels": false,    "labelInterval": "",    "customLabel": "",    "byFields": [      "apache.status"    ],    "legend": {      "placement": "bottom"    }  }}" to json editor
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
    Then I will see the element "XaxisField" transform contains "<rotate>"

    Examples:
      | name        |   labelRotate  |  rotate       |
      | 仪表盘多Y轴图 |      left      |  rotate(-45)  |
      | 仪表盘多Y轴图 |      right     |  rotate(45)   |
      | 仪表盘多Y轴图 |   horizontal   |  rotate(0)    |
      | 仪表盘多Y轴图 |    vertical    |  rotate(-90)  |

  Scenario Outline: sortOrder-default-desc-asc RZY-1329,RZY-1330,RZY-1331
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for "2000" millsecond
    And I set the parameter "SearchInput" with value "<name>"
    And I wait for "2000" millsecond
    And I click the detail which name is "<name>"
    And switch to window "仪表盘"
    And I close all tabs except main tab
    Then I will see the "dashboard.DetailPage" page
    And I click the "SettingIcon" button
    And I switch the dashboard "OpenEdit" button to "enable"
    And I click the "SettingIcon" button
    And I wait for "SuccessMessage" will be invisible
    When the chart title is "<name>" then I click the button which classname is "yotta-icon yotta-icon-DotEmblem" in dashboard
    And I click the "Edit" button
    Then I set the parameter "{  "title": "仪表盘多Y轴图",  "x": 0,  "y": 0,  "w": 12,  "h": 5,  "search": {    "query": "tag:sample04061424_display | stats count(apache.resp_len), max(apache.resp_len), min(apache.resp_len), sum(apache.status), avg(apache.resp_len) by apache.resp_len,apache.status | limit 10",    "startTime": "now/d",    "endTime": "now"  },  "chart": {    "chartType": "multiaxis",    "xAxis": {      "field": "apache.resp_len",      "labelRotate": "left",      "sortOrder": "<sortOrder>"    },    "yAxis": [      {        "fields": [          {            "color": "#2A76E4",            "connectNull": false,            "name": "count(apache.resp_len)",            "smooth": false,            "type": "line"          }        ],        "range": {          "max": "",          "min": ""        },        "unit": ""      },      {        "fields": [          {            "color": "#5C9DF5",            "connectNull": false,            "name": "max(apache.resp_len)",            "opacity": 0.6,            "smooth": false,            "type": "column"          },          {            "color": "#5C9DF5",            "connectNull": false,            "name": "avg(apache.resp_len)",            "opacity": 0.6,            "smooth": false,            "type": "area"          }        ],        "range": {          "max": 200000,          "min": 2        },        "unit": "柱"      }    ],    "precision": "",    "showAllXAxisLabels": false,    "labelInterval": "",    "customLabel": "",    "byFields": [      "apache.status"    ],    "legend": {      "placement": "bottom"    }  }}" to json editor
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
    Then take part of "MultiYaxisArea" with name "actual/<image>"
    # And I compare source image "actual/<image>" with target image "expect/<image>"

    Examples:
      | name        |   sortOrder   |  image                   |
      | 仪表盘多Y轴图 |     default   |  多Y轴图_sortOrder_default |
      | 仪表盘多Y轴图 |      desc     |  多Y轴图_sortOrder_desc |
      | 仪表盘多Y轴图 |       asc     |  多Y轴图_sortOrder_asc |

  Scenario: 设置对象个数为空 RZY-1333
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for "2000" millsecond
    And I set the parameter "SearchInput" with value "仪表盘多Y轴图"
    And I wait for "2000" millsecond
    And I click the detail which name is "仪表盘多Y轴图"
    And switch to window "仪表盘"
    And I close all tabs except main tab
    Then I will see the "dashboard.DetailPage" page
    And I click the "SettingIcon" button
    And I switch the dashboard "OpenEdit" button to "enable"
    And I click the "SettingIcon" button
    And I wait for "SuccessMessage" will be invisible
    When the chart title is "仪表盘多Y轴图" then I click the button which classname is "yotta-icon yotta-icon-DotEmblem" in dashboard
    And I click the "Edit" button
    Then I set the parameter "{  "title": "仪表盘多Y轴图",  "x": 0,  "y": 0,  "w": 12,  "h": 5,  "search": {    "query": "tag:sample04061424_display | stats count(apache.resp_len), max(apache.resp_len), min(apache.resp_len), sum(apache.status), avg(apache.resp_len) by apache.resp_len,apache.status | limit 10",    "startTime": "now/d",    "endTime": "now"  },  "chart": {    "chartType": "multiaxis",    "xAxis": {      "field": "apache.resp_len",      "labelRotate": "left",      "sortOrder": "default"    },    "yAxis": [    ],    "precision": "",    "showAllXAxisLabels": false,    "labelInterval": "",    "customLabel": "",    "byFields": [      "apache.status"    ],    "legend": {      "placement": "bottom"    }  }}" to json editor
    And I wait for "500" millsecond
    And I click the "Check" button
    And I wait for "ErrorMessage" will be visible
    And I will see the element "ErrorMessage" contains "chart -> yAxis 字段值不能为空"
#    Then I wait for element "ErrorMessage" change text to "chart -> yAxis 字段值不能为空"

  Scenario Outline: 设置对象个数为1个，修改type RZY-1332,RZY-1334,RZY-3727,RZY-3728,RZY-3729
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for "2000" millsecond
    And I set the parameter "SearchInput" with value "仪表盘多Y轴图"
    And I wait for "2000" millsecond
    And I click the detail which name is "仪表盘多Y轴图"
    And switch to window "仪表盘"
    And I close all tabs except main tab
    Then I will see the "dashboard.DetailPage" page
    And I click the "SettingIcon" button
    And I switch the dashboard "OpenEdit" button to "enable"
    And I click the "SettingIcon" button
    And I wait for "SuccessMessage" will be invisible
    When the chart title is "仪表盘多Y轴图" then I click the button which classname is "yotta-icon yotta-icon-DotEmblem" in dashboard
    And I click the "Edit" button
    Then I set the parameter "{  "title": "仪表盘多Y轴图",  "description": "",  "x": 0,  "y": 0,  "w": 12,  "h": 5,  "search": {    "query": "tag:sample04061424_display | stats count(apache.resp_len), max(apache.resp_len), min(apache.resp_len), sum(apache.status), avg(apache.resp_len) by apache.resp_len,apache.status | limit 10",    "startTime": "now/d",    "endTime": "now"  },  "chart": {    "chartType": "multiaxis",    "xAxis": {      "field": "apache.resp_len",      "labelRotate": "left",      "sortOrder": "default"    },    "yAxis": [      {        "fields": [          {            "color": "#2A76E4",            "connectNull": false,            "name": "count(apache.resp_len)",            "smooth": false,            "type": "<type>"          }        ],        "range": {},        "unit": ""      }    ],    "precision": "",    "showAllXAxisLabels": false,    "labelInterval": "",    "customLabel": "",    "byFields": [      "apache.status"    ],    "legend": {      "placement": "bottom"    }  }}" to json editor
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
    Then take part of "MultiYaxisArea" with name "actual/<image>"
    # And I compare source image "actual/<image>" with target image "expect/<image>"

    Examples:
      | type    |   image        |
      | area    | 多Y轴图_area    |
      | scatter | 多Y轴图_scatter |
      | column  | 多Y轴图_column  |
      | line    | 多Y轴图_line    |

  Scenario: 将field字段值改为min(apache.resp_len) RZY-1335,RZY-1336,RZY-1340
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for "2000" millsecond
    And I set the parameter "SearchInput" with value "仪表盘多Y轴图"
    And I wait for "2000" millsecond
    And I click the detail which name is "仪表盘多Y轴图"
    And switch to window "仪表盘"
    And I close all tabs except main tab
    Then I will see the "dashboard.DetailPage" page
    And I click the "SettingIcon" button
    And I switch the dashboard "OpenEdit" button to "enable"
    And I click the "SettingIcon" button
    And I wait for "SuccessMessage" will be invisible
    When the chart title is "仪表盘多Y轴图" then I click the button which classname is "yotta-icon yotta-icon-DotEmblem" in dashboard
    And I click the "Edit" button
    Then I set the parameter "{  "title": "仪表盘多Y轴图",  "description": "",  "x": 0,  "y": 0,  "w": 12,  "h": 5,  "search": {    "query": "tag:sample04061424_display | stats count(apache.resp_len), max(apache.resp_len), min(apache.resp_len), sum(apache.status), avg(apache.resp_len) by apache.resp_len,apache.status | limit 10",    "startTime": "now/d",    "endTime": "now"  },  "chart": {    "chartType": "multiaxis",    "xAxis": {      "field": "apache.resp_len",      "labelRotate": "left",      "sortOrder": "default"    },    "yAxis": [      {        "fields": [          {            "color": "#2A76E4",            "connectNull": false,            "name": "min(apache.resp_len)",            "smooth": false,            "type": "line"          }        ],        "range": {},        "unit": ""      }    ],    "precision": "",    "showAllXAxisLabels": false,    "labelInterval": "",    "customLabel": "",    "byFields": [      "apache.status"    ],    "legend": {      "placement": "bottom"    }  }}" to json editor
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
    Then take part of "MultiYaxisArea" with name "actual/多Y轴图_修改Yfield"
#    And I compare source image "actual/多Y轴图_修改Yfield" with target image "expect/多Y轴图_修改Yfield"

  Scenario Outline: range RZY-1337,RZY-3730,RZY-3732
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for "2000" millsecond
    And I set the parameter "SearchInput" with value "仪表盘多Y轴图"
    And I wait for "2000" millsecond
    And I click the detail which name is "仪表盘多Y轴图"
    And switch to window "仪表盘"
    And I close all tabs except main tab
    Then I will see the "dashboard.DetailPage" page
    And I click the "SettingIcon" button
    And I switch the dashboard "OpenEdit" button to "enable"
    And I click the "SettingIcon" button
    And I wait for "SuccessMessage" will be invisible
    When the chart title is "仪表盘多Y轴图" then I click the button which classname is "yotta-icon yotta-icon-DotEmblem" in dashboard
    And I click the "Edit" button
    Then I set the parameter "{  "title": "仪表盘多Y轴图",  "description": "",  "x": 0,  "y": 0,  "w": 12,  "h": 5,  "search": {    "query": "tag:sample04061424_display | stats count(apache.resp_len), max(apache.resp_len), min(apache.resp_len), sum(apache.status), avg(apache.resp_len) by apache.resp_len,apache.status | limit 10",    "startTime": "now/d",    "endTime": "now"  },  "chart": {    "chartType": "multiaxis",    "xAxis": {      "field": "apache.resp_len",      "labelRotate": "left",      "sortOrder": "default"    },    "yAxis": [      {        "fields": [          {            "color": "#2A76E4",            "connectNull": false,            "name": "count(apache.resp_len)",            "smooth": false,            "type": "line"          }        ],        "range": {          "min": <min>,          "max": <max>        },        "unit": ""      }    ],    "precision": "",    "showAllXAxisLabels": false,    "labelInterval": "",    "customLabel": "",    "byFields": [      "apache.status"    ],    "legend": {      "placement": "bottom"    }  }}" to json editor
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
    Then take part of "MultiYaxisArea" with name "actual/<image>"
    # And I compare source image "actual/<image>" with target image "expect/<image>"

    Examples:
      | min     |   max          |   image               |
      |   50    |     500       |   多Y轴图_min小于max    |
      |    ""   |     350        |   多Y轴图_min空        |
      | 50      |      ""        |   多Y轴图_max空        |

  Scenario Outline: rang-min大于max RZY-1338
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for "2000" millsecond
    And I set the parameter "SearchInput" with value "仪表盘多Y轴图"
    And I wait for "2000" millsecond
    And I click the detail which name is "仪表盘多Y轴图"
    And switch to window "仪表盘"
    And I close all tabs except main tab
    Then I will see the "dashboard.DetailPage" page
    And I click the "SettingIcon" button
    And I switch the dashboard "OpenEdit" button to "enable"
    And I click the "SettingIcon" button
    And I wait for "SuccessMessage" will be invisible
    When the chart title is "仪表盘多Y轴图" then I click the button which classname is "yotta-icon yotta-icon-DotEmblem" in dashboard
    And I click the "Edit" button
    Then I set the parameter "{  "title": "仪表盘多Y轴图",  "description": "",  "x": 0,  "y": 0,  "w": 12,  "h": 5,  "search": {    "query": "tag:sample04061424_display | stats count(apache.resp_len), max(apache.resp_len), min(apache.resp_len), sum(apache.status), avg(apache.resp_len) by apache.resp_len,apache.status | limit 10",    "startTime": "now/d",    "endTime": "now"  },  "chart": {    "chartType": "multiaxis",    "xAxis": {      "field": "apache.resp_len",      "labelRotate": "left",      "sortOrder": "default"    },    "yAxis": [      {        "fields": [          {            "color": "#2A76E4",            "connectNull": false,            "name": "count(apache.resp_len)",            "smooth": false,            "type": "line"          }        ],        "range": {          "min": <min>,          "max": <max>        },        "unit": ""      }    ],    "precision": "",    "showAllXAxisLabels": false,    "labelInterval": "",    "customLabel": "",    "byFields": [      "apache.status"    ],    "legend": {      "placement": "bottom"    }  }}" to json editor
    And I wait for "500" millsecond
    And I click the "Check" button
    And I wait for "ErrorMessage" will be visible
    And I will see the element "ErrorMessage" contains "<ErrorMessage>"
#    Then I wait for element "ErrorMessage" change text to "<ErrorMessage>"

    Examples:
      | min     |   max          |   ErrorMessage               |
      |  200    |     100        |   chart -> yAxis -> range -> 显示范围上限值(max)需大于显示范围下限值(min)    |

  Scenario: smooth为true RZY-1339,RZY-3733
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for "2000" millsecond
    And I set the parameter "SearchInput" with value "仪表盘多Y轴图"
    And I wait for "2000" millsecond
    And I click the detail which name is "仪表盘多Y轴图"
    And switch to window "仪表盘"
    And I close all tabs except main tab
    Then I will see the "dashboard.DetailPage" page
    And I click the "SettingIcon" button
    And I switch the dashboard "OpenEdit" button to "enable"
    And I click the "SettingIcon" button
    And I wait for "SuccessMessage" will be invisible
    When the chart title is "仪表盘多Y轴图" then I click the button which classname is "yotta-icon yotta-icon-DotEmblem" in dashboard
    And I click the "Edit" button
    Then I set the parameter "{  "title": "仪表盘多Y轴图",  "description": "",  "x": 0,  "y": 0,  "w": 12,  "h": 5,  "search": {    "query": "tag:sample04061424_display | stats count(apache.resp_len), max(apache.resp_len), min(apache.resp_len), sum(apache.status), avg(apache.resp_len) by apache.resp_len,apache.status | limit 10",    "startTime": "now/d",    "endTime": "now"  },  "chart": {    "chartType": "multiaxis",    "xAxis": {      "field": "apache.resp_len",      "labelRotate": "left",      "sortOrder": "default"    },    "yAxis": [      {        "fields": [          {            "color": "#2A76E4",            "connectNull": false,            "name": "count(apache.resp_len)",            "smooth": true,            "type": "line"          }        ],        "range": {},        "unit": ""      }    ],    "precision": "",    "showAllXAxisLabels": false,    "labelInterval": "",    "customLabel": "",    "byFields": [      "apache.status"    ],    "legend": {      "placement": "bottom"    }  }}" to json editor
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
    Then take part of "MultiYaxisArea" with name "actual/多Y轴图_smooth_true"
#    And I compare source image "actual/多Y轴图_smooth_true" with target image "expect/多Y轴图_smooth_true"

  Scenario Outline: byFields设为max(apache.resp_len) RZY-1341
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for "2000" millsecond
    And I set the parameter "SearchInput" with value "仪表盘多Y轴图"
    And I wait for "2000" millsecond
    And I click the detail which name is "仪表盘多Y轴图"
    And switch to window "仪表盘"
    And I close all tabs except main tab
    Then I will see the "dashboard.DetailPage" page
    And I click the "SettingIcon" button
    And I switch the dashboard "OpenEdit" button to "enable"
    And I click the "SettingIcon" button
    And I wait for "SuccessMessage" will be invisible
    When the chart title is "仪表盘多Y轴图" then I click the button which classname is "yotta-icon yotta-icon-DotEmblem" in dashboard
    And I click the "Edit" button
    Then I set the parameter "{  "title": "仪表盘多Y轴图",  "description": "",  "x": 0,  "y": 0,  "w": 12,  "h": 5,  "search": {    "query": "tag:sample04061424_display | stats count(apache.resp_len), max(apache.resp_len), min(apache.resp_len), sum(apache.status), avg(apache.resp_len) by apache.resp_len,apache.status | limit 10",    "startTime": "now/d",    "endTime": "now"  },  "chart": {    "chartType": "multiaxis",    "xAxis": {      "field": "apache.resp_len",      "labelRotate": "left",      "sortOrder": "default"    },    "yAxis": [      {        "fields": [          {            "color": "#2A76E4",            "connectNull": false,            "name": "count(apache.resp_len)",            "smooth": true,            "type": "line"          }        ],        "range": {},        "unit": ""      }    ],    "precision": "",    "showAllXAxisLabels": false,    "labelInterval": "",    "customLabel": "",    "byFields": [      "<byFields>"    ],    "legend": {      "placement": "bottom"    }  }}" to json editor
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
    Then take part of "MultiYaxisArea" with name "actual/<image>"
    # And I compare source image "actual/<image>" with target image "expect/<image>"

    Examples:
      |   byFields               |     image                |
      |  max(apache.resp_len)    |   多Y轴图_byFields_max(apache.resp_len)   |

  Scenario Outline: legend RZY-1344
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for "2000" millsecond
    And I set the parameter "SearchInput" with value "仪表盘多Y轴图"
    And I wait for "2000" millsecond
    And I click the detail which name is "仪表盘多Y轴图"
    And switch to window "仪表盘"
    And I close all tabs except main tab
    Then I will see the "dashboard.DetailPage" page
    And I click the "SettingIcon" button
    And I switch the dashboard "OpenEdit" button to "enable"
    And I click the "SettingIcon" button
    And I wait for "SuccessMessage" will be invisible
    When the chart title is "仪表盘多Y轴图" then I click the button which classname is "yotta-icon yotta-icon-DotEmblem" in dashboard
    And I click the "Edit" button
    Then I set the parameter "{  "title": "仪表盘多Y轴图",  "description": "",  "x": 0,  "y": 0,  "w": 12,  "h": 5,  "search": {    "query": "tag:sample04061424_display | stats count(apache.resp_len), max(apache.resp_len), min(apache.resp_len), sum(apache.status), avg(apache.resp_len) by apache.resp_len,apache.status | limit 10",    "startTime": "now/d",    "endTime": "now"  },  "chart": {    "chartType": "multiaxis",    "xAxis": {      "field": "apache.resp_len",      "labelRotate": "left",      "sortOrder": "default"    },    "yAxis": [      {        "fields": [          {            "color": "#2A76E4",            "connectNull": false,            "name": "count(apache.resp_len)",            "smooth": true,            "type": "line"          }        ],        "range": {},        "unit": ""      }    ],    "precision": "",    "showAllXAxisLabels": false,    "labelInterval": "",    "customLabel": "",    "byFields": [      "apache.status"    ],    "legend": {      "placement": "<legend>"    }  }}" to json editor
    And I wait for "500" millsecond
    And I click the "Check" button
    And I wait for "SuccessMessage" will be visible
    Then I will see the success message "校验通过"
    And I wait for "SuccessMessage" will be invisible
    And I click the "Ensure" button
    And I wait for "SuccessMessage" will be visible
    Then I will see the success message "配置成功"
    And I wait for loading invisible
    And I drag the scroll bar to the top
    And I wait for "2000" millsecond
    Then take part of "MultiYaxisLegend" with name "actual/<image>"
    # And I compare source image "actual/<image>" with target image "expect/<image>"

    Examples:
      | legend     |     image                |
      |  right     |   多Y轴图_legend_right    |

  Scenario Outline: legend RZY-1342
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for "2000" millsecond
    And I set the parameter "SearchInput" with value "仪表盘多Y轴图"
    And I wait for "2000" millsecond
    And I click the detail which name is "仪表盘多Y轴图"
    And switch to window "仪表盘"
    And I close all tabs except main tab
    Then I will see the "dashboard.DetailPage" page
    And I click the "SettingIcon" button
    And I switch the dashboard "OpenEdit" button to "enable"
    And I click the "SettingIcon" button
    And I wait for "SuccessMessage" will be invisible
    When the chart title is "仪表盘多Y轴图" then I click the button which classname is "yotta-icon yotta-icon-DotEmblem" in dashboard
    And I click the "Edit" button
    Then I set the parameter "{  "title": "仪表盘多Y轴图",  "description": "",  "x": 0,  "y": 0,  "w": 12,  "h": 5,  "search": {    "query": "tag:sample04061424_display | stats count(apache.resp_len), max(apache.resp_len), min(apache.resp_len), sum(apache.status), avg(apache.resp_len) by apache.resp_len,apache.status | limit 10",    "startTime": "now/d",    "endTime": "now"  },  "chart": {    "chartType": "multiaxis",    "xAxis": {      "field": "apache.resp_len",      "labelRotate": "left",      "sortOrder": "default"    },    "yAxis": [      {        "fields": [          {            "color": "#2A76E4",            "connectNull": false,            "name": "count(apache.resp_len)",            "smooth": true,            "type": "line"          }        ],        "range": {},        "unit": ""      }    ],    "precision": "",    "showAllXAxisLabels": false,    "labelInterval": "",    "customLabel": "",    "byFields": [      "apache.status"    ],    "legend": {      "placement": "<legend>"    }  }}" to json editor
    And I wait for "500" millsecond
    And I click the "Check" button
    And I wait for "SuccessMessage" will be visible
    Then I will see the success message "校验通过"
    And I wait for "SuccessMessage" will be invisible
    And I click the "Ensure" button
    And I wait for "SuccessMessage" will be visible
    Then I will see the success message "配置成功"
    And I wait for loading invisible
    And I drag the scroll bar to the top
    And I wait for "2000" millsecond
    Then I will see the element "MultiYaxisLegend" style contains "<style>"

    Examples:
      | legend     |     style         |
      |  bottom    |   height: 40px    |

  Scenario Outline: legend为none RZY-1343
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for "2000" millsecond
    And I set the parameter "SearchInput" with value "仪表盘多Y轴图"
    And I wait for "2000" millsecond
    And I click the detail which name is "仪表盘多Y轴图"
    And switch to window "仪表盘"
    And I close all tabs except main tab
    Then I will see the "dashboard.DetailPage" page
    And I click the "SettingIcon" button
    And I switch the dashboard "OpenEdit" button to "enable"
    And I click the "SettingIcon" button
    And I wait for "SuccessMessage" will be invisible
    When the chart title is "仪表盘多Y轴图" then I click the button which classname is "yotta-icon yotta-icon-DotEmblem" in dashboard
    And I click the "Edit" button
    Then I set the parameter "{  "title": "仪表盘多Y轴图",  "description": "",  "x": 0,  "y": 0,  "w": 12,  "h": 5,  "search": {    "query": "tag:sample04061424_display | stats count(apache.resp_len), max(apache.resp_len), min(apache.resp_len), sum(apache.status), avg(apache.resp_len) by apache.resp_len,apache.status | limit 10",    "startTime": "now/d",    "endTime": "now"  },  "chart": {    "chartType": "multiaxis",    "xAxis": {      "field": "apache.resp_len",      "labelRotate": "left",      "sortOrder": "default"    },    "yAxis": [      {        "fields": [          {            "color": "#2A76E4",            "connectNull": false,            "name": "count(apache.resp_len)",            "smooth": true,            "type": "line"          }        ],        "range": {},        "unit": ""      }    ],    "precision": "",    "showAllXAxisLabels": false,    "labelInterval": "",    "customLabel": "",    "byFields": [      "apache.status"    ],    "legend": {      "placement": "<legend>"    }  }}" to json editor
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
    Then I wait for "MultiYaxisLegend" will be invisible

    Examples:
      | legend   |
      |  none    |

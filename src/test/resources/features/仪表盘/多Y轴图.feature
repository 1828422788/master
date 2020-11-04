@dashboard1
Feature: 仪表盘多Y轴图

  @dashboard @dashboardSmoke
  Scenario Outline: 新建仪表盘
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I click the "Create" button
    When I set the parameter "DashBoardName" with value "<name>"
    And I click the "Ensure" button
    Then I will see the success message "新建仪表盘成功"

    Examples:
      | name    |
      | 仪表盘多Y轴图 |

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
      | spl                                                                                                                                                                             | name    |
      | tag:*display \| stats count(apache.resp_len), max(apache.resp_len), min(apache.resp_len), sum(apache.status), avg(apache.resp_len) by apache.resp_len,apache.status \| limit 10 | 仪表盘多Y轴图 |

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
      | 多Y轴图 |

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
      | 仪表盘多Y轴图 |

  @dashboard @dashboardSmoke
  Scenario Outline: 修改为多Y轴图 RZY-309
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "<name>"
    Then I will see the "dashboard.DetailPage" page
    And I wait for "Progress" will be invisible
    And I click the "ChartType" button
    Then I will see the "trend.CreatePage" page
    And I wait for "Compound" will be visible
    And I click the "Compound" button
    And I click the "<targetName>" button
    And I hide the element "Content"
    And I wait for "1000" millsecond
    And I click the "Setting" button under some element
    And I choose the "apache.resp_len" from the "DataValue"
    And I click the "Yaxis" button
    And I click the "AddField" button
#    And I choose the "max(apache.resp_len)" from the "DataValue"
#    And I choose the "面积图" from the "TypeDropdown"
#    And I set the parameter "Unit" with value "面"
#    And I click the "Smooth" button
#    And I click the "ConnectEmptyData" button
#    And I click the "AddField" button
    And I choose the "max(apache.resp_len)" from the "DataValue2"
    And I choose the "柱状图" from the "TypeDropdown"
    And I set the parameter "Unit" with value "柱"
    And I set the parameter "Min" with value "2"
#    And I click the "AddField" button
#    And I choose the "sum(apache.status)" from the "DataValue"
#    And I choose the "散点图" from the "TypeDropdown"
#    And I set the parameter "Unit" with value "散"
#    And I set the parameter "Max" with value "49000"
    And I click the "Group" button
    And I click the "AddField" button
    And I choose the "apache.status" from the "DataValue"
    And I click the "Exhibition" button
    And I click the "StartColour" button
    And I click the "Red" button
    Then I click the "Generate" button
    And I wait for "1000" millsecond
    Then I hide the element "SettingContent"
    And I wait for "Progress" will be invisible
    Then I will see the "dashboard.DetailPage" page
    And I click the "TrendTitle" button
    And take part of "FullScreen" with name "dashboard/<name>"
#    Then I compare source image "dashboard/<name>" with target image "dashboard/<targetName>"

    Examples:
      | name    | targetName |
      | 仪表盘多Y轴图 | Multiaxis  |

  @dashboard @dashboardSmoke
  Scenario Outline: labelRotate-left-right-horizontal-vertical RZY-1325,RZY-1326,RZY-1327,RZY-1328
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "<name>"
    Then I will see the "dashboard.DetailPage" page
    And I wait for "Progress" will be invisible
    When the chart title is "<name>" then I click the button which classname is "anticon css-ifnfqv ant-dropdown-trigger" in dashboard
    And I click the "Edit" button
    Then I set the parameter "{  "title": "仪表盘多Y轴图",  "description": "",  "x": 0,  "y": 0,  "w": 12,  "h": 5,  "search": {    "query": "tag:*display | stats count(apache.resp_len), max(apache.resp_len), min(apache.resp_len), sum(apache.status), avg(apache.resp_len) by apache.resp_len,apache.status | limit 10",    "startTime": "now/d",    "endTime": "now"  },  "chart": {    "chartType": "multiaxis",    "xAxis": {      "field": "apache.resp_len",      "labelRotate": "<labelRotate>",      "sortOrder": "default"    },    "precision": "",    "showAllXAxisLabels": false,    "labelInterval": "",    "customLabel": "",    "yAxis": [      {        "type": "line",        "field": "count(apache.resp_len)",        "smooth": false,        "unit": "",        "connectNull": false,        "range": {          "min": "",          "max": ""        }      },      {        "type": "column",        "field": "max(apache.resp_len)",        "unit": "柱",        "connectNull": false,        "range": {          "min": "2",          "max": ""        }      }    ],    "byFields": [      "apache.status"    ],    "legend": {      "placement": "bottom"    }  }}" to json editor
    And I wait for "500" millsecond
    And I click the "Check" button
#    Then I will see the success message "校验通过"
    Then I click the "Ensure" button
    And I wait for loading invisible
    And I wait for "2000" millsecond
    Then I will see the element "XaxisField" transform contains "<rotate>"

    Examples:
      | name        |   labelRotate  |  rotate       |
      | 仪表盘多Y轴图 |      left      |  rotate(-45)  |
      | 仪表盘多Y轴图 |      right     |  rotate(45)   |
      | 仪表盘多Y轴图 |   horizontal   |  rotate(0)    |
      | 仪表盘多Y轴图 |    vertical    |  rotate(-90)  |

  @dashboard @dashboardSmoke
  Scenario: 设置对象个数为空 RZY-1333
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "仪表盘多Y轴图"
    Then I will see the "dashboard.DetailPage" page
    And I wait for "Progress" will be invisible
    When the chart title is "仪表盘多Y轴图" then I click the button which classname is "anticon css-ifnfqv ant-dropdown-trigger" in dashboard
    And I click the "Edit" button
    Then I set the parameter "{  "title": "仪表盘多Y轴图",  "description": "",  "x": 0,  "y": 0,  "w": 12,  "h": 5,  "search": {    "query": "tag:*display | stats count(apache.resp_len), max(apache.resp_len), min(apache.resp_len), sum(apache.status), avg(apache.resp_len) by apache.resp_len,apache.status | limit 10",    "startTime": "now/d",    "endTime": "now"  },  "chart": {    "chartType": "multiaxis",    "xAxis": {      "field": "apache.resp_len",      "labelRotate": "left",      "sortOrder": "default"    },    "precision": "",    "showAllXAxisLabels": false,    "labelInterval": "",    "customLabel": "",    "yAxis": [],    "byFields": [      "apache.status"    ],    "legend": {      "placement": "bottom"    }  }}" to json editor
    And I wait for "500" millsecond
    And I click the "Check" button
    Then I wait for element "ErrorMessage" change text to "chart -> yAxis 字段值不能为空"

  @dashboard @dashboardSmoke
  Scenario Outline: 设置对象个数为1个，修改type为area RZY-1332,RZY-1334,RZY-3727,RZY-3728,RZY-3729
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "仪表盘多Y轴图"
    Then I will see the "dashboard.DetailPage" page
    And I wait for "Progress" will be invisible
    When the chart title is "仪表盘多Y轴图" then I click the button which classname is "anticon css-ifnfqv ant-dropdown-trigger" in dashboard
    And I click the "Edit" button
    Then I set the parameter "{  "title": "仪表盘多Y轴图",  "description": "",  "x": 0,  "y": 0,  "w": 12,  "h": 5,  "search": {    "query": "tag:*display | stats count(apache.resp_len), max(apache.resp_len), min(apache.resp_len), sum(apache.status), avg(apache.resp_len) by apache.resp_len,apache.status | limit 10",    "startTime": "now/d",    "endTime": "now"  },  "chart": {    "chartType": "multiaxis",    "xAxis": {      "field": "apache.resp_len",      "labelRotate": "left",      "sortOrder": "default"    },    "precision": "",    "showAllXAxisLabels": false,    "labelInterval": "",    "customLabel": "",    "yAxis": [      {        "type": "<type>",        "field": "count(apache.resp_len)",        "smooth": false,        "unit": "",        "connectNull": false,        "range": {          "min": "",          "max": ""        }      }],    "byFields": [      "apache.status"    ],    "legend": {      "placement": "bottom"    }  }}" to json editor
    And I wait for "500" millsecond
    And I click the "Check" button
    Then I will see the success message "校验通过"
    And I wait for "500" millsecond
    Then I click the "Ensure" button
    And I wait for loading invisible
    And I wait for "2000" millsecond
    Then take part of "MultiYaxisArea" with name "actual/<image>"
    And I compare source image "actual/<image>" with target image "expect/<image>"

    Examples:
      | type    |   image        |
      | area    | 多Y轴图_area    |
      | scatter | 多Y轴图_scatter |
      | column  | 多Y轴图_column  |
      | line    | 多Y轴图_line    |

  @dashboard @dashboardSmoke
  Scenario: 将field字段值改为min(apache.resp_len) RZY-1335
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "仪表盘多Y轴图"
    Then I will see the "dashboard.DetailPage" page
    And I wait for "Progress" will be invisible
    When the chart title is "仪表盘多Y轴图" then I click the button which classname is "anticon css-ifnfqv ant-dropdown-trigger" in dashboard
    And I click the "Edit" button
    Then I set the parameter "{  "title": "仪表盘多Y轴图",  "description": "",  "x": 0,  "y": 0,  "w": 12,  "h": 5,  "search": {    "query": "tag:*display | stats count(apache.resp_len), max(apache.resp_len), min(apache.resp_len), sum(apache.status), avg(apache.resp_len) by apache.resp_len,apache.status | limit 10",    "startTime": "now/d",    "endTime": "now"  },  "chart": {    "chartType": "multiaxis",    "xAxis": {      "field": "apache.resp_len",      "labelRotate": "left",      "sortOrder": "default"    },    "precision": "",    "showAllXAxisLabels": false,    "labelInterval": "",    "customLabel": "",    "yAxis": [      {        "type": "line",        "field": "min(apache.resp_len)",        "smooth": false,        "unit": "",        "connectNull": false,        "range": {          "min": "",          "max": ""        }      }],    "byFields": [      "apache.status"    ],    "legend": {      "placement": "bottom"    }  }}" to json editor
    And I wait for "500" millsecond
    And I click the "Check" button
    Then I will see the success message "校验通过"
    And I wait for "500" millsecond
    Then I click the "Ensure" button
    And I wait for loading invisible
    And I wait for "2000" millsecond
    Then take part of "MultiYaxisArea" with name "actual/多Y轴图_修改Yfield"
    And I compare source image "actual/<image>" with target image "expect/<image>"

  @dashboard @dashboardSmoke
  Scenario Outline: rang RZY-1336
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "仪表盘多Y轴图"
    Then I will see the "dashboard.DetailPage" page
    And I wait for "Progress" will be invisible
    When the chart title is "仪表盘多Y轴图" then I click the button which classname is "anticon css-ifnfqv ant-dropdown-trigger" in dashboard
    And I click the "Edit" button
    Then I set the parameter "{  "title": "仪表盘多Y轴图",  "description": "",  "x": 0,  "y": 0,  "w": 12,  "h": 5,  "search": {    "query": "tag:*display | stats count(apache.resp_len), max(apache.resp_len), min(apache.resp_len), sum(apache.status), avg(apache.resp_len) by apache.resp_len,apache.status | limit 10",    "startTime": "now/d",    "endTime": "now"  },  "chart": {    "chartType": "multiaxis",    "xAxis": {      "field": "apache.resp_len",      "labelRotate": "left",      "sortOrder": "default"    },    "precision": "",    "showAllXAxisLabels": false,    "labelInterval": "",    "customLabel": "",    "yAxis": [      {        "type": "line",        "field": "count(apache.resp_len)",        "smooth": false,        "unit": "",        "connectNull": false,        "range": {          "min": "<min>",          "max": "<max>"        }      }],    "byFields": [      "apache.status"    ],    "legend": {      "placement": "bottom"    }  }}" to json editor
    And I wait for "500" millsecond
    And I click the "Check" button
    Then I will see the success message "校验通过"
    And I wait for "500" millsecond
    Then I click the "Ensure" button
    And I wait for loading invisible
    And I wait for "2000" millsecond
    Then take part of "MultiYaxisArea" with name "actual/<image>"
    And I compare source image "actual/<image>" with target image "expect/<image>"

    Examples:
      | min     |   max          |   image               |
      |   50    |     500       |   多Y轴图_min小于max    |
      |         |     350        |   多Y轴图_min空        |
      | 100     |                |   多Y轴图_max空        |

  @cleanDashboard
  Scenario Outline: 删除仪表盘
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    When the data name is "<name>" then i click the "删除" button
    And I wait for "Ensure" will be visible
    And I click the "Ensure" button
    Then I will see the success message "删除仪表盘成功"

    Examples:
      | name    |
      | 仪表盘多Y轴图 |

  @cleanDashboard
  Scenario Outline: 删除仪表盘所建趋势图
    Given open the "trend.ListPage" page for uri "/trend/"
    When the data name is "<name>" then i click the "删除" button
    And I wait for "Ensure" will be visible
    And I click the "Ensure" button
    And I will see the success message "删除成功"

    Examples:
      | name    |
      | 仪表盘多Y轴图 |
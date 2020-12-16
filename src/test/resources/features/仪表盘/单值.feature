Feature: 仪表盘单值

  @dashboard @dashboardSmoke
  Scenario Outline: 新建仪表盘
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I click the "Create" button
    When I set the parameter "DashBoardName" with value "<name>"
    And I click the "Ensure" button
    Then I will see the success message "新建仪表盘成功"

    Examples:
      | name  |
      | 仪表盘单值 |

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
      | spl                                                                                                | name  |
      | tag:sample04061424_display \| stats avg(apache.status) as a_\|eval icon=if(a_>300,\"thumbs-down\",\"thumbs-up\") | 仪表盘单值 |

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
      | 单值   |

  @dashboard @dashboardSmoke
  Scenario: 添加图表
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "仪表盘单值"
    Then I will see the "dashboard.DetailPage" page
    And I wait for "AddEventButton" will be visible
    And I click the "AddEventButton" button
    And I click the "AddChart" button
    And I wait for "SpinDot" will be invisible
    And I set the parameter "SearchChartInput" with value "仪表盘单值"
    And I wait for loading invisible
#    And I choose the "添加图表" from the "EventList"
    And I "checked" the checkbox which name is "仪表盘单值"
    And I click the "Ensure" button
    And I wait for "2000" millsecond

  @dashboard @dashboardSmoke
  Scenario: 修改为单值 RZY-342
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "仪表盘单值"
    Then I will see the "dashboard.DetailPage" page
    And I click the "ChartType" button
    And I wait for "1000" millsecond
    Then I will see the "trend.CreatePage" page
    And I wait for "2000" millsecond
    And I click the "Other" button
    And I click the "Single" button
    And I hide the element "Content"
    And I click the "Setting" button under some element
    And I choose the "a_" from the "DataField"
    And I choose the "icon" from the "DisplayField"
    And I click the "Exhibition" button
    And I set the parameter "WordSize" with value "30"
    And I choose the "3" from the "DataPrecision"
    And I click the "ThousandSeparator" button
    And I set the parameter "Unit" with value "个"
    Then I click the "Generate" button
    And I wait for "1000" millsecond
    And I click the "Setting" button under some element
#    Then I hide the element "SettingContent"
    Then I will see the "dashboard.DetailPage" page
    And I wait for "2000" millsecond
    And I click the "TrendTitle" button under some element
    And I wait for "3000" millsecond
#    And take part of "FullScreen" with name "dashboard/仪表盘单值"
#    Then I compare source image "dashboard/仪表盘单值" with target image "dashboard/single"

  @dashboard @dashboardSmoke
  Scenario Outline: 验证配置是否在高级编辑中体现 RZY-3737
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "<name>"
    Then I will see the "dashboard.DetailPage" page
    When the chart title is "<name>" then I click the button which classname is "anticon css-ifnfqv ant-dropdown-trigger" in dashboard
    And I click the "Edit" button
    Then I will see the "TextLayer" result will contain "<json>"
#    Then I will see the "TextLayer" result will be "<json>"

    Examples:
      | name    | json                                                                                                                                                                                                                                                                                                                                                                                           |
      | 仪表盘单值 |  \n  "chart": {\n    "chartType": "single",\n    "field": "a_",\n    "fontSize": "30",\n    "precision": "3",\n    "useThousandSeparators": true,\n    "unit": "个",\n    "unitPosition": "after",\n    "displayField": "icon",\n    "subtitle": "",\n    "useSparkline": false,\n    "sparklineXAxisField": "",\n    "singleFieldDisplayType": "default",\n    "singleChartIcon": "none",\n |

  @dashboard @dashboardSmoke
  Scenario: 单值图的千分隔符
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "仪表盘单值"
    Then I will see the "dashboard.DetailPage" page
    When the chart title is "仪表盘单值" then I click the button which classname is "anticon css-ifnfqv ant-dropdown-trigger" in dashboard
    And I click the "Configs" button
    And I wait for loading invisible
    And I wait for "500" millsecond
    And I set the parameter "Spl" with value "* | stats count()"
    And I click the "Ensure" button
    And I wait for "Ensure" will be invisible
    And I wait for "500" millsecond
    And I click the "Setting" button
    Then I will see the "trend.CreatePage" page
    And I choose the "count()" from the "DataField"
    Then I click the "Generate" button
    And I wait for "1000" millsecond
    And I click the "Setting" button
#    Then I hide the element "SettingContent"
    Then I will see the "dashboard.DetailPage" page
    And I wait for "2000" millsecond
    And I click the "TrendTitle" button under some element
    And I wait for "3000" millsecond
    Then I will see the "DashboardSingleValue" result will contain ","
#    Then I will see the "TextLayer" result will be "<json>"

  @dashboard @dashboardSmoke
  Scenario Outline: 验证单值图的fontSize RZY-1345,RZY-1346,RZY-1347,RZY-1348,RZY-1349
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "仪表盘单值"
    Then I will see the "dashboard.DetailPage" page
    When the chart title is "仪表盘单值" then I click the button which classname is "anticon css-ifnfqv ant-dropdown-trigger" in dashboard
    And I click the "Edit" button
    And I set the parameter "{"title": "仪表盘单值","description": "","x": 0,"y": 0,"w": 12,"h": 5,"search": {"query": "tag:*display | stats avg(apache.status) as a_|eval icon=if(a_>300,\"thumbs-down\",\"thumbs-up\")","startTime": "now/d","endTime": "now"},"chart": {"chartType": "single","field": "a_","fontSize": "<fontSize>","useThousandSeparators": false,"unit": "个","unitPosition": "after","displayField": "icon","subtitle": "","useSparkline": false,"singleChartIcon": "none","sparklineXAxisField": "","displayMode": "default","color": "#5C9DF5","colorFillingMode": "font","liveRefreshMode": false}}" to json editor
    And I wait for "500" millsecond
    And I click the "Check" button
    Then I wait for element "<status>" change text to "<message>"

    Examples:
      | fontSize | status         | message                                       |
      | 0        | ErrorMessage   | chart -> fontSize -> 展示字体值的有效范围为 14 ～ 1000 px |
      | 13       | ErrorMessage   | chart -> fontSize -> 展示字体值的有效范围为 14 ～ 1000 px |
      | 1001     | ErrorMessage   | chart -> fontSize -> 展示字体值的有效范围为 14 ～ 1000 px |
      | 1000     | SuccessMessage | 校验通过                                          |
      | 14       | SuccessMessage | 校验通过                                          |

  @dashboard @dashboardSmoke
  Scenario Outline: 验证单值图的color RZY-1350,RZY-1351
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "仪表盘单值"
    Then I will see the "dashboard.DetailPage" page
    When the chart title is "仪表盘单值" then I click the button which classname is "anticon css-ifnfqv ant-dropdown-trigger" in dashboard
    And I click the "Edit" button
#    And I set the parameter "{"title": "仪表盘单值","description": "","x": 0,"y": 0,"w": 12,"h": 5,"search": {"query": "tag:*display | stats avg(apache.status) as a_|eval icon=if(a_>300,\"thumbs-down\",\"thumbs-up\")","startTime": "now/d","endTime": "now"},"chart": {"chartType": "single","field": "a_","fontSize": "100","singleChartIcon": "none","displayMode": "default","color": "<color>","colorFillingMode": "font","liveRefreshMode": false}}" to json editor
    And I set the parameter "{"title": "仪表盘单值","description": "","x": 0,"y": 0,"w": 12,"h": 5,"search": {"query": "tag:*display | stats avg(apache.status) as a_|eval icon=if(a_>300,\"thumbs-down\",\"thumbs-up\")","startTime": "now/d","endTime": "now"},"chart": {"chartType": "single","field": "a_","fontSize": "100","useThousandSeparators": false,"unit": "个","unitPosition": "after","displayField": "icon","subtitle": "","useSparkline": false,"singleChartIcon": "none","sparklineXAxisField": "","displayMode": "default","color": "<color>","colorFillingMode": "font","liveRefreshMode": false}}" to json editor
    And I wait for "500" millsecond
    And I click the "Check" button
    Then I wait for element "<status>" change text to "<message>"

    Examples:
      | color | status         | message               |
      |       | ErrorMessage   | chart -> color 字段值不能为空 |
      | 1     | SuccessMessage | 校验通过                  |

  @dashboard @dashboardSmoke
  Scenario Outline: 验证单值图的展示字段
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "仪表盘单值"
    Then I will see the "dashboard.DetailPage" page
    When the chart title is "仪表盘单值" then I click the button which classname is "anticon css-ifnfqv ant-dropdown-trigger" in dashboard
    And I click the "Edit" button
#    And I set the parameter "{"title": "仪表盘单值","description": "","x": 0,"y": 0,"w": 12,"h": 5,"search": {"query": "tag:*display | stats avg(apache.status) as a_|eval icon=if(a_>300,\"thumbs-down\",\"thumbs-up\")","startTime": "now/d","endTime": "now"},"chart": {"chartType": "single","field": "a_","fontSize": "100","singleChartIcon": "none","displayMode": "trending","color": "#5C9DF5","colorFillingMode": "font","liveRefreshMode": false}}" to json editor
    And I set the parameter "{"title": "仪表盘单值","description": "","x": 0,"y": 0,"w": 12,"h": 5,"search": {"query": "tag:*display | stats avg(apache.status) as a_|eval icon=if(a_>300,\"thumbs-down\",\"thumbs-up\")","startTime": "now/d","endTime": "now"},"chart": {"chartType": "single","field": "a_","fontSize": "100","useThousandSeparators": false,"unit": "个","unitPosition": "after","displayField": "icon","subtitle": "","useSparkline": false,"singleChartIcon": "none","sparklineXAxisField": "","displayMode": "trending","color": "#5C9DF5","colorFillingMode": "font","liveRefreshMode": false}}" to json editor
    And I wait for "500" millsecond
    And I click the "Check" button
    Then I wait for element "<status>" change text to "<message>"

    Examples:
      | status       | message                       |
      | ErrorMessage | chart -> comparsionTime 字段为必填项 |

  @dashboard @dashboardSmoke
  Scenario Outline: 单值图按趋势展示
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "仪表盘单值"
    Then I will see the "dashboard.DetailPage" page
    When the chart title is "仪表盘单值" then I click the button which classname is "anticon css-ifnfqv ant-dropdown-trigger" in dashboard
    And I click the "Edit" button
    And I set the parameter "{"title": "仪表盘单值","description": "","x": 0,"y": 0,"w": 12,"h": 5,"search": {"query": "tag:*display | stats avg(apache.status) as a_|eval icon=if(a_>300,\"thumbs-down\",\"thumbs-up\")","startTime": "now/d","endTime": "now"},"chart": {"chartType": "single","field": "a_","fontSize": "24","singleChartIcon": "none","displayMode": "default","comparsionTime": "-7d","comparsionMode": "percent","color": "#5C9DF5","colorFillingMode": "font","liveRefreshMode": false}}" to json editor
    And I wait for "500" millsecond
    And I click the "Check" button
    Then I will see the error message "<message>"

    Examples:
      | message                              |
      | chart -> useThousandSeparators 字段为必填项 |

  @dashboard @dashboardSmoke
  Scenario Outline: 单值图按区间展示
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "仪表盘单值"
    Then I will see the "dashboard.DetailPage" page
    When the chart title is "仪表盘单值" then I click the button which classname is "anticon css-ifnfqv ant-dropdown-trigger" in dashboard
    And I click the "Edit" button
    And I set the parameter "{"title": "仪表盘单值","description": "","x": 0,"y": 0,"w": 12,"h": 5,"search": {"query": "tag:*display | stats avg(apache.status) as a_|eval icon=if(a_>300,\"thumbs-down\",\"thumbs-up\")","startTime": "now/d","endTime": "now"},"chart": {"chartType": "single","field": "a_","fontSize": "24","precision": "1","useThousandSeparators": false,"unit": "ge","unitPosition": "after","displayField": "chart","subtitle": "","useSparkline": false,"sparklineXAxisField": "","singleChartIcon": "fixed","fixedSetting": "","displayMode": "<mode>","colorFillingMode": "font","colorRanges": [{"from":"100","to":"<to>","color":"#259B24"}]}}" to json editor
    And I wait for "500" millsecond
    And I click the "Check" button
    Then I wait for element "ErrorMessage" change text to "<message>"

    Examples:
      | mode    | to  | message                                  |
      | default | 300 | chart -> color 字段为必填项                     |
      | ranging | 1   | chart -> colorRanges -> 颜色范围区间结束值需要大于开始值 |

    ###########

  @dashboard @dashboardSmoke
  Scenario: 恢复至初始 RZY-296,RZY-3391
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "仪表盘单值"
    Then I will see the "dashboard.DetailPage" page
    And I wait for "Progress" will be invisible
    When the chart title is "仪表盘单值" then I click the button which classname is "anticon css-ifnfqv ant-dropdown-trigger" in dashboard
#    And I click the "ChartSetting" button
    And I click the "Recover" button
    And I wait for loading invisible
    And I click the "Ensure" button
#    And I click the "SettingEnsure" button
    And I wait for "Progress" will be invisible
    Then I wait for "Table" will be visible

  @dashboard @dashboardSmoke
  Scenario: 时间范围选择 RZY-3392
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "仪表盘单值"
    Then I will see the "dashboard.DetailPage" page
    And I wait for "Progress" will be invisible
    And I click the "TimeRangeDanzhi" button
    And I wait for "1000" millsecond
    And I click the "RecentSevenDay1" button
    And I wait for loading invisible
    Then I wait for element "TimeRangeDanzhi" change text to "最近7天"

  @dashboard @dashboardSmoke
  Scenario Outline: RZY-3694修改表格chartType
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "仪表盘单值"
    Then I will see the "dashboard.DetailPage" page
    And I wait for "500" millsecond
    When the chart title is "仪表盘单值" then I click the button which classname is "anticon css-ifnfqv ant-dropdown-trigger" in dashboard
    And I click the "Edit" button
    And I set the parameter "{"title": "仪表盘单值","description": "","x": 0,"y": 0,"w": 12,"h": 5,"search": {"query": "tag:*display | stats avg(apache.status) as a_|eval icon=if(a_>300,\"thumbs-down\",\"thumbs-up\")","startTime": "now/d","endTime": "now"},"chart": {"chartType": "<chartType>"}}" to json editor
    And I wait for "500" millsecond
    And I click the "Check" button
    Then I wait for element "ErrorMessage" change text to "<ErrorMessage>"

    Examples:
      | chartType    | ErrorMessage                       |
      | line         | chart -> xAxis 字段为必填项          |
      | pie          | chart -> field 字段为必填项          |
      | hello        | chart -> chartType 字段值不支持hello |

  @dashboard @dashboardSmoke
  Scenario Outline: 图标-按字段 RZY-3741
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "仪表盘单值"
    Then I will see the "dashboard.DetailPage" page
    And I wait for "500" millsecond
    When the chart title is "仪表盘单值" then I click the button which classname is "anticon css-ifnfqv ant-dropdown-trigger" in dashboard
    And I click the "Edit" button
    And I set the parameter "{  "title": "仪表盘单值",  "description": "",  "x": 0,  "y": 0,  "w": 12,  "h": 5,  "search": {    "query": "tag:sample04061424_display | stats avg(apache.status) as a_|eval icon=if(a_>300,\"thumbs-down\",\"thumbs-up\")",    "startTime": "now/d",    "endTime": "now"  },  "chart": {    "chartType": "single",    "field": "a_",    "fontSize": "30",    "precision": "3",    "useThousandSeparators": false,    "unit": "个",    "unitPosition": "after",    "displayField": "icon",    "subtitle": "",    "useSparkline": false,    "sparklineXAxisField": "",    "singleFieldDisplayType": "default",    "singleChartIcon": "<singleChartIcon>",    "iconField": "icon",    "displayMode": "default",    "color": "#5C9DF5",    "colorFillingMode": "font",    "liveRefreshMode": false  }}" to json editor
    And I wait for "500" millsecond
    And I click the "Check" button
    And I wait for "500" millsecond
    Then I click the "Ensure" button
    And I wait for loading invisible
    And I wait for "2000" millsecond
    Then take part of "SingleValueDiv" with name "actual/<image>"
    And I compare source image "actual/<image>" with target image "expect/<image>"

    Examples:
      | singleChartIcon |   image            |
      |   field         |   单值_图标-按字段    |

  @dashboard @dashboardSmoke
  Scenario Outline: 图标-按名称 RZY-3742
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "仪表盘单值"
    Then I will see the "dashboard.DetailPage" page
    And I wait for "500" millsecond
    When the chart title is "仪表盘单值" then I click the button which classname is "anticon css-ifnfqv ant-dropdown-trigger" in dashboard
    And I click the "Edit" button
    And I set the parameter "{  "title": "仪表盘单值",  "description": "",  "x": 0,  "y": 0,  "w": 12,  "h": 5,  "search": {    "query": "tag:sample04061424_display | stats avg(apache.status) as a_|eval icon=if(a_>300,\"thumbs-down\",\"thumbs-up\")",    "startTime": "now/d",    "endTime": "now"  },  "chart": {    "chartType": "single",    "field": "a_",    "fontSize": "30",    "precision": "3",    "useThousandSeparators": false,    "unit": "个",    "unitPosition": "after",    "displayField": "icon",    "subtitle": "",    "useSparkline": false,    "sparklineXAxisField": "",    "singleFieldDisplayType": "default",    "singleChartIcon": "<singleChartIcon>",    "fixedSetting": "search",    "displayMode": "default",    "color": "#5C9DF5",    "colorFillingMode": "font",    "liveRefreshMode": false  }}" to json editor
    And I wait for "500" millsecond
    And I click the "Check" button
    And I wait for "500" millsecond
    Then I click the "Ensure" button
    And I wait for loading invisible
    And I wait for "2000" millsecond
    Then take part of "SingleValueDiv" with name "actual/<image>"
    And I compare source image "actual/<image>" with target image "expect/<image>"

    Examples:
      | singleChartIcon |   image            |
      |   fixed         |   单值_图标-按名称    |

  @dashboard @dashboardSmoke
  Scenario Outline: 图标-无 RZY-3743
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "仪表盘单值"
    Then I will see the "dashboard.DetailPage" page
    And I wait for "500" millsecond
    When the chart title is "仪表盘单值" then I click the button which classname is "anticon css-ifnfqv ant-dropdown-trigger" in dashboard
    And I click the "Edit" button
    And I set the parameter "{  "title": "仪表盘单值",  "description": "",  "x": 0,  "y": 0,  "w": 12,  "h": 5,  "search": {    "query": "tag:sample04061424_display | stats avg(apache.status) as a_|eval icon=if(a_>300,\"thumbs-down\",\"thumbs-up\")",    "startTime": "now/d",    "endTime": "now"  },  "chart": {    "chartType": "single",    "field": "a_",    "fontSize": "30",    "precision": "3",    "useThousandSeparators": false,    "unit": "个",    "unitPosition": "after",    "displayField": "icon",    "subtitle": "",    "useSparkline": false,    "sparklineXAxisField": "",    "singleFieldDisplayType": "default",    "singleChartIcon": "<singleChartIcon>",    "displayMode": "default",    "color": "#5C9DF5",    "colorFillingMode": "font",    "liveRefreshMode": false  }}" to json editor
    And I wait for "500" millsecond
    And I click the "Check" button
    And I wait for "500" millsecond
    Then I click the "Ensure" button
    And I wait for loading invisible
    And I wait for "2000" millsecond
    Then take part of "SingleValueDiv" with name "actual/<image>"
    And I compare source image "actual/<image>" with target image "expect/<image>"

    Examples:
      | singleChartIcon |   image            |
      |   none          |   单值_图标-无       |

  @dashboard @dashboardSmoke
  Scenario Outline: 默认只改为trending RZY-3745
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "仪表盘单值"
    Then I will see the "dashboard.DetailPage" page
    And I wait for "500" millsecond
    When the chart title is "仪表盘单值" then I click the button which classname is "anticon css-ifnfqv ant-dropdown-trigger" in dashboard
    And I click the "Edit" button
    And I set the parameter "{  "title": "仪表盘单值",  "description": "",  "x": 0,  "y": 0,  "w": 12,  "h": 5,  "search": {    "query": "tag:sample04061424_display | stats avg(apache.status) as a_|eval icon=if(a_>300,\"thumbs-down\",\"thumbs-up\")",    "startTime": "now/d",    "endTime": "now"  },  "chart": {    "chartType": "single",    "field": "a_",    "fontSize": "30",    "precision": "3",    "useThousandSeparators": false,    "unit": "个",    "unitPosition": "after",    "displayField": "icon",    "subtitle": "",    "useSparkline": false,    "sparklineXAxisField": "",    "singleFieldDisplayType": "default",    "singleChartIcon": "none",    "displayMode": "<displayMode>",    "color": "#5C9DF5",    "colorFillingMode": "font",    "liveRefreshMode": false  }}" to json editor
    And I wait for "500" millsecond
    And I click the "Check" button
    Then I wait for element "ErrorMessage" change text to "<ErrorMessage>"

    Examples:
      | displayMode |  ErrorMessage                      |
      |   trending  |  chart -> comparsionTime 字段为必填项 |

  @dashboard @dashboardSmoke
  Scenario Outline: 默认-color RZY-3745
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "仪表盘单值"
    Then I will see the "dashboard.DetailPage" page
    And I wait for "500" millsecond
    When the chart title is "仪表盘单值" then I click the button which classname is "anticon css-ifnfqv ant-dropdown-trigger" in dashboard
    And I click the "Edit" button
    And I wait for "500" millsecond
    And I set the parameter "{  "title": "仪表盘单值",  "description": "",  "x": 0,  "y": 0,  "w": 12,  "h": 5,  "search": {    "query": "tag:sample04061424_display | stats avg(apache.status) as a_|eval icon=if(a_>300,\"thumbs-down\",\"thumbs-up\")",    "startTime": "now/d",    "endTime": "now"  },  "chart": {    "chartType": "single",    "field": "a_",    "fontSize": "30",    "precision": "3",    "useThousandSeparators": false,    "unit": "个",    "unitPosition": "after",    "displayField": "icon",    "subtitle": "",    "useSparkline": false,    "sparklineXAxisField": "",    "singleFieldDisplayType": "default",    "singleChartIcon": "none",    "displayMode": "default",    "color": "<color>",    "colorFillingMode": "font",    "liveRefreshMode": false  }}" to json editor
    And I wait for "500" millsecond
    And I click the "Check" button
    And I wait for "500" millsecond
    Then I click the "Ensure" button
    And I wait for loading invisible
    And I wait for "2000" millsecond
    Then take part of "SingleValueDiv" with name "actual/<image>"
#    And I compare source image "actual/<image>" with target image "expect/<image>"

    Examples:
      | color   |  image           |
      | #FFEB3B |  单值_默认_color  |

  @dashboard @dashboardSmoke
  Scenario Outline: 默认-colorFillingMode-background RZY-3745
    When the chart title is "仪表盘单值" then I click the button which classname is "anticon css-ifnfqv ant-dropdown-trigger" in dashboard
    And I click the "Edit" button
    And I set the parameter "{  "title": "仪表盘单值",  "description": "",  "x": 0,  "y": 0,  "w": 12,  "h": 5,  "search": {    "query": "tag:sample04061424_display | stats avg(apache.status) as a_|eval icon=if(a_>300,\"thumbs-down\",\"thumbs-up\")",    "startTime": "now/d",    "endTime": "now"  },  "chart": {    "chartType": "single",    "field": "a_",    "fontSize": "30",    "precision": "3",    "useThousandSeparators": false,    "unit": "个",    "unitPosition": "after",    "displayField": "icon",    "subtitle": "",    "useSparkline": false,    "sparklineXAxisField": "",    "singleFieldDisplayType": "default",    "singleChartIcon": "none",    "displayMode": "default",    "color": "<color>",    "colorFillingMode": "<colorFillingMode>",    "liveRefreshMode": false  }}" to json editor
    And I wait for "500" millsecond
    And I click the "Check" button
    And I wait for "500" millsecond
    Then I click the "Ensure" button
    And I wait for loading invisible
    And I wait for "2000" millsecond
    Then take part of "SingleValueDiv" with name "actual/<image>"
#    And I compare source image "actual/<image>" with target image "expect/<image>"

    Examples:
      | colorFillingMode |   image                    |
      |   background     |  单值_默认_colorFillingMode  |

  @cleanDashboard
  Scenario Outline: 删除仪表盘
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    When the data name is "<name>" then i click the "删除" button
    And I wait for "Ensure" will be visible
    And I click the "Ensure" button
    And I wait for "500" millsecond
    Then I will see the success message "删除仪表盘成功"

    Examples:
      | name  |
      | 仪表盘单值 |
  @cleanDashboard
  Scenario Outline: 删除仪表盘所建趋势图
    Given open the "trend.ListPage" page for uri "/trend/"
    When the data name is "<name>" then i click the "删除" button
    And I wait for "Ensure" will be visible
    And I click the "Ensure" button
    And I wait for "500" millsecond
    And I will see the success message "删除成功"

    Examples:
      | name  |
      | 仪表盘单值 |

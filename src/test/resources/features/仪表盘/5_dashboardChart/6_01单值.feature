@dashboard6_01 @dashboardChart
Feature: 仪表盘_6_01_单值

  @dashboardChartSmoke
  Scenario Outline: 新建仪表盘
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the "Create" button
    When I set the parameter "DashBoardName" with value "<name>"
    And I click the "Ensure" button
    And I wait for "SuccessMessage" will be visible
    Then I will see the success message "新建仪表盘成功"

    Examples:
      | name  |
      | 仪表盘单值 |

  @dashboardChartSmoke
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
      | spl                                                                                                | name  |
      | tag:sample04061424_display \| stats avg(apache.status) as a_\|eval icon=if(a_>300,\"thumbs-down\",\"thumbs-up\") | 仪表盘单值 |

  @dashboardChartSmoke
  Scenario Outline: 新建标签页
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "仪表盘<name>"
    And switch to window "仪表盘"
    And I close all tabs except main tab
    Then I will see the "dashboard.DetailPage" page
    When I set the parameter "TagName" with value "<name>"
    And I click the "Ensure" button
    Then I wait for "SettingIcon" will be visible

    Examples:
      | name |
      | 单值   |

  @dashboardChartSmoke
  Scenario Outline: 添加图表
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "仪表盘单值"
    And switch to window "仪表盘"
    And I close all tabs except main tab
    Then I will see the "dashboard.DetailPage" page
    And I click the "SettingIcon" button
    And I switch the dashboard "OpenEdit" button to "enable"
    And I click the "SettingIcon" button
    And I wait for "AddEventButton" will be visible
    And I click the "AddEventButton" button
    And I wait for "500" millsecond
    And I click the "AddChart" button
    And I wait for loading invisible
    And I set the parameter "SearchChartInput" with value "<name>"
    And I wait for loading invisible
    And I click the "{'Checkbox':'<name>'}" button
    And I click the "Ensure" button
    And I wait for "SuccessMessage" will be visible
    Then I wait for element "SuccessMessage" change text to "添加成功"

    Examples:
      | name   |
      | 仪表盘单值 |

  @dashboardChartSmoke
  Scenario: 修改为单值 RZY-342
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "仪表盘单值"
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
    And I click the "Other" button
    And I click the "Single" button
    And I click the "SettingChart" button
    And I choose the "a_" from the "DataField"
    And I wait for "1000" millsecond
    And I choose the "icon" from the "DisplayField"
    And I click the "Exhibition" button
    And I wait for "1500" millsecond
    And I set the parameter "WordSize" with value "50"
    And I wait for "1000" millsecond
    And I choose the "3" from the "Precision"
    And I wait for "1000" millsecond
    And I click the "ThousandSeparator" button
    And I set the parameter "Unit" with value "个"
    And I wait for "1000" millsecond
    Then I click the "Generate" button
    And I wait for "1000" millsecond
    And I click the "SettingChart" button
    Then I will see the "dashboard.DetailPage" page
    And I wait for "2000" millsecond
    And I click the "TrendTitle" button
    And I wait for "3000" millsecond

  @dashboardChartSmoke
  Scenario Outline: 验证配置是否在高级编辑中体现 RZY-3737
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
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

    Examples:
      | name    | json                                                                                                                                                                                                                                                                                                                                                                                           |
      | 仪表盘单值 |   "chart": {\n    "chartType": "single",\n    "field": "a_",\n    "fontSize": 50,\n    "unitFontSize": 36,\n    "precision": "3",\n    "useThousandSeparators": true,\n    "unit": "个",\n    "unitPosition": "after",\n    "displayField": "icon",\n    "subtitle": "",\n    "useSparkline": false,\n    "sparklineXAxisField": "",\n    "singleFieldDisplayType": "default",\n    "singleChartIcon": "none",\n    "displayMode": "default",\n    "color": "#5C9DF5",\n    "colorFillingMode": "font",\n    "liveRefreshMode": false\n  }|

  @dashboardChartSmoke
  Scenario: 单值图的千分隔符
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "仪表盘单值"
    And switch to window "仪表盘"
    And I close all tabs except main tab
    Then I will see the "dashboard.DetailPage" page
    And I click the "SettingIcon" button
    And I switch the dashboard "OpenEdit" button to "enable"
    And I click the "SettingIcon" button
    And I wait for "SuccessMessage" will be invisible
    When the chart title is "仪表盘单值" then I click the button which classname is "yotta-icon yotta-icon-DotEmblem" in dashboard
    And I click the "Configs" button
    And I wait for loading invisible
    And I wait for "500" millsecond
    And I set the parameter "Spl" with value "* | stats count()"
    And I click the "Ensure" button
    And I wait for "500" millsecond
    And I click the "SettingChart" button
    Then I will see the "trend.CreatePageDash" page
    And I choose the "count()" from the "DataField"
    And I wait for "1000" millsecond
    Then I click the "Generate" button
    And I wait for "1000" millsecond
    And I click the "SettingChart" button
#    Then I hide the element "SettingContent"
    Then I will see the "dashboard.DetailPage" page
    And I wait for "2000" millsecond
    And I click the "TrendTitle" button
    And I wait for "3000" millsecond
    Then I will see the "DashboardSingleValue" result will contain ","
#    Then I will see the "TextLayer" result will be "<json>"


  Scenario Outline: 验证单值图的fontSize RZY-1345,RZY-1346,RZY-1347,RZY-1348,RZY-1349
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "仪表盘单值"
    And switch to window "仪表盘"
    And I close all tabs except main tab
    Then I will see the "dashboard.DetailPage" page
    And I click the "SettingIcon" button
    And I switch the dashboard "OpenEdit" button to "enable"
    And I click the "SettingIcon" button
    And I wait for "SuccessMessage" will be invisible
    When the chart title is "仪表盘单值" then I click the button which classname is "yotta-icon yotta-icon-DotEmblem" in dashboard
    And I click the "Edit" button
    And I set the parameter "{"title": "仪表盘单值","description": "","x": 0,"y": 0,"w": 12, "h": 5,"search": { "query": "tag:*display | stats avg(apache.status) as a_|eval icon=if(a_>300,\"thumbs-down\",\"thumbs-up\")",    "startTime": "now/d",    "endTime": "now"  },  "chart": {    "chartType": "single",    "field": "a_",    "fontSize": <fontSize>,    "unitFontSize": 36,    "useThousandSeparators": false,    "unit": "个",    "unitPosition": "after",    "displayField": "icon",    "subtitle": "",    "useSparkline": false,    "singleChartIcon": "none",    "sparklineXAxisField": "",    "displayMode": "default",    "color": "#5C9DF5",    "colorFillingMode": "font",    "liveRefreshMode": false  }}" to json editor
    And I wait for "500" millsecond
    And I click the "Check" button
    And I wait for "<status>" will be visible
    And I will see the element "<status>" contains "<message>"
#    Then I wait for element "<status>" change text to "<message>"

    @dashboardChartSmoke
    Examples:
      | fontSize | status         | message                                       |
      | 0        | ErrorMessage   | chart -> fontSize -> 展示字体值的有效范围为 14 ～ 1000 px |
      | 1000     | SuccessMessage | 校验通过                                          |
      | 14       | SuccessMessage | 校验通过                                          |

    Examples:
      | fontSize | status         | message                                       |
      | 13       | ErrorMessage   | chart -> fontSize -> 展示字体值的有效范围为 14 ～ 1000 px |
      | 1001     | ErrorMessage   | chart -> fontSize -> 展示字体值的有效范围为 14 ～ 1000 px |

  @dashboardChartSmoke
  Scenario Outline: 验证单值图的color RZY-1350,RZY-1351
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "仪表盘单值"
    And switch to window "仪表盘"
    And I close all tabs except main tab
    Then I will see the "dashboard.DetailPage" page
    And I click the "SettingIcon" button
    And I switch the dashboard "OpenEdit" button to "enable"
    And I click the "SettingIcon" button
    And I wait for "SuccessMessage" will be invisible
    When the chart title is "仪表盘单值" then I click the button which classname is "yotta-icon yotta-icon-DotEmblem" in dashboard
    And I click the "Edit" button
    And I set the parameter "{ "title": "仪表盘单值", "description": "", "x": 0, "y": 0, "w": 12, "h": 5, "search": { "query": "tag:*display | stats avg(apache.status) as a_|eval icon=if(a_>300,\"thumbs-down\",\"thumbs-up\")", "startTime": "now/d", "endTime": "now" }, "chart": { "chartType": "single", "field": "a_", "fontSize": 100, "unitFontSize": 36, "useThousandSeparators": false, "unit": "个", "unitPosition": "after", "displayField": "icon", "subtitle": "", "useSparkline": false, "singleChartIcon": "none", "sparklineXAxisField": "", "displayMode": "default", "color": "<color>", "colorFillingMode": "font", "liveRefreshMode": false } }" to json editor
    And I wait for "500" millsecond
    And I click the "Check" button
    And I wait for "<status>" will be visible
    And I will see the element "<status>" contains "<message>"

    Examples:
      | color | status         | message               |
      |       | ErrorMessage   | chart -> color 字段值不能为空 |
      | 1     | SuccessMessage | 校验通过                  |

  Scenario Outline: 验证单值图的展示字段
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "仪表盘单值"
    And switch to window "仪表盘"
    And I close all tabs except main tab
    Then I will see the "dashboard.DetailPage" page
    And I click the "SettingIcon" button
    And I switch the dashboard "OpenEdit" button to "enable"
    And I click the "SettingIcon" button
    And I wait for "SuccessMessage" will be invisible
    When the chart title is "仪表盘单值" then I click the button which classname is "yotta-icon yotta-icon-DotEmblem" in dashboard
    And I click the "Edit" button
    And I set the parameter "{ "title": "仪表盘单值", "description": "", "x": 0, "y": 0, "w": 12, "h": 5, "search": { "query": "tag:*display | stats avg(apache.status) as a_|eval icon=if(a_>300,\"thumbs-down\",\"thumbs-up\")", "startTime": "now/d", "endTime": "now" }, "chart": { "chartType": "single", "field": "a_", "fontSize": 100, "unitFontSize":36, "useThousandSeparators": false, "unit": "个", "unitPosition": "after", "displayField": "icon", "subtitle": "", "useSparkline": false, "singleChartIcon": "none", "sparklineXAxisField": "", "displayMode": "trending", "color": "#5C9DF5", "colorFillingMode": "font", "liveRefreshMode": false } }" to json editor
    And I wait for "500" millsecond
    And I click the "Check" button
    And I wait for "<status>" will be visible
    And I will see the element "<status>" contains "<message>"

    Examples:
      | status       | message                       |
      | ErrorMessage | chart -> comparsionTime 字段为必填项 |

  @dashboardChartSmoke
  Scenario Outline: 单值图按趋势展示
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "仪表盘单值"
    And switch to window "仪表盘"
    And I close all tabs except main tab
    Then I will see the "dashboard.DetailPage" page
    And I click the "SettingIcon" button
    And I switch the dashboard "OpenEdit" button to "enable"
    And I click the "SettingIcon" button
    And I wait for "SuccessMessage" will be invisible
    When the chart title is "仪表盘单值" then I click the button which classname is "yotta-icon yotta-icon-DotEmblem" in dashboard
    And I click the "Edit" button
    And I set the parameter "{ "title": "仪表盘单值", "description": "", "x": 0, "y": 0, "w": 12, "h": 5, "search": { "query": "tag:*display | stats avg(apache.status) as a_|eval icon=if(a_>300,\"thumbs-down\",\"thumbs-up\")", "startTime": "now/d", "endTime": "now" }, "chart": { "chartType": "single", "field": "a_", "fontSize": 100, "unitFontSize": 36, "unit": "个", "unitPosition": "after", "displayField": "icon", "subtitle": "", "useSparkline": false, "singleChartIcon": "none", "sparklineXAxisField": "", "displayMode": "default", "color": "#5C9DF5", "colorFillingMode": "font", "liveRefreshMode": false } }" to json editor
    And I wait for "500" millsecond
    And I click the "Check" button
    And I wait for "ErrorMessage" will be visible
    And I will see the element "ErrorMessage" contains "<message>"
#    Then I will see the error message "<message>"

    Examples:
      | message                              |
      | chart -> useThousandSeparators 字段为必填项 |

  @dashboardChartSmoke
  Scenario Outline: 单值图按区间展示
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "仪表盘单值"
    And switch to window "仪表盘"
    And I close all tabs except main tab
    Then I will see the "dashboard.DetailPage" page
    And I click the "SettingIcon" button
    And I switch the dashboard "OpenEdit" button to "enable"
    And I click the "SettingIcon" button
    And I wait for "SuccessMessage" will be invisible
    When the chart title is "仪表盘单值" then I click the button which classname is "yotta-icon yotta-icon-DotEmblem" in dashboard
    And I click the "Edit" button
    And I set the parameter "{ "title": "仪表盘单值", "description": "", "x": 0, "y": 0, "w": 12, "h": 5, "search": { "query": "tag:*display | stats avg(apache.status) as a_|eval icon=if(a_>300,\"thumbs-down\",\"thumbs-up\")", "startTime": "now/d", "endTime": "now" }, "chart": { "chartType": "single", "field": "a_", "fontSize": 100, "unitFontSize": 36, "unit": "个", "unitPosition": "after", "displayField": "icon", "subtitle": "", "useSparkline": false, "singleChartIcon": "none", "sparklineXAxisField": "", "useThousandSeparators":false, "displayMode": "<mode>", "colorFillingMode": "font", "colorRanges": [ { "from": "100", "to": "<to>", "color": "#259B24" } ] } }" to json editor
    And I wait for "500" millsecond
    And I click the "Check" button
    And I wait for "ErrorMessage" will be visible
    And I will see the element "ErrorMessage" contains "<message>"
#    Then I wait for element "ErrorMessage" change text to "<message>"

    Examples:
      | mode    | to  | message                                  |
      | default | 300 | chart -> color 字段为必填项                     |
      | ranging | 1   | chart -> colorRanges -> 颜色范围区间结束值需要大于开始值 |

    ###########

  @dashboardChartSmoke
  Scenario: 恢复至初始 RZY-296,RZY-3391
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "仪表盘单值"
    And switch to window "仪表盘"
    And I close all tabs except main tab
    Then I will see the "dashboard.DetailPage" page
    And I click the "SettingIcon" button
    And I switch the dashboard "OpenEdit" button to "enable"
    And I click the "SettingIcon" button
    And I wait for "SuccessMessage" will be invisible
    When the chart title is "仪表盘单值" then I click the button which classname is "yotta-icon yotta-icon-DotEmblem" in dashboard
#    And I click the "ChartSetting" button
    And I click the "Recover" button
    And I wait for loading invisible
    And I click the "Ensure" button
    And I wait for "Progress" will be invisible
    Then I wait for "Table" will be visible

  @dashboardChartSmoke
  Scenario: 时间范围选择 RZY-3392
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "仪表盘单值"
    And switch to window "仪表盘"
    And I close all tabs except main tab
    Then I will see the "dashboard.DetailPage" page
    And I click the "SettingIcon" button
    And I switch the dashboard "OpenEdit" button to "enable"
    And I click the "SettingIcon" button
    And I wait for "SuccessMessage" will be invisible
    And I click the "TimeRangeDanzhi" button
    And I wait for "1000" millsecond
    And I click the "RecentSevenDay1" button
    And I wait for loading invisible
    Then I wait for element "TimeRangeDanzhi" change text to "最近7天"

  Scenario Outline: RZY-3694修改表格chartType
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "仪表盘单值"
    And switch to window "仪表盘"
    And I close all tabs except main tab
    Then I will see the "dashboard.DetailPage" page
    And I click the "SettingIcon" button
    And I switch the dashboard "OpenEdit" button to "enable"
    And I click the "SettingIcon" button
    And I wait for "SuccessMessage" will be invisible
    When the chart title is "仪表盘单值" then I click the button which classname is "yotta-icon yotta-icon-DotEmblem" in dashboard
    And I click the "Edit" button
    And I set the parameter "{"title": "仪表盘单值","description": "","x": 0,"y": 0,"w": 12,"h": 5,"search": {"query": "tag:*display | stats avg(apache.status) as a_|eval icon=if(a_>300,\"thumbs-down\",\"thumbs-up\")","startTime": "now/d","endTime": "now"},"chart": {"chartType": "<chartType>"}}" to json editor
    And I wait for "500" millsecond
    And I click the "Check" button
    And I wait for "ErrorMessage" will be visible
    And I will see the element "ErrorMessage" contains "<ErrorMessage>"
#    Then I wait for element "ErrorMessage" change text to "<ErrorMessage>"

    Examples:
      | chartType    | ErrorMessage                       |
      | line         | chart -> xAxis 字段为必填项          |
      | pie          | chart -> field 字段为必填项          |
      | hello        | chart -> chartType 字段值不支持hello |

  @dashboardChartSmoke
  Scenario Outline: 图标-按字段 RZY-3741
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "仪表盘单值"
    And switch to window "仪表盘"
    And I close all tabs except main tab
    Then I will see the "dashboard.DetailPage" page
    And I click the "SettingIcon" button
    And I switch the dashboard "OpenEdit" button to "enable"
    And I click the "SettingIcon" button
    And I wait for "SuccessMessage" will be invisible
    When the chart title is "仪表盘单值" then I click the button which classname is "yotta-icon yotta-icon-DotEmblem" in dashboard
    And I click the "Edit" button
    And I set the parameter "{ "title": "仪表盘单值", "description": "", "x": 0, "y": 0, "w": 12, "h": 5, "search": { "query": "tag:sample04061424_display | stats avg(apache.status) as a_|eval icon=if(a_>300,\"thumbs-down\",\"thumbs-up\")", "startTime": "now/d", "endTime": "now" }, "chart": { "chartType": "single", "field": "a_", "fontSize": 30, "unitFontSize": 36, "precision": "3", "useThousandSeparators": false, "unit": "个", "unitPosition": "after", "displayField": "icon", "subtitle": "", "useSparkline": false, "sparklineXAxisField": "", "singleFieldDisplayType": "default", "singleChartIcon": "<singleChartIcon>", "iconField": "icon", "displayMode": "default", "color": "#5C9DF5", "colorFillingMode": "font", "liveRefreshMode": false } }" to json editor
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
    Then take part of "SingleValueDiv" with name "actual/<image>"
    # And I compare source image "actual/<image>" with target image "expect/<image>"

    Examples:
      | singleChartIcon |   image            |
      |   field         |   单值_图标-按字段    |

  Scenario Outline: 图标-按名称 RZY-3742
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "仪表盘单值"
    And switch to window "仪表盘"
    And I close all tabs except main tab
    Then I will see the "dashboard.DetailPage" page
    And I click the "SettingIcon" button
    And I switch the dashboard "OpenEdit" button to "enable"
    And I click the "SettingIcon" button
    And I wait for "SuccessMessage" will be invisible
    When the chart title is "仪表盘单值" then I click the button which classname is "yotta-icon yotta-icon-DotEmblem" in dashboard
    And I click the "Edit" button
    And I set the parameter "{ "title": "仪表盘单值", "description": "", "x": 0, "y": 0, "w": 12, "h": 5, "search": { "query": "tag:sample04061424_display | stats avg(apache.status) as a_|eval icon=if(a_>300,\"thumbs-down\",\"thumbs-up\")", "startTime": "now/d", "endTime": "now" }, "chart": { "chartType": "single", "field": "a_", "fontSize": 30, "unitFontSize": 36, "precision": "3", "useThousandSeparators": false, "unit": "个", "unitPosition": "after", "displayField": "icon", "subtitle": "", "useSparkline": false, "sparklineXAxisField": "", "singleFieldDisplayType": "default", "singleChartIcon": "<singleChartIcon>", "iconField": "icon", "displayMode": "default", "color": "#5C9DF5", "colorFillingMode": "font", "liveRefreshMode": false } }" to json editor
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
    Then take part of "SingleValueDiv" with name "actual/<image>"
    # And I compare source image "actual/<image>" with target image "expect/<image>"

    Examples:
      | singleChartIcon |   image            |
      |   fixed         |   单值_图标-按名称    |

  Scenario Outline: 图标-无 RZY-3743
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "仪表盘单值"
    And switch to window "仪表盘"
    And I close all tabs except main tab
    Then I will see the "dashboard.DetailPage" page
    And I click the "SettingIcon" button
    And I switch the dashboard "OpenEdit" button to "enable"
    And I click the "SettingIcon" button
    And I wait for "SuccessMessage" will be invisible
    When the chart title is "仪表盘单值" then I click the button which classname is "yotta-icon yotta-icon-DotEmblem" in dashboard
    And I click the "Edit" button
    And I set the parameter "{ "title": "仪表盘单值", "description": "", "x": 0, "y": 0, "w": 12, "h": 5, "search": { "query": "tag:sample04061424_display | stats avg(apache.status) as a_|eval icon=if(a_>300,\"thumbs-down\",\"thumbs-up\")", "startTime": "now/d", "endTime": "now" }, "chart": { "chartType": "single", "field": "a_", "fontSize": 30, "unitFontSize": 36, "precision": "3", "useThousandSeparators": false, "unit": "个", "unitPosition": "after", "displayField": "icon", "subtitle": "", "useSparkline": false, "sparklineXAxisField": "", "singleFieldDisplayType": "default", "singleChartIcon": "<singleChartIcon>", "iconField": "icon", "displayMode": "default", "color": "#5C9DF5", "colorFillingMode": "font", "liveRefreshMode": false } }" to json editor
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
    Then take part of "SingleValueDiv" with name "actual/<image>"
    # And I compare source image "actual/<image>" with target image "expect/<image>"

    Examples:
      | singleChartIcon |   image            |
      |   none          |   单值_图标-无       |

  @dashboardChartSmoke
  Scenario Outline: 默认只改为trending RZY-3745
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "仪表盘单值"
    And switch to window "仪表盘"
    And I close all tabs except main tab
    Then I will see the "dashboard.DetailPage" page
    And I click the "SettingIcon" button
    And I switch the dashboard "OpenEdit" button to "enable"
    And I click the "SettingIcon" button
    And I wait for "SuccessMessage" will be invisible
    When the chart title is "仪表盘单值" then I click the button which classname is "yotta-icon yotta-icon-DotEmblem" in dashboard
    And I click the "Edit" button
    And I set the parameter "{ "title": "仪表盘单值", "description": "", "x": 0, "y": 0, "w": 12, "h": 5, "search": { "query": "tag:sample04061424_display | stats avg(apache.status) as a_|eval icon=if(a_>300,\"thumbs-down\",\"thumbs-up\")", "startTime": "now/d", "endTime": "now" }, "chart": { "chartType": "single", "field": "a_", "fontSize": 30, "unitFontSize": 36, "precision": "3", "useThousandSeparators": false, "unit": "个", "unitPosition": "after", "displayField": "icon", "subtitle": "", "useSparkline": false, "sparklineXAxisField": "", "singleFieldDisplayType": "default", "singleChartIcon": "fixed", "iconField": "icon", "displayMode": "<displayMode>", "color": "#5C9DF5", "colorFillingMode": "font", "liveRefreshMode": false } }" to json editor
    And I wait for "500" millsecond
    And I click the "Check" button
    And I wait for "ErrorMessage" will be visible
    And I will see the element "ErrorMessage" contains "<ErrorMessage>"

    Examples:
      | displayMode |  ErrorMessage                      |
      |   trending  |  chart -> comparsionTime 字段为必填项 |

  @dashboardChartSmoke
  Scenario Outline: 默认-color RZY-3745
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "仪表盘单值"
    And switch to window "仪表盘"
    And I close all tabs except main tab
    Then I will see the "dashboard.DetailPage" page
    And I click the "SettingIcon" button
    And I switch the dashboard "OpenEdit" button to "enable"
    And I click the "SettingIcon" button
    And I wait for "SuccessMessage" will be invisible
    When the chart title is "仪表盘单值" then I click the button which classname is "yotta-icon yotta-icon-DotEmblem" in dashboard
    And I click the "Edit" button
    And I wait for "500" millsecond
    And I set the parameter "{ "title": "仪表盘单值", "description": "", "x": 0, "y": 0, "w": 12, "h": 5, "search": { "query": "tag:sample04061424_display | stats avg(apache.status) as a_|eval icon=if(a_>300,\"thumbs-down\",\"thumbs-up\")", "startTime": "now/d", "endTime": "now" }, "chart": { "chartType": "single", "field": "a_", "fontSize": 30, "unitFontSize": 36, "precision": "3", "useThousandSeparators": false, "unit": "个", "unitPosition": "after", "displayField": "icon", "subtitle": "", "useSparkline": false, "sparklineXAxisField": "", "singleFieldDisplayType": "default", "singleChartIcon": "none", "displayMode": "default", "color": "<color>", "colorFillingMode": "font", "liveRefreshMode": false } }" to json editor
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
    Then take part of "SingleValueDiv" with name "actual/<image>"
    # And I compare source image "actual/<image>" with target image "expect/<image>"

    Examples:
      | color   |  image           |
      | #FFEB3B |  单值_默认_color  |

  Scenario Outline: 默认-colorFillingMode-background RZY-3745
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "仪表盘单值"
    And switch to window "仪表盘"
    And I close all tabs except main tab
    Then I will see the "dashboard.DetailPage" page
    And I click the "SettingIcon" button
    And I switch the dashboard "OpenEdit" button to "enable"
    And I click the "SettingIcon" button
    And I wait for "SuccessMessage" will be invisible
    When the chart title is "仪表盘单值" then I click the button which classname is "yotta-icon yotta-icon-DotEmblem" in dashboard
    And I click the "Edit" button
    And I set the parameter "{ "title": "仪表盘单值", "description": "", "x": 0, "y": 0, "w": 12, "h": 5, "search": { "query": "tag:sample04061424_display | stats avg(apache.status) as a_|eval icon=if(a_>300,\"thumbs-down\",\"thumbs-up\")", "startTime": "now/d", "endTime": "now" }, "chart": { "chartType": "single", "field": "a_", "fontSize": 30, "unitFontSize": 36, "precision": "3", "useThousandSeparators": false, "unit": "个", "unitPosition": "after", "displayField": "icon", "subtitle": "", "useSparkline": false, "sparklineXAxisField": "", "singleFieldDisplayType": "default", "singleChartIcon": "none", "displayMode": "default", "color": "#FFEB3B", "colorFillingMode": "<colorFillingMode>", "liveRefreshMode": false } }" to json editor
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
    Then take part of "SingleValueDiv" with name "actual/<image>"
    # And I compare source image "actual/<image>" with target image "expect/<image>"

    Examples:
      | colorFillingMode |   image                    |
      |   background     |  单值_默认_colorFillingMode  |

  Scenario Outline: 默认-liveRefreshMode-true RZY-3745
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "仪表盘单值"
    And switch to window "仪表盘"
    And I close all tabs except main tab
    Then I will see the "dashboard.DetailPage" page
    And I click the "SettingIcon" button
    And I switch the dashboard "OpenEdit" button to "enable"
    And I click the "SettingIcon" button
    And I wait for "SuccessMessage" will be invisible
    When the chart title is "仪表盘单值" then I click the button which classname is "yotta-icon yotta-icon-DotEmblem" in dashboard
    And I click the "Edit" button
    And I set the parameter "{ "title": "仪表盘单值", "description": "", "x": 0, "y": 0, "w": 12, "h": 5, "search": { "query": "tag:sample04061424_display | stats avg(apache.status) as a_|eval icon=if(a_>300,\"thumbs-down\",\"thumbs-up\")", "startTime": "now/d", "endTime": "now" }, "chart": { "chartType": "single", "field": "a_", "fontSize": 30, "unitFontSize": 36, "precision": "3", "useThousandSeparators": false, "unit": "个", "unitPosition": "after", "displayField": "icon", "subtitle": "", "useSparkline": false, "sparklineXAxisField": "", "singleFieldDisplayType": "default", "singleChartIcon": "none", "displayMode": "default", "color": "#FFEB3B", "colorFillingMode": "background", "liveRefreshMode": <liveRefreshMode> } }" to json editor
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
    And I click the "SettingChart" button
#    Then I will see the "dashboard.DetailPage" page
    And I wait for "1000" millsecond
    And I click the "Exhibition" button
    Then I will see the "ActualTimeRefresh" is "yotta-checkbox-checked"
#    Then I will see the checkbox in auth which name is "实时滚动刷新" and status is "checked"

    Examples:
      | liveRefreshMode |
      |   true          |

  Scenario: 按趋势 RZY-3746
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "仪表盘单值"
    And switch to window "仪表盘"
    And I close all tabs except main tab
    Then I will see the "dashboard.DetailPage" page
    And I click the "SettingIcon" button
    And I switch the dashboard "OpenEdit" button to "enable"
    And I click the "SettingIcon" button
    And I wait for "SuccessMessage" will be invisible
    When the chart title is "仪表盘单值" then I click the button which classname is "yotta-icon yotta-icon-DotEmblem" in dashboard
    And I click the "Edit" button
    And I set the parameter "{ "title": "仪表盘单值", "description": "", "x": 0, "y": 0, "w": 12, "h": 5, "search": { "query": "tag:sample04061424_display | stats avg(apache.status) as a_|eval icon=if(a_>300,\"thumbs-down\",\"thumbs-up\")", "startTime": "now/d", "endTime": "now" }, "chart": { "chartType": "single", "field": "a_", "fontSize": 30, "unitFontSize": 36, "precision": "3", "useThousandSeparators": false, "unit": "个", "unitPosition": "after", "displayField": "icon", "subtitle": "", "useSparkline": false, "sparklineXAxisField": "", "singleFieldDisplayType": "default", "singleChartIcon": "none", "displayMode": "trending", "comparsionTime": "-7d", "comparsionMode": "percent" } }" to json editor
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
    And I click the "SettingChart" button
#    Then I will see the "dashboard.DetailPage" page
    And I wait for "1000" millsecond
    And I click the "Exhibition" button
    Then I will see the element "TimeForRatio" value is "一周前"
    Then I will see the checkbox in auth which name is "百分比" and status is "checked"

  Scenario Outline: 按趋势只改为ranging RZY-3746
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "仪表盘单值"
    And switch to window "仪表盘"
    And I close all tabs except main tab
    Then I will see the "dashboard.DetailPage" page
    And I click the "SettingIcon" button
    And I switch the dashboard "OpenEdit" button to "enable"
    And I click the "SettingIcon" button
    And I wait for "SuccessMessage" will be invisible
    When the chart title is "仪表盘单值" then I click the button which classname is "yotta-icon yotta-icon-DotEmblem" in dashboard
    And I click the "Edit" button
    And I set the parameter "{ "title": "仪表盘单值", "description": "", "x": 0, "y": 0, "w": 12, "h": 5, "search": { "query": "tag:sample04061424_display | stats avg(apache.status) as a_|eval icon=if(a_>300,\"thumbs-down\",\"thumbs-up\")", "startTime": "now/d", "endTime": "now" }, "chart": { "chartType": "single", "field": "a_", "fontSize": 30, "unitFontSize":36, "precision": "3", "useThousandSeparators": false, "unit": "个", "unitPosition": "after", "displayField": "icon", "subtitle": "", "useSparkline": false, "sparklineXAxisField": "", "singleFieldDisplayType": "default", "singleChartIcon": "none", "displayMode": "<displayMode>", "comparsionTime": "-7d", "comparsionMode": "percent" } }" to json editor
    And I wait for "500" millsecond
    And I click the "Check" button
    And I wait for "ErrorMessage" will be visible
    And I will see the element "ErrorMessage" contains "<ErrorMessage>"
#    Then I wait for element "ErrorMessage" change text to "<ErrorMessage>"

    Examples:
      | displayMode |  ErrorMessage                       |
      |   ranging  |  chart -> colorFillingMode 字段为必填项 |

  Scenario Outline: 按趋势-comparsionTime&comparsionMode RZY-3746
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "仪表盘单值"
    And switch to window "仪表盘"
    And I close all tabs except main tab
    Then I will see the "dashboard.DetailPage" page
    And I click the "SettingIcon" button
    And I switch the dashboard "OpenEdit" button to "enable"
    And I click the "SettingIcon" button
    And I wait for "SuccessMessage" will be invisible
    When the chart title is "仪表盘单值" then I click the button which classname is "yotta-icon yotta-icon-DotEmblem" in dashboard
    And I click the "Edit" button
    And I set the parameter "{ "title": "仪表盘单值", "description": "", "x": 0, "y": 0, "w": 12, "h": 5, "search": { "query": "tag:sample04061424_display | stats avg(apache.status) as a_|eval icon=if(a_>300,\"thumbs-down\",\"thumbs-up\")", "startTime": "now/d", "endTime": "now" }, "chart": { "chartType": "single", "field": "a_", "fontSize": 30, "unitFontSize":36, "precision": "3", "useThousandSeparators": false, "unit": "个", "unitPosition": "after", "displayField": "icon", "subtitle": "", "useSparkline": false, "sparklineXAxisField": "", "singleFieldDisplayType": "default", "singleChartIcon": "none", "displayMode": "trending", "comparsionTime": "<comparsionTime>", "comparsionMode": "<comparsionMode>" } }" to json editor
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
    And I click the "SettingChart" button
#    Then I will see the "dashboard.DetailPage" page
    And I wait for "1000" millsecond
    And I click the "Exhibition" button
    Then I will see the element "TimeForRatio" value is "一天前"
    And I wait for "1000" millsecond
    Then I will see the checkbox in auth which name is "绝对值" and status is "checked"

    Examples:
      | comparsionTime |  comparsionMode   |
      |       -1d      |     absolute      |

  Scenario: 按区间 RZY-3747
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "仪表盘单值"
    And switch to window "仪表盘"
    And I close all tabs except main tab
    Then I will see the "dashboard.DetailPage" page
    And I click the "SettingIcon" button
    And I switch the dashboard "OpenEdit" button to "enable"
    And I click the "SettingIcon" button
    And I wait for "SuccessMessage" will be invisible
    When the chart title is "仪表盘单值" then I click the button which classname is "yotta-icon yotta-icon-DotEmblem" in dashboard
    And I click the "Edit" button
    And I set the parameter "{ "title": "仪表盘单值", "description": "", "x": 0, "y": 0, "w": 12, "h": 5, "search": { "query": "tag:sample04061424_display | stats avg(apache.status) as a_|eval icon=if(a_>300,\"thumbs-down\",\"thumbs-up\")", "startTime": "now/d", "endTime": "now" }, "chart": { "chartType": "single", "field": "a_", "fontSize": 30, "unitFontSize": 36, "precision": "3", "useThousandSeparators": false, "unit": "个", "unitPosition": "after", "displayField": "icon", "subtitle": "", "useSparkline": false, "sparklineXAxisField": "", "singleFieldDisplayType": "default", "singleChartIcon": "none", "displayMode": "ranging", "colorFillingMode": "font", "colorRanges": [ { "from": "100", "to": "300", "color": "#5C9DF5" } ] } }" to json editor
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
    And I click the "SettingChart" button
#    Then I will see the "dashboard.DetailPage" page
    And I wait for "1000" millsecond
    And I click the "Exhibition" button
    Then take part of "SingleValueExhibition" with name "actual/单值_按区间_展示"
#    And I compare source image "actual/单值_按区间_展示" with target image "expect/单值_按区间_展示"

  Scenario Outline: 按区间-from-to RZY-3747
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "仪表盘单值"
    And switch to window "仪表盘"
    And I close all tabs except main tab
    Then I will see the "dashboard.DetailPage" page
    And I click the "SettingIcon" button
    And I switch the dashboard "OpenEdit" button to "enable"
    And I click the "SettingIcon" button
    And I wait for "SuccessMessage" will be invisible
    When the chart title is "仪表盘单值" then I click the button which classname is "yotta-icon yotta-icon-DotEmblem" in dashboard
    And I click the "Edit" button
    And I set the parameter "{ "title": "仪表盘单值", "description": "", "x": 0, "y": 0, "w": 12, "h": 5, "search": { "query": "tag:sample04061424_display | stats avg(apache.status) as a_|eval icon=if(a_>300,\"thumbs-down\",\"thumbs-up\")", "startTime": "now/d", "endTime": "now" }, "chart": { "chartType": "single", "field": "a_", "fontSize": 30, "unitFontSize":36, "precision": "3", "useThousandSeparators": false, "unit": "个", "unitPosition": "after", "displayField": "icon", "subtitle": "", "useSparkline": false, "sparklineXAxisField": "", "singleFieldDisplayType": "default", "singleChartIcon": "none", "displayMode": "<displayMode>", "colorFillingMode": "font", "colorRanges": [ { "color": "#259B24", "from": "<from>", "to": "<to>" } ] } }" to json editor
    And I wait for "500" millsecond
    And I click the "Check" button
    And I wait for "ErrorMessage" will be visible
    And I will see the element "ErrorMessage" contains "<ErrorMessage>"
#    Then I wait for element "ErrorMessage" change text to "<ErrorMessage>"

    Examples:
      | displayMode |  from  |  to  |  ErrorMessage                              |
      |   default    | 100   | 300  |  chart -> color 字段为必填项                 |
      |   ranging    | 10000  | 1  |  chart -> colorRanges -> 颜色范围区间结束值需要大于开始值 |
      |   ranging    |        |    |  chart -> from 字段值不能为空                  |

  
  Scenario: 单值 RZY-310
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "仪表盘单值"
    And switch to window "仪表盘"
    And I close all tabs except main tab
    Then I will see the "dashboard.DetailPage" page
    And I click the "SettingIcon" button
    And I switch the dashboard "OpenEdit" button to "enable"
    And I click the "SettingIcon" button
    And I click the "SettingChart" button
    Then I will see the "trend.CreatePageDash" page
    And I wait for "2000" millsecond
    And I click the "Icon" button
    And I click the "AccordingName" button
    And I set the parameter "IconName" with value "school"
    And I wait for "2000" millsecond
    And I click the "Generate" button

    And I click the "SettingChart" button
    Then I will see the "dashboard.DetailPage" page
    And I wait for "2000" millsecond
    Then take part of "SingleValueExhibition" with name "actual/单值_图标_按名称"
#    And I compare source image "actual/单值_图标_按名称" with target image "expect/单值_图标_按名称"

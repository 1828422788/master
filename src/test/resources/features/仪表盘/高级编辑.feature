@dashboard1
Feature: 仪表盘高级编辑

  @dashboard @dashboardSmoke
  Scenario Outline: 新建仪表盘
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I click the "Create" button
    When I set the parameter "DashBoardName" with value "<name>"
    And I click the "Ensure" button
    Then I will see the success message "新建仪表盘成功"

    Examples:
      | name   |
      | 测试高级编辑 |

  @dashboard @dashboardSmoke
  Scenario Outline: 新建趋势图
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
      | spl                                                                           | name   |
      | tag:sample04061424_display \| stats count() by apache.clientip,apache.resp_len \| limit 10  | 仪表盘所有 |

  @dashboard @dashboardSmoke
  Scenario: 新建标签页
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "测试高级编辑"
    Then I will see the "dashboard.DetailPage" page
    When I set the parameter "TagName" with value "chart"
    And I click the "Ensure" button
    And I wait for loading complete
    And I back to before

  @dashboard @dashboardSmoke
  Scenario: 添加图表
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "测试高级编辑"
    Then I will see the "dashboard.DetailPage" page
    And I wait for "AddEventButton" will be visible
    When I click the "AddEventButton" button
    And I click the "AddChart" button
    And I wait for "SpinDot" will be invisible
    And I set the parameter "SearchChartInput" with value "仪表盘所有"
    And I wait for loading invisible
    And I click the "{'Checkbox':'仪表盘所有'}" button
    And I click the "Ensure" button
    Then I wait for element "SuccessMessage" change text to "添加成功"

  @dashboard @dashboardSmoke
  Scenario: 修改query字段 RZY-1276
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "测试高级编辑"
    Then I will see the "dashboard.DetailPage" page
    And I wait for "1000" millsecond
    When the chart title is "仪表盘所有" then I click the button which classname is "anticon css-ifnfqv ant-dropdown-trigger" in dashboard
    And I click the "Edit" button
    And I set the parameter "{"title": "仪表盘所有","description": "","x": 0,"y": 15,"w": 12,"h": 5,"search": {"query": "tag:sample04061424_chart | stats count() by apache.geo.country, apache.geo.province, apache.geo.city","startTime": "now/d","endTime": "now"},"chart": {"chartType": "table"}}" to json editor
    And I click the "Check" button
    Then I will see the success message "校验通过"
    Then I click the "Ensure" button
    Then I wait for element "SuccessMessage" change text to "配置成功"
    And I refresh the website
    And I wait for "Progress" will be invisible
    Then I will see the "TableHeader" result will be "apache.geo.country  apache.geo.province  apache.geo.city  count() "

  @dashboard @dashboardSmoke
  Scenario: 修改开始时间 RZY-1277
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "测试高级编辑"
    Then I will see the "dashboard.DetailPage" page
    And I wait for "1000" millsecond
    When the chart title is "仪表盘所有" then I click the button which classname is "anticon css-ifnfqv ant-dropdown-trigger" in dashboard
    And I click the "Edit" button
    And I set the parameter "{"title": "仪表盘所有","description": "","x": 0,"y": 15,"w": 12,"h": 5,"search": {"query": "tag:sample04061424_chart | stats count() by apache.geo.country, apache.geo.province, apache.geo.city","startTime": "-2d","endTime": "now"},"chart": {"chartType": "table"}}" to json editor
    And I wait for "500" millsecond
    And I click the "Check" button
    And I wait for "500" millsecond
    Then I will see the success message "校验通过"
    Then I click the "Ensure" button
    Then I wait for element "SuccessMessage" change text to "配置成功"
    And I refresh the website
    And I wait for "Progress" will be invisible
    Then I will see the "DropdownLink" result will be "最近2天"

  @dashboard @dashboardSmoke
  Scenario Outline: 校验开始时间和结束时间 RZY-1277
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "测试高级编辑"
    Then I will see the "dashboard.DetailPage" page
    And I wait for "1000" millsecond
    When the chart title is "仪表盘所有" then I click the button which classname is "anticon css-ifnfqv ant-dropdown-trigger" in dashboard
    And I click the "Edit" button
    And I set the parameter "{"title": "仪表盘所有","description": "","x": 0,"y": 15,"w": 12,"h": 5,"search": {"query": "tag:sample04061424_chart | stats count() by apache.geo.country, apache.geo.province, apache.geo.city","startTime": "<start>","endTime": "<end>"},"chart": {"chartType": "table"}}" to json editor
    And I wait for "500" millsecond
    And I click the "Check" button
    And I wait for "500" millsecond
    Then I will see the error message "<message>"

    Examples:
      | start | end | message                    |
      |       | now | search -> startTime 字段不能为空 |
      | -2d   |     | search -> endTime 字段不能为空   |

  @dashboard @dashboardSmoke
  Scenario Outline: 校验x、y、w、h RZY-1269,RZY-1272,RZY-1273,RZY-1274
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "测试高级编辑"
    Then I will see the "dashboard.DetailPage" page
    And I wait for "1000" millsecond
    When the chart title is "仪表盘所有" then I click the button which classname is "anticon css-ifnfqv ant-dropdown-trigger" in dashboard
    And I click the "Edit" button
    And I set the parameter "{"title": "仪表盘所有","description": "","x": <x>,"y": <y>,"w": <w>,"h": <h>,"search": {"query": "tag:sample04061424_chart | stats count() by apache.geo.country, apache.geo.province, apache.geo.city","startTime": "-1d","endTime": "now"},"chart": {"chartType": "table"}}" to json editor
    And I wait for "500" millsecond
    And I click the "Check" button
    And I wait for "500" millsecond
    And I wait for element "ErrorMessage" change text to "<message>"
#    Then I will see the error message "<message>"

    Examples:
      | x  | y  | w  | h  | message               |
      |    | 0  | 12 | 5  | 0行 41列：Unexpected ',' |
      | -1 | 15 | 1  | 12 | x 字段值的有效区间范围为'0'至'12' |
      | 13 | 15 | 1  | 12 | x 字段值的有效区间范围为'0'至'12' |
      | 1  | -1 | 1  | 12 | y 字段值不能低于其允许最小值'0'    |
      | 0  |    | 12 | 5  | 0行 48列：Unexpected ',' |
      | 0  | 0  |    | 5  | 0行 55列：Unexpected ',' |
      | 0  | 15 | 0  | 5  | w 字段值的有效区间范围为'1'至'12' |
      | 0  | 15 | 13 | 5  | w 字段值的有效区间范围为'1'至'12' |
      | 0  | 0  | 12 |    | 0行 63列：Unexpected ',' |
      | 0  | 0  | 12 | 0  | h 字段值不能低于其允许最小值'1'    |

  @dashboard @dashboardSmoke
  Scenario: 验证修改title字段 RZY-1278
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "测试高级编辑"
    Then I will see the "dashboard.DetailPage" page
    And I wait for "1000" millsecond
    When the chart title is "仪表盘所有" then I click the button which classname is "anticon css-ifnfqv ant-dropdown-trigger" in dashboard
    And I click the "Edit" button
    And I set the parameter "{"title": "仪表盘高级编辑","description": "","x": 0,"y": 15,"w": 12,"h": 5,"search": {"query": "tag:sample04061424_chart | stats count() by apache.geo.country, apache.geo.province, apache.geo.city","startTime": "-1d","endTime": "now"},"chart": {"chartType": "table"}}" to json editor
    And I wait for "500" millsecond
    And I click the "Check" button
    And I wait for "500" millsecond
    Then I will see the success message "校验通过"
    And I click the "Ensure" button
    Then I will see the "TrendTitle" result will be "仪表盘高级编辑"

  @dashboard @dashboardSmoke
  Scenario: 验证title字段为空 RZY-1278
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "测试高级编辑"
    Then I will see the "dashboard.DetailPage" page
    And I wait for "1000" millsecond
    When the chart title is "仪表盘高级编辑" then I click the button which classname is "anticon css-ifnfqv ant-dropdown-trigger" in dashboard
    And I click the "Edit" button
    And I set the parameter "{"title": "","description": "","x": 0,"y": 15,"w": 12,"h": 5,"search": {"query": "tag:sample04061424_chart | stats count() by apache.geo.country, apache.geo.province, apache.geo.city","startTime": "-1d","endTime": "now"},"chart": {"chartType": "table"}}" to json editor
    And I wait for "500" millsecond
    And I click the "Check" button
    And I wait for "500" millsecond
    Then I will see the success message "校验通过"


  @dashboard @dashboardSmoke
  Scenario: 验证备注字段 RZY-1279
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "测试高级编辑"
    Then I will see the "dashboard.DetailPage" page
    When the chart title is "仪表盘高级编辑" then I click the button which classname is "anticon css-ifnfqv ant-dropdown-trigger" in dashboard
    And I click the "Edit" button
    And I set the parameter "{"title": "仪表盘高级编辑","description": "测试描述","x": 0,"y": 15,"w": 12,"h": 5,"search": {"query": "tag:sample04061424_chart | stats count() by apache.geo.country, apache.geo.province, apache.geo.city","startTime": "-1d","endTime": "now"},"chart": {"chartType": "table"}}" to json editor
    And I wait for "500" millsecond
    And I click the "Check" button
    And I wait for "500" millsecond
    Then I will see the success message "校验通过"
    And I click the "Ensure" button
    And I wait for "2000" millsecond
#    And I click the "CustomTitle" button under some element
    And I move the mouse pointer to the "Describe"
    And I click the "Describe" button
    And I wait for "1000" millsecond
    Then I will see the "DescribeText" result will be "测试描述"

  @dashboard @dashboardSmoke
  Scenario: 验证清空JSON RZY-3442
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "测试高级编辑"
    Then I will see the "dashboard.DetailPage" page
    When the chart title is "仪表盘高级编辑" then I click the button which classname is "anticon css-ifnfqv ant-dropdown-trigger" in dashboard
    And I click the "Edit" button
    And I wait for "Operate" will be visible
    And I click the "Operate" button
    And I choose the "清空JSON" from the "ChartDropdown"
    And I click the "Check" button
    And I wait for "500" millsecond
    Then I will see the error message "title 字段为必填项"

  @dashboard @dashboardSmoke
  Scenario: 验证重置JSON RZY-3441
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "测试高级编辑"
    Then I will see the "dashboard.DetailPage" page
    And I wait for "1000" millsecond
    When the chart title is "仪表盘高级编辑" then I click the button which classname is "anticon css-ifnfqv ant-dropdown-trigger" in dashboard
    And I click the "Edit" button
    And I set the parameter "{"title": "仪表盘所有","description": "","x": -1,"y": 15,"w": 12,"h": 5,"search": {"query": "tag:sample04061424_chart | stats count() by apache.geo.country, apache.geo.province, apache.geo.city","startTime": "-2d","endTime": "now"},"chart": {"chartType": "table"}}" to json editor
    And I wait for "500" millsecond
    And I click the "Check" button
    And I wait for "500" millsecond
    Then I will see the error message "x 字段值的有效区间范围为'0'至'12'"
    And I click the "Operate" button
    And I choose the "重置JSON" from the "ChartDropdown"
    And I click the "Check" button
    And I wait for "500" millsecond
    Then I will see the success message "校验通过"

  @dashboard @dashboardSmoke
  Scenario: 开启钻取配置
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "测试高级编辑"
    Then I will see the "dashboard.DetailPage" page
    And I click the "SettingIcon" button
    And I click the "OpenDrilldown" button
    And I wait for "500" millsecond
    Then I will see the success message "钻取功能已启用"

  @dashboard @dashboardSmoke
  Scenario: 高级搜索钻取-type RZY-1489
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "测试高级编辑"
    Then I will see the "dashboard.DetailPage" page
    And I wait for "1000" millsecond
    When the chart title is "仪表盘高级编辑" then I click the button which classname is "anticon css-ifnfqv ant-dropdown-trigger" in dashboard
    And I click the "Edit" button
    And I set the parameter "{"title": "仪表盘高级编辑","description": "测试描述","x": 0,"y": 15,"w": 12,"h": 5,"search": {"query": "tag:sample04061424_chart | stats count() by apache.geo.country, apache.geo.province, apache.geo.city","startTime": "-1d","endTime": "now"},"chart": {"chartType": "table"},"drilldown": {"type": "search","blank": true,"mode": "auto"}}" to json editor
    And I wait for "500" millsecond
    And I click the "Check" button
    And I wait for "500" millsecond
    Then I will see the success message "校验通过"
    And I click the "Ensure" button
    And I click the "Jiangsu" button
    And switch to another window
    Then I wait for title change text to "搜索"
    And I close all tabs except main tab
    And I will see the "splSearch.SearchPage" page
    Then I will see the "SearchInput" result will be "tag:sample04061424_chart AND 'apache.geo.province':江苏"

  @dashboard @dashboardSmoke
  Scenario: 高级搜索钻取-blank RZY-1490 RZY-3764
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "测试高级编辑"
    Then I will see the "dashboard.DetailPage" page
    And I wait for "1000" millsecond
    When the chart title is "仪表盘高级编辑" then I click the button which classname is "anticon css-ifnfqv ant-dropdown-trigger" in dashboard
    And I click the "Edit" button
    And I set the parameter "{"title": "仪表盘高级编辑","description": "测试描述","x": 0,"y": 15,"w": 12,"h": 5,"search": {"query": "tag:sample04061424_chart | stats count() by apache.geo.country, apache.geo.province, apache.geo.city","startTime": "-1d","endTime": "now"},"chart": {"chartType": "table"},"drilldown": {"type": "search","blank": false,"mode": "auto"}}" to json editor
    And I wait for "500" millsecond
    And I click the "Check" button
    And I wait for "500" millsecond
    Then I will see the success message "校验通过"
    And I click the "Ensure" button
    And I click the "Jiangsu" button
    Then I wait for title change text to "搜索"
    And I close all tabs except main tab
    And I will see the "splSearch.SearchPage" page
    Then I will see the "SearchInput" result will be "tag:sample04061424_chart AND 'apache.geo.province':江苏"

  @dashboard @dashboardSmoke
  Scenario: 高级搜索钻取-query及timeRange  RZY-3821,RZY-1492,RZY-1493
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "测试高级编辑"
    Then I will see the "dashboard.DetailPage" page
    And I wait for "1000" millsecond
    When the chart title is "仪表盘高级编辑" then I click the button which classname is "anticon css-ifnfqv ant-dropdown-trigger" in dashboard
    And I click the "Edit" button
    And I set the parameter "{"title": "仪表盘高级编辑","description": "测试描述","x": 0,"y": 15,"w": 12,"h": 5,"search": {"query": "tag:sample04061424_chart | stats count() by apache.geo.country, apache.geo.province, apache.geo.city","startTime": "-1d","endTime": "now"},"chart": {"chartType": "table"},"drilldown": {"type": "search","blank": false,"mode": "custom","query": "tag:sample04061424 | where apache.status<400 && apache.status>200 | stats count() as cnt","timeRange": "-1d/d,now/d"}}" to json editor
    And I wait for "500" millsecond
    And I click the "Check" button
    And I wait for "500" millsecond
    Then I will see the success message "校验通过"
    And I click the "Ensure" button
    And I click the "Jiangsu" button
    Then I wait for title change text to "搜索"
    And I will see the "splSearch.SearchPage" page
    Then I will see the "SearchInput" result will be "tag:sample04061424 | where apache.status<400 && apache.status>200 | stats count() as cnt"
    Then I will see the input element "TimeRange" value will contains "-1d/d,now/d"

  @dashboard @dashboardSmoke
  Scenario Outline: 高级搜索钻取修改校验query,timeRange RZY-1492,RZY-1493
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "测试高级编辑"
    Then I will see the "dashboard.DetailPage" page
    And I wait for "1000" millsecond
    When the chart title is "仪表盘高级编辑" then I click the button which classname is "anticon css-ifnfqv ant-dropdown-trigger" in dashboard
    And I click the "Edit" button
    And I set the parameter "{"title": "仪表盘高级编辑","description": "测试描述","x": 0,"y": 15,"w": 12,"h": 5,"search": {"query": "tag:sample04061424_chart | stats count() by apache.geo.country, apache.geo.province, apache.geo.city","startTime": "-1d","endTime": "now"},"chart": {"chartType": "table"},"drilldown": {"type": "search","blank": false,<json>}}" to json editor
    And I wait for "500" millsecond
    And I click the "Check" button
    And I wait for "500" millsecond
    Then I will see the message contains "<message>"

    Examples:
      | json                                                                                                                   | message                       |
      | "mode": "custom"                                                                                                       | drilldown -> query 字段为必填项     |
      | "mode": "custom","query": "tag:sample04061424 \| where apache.status<400 && apache.status>200 \| stats count() as cnt" | drilldown -> timeRange 字段为必填项 |

  @dashboard @dashboardSmoke
  Scenario: 新建输入项
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "测试高级编辑"
    Then I will see the "dashboard.DetailPage" page
    When I click the "AddEventButton" button
    And I click the "AddInput" button
    And I set the parameter "FilterTitle" with value "filter"
    And I set the parameter "FilterToken" with value "filter"
    Then I click the "Ensure" button
    Then I wait for "FilterName" will be visible

  @dashboard @dashboardSmoke
  Scenario: 修改仪表盘配置
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "测试高级编辑"
    Then I will see the "dashboard.DetailPage" page
    And I wait for "1000" millsecond
    When the chart title is "仪表盘高级编辑" then I click the button which classname is "anticon css-ifnfqv ant-dropdown-trigger" in dashboard
    And I click the "Edit" button
    And I set the parameter "{"title": "仪表盘所有","description": "","x": 0,"y": 15,"w": 12,"h": 5,"search": {"query": "tag:sample04061424_display|stats count() by apache.geo.city","startTime": "now/d","endTime": "now"},"chart": {"chartType": "table"},"drilldown": {"type": "local","targets": [{"action": "eval","name": "filter","value": "${click.value2}+200"}]}}" to json editor
    And I wait for "500" millsecond
    And I click the "Check" button
    And I wait for "500" millsecond
    Then I will see the success message "校验通过"
    And I click the "Ensure" button

  @dashboard @dashboardSmoke
  Scenario: 验证输入值支持eval
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "测试高级编辑"
    Then I will see the "dashboard.DetailPage" page
    And I wait for "Progress" will be invisible
    And I click the "CountNum" button
    Then I will see the input element "FilterInput" value will contains "224"

  @dashboard @dashboardSmoke
  Scenario Outline: 跳转到搜索页面—自动 RZY-3762
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "<name>"
    Then I will see the "dashboard.DetailPage" page
    And I wait for "Progress" will be invisible
    When the chart title is "仪表盘所有" then I click the button which classname is "anticon css-ifnfqv ant-dropdown-trigger" in dashboard
    And I click the "DrillSetting" button
    And I choose the "跳转到搜索页" from the "DrillAction"
    And I "checked" the checkbox which name is "在浏览器新标签页中打开"
    And I click the "Ensure" button
    And I wait for "1000" millsecond
    And I click the "ChartType" button
    Then I will see the "trend.CreatePage" page
    And I wait for "Dimension" will be visible
    And I click the "Dimension" button under some element
    And I click the "<targetName>" button
#    And I hide the element "Content"
    And I wait for "1000" millsecond
    And I click the "Setting" button under some element
    And I choose the "count()" from the "DataValue"
    And I click the "Divide" button
    And I click the "AddField" button
    And I choose the "apache.geo.city" from the "DataValue"
    Then I click the "Generate" button
    And I wait for "1500" millsecond
    And I click the "Setting" button under some element
#    Then I hide the element "SettingContent"
#    And I wait for "Progress" will be invisible
    Then I will see the "dashboard.DetailPage" page
    And I wait for "2000" millsecond
    And I click the "TrendTitle" button
    And I wait for "SettingChart" will be visible
    And I click the "SettingChart" button
    And I click the "Edit" button
    Then I will see the "TextLayer" result will contain "<json>"

    Examples:
      | name       | targetName |  json    |
      | 测试高级编辑 | Pie        | "drilldown": {\n    "type": "search",\n    "blank": true,\n    "mode": "auto"\n  }  |

  @dashboard @dashboardSmoke
  Scenario: 跳转到搜索页—自定义 RZY-3763
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "测试高级编辑"
    Then I will see the "dashboard.DetailPage" page
    And I wait for "Progress" will be invisible
    When the chart title is "仪表盘所有" then I click the button which classname is "anticon css-ifnfqv ant-dropdown-trigger" in dashboard
    And I click the "Edit" button
    And I set the parameter "{"title": "仪表盘所有","description": "","x": 0,"y": 15,"w": 12,"h": 5,"search": {"query": "tag:sample04061424_display|stats count() by apache.geo.city","startTime": "now/d","endTime": "now"},"chart": {"chartType": "table"},"drilldown": {"type": "search","blank": true,"mode": "custom"}}" to json editor
    And I wait for "500" millsecond
    And I click the "Check" button
    And I wait for "500" millsecond
    Then I will see the message contains "drilldown -> query 字段为必填项"
    And I wait for "1500" millsecond
    And I set the parameter "{"title": "仪表盘所有","description": "","x": 0,"y": 15,"w": 12,"h": 5,"search": {"query": "tag:sample04061424_display|stats count() by apache.geo.city","startTime": "now/d","endTime": "now"},"chart": {"chartType": "table"},"drilldown": {"type": "search","blank": true,"mode": "custom","query": "tag:*display | stats count() by apache.clientip,apache.resp_len | limit 10","timeRange": "-1000d,+1d"}}" to json editor
    And I wait for "500" millsecond
    And I click the "Check" button
    And I wait for "500" millsecond
    Then I will see the success message "校验通过"
    And I click the "Ensure" button

  @dashboard @dashboardSmoke
  Scenario Outline: 跳转到自定义URL RZY-3765
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "<name>"
    Then I will see the "dashboard.DetailPage" page
    And I wait for "Progress" will be invisible
    When the chart title is "仪表盘所有" then I click the button which classname is "anticon css-ifnfqv ant-dropdown-trigger" in dashboard
    And I click the "DrillSetting" button
    And I choose the "跳转到自定义URL" from the "DrillAction"
    And I set the parameter "Url" with value "<url>"
    And I "unchecked" the checkbox which name is "在浏览器新标签页中打开"
    And I click the "Ensure" button
    And I wait for "Progress" will be invisible
    Then I will see the "dashboard.DetailPage" page
    And I click the "SettingChart" button
    And I click the "Edit" button
    Then I will see the "TextLayer" result will contain "<json>"
    And I wait for "1500" millsecond
    And I set the parameter "{"title": "仪表盘所有","description": "","x": 0,"y": 15,"w": 12,"h": 5,"search": {"query": "tag:sample04061424_display|stats count() by apache.geo.city","startTime": "now/d","endTime": "now"},"chart": {"chartType": "table"},"drilldown": {"type": "custom","blank": true,"link": "/alerts/new/"}}" to json editor
    And I wait for "500" millsecond
    And I click the "Check" button
    And I wait for "500" millsecond
    Then I will see the success message "校验通过"
    And I click the "Ensure" button
    And I click the "Shanghai" button
    And switch to another window
    And I close all tabs except main tab
    Then I wait for title change text to "监控详情"

    Examples:
      | name       | url                              |  json    |
      | 测试高级编辑 | https://www.rizhiyi.com/        | "drilldown": {\n    "type": "custom",\n    "blank": false,\n    "link": "https://www.rizhiyi.com/"\n  }  |

  @dashboard @dashboardSmoke
  Scenario Outline: chartType RZY-3694
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "<name>"
    Then I will see the "dashboard.DetailPage" page
    And I wait for "Progress" will be invisible
    When the chart title is "仪表盘所有" then I click the button which classname is "anticon css-ifnfqv ant-dropdown-trigger" in dashboard
    And I click the "Edit" button
    Then I will see the "TextLayer" result will contain "<json>"
    And I wait for "1500" millsecond
    And I set the parameter "{"title": "仪表盘所有","description": "","x": 0,"y": 15,"w": 12,"h": 5,"search": {"query": "tag:sample04061424_display|stats count() by apache.geo.city","startTime": "now/d","endTime": "now"},"chart": {"chartType": "<chartType>"},"drilldown": {"type": "custom","blank": true,"link": "/alerts/new/"}}" to json editor
    And I wait for "500" millsecond
    And I click the "Check" button
    And I wait for "500" millsecond
    Then I will see the message contains "chart -> field 字段为必填项"

    Examples:
      | name       | chartType |  json    |
      | 测试高级编辑 | pie       | "chart": {\n    "chartType": "table"\n  },  |


  @cleanDashboard
  Scenario Outline: 删除仪表盘
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    When the data name is "<name>" then i click the "删除" button
    And I wait for "Ensure" will be visible
    And I click the "Ensure" button
    And I wait for "500" millsecond
    Then I will see the success message "删除仪表盘成功"

    Examples:
      | name   |
      | 测试高级编辑 |

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
      | 仪表盘所有 |
#      | 仪表盘高级编辑饼状图 |
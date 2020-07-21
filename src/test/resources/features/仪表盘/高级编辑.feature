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
  Scenario: 新建趋势图
    And open the "trend.ListPage" page for uri "/trend/"
    And I click the "CreateButton" button
    And I click the "Create" button
    Then I will see the "trend.CreatePage" page
    And I set the parameter "SearchInput" with value "tag:*display | stats count() by apache.clientip,apache.resp_len | limit 10 "
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for "Header" will be visible
    And I click the "NextButton" button
    And I wait for "Header" will be visible
    And I click the "NextButton" button
    When I set the parameter "NameInput" with value "仪表盘所有"
    And I click the "NextButton" button
    And I wait for "SuccessCreate" will be visible

  @dashboard @dashboardSmoke
  Scenario: 新建标签页
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "测试高级编辑"
    Then I will see the "dashboard.DetailPage" page
    When I set the parameter "TagName" with value "chart"
    And I click the "Ensure" button
    And I wait for loading complete

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
  Scenario: 修改query字段
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "测试高级编辑"
    Then I will see the "dashboard.DetailPage" page
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
  Scenario: 修改开始时间
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "测试高级编辑"
    Then I will see the "dashboard.DetailPage" page
    When the chart title is "仪表盘所有" then I click the button which classname is "anticon css-ifnfqv ant-dropdown-trigger" in dashboard
    And I click the "Edit" button
    And I set the parameter "{"title": "仪表盘所有","description": "","x": 0,"y": 15,"w": 12,"h": 5,"search": {"query": "tag:sample04061424_chart | stats count() by apache.geo.country, apache.geo.province, apache.geo.city","startTime": "-2d","endTime": "now"},"chart": {"chartType": "table"}}" to json editor
    And I wait for "500" millsecond
    And I click the "Check" button
    Then I will see the success message "校验通过"
    Then I click the "Ensure" button
    Then I wait for element "SuccessMessage" change text to "配置成功"
    And I refresh the website
    And I wait for "Progress" will be invisible
    Then I will see the "DropdownLink" result will be "最近2天"

  @dashboard @dashboardSmoke
  Scenario Outline: 校验开始时间和结束时间
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "测试高级编辑"
    Then I will see the "dashboard.DetailPage" page
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
  Scenario Outline: 校验row和column
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "测试高级编辑"
    Then I will see the "dashboard.DetailPage" page
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
      | 0  | 15 | 0  | 1  | w 字段值的有效区间范围为'1'至'12' |
      | 0  | 15 | 13 | 1  | w 字段值的有效区间范围为'1'至'12' |
      | 0  | 15 | 1  | 0  | h 字段值不能低于其允许最小值'1'    |
      | -1 | 15 | 1  | 12 | x 字段值的有效区间范围为'0'至'12' |
      | 13 | 15 | 1  | 12 | x 字段值的有效区间范围为'0'至'12' |
      | 1  | -1 | 1  | 12 | y 字段值不能低于其允许最小值'0'    |

  @dashboard @dashboardSmoke
  Scenario: 验证title字段
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "测试高级编辑"
    Then I will see the "dashboard.DetailPage" page
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
  Scenario: 验证备注字段
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
    And I click the "CustomTitle" button
    And I click the "Describe" button
    Then I will see the "DescribeText" result will be "测试描述"

  @dashboard @dashboardSmoke
  Scenario: 验证清空JSON
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
  Scenario: 验证重置JSON
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "测试高级编辑"
    Then I will see the "dashboard.DetailPage" page
    When the chart title is "仪表盘高级编辑" then I click the button which classname is "anticon css-ifnfqv ant-dropdown-trigger" in dashboard
    And I click the "Edit" button
    And I set the parameter "{"title": "仪表盘所有","description": "","x": -1,"y": 15,"w": 12,"h": 5,"search": {"query": "tag:sample04061424_chart | stats count() by apache.geo.country, apache.geo.province, apache.geo.city","startTime": "-2d","endTime": "now"},"chart": {"chartType": "table"}}" to json editor
    And I wait for "500" millsecond
    And I click the "Check" button
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
    Then I will see the success message "钻取功能已启用"

  @dashboard @dashboardSmoke
  Scenario: 高级搜索钻取-type
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "测试高级编辑"
    Then I will see the "dashboard.DetailPage" page
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
  Scenario: 高级搜索钻取-blank
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "测试高级编辑"
    Then I will see the "dashboard.DetailPage" page
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
  Scenario: 高级搜索钻取-query及timeRange
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "测试高级编辑"
    Then I will see the "dashboard.DetailPage" page
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
    Then I will see the input element "TimeRange" value will contains "昨天"

  @dashboard @dashboardSmoke
  Scenario Outline: 高级搜索钻取修改校验
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "测试高级编辑"
    Then I will see the "dashboard.DetailPage" page
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
      | 仪表盘所有 |
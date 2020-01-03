@dashboard @dashboardSmoke
Feature: 仪表盘高级编辑

  Scenario Outline: 新建仪表盘
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I click the "Create" button
    When I set the parameter "DashBoardName" with value "<name>"
    And I click the "Ensure" button
    Then I will see the success message "新建成功"

    Examples:
      | name   |
      | 测试高级编辑 |

  Scenario: 新建趋势图
    And open the "trend.ListPage" page for uri "/trend/"
    And I click the "Create" button
    Then I will see the "trend.CreatePage" page
    When I set the parameter "NameInput" with value "仪表盘所有"
    And I click the "NextButton" button
    And I set the parameter "SearchInput" with value "tag:*display | stats count() by apache.clientip,apache.resp_len | limit 10 "
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for "Header" will be visible
    And I click the "NextButton" button
    And I click the "NextButton" button
    Then I will see the element "SuccessCreate" name is "新建成功！"

  Scenario: 新建标签页
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I click the detail which name is "测试高级编辑"
    Then I will see the "dashboard.DetailPage" page
    When I set the parameter "TagName" with value "chart"
    And I click the "EnsureCreateTagButton" button
    And I wait for loading complete

  Scenario: 添加图表
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I click the detail which name is "测试高级编辑"
    Then I will see the "dashboard.DetailPage" page
    And I click the "AddButton" button
    And I choose the "添加图表" from the "EventList"
    And I check "仪表盘所有" from the "CheckBox"
    And I click the "EnsureAddTrend" button
    And I wait for "ChartSetting" will be visible

  Scenario: 修改query字段
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I click the detail which name is "测试高级编辑"
    Then I will see the "dashboard.DetailPage" page
    And I wait for "Progress" will be invisible
    And I wait for "ChartSetting" will be visible
    And I click the "ChartSetting" button
    And I click the "Edit" button
    And I set the parameter "{"title": "仪表盘所有","description": "","row": 1,"column": 1,"sizex": 12,"sizey": 4,"search": {"query": "tag:sample04061424_chart | stats count() by apache.geo.country, apache.geo.province, apache.geo.city","startTime": "now/d","endTime": "now"},"chart": {"chartType": "table"}}" to json editor
    And I click the "Check" button
    Then I wait for "CheckRight" will be visible
    And I click the "EnsureEdit" button
    And I wait for "TableHeader" will be visible
    Then I will see the "TableHeader" result will be "apache.geo.country apache.geo.province apache.geo.city count()"

  Scenario: 修改开始时间
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I click the detail which name is "测试高级编辑"
    Then I will see the "dashboard.DetailPage" page
    And I wait for "Progress" will be invisible
    And I wait for "ChartSetting" will be visible
    And I click the "ChartSetting" button
    And I click the "Edit" button
    And I set the parameter "{"title": "仪表盘所有","description": "","row": 1,"column": 1,"sizex": 12,"sizey": 4,"search": {"query": "tag:sample04061424_chart | stats count() by apache.geo.country, apache.geo.province, apache.geo.city","startTime": "-2d","endTime": "now"},"chart": {"chartType": "table"}}" to json editor
    And I click the "Check" button
    Then I wait for "CheckRight" will be visible
    And I click the "EnsureEdit" button
    And I wait for "TableHeader" will be visible
    Then I will see the "DropdownLink" result will be "最近2天"

  Scenario Outline: 校验开始时间和结束时间
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I click the detail which name is "测试高级编辑"
    Then I will see the "dashboard.DetailPage" page
    And I wait for "Progress" will be invisible
    And I wait for "ChartSetting" will be visible
    And I click the "ChartSetting" button
    And I click the "Edit" button
    And I set the parameter "{"title": "仪表盘所有","description": "","row": 1,"column": 1,"sizex": 12,"sizey": 4,"search": {"query": "tag:sample04061424_chart | stats count() by apache.geo.country, apache.geo.province, apache.geo.city","startTime": "<start>","endTime": "<end>"},"chart": {"chartType": "table"}}" to json editor
    And I click the "Check" button
    And I wait for "Message" will be visible
    Then I will see the message contains "<message>"

    Examples:
      | start | end | message                    |
      |       | now | search -> startTime 字段不能为空 |
      | -2d   |     | search -> endTime 字段不能为空   |

  Scenario Outline: 校验row和column
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I click the detail which name is "测试高级编辑"
    Then I will see the "dashboard.DetailPage" page
    And I wait for "Progress" will be invisible
    And I wait for "ChartSetting" will be visible
    And I click the "ChartSetting" button
    And I click the "Edit" button
    And I set the parameter "{"title": "仪表盘所有","description": "","row": <row>,"column": <column>,"sizex": 12,"sizey": 4,"search": {"query": "tag:sample04061424_chart | stats count() by apache.geo.country, apache.geo.province, apache.geo.city","startTime": "-1d","endTime": "now"},"chart": {"chartType": "table"}}" to json editor
    And I click the "Check" button
    And I wait for "Message" will be visible
    Then I will see the message contains "<message>"

    Examples:
      | row | column | message                    |
      | 0   | 1      | row 字段值不能低于其允许最小值'1'       |
      | 1   | 0      | column 字段值的有效区间范围为'1'至'12' |
      | 1   | 13     | column 字段值的有效区间范围为'1'至'12' |

  Scenario Outline: 校验sizex和sizey
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I click the detail which name is "测试高级编辑"
    Then I will see the "dashboard.DetailPage" page
    And I wait for "Progress" will be invisible
    And I wait for "ChartSetting" will be visible
    And I click the "ChartSetting" button
    And I click the "Edit" button
    And I set the parameter "{"title": "仪表盘所有","description": "","row": 1,"column": 1,"sizex": <x>,"sizey": <y>,"search": {"query": "tag:sample04061424_chart | stats count() by apache.geo.country, apache.geo.province, apache.geo.city","startTime": "-1d","endTime": "now"},"chart": {"chartType": "table"}}" to json editor
    And I click the "Check" button
    And I wait for "Message" will be visible
    Then I will see the message contains "<message>"

    Examples:
      | x  | y | message                   |
      | 0  | 4 | sizex 字段值的有效区间范围为'1'至'12' |
      | 13 | 4 | sizex 字段值的有效区间范围为'1'至'12' |
      | 12 | 0 | sizey 字段值不能低于其允许最小值'1'    |

  Scenario: 验证title字段
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I click the detail which name is "测试高级编辑"
    Then I will see the "dashboard.DetailPage" page
    And I wait for "Progress" will be invisible
    And I wait for "ChartSetting" will be visible
    And I click the "ChartSetting" button
    And I click the "Edit" button
    And I set the parameter "{"title": "仪表盘高级编辑","description": "","row": 1,"column": 1,"sizex": 12,"sizey": 4,"search": {"query": "tag:sample04061424_chart | stats count() by apache.geo.country, apache.geo.province, apache.geo.city","startTime": "-1d","endTime": "now"},"chart": {"chartType": "table"}}" to json editor
    And I click the "Check" button
    Then I wait for "CheckRight" will be visible
    And I click the "EnsureEdit" button
    Then I will see the "TrendTitle" result will be "仪表盘高级编辑"

  Scenario: 验证备注字段
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I click the detail which name is "测试高级编辑"
    Then I will see the "dashboard.DetailPage" page
    And I wait for "Progress" will be invisible
    And I wait for "ChartSetting" will be visible
    And I click the "ChartSetting" button
    And I click the "Edit" button
    And I set the parameter "{"title": "仪表盘高级编辑","description": "测试描述","row": 1,"column": 1,"sizex": 12,"sizey": 4,"search": {"query": "tag:sample04061424_chart | stats count() by apache.geo.country, apache.geo.province, apache.geo.city","startTime": "-1d","endTime": "now"},"chart": {"chartType": "table"}}" to json editor
    And I click the "Check" button
    Then I wait for "CheckRight" will be visible
    And I click the "EnsureEdit" button
    And I click the "TrendTitle" button
    And I click the "Describe" button
    Then I will see the "DescribeText" result will be "测试描述"

  Scenario: 验证清空JSON
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I click the detail which name is "测试高级编辑"
    Then I will see the "dashboard.DetailPage" page
    And I wait for "Progress" will be invisible
    And I wait for "ChartSetting" will be visible
    And I click the "ChartSetting" button
    And I click the "Edit" button
    And I wait for "Operate" will be visible
    And I click the "Operate" button
    And I choose the "清空JSON" from the "EventList"
    And I click the "Check" button
    And I wait for "Message" will be visible
    Then I will see the message contains "title 字段为必填项"

  Scenario: 验证美化JSON
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I click the detail which name is "测试高级编辑"
    Then I will see the "dashboard.DetailPage" page
    And I wait for "Progress" will be invisible
    And I wait for "ChartSetting" will be visible
    And I click the "ChartSetting" button
    And I click the "Edit" button
    And I set the parameter "{"title": "仪表盘高级编辑","description": "测试描述","row": 1,"column": 1,"sizex": 0,"sizey": 4,"search": {"query": "tag:sample04061424_chart | stats count() by apache.geo.country, apache.geo.province, apache.geo.city","startTime": "-1d","endTime": "now"},"chart": {"chartType": "table"}}" to json editor
    And I click the "Operate" button
    And I choose the "美化JSON" from the "EventList"
    And I click the "Check" button
    Then I will see the message contains "错误出现在第 6 行: sizex 字段值的有效区间范围为'1'至'12'"

  Scenario: 验证重置JSON
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I click the detail which name is "测试高级编辑"
    Then I will see the "dashboard.DetailPage" page
    And I wait for "Progress" will be invisible
    And I wait for "ChartSetting" will be visible
    And I click the "ChartSetting" button
    And I click the "Edit" button
    And I set the parameter "{"title": "仪表盘高级编辑","description": "测试描述","row": 1,"column": 1,"sizex": 0,"sizey": 4,"search": {"query": "tag:sample04061424_chart | stats count() by apache.geo.country, apache.geo.province, apache.geo.city","startTime": "-1d","endTime": "now"},"chart": {"chartType": "table"}}" to json editor
    And I click the "Check" button
    Then I will see the message contains "sizex 字段值的有效区间范围为'1'至'12'"
    And I click the "Operate" button
    And I choose the "重置JSON" from the "EventList"
    And I wait for element "Message" change text to ""
    And I click the "Check" button
    Then I wait for "CheckRight" will be visible

  Scenario: 高级搜索钻取-type
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I click the detail which name is "测试高级编辑"
    Then I will see the "dashboard.DetailPage" page
    And I wait for "Progress" will be invisible
    And I wait for "ChartSetting" will be visible
    And I click the "ChartSetting" button
    And I click the "Edit" button
    And I set the parameter "{"title": "仪表盘高级编辑","description": "测试描述","row": 1,"column": 1,"sizex": 12,"sizey": 4,"search": {"query": "tag:sample04061424_chart | stats count() by apache.geo.country, apache.geo.province, apache.geo.city","startTime": "-1d","endTime": "now"},"chart": {"chartType": "table"},"drilldown": {"type": "search","blank": true,"mode": "auto"}}" to json editor
    And I click the "Check" button
    Then I wait for "CheckRight" will be visible
    And I click the "EnsureEdit" button
    And I click the "Jiangsu" button
    And switch to another window
    And I will see the "splSearch.SearchPage" page
    Then I will see the "SearchInput" result will be "tag:sample04061424_chart AND 'apache.geo.province':江苏"

  Scenario: 高级搜索钻取-blank
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I click the detail which name is "测试高级编辑"
    Then I will see the "dashboard.DetailPage" page
    And I wait for "Progress" will be invisible
    And I wait for "ChartSetting" will be visible
    And I click the "ChartSetting" button
    And I click the "Edit" button
    And I set the parameter "{"title": "仪表盘高级编辑","description": "测试描述","row": 1,"column": 1,"sizex": 12,"sizey": 4,"search": {"query": "tag:sample04061424_chart | stats count() by apache.geo.country, apache.geo.province, apache.geo.city","startTime": "-1d","endTime": "now"},"chart": {"chartType": "table"},"drilldown": {"type": "search","blank": false,"mode": "auto"}}" to json editor
    And I click the "Check" button
    Then I wait for "CheckRight" will be visible
    And I click the "EnsureEdit" button
    And I click the "Jiangsu" button
    Then I wait for title change text to "搜索"
    And I will see the "splSearch.SearchPage" page
    Then I will see the "SearchInput" result will be "tag:sample04061424_chart AND 'apache.geo.province':江苏"

  Scenario: 高级搜索钻取-query及timeRange
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I click the detail which name is "测试高级编辑"
    Then I will see the "dashboard.DetailPage" page
    And I wait for "Progress" will be invisible
    And I wait for "ChartSetting" will be visible
    And I click the "ChartSetting" button
    And I click the "Edit" button
    And I set the parameter "{"title": "仪表盘高级编辑","description": "测试描述","row": 1,"column": 1,"sizex": 12,"sizey": 4,"search": {"query": "tag:sample04061424_chart | stats count() by apache.geo.country, apache.geo.province, apache.geo.city","startTime": "-1d","endTime": "now"},"chart": {"chartType": "table"},"drilldown": {"type": "search","blank": false,"mode": "custom","query": "tag:sample04061424 | where apache.status<400 && apache.status>200 | stats count() as cnt","timeRange": "-1d/d,now/d"}}" to json editor
    And I click the "Check" button
    Then I wait for "CheckRight" will be visible
    And I click the "EnsureEdit" button
    And I click the "Jiangsu" button
    Then I wait for title change text to "搜索"
    And I will see the "splSearch.SearchPage" page
    Then I will see the "SearchInput" result will be "tag:sample04061424 | where apache.status<400 && apache.status>200 | stats count() as cnt"
    Then I will see the input element "TimeRange" value will contains "昨天"

  Scenario Outline: 高级搜索钻取修改校验
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I click the detail which name is "测试高级编辑"
    Then I will see the "dashboard.DetailPage" page
    And I wait for "Progress" will be invisible
    And I wait for "ChartSetting" will be visible
    And I click the "ChartSetting" button
    And I click the "Edit" button
    And I set the parameter "{"title": "仪表盘高级编辑","description": "测试描述","row": 1,"column": 1,"sizex": 12,"sizey": 4,"search": {"query": "tag:sample04061424_chart | stats count() by apache.geo.country, apache.geo.province, apache.geo.city","startTime": "-1d","endTime": "now"},"chart": {"chartType": "table"},"drilldown": {"type": "search","blank": false,<json>}}" to json editor
    And I wait for element "Message" change text to ""
    And I click the "Check" button
    Then I will see the message contains "<message>"

    Examples:
      | json                                                                                                                   | message                       |
      | "mode": "custom"                                                                                                       | drilldown -> query 字段为必填项     |
      | "mode": "custom","query": "tag:sample04061424 \| where apache.status<400 && apache.status>200 \| stats count() as cnt" | drilldown -> timeRange 字段为必填项 |

  Scenario Outline: 删除仪表盘
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    When the data name is "<name>" then i click the "删除" button
    And I wait for "Ensure" will be visible
    And I click the "Ensure" button
    Then I will see the success message "删除成功"

    Examples:
      | name   |
      | 测试高级编辑 |

  Scenario Outline: 删除仪表盘所建趋势图
    Given open the "trend.ListPage" page for uri "/trend/"
    When the data name is "<name>" then i click the "删除" button
    And I wait for "Ensure" will be visible
    And I click the "Ensure" button
    And I will see the success message "删除成功"

    Examples:
      | name  |
      | 仪表盘单值 |
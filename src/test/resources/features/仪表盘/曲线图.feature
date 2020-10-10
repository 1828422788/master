Feature: 仪表盘曲线图

  @dashboard @dashboardSmoke
  Scenario Outline: 新建仪表盘
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I click the "Create" button
    When I set the parameter "DashBoardName" with value "<name>"
    And I click the "Ensure" button
    Then I will see the success message "新建仪表盘成功"

    Examples:
      | name   |
      | 仪表盘曲线图 |

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
      | spl                                                              | name   |
      | tag:*display \| stats count() by apache.clientip,apache.resp_len | 仪表盘曲线图 |

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
      | 曲线图  |

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
      | name   |
      | 仪表盘曲线图 |

  @dashboard @dashboardSmoke
  Scenario Outline: 修改为曲线图 RZY-301
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "<name>"
    Then I will see the "dashboard.DetailPage" page
    And I wait for "Progress" will be invisible
    And I click the "ChartType" button
    Then I will see the "trend.CreatePage" page
    And I wait for "Order" will be visible
    And I click the "Order" button
    And I click the "<targetName>" button
    And I hide the element "Content"
    And I wait for "1000" millsecond
    And I click the "Setting" button under some element
    And I choose the "apache.clientip" from the "DataValue"
    And I click the "Right" button
    And I click the "AscendingOrder" button
    And I click the "ShowAllLabels" button
    And I click the "Yaxis" button
    And I choose the "count()" from the "DataValue"
    And I set the parameter "Unit" with value "个"
    And I click the "Smooth" button
    And I click the "ConnectEmptyData" button
    And I click the "Group" button
    And I choose the "apache.resp_len" from the "DataValue"
    And I click the "Example" button
    And I click the "RightPosition" button
    And I click the "Exhibition" button
    And I click the "StartColour" button
    And I click the "Orange" button
    Then I click the "Generate" button
    And I wait for "1000" millsecond
    Then I hide the element "SettingContent"
    And I wait for "Progress" will be invisible
    Then I will see the "dashboard.DetailPage" page
    And I click the "TrendTitle" button
    And take part of "FullScreen" with name "dashboard/<name>"
#    Then I compare source image "dashboard/<name>" with target image "dashboard/<targetName>"

    Examples:
      | name   | targetName |
      | 仪表盘曲线图 | LineChart  |

  @dashboard
  Scenario Outline: 验证配置是否在高级编辑中体现 RZY-3693
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "<name>"
    Then I will see the "dashboard.DetailPage" page
    When the chart title is "<name>" then I click the button which classname is "anticon css-ifnfqv ant-dropdown-trigger" in dashboard
    And I click the "Edit" button
    Then I will see the "TextLayer" result will contain "<json>"
    And I will see the "TextLayer" result will contain "<json1>"
    And I will see the "TextLayer" result will contain "<json2>"
#    Then I will see the "TextLayer" result will be "<json>"

    Examples:
      | name       | json                                     | json1                                                |  json2                                     |
      | 仪表盘曲线图 |  \n  "chart": {\n    "chartType": "line",|  \n    "xAxis": {\n      "field": "apache.clientip", | \n    "yAxis": {\n      "field": "count()",|

  @dashboard
  Scenario: 修改chartType为不存在的类型 RZY-1281
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "仪表盘曲线图"
    Then I will see the "dashboard.DetailPage" page
    And I wait for "500" millsecond
    When the chart title is "仪表盘曲线图" then I click the button which classname is "anticon css-ifnfqv ant-dropdown-trigger" in dashboard
    And I click the "Edit" button
    And I set the parameter "{"title": "仪表盘曲线图","description": "","x": 0,"y": 0,"w": 12,"h": 5,"search": {"query": "tag:*display | stats count() by apache.clientip,apache.resp_len","startTime": "now/d","endTime": "now"},"chart": {"chartType": "1a","xAxis": {"field": "apache.clientip","labelRotate": "right","sortOrder": "asc"},"precision": "","showAllXAxisLabels": true,"labelInterval": "","customLabel": "","yAxis": {"field": "count()","smooth": true,"unit": "个","connectNull": true,"range": { "min": "","max": ""}},"byFields": ["apache.resp_len"],"legend": {"placement": "bottom"}}}" to json editor
    And I wait for "500" millsecond
    And I click the "Check" button
    Then I wait for element "ErrorMessage" change text to "chart -> chartType 字段值不支持1a"

  @dashboard
  Scenario: 修改chartType为空 RZY-1271
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "仪表盘曲线图"
    Then I will see the "dashboard.DetailPage" page
    And I wait for "500" millsecond
    When the chart title is "仪表盘曲线图" then I click the button which classname is "anticon css-ifnfqv ant-dropdown-trigger" in dashboard
    And I click the "Edit" button
    And I set the parameter "{"title": "仪表盘曲线图","description": "","x": 0,"y": 0,"w": 12,"h": 5,"search": {"query": "tag:*display | stats count() by apache.clientip,apache.resp_len","startTime": "now/d","endTime": "now"},"chart": {"chartType": "","xAxis": {"field": "apache.clientip","labelRotate": "right","sortOrder": "asc"},"precision": "","showAllXAxisLabels": true,"labelInterval": "","customLabel": "","yAxis": {"field": "count()","smooth": true,"unit": "个","connectNull": true,"range": { "min": "","max": ""}},"byFields": ["apache.resp_len"],"legend": {"placement": "bottom"}}}" to json editor
    And I wait for "500" millsecond
    And I click the "Check" button
    Then I wait for element "ErrorMessage" change text to "chart -> chartType 字段值不支持"

  @dashboard
  Scenario: 修改xAxis field字段值置为空 field字段值置为空
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "仪表盘曲线图"
    Then I will see the "dashboard.DetailPage" page
    And I wait for "500" millsecond
    When the chart title is "仪表盘曲线图" then I click the button which classname is "anticon css-ifnfqv ant-dropdown-trigger" in dashboard
    And I click the "Edit" button
    And I set the parameter "{"title": "仪表盘曲线图","description": "","x": 0,"y": 0,"w": 12,"h": 5,"search": {"query": "tag:*display | stats count() by apache.clientip,apache.resp_len","startTime": "now/d","endTime": "now"},"chart": {"chartType": "line","xAxis": {"field": "","labelRotate": "right","sortOrder": "asc"},"precision": "","showAllXAxisLabels": true,"labelInterval": "","customLabel": "","yAxis": {"field": "count()","smooth": true,"unit": "个","connectNull": true,"range": { "min": "","max": ""}},"byFields": ["apache.resp_len"],"legend": {"placement": "bottom"}}}" to json editor
    And I wait for "500" millsecond
    And I click the "Check" button
    Then I wait for element "ErrorMessage" change text to "chart -> field 字段值不能为空"

  @dashboard
  Scenario: 修改yAxis field字段值置为空 RZY-1301
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "仪表盘曲线图"
    Then I will see the "dashboard.DetailPage" page
    And I wait for "500" millsecond
    When the chart title is "仪表盘曲线图" then I click the button which classname is "anticon css-ifnfqv ant-dropdown-trigger" in dashboard
    And I click the "Edit" button
    And I set the parameter "{"title": "仪表盘曲线图","description": "","x": 0,"y": 0,"w": 12,"h": 5,"search": {"query": "tag:*display | stats count() by apache.clientip,apache.resp_len","startTime": "now/d","endTime": "now"},"chart": {"chartType": "line","xAxis": {"field": "apache.clientip","labelRotate": "right","sortOrder": "asc"},"precision": "","showAllXAxisLabels": true,"labelInterval": "","customLabel": "","yAxis": {"field": "","smooth": true,"unit": "个","connectNull": true,"range": { "min": "","max": ""}},"byFields": ["apache.resp_len"],"legend": {"placement": "bottom"}}}" to json editor
    And I wait for "500" millsecond
    And I click the "Check" button
    Then I wait for element "ErrorMessage" change text to "chart -> field 字段值不能为空"

  @dashboard
  Scenario: 修改legend字段值置为空 RZY-1314
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "仪表盘曲线图"
    Then I will see the "dashboard.DetailPage" page
    And I wait for "500" millsecond
    When the chart title is "仪表盘曲线图" then I click the button which classname is "anticon css-ifnfqv ant-dropdown-trigger" in dashboard
    And I click the "Edit" button
    And I set the parameter "{"title": "仪表盘曲线图","description": "","x": 0,"y": 0,"w": 12,"h": 5,"search": {"query": "tag:*display | stats count() by apache.clientip,apache.resp_len","startTime": "now/d","endTime": "now"},"chart": {"chartType": "line","xAxis": {"field": "apache.clientip","labelRotate": "right","sortOrder": "asc"},"precision": "","showAllXAxisLabels": true,"labelInterval": "","customLabel": "","yAxis": {"field": "count()","smooth": true,"unit": "个","connectNull": true,"range": { "min": "","max": ""}},"byFields": ["apache.resp_len"],"legend": {"placement": ""}}}" to json editor
    And I wait for "500" millsecond
    And I click the "Check" button
    Then I wait for element "ErrorMessage" change text to "chart -> placement 字段值不能为空"

  @dashboard
  Scenario: 修改legend字段值置为任意值 RZY-1315
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "仪表盘曲线图"
    Then I will see the "dashboard.DetailPage" page
    And I wait for "500" millsecond
    When the chart title is "仪表盘曲线图" then I click the button which classname is "anticon css-ifnfqv ant-dropdown-trigger" in dashboard
    And I click the "Edit" button
    And I set the parameter "{"title": "仪表盘曲线图","description": "","x": 0,"y": 0,"w": 12,"h": 5,"search": {"query": "tag:*display | stats count() by apache.clientip,apache.resp_len","startTime": "now/d","endTime": "now"},"chart": {"chartType": "line","xAxis": {"field": "apache.clientip","labelRotate": "right","sortOrder": "asc"},"precision": "","showAllXAxisLabels": true,"labelInterval": "","customLabel": "","yAxis": {"field": "count()","smooth": true,"unit": "个","connectNull": true,"range": { "min": "","max": ""}},"byFields": ["apache.resp_len"],"legend": {"placement": "111"}}}" to json editor
    And I wait for "500" millsecond
    And I click the "Check" button
    Then I wait for element "ErrorMessage" change text to "chart -> placement 字段值不支持 111"

  @cleanDashboard
  Scenario Outline: 删除仪表盘
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    When the data name is "<name>" then i click the "删除" button
    And I wait for "Ensure" will be visible
    And I click the "Ensure" button
    Then I will see the success message "删除仪表盘成功"

    Examples:
      | name   |
      | 仪表盘曲线图 |

  @cleanDashboard
  Scenario Outline: 删除仪表盘所建趋势图
    Given open the "trend.ListPage" page for uri "/trend/"
    When the data name is "<name>" then i click the "删除" button
    And I wait for "Ensure" will be visible
    And I click the "Ensure" button
    And I will see the success message "删除成功"

    Examples:
      | name   |
      | 仪表盘曲线图 |
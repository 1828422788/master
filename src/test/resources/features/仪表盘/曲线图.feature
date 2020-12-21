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
      | tag:sample04061424_display \| stats count() by apache.clientip,apache.resp_len | 仪表盘曲线图 |

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
    And I wait for "500" millsecond
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
    And I wait for "1000" millsecond
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
    And I set the parameter "{"title": "仪表盘曲线图","description": "","x": 0,"y": 0,"w": 12,"h": 5,"search": {"query": "tag:sample04061424_display | stats count() by apache.clientip,apache.resp_len","startTime": "now/d","endTime": "now"},"chart": {"chartType": "1a","xAxis": {"field": "apache.clientip","labelRotate": "right","sortOrder": "asc"},"precision": "","showAllXAxisLabels": true,"labelInterval": "","customLabel": "","yAxis": {"field": "count()","smooth": true,"unit": "个","connectNull": true,"range": { "min": "","max": ""}},"byFields": ["apache.resp_len"],"legend": {"placement": "bottom"}}}" to json editor
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
    And I set the parameter "{"title": "仪表盘曲线图","description": "","x": 0,"y": 0,"w": 12,"h": 5,"search": {"query": "tag:sample04061424_display | stats count() by apache.clientip,apache.resp_len","startTime": "now/d","endTime": "now"},"chart": {"chartType": "","xAxis": {"field": "apache.clientip","labelRotate": "right","sortOrder": "asc"},"precision": "","showAllXAxisLabels": true,"labelInterval": "","customLabel": "","yAxis": {"field": "count()","smooth": true,"unit": "个","connectNull": true,"range": { "min": "","max": ""}},"byFields": ["apache.resp_len"],"legend": {"placement": "bottom"}}}" to json editor
    And I wait for "500" millsecond
    And I click the "Check" button
    Then I wait for element "ErrorMessage" change text to "chart -> chartType 字段值不支持"

  @dashboard @dashboardSmoke
  Scenario Outline: chartType字段-置为序列图其他类型 RZY-1282,RZY-1283,RZY-1284
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "仪表盘曲线图"
    Then I will see the "dashboard.DetailPage" page
    And I wait for "Progress" will be invisible
    When the chart title is "仪表盘曲线图" then I click the button which classname is "anticon css-ifnfqv ant-dropdown-trigger" in dashboard
    And I click the "Edit" button
    Then I set the parameter "{"title": "仪表盘曲线图","description": "","x": 0,"y": 0,"w": 12,"h": 5,"search": {"query": "tag:sample04061424_display | stats count() by apache.clientip,apache.resp_len","startTime": "now/d","endTime": "now"},"chart": {"chartType": "<chartType>","xAxis": {"field": "apache.clientip","labelRotate": "right","sortOrder": "asc"},"precision": "","showAllXAxisLabels": true,"labelInterval": "","customLabel": "","yAxis": {"field": "count()","smooth": true,"unit": "个","connectNull": true,"range": { "min": "","max": ""}},"byFields": ["apache.resp_len"],"legend": {"placement": "bottom"}}}" to json editor
    And I wait for "500" millsecond
    And I click the "Check" button
    And I wait for "500" millsecond
    Then I will see the success message "校验通过"
    And I wait for "500" millsecond
    Then I click the "Ensure" button
    And I wait for loading invisible
    And I wait for "2000" millsecond
    Then take part of "SequenceChart" with name "actual/<image>"
#    And I compare source image "actual/<image>" with target image "expect/<image>"

    Examples:
      | chartType |   image                  |
      | area      | 序列图_chartType_area     |
      | scatter   | 序列图_chartType_scatter  |
      | column    | 序列图_chartType_column   |

  @dashboard
  Scenario: 修改xAxis field字段值置为空 RZY-1285
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "仪表盘曲线图"
    Then I will see the "dashboard.DetailPage" page
    And I wait for "500" millsecond
    When the chart title is "仪表盘曲线图" then I click the button which classname is "anticon css-ifnfqv ant-dropdown-trigger" in dashboard
    And I click the "Edit" button
    And I set the parameter "{"title": "仪表盘曲线图","description": "","x": 0,"y": 0,"w": 12,"h": 5,"search": {"query": "tag:sample04061424_display | stats count() by apache.clientip,apache.resp_len","startTime": "now/d","endTime": "now"},"chart": {"chartType": "line","xAxis": {"field": "","labelRotate": "right","sortOrder": "asc"},"precision": "","showAllXAxisLabels": true,"labelInterval": "","customLabel": "","yAxis": {"field": "count()","smooth": true,"unit": "个","connectNull": true,"range": { "min": "","max": ""}},"byFields": ["apache.resp_len"],"legend": {"placement": "bottom"}}}" to json editor
    And I wait for "500" millsecond
    And I click the "Check" button
    Then I wait for element "ErrorMessage" change text to "chart -> field 字段值不能为空"

  @dashboard @dashboardSmoke
  Scenario Outline: field byFields RZY-1286,RZY-1287,RZY-1299
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "仪表盘曲线图"
    Then I will see the "dashboard.DetailPage" page
    And I wait for "Progress" will be invisible
    When the chart title is "仪表盘曲线图" then I click the button which classname is "anticon css-ifnfqv ant-dropdown-trigger" in dashboard
    And I click the "Edit" button
    Then I set the parameter "{"title": "仪表盘曲线图","description": "","x": 0,"y": 0,"w": 12,"h": 5,"search": {"query": "tag:sample04061424_display | stats count() by apache.clientip,apache.resp_len","startTime": "now/d","endTime": "now"},"chart": {"chartType": "line","xAxis": {"field": "<field>","labelRotate": "right","sortOrder": "asc"},"precision": "","showAllXAxisLabels": true,"labelInterval": "","customLabel": "","yAxis": {"field": "count()","smooth": true,"unit": "个","connectNull": true,"range": { "min": "","max": ""}},"byFields": ["<byField>"],"legend": {"placement": "bottom"}}}" to json editor
    And I wait for "500" millsecond
    And I click the "Check" button
    Then I will see the success message "校验通过"
    And I wait for "500" millsecond
    Then I click the "Ensure" button
    And I wait for loading invisible
    And I wait for "2000" millsecond
    Then take part of "SequenceChart" with name "actual/<image>"
#    And I compare source image "actual/<image>" with target image "expect/<image>"

    Examples:
      | field              | byField         |   image                     |
      | apache.resp_len    | apache.clientip | 序列图_xAxis_Field_existed   |
      | apache.clientippppp| apache.resp_len | 序列图_xAxis_Field_error     |

  @dashboard @dashboardSmoke
  Scenario Outline: labelRotate-right-horizontal-vertical RZY-1291,RZY-1292,RZY-1293
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "<name>"
    Then I will see the "dashboard.DetailPage" page
    And I wait for "Progress" will be invisible
    When the chart title is "<name>" then I click the button which classname is "anticon css-ifnfqv ant-dropdown-trigger" in dashboard
    And I click the "Edit" button
    Then I set the parameter "{"title": "仪表盘曲线图","description": "","x": 0,"y": 0,"w": 12,"h": 5,"search": {"query": "tag:sample04061424_display | stats count() by apache.clientip,apache.resp_len","startTime": "now/d","endTime": "now"},"chart": {"chartType": "line","xAxis": {"field": "apache.clientip","labelRotate": "<labelRotate>","sortOrder": "asc"},"precision": "","showAllXAxisLabels": true,"labelInterval": "","customLabel": "","yAxis": {"field": "count()","smooth": true,"unit": "个","connectNull": true,"range": { "min": "","max": ""}},"byFields": ["apache.resp_len"],"legend": {"placement": "bottom"}}}" to json editor
    And I wait for "500" millsecond
    And I click the "Check" button
#    Then I will see the success message "校验通过"
    Then I click the "Ensure" button
    And I wait for loading invisible
    And I wait for "2000" millsecond
    Then I will see the element "XaxisField" transform contains "<rotate>"

    Examples:
      | name       |   labelRotate  |  rotate       |
      | 仪表盘曲线图 |   horizontal   |  rotate(0)    |
      | 仪表盘曲线图 |      right     |  rotate(45)   |
      | 仪表盘曲线图 |    vertical    |  rotate(-90)  |

  @dashboard @dashboardSmoke
  Scenario Outline: sortOrder-asc-desc-default RZY-1295,RZY-1296,RZY-1297
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "<name>"
    Then I will see the "dashboard.DetailPage" page
    And I wait for "Progress" will be invisible
    When the chart title is "<name>" then I click the button which classname is "anticon css-ifnfqv ant-dropdown-trigger" in dashboard
    And I click the "Edit" button
    Then I set the parameter "{"title": "仪表盘曲线图","description": "","x": 0,"y": 0,"w": 12,"h": 5,"search": {"query": "tag:sample04061424_display | stats count() by apache.clientip,apache.resp_len","startTime": "now/d","endTime": "now"},"chart": {"chartType": "line","xAxis": {"field": "apache.clientip","labelRotate": "left","sortOrder": "<sortOrder>"},"precision": "","showAllXAxisLabels": true,"labelInterval": "","customLabel": "","yAxis": {"field": "count()","smooth": true,"unit": "个","connectNull": true,"range": { "min": "","max": ""}},"byFields": ["apache.resp_len"],"legend": {"placement": "bottom"}}}" to json editor
    And I wait for "500" millsecond
    And I click the "Check" button
#    Then I will see the success message "校验通过"
    And I wait for "500" millsecond
    Then I click the "Ensure" button
    And I wait for loading invisible
    And I wait for "2000" millsecond
    Then take part of "SequenceChart" with name "actual/<image>"
#    And I compare source image "actual/<image>" with target image "expect/<image>"

    Examples:
      | name       |   sortOrder   |    image                 |
      | 仪表盘曲线图 |      asc      |  序列图_sortOrder_asc     |
      | 仪表盘曲线图 |      desc     |  序列图_sortOrder_desc    |
      | 仪表盘曲线图 |    default    |  序列图_sortOrder_default |

  @dashboard
  Scenario: 修改yAxis field字段值置为空 RZY-1301
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "仪表盘曲线图"
    Then I will see the "dashboard.DetailPage" page
    And I wait for "500" millsecond
    When the chart title is "仪表盘曲线图" then I click the button which classname is "anticon css-ifnfqv ant-dropdown-trigger" in dashboard
    And I click the "Edit" button
    And I set the parameter "{"title": "仪表盘曲线图","description": "","x": 0,"y": 0,"w": 12,"h": 5,"search": {"query": "tag:sample04061424_display | stats count() by apache.clientip,apache.resp_len","startTime": "now/d","endTime": "now"},"chart": {"chartType": "line","xAxis": {"field": "apache.clientip","labelRotate": "right","sortOrder": "asc"},"precision": "","showAllXAxisLabels": true,"labelInterval": "","customLabel": "","yAxis": {"field": "","smooth": true,"unit": "个","connectNull": true,"range": { "min": "","max": ""}},"byFields": ["apache.resp_len"],"legend": {"placement": "bottom"}}}" to json editor
    And I wait for "500" millsecond
    And I click the "Check" button
    Then I wait for element "ErrorMessage" change text to "chart -> field 字段值不能为空"

  @dashboard
  Scenario Outline: 修改yAxis field字段值置为错误值 RZY-1302
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "<name>"
    Then I will see the "dashboard.DetailPage" page
    And I wait for "500" millsecond
    When the chart title is "<name>" then I click the button which classname is "anticon css-ifnfqv ant-dropdown-trigger" in dashboard
    And I click the "Edit" button
    And I set the parameter "{"title": "仪表盘曲线图","description": "","x": 0,"y": 0,"w": 12,"h": 5,"search": {"query": "tag:sample04061424_display | stats count() by apache.clientip,apache.resp_len","startTime": "now/d","endTime": "now"},"chart": {"chartType": "line","xAxis": {"field": "apache.clientip","labelRotate": "right","sortOrder": "asc"},"precision": "","showAllXAxisLabels": true,"labelInterval": "","customLabel": "","yAxis": {"field": "<field>","smooth": true,"unit": "个","connectNull": true,"range": { "min": "","max": ""}},"byFields": ["apache.resp_len"],"legend": {"placement": "bottom"}}}" to json editor
    And I wait for "500" millsecond
    And I click the "Check" button
    #    Then I will see the success message "校验通过"
    And I wait for "500" millsecond
    Then I click the "Ensure" button
    And I wait for loading invisible
    And I wait for "2000" millsecond
    Then take part of "SequenceChart" with name "actual/<image>"
#    And I compare source image "actual/<image>" with target image "expect/<image>"

    Examples:
      | name       |   field   |    image                 |
      | 仪表盘曲线图 |    cou    |  序列图_Yfield_error      |

  @dashboard @dashboardSmoke
  Scenario: smooth为false RZY-1300
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "仪表盘曲线图"
    Then I will see the "dashboard.DetailPage" page
    And I wait for "Progress" will be invisible
    When the chart title is "仪表盘曲线图" then I click the button which classname is "anticon css-ifnfqv ant-dropdown-trigger" in dashboard
    And I click the "Edit" button
    Then I set the parameter "{"title": "仪表盘曲线图","description": "","x": 0,"y": 0,"w": 12,"h": 5,"search": {"query": "tag:sample04061424_display | stats count() by apache.clientip,apache.resp_len","startTime": "now/d","endTime": "now"},"chart": {"chartType": "line","xAxis": {"field": "apache.clientip","labelRotate": "right","sortOrder": "asc"},"precision": "","showAllXAxisLabels": true,"labelInterval": "","customLabel": "","yAxis": {"field": "count()","smooth": false,"unit": "个","connectNull": true,"range": { "min": "","max": ""}},"byFields": ["apache.resp_len"],"legend": {"placement": "bottom"}}}" to json editor
    And I wait for "500" millsecond
    And I click the "Check" button
    Then I will see the success message "校验通过"
    And I wait for "500" millsecond
    Then I click the "Ensure" button
    And I wait for loading invisible
    And I wait for "2000" millsecond
    Then take part of "SequenceChart" with name "actual/多Y轴图_smooth_false"
#    And I compare source image "actual/多Y轴图_smooth_false" with target image "expect/多Y轴图_smooth_false"

  @dashboard @dashboardSmoke
  Scenario Outline: range-min/max RZY-1303,RZY-1305,RZY-1306,RZY-1307
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "仪表盘曲线图"
    Then I will see the "dashboard.DetailPage" page
    And I wait for "Progress" will be invisible
    When the chart title is "仪表盘曲线图" then I click the button which classname is "anticon css-ifnfqv ant-dropdown-trigger" in dashboard
    And I click the "Edit" button
    Then I set the parameter "{"title": "仪表盘曲线图","description": "","x": 0,"y": 0,"w": 12,"h": 5,"search": {"query": "tag:sample04061424_display | stats count() by apache.clientip,apache.resp_len","startTime": "now/d","endTime": "now"},"chart": {"chartType": "line","xAxis": {"field": "apache.clientip","labelRotate": "right","sortOrder": "asc"},"precision": "","showAllXAxisLabels": true,"labelInterval": "","customLabel": "","yAxis": {"field": "count()","smooth": false,"unit": "个","connectNull": true,"range": { "min": "<min>","max": "<max>"}},"byFields": ["apache.resp_len"],"legend": {"placement": "bottom"}}}" to json editor
    And I wait for "500" millsecond
    And I click the "Check" button
    And I wait for "500" millsecond
    Then I click the "Ensure" button
    And I wait for loading invisible
    And I wait for "2000" millsecond
    Then take part of "SequenceChartYaxis" with name "actual/<image>"
#    And I compare source image "actual/<image>" with target image "expect/<image>"

    Examples:
      |   min     |   max    |    image                |
      |           |          |  序列图_range_bothNull   |
      |           |   20     |  序列图_range_minNull    |
      |     1     |          |  序列图_range_maxNull    |
      |     1     |    8     |  序列图_range_manLTmax   |

  @dashboard @dashboardSmoke
  Scenario Outline: range-min大于max RZY-1308
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "仪表盘曲线图"
    Then I will see the "dashboard.DetailPage" page
    And I wait for "Progress" will be invisible
    When the chart title is "仪表盘曲线图" then I click the button which classname is "anticon css-ifnfqv ant-dropdown-trigger" in dashboard
    And I click the "Edit" button
    Then I set the parameter "{"title": "仪表盘曲线图","description": "","x": 0,"y": 0,"w": 12,"h": 5,"search": {"query": "tag:sample04061424_display | stats count() by apache.clientip,apache.resp_len","startTime": "now/d","endTime": "now"},"chart": {"chartType": "line","xAxis": {"field": "apache.clientip","labelRotate": "right","sortOrder": "asc"},"precision": "","showAllXAxisLabels": true,"labelInterval": "","customLabel": "","yAxis": {"field": "count()","smooth": false,"unit": "个","connectNull": true,"range": { "min": "<min>","max": "<max>"}},"byFields": ["apache.resp_len"],"legend": {"placement": "bottom"}}}" to json editor
    And I wait for "500" millsecond
    And I click the "Check" button
    Then I wait for element "ErrorMessage" change text to "<errorMessage>"

    Examples:
      |   min     |   max    |    errorMessage                                                     |
      |     20    |    5     |  chart -> yAxis -> range -> 显示范围上限值(max)需大于显示范围下限值(min)   |

  @dashboard @dashboardSmoke
  Scenario Outline: legend RZY-1312,RZY-1313
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "仪表盘曲线图"
    Then I will see the "dashboard.DetailPage" page
    And I wait for "Progress" will be invisible
    When the chart title is "仪表盘曲线图" then I click the button which classname is "anticon css-ifnfqv ant-dropdown-trigger" in dashboard
    And I click the "Edit" button
    Then I set the parameter "{"title": "仪表盘曲线图","description": "","x": 0,"y": 0,"w": 12,"h": 5,"search": {"query": "tag:sample04061424_display | stats count() by apache.clientip,apache.resp_len","startTime": "now/d","endTime": "now"},"chart": {"chartType": "line","xAxis": {"field": "apache.clientip","labelRotate": "right","sortOrder": "asc"},"precision": "","showAllXAxisLabels": true,"labelInterval": "","customLabel": "","yAxis": {"field": "count()","smooth": true,"unit": "个","connectNull": true,"range": { "min": "","max": ""}},"byFields": ["apache.resp_len"],"legend": {"placement": "<legend>"}}}" to json editor
    And I wait for "500" millsecond
    And I click the "Check" button
    Then I will see the success message "校验通过"
    And I wait for "500" millsecond
    Then I click the "Ensure" button
    And I wait for loading invisible
    And I wait for "2000" millsecond
    Then take part of "LineChartLegend" with name "actual/<image>"
#    And I compare source image "actual/<image>" with target image "expect/<image>"

    Examples:
      | legend     |     image                |
      |  bottom    |   序列图_legend_bottom   |
      |  right     |   序列图_legend_right    |

  @dashboard @dashboardSmoke
  Scenario Outline: legend为none RZY-1311
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "仪表盘曲线图"
    Then I will see the "dashboard.DetailPage" page
    And I wait for "Progress" will be invisible
    When the chart title is "仪表盘曲线图" then I click the button which classname is "anticon css-ifnfqv ant-dropdown-trigger" in dashboard
    And I click the "Edit" button
    Then I set the parameter "{"title": "仪表盘曲线图","description": "","x": 0,"y": 0,"w": 12,"h": 5,"search": {"query": "tag:sample04061424_display | stats count() by apache.clientip,apache.resp_len","startTime": "now/d","endTime": "now"},"chart": {"chartType": "line","xAxis": {"field": "apache.clientip","labelRotate": "right","sortOrder": "asc"},"precision": "","showAllXAxisLabels": true,"labelInterval": "","customLabel": "","yAxis": {"field": "count()","smooth": true,"unit": "个","connectNull": true,"range": { "min": "","max": ""}},"byFields": ["apache.resp_len"],"legend": {"placement": "<legend>"}}}" to json editor
    And I wait for "500" millsecond
    And I click the "Check" button
    Then I will see the success message "校验通过"
    And I wait for "500" millsecond
    Then I click the "Ensure" button
    And I wait for loading invisible
    And I wait for "2000" millsecond
    Then I wait for "LineChartLegend" will be invisible

    Examples:
      | legend   |
      |  none    |

  @dashboard
  Scenario: 修改legend字段值置为空 RZY-1314
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "仪表盘曲线图"
    Then I will see the "dashboard.DetailPage" page
    And I wait for "500" millsecond
    When the chart title is "仪表盘曲线图" then I click the button which classname is "anticon css-ifnfqv ant-dropdown-trigger" in dashboard
    And I click the "Edit" button
    And I set the parameter "{"title": "仪表盘曲线图","description": "","x": 0,"y": 0,"w": 12,"h": 5,"search": {"query": "tag:sample04061424_display | stats count() by apache.clientip,apache.resp_len","startTime": "now/d","endTime": "now"},"chart": {"chartType": "line","xAxis": {"field": "apache.clientip","labelRotate": "right","sortOrder": "asc"},"precision": "","showAllXAxisLabels": true,"labelInterval": "","customLabel": "","yAxis": {"field": "count()","smooth": true,"unit": "个","connectNull": true,"range": { "min": "","max": ""}},"byFields": ["apache.resp_len"],"legend": {"placement": ""}}}" to json editor
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
    And I set the parameter "{"title": "仪表盘曲线图","description": "","x": 0,"y": 0,"w": 12,"h": 5,"search": {"query": "tag:sample04061424_display | stats count() by apache.clientip,apache.resp_len","startTime": "now/d","endTime": "now"},"chart": {"chartType": "line","xAxis": {"field": "apache.clientip","labelRotate": "right","sortOrder": "asc"},"precision": "","showAllXAxisLabels": true,"labelInterval": "","customLabel": "","yAxis": {"field": "count()","smooth": true,"unit": "个","connectNull": true,"range": { "min": "","max": ""}},"byFields": ["apache.resp_len"],"legend": {"placement": "111"}}}" to json editor
    And I wait for "500" millsecond
    And I click the "Check" button
    Then I wait for element "ErrorMessage" change text to "chart -> placement 字段值不支持 111"


  @dashboard
  Scenario Outline: byfield-为空 RZY-1309,RZY-1310
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "<name>"
    Then I will see the "dashboard.DetailPage" page
    And I wait for "500" millsecond
    When the chart title is "<name>" then I click the button which classname is "anticon css-ifnfqv ant-dropdown-trigger" in dashboard
    And I click the "Edit" button
    And I set the parameter "{"title": "仪表盘曲线图","description": "","x": 0,"y": 0,"w": 12,"h": 5,"search": {"query": "tag:sample04061424_display | stats count() by apache.clientip,apache.resp_len","startTime": "now/d","endTime": "now"},"chart": {"chartType": "line","xAxis": {"field": "apache.clientip","labelRotate": "right","sortOrder": "asc"},"precision": "","showAllXAxisLabels": true,"labelInterval": "","customLabel": "","yAxis": {"field": "count()","smooth": true,"unit": "个","connectNull": true,"range": { "min": "","max": ""}},"byFields": ["<byFields>"],"legend": {"placement": "bottom"}}}" to json editor
    And I wait for "500" millsecond
    And I click the "Check" button
    #    Then I will see the success message "校验通过"
    And I wait for "500" millsecond
    Then I click the "Ensure" button
    And I wait for loading invisible
    And I wait for "2000" millsecond
    Then take part of "SequenceChart" with name "actual/<image>"
#    And I compare source image "actual/<image>" with target image "expect/<image>"

    Examples:
      | name       |   byFields   |    image                 |
      | 仪表盘曲线图 |              |  序列图_byFields_null      |
      | 仪表盘曲线图 | apache.resp_len |  序列图_byFields_rightValue |


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
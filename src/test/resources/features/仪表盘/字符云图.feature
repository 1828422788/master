Feature: 仪表盘字符云图

  @dashboard
  Scenario Outline: 新建仪表盘
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I click the "Create" button
    When I set the parameter "DashBoardName" with value "<name>"
    And I click the "Ensure" button
    Then I will see the success message "新建仪表盘成功"

    Examples:
      | name    |
      | 仪表盘字符云图 |

  @dashboard
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
      | spl                                                          | name    |
      | tag:*display \| stats count() by apache.clientip, apache.resp_len \| limit 10 | 仪表盘字符云图 |

  @dashboard
  Scenario Outline: 新建标签页
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "仪表盘<name>"
    Then I will see the "dashboard.DetailPage" page
    When I set the parameter "TagName" with value "<name>"
    And I wait for "500" millsecond
    And I click the "EnsureCreateTagButton" button
    And I wait for loading complete
    And I back to before

    Examples:
      | name |
      | 字符云图 |

  @dashboard
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
      | 仪表盘字符云图 |

  @dashboard
  Scenario Outline: 修改为字符云图
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "<name>"
    Then I will see the "dashboard.DetailPage" page
    And I wait for "Progress" will be invisible
    And I click the "ChartType" button
    Then I will see the "trend.CreatePage" page
    And I wait for "Other" will be visible
    And I click the "Other" button
    And I click the "<image>" button
    And I hide the element "Content"
    And I wait for "1000" millsecond
    And I click the "Setting" button under some element
    And I wait for "1000" millsecond
    And I choose the "count()" from the "DataValue"
    And I click the "Divide" button
    And I choose the "apache.clientip" from the "DataValue"
    And I click the "Exhibition" button
    And I click the "StartColour" button
    And I click the "Orange" button
    Then I click the "Generate" button
    And I wait for "1000" millsecond
    Then I hide the element "SettingContent"
    Then I will see the "dashboard.DetailPage" page
    And I click the "TrendTitle" button
    And take part of "FullScreen" with name "dashboard/<name>"
#    Then I compare source image "dashboard/<name>" with target image "dashboard/<image>"

    Examples:
      | name    | image     |
      | 仪表盘字符云图 | Wordcloud |

  @dashboard
  Scenario Outline: 验证配置是否在高级编辑中体现
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "<name>"
    Then I will see the "dashboard.DetailPage" page
    When the chart title is "<name>" then I click the button which classname is "anticon css-ifnfqv ant-dropdown-trigger" in dashboard
    And I click the "Edit" button
    Then I will see the "TextLayer" result will be "<json>"

    Examples:
      | name    | json                                                                                                                                                                                                                                                                                                                                                                           |
      | 仪表盘字符云图 | {\n  "title": "仪表盘字符云图",\n  "description": "",\n  "x": 0,\n  "y": 0,\n  "w": 12,\n  "h": 5,\n  "search": {\n    "query": "tag:*display \| stats count() by apache.clientip, apache.resp_len \| limit 10",\n    "startTime": "now/d",\n    "endTime": "now"\n  },\n  "chart": {\n    "chartType": "wordcloud",\n    "field": "count()",\n    "category": "apache.clientip"\n  }\n} |

  @dashboard
  Scenario: RZY-1362:修改field为空
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "仪表盘字符云图"
    Then I will see the "dashboard.DetailPage" page
    And I wait for "500" millsecond
    When the chart title is "仪表盘字符云图" then I click the button which classname is "anticon css-ifnfqv ant-dropdown-trigger" in dashboard
    And I click the "Edit" button
    And I set the parameter "{"title": "仪表盘字符云图","description": "","x": 0,"y": 0,"w": 12,"h": 5,"search": {"query": "tag:*display | stats count() by apache.clientip, apache.resp_len | limit 10","startTime": "now/d","endTime": "now"},"chart": {"chartType": "wordcloud","field": "","category": "apache.clientip"}}" to json editor
    And I wait for "500" millsecond
    And I click the "Check" button
    Then I wait for element "ErrorMessage" change text to "chart -> field 字段值不能为空"

  @dashboard
  Scenario: RZY-1362:修改field为不存在
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "仪表盘字符云图"
    Then I will see the "dashboard.DetailPage" page
    And I wait for "500" millsecond
    When the chart title is "仪表盘字符云图" then I click the button which classname is "anticon css-ifnfqv ant-dropdown-trigger" in dashboard
    And I click the "Edit" button
    And I set the parameter "{"title": "仪表盘字符云图","description": "","x": 0,"y": 0,"w": 12,"h": 5,"search": {"query": "tag:*display | stats count() by apache.clientip, apache.resp_len | limit 10","startTime": "now/d","endTime": "now"},"chart": {"chartType": "wordcloud","field": "qwertycount()","category": "apache.clientip"}}" to json editor
    And I wait for "500" millsecond
    And I click the "Check" button
    Then I will see the success message "校验通过"
    And I click the "Ensure" button
    And I wait for "2000" millsecond
    Then I wait for "NoData" will be visible

  @dashboard
  Scenario: RZY-1362:修改field为'apache.clientip'
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "仪表盘字符云图"
    Then I will see the "dashboard.DetailPage" page
    And I wait for "500" millsecond
    When the chart title is "仪表盘字符云图" then I click the button which classname is "anticon css-ifnfqv ant-dropdown-trigger" in dashboard
    And I click the "Edit" button
    Then I set the parameter "{"title": "仪表盘字符云图","description": "","x": 0,"y": 0,"w": 12,"h": 5,"search": {"query": "tag:*display | stats count() by apache.clientip, apache.resp_len | limit 10","startTime": "now/d","endTime": "now"},"chart": {"chartType": "wordcloud","field": "apache.clientip","category": ""}}" to json editor
    And I wait for "500" millsecond
    And I click the "Check" button
    Then I will see the success message "校验通过"
    Then I click the "Ensure" button
    And I wait for "2000" millsecond
    Then I wait for "NoData" will be visible

  @dashboard
  Scenario: RZY-1362:修改category为'apache.resp_len'
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "仪表盘字符云图"
    Then I will see the "dashboard.DetailPage" page
    And I wait for "500" millsecond
    Then I wait for "NoData" will be visible
    When the chart title is "仪表盘字符云图" then I click the button which classname is "anticon css-ifnfqv ant-dropdown-trigger" in dashboard
    And I click the "Edit" button
    Then I set the parameter "{"title": "仪表盘字符云图","description": "","x": 0,"y": 0,"w": 12,"h": 5,"search": {"query": "tag:*display | stats count() by apache.clientip, apache.resp_len | limit 10","startTime": "now/d","endTime": "now"},"chart": {"chartType": "wordcloud","field": "count()","category": "apache.resp_len"}}" to json editor
    And I wait for "500" millsecond
    And I click the "Check" button
    Then I will see the success message "校验通过"
    Then I click the "Ensure" button
    And I wait for "2000" millsecond
    Then I will see the "NoData" is not exist
#    Then I wait for "NoData" will be visible

  @dashboard
  Scenario: RZY-1362:修改category为'qwerty123'
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "仪表盘字符云图"
    Then I will see the "dashboard.DetailPage" page
    And I wait for "500" millsecond
    When the chart title is "仪表盘字符云图" then I click the button which classname is "anticon css-ifnfqv ant-dropdown-trigger" in dashboard
    And I click the "Edit" button
    Then I set the parameter "{"title": "仪表盘字符云图","description": "","x": 0,"y": 0,"w": 12,"h": 5,"search": {"query": "tag:*display | stats count() by apache.clientip, apache.resp_len | limit 10","startTime": "now/d","endTime": "now"},"chart": {"chartType": "wordcloud","field": "count()","category": "qwerty123"}}" to json editor
    And I wait for "500" millsecond
    And I click the "Check" button
    Then I will see the success message "校验通过"
    Then I click the "Ensure" button
    And I wait for "2000" millsecond
    Then I wait for "NoData" will be visible

  @cleanDashboard
  Scenario Outline: 删除仪表盘
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    When the data name is "<name>" then i click the "删除" button
    And I wait for "Ensure" will be visible
    And I click the "Ensure" button
    Then I will see the success message "删除仪表盘成功"

    Examples:
      | name    |
      | 仪表盘字符云图 |

  @cleanDashboard
  Scenario Outline: 删除仪表盘所建趋势图
    Given open the "trend.ListPage" page for uri "/trend/"
    When the data name is "<name>" then i click the "删除" button
    And I wait for "Ensure" will be visible
    And I click the "Ensure" button
    And I will see the success message "删除成功"

    Examples:
      | name    |
      | 仪表盘字符云图 |
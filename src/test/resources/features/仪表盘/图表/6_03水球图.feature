@dashboard22 @dashboardChart
Feature: 仪表盘_6_03_水球图

  @dashboard
  Scenario Outline: 新建仪表盘
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for "2000" millsecond
    And I click the "Create" button
    When I set the parameter "DashBoardName" with value "<name>"
    And I click the "Ensure" button
    And I wait for "SuccessMessage" will be visible
    Then I will see the success message "新建仪表盘成功"

    Examples:
      | name   |
      | 仪表盘水球图 |

  @dashboard
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
      | spl                                                          | name   |
      | tag:sample04061424_display \| stats count() by apache.clientip \| limit 10 | 仪表盘水球图 |

  @dashboard
  Scenario Outline: 新建标签页
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
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
      | 水球图  |

  @dashboard
  Scenario Outline: 添加图表
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "<name>"
    And switch to window "仪表盘"
    And I close all tabs except main tab
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
    And I wait for "SuccessMessage" will be visible
    Then I wait for element "SuccessMessage" change text to "添加成功"

    Examples:
      | name   |
      | 仪表盘水球图 |

  @dashboard
  Scenario Outline: 修改为水球图 RZY-311
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "<name>"
    And switch to window "仪表盘"
    And I close all tabs except main tab
    Then I will see the "dashboard.DetailPage" page
    And I wait for "Progress" will be invisible
    And I click the "ChartType" button
    And I wait for "1000" millsecond
    Then I will see the "trend.CreatePageDash" page
    And I wait for "Other" will be visible
    And I click the "Other" button
    And I click the "Liquidfill" button
#    And I hide the element "Content"
    And I wait for "1000" millsecond
    And I click the "SettingChart" button under some element
    And I wait for "1000" millsecond
    And I choose the "count()" from the "DataValue"
    And I click the "Exhibition" button
    And I click the "StartColour" button
    And I click the "Orange" button
    Then I click the "Generate" button
    And I wait for "1000" millsecond
    And I click the "SettingChart" button under some element
    Then I will see the "dashboard.DetailPage" page
    And I wait for "2000" millsecond
    And I click the "TrendTitle" button

    Examples:
      | name   |
      | 仪表盘水球图 |

  @dashboard
  Scenario Outline: 验证配置是否在高级编辑中体现 RZY-3753
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "<name>"
    And switch to window "仪表盘"
    And I close all tabs except main tab
    Then I will see the "dashboard.DetailPage" page
    When the chart title is "<name>" then I click the button which classname is "yotta-icon yotta-icon-DotEmblemOutlined" in dashboard
    And I click the "Edit" button
#    Then I will see the "TextLayer" result will be "<json>"
    Then I will see the dashboard highEditor text will contain "<json>"

    Examples:
      | name   | json                                                                                                                                                                                                                                                                                                                                               |
      | 仪表盘水球图 | \n  "chart": {\n    "chartType": "liquidfill",\n    "field": "count()",\n    "precision": ""\n  }\n} |

  @dashboard
  Scenario: 修改field为空 RZY-1362
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "仪表盘水球图"
    And switch to window "仪表盘"
    And I close all tabs except main tab
    Then I will see the "dashboard.DetailPage" page
    And I wait for "500" millsecond
    When the chart title is "仪表盘水球图" then I click the button which classname is "yotta-icon yotta-icon-DotEmblemOutlined" in dashboard
    And I click the "Edit" button
    And I set the parameter "{"title": "仪表盘水球图","description": "","x": 0,"y": 0,"w": 12,"h": 5,"search": {"query": "tag:sample04061424_display | stats count() by apache.clientip | limit 10","startTime": "now/d","endTime": "now"},"chart": {"chartType": "liquidfill","field": "","precision": ""}}" to json editor
    And I wait for "500" millsecond
    And I click the "Check" button
    And I wait for "ErrorMessage" will be visible
    And I will see the element "ErrorMessage" contains "chart -> field 字段值不能为空"
#    Then I wait for element "ErrorMessage" change text to "chart -> field 字段值不能为空"

  @dashboard
  Scenario: 修改field为不存在 RZY-1362
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "仪表盘水球图"
    And switch to window "仪表盘"
    And I close all tabs except main tab
    Then I will see the "dashboard.DetailPage" page
    And I wait for "500" millsecond
    When the chart title is "仪表盘水球图" then I click the button which classname is "yotta-icon yotta-icon-DotEmblemOutlined" in dashboard
    And I click the "Edit" button
    And I set the parameter "{"title": "仪表盘水球图","description": "","x": 0,"y": 0,"w": 12,"h": 5,"search": {"query": "tag:sample04061424_display | stats count() by apache.clientip | limit 10","startTime": "now/d","endTime": "now"},"chart": {"chartType": "liquidfill","field": "qwertycount()","precision": ""}}" to json editor
    And I wait for "500" millsecond
    And I click the "Check" button
    And I wait for "SuccessMessage" will be visible
    Then I will see the success message "校验通过"
    And I wait for "SuccessMessage" will be invisible
    And I click the "Ensure" button
    And I wait for "SuccessMessage" will be visible
    Then I will see the success message "配置成功"
    And I wait for "2000" millsecond
    Then I wait for "NoData" will be visible

  @dashboard
  Scenario: 修改field为'apache.clientip' RZY-1362
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "仪表盘水球图"
    And switch to window "仪表盘"
    And I close all tabs except main tab
    Then I will see the "dashboard.DetailPage" page
    And I wait for "500" millsecond
    When the chart title is "仪表盘水球图" then I click the button which classname is "yotta-icon yotta-icon-DotEmblemOutlined" in dashboard
    And I click the "Edit" button
    Then I set the parameter "{"title": "仪表盘水球图","description": "","x": 0,"y": 0,"w": 12,"h": 5,"search": {"query": "tag:sample04061424_display | stats count() by apache.clientip | limit 10","startTime": "now/d","endTime": "now"},"chart": {"chartType": "liquidfill","field": "apache.clientip","precision": ""}}" to json editor
    And I wait for "500" millsecond
    And I click the "Check" button
    And I wait for "SuccessMessage" will be visible
    Then I will see the success message "校验通过"
    And I wait for "SuccessMessage" will be invisible
    And I click the "Ensure" button
    And I wait for "SuccessMessage" will be visible
    Then I will see the success message "配置成功"
    And I wait for "2000" millsecond
    Then I wait for "NoData" will be visible
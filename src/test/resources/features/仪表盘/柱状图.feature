Feature: 仪表盘柱状图

  @dashboard @dashboardSmoke
  Scenario Outline: 新建仪表盘
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I click the "Create" button
    When I set the parameter "DashBoardName" with value "<name>"
    And I click the "Ensure" button
    And I wait for "500" millsecond
    Then I will see the success message "新建仪表盘成功"

    Examples:
      | name   |
      | 仪表盘柱状图 |

  @dashboard @dashboardSmoke
  Scenario Outline: 创建仪表盘所用趋势图
    And open the "trend.ListPage" page for uri "/trend/"
    And I click the "NewTrendButton" button
#    And I click the "Create" button
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
      | spl                                                              | name   |
      | tag:sample04061424_display \| stats count() by apache.clientip,apache.resp_len | 仪表盘柱状图 |

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
      | 柱状图  |

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
      | 仪表盘柱状图 |

  @dashboard @dashboardSmoke
  Scenario Outline: 修改为柱状图 RZY-303
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "<name>"
    Then I will see the "dashboard.DetailPage" page
    And I wait for "Progress" will be invisible
    And I wait for "500" millsecond
    And I click the "ChartType" button
    And I wait for "1000" millsecond
    Then I will see the "trend.CreatePageDash" page
    And I wait for "Order" will be visible
    And I click the "Order" button under some element
    And I wait for "<targetName>" will be visible
    And I click the "<targetName>" button
#    And I hide the element "Content"
    And I wait for "1000" millsecond
    And I click the "SettingChart" button under some element
    And I choose the "apache.clientip" from the "DataValue"
    And I wait for "Right" will be visible
    And I click the "Right" button
    And I click the "Ascending" button
    And I click the "Yaxis" button
    And I choose the "count()" from the "DataValue"
    And I wait for "1000" millsecond
    And I set the parameter "Unit" with value "个"
    And I wait for "1000" millsecond
#    And I click the "Group" button
#    And I click the "AddField" button
#    And I choose the "apache.resp_len" from the "DataValue"
    And I click the "Pile" button
    And I wait for "1000" millsecond
    And I click the "Exhibition" button
    And I wait for "1000" millsecond
    And I click the "StartColour" button
    And I wait for "500" millsecond
    And I click the "Orange" button
    Then I click the "Generate" button
    And I wait for "1000" millsecond
    And I click the "SettingChart" button under some element
    Then I will see the "dashboard.DetailPage" page
    And I wait for "2000" millsecond
    And I click the "TrendTitle" button under some element
    And I wait for "3000" millsecond

    Examples:
      | name   | targetName  |
      | 仪表盘柱状图 | ColumnChart |

  @dashboard
  Scenario: 序列图支持的钻取变量预置
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "仪表盘柱状图"
    Then I will see the "dashboard.DetailPage" page
    When the chart title is "仪表盘柱状图" then I click the button which classname is "yotta-icon yotta-icon-DotEmblemOutlined" in dashboard
    And I click the "Configs" button
    And I wait for loading invisible
    And I set the parameter "Spl" with value "tag:sample04061424_display | stats count() by apache.clientip,apache.resp_len | limit 10"
    And I click the "Ensure" button
    And I wait for "500" millsecond
    Then I will see the success message "配置成功"
    And I wait for "1500" millsecond
    And I click the "SettingIcon" button
    And I switch the dashboard "OpenDrilldown" button to "enable"
    And I wait for "500" millsecond

  @dashboard
  Scenario: 序列图支持的钻取变量click.name RZY-3255
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "仪表盘柱状图"
    Then I will see the "dashboard.DetailPage" page
    And I wait for "Progress" will be invisible
    When the chart title is "仪表盘柱状图" then I click the button which classname is "yotta-icon yotta-icon-DotEmblemOutlined" in dashboard
    And I click the "DrillSetting" button
    And I wait for "500" millsecond
    And I choose the "跳转到搜索页" from the "DrillAction"
    And I click the "Custom" button
    And I set the parameter "Spl" with value "tag:sample04061424_display | stats count() by ${click.name}"
    And I click the "DateEditor" button
#    And I click the "Shortcut" button
    And I click the "Today" button
    And I "unchecked" the checkbox which name is "在浏览器新标签页中打开"
    And I click the "Ensure" button
    And I wait for "3000" millsecond
    And I click the Circle "Zhutiao" button
#    And I click the "Zhutiao" button
    Then I wait for title change text to "搜索"
    And I will see the "splSearch.SearchPage" page
    Then I will see the "SearchInput" result will be "tag:sample04061424_display | stats count() by apache.clientip"
    And I wait for "2000" millsecond
    Then I will see the "TimeRange" result will be "今天"
#    Then I will see the input element "TimeRange" value will contains "今天"

  @dashboard
  Scenario: 序列图支持的钻取变量click.value RZY-3257
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "仪表盘柱状图"
    Then I will see the "dashboard.DetailPage" page
    And I wait for "Progress" will be invisible
    When the chart title is "仪表盘柱状图" then I click the button which classname is "yotta-icon yotta-icon-DotEmblemOutlined" in dashboard
    And I click the "DrillSetting" button
    And I wait for "500" millsecond
    And I choose the "跳转到搜索页" from the "DrillAction"
    And I click the "Custom" button
    And I set the parameter "Spl" with value "apache.clientip:${click.value}"
    And I click the "DateEditor" button
    And I click the "Shortcut" button
    And I click the "Today" button
    And I "checked" the checkbox which name is "在浏览器新标签页中打开"
    And I click the "Ensure" button
    And I wait for "3000" millsecond
    And I click the "Zhutiao" button
    And switch to another window
#    And I close all tabs except main tab
    And I will see the "splSearch.SearchPage" page
    Then I will see the "SearchInput" result will be "apache.clientip:36.46.208.22"
    And I wait for "2000" millsecond
    Then I will see the input element "TimeRange" value will contains "今天"

  @dashboard
  Scenario: 序列图支持的钻取变量click.name2 RZY-3258
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "仪表盘柱状图"
    Then I will see the "dashboard.DetailPage" page
    And I wait for "Progress" will be invisible
    When the chart title is "仪表盘柱状图" then I click the button which classname is "yotta-icon yotta-icon-DotEmblemOutlined" in dashboard
    And I click the "DrillSetting" button
    And I wait for "500" millsecond
    And I choose the "跳转到搜索页" from the "DrillAction"
    And I click the "Custom" button
    And I set the parameter "Spl" with value "tag:sample04061424_display | stats ${click.name2} by appname"
    And I click the "DateEditor" button
    And I click the "Shortcut" button
    And I click the "Today" button
    And I "checked" the checkbox which name is "在浏览器新标签页中打开"
    And I click the "Ensure" button
    And I wait for "3000" millsecond
    And I click the "Zhutiao" button
    And switch to another window
#    And I close all tabs except main tab
    And I will see the "splSearch.SearchPage" page
    Then I will see the "SearchInput" result will be "tag:sample04061424_display | stats count() by appname"
    And I wait for "2000" millsecond
    Then I will see the input element "TimeRange" value will contains "今天"

  @dashboard
  Scenario: 序列图支持的钻取变量click.value2 RZY-3259
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "仪表盘柱状图"
    Then I will see the "dashboard.DetailPage" page
    And I wait for "Progress" will be invisible
    When the chart title is "仪表盘柱状图" then I click the button which classname is "yotta-icon yotta-icon-DotEmblemOutlined" in dashboard
    And I click the "DrillSetting" button
    And I wait for "500" millsecond
    And I choose the "跳转到搜索页" from the "DrillAction"
    And I click the "Custom" button
    And I set the parameter "Spl" with value "tag:sample04061424_display | stats count() as cn by apache.resp_len,apache.clientip | where cn==${click.value2}"
    And I click the "DateEditor" button
    And I click the "Shortcut" button
    And I click the "Today" button
    And I "checked" the checkbox which name is "在浏览器新标签页中打开"
    And I click the "Ensure" button
    And I wait for "3000" millsecond
    And I click the "Zhutiao" button
    And switch to another window
    And I close all tabs except main tab
    And I will see the "splSearch.SearchPage" page
    Then I will see the "SearchInput" result will contain "tag:sample04061424_display | stats count() as cn by apache.resp_len,apache.clientip | where cn=="
#    Then I will see the "SearchInput" result will be "* | stats count() as cn by apache.resp_len,apache.clientip | where cn==6"

  @dashboard
  Scenario Outline: 序列图支持的钻取变量start end RZY-3262,RZY-3263
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "<name>"
    Then I will see the "dashboard.DetailPage" page
    And I wait for "Progress" will be invisible
    When the chart title is "<name>" then I click the button which classname is "yotta-icon yotta-icon-DotEmblemOutlined" in dashboard
    And I click the "DrillSetting" button
    And I wait for "500" millsecond
    And I choose the "跳转到搜索页" from the "DrillAction"
    And I click the "Custom" button
    And I set the parameter "Spl" with value "<spl>"
    And I click the "DateEditor" button
    And I click the "Shortcut" button
    And I click the "WholeTime" button
    And I "checked" the checkbox which name is "在浏览器新标签页中打开"
    And I click the "Ensure" button
    And I wait for "3000" millsecond
    And I click the "Zhutiao" button
    And switch to another window
    And I close all tabs except main tab
    And I will see the "splSearch.SearchPage" page
    Then I will see the "SearchInput" result will contain "<SearchInput1>"
    Then I will see the "SearchInput" result will contain "<SearchInput2>"
    Then I will see the input element "TimeRange" value will contains "所有时间"

    Examples:
      | name       |   spl                                       |   SearchInput1   |  SearchInput2 |
      | 仪表盘柱状图 |   starttime=${start} endtime=${end} *       |  starttime=      |  endtime=      |
      | 仪表盘柱状图 |   timestamp:[${start} TO ${end}] AND tag:*  |  timestamp:      |  AND tag:*      |

  @dashboard
  Scenario Outline: 序列图支持的钻取变量start,end钻取到标签页 RZY-3264
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "<name>"
    Then I will see the "dashboard.DetailPage" page
    And I wait for "Progress" will be invisible
    When the chart title is "<name>" then I click the button which classname is "yotta-icon yotta-icon-DotEmblemOutlined" in dashboard
    And I click the "DrillSetting" button
    And I wait for "500" millsecond
    And I choose the "跳转到标签页" from the "DrillAction"
    And I click the "TargetTag" button
    And I choose the "FirstAutoTest" from the "DashboardMenu"
    And I choose the "testSearch" from the "DashboardMenu"
    And I click the "TargetParam" button
    And I choose the "globalTimeRange" from the "InputGroup"
    And I hide the element "ParamDropdown"
    And I click the "ParamValue" button
    And I click the "StartEnd" button
    And I click the "Ensure" button
    And I wait for "3000" millsecond
    And I click the "Zhutiao" button
    And switch to another window
    And I close all tabs except main tab
    And I will see the "splSearch.SearchPage" page
    Then I will see the url contains "<url>"
    Then I will see the element "CurrentDashboard" value is "<CurrentDashboard> "

    Examples:
      | name       |   url             |  CurrentDashboard |
      | 仪表盘柱状图 |  globalTimeRange= |  FirstAutoTest    |

  @dashboard
  Scenario: 序列图支持的钻取变量row.fieldname RZY-3260
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "仪表盘柱状图"
    Then I will see the "dashboard.DetailPage" page
    And I wait for "Progress" will be invisible
    When the chart title is "仪表盘柱状图" then I click the button which classname is "yotta-icon yotta-icon-DotEmblemOutlined" in dashboard
    And I click the "DrillSetting" button
    And I wait for "500" millsecond
    And I choose the "跳转到搜索页" from the "DrillAction"
    And I click the "Custom" button
    And I set the parameter "Spl" with value "apache.clientip:${row.apache.clientip}"
    And I click the "DateEditor" button
    And I click the "Shortcut" button
    And I click the "Today" button
    And I "checked" the checkbox which name is "在浏览器新标签页中打开"
    And I click the "Ensure" button
#    And I wait for "100" millsecond
    And I move the mouse pointer to the "Zhutiao"
    And I wait for "SwitchToTable" will be visible
    And I click the "SwitchToTable" button
    And I click the "Ip254" button
    And switch to another window
    And I close all tabs except main tab
    And I will see the "splSearch.SearchPage" page
    Then I will see the "SearchInput" result will contain "apache.clientip:64.20.177.254"

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
      | 仪表盘柱状图 |

  @cleanDashboard
  Scenario Outline: 删除仪表盘所建趋势图
    Given open the "trend.ListPage" page for uri "/trend/"
    When the data name is "<name>" then i click the "删除" button
    And I wait for "Ensure" will be visible
    And I click the "Ensure" button
    And I wait for "500" millsecond
    And I will see the success message "删除成功"

    Examples:
      | name   |
      | 仪表盘柱状图 |
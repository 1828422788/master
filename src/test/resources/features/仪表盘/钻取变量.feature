Feature: 仪表盘钻取配置-钻取变量

  @dashboard @dashboardSmoke
  Scenario Outline: 新建仪表盘
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I click the "Create" button
    When I set the parameter "DashBoardName" with value "<name>"
    And I click the "Ensure" button
    Then I will see the success message "新建仪表盘成功"

    Examples:
      | name   |
      | 测试钻取变量 |

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
    And I click the "NextButton" button under some element
    And I wait for "Header" will be visible
    And I click the "NextButton" button under some element
    When I set the parameter "NameInput" with value "<name>"
    And I click the "NextButton" button under some element
    And I wait for "SuccessCreate" will be visible

    Examples:
      | name            | spl                                                       |
      | 钻取变量字符云图   | tag:sample04061424_display OR tag:sample04061424_chart OR tag:sample04061424 \| stats count() by apache.clientip \| limit 10     |
      | 钻取变量区划地图   | tag:sample04061424 \| stats count() by apache.geo.country,apache.geo.province,apache.geo.city |
      | 钻取变量饼图      | tag:sample04061424_display OR tag:sample04061424_chart OR tag:sample04061424 \| stats count() by apache.clientip \| limit 10     |
      | 钻取变量表格      | tag:sample04061424_display \| stats count() by apache.clientip,apache.resp_len \| limit 10     |
      | 钻取变量单值      | tag:sample04061424_display \| stats avg(apache.status) \|eval icon=if('avg(apache.status)'>300,'thumbs-down','thumbs-up')    |
      | 钻取变量单值value | tag:sample04061424_display \| stats count() by apache.clientip,apache.resp_len \| limit 10     |

  @dashboard @dashboardSmoke
  Scenario Outline: 新建标签页
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "<name>"
    Then I will see the "dashboard.DetailPage" page
    When I set the parameter "TagName" with value "chart"
    And I click the "Ensure" button
    And I wait for loading complete
    And I back to before

    Examples:
      | name   |
      | 测试钻取变量 |

  @dashboard @dashboardSmoke
  Scenario: 添加图表
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "测试钻取变量"
    Then I will see the "dashboard.DetailPage" page
    And I wait for "AddEventButton" will be visible
    When I click the "AddEventButton" button
    And I wait for "500" millsecond
    And I click the "AddChart" button
    And I wait for "SpinDot" will be invisible
    And I set the parameter "SearchChartInput" with value "钻取变量字符云图"
    And I wait for loading invisible
    And I "checked" the checkbox which name is "钻取变量字符云图"
    And I click the "Ensure" button
    Then I wait for element "SuccessMessage" change text to "添加成功"

  @dashboard @dashboardSmoke
  Scenario: 开启钻取配置
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "测试钻取变量"
    Then I will see the "dashboard.DetailPage" page
    And I click the "SettingIcon" button
    And I switch the dashboard "OpenDrilldown" button to "enable"
#    And I click the "OpenDrilldown" button
    And I wait for "500" millsecond

  @dashboard
  Scenario Outline: 修改为字符云图
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "<name>"
    Then I will see the "dashboard.DetailPage" page
    And I wait for "Progress" will be invisible
    And I click the "ChartType" button
    And I wait for "1000" millsecond
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
    And I click the "Setting" button under some element
#    Then I hide the element "SettingContent"
    Then I will see the "dashboard.DetailPage" page
    And I wait for "2000" millsecond
    And I click the "TrendTitle" button under some element
    And I wait for "3000" millsecond
#
#    And I wait for "1000" millsecond
#    Then I hide the element "SettingContent"
#    Then I will see the "dashboard.DetailPage" page
#    And I click the "TrendTitle" button
#    And take part of "FullScreen" with name "dashboard/<name>"

    Examples:
      | name    | image     |
      | 测试钻取变量 | Wordcloud |

  @dashboard @dashboardSmoke
  Scenario: 钻取变量字符云图click.name RZY-3265
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "测试钻取变量"
    Then I will see the "dashboard.DetailPage" page
    And I wait for "Progress" will be invisible
    When the chart title is "钻取变量字符云图" then I click the button which classname is "anticon css-ifnfqv ant-dropdown-trigger" in dashboard
    And I click the "DrillSetting" button
    And I wait for "500" millsecond
    And I choose the "跳转到搜索页" from the "DrillAction"
    And I click the "Custom" button
    And I set the parameter "Spl" with value "* | stats count() by ${click.name}"
    And I click the "DateEditor" button
    And I click the "Shortcut" button
    And I click the "Today" button
    And I "unchecked" the checkbox which name is "在浏览器新标签页中打开"
    And I click the "Ensure" button
    And I wait for "3000" millsecond
    And I click the "IpZifu" button
    Then I wait for title change text to "搜索"
    And I will see the "splSearch.SearchPage" page
    Then I will see the "SearchInput" result will be "* | stats count() by apache.clientip"
    Then I will see the input element "TimeRange" value will contains "今天"

  @dashboard @dashboardSmoke
  Scenario: 钻取变量字符云图click.value RZY-3266
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "测试钻取变量"
    Then I will see the "dashboard.DetailPage" page
    And I wait for "Progress" will be invisible
    When the chart title is "钻取变量字符云图" then I click the button which classname is "anticon css-ifnfqv ant-dropdown-trigger" in dashboard
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
    And I click the "IpZifu" button
    And switch to another window
#    And I close all tabs except main tab
    And I will see the "splSearch.SearchPage" page
    Then I will see the "SearchInput" result will be "apache.clientip:64.20.177.254"
    Then I will see the input element "TimeRange" value will contains "今天"

  @dashboard @dashboardSmoke
  Scenario: 钻取变量字符云图click.name2 RZY-3267
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "测试钻取变量"
    Then I will see the "dashboard.DetailPage" page
    And I wait for "Progress" will be invisible
    When the chart title is "钻取变量字符云图" then I click the button which classname is "anticon css-ifnfqv ant-dropdown-trigger" in dashboard
    And I click the "DrillSetting" button
    And I wait for "500" millsecond
    And I choose the "跳转到搜索页" from the "DrillAction"
    And I click the "Custom" button
    And I set the parameter "Spl" with value "* | stats ${click.name2} by appname"
    And I click the "DateEditor" button
    And I click the "Shortcut" button
    And I click the "Today" button
    And I "checked" the checkbox which name is "在浏览器新标签页中打开"
    And I click the "Ensure" button
    And I wait for "3000" millsecond
    And I click the "IpZifu" button
    And switch to another window
    And I will see the "splSearch.SearchPage" page
    Then I will see the "SearchInput" result will be "* | stats count() by appname"
    Then I will see the input element "TimeRange" value will contains "今天"

  @dashboard
  Scenario: 钻取变量字符云图click.value2 RZY-3268
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "测试钻取变量"
    Then I will see the "dashboard.DetailPage" page
    And I wait for "Progress" will be invisible
    When the chart title is "钻取变量字符云图" then I click the button which classname is "anticon css-ifnfqv ant-dropdown-trigger" in dashboard
    And I click the "DrillSetting" button
    And I wait for "500" millsecond
    And I choose the "跳转到搜索页" from the "DrillAction"
    And I click the "Custom" button
    And I set the parameter "Spl" with value "* | stats count() as cn by apache.resp_len,apache.clientip | where cn==${click.value2}"
    And I click the "DateEditor" button
    And I click the "Shortcut" button
    And I click the "Today" button
    And I "checked" the checkbox which name is "在浏览器新标签页中打开"
    And I click the "Ensure" button
    And I wait for "3000" millsecond
    And I click the "IpZifu" button
    And switch to another window
    And I close all tabs except main tab
    And I will see the "splSearch.SearchPage" page
    Then I will see the "SearchInput" result will be "* | stats count() as cn by apache.resp_len,apache.clientip | where cn==24"
    Then I will see the input element "TimeRange" value will contains "今天"

  @dashboard
  Scenario: 钻取变量字符云图row.fieldname RZY-3675
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "测试钻取变量"
    Then I will see the "dashboard.DetailPage" page
    And I wait for "Progress" will be invisible
    When the chart title is "钻取变量字符云图" then I click the button which classname is "anticon css-ifnfqv ant-dropdown-trigger" in dashboard
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
#    And I wait for "3000" millsecond
    And I wait for "IpZifu" will be visible
    And I click the "IpZifu" button
    And switch to another window
    And I close all tabs except main tab
    And I will see the "splSearch.SearchPage" page
    Then I will see the "SearchInput" result will be "apache.clientip:64.20.177.254"
    Then I will see the input element "TimeRange" value will contains "今天"

  @dashboard
  Scenario: 钻取变量字符云图start end RZY-3676
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "测试钻取变量"
    Then I will see the "dashboard.DetailPage" page
    And I wait for "Progress" will be invisible
    When the chart title is "钻取变量字符云图" then I click the button which classname is "anticon css-ifnfqv ant-dropdown-trigger" in dashboard
    And I click the "DrillSetting" button
    And I wait for "500" millsecond
    And I choose the "跳转到搜索页" from the "DrillAction"
    And I click the "Custom" button
    And I set the parameter "Spl" with value "starttime=${start} endtime=${end} *"
    And I click the "DateEditor" button
    And I click the "Shortcut" button
    And I click the "ThisMonth" button
    And I "checked" the checkbox which name is "在浏览器新标签页中打开"
    And I click the "Ensure" button
    And I wait for "3000" millsecond
    And I click the "IpZifu" button
    And switch to another window
    And I close all tabs except main tab
    And I will see the "splSearch.SearchPage" page
    Then I will see the "SearchInput" result will contain "starttime="
    Then I will see the "SearchInput" result will contain "endtime="
    Then I will see the input element "TimeRange" value will contains "本月"

  @dashboard
  Scenario Outline: 添加区划地图图表 RZY-331
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "测试钻取变量"
    Then I will see the "dashboard.DetailPage" page
    And I wait for "Progress" will be invisible
    And I click the "Delete" button
    And I wait for "500" millsecond
    And I click the "Ensure" button
    And I wait for "AddEventButton" will be visible
    When I click the "AddEventButton" button
    And I wait for "500" millsecond
    And I click the "AddChart" button
    And I wait for "SpinDot" will be invisible
    And I set the parameter "SearchChartInput" with value "<name>"
    And I wait for loading invisible
    And I click the "{'Checkbox':'<name>'}" button
    And I wait for "500" millsecond
    And I click the "Ensure" button
    Then I wait for element "SuccessMessage" change text to "添加成功"

    Examples:
      | name    |
      | 钻取变量区划地图 |

  @dashboard @dashboardSmoke
  Scenario Outline: 修改为区划地图
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "<name>"
    Then I will see the "dashboard.DetailPage" page
    And I wait for "Progress" will be invisible
    And I click the "ChartType" button
    And I wait for "1000" millsecond
    Then I will see the "trend.CreatePage" page
    And I wait for "Map" will be visible
    And I click the "Map" button
    And I click the "Regionmap" button
    And I wait for "Progress" will be invisible
    And I hide the element "Content"
    And I wait for "1000" millsecond
    And I click the "Setting" button under some element
    And I wait for "1000" millsecond
    And I choose the "count()" from the "DataValue"
    And I click the "Divide" button
    And I choose the "apache.geo.province" from the "DataValue"
    And I click the "Region" button
    And I wait for "500" millsecond
    And I click the "SelectChina" button
    And I wait for "1000" millsecond
    Then I click the "Generate" button
    And I wait for "1500" millsecond
    And I click the "Setting" button under some element
#    Then I hide the element "SettingContent"
    Then I will see the "dashboard.DetailPage" page
    And I wait for "2000" millsecond
    And I click the "TrendTitle" button under some element
    And I wait for "3000" millsecond

    Examples:
      | name    |
      | 测试钻取变量 |

  @dashboard @dashboardSmoke
  Scenario: 钻取变量区划地图click.name RZY-3269
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "测试钻取变量"
    Then I will see the "dashboard.DetailPage" page
    And I wait for "Progress" will be invisible
    When the chart title is "钻取变量区划地图" then I click the button which classname is "anticon css-ifnfqv ant-dropdown-trigger" in dashboard
    And I click the "DrillSetting" button
    And I wait for "500" millsecond
    And I choose the "跳转到搜索页" from the "DrillAction"
    And I click the "Custom" button
    And I set the parameter "Spl" with value "* | stats count() by ${click.name}"
    And I click the "DateEditor" button
    And I click the "Shortcut" button
    And I click the "Today" button
    And I "unchecked" the checkbox which name is "在浏览器新标签页中打开"
    And I click the "Ensure" button
    And I wait for "3000" millsecond
    And I click the "Taiwan" button
    Then I wait for title change text to "搜索"
    And I will see the "splSearch.SearchPage" page
    Then I will see the "SearchInput" result will be "* | stats count() by apache.geo.province"
    Then I will see the input element "TimeRange" value will contains "今天"

  @dashboard @dashboardSmoke
  Scenario: 钻取变量区划地图click.value RZY-3270
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "测试钻取变量"
    Then I will see the "dashboard.DetailPage" page
    And I wait for "Progress" will be invisible
    When the chart title is "钻取变量区划地图" then I click the button which classname is "anticon css-ifnfqv ant-dropdown-trigger" in dashboard
    And I click the "DrillSetting" button
    And I wait for "500" millsecond
    And I choose the "跳转到搜索页" from the "DrillAction"
    And I click the "Custom" button
    And I set the parameter "Spl" with value "apache.geo.province:${click.value}"
    And I click the "DateEditor" button
    And I click the "Shortcut" button
    And I click the "Today" button
    And I "checked" the checkbox which name is "在浏览器新标签页中打开"
    And I click the "Ensure" button
    And I wait for "3000" millsecond
    And I click the "Taiwan" button
    And switch to another window
#    And I close all tabs except main tab
    And I will see the "splSearch.SearchPage" page
    Then I will see the "SearchInput" result will be "apache.geo.province:台湾"
    Then I will see the input element "TimeRange" value will contains "今天"

  @dashboard @dashboardSmoke
  Scenario: 钻取变量区划地图click.name2 RZY-3269
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "测试钻取变量"
    Then I will see the "dashboard.DetailPage" page
    And I wait for "Progress" will be invisible
    When the chart title is "钻取变量区划地图" then I click the button which classname is "anticon css-ifnfqv ant-dropdown-trigger" in dashboard
    And I click the "DrillSetting" button
    And I wait for "500" millsecond
    And I choose the "跳转到搜索页" from the "DrillAction"
    And I click the "Custom" button
    And I set the parameter "Spl" with value "* | stats ${click.name2} by apache.geo.province"
    And I click the "DateEditor" button
    And I click the "Shortcut" button
    And I click the "Today" button
    And I "checked" the checkbox which name is "在浏览器新标签页中打开"
    And I click the "Ensure" button
    And I wait for "3000" millsecond
    And I click the "Taiwan" button
    And switch to another window
    And I will see the "splSearch.SearchPage" page
    Then I will see the "SearchInput" result will be "* | stats count() by apache.geo.province"
    And I wait for "3000" millsecond
    Then I will see the input element "TimeRange" value will contains "今天"

  @dashboard
  Scenario: 钻取变量区划地图click.value2 RZY-3272
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "测试钻取变量"
    Then I will see the "dashboard.DetailPage" page
    And I wait for "Progress" will be invisible
    When the chart title is "钻取变量区划地图" then I click the button which classname is "anticon css-ifnfqv ant-dropdown-trigger" in dashboard
    And I click the "DrillSetting" button
    And I wait for "500" millsecond
    And I choose the "跳转到搜索页" from the "DrillAction"
    And I click the "Custom" button
    And I set the parameter "Spl" with value "tag:sample04061424 | stats count() as cn by apache.geo.country,apache.geo.province,apache.geo.city | where cn ==${click.value2}"
    And I click the "DateEditor" button
    And I click the "Shortcut" button
    And I click the "Today" button
    And I "checked" the checkbox which name is "在浏览器新标签页中打开"
    And I click the "Ensure" button
    And I wait for "3000" millsecond
    And I click the "Taiwan" button
    And switch to another window
    And I close all tabs except main tab
    And I will see the "splSearch.SearchPage" page
    Then I will see the "SearchInput" result will be "tag:sample04061424 | stats count() as cn by apache.geo.country,apache.geo.province,apache.geo.city | where cn =="

  @dashboard
  Scenario: 钻取变量区划地图row.fieldname RZY-3673
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "测试钻取变量"
    Then I will see the "dashboard.DetailPage" page
    And I wait for "Progress" will be invisible
    When the chart title is "钻取变量区划地图" then I click the button which classname is "anticon css-ifnfqv ant-dropdown-trigger" in dashboard
    And I click the "DrillSetting" button
    And I wait for "500" millsecond
    And I choose the "跳转到搜索页" from the "DrillAction"
    And I click the "Custom" button
    And I set the parameter "Spl" with value "tag:sample04061424 | stats count() by '${row.apache.geo.province}'"
    And I click the "DateEditor" button
    And I click the "Shortcut" button
    And I click the "Today" button
    And I "checked" the checkbox which name is "在浏览器新标签页中打开"
    And I click the "Ensure" button
    And I wait for "3000" millsecond
    And I click the "Neimenggu" button
    And switch to another window
    And I close all tabs except main tab
    And I will see the "splSearch.SearchPage" page
    Then I will see the "SearchInput" result will be "tag:sample04061424 | stats count() by '内蒙古'"
    Then I will see the input element "TimeRange" value will contains "今天"

  @dashboard
  Scenario: 钻取变量区划地图start end RZY-3674
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "测试钻取变量"
    Then I will see the "dashboard.DetailPage" page
    And I wait for "Progress" will be invisible
    When the chart title is "钻取变量区划地图" then I click the button which classname is "anticon css-ifnfqv ant-dropdown-trigger" in dashboard
    And I click the "DrillSetting" button
    And I wait for "500" millsecond
    And I choose the "跳转到搜索页" from the "DrillAction"
    And I click the "Custom" button
    And I set the parameter "Spl" with value "starttime=${start} endtime=${end} *"
    And I click the "DateEditor" button
    And I click the "Shortcut" button
    And I click the "ThisMonth" button
    And I "checked" the checkbox which name is "在浏览器新标签页中打开"
    And I click the "Ensure" button
    And I wait for "3000" millsecond
    And I click the "Taiwan" button
    And switch to another window
    And I close all tabs except main tab
    And I will see the "splSearch.SearchPage" page
    Then I will see the "SearchInput" result will contain "starttime="
    Then I will see the "SearchInput" result will contain "endtime="
    Then I will see the input element "TimeRange" value will contains "本月"

  @dashboard
  Scenario Outline: 添加饼图图表
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "测试钻取变量"
    Then I will see the "dashboard.DetailPage" page
    And I wait for "Progress" will be invisible
    And I click the "Delete" button
    And I wait for "500" millsecond
    And I click the "Ensure" button
    And I wait for "AddEventButton" will be visible
    When I click the "AddEventButton" button
    And I wait for "500" millsecond
    And I click the "AddChart" button
    And I wait for "SpinDot" will be invisible
    And I set the parameter "SearchChartInput" with value "<name>"
    And I wait for loading invisible
    And I click the "{'Checkbox':'<name>'}" button
    And I wait for "500" millsecond
    And I click the "Ensure" button
    Then I wait for element "SuccessMessage" change text to "添加成功"

    Examples:
      | name    |
      | 钻取变量饼图 |

  @dashboard @dashboardSmoke
  Scenario Outline: 修改为饼图
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "测试钻取变量"
    Then I will see the "dashboard.DetailPage" page
    And I wait for "Progress" will be invisible
    And I click the "ChartType" button
    And I wait for "1000" millsecond
    Then I will see the "trend.CreatePage" page
    And I wait for "Dimension" will be visible
    And I click the "Dimension" button under some element
    And I click the "<targetName>" button
    And I hide the element "Content"
    And I wait for "1000" millsecond
    And I click the "Setting" button under some element
    And I choose the "count()" from the "DataValue"
    And I click the "Divide" button
    Then I click the "Generate" button
    And I wait for "1000" millsecond
    And I click the "Setting" button under some element
#    Then I hide the element "SettingContent"
    Then I will see the "dashboard.DetailPage" page
    And I wait for "2000" millsecond
    And I click the "TrendTitle" button under some element
    And I wait for "3000" millsecond
#    And I wait for "1000" millsecond
#    Then I hide the element "SettingContent"
#    And I wait for "Progress" will be invisible
#    Then I will see the "dashboard.DetailPage" page
#    And I click the "TrendTitle" button
#    And take part of "FullScreen" with name "dashboard/<name>"

    Examples:
      | name   | targetName |
      | 仪表盘饼状图 | Pie  |

  @dashboard @dashboardSmoke
  Scenario: 钻取变量饼图click.name RZY-3677
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "测试钻取变量"
    Then I will see the "dashboard.DetailPage" page
    And I wait for "Progress" will be invisible
    When the chart title is "钻取变量饼图" then I click the button which classname is "anticon css-ifnfqv ant-dropdown-trigger" in dashboard
    And I click the "DrillSetting" button
    And I wait for "500" millsecond
    And I choose the "跳转到搜索页" from the "DrillAction"
    And I click the "Custom" button
    And I set the parameter "Spl" with value "* | stats count() by ${click.name}"
    And I click the "DateEditor" button
    And I click the "Shortcut" button
    And I click the "Today" button
    And I "checked" the checkbox which name is "在浏览器新标签页中打开"
    And I click the "Ensure" button
    And I wait for "3000" millsecond
    And I click the "PartOfPie" button
    And switch to another window
    And I will see the "splSearch.SearchPage" page
    Then I will see the "SearchInput" result will be "* | stats count() by apache.clientip"

  @dashboard @dashboardSmoke
  Scenario: 钻取变量饼图click.name2 RZY-3678
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "测试钻取变量"
    Then I will see the "dashboard.DetailPage" page
    And I wait for "Progress" will be invisible
    When the chart title is "钻取变量饼图" then I click the button which classname is "anticon css-ifnfqv ant-dropdown-trigger" in dashboard
    And I click the "DrillSetting" button
    And I wait for "500" millsecond
    And I choose the "跳转到搜索页" from the "DrillAction"
    And I click the "Custom" button
    And I set the parameter "Spl" with value "* | stats ${click.name2} by appname"
    And I click the "DateEditor" button
    And I click the "Shortcut" button
    And I click the "Today" button
    And I "checked" the checkbox which name is "在浏览器新标签页中打开"
    And I click the "Ensure" button
    And I wait for "3000" millsecond
    And I click the "PartOfPie" button
    And switch to another window
#    And I close all tabs except main tab
    And I will see the "splSearch.SearchPage" page
    Then I will see the "SearchInput" result will be "* | stats count() by appname"

  @dashboard @dashboardSmoke
  Scenario: 钻取变量饼图click.value RZY-3679
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "测试钻取变量"
    Then I will see the "dashboard.DetailPage" page
    And I wait for "Progress" will be invisible
    When the chart title is "钻取变量饼图" then I click the button which classname is "anticon css-ifnfqv ant-dropdown-trigger" in dashboard
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
    And I click the "PartOfPie" button
    And switch to another window
    And I will see the "splSearch.SearchPage" page
    Then I will see the "SearchInput" result will be "apache.clientip:64.20.177.254"

  @dashboard
  Scenario: 钻取变量饼图click.value2 RZY-3680
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "测试钻取变量"
    Then I will see the "dashboard.DetailPage" page
    And I wait for "Progress" will be invisible
    When the chart title is "钻取变量饼图" then I click the button which classname is "anticon css-ifnfqv ant-dropdown-trigger" in dashboard
    And I click the "DrillSetting" button
    And I wait for "500" millsecond
    And I choose the "跳转到搜索页" from the "DrillAction"
    And I click the "Custom" button
    And I set the parameter "Spl" with value "* | stats count() as cn by apache.resp_len,apache.clientip | where cn==${click.value2}"
    And I click the "DateEditor" button
    And I click the "Shortcut" button
    And I click the "Today" button
    And I "checked" the checkbox which name is "在浏览器新标签页中打开"
    And I click the "Ensure" button
    And I wait for "3000" millsecond
    And I click the "PartOfPie" button
    And switch to another window
    And I close all tabs except main tab
    And I will see the "splSearch.SearchPage" page
    Then I will see the "SearchInput" result will be "* | stats count() as cn by apache.resp_len,apache.clientip | where cn==24"

  @dashboard
  Scenario: 钻取变量饼图row.fieldname RZY-3681
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "测试钻取变量"
    Then I will see the "dashboard.DetailPage" page
    And I wait for "Progress" will be invisible
    When the chart title is "钻取变量饼图" then I click the button which classname is "anticon css-ifnfqv ant-dropdown-trigger" in dashboard
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
    And I wait for "3000" millsecond
    And I click the "PartOfPie" button
    And switch to another window
    And I close all tabs except main tab
    And I will see the "splSearch.SearchPage" page
    Then I will see the "SearchInput" result will be "apache.clientip:64.20.177.254"

  @dashboard
  Scenario: 钻取变量饼图start end RZY-3682
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "测试钻取变量"
    Then I will see the "dashboard.DetailPage" page
    And I wait for "Progress" will be invisible
    When the chart title is "钻取变量饼图" then I click the button which classname is "anticon css-ifnfqv ant-dropdown-trigger" in dashboard
    And I click the "DrillSetting" button
    And I wait for "500" millsecond
    And I choose the "跳转到搜索页" from the "DrillAction"
    And I click the "Custom" button
    And I set the parameter "Spl" with value "starttime=${start} endtime=${end} *"
    And I click the "DateEditor" button
    And I click the "Shortcut" button
    And I click the "ThisMonth" button
    And I "checked" the checkbox which name is "在浏览器新标签页中打开"
    And I click the "Ensure" button
    And I wait for "3000" millsecond
    And I click the "PartOfPie" button
    And switch to another window
    And I close all tabs except main tab
    And I will see the "splSearch.SearchPage" page
    Then I will see the "SearchInput" result will contain "starttime="
    Then I will see the "SearchInput" result will contain "endtime="
    Then I will see the input element "TimeRange" value will contains "本月"

  @dashboard
  Scenario Outline: 添加单值图表
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "测试钻取变量"
    Then I will see the "dashboard.DetailPage" page
    And I wait for "Progress" will be invisible
    And I click the "Delete" button
    And I wait for "500" millsecond
    And I click the "Ensure" button
    And I wait for "AddEventButton" will be visible
    When I click the "AddEventButton" button
    And I wait for "500" millsecond
    And I click the "AddChart" button
    And I wait for "SpinDot" will be invisible
    And I set the parameter "SearchChartInput" with value "<name>"
    And I wait for loading invisible
    And I click the "{'Checkbox':'<name>'}" button
    And I wait for "500" millsecond
    And I click the "Ensure" button
    Then I wait for element "SuccessMessage" change text to "添加成功"

    Examples:
      | name    |
      | 钻取变量单值 |

  @dashboard @dashboardSmoke
  Scenario Outline: 修改为单值
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "测试钻取变量"
    Then I will see the "dashboard.DetailPage" page
    And I wait for "Progress" will be invisible
    And I click the "ChartType" button
    And I wait for "1000" millsecond
    Then I will see the "trend.CreatePage" page
    And I wait for "Other" will be visible
    And I click the "Other" button under some element
    And I click the "<targetName>" button
    And I hide the element "Content"
    And I wait for "1000" millsecond
    And I click the "Setting" button under some element
    And I choose the "avg(apache.status)" from the "DataField"
    And I click the "Icon" button
    And I click the "AccordingField" button
    And I choose the "icon" from the "DataValue"
    Then I click the "Generate" button
    And I wait for "1000" millsecond
    And I click the "Setting" button under some element
#    Then I hide the element "SettingContent"
    Then I will see the "dashboard.DetailPage" page
    And I wait for "2000" millsecond
    And I click the "TrendTitle" button under some element
    And I wait for "3000" millsecond
#    And I wait for "1000" millsecond
#    Then I hide the element "SettingContent"
#    And I wait for "Progress" will be invisible
#    Then I will see the "dashboard.DetailPage" page
#    And I click the "TrendTitle" button
#    And take part of "FullScreen" with name "dashboard/<name>"

    Examples:
      | name   | targetName |
      | 钻取变量单值 | Single  |

  @dashboard @dashboardSmoke
  Scenario: 钻取变量单值click.name,click.name2 RZY-3278
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "测试钻取变量"
    Then I will see the "dashboard.DetailPage" page
    And I wait for "Progress" will be invisible
    When the chart title is "钻取变量单值" then I click the button which classname is "anticon css-ifnfqv ant-dropdown-trigger" in dashboard
    And I click the "DrillSetting" button
    And I wait for "500" millsecond
    And I choose the "跳转到搜索页" from the "DrillAction"
    And I click the "Custom" button
    And I set the parameter "Spl" with value "tag:*display | stats avg(apache.status) |eval icon=if('${click.name}'>300,'thumbs-down','thumbs-up')"
    And I click the "DateEditor" button
    And I click the "Shortcut" button
    And I click the "Today" button
    And I "checked" the checkbox which name is "在浏览器新标签页中打开"
    And I click the "Ensure" button
    And I wait for "3000" millsecond
    And I click the "SingleValue" button
    And switch to another window
#    And I close all tabs except main tab
    And I will see the "splSearch.SearchPage" page
    Then I will see the "SearchInput" result will be "tag:*display | stats avg(apache.status) |eval icon=if('avg(apache.status)'>300,'thumbs-down','thumbs-up')"
    And switch to another window
    And I close all tabs except main tab
    And I will see the "dashboard.DetailPage" page
    And I wait for "Progress" will be invisible
    And I click the "SettingChart" button
    And I click the "DrillSetting" button
    And I wait for "500" millsecond
    And I choose the "跳转到搜索页" from the "DrillAction"
    And I click the "Custom" button
    And I set the parameter "Spl" with value "tag:*display | stats avg(apache.status) |eval icon=if('${click.name2}'>300,'thumbs-down','thumbs-up')"
    And I click the "Ensure" button
    And I wait for "3000" millsecond
    And I wait for "SingleValue" will be visible
    And I click the "SingleValue" button
    And switch to another window
    And I close all tabs except main tab
    And I will see the "splSearch.SearchPage" page
    Then I will see the "SearchInput" result will be "tag:*display | stats avg(apache.status) |eval icon=if('avg(apache.status)'>300,'thumbs-down','thumbs-up')"

  @dashboard
  Scenario: 钻取变量单值start end RZY-3667
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "测试钻取变量"
    Then I will see the "dashboard.DetailPage" page
    And I wait for "Progress" will be invisible
    When the chart title is "钻取变量单值" then I click the button which classname is "anticon css-ifnfqv ant-dropdown-trigger" in dashboard
    And I click the "Configs" button
    And I wait for loading invisible
    And I click the "DateEditor" button
    And I wait for "1000" millsecond
    And I click the "WholeTime" button
#    Then I will see the "dashboard.DetailPage" page
    And I click the "Ensure" button
#    And I click the "Setting" button under some element
#    And I click the "Value" button
#    And I choose the "avg(apache.status)" from the "DataField"
#    Then I click the "Generate" button
    And I wait for "2000" millsecond
    And I click the "SettingChart" button
    And I click the "DrillSetting" button
    And I wait for "500" millsecond
    And I choose the "跳转到搜索页" from the "DrillAction"
    And I click the "Custom" button
    And I set the parameter "Spl" with value "starttime=${start} endtime=${end} *"
    And I click the "DateEditor" button
    And I click the "Shortcut" button
    And I wait for "500" millsecond
    And I click the "ThisMonth" button
    And I "checked" the checkbox which name is "在浏览器新标签页中打开"
    And I click the "Ensure" button
    And I wait for "3000" millsecond
    And I click the "SingleValue" button
    And switch to another window
    And I close all tabs except main tab
    And I will see the "splSearch.SearchPage" page
    Then I will see the "SearchInput" result will contain "starttime="
    Then I will see the "SearchInput" result will contain "endtime="
    Then I will see the input element "TimeRange" value will contains "本月"

  @dashboard
  Scenario Outline: 添加单值图表value
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "测试钻取变量"
    Then I will see the "dashboard.DetailPage" page
    And I wait for "Progress" will be invisible
    And I click the "Delete" button
    And I wait for "500" millsecond
    And I click the "Ensure" button
    And I wait for "AddEventButton" will be visible
    When I click the "AddEventButton" button
    And I wait for "500" millsecond
    And I click the "AddChart" button
    And I wait for "SpinDot" will be invisible
    And I set the parameter "SearchChartInput" with value "<name>"
    And I wait for loading invisible
    And I click the "{'Checkbox':'<name>'}" button
    And I wait for "500" millsecond
    And I click the "Ensure" button
    Then I wait for element "SuccessMessage" change text to "添加成功"

    Examples:
      | name    |
      | 钻取变量单值value |

  @dashboard @dashboardSmoke
  Scenario Outline: 修改为单值value
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "测试钻取变量"
    Then I will see the "dashboard.DetailPage" page
    And I wait for "Progress" will be invisible
    And I click the "ChartType" button
    And I wait for "1000" millsecond
    Then I will see the "trend.CreatePage" page
    And I wait for "Other" will be visible
    And I click the "Other" button under some element
    And I click the "<targetName>" button
    And I hide the element "Content"
    And I wait for "1000" millsecond
    And I click the "Setting" button under some element
    And I choose the "apache.clientip" from the "DataField"
    And I choose the "apache.clientip" from the "DisplayField"
    Then I click the "Generate" button
    And I wait for "1000" millsecond
    And I click the "Setting" button under some element
#    Then I hide the element "SettingContent"
    Then I will see the "dashboard.DetailPage" page
    And I wait for "2000" millsecond
    And I click the "TrendTitle" button under some element
    And I wait for "3000" millsecond
#    And I wait for "1000" millsecond
#    Then I hide the element "SettingContent"
#    And I wait for "Progress" will be invisible
#    Then I will see the "dashboard.DetailPage" page
#    And I click the "TrendTitle" button
#    And take part of "FullScreen" with name "dashboard/<name>"

    Examples:
      | name   | targetName |
      | 钻取变量单值value | Single  |

  @dashboard
  Scenario: 修改为单值value click.value value2 RZY-3666
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "测试钻取变量"
    Then I will see the "dashboard.DetailPage" page
    And I wait for "Progress" will be invisible
    When the chart title is "钻取变量单值value" then I click the button which classname is "anticon css-ifnfqv ant-dropdown-trigger" in dashboard
    And I click the "Configs" button
    And I wait for loading invisible
    And I click the "DateEditor" button
    And I wait for "1000" millsecond
    And I click the "WholeTime" button
#    Then I will see the "dashboard.DetailPage" page
    And I click the "Ensure" button
    And I click the "SettingChart" button
    And I click the "DrillSetting" button
    And I wait for "500" millsecond
    And I choose the "跳转到搜索页" from the "DrillAction"
    And I click the "Custom" button
    And I set the parameter "Spl" with value "apache.clientip:${click.value}"
    And I click the "DateEditor" button
    And I click the "Shortcut" button
    And I wait for "500" millsecond
    And I click the "WholeTime" button
    And I "checked" the checkbox which name is "在浏览器新标签页中打开"
    And I click the "Ensure" button
    And I wait for "3000" millsecond
    And I click the "SingleValue1" button
    And switch to another window
#    And I close all tabs except main tab
    And I will see the "splSearch.SearchPage" page
    Then I will see the "SearchInput" result will be "apache.clientip:64.20.177.254"
    And switch to another window
    And I will see the "dashboard.DetailPage" page
    And I wait for loading invisible
    And I close all tabs except main tab
    And I click the "SettingChart" button
    And I click the "DrillSetting" button
    And I wait for "500" millsecond
    And I choose the "跳转到搜索页" from the "DrillAction"
    And I click the "Custom" button
    And I set the parameter "Spl" with value "apache.clientip:${click.value2}"
    And I click the "Ensure" button
    And I wait for "3000" millsecond
    And I click the "SingleValue1" button
    And switch to another window
    And I close all tabs except main tab
    And I will see the "splSearch.SearchPage" page
    Then I will see the "SearchInput" result will be "apache.clientip:64.20.177.254"

  @dashboard
  Scenario Outline: 添加表格图表
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "测试钻取变量"
    Then I will see the "dashboard.DetailPage" page
    And I wait for "Progress" will be invisible
    And I click the "Delete" button
    And I wait for "500" millsecond
    And I click the "Ensure" button
    And I wait for "AddEventButton" will be visible
    When I click the "AddEventButton" button
    And I wait for "500" millsecond
    And I click the "AddChart" button
    And I wait for "SpinDot" will be invisible
    And I set the parameter "SearchChartInput" with value "<name>"
    And I wait for loading invisible
    And I click the "{'Checkbox':'<name>'}" button
    And I wait for "500" millsecond
    And I click the "Ensure" button
    Then I wait for element "SuccessMessage" change text to "添加成功"

    Examples:
      | name    |
      | 钻取变量表格 |

  @dashboard @dashboardSmoke
  Scenario: 钻取变量表格click.name RZY-3280
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "测试钻取变量"
    Then I will see the "dashboard.DetailPage" page
    And I wait for "Progress" will be invisible
    When the chart title is "钻取变量表格" then I click the button which classname is "anticon css-ifnfqv ant-dropdown-trigger" in dashboard
    And I click the "DrillSetting" button
    And I wait for "500" millsecond
    And I choose the "跳转到搜索页" from the "DrillAction"
    And I click the "Custom" button
    And I set the parameter "Spl" with value "* | stats count() by ${click.name}"
    And I click the "DateEditor" button
    And I click the "Shortcut" button
    And I click the "Today" button
    And I "checked" the checkbox which name is "在浏览器新标签页中打开"
    And I click the "Ensure" button
    And I wait for "3000" millsecond
    And I click the "TableRow22" button
    And switch to another window
    And I close all tabs except main tab
    And I will see the "splSearch.SearchPage" page
    Then I will see the "SearchInput" result will be "* | stats count() by apache.clientip"

  @dashboard @dashboardSmoke
  Scenario: 钻取变量表格click.name2 RZY-3282
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "测试钻取变量"
    Then I will see the "dashboard.DetailPage" page
    And I wait for "Progress" will be invisible
    When the chart title is "钻取变量表格" then I click the button which classname is "anticon css-ifnfqv ant-dropdown-trigger" in dashboard
    And I click the "DrillSetting" button
    And I wait for "500" millsecond
    And I choose the "跳转到搜索页" from the "DrillAction"
    And I click the "Custom" button
    And I set the parameter "Spl" with value "* | stats count() by ${click.name2}"
    And I click the "DateEditor" button
    And I click the "Shortcut" button
    And I click the "Today" button
    And I "checked" the checkbox which name is "在浏览器新标签页中打开"
    And I click the "Ensure" button
    And I wait for "3000" millsecond
    And I click the "TableRow22" button
    And switch to another window
#    And I close all tabs except main tab
    And I will see the "splSearch.SearchPage" page
    Then I will see the "SearchInput" result will be "* | stats count() by apache.clientip"
    And switch to another window
    And I close all tabs except main tab
    And I will see the "dashboard.DetailPage" page
    And I wait for "TableRowResplen" will be visible
    And I click the "TableRowResplen" button
    And switch to another window
    And I will see the "splSearch.SearchPage" page
    Then I will see the "SearchInput" result will be "* | stats count() by apache.resp_len"


  @dashboard @dashboardSmoke
  Scenario: 钻取变量表格click.value RZY-3281
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "测试钻取变量"
    Then I will see the "dashboard.DetailPage" page
    And I wait for "Progress" will be invisible
    When the chart title is "钻取变量表格" then I click the button which classname is "anticon css-ifnfqv ant-dropdown-trigger" in dashboard
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
    And I click the "TableRow22" button
    And switch to another window
    And I will see the "splSearch.SearchPage" page
    Then I will see the "SearchInput" result will be "apache.clientip:36.46.208.22"

  @dashboard
  Scenario: 钻取变量表格click.value2 RZY-3283
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "测试钻取变量"
    Then I will see the "dashboard.DetailPage" page
    And I wait for "Progress" will be invisible
    When the chart title is "钻取变量表格" then I click the button which classname is "anticon css-ifnfqv ant-dropdown-trigger" in dashboard
    And I click the "DrillSetting" button
    And I wait for "500" millsecond
    And I choose the "跳转到搜索页" from the "DrillAction"
    And I click the "Custom" button
    And I set the parameter "Spl" with value "apache.resp_len:${click.value2}"
    And I click the "DateEditor" button
    And I click the "Shortcut" button
    And I click the "Today" button
    And I "checked" the checkbox which name is "在浏览器新标签页中打开"
    And I click the "Ensure" button
    And I wait for "3000" millsecond
    And I click the "TableRowResplen" button
    And switch to another window
    And I close all tabs except main tab
    And I will see the "splSearch.SearchPage" page
    Then I will see the "SearchInput" result will be "apache.resp_len:1222"

  @dashboard
  Scenario: 钻取变量表格row.fieldname RZY-3284
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "测试钻取变量"
    Then I will see the "dashboard.DetailPage" page
    And I wait for "Progress" will be invisible
    When the chart title is "钻取变量表格" then I click the button which classname is "anticon css-ifnfqv ant-dropdown-trigger" in dashboard
    And I click the "DrillSetting" button
    And I wait for "500" millsecond
    And I choose the "跳转到搜索页" from the "DrillAction"
    And I click the "Custom" button
    And I set the parameter "Spl" with value "apache.resp_len:${row.apache.resp_len}"
    And I click the "DateEditor" button
    And I click the "Shortcut" button
    And I click the "Today" button
    And I "checked" the checkbox which name is "在浏览器新标签页中打开"
    And I click the "Ensure" button
    And I wait for "3000" millsecond
    And I click the "TableRowResplen" button
    And switch to another window
    And I close all tabs except main tab
    And I will see the "splSearch.SearchPage" page
    Then I will see the "SearchInput" result will be "apache.resp_len:1222"

  @dashboard
  Scenario: 钻取变量表格start,end RZY-3654
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "测试钻取变量"
    Then I will see the "dashboard.DetailPage" page
    And I wait for "Progress" will be invisible
    When the chart title is "钻取变量表格" then I click the button which classname is "anticon css-ifnfqv ant-dropdown-trigger" in dashboard
    And I click the "Configs" button
    And I wait for loading invisible
    And I click the "DateEditor" button
    And I wait for "1000" millsecond
    And I click the "WholeTime" button
#    Then I will see the "dashboard.DetailPage" page
    And I click the "Ensure" button
    And I click the "SettingChart" button
    And I click the "DrillSetting" button
    And I wait for "500" millsecond
    And I choose the "跳转到搜索页" from the "DrillAction"
    And I click the "Custom" button
    And I set the parameter "Spl" with value "starttime=${start} endtime=${end} *"
    And I click the "DateEditor" button
    And I click the "Shortcut" button
    And I wait for "500" millsecond
    And I click the "RecentSevenDay" button
    And I "checked" the checkbox which name is "在浏览器新标签页中打开"
    And I click the "Ensure" button
    And I wait for "3000" millsecond
    And I click the "TableRow22" button
    And switch to another window
    And I close all tabs except main tab
    And I will see the "splSearch.SearchPage" page
    Then I will see the "SearchInput" result will contain "starttime="
    Then I will see the "SearchInput" result will contain "endtime="
    Then I will see the input element "TimeRange" value will contains "最近7天"

  @dashboard
  Scenario: 统计表 RZY-297
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "测试钻取变量"
    Then I will see the "dashboard.DetailPage" page
    And I wait for "Progress" will be invisible
    Then I will see the "ForthIcon" doesn't exist

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
      | 测试钻取变量   |

  @cleanDashboard
  Scenario Outline: 删除仪表盘所建趋势图
    Given open the "trend.ListPage" page for uri "/trend/"
    When the data name is "<name>" then i click the "删除" button
    And I wait for "Ensure" will be visible
    And I click the "Ensure" button
    And I wait for "500" millsecond
    And I will see the success message "删除成功"

    Examples:
      | name    |
      | 钻取变量字符云图  |
      | 钻取变量区划地图 |
      | 钻取变量饼图 |
      | 钻取变量表格 |
      | 钻取变量单值 |
      | 钻取变量单值value |
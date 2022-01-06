@dbdrilldown @dashboard0330 @dashboard37
Feature: 仪表盘钻取配置-钻取变量

  Background:
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for "2000" millsecond

  @dashboard37pre0
  Scenario Outline: 新建仪表盘
    And I click the "Create" button
    When I set the parameter "DashBoardName" with value "<name>"
    And I click the "Ensure" button
    And I wait for "SuccessMessage" will be visible
    Then I will see the success message "新建仪表盘成功"

    Examples:
      | name   |
      | 测试钻取变量 |

  @dashboard37pre1
  Scenario Outline: 新建趋势图
    And open the "trend.ListPage" page for uri "/trend/"
    And I click the "NewTrendButton" button
#    And I click the "Create" button
    Then I will see the "trend.CreatePageDash" page
    And I set the parameter "SearchInput" with value "<spl>"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    Given I wait for loading complete
    And I wait for "Header" will be visible
    And I wait for "2000" millsecond
    And I click the "NextButton" button under some element
    Given I wait for loading complete
    And I wait for "Header" will be visible
    And I wait for "2000" millsecond
    And I click the "NextButton" button under some element
    Given I wait for loading complete
    When I set the parameter "NameInput" with value "<name>"
    And I wait for "1000" millsecond
    And I click the "Complete" button under some element
    And I wait for "SuccessCreate" will be visible

    Examples:
      | name            | spl                                                       |
      | 钻取变量字符云图   | tag:sample04061424_display OR tag:sample04061424_chart OR tag:sample04061424 \| stats count() by apache.clientip \| limit 3     |
      | 钻取变量区划地图   | tag:sample04061424 \| stats count() by apache.geo.country,apache.geo.province,apache.geo.city |
      | 钻取变量饼图      | tag:sample04061424_display OR tag:sample04061424_chart OR tag:sample04061424 \| stats count() by apache.clientip \| limit 10     |
      | 钻取变量表格      | tag:sample04061424_display \| stats count() by apache.clientip,apache.resp_len \| limit 10     |
      | 钻取变量单值      | tag:sample04061424_display \| stats avg(apache.status) \|eval icon=if('avg(apache.status)'>300,'thumbs-down','thumbs-up')    |
      | 钻取变量单值value | tag:sample04061424_display \| stats count() by apache.clientip,apache.resp_len \| limit 10     |

  @dashboard37pre3
  Scenario Outline: 新建标签页
    And I click the detail which name is "<name>"
    And switch to window "仪表盘"
    And I close all tabs except main tab
    Then I will see the "dashboard.DetailPage" page
    When I set the parameter "TagName" with value "chart"
    And I click the "Ensure" button
    And I wait for "2000" millsecond
    And I back to before

    Examples:
      | name   |
      | 测试钻取变量 |

  @dashboard37a1
  Scenario: 添加图表
    And I click the detail which name is "测试钻取变量"
    And switch to window "仪表盘"
    And I close all tabs except main tab
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
#    Then I wait for element "SuccessMessage" change text to "添加成功"

  @dashboard37a2
  Scenario: 开启钻取配置
    And I click the detail which name is "测试钻取变量"
    And switch to window "仪表盘"
    And I close all tabs except main tab
    Then I will see the "dashboard.DetailPage" page
    And I click the "SettingIcon" button
    And I switch the dashboard "OpenDrilldown" button to "enable"
#    And I click the "OpenDrilldown" button
    And I wait for "500" millsecond

  @dashboard37a3
  Scenario Outline: 修改为字符云图
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
    And I click the "<image>" button
#    And I hide the element "Content"
    And I wait for "1000" millsecond
    And I click the "SettingChart" button under some element
    And I wait for "1000" millsecond
    And I choose the "count()" from the "DataValue"
    And I wait for "1000" millsecond
    And I click the "Divide" button
    And I click the "Exhibition" button
    And I click the "StartColour" button
    And I click the "Orange" button
    And I wait for "1000" millsecond
    Then I click the "Generate" button
    And I wait for "1000" millsecond
    And I click the "SettingChart" button under some element
#    Then I hide the element "SettingContent"
    Then I will see the "dashboard.DetailPage" page
    And I wait for "2000" millsecond
    And I click the "TrendTitle" button under some element
    And I wait for "3000" millsecond


    Examples:
      | name    | image     |
      | 测试钻取变量 | Wordcloud |

  @dashboard37a4
  Scenario: 钻取变量字符云图click.name RZY-3265
    And I click the detail which name is "测试钻取变量"
    And switch to window "仪表盘"
    And I close all tabs except main tab
    Then I will see the "dashboard.DetailPage" page
    And I wait for "Progress" will be invisible
    When the chart title is "钻取变量字符云图" then I click the button which classname is "yotta-icon yotta-icon-DotEmblem" in dashboard
    And I click the "DrillSetting" button
    And I wait for "1500" millsecond
    And I choose the "跳转到搜索页" from the "DrillAction"
    And I click the "Custom" button
    And I set the parameter "Spl" with value "tag:sample04061424_display | stats count() by ${click.name} | limit 3"
    And I click the "DateEditor" button
    And I click the "Shortcut" button
    And I click the "Today" button
    And I wait for "1500" millsecond
    And I "unchecked" the checkbox which name is "在浏览器新标签页中打开"
    And I click the "Ensure" button
    And I wait for "SuccessMessage" will be invisible
    And I wait for "3000" millsecond
    And I click the Circle "IpZifu" button
    Then I wait for title change text to "搜索"
    And I will see the "splSearch.SearchPage" page
    Then I will see the "SearchInput" result will be "tag:sample04061424_display | stats count() by apache.clientip | limit 3"
    And I wait for "2000" millsecond
#    Then I will see the input element "TimeRange" value will contains "今天"
    Then I will see the "TimeRange" result will be "今天"

  @dashboard37a5
  Scenario: 钻取变量字符云图click.value RZY-3266
    And I click the detail which name is "测试钻取变量"
    And switch to window "仪表盘"
    And I close all tabs except main tab
    Then I will see the "dashboard.DetailPage" page
    And I wait for "Progress" will be invisible
    When the chart title is "钻取变量字符云图" then I click the button which classname is "yotta-icon yotta-icon-DotEmblem" in dashboard
    And I click the "DrillSetting" button
    And I wait for "1500" millsecond
    And I choose the "跳转到搜索页" from the "DrillAction"
    And I click the "Custom" button
    And I set the parameter "Spl" with value "apache.clientip:${click.value}"
    And I click the "DateEditor" button
    And I click the "Shortcut" button
    And I click the "Today" button
    And I wait for "1500" millsecond
    And I "checked" the checkbox which name is "在浏览器新标签页中打开"
    And I click the "Ensure" button
    And I wait for "SuccessMessage" will be invisible
    And I wait for "3000" millsecond
    And I click the Circle "IpZifu" button
    And switch to another window
#    And I close all tabs except main tab
    And I will see the "splSearch.SearchPage" page
    Then I will see the "SearchInput" result will be "apache.clientip:64.20.177.254"
    And I wait for "2000" millsecond
#    Then I will see the input element "TimeRange" value will contains "今天"
    Then I will see the "TimeRange" result will be "今天"

  @dashboard37a6
  Scenario: 钻取变量字符云图click.name2 RZY-3267
    And I click the detail which name is "测试钻取变量"
    And switch to window "仪表盘"
    And I close all tabs except main tab
    Then I will see the "dashboard.DetailPage" page
    And I wait for "Progress" will be invisible
    When the chart title is "钻取变量字符云图" then I click the button which classname is "yotta-icon yotta-icon-DotEmblem" in dashboard
    And I click the "DrillSetting" button
    And I wait for "1500" millsecond
    And I choose the "跳转到搜索页" from the "DrillAction"
    And I wait for "500" millsecond
    And I click the "Custom" button
    And I set the parameter "Spl" with value "* | stats ${click.name2} by appname"
    And I click the "DateEditor" button
    And I click the "Shortcut" button
    And I click the "Today" button
    And I wait for "1500" millsecond
    And I "checked" the checkbox which name is "在浏览器新标签页中打开"
    And I click the "Ensure" button
    And I wait for "SuccessMessage" will be invisible
    And I wait for "3000" millsecond
    And I click the Circle "IpZifu" button
    And switch to another window
    And I will see the "splSearch.SearchPage" page
    Then I will see the "SearchInput" result will be "* | stats count() by appname"
    And I wait for "2000" millsecond
#    Then I will see the input element "TimeRange" value will contains "今天"
    Then I will see the "TimeRange" result will be "今天"

  @dashboard37a7
  Scenario: 钻取变量字符云图click.value2 RZY-3268
    And I click the detail which name is "测试钻取变量"
    And switch to window "仪表盘"
    And I close all tabs except main tab
    Then I will see the "dashboard.DetailPage" page
    And I wait for "Progress" will be invisible
    When the chart title is "钻取变量字符云图" then I click the button which classname is "yotta-icon yotta-icon-DotEmblem" in dashboard
    And I click the "DrillSetting" button
    And I wait for "1500" millsecond
    And I choose the "跳转到搜索页" from the "DrillAction"
    And I wait for "500" millsecond
    And I click the "Custom" button
    And I set the parameter "Spl" with value "* | stats count() as cn by apache.resp_len,apache.clientip | where cn==${click.value2}"
    And I click the "DateEditor" button
    And I click the "Shortcut" button
    And I click the "Today" button
    And I wait for "1500" millsecond
    And I "checked" the checkbox which name is "在浏览器新标签页中打开"
    And I click the "Ensure" button
    And I wait for "SuccessMessage" will be invisible
    And I wait for "3000" millsecond
    And I click the Circle "IpZifu" button
    And switch to another window
    And I close all tabs except main tab
    And I will see the "splSearch.SearchPage" page
    Then I will see the "SearchInput" result will be "* | stats count() as cn by apache.resp_len,apache.clientip | where cn==24"
    And I wait for "2000" millsecond
#    Then I will see the input element "TimeRange" value will contains "今天"
    Then I will see the "TimeRange" result will be "今天"

  @dashboard37a8
  Scenario: 钻取变量字符云图row.fieldname RZY-3675
    And I click the detail which name is "测试钻取变量"
    And switch to window "仪表盘"
    And I close all tabs except main tab
    Then I will see the "dashboard.DetailPage" page
    And I wait for "Progress" will be invisible
    When the chart title is "钻取变量字符云图" then I click the button which classname is "yotta-icon yotta-icon-DotEmblem" in dashboard
    And I click the "DrillSetting" button
    And I wait for "1500" millsecond
    And I choose the "跳转到搜索页" from the "DrillAction"
    And I wait for "500" millsecond
    And I click the "Custom" button
    And I set the parameter "Spl" with value "apache.clientip:${row.apache.clientip}"
    And I click the "DateEditor" button
    And I click the "Shortcut" button
    And I click the "Today" button
    And I wait for "1500" millsecond
    And I "checked" the checkbox which name is "在浏览器新标签页中打开"
    And I click the "Ensure" button
    And I wait for "SuccessMessage" will be invisible
    And I wait for "3000" millsecond
    And I click the Circle "IpZifu" button
    And switch to another window
    And I close all tabs except main tab
    And I will see the "splSearch.SearchPage" page
    Then I will see the "SearchInput" result will be "apache.clientip:64.20.177.254"
    And I wait for "2000" millsecond
#    Then I will see the input element "TimeRange" value will contains "今天"
    Then I will see the "TimeRange" result will be "今天"

  @dashboard37a9
  Scenario: 钻取变量字符云图start end RZY-3676
    And I click the detail which name is "测试钻取变量"
    And switch to window "仪表盘"
    And I close all tabs except main tab
    Then I will see the "dashboard.DetailPage" page
    And I wait for "Progress" will be invisible
    When the chart title is "钻取变量字符云图" then I click the button which classname is "yotta-icon yotta-icon-DotEmblem" in dashboard
    And I click the "DrillSetting" button
    And I wait for "1500" millsecond
    And I choose the "跳转到搜索页" from the "DrillAction"
    And I wait for "500" millsecond
    And I click the "Custom" button
    And I set the parameter "Spl" with value "starttime=${start} endtime=${end} *"
    And I click the "DateEditor" button
    And I click the "Shortcut" button
    And I click the "ThisMonth" button
    And I wait for "1500" millsecond
    And I "checked" the checkbox which name is "在浏览器新标签页中打开"
    And I click the "Ensure" button
    And I wait for "SuccessMessage" will be invisible
    And I wait for "3000" millsecond
    And I click the Circle "IpZifu" button
    And switch to another window
    And I close all tabs except main tab
    And I will see the "splSearch.SearchPage" page
    Then I will see the "SearchInput" result will contain "starttime="
    Then I will see the "SearchInput" result will contain "endtime="
    And I wait for "2000" millsecond
#    Then I will see the input element "TimeRange" value will contains "本月"
    Then I will see the "TimeRange" result will be "本月"

  @dashboard37b1
  Scenario Outline: 添加区划地图图表 RZY-331
    And I click the detail which name is "测试钻取变量"
    And switch to window "仪表盘"
    And I close all tabs except main tab
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
    And I wait for "SuccessMessage" will be visible
    Then I wait for element "SuccessMessage" change text to "添加成功"

    Examples:
      | name    |
      | 钻取变量区划地图 |

  @dashboard37b2
  Scenario Outline: 修改为区划地图
    And I click the detail which name is "<name>"
    And switch to window "仪表盘"
    And I close all tabs except main tab
    Then I will see the "dashboard.DetailPage" page
    And I wait for "Progress" will be invisible
    And I click the "ChartType" button
    And I wait for "1000" millsecond
    Then I will see the "trend.CreatePageDash" page
    And I wait for "Map" will be visible
    And I click the "Map" button
    And I click the "Regionmap" button
#    And I wait for "Progress" will be invisible
#    And I hide the element "Content"
    And I wait for "1000" millsecond
    And I click the "SettingChart" button under some element
    And I wait for "1000" millsecond
    And I choose the "count()" from the "DataValue"
    And I wait for "1000" millsecond
    And I click the "Divide" button
    And I wait for "500" millsecond
    And I click the "CloseDivideItem" button
    And I wait for "1000" millsecond
    And I choose the "apache.geo.province" from the "DataValue"
    And I wait for "1000" millsecond
    And I click the "Region" button
    And I wait for "500" millsecond
    And I click the "SelectChina" button
    And I wait for "1000" millsecond
    Then I click the "Generate" button
    And I wait for "1500" millsecond
    And I click the "SettingChart" button under some element
#    Then I hide the element "SettingContent"
    Then I will see the "dashboard.DetailPage" page
    And I wait for "2000" millsecond
    And I click the "TrendTitle" button under some element
    And I wait for "3000" millsecond

    Examples:
      | name    |
      | 测试钻取变量 |

  @dashboard37b3
  Scenario: 钻取变量区划地图click.name RZY-3269
    And I click the detail which name is "测试钻取变量"
    And switch to window "仪表盘"
    And I close all tabs except main tab
    Then I will see the "dashboard.DetailPage" page
    And I wait for "Progress" will be invisible
    When the chart title is "钻取变量区划地图" then I click the button which classname is "yotta-icon yotta-icon-DotEmblem" in dashboard
    And I click the "DrillSetting" button
    And I wait for "1500" millsecond
    And I choose the "跳转到搜索页" from the "DrillAction"
    And I click the "Custom" button
    And I set the parameter "Spl" with value "* | stats count() by ${click.name}"
    And I click the "DateEditor" button
    And I click the "Shortcut" button
    And I click the "Today" button
    And I wait for "1500" millsecond
    And I "unchecked" the checkbox which name is "在浏览器新标签页中打开"
    And I click the "Ensure" button
    And I wait for "3000" millsecond
    And I click the Circle "Taiwan" button
#    And I click the "Taiwan" button
    Then I wait for title change text to "搜索"
    And I will see the "splSearch.SearchPage" page
    Then I will see the "SearchInput" result will be "* | stats count() by apache.geo.province"
    And I wait for "2000" millsecond
#    Then I will see the input element "TimeRange" value will contains "今天"
    Then I will see the "TimeRange" result will be "今天"

  @dashboard37b4
  Scenario: 钻取变量区划地图click.value RZY-3270
    And I click the detail which name is "测试钻取变量"
    And switch to window "仪表盘"
    And I close all tabs except main tab
    Then I will see the "dashboard.DetailPage" page
    And I wait for "Progress" will be invisible
    When the chart title is "钻取变量区划地图" then I click the button which classname is "yotta-icon yotta-icon-DotEmblem" in dashboard
    And I click the "DrillSetting" button
    And I wait for "1500" millsecond
    And I choose the "跳转到搜索页" from the "DrillAction"
    And I click the "Custom" button
    And I set the parameter "Spl" with value "apache.geo.province:${click.value}"
    And I click the "DateEditor" button
    And I click the "Shortcut" button
    And I click the "Today" button
    And I wait for "1500" millsecond
    And I "checked" the checkbox which name is "在浏览器新标签页中打开"
    And I click the "Ensure" button
    And I wait for "3000" millsecond
    And I click the Circle "Taiwan" button
#    And I click the "Taiwan" button
    And switch to another window
#    And I close all tabs except main tab
    And I will see the "splSearch.SearchPage" page
    Then I will see the "SearchInput" result will be "apache.geo.province:台湾"
    And I wait for "2000" millsecond
#    Then I will see the input element "TimeRange" value will contains "今天"
    Then I will see the "TimeRange" result will be "今天"


  @dashboard37b5
  Scenario: 钻取变量区划地图click.name2 RZY-3269
    And I click the detail which name is "测试钻取变量"
    And switch to window "仪表盘"
    And I close all tabs except main tab
    Then I will see the "dashboard.DetailPage" page
    And I wait for "Progress" will be invisible
    When the chart title is "钻取变量区划地图" then I click the button which classname is "yotta-icon yotta-icon-DotEmblem" in dashboard
    And I click the "DrillSetting" button
    And I wait for "1500" millsecond
    And I choose the "跳转到搜索页" from the "DrillAction"
    And I click the "Custom" button
    And I set the parameter "Spl" with value "* | stats ${click.name2} by apache.geo.province"
    And I click the "DateEditor" button
    And I click the "Shortcut" button
    And I click the "Today" button
    And I wait for "1500" millsecond
    And I "checked" the checkbox which name is "在浏览器新标签页中打开"
    And I click the "Ensure" button
    And I wait for "3000" millsecond
#    And I click the "Taiwan" button
    And I click the Circle "Taiwan" button
    And switch to another window
    And I will see the "splSearch.SearchPage" page
    Then I will see the "SearchInput" result will be "* | stats count() by apache.geo.province"
    And I wait for "3000" millsecond
#    Then I will see the input element "TimeRange" value will contains "今天"
    Then I will see the "TimeRange" result will be "今天"

  @dashboard37b6
  Scenario: 钻取变量区划地图click.value2 RZY-3272
    And I click the detail which name is "测试钻取变量"
    And switch to window "仪表盘"
    And I close all tabs except main tab
    Then I will see the "dashboard.DetailPage" page
    And I wait for "Progress" will be invisible
    When the chart title is "钻取变量区划地图" then I click the button which classname is "yotta-icon yotta-icon-DotEmblem" in dashboard
    And I click the "DrillSetting" button
    And I wait for "1500" millsecond
    And I choose the "跳转到搜索页" from the "DrillAction"
    And I click the "Custom" button
    And I set the parameter "Spl" with value "tag:sample04061424 | stats count() as cn by apache.geo.country,apache.geo.province,apache.geo.city | where cn ==${click.value2}"
    And I click the "DateEditor" button
    And I click the "Shortcut" button
    And I click the "Today" button
    And I wait for "1500" millsecond
    And I "checked" the checkbox which name is "在浏览器新标签页中打开"
    And I click the "Ensure" button
    And I wait for "3000" millsecond
#    And I click the "Taiwan" button
    And I click the Circle "Taiwan" button
    And switch to another window
    And I close all tabs except main tab
    And I will see the "splSearch.SearchPage" page
    Then I will see the "SearchInput" result will contain "tag:sample04061424 | stats count() as cn by apache.geo.country,apache.geo.province,apache.geo.city | where cn =="
#    Then I will see the "SearchInput" result will be "tag:sample04061424 | stats count() as cn by apache.geo.country,apache.geo.province,apache.geo.city | where cn =="

  @dashboard37b7
  Scenario: 钻取变量区划地图row.fieldname RZY-3673
    And I click the detail which name is "测试钻取变量"
    And switch to window "仪表盘"
    And I close all tabs except main tab
    Then I will see the "dashboard.DetailPage" page
    And I wait for "Progress" will be invisible
    When the chart title is "钻取变量区划地图" then I click the button which classname is "yotta-icon yotta-icon-DotEmblem" in dashboard
    And I click the "DrillSetting" button
    And I wait for "1500" millsecond
    And I choose the "跳转到搜索页" from the "DrillAction"
    And I click the "Custom" button
    And I set the parameter "Spl" with value "tag:sample04061424 | stats count() by '${row.apache.geo.province}'"
    And I click the "DateEditor" button
    And I click the "Shortcut" button
    And I click the "Today" button
    And I wait for "1500" millsecond
    And I "checked" the checkbox which name is "在浏览器新标签页中打开"
    And I click the "Ensure" button
    And I wait for "3000" millsecond
    And I click the Circle "Neimenggu" button
    And switch to another window
    And I close all tabs except main tab
    And I will see the "splSearch.SearchPage" page
    Then I will see the "SearchInput" result will be "tag:sample04061424 | stats count() by '内蒙古'"
    And I wait for "2000" millsecond
#    Then I will see the input element "TimeRange" value will contains "今天"
    Then I will see the "TimeRange" result will be "今天"

  @dashboard37b8
  Scenario: 钻取变量区划地图start end RZY-3674
    And I click the detail which name is "测试钻取变量"
    And switch to window "仪表盘"
    And I close all tabs except main tab
    Then I will see the "dashboard.DetailPage" page
    And I wait for "Progress" will be invisible
    When the chart title is "钻取变量区划地图" then I click the button which classname is "yotta-icon yotta-icon-DotEmblem" in dashboard
    And I click the "DrillSetting" button
    And I wait for "1500" millsecond
    And I choose the "跳转到搜索页" from the "DrillAction"
    And I click the "Custom" button
    And I set the parameter "Spl" with value "starttime=${start} endtime=${end} *"
    And I click the "DateEditor" button
    And I click the "Shortcut" button
    And I click the "ThisMonth" button
    And I wait for "1500" millsecond
    And I "checked" the checkbox which name is "在浏览器新标签页中打开"
    And I click the "Ensure" button
    And I wait for "3000" millsecond
#    And I click the "Taiwan" button
    And I click the Circle "Taiwan" button
    And switch to another window
    And I close all tabs except main tab
    And I will see the "splSearch.SearchPage" page
    Then I will see the "SearchInput" result will contain "starttime="
    Then I will see the "SearchInput" result will contain "endtime="
    And I wait for "1000" millsecond
#    Then I will see the input element "TimeRange" value will contains "本月"
    Then I will see the "TimeRange" result will be "本月"

  @dashboard37c1
  Scenario Outline: 添加饼图图表
    And I click the detail which name is "测试钻取变量"
    And switch to window "仪表盘"
    And I close all tabs except main tab
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
    And I wait for "SuccessMessage" will be visible
    Then I wait for element "SuccessMessage" change text to "添加成功"

    Examples:
      | name    |
      | 钻取变量饼图 |

  @dashboard37c2
  Scenario Outline: 修改为饼图
    And I click the detail which name is "测试钻取变量"
    And switch to window "仪表盘"
    And I close all tabs except main tab
    Then I will see the "dashboard.DetailPage" page
    And I wait for "Progress" will be invisible
    And I click the "ChartType" button
    And I wait for "1000" millsecond
    Then I will see the "trend.CreatePageDash" page
    And I wait for "Dimension" will be visible
    And I click the "Dimension" button under some element
    And I click the "<targetName>" button
#    And I hide the element "Content"
    And I wait for "1000" millsecond
    And I click the "SettingChart" button under some element
    And I choose the "count()" from the "DataValue"
    And I wait for "1000" millsecond
    And I click the "Divide" button
    Then I click the "Generate" button
    And I wait for "1000" millsecond
    And I click the "SettingChart" button under some element
#    Then I hide the element "SettingContent"
    Then I will see the "dashboard.DetailPage" page
    And I wait for "2000" millsecond
    And I click the "TrendTitle" button under some element
    And I wait for "3000" millsecond

    Examples:
      | name   | targetName |
      | 仪表盘饼状图 | Pie  |

  @dashboard37c3
  Scenario: 钻取变量饼图click.name RZY-3677
    And I click the detail which name is "测试钻取变量"
    And switch to window "仪表盘"
    And I close all tabs except main tab
    Then I will see the "dashboard.DetailPage" page
    And I wait for "Progress" will be invisible
    When the chart title is "钻取变量饼图" then I click the button which classname is "yotta-icon yotta-icon-DotEmblem" in dashboard
    And I click the "DrillSetting" button
    And I wait for "1500" millsecond
    And I choose the "跳转到搜索页" from the "DrillAction"
    And I click the "Custom" button
    And I set the parameter "Spl" with value "* | stats count() by ${click.name}"
    And I click the "DateEditor" button
    And I click the "Shortcut" button
    And I click the "Today" button
    And I wait for "1500" millsecond
    And I "checked" the checkbox which name is "在浏览器新标签页中打开"
    And I click the "Ensure" button
    And I wait for "3000" millsecond
    And I click the Circle "PartOfPie" button
#    And I click the "PartOfPie" button
    And switch to another window
    And I will see the "splSearch.SearchPage" page
    Then I will see the "SearchInput" result will be "* | stats count() by apache.clientip"

  @dashboard37c4
  Scenario: 钻取变量饼图click.name2 RZY-3678
    And I click the detail which name is "测试钻取变量"
    And switch to window "仪表盘"
    And I close all tabs except main tab
    Then I will see the "dashboard.DetailPage" page
    And I wait for "Progress" will be invisible
    When the chart title is "钻取变量饼图" then I click the button which classname is "yotta-icon yotta-icon-DotEmblem" in dashboard
    And I click the "DrillSetting" button
    And I wait for "500" millsecond
#    And I choose the "跳转到搜索页" from the "DrillAction"
#    And I click the "Custom" button
    And I set the parameter "Spl" with value "* | stats ${click.name2} by appname"
    And I click the "DateEditor" button
    And I click the "Shortcut" button
    And I click the "Today" button
    And I wait for "1500" millsecond
    And I "checked" the checkbox which name is "在浏览器新标签页中打开"
    And I click the "Ensure" button
    And I wait for "3000" millsecond
#    And I click the "PartOfPie" button
    And I click the Circle "PartOfPie" button
    And switch to another window
#    And I close all tabs except main tab
    And I will see the "splSearch.SearchPage" page
    Then I will see the "SearchInput" result will be "* | stats count() by appname"

  @dashboard37c5
  Scenario: 钻取变量饼图click.value RZY-3679
    And I click the detail which name is "测试钻取变量"
    And switch to window "仪表盘"
    And I close all tabs except main tab
    Then I will see the "dashboard.DetailPage" page
    And I wait for "Progress" will be invisible
    When the chart title is "钻取变量饼图" then I click the button which classname is "yotta-icon yotta-icon-DotEmblem" in dashboard
    And I click the "DrillSetting" button
    And I wait for "1500" millsecond
    And I choose the "跳转到搜索页" from the "DrillAction"
    And I click the "Custom" button
    And I set the parameter "Spl" with value "apache.clientip:${click.value}"
    And I click the "DateEditor" button
    And I click the "Shortcut" button
    And I click the "Today" button
    And I wait for "1500" millsecond
    And I "checked" the checkbox which name is "在浏览器新标签页中打开"
    And I click the "Ensure" button
    And I wait for "3000" millsecond
#    And I click the "PartOfPie" button
    And I click the Circle "PartOfPie" button
    And switch to another window
    And I will see the "splSearch.SearchPage" page
    Then I will see the "SearchInput" result will be "apache.clientip:64.20.177.254"

  @dashboard37c6
  Scenario: 钻取变量饼图click.value2 RZY-3680
    And I click the detail which name is "测试钻取变量"
    And switch to window "仪表盘"
    And I close all tabs except main tab
    Then I will see the "dashboard.DetailPage" page
    And I wait for "Progress" will be invisible
    When the chart title is "钻取变量饼图" then I click the button which classname is "yotta-icon yotta-icon-DotEmblem" in dashboard
    And I click the "DrillSetting" button
    And I wait for "1500" millsecond
    And I choose the "跳转到搜索页" from the "DrillAction"
    And I click the "Custom" button
    And I set the parameter "Spl" with value "* | stats count() as cn by apache.resp_len,apache.clientip | where cn==${click.value2}"
    And I click the "DateEditor" button
    And I click the "Shortcut" button
    And I click the "Today" button
    And I wait for "1500" millsecond
    And I "checked" the checkbox which name is "在浏览器新标签页中打开"
    And I click the "Ensure" button
    And I wait for "3000" millsecond
#    And I click the "PartOfPie" button
    And I click the Circle "PartOfPie" button
    And switch to another window
    And I close all tabs except main tab
    And I will see the "splSearch.SearchPage" page
    Then I will see the "SearchInput" result will be "* | stats count() as cn by apache.resp_len,apache.clientip | where cn==24"

  @dashboard37c7
  Scenario: 钻取变量饼图row.fieldname RZY-3681
    And I click the detail which name is "测试钻取变量"
    And switch to window "仪表盘"
    And I close all tabs except main tab
    Then I will see the "dashboard.DetailPage" page
    And I wait for "Progress" will be invisible
    When the chart title is "钻取变量饼图" then I click the button which classname is "yotta-icon yotta-icon-DotEmblem" in dashboard
    And I click the "DrillSetting" button
    And I wait for "1500" millsecond
    And I choose the "跳转到搜索页" from the "DrillAction"
    And I click the "Custom" button
    And I set the parameter "Spl" with value "apache.clientip:${row.apache.clientip}"
    And I click the "DateEditor" button
    And I click the "Shortcut" button
    And I click the "Today" button
    And I wait for "1500" millsecond
    And I "checked" the checkbox which name is "在浏览器新标签页中打开"
    And I click the "Ensure" button
    And I wait for "3000" millsecond
#    And I click the "PartOfPie" button
    And I click the Circle "PartOfPie" button
    And switch to another window
    And I close all tabs except main tab
    And I will see the "splSearch.SearchPage" page
    Then I will see the "SearchInput" result will be "apache.clientip:64.20.177.254"

  @dashboard37c8
  Scenario: 钻取变量饼图start end RZY-3682
    And I click the detail which name is "测试钻取变量"
    And switch to window "仪表盘"
    And I close all tabs except main tab
    Then I will see the "dashboard.DetailPage" page
    And I wait for "Progress" will be invisible
    When the chart title is "钻取变量饼图" then I click the button which classname is "yotta-icon yotta-icon-DotEmblem" in dashboard
    And I click the "DrillSetting" button
    And I wait for "1500" millsecond
    And I choose the "跳转到搜索页" from the "DrillAction"
    And I click the "Custom" button
    And I set the parameter "Spl" with value "starttime=${start} endtime=${end} *"
    And I click the "DateEditor" button
    And I click the "Shortcut" button
    And I click the "ThisMonth" button
    And I wait for "1500" millsecond
    And I "checked" the checkbox which name is "在浏览器新标签页中打开"
    And I click the "Ensure" button
    And I wait for "3000" millsecond
#    And I click the "PartOfPie" button
    And I click the Circle "PartOfPie" button
    And switch to another window
    And I close all tabs except main tab
    And I will see the "splSearch.SearchPage" page
    Then I will see the "SearchInput" result will contain "starttime="
    Then I will see the "SearchInput" result will contain "endtime="
    And I wait for "1000" millsecond
#    Then I will see the input element "TimeRange" value will contains "本月"
    Then I will see the "TimeRange" result will be "本月"

  @dashboard37d1
  Scenario Outline: 添加单值图表
    And I click the detail which name is "测试钻取变量"
    And switch to window "仪表盘"
    And I close all tabs except main tab
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
    And I wait for "SuccessMessage" will be visible
    Then I wait for element "SuccessMessage" change text to "添加成功"

    Examples:
      | name    |
      | 钻取变量单值 |

  @dashboard37d2
  Scenario Outline: 修改为单值
    And I click the detail which name is "测试钻取变量"
    And switch to window "仪表盘"
    And I close all tabs except main tab
    Then I will see the "dashboard.DetailPage" page
    And I wait for "Progress" will be invisible
    And I click the "ChartType" button
    And I wait for "1000" millsecond
    Then I will see the "trend.CreatePageDash" page
    And I wait for "Other" will be visible
    And I click the "Other" button under some element
    And I click the "<targetName>" button
#    And I hide the element "Content"
    And I wait for "1000" millsecond
    And I click the "SettingChart" button under some element
    And I choose the "avg(apache.status)" from the "DataField"
    And I wait for "1000" millsecond
    And I click the "Icon" button
    And I click the "AccordingField" button
    And I choose the "icon" from the "DataValue"
    And I wait for "1000" millsecond
    Then I click the "Generate" button
    And I wait for "1000" millsecond
    And I click the "SettingChart" button under some element
#    Then I hide the element "SettingContent"
    Then I will see the "dashboard.DetailPage" page
    And I wait for "2000" millsecond
    And I click the "TrendTitle" button under some element
    And I wait for "3000" millsecond

    Examples:
      | name   | targetName |
      | 钻取变量单值 | Single  |

  @dashboard37d3
  Scenario: 钻取变量单值click.name,click.name2 RZY-3278
    And I click the detail which name is "测试钻取变量"
    And switch to window "仪表盘"
    And I close all tabs except main tab
    Then I will see the "dashboard.DetailPage" page
    And I wait for "Progress" will be invisible
    When the chart title is "钻取变量单值" then I click the button which classname is "yotta-icon yotta-icon-DotEmblem" in dashboard
    And I click the "DrillSetting" button
    And I wait for "1500" millsecond
    And I choose the "跳转到搜索页" from the "DrillAction"
    And I click the "Custom" button
    And I set the parameter "Spl" with value "tag:*display | stats avg(apache.status) |eval icon=if('${click.name}'>300,'thumbs-down','thumbs-up')"
    And I click the "DateEditor" button
    And I click the "Shortcut" button
    And I click the "Today" button
    And I wait for "1500" millsecond
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
    And I wait for "1500" millsecond
#    And I wait for "Progress" will be invisible
    And I click the "MoreChartConfigs" button
    And I click the "DrillSetting" button
    And I wait for "1500" millsecond
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

  @rzy3667
  Scenario: 钻取变量单值start end RZY-3667
    And I click the detail which name is "测试钻取变量"
    And switch to window "仪表盘"
    And I close all tabs except main tab
    Then I will see the "dashboard.DetailPage" page
    And I wait for "Progress" will be invisible
    When the chart title is "钻取变量单值" then I click the button which classname is "yotta-icon yotta-icon-DotEmblem" in dashboard
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
    And I click the "MoreChartConfigs" button
    And I click the "DrillSetting" button
    And I wait for "500" millsecond
#    And I choose the "跳转到搜索页" from the "DrillAction"
#    And I click the "Custom" button
    And I set the parameter "Spl" with value "starttime=${start} endtime=${end} *"
    And I click the "DateEditor" button
    And I click the "Shortcut" button
    And I wait for "500" millsecond
    And I click the "ThisMonth" button
    And I wait for "1500" millsecond
    And I "checked" the checkbox which name is "在浏览器新标签页中打开"
    And I click the "Ensure" button
    And I wait for "3000" millsecond
    And I click the "SingleValue" button
    And switch to another window
    And I close all tabs except main tab
    And I will see the "splSearch.SearchPage" page
    Then I will see the "SearchInput" result will contain "starttime="
    Then I will see the "SearchInput" result will contain "endtime="
    And I wait for "1000" millsecond
    Then I will see the "TimeRange" result will be "本月"

  Scenario Outline: 添加单值图表value
    And I click the detail which name is "测试钻取变量"
    And switch to window "仪表盘"
    And I close all tabs except main tab
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
    And I wait for "SuccessMessage" will be visible
    Then I wait for element "SuccessMessage" change text to "添加成功"

    Examples:
      | name    |
      | 钻取变量单值value |


  Scenario Outline: 修改为单值value
    And I click the detail which name is "测试钻取变量"
    And switch to window "仪表盘"
    And I close all tabs except main tab
    Then I will see the "dashboard.DetailPage" page
    And I wait for "Progress" will be invisible
    And I click the "ChartType" button
    And I wait for "1000" millsecond
    Then I will see the "trend.CreatePageDash" page
    And I wait for "Other" will be visible
    And I click the "Other" button under some element
    And I click the "<targetName>" button
#    And I hide the element "Content"
    And I wait for "1000" millsecond
    And I click the "SettingChart" button under some element
    And I choose the "count()" from the "DataField"
    And I wait for "1000" millsecond
    And I choose the "apache.clientip" from the "DisplayField"
    And I wait for "1000" millsecond
    Then I click the "Generate" button
    And I wait for "1000" millsecond
    And I click the "SettingChart" button under some element
#    Then I hide the element "SettingContent"
    Then I will see the "dashboard.DetailPage" page
    And I wait for "2000" millsecond
    And I click the "TrendTitle" button under some element
    And I wait for "3000" millsecond

    Examples:
      | name   | targetName |
      | 钻取变量单值value | Single  |


  Scenario: 修改为单值value click.value value2 RZY-3666
    And I click the detail which name is "测试钻取变量"
    And switch to window "仪表盘"
    And I close all tabs except main tab
    Then I will see the "dashboard.DetailPage" page
    And I wait for "Progress" will be invisible
    When the chart title is "钻取变量单值value" then I click the button which classname is "yotta-icon yotta-icon-DotEmblem" in dashboard
    And I click the "Configs" button
    And I wait for loading invisible
    And I click the "DateEditor" button
    And I wait for "1000" millsecond
    And I click the "WholeTime" button
#    Then I will see the "dashboard.DetailPage" page
    And I click the "Ensure" button
    And I click the "MoreChartConfigs" button
    And I click the "DrillSetting" button
    And I wait for "1500" millsecond
    And I choose the "跳转到搜索页" from the "DrillAction"
    And I click the "Custom" button
    And I set the parameter "Spl" with value "apache.clientip:${click.value}"
    And I click the "DateEditor" button
    And I click the "Shortcut" button
    And I wait for "500" millsecond
    And I click the "WholeTime" button
    And I wait for "1500" millsecond
    And I "checked" the checkbox which name is "在浏览器新标签页中打开"
    And I click the "Ensure" button
    And I wait for "3000" millsecond
    And I click the "SingleValue1" button
    And switch to another window
#    And I close all tabs except main tab
    And I will see the "splSearch.SearchPage" page
    Then I will see the "SearchInput" result will contain "apache.clientip:"
    Then I will see the "TimeRange" result will be "所有时间"
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And switch to another window
    And I will see the "dashboard.DetailPage" page
    And I wait for loading invisible
    And I close all tabs except main tab
    And I click the "MoreChartConfigs" button
    And I click the "DrillSetting" button
    And I wait for "1500" millsecond
    And I choose the "跳转到搜索页" from the "DrillAction"
    And I click the "Custom" button
    And I set the parameter "Spl" with value "apache.clientip:${click.value2}"
    And I click the "Ensure" button
    And I wait for "3000" millsecond
    And I click the "SingleValue1" button
    And switch to another window
    And I close all tabs except main tab
    And I will see the "splSearch.SearchPage" page
    Then I will see the "SearchInput" result will contain "apache.clientip:"
    Then I will see the "TimeRange" result will be "所有时间"
    And I wait for element "SearchStatus" change text to "搜索完成!"


  Scenario Outline: 添加表格图表
    And I click the detail which name is "测试钻取变量"
    And switch to window "仪表盘"
    And I close all tabs except main tab
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
    And I wait for "SuccessMessage" will be visible
    Then I wait for element "SuccessMessage" change text to "添加成功"

    Examples:
      | name    |
      | 钻取变量表格 |


  Scenario: 钻取变量表格click.name RZY-3280
    And I click the detail which name is "测试钻取变量"
    And switch to window "仪表盘"
    And I close all tabs except main tab
    Then I will see the "dashboard.DetailPage" page
    And I wait for "Progress" will be invisible
    When the chart title is "钻取变量表格" then I click the button which classname is "yotta-icon yotta-icon-DotEmblem" in dashboard
    And I click the "DrillSetting" button
    And I wait for "1500" millsecond
    And I choose the "跳转到搜索页" from the "DrillAction"
    And I click the "Custom" button
    And I set the parameter "Spl" with value "* | stats count() by ${click.name}"
    And I click the "DateEditor" button
    And I click the "Shortcut" button
    And I click the "Today" button
    And I wait for "1500" millsecond
    And I "checked" the checkbox which name is "在浏览器新标签页中打开"
    And I click the "Ensure" button
    And I wait for "3000" millsecond
    And I click the "TableRow22" button
    And switch to another window
    And I close all tabs except main tab
    And I will see the "splSearch.SearchPage" page
    Then I will see the "SearchInput" result will be "* | stats count() by apache.clientip"


  Scenario: 钻取变量表格click.name2 RZY-3282
    And I click the detail which name is "测试钻取变量"
    And switch to window "仪表盘"
    And I close all tabs except main tab
    Then I will see the "dashboard.DetailPage" page
    And I wait for "Progress" will be invisible
    When the chart title is "钻取变量表格" then I click the button which classname is "yotta-icon yotta-icon-DotEmblem" in dashboard
    And I click the "DrillSetting" button
    And I wait for "1500" millsecond
    And I choose the "跳转到搜索页" from the "DrillAction"
    And I click the "Custom" button
    And I set the parameter "Spl" with value "* | stats count() by ${click.name2}"
    And I click the "DateEditor" button
    And I click the "Shortcut" button
    And I click the "Today" button
    And I wait for "1500" millsecond
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
    And I wait for "3000" millsecond
#    And I wait for "TableRowResplen" will be visible
    And I click the "TableRowResplen" button
    And switch to another window
    And I will see the "splSearch.SearchPage" page
    Then I will see the "SearchInput" result will be "* | stats count() by apache.resp_len"


  Scenario: 钻取变量表格click.value RZY-3281
    And I click the detail which name is "测试钻取变量"
    And switch to window "仪表盘"
    And I close all tabs except main tab
    Then I will see the "dashboard.DetailPage" page
    And I wait for "Progress" will be invisible
    When the chart title is "钻取变量表格" then I click the button which classname is "yotta-icon yotta-icon-DotEmblem" in dashboard
    And I click the "DrillSetting" button
    And I wait for "1500" millsecond
    And I choose the "跳转到搜索页" from the "DrillAction"
    And I click the "Custom" button
    And I set the parameter "Spl" with value "apache.clientip:${click.value}"
    And I click the "DateEditor" button
    And I click the "Shortcut" button
    And I click the "Today" button
    And I wait for "1500" millsecond
    And I "checked" the checkbox which name is "在浏览器新标签页中打开"
    And I click the "Ensure" button
    And I wait for "3000" millsecond
    And I click the "TableRow22" button
    And switch to another window
    And I will see the "splSearch.SearchPage" page
    Then I will see the "SearchInput" result will be "apache.clientip:36.46.208.22"


  Scenario: 钻取变量表格click.value2 RZY-3283
    And I click the detail which name is "测试钻取变量"
    And switch to window "仪表盘"
    And I close all tabs except main tab
    Then I will see the "dashboard.DetailPage" page
    And I wait for "Progress" will be invisible
    When the chart title is "钻取变量表格" then I click the button which classname is "yotta-icon yotta-icon-DotEmblem" in dashboard
    And I click the "DrillSetting" button
    And I wait for "1500" millsecond
    And I choose the "跳转到搜索页" from the "DrillAction"
    And I click the "Custom" button
    And I set the parameter "Spl" with value "apache.resp_len:${click.value2}"
    And I click the "DateEditor" button
    And I click the "Shortcut" button
    And I click the "Today" button
    And I wait for "1500" millsecond
    And I "checked" the checkbox which name is "在浏览器新标签页中打开"
    And I click the "Ensure" button
    And I wait for "3000" millsecond
    And I click the "TableRowResplen" button
    And switch to another window
    And I close all tabs except main tab
    And I will see the "splSearch.SearchPage" page
    Then I will see the "SearchInput" result will be "apache.resp_len:1222"


  Scenario: 钻取变量表格row.fieldname RZY-3284
    And I click the detail which name is "测试钻取变量"
    And switch to window "仪表盘"
    And I close all tabs except main tab
    Then I will see the "dashboard.DetailPage" page
    And I wait for "Progress" will be invisible
    When the chart title is "钻取变量表格" then I click the button which classname is "yotta-icon yotta-icon-DotEmblem" in dashboard
    And I click the "DrillSetting" button
    And I wait for "1500" millsecond
    And I choose the "跳转到搜索页" from the "DrillAction"
    And I click the "Custom" button
    And I set the parameter "Spl" with value "apache.resp_len:${row.apache.resp_len}"
    And I click the "DateEditor" button
    And I click the "Shortcut" button
    And I click the "Today" button
    And I wait for "1500" millsecond
    And I "checked" the checkbox which name is "在浏览器新标签页中打开"
    And I click the "Ensure" button
    And I wait for "3000" millsecond
    And I click the "TableRowResplen" button
    And switch to another window
    And I close all tabs except main tab
    And I will see the "splSearch.SearchPage" page
    Then I will see the "SearchInput" result will be "apache.resp_len:1222"


  Scenario: 钻取变量表格start,end RZY-3654
    And I click the detail which name is "测试钻取变量"
    And switch to window "仪表盘"
    And I close all tabs except main tab
    Then I will see the "dashboard.DetailPage" page
    And I wait for "Progress" will be invisible
    When the chart title is "钻取变量表格" then I click the button which classname is "yotta-icon yotta-icon-DotEmblem" in dashboard
    And I click the "Configs" button
    And I wait for loading invisible
    And I click the "DateEditor" button
    And I wait for "1000" millsecond
    And I click the "WholeTime" button
#    Then I will see the "dashboard.DetailPage" page
    And I click the "Ensure" button
    And I click the "MoreChartConfigs" button
    And I click the "DrillSetting" button
    And I wait for "1500" millsecond
    And I choose the "跳转到搜索页" from the "DrillAction"
    And I click the "Custom" button
    And I set the parameter "Spl" with value "starttime=${start} endtime=${end} *"
    And I click the "DateEditor" button
    And I click the "Shortcut" button
    And I wait for "500" millsecond
    And I click the "RecentSevenDay" button
    And I wait for "1500" millsecond
    And I "checked" the checkbox which name is "在浏览器新标签页中打开"
    And I click the "Ensure" button
    And I wait for "3000" millsecond
    And I click the "TableRow22" button
    And switch to another window
    And I close all tabs except main tab
    And I will see the "splSearch.SearchPage" page
    Then I will see the "SearchInput" result will contain "starttime="
    Then I will see the "SearchInput" result will contain "endtime="
    And I wait for "1000" millsecond
#    Then I will see the input element "TimeRange" value will contains "最近7天"
    Then I will see the "TimeRange" result will be "最近7天"


  Scenario: 统计表 RZY-297
    And I click the detail which name is "测试钻取变量"
    And switch to window "仪表盘"
    And I close all tabs except main tab
    Then I will see the "dashboard.DetailPage" page
    And I wait for "Progress" will be invisible
    Then I will see the "ForthIcon" doesn't exist

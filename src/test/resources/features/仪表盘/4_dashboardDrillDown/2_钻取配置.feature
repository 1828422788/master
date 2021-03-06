@dbdrilldown @dashboard0429 @dashboard38
Feature: 仪表盘钻取配置

  Background:
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible

  @dbdrilldownpre0
  Scenario Outline: 新建仪表盘
    And I click the "Create" button
    When I set the parameter "DashBoardName" with value "<name>"
    And I click the "Ensure" button
    And I wait for "SuccessMessage" will be visible
    Then I will see the success message "新建仪表盘成功"

    @dbdrilldownSmoke
    Examples:
      | name   |
      | 测试钻取配置 |

    Examples:
      | name   |
      | 钻取跳转   |

  @dbdrilldownpre1 @dbdrilldownSmoke
  Scenario: 新建趋势图
    And open the "trend.ListPage" page for uri "/trend/"
    And I click the "NewTrendButton" button
    Then I will see the "trend.CreatePageDash" page
    And I set the parameter "SearchInput" with value "tag:sample04061424_chart | stats count() by apache.geo.country, apache.geo.province, apache.geo.city"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    Given I wait for loading complete
    And I wait for "Header" will be visible
    And I wait for "2000" millsecond
    And I click the "NextButton" button
    And I wait for loading invisible
    Given I wait for loading complete
    And I wait for "Header" will be visible
    And I wait for "2000" millsecond
    And I click the "NextButton" button
    When I set the parameter "NameInput" with value "仪表盘钻取配置"
    And I click the "Complete" button
    And I wait for "SuccessCreate" will be visible

  @dbdrilldownpre3
  Scenario: 新建标签页钻取所需趋势图
    And open the "trend.ListPage" page for uri "/trend/"
    And I click the "NewTrendButton" button
    Then I will see the "trend.CreatePageDash" page
    And I set the parameter "SearchInput" with value "tag:sample04061424_chart AND 'apache.geo.province':江苏 | stats count()"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for "Header" will be visible
    And I click the "NextButton" button
    And I wait for "1500" millsecond
    And I wait for loading invisible
    And I wait for "Header" will be visible
    And I click the "NextButton" button
    When I set the parameter "NameInput" with value "测试标签钻取"
    And I click the "Complete" button
    And I wait for "SuccessCreate" will be visible

  @dbdrilldown3
  Scenario Outline: 新建标签页
    And I set the parameter "TextFilter" with value "<name>"
    And I wait for loading invisible
    And I click the detail which name is "<name>"
    And switch to window "仪表盘"
    And I close all tabs except main tab
    Then I will see the "dashboard.DetailPage" page
    When I set the parameter "TagName" with value "chart"
    And I click the "Ensure" button
    Then I wait for "SettingIcon" will be visible

    @dbdrilldownSmoke
    Examples:
      | name   |
      | 测试钻取配置 |

    Examples:
      | name   |
      | 钻取跳转   |

  @dbdrilldownjump1
  Scenario: 仪表盘添加钻取趋势图
    And I set the parameter "TextFilter" with value "钻取跳转"
    And I wait for loading invisible
    And I click the detail which name is "钻取跳转"
    And switch to window "仪表盘"
    And I close all tabs except main tab
    Then I will see the "dashboard.DetailPage" page
    And I click the "SettingIcon" button
    And I switch the dashboard "OpenEdit" button to "enable"
    And I click the "SettingIcon" button
    And I wait for "AddEventButton" will be visible
    When I click the "AddEventButton" button
    And I wait for "500" millsecond
    And I click the "AddChart" button
    And I set the parameter "SearchChartInput" with value "测试标签钻取"
    And I wait for loading invisible
    And I click the "{'Checkbox':'测试标签钻取'}" button
    And I click the "Ensure" button
    And I wait for "SuccessMessage" will be visible
    Then I wait for element "SuccessMessage" change text to "添加成功"
    And I wait for "2000" millsecond

  @dbdrilldownjump2
  Scenario Outline: 仪表盘添加输入项
    And I set the parameter "TextFilter" with value "钻取跳转"
    And I wait for loading invisible
    And I click the detail which name is "钻取跳转"
    And switch to window "仪表盘"
    And I close all tabs except main tab
    Then I will see the "dashboard.DetailPage" page
    And I click the "SettingIcon" button
    And I switch the dashboard "OpenEdit" button to "enable"
    And I click the "SettingIcon" button
    When I click the "AddEventButton" button
    And I click the "AddInput" button
    And I set the parameter "FilterTitle" with value "<filter>"
    And I wait for "500" millsecond
    And I set the parameter "FilterToken" with value "<filter>"
    And I wait for "1000" millsecond
    And I set the parameter "FilterDefaultValue" with value "<defaultValue>"
    Then I click the "Ensure" button

    Examples:
      | filter | defaultValue |
      | city   | 苏州市          |

  @dbdrilldownjump3
  Scenario: 修改仪表盘配置
    And I set the parameter "TextFilter" with value "钻取跳转"
    And I wait for loading invisible
    And I click the detail which name is "钻取跳转"
    And switch to window "仪表盘"
    And I close all tabs except main tab
    Then I will see the "dashboard.DetailPage" page
    And I click the "SettingIcon" button
    And I switch the dashboard "OpenEdit" button to "enable"
    And I click the "SettingIcon" button
    And I wait for "SuccessMessage" will be invisible
    When the chart title is "测试标签钻取" then I click the button which classname is "yotta-icon yotta-icon-DotEmblem" in dashboard
    And I click the "Configs" button
    And I wait for loading invisible
    And I set the parameter "Spl" with value "tag:sample04061424_chart AND apache.geo.city:${city}| stats count() by apache.geo.country, apache.geo.province, apache.geo.city"
    And I click the "Ensure" button
    And I wait for "SuccessMessage" will be visible
    Then I will see the success message "配置成功"

  @drilldownconfig11 @dbdrilldownSmoke
  Scenario: 添加图表
    And I set the parameter "TextFilter" with value "测试钻取配置"
    And I wait for loading invisible
    And I click the detail which name is "测试钻取配置"
    And switch to window "仪表盘"
    And I close all tabs except main tab
    Then I will see the "dashboard.DetailPage" page
    And I click the "SettingIcon" button
    And I switch the dashboard "OpenEdit" button to "enable"
    And I click the "SettingIcon" button
    And I wait for "AddEventButton" will be visible
    When I click the "AddEventButton" button
    And I wait for "500" millsecond
    And I click the "AddChart" button
    And I wait for loading invisible
    And I set the parameter "SearchChartInput" with value "仪表盘钻取配置"
    And I wait for loading invisible
    And I "checked" the checkbox which name is "仪表盘钻取配置"
    And I click the "Ensure" button
    And I wait for "SuccessMessage" will be visible
    Then I wait for element "SuccessMessage" change text to "添加成功"

  @drilldownconfig12 @dbdrilldownSmoke
  Scenario: 开启钻取配置(RZY-4479)
    And I set the parameter "TextFilter" with value "测试钻取配置"
    And I wait for loading invisible
    And I click the detail which name is "测试钻取配置"
    And switch to window "仪表盘"
    And I close all tabs except main tab
    Then I will see the "dashboard.DetailPage" page
    And I click the "SettingIcon" button
    And I switch the dashboard "OpenDrilldown" button to "enable"
#    And I click the "OpenDrilldown" button
    And I wait for "500" millsecond


  @rzy318  @drilldownconfig13 @dbdrilldownSmoke
  Scenario: 在当前页面跳转到搜索页-自动 RZY-318
    And I set the parameter "TextFilter" with value "测试钻取配置"
    And I wait for loading invisible
    And I click the detail which name is "测试钻取配置"
    And switch to window "仪表盘"
    And I close all tabs except main tab
    Then I will see the "dashboard.DetailPage" page
    And I click the "SettingIcon" button
    And I switch the dashboard "OpenEdit" button to "enable"
    And I click the "SettingIcon" button
    And I wait for "SuccessMessage" will be invisible
    When the chart title is "仪表盘钻取配置" then I click the button which classname is "yotta-icon yotta-icon-DotEmblem" in dashboard
    And I click the "DrillSetting" button
    And I wait for "Ensure" will be visible
    And I choose the "跳转到搜索页" from the "DrillAction"
    And I wait for "1500" millsecond
    And I "unchecked" the checkbox which name is "在浏览器新标签页中打开"
    And I wait for "500" millsecond
    And I click the "Ensure" button
    And I click the Element with text "江苏"
    Then I wait for title change text to "搜索"
    And I will see the "splSearch.SearchPage" page
    Then I will see the "SearchInput" result will be "tag:sample04061424_chart AND 'apache.geo.province':江苏"

  @drilldownconfig14
  Scenario: 在新标签页跳转到搜索页-自动 RZY-318
    And I set the parameter "TextFilter" with value "测试钻取配置"
    And I wait for loading invisible
    And I click the detail which name is "测试钻取配置"
    And switch to window "仪表盘"
    And I close all tabs except main tab
    Then I will see the "dashboard.DetailPage" page
    And I click the "SettingIcon" button
    And I switch the dashboard "OpenEdit" button to "enable"
    And I click the "SettingIcon" button
    And I wait for "SuccessMessage" will be invisible
    When the chart title is "仪表盘钻取配置" then I click the button which classname is "yotta-icon yotta-icon-DotEmblem" in dashboard
    And I click the "DrillSetting" button
    And I wait for "Ensure" will be visible
    And I choose the "跳转到搜索页" from the "DrillAction"
    And I wait for "1500" millsecond
    And I "checked" the checkbox which name is "在浏览器新标签页中打开"
    And I wait for "500" millsecond
    And I click the "Ensure" button
    And I wait for "500" millsecond
    And I click the Element with text "江苏"
    And switch to another window
    And I close all tabs except main tab
    And I will see the "splSearch.SearchPage" page
    Then I will see the "SearchInput" result will be "tag:sample04061424_chart AND 'apache.geo.province':江苏"


  Scenario: 在当前页面跳转到搜索页-自定义 RZY-3439
    And I set the parameter "TextFilter" with value "测试钻取配置"
    And I wait for loading invisible
    And I click the detail which name is "测试钻取配置"
    And switch to window "仪表盘"
    And I close all tabs except main tab
    Then I will see the "dashboard.DetailPage" page
    And I click the "SettingIcon" button
    And I switch the dashboard "OpenEdit" button to "enable"
    And I click the "SettingIcon" button
    And I wait for "SuccessMessage" will be invisible
    When the chart title is "仪表盘钻取配置" then I click the button which classname is "yotta-icon yotta-icon-DotEmblem" in dashboard
    And I click the "DrillSetting" button
    And I wait for "Ensure" will be visible
    And I choose the "跳转到搜索页" from the "DrillAction"
    And I click the "Custom" button
    And I set the parameter "Spl" with value "tag:sample04061424_display | stats count() by apache.clientip,apache.resp_len | limit 10"
    And I click the "DateEditor" button
    And I click the "Shortcut" button
    And I click the "Today" button
    And I wait for "1500" millsecond
    And I "unchecked" the checkbox which name is "在浏览器新标签页中打开"
    And I click the "Ensure" button
    And I wait for "500" millsecond
    And I click the Element with text "江苏"
    Then I wait for title change text to "搜索"
    And I will see the "splSearch.SearchPage" page
    Then I will see the "SearchInput" result will be "tag:sample04061424_display | stats count() by apache.clientip,apache.resp_len | limit 10"
    And I wait for "1000" millsecond
#    Then I will see the input element "TimeRange" value will contains "今天"
    Then I will see the "TimeRange" result will be "今天"

  @dbdrilldownSmoke
  Scenario: 在新标签页跳转到搜索页-自定义 RZY-3439
    And I set the parameter "TextFilter" with value "测试钻取配置"
    And I wait for loading invisible
    And I click the detail which name is "测试钻取配置"
    And switch to window "仪表盘"
    And I close all tabs except main tab
    Then I will see the "dashboard.DetailPage" page
    And I click the "SettingIcon" button
    And I switch the dashboard "OpenEdit" button to "enable"
    And I click the "SettingIcon" button
    And I wait for "SuccessMessage" will be invisible
    When the chart title is "仪表盘钻取配置" then I click the button which classname is "yotta-icon yotta-icon-DotEmblem" in dashboard
    And I click the "DrillSetting" button
    And I wait for "Ensure" will be visible
    And I choose the "跳转到搜索页" from the "DrillAction"
    And I click the "Custom" button
    And I set the parameter "Spl" with value "tag:sample04061424_display | stats count() by apache.clientip,apache.resp_len | limit 10"
    And I click the "DateEditor" button
    And I click the "Shortcut" button
    And I click the "Today" button
    And I wait for "1500" millsecond
    And I "checked" the checkbox which name is "在浏览器新标签页中打开"
    And I click the "Ensure" button
    And I wait for "500" millsecond
    And I click the Element with text "江苏"
    And switch to another window
    And I close all tabs except main tab
    And I will see the "splSearch.SearchPage" page
    Then I will see the "SearchInput" result will be "tag:sample04061424_display | stats count() by apache.clientip,apache.resp_len | limit 10"
    And I wait for "1000" millsecond
#    Then I will see the input element "TimeRange" value will contains "今天"
    Then I will see the "TimeRange" result will be "今天"


  Scenario Outline: 在当前页面跳转到自定义URL RZY-319
    And I set the parameter "TextFilter" with value "测试钻取配置"
    And I wait for loading invisible
    And I click the detail which name is "测试钻取配置"
    And switch to window "仪表盘"
    And I close all tabs except main tab
    Then I will see the "dashboard.DetailPage" page
    And I click the "SettingIcon" button
    And I switch the dashboard "OpenEdit" button to "enable"
    And I click the "SettingIcon" button
    And I wait for "SuccessMessage" will be invisible
    When the chart title is "仪表盘钻取配置" then I click the button which classname is "yotta-icon yotta-icon-DotEmblem" in dashboard
    And I click the "DrillSetting" button
    And I wait for "Ensure" will be visible
    And I choose the "跳转到自定义URL" from the "DrillAction"
    And I wait for "1000" millsecond
    And I set the parameter "Url" with value "<url>"
    And I wait for "1000" millsecond
    And I "unchecked" the checkbox which name is "在浏览器新标签页中打开"
    And I click the "Ensure" button
    And I wait for "500" millsecond
    And I click the Element with text "江苏"
    Then I wait for title change text to "<title>"

    Examples:
      | url                    | title     |
      | https://www.baidu.com/ | 百度一下，你就知道 |

    @dbdrilldownSmoke
    Examples:
      | url                    | title     |
      | /alerts/               | 监控        |

  Scenario Outline: 在新标签跳转到自定义URL RZY-319
    And I set the parameter "TextFilter" with value "测试钻取配置"
    And I wait for loading invisible
    And I click the detail which name is "测试钻取配置"
    And switch to window "仪表盘"
    And I close all tabs except main tab
    Then I will see the "dashboard.DetailPage" page
    And I click the "SettingIcon" button
    And I switch the dashboard "OpenEdit" button to "enable"
    And I click the "SettingIcon" button
    And I wait for "SuccessMessage" will be invisible
    When the chart title is "仪表盘钻取配置" then I click the button which classname is "yotta-icon yotta-icon-DotEmblem" in dashboard
    And I click the "DrillSetting" button
    And I wait for "Ensure" will be visible
    And I choose the "跳转到自定义URL" from the "DrillAction"
    And I wait for "1000" millsecond
    And I set the parameter "Url" with value "<url>"
    And I wait for "1500" millsecond
    And I "checked" the checkbox which name is "在浏览器新标签页中打开"
    And I click the "Ensure" button
    And I click the Element with text "江苏"
    And switch to another window
    And I close all tabs except main tab
    Then the page's title will be "<title>"

    Examples:
      | url                    | title     |
      | https://www.baidu.com/ | 百度一下，你就知道 |
      | /trend/                | 趋势图列表     |


  Scenario: 跳转到标签页(后三步待验证)
    And I set the parameter "TextFilter" with value "测试钻取配置"
    And I wait for loading invisible
    And I click the detail which name is "测试钻取配置"
    And switch to window "仪表盘"
    And I close all tabs except main tab
    Then I will see the "dashboard.DetailPage" page
    And I click the "SettingIcon" button
    And I switch the dashboard "OpenEdit" button to "enable"
    And I click the "SettingIcon" button
    And I wait for "SuccessMessage" will be invisible
    When the chart title is "仪表盘钻取配置" then I click the button which classname is "yotta-icon yotta-icon-DotEmblem" in dashboard
    And I click the "DrillSetting" button
    And I wait for "Ensure" will be visible
    And I choose the "跳转到标签页" from the "DrillAction"
    And I wait for "1000" millsecond
    And I click the "TargetTag" button
    And I click the "TagPageZuanqu" button
#    And I choose the "钻取跳转" from the "DashboardMenu"
    And I wait for "1000" millsecond
    And I click the "tagChart" button
#    And I choose the "chart" from the "DashboardMenu"
    And I wait for "1000" millsecond
    And I click the "TargetParam" button
    And I wait for "1000" millsecond
    And I click the "CityTargetParam" button
    And I wait for "1000" millsecond
    And I click the "ParamValue" button
    And I click the "ClickValue" button
    And I click the "Ensure" button
    And I wait for "2000" millsecond
    And I click the Element with text "南京市"
    And switch to another window
    And I close all tabs except main tab
    And I wait for "Progress" will be invisible
    Then I will see the element "GeoCity" attribute "Value" is "南京市"

  @rzy1740
  Scenario: 单引号和双引号包裹 RZY-1740
    And I set the parameter "TextFilter" with value "测试钻取配置"
    And I wait for loading invisible
    And I click the detail which name is "测试钻取配置"
    And switch to window "仪表盘"
    And I close all tabs except main tab
    Then I will see the "dashboard.DetailPage" page
    And I click the "SettingIcon" button
    And I switch the dashboard "OpenEdit" button to "enable"
    And I click the "SettingIcon" button
    And I wait for "SuccessMessage" will be invisible
    When the chart title is "仪表盘钻取配置" then I click the button which classname is "yotta-icon yotta-icon-DotEmblem" in dashboard
    And I click the "Configs" button
    And I wait for loading invisible
    And I set the parameter "Spl" with value "starttime="now/d" endtime="now/d+24h" tag:sample04061424_* AND NOT tag:${double_quotes|d} | stats count() as cnt by ${single_quotes|s} | sort by cnt,${single_quotes|s}  | limit 8"
    And I click the "Ensure" button
    And I wait for "Progress" will be invisible
    When I click the "AddEventButton" button
    And I click the "AddInput" button
    And I wait for loading invisible
    And I set the parameter "FilterTitle" with value "single_quotes"
    And I wait for "500" millsecond
    And I set the parameter "FilterToken" with value "single_quotes"
    And I wait for "500" millsecond
    And I set the parameter "FilterDefaultValue" with value "apache.clientip"
    And I wait for "500" millsecond
    Then I click the "Ensure" button
    And I click the "AddEventButton" button
    And I click the "AddInput" button
    And I wait for loading invisible
    And I set the parameter "FilterTitle" with value "double_quotes"
    And I wait for "500" millsecond
    And I set the parameter "FilterToken" with value "double_quotes"
    And I wait for "500" millsecond
    And I set the parameter "FilterDefaultValue" with value "sample04061424_display"
    And I wait for "500" millsecond
    Then I click the "Ensure" button
    And I wait for "Progress" will be invisible
    And I set value with element "TableList"
    When the chart title is "仪表盘钻取配置" then I click the button which classname is "yotta-icon yotta-icon-DotEmblem" in dashboard
    And I click the "Configs" button
    And I wait for loading invisible
    And I set the parameter "Spl" with value "starttime="now/d" endtime="now/d+24h" tag:sample04061424_* AND NOT tag:"sample04061424_display" | stats count() as cnt by 'apache.clientip' | sort by cnt,'apache.clientip'  | limit 8"
    And I wait for "500" millsecond
    And I click the "Ensure" button
    And I wait for "Progress" will be invisible
    Then I compare with list "TableList"



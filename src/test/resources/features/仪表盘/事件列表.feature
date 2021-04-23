@dashboard1
Feature: 仪表盘事件列表

  @dashboard @dashboardSmoke
  Scenario: 新建仪表盘
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    When I click the "Create" button
    And I set the parameter "DashBoardName" with value "仪表盘事件操作"
    And I click the "Ensure" button
    Then I will see the success message "新建仪表盘成功"

  @dashboard @dashboardSmoke
  Scenario Outline: 新建标签页
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "<name>"
    Then I will see the "dashboard.DetailPage" page
    When I set the parameter "TagName" with value "事件操作"
    And I click the "EnsureCreateTagButton" button
    And I wait for loading complete
    And I back to before

    Examples:
      | name    |
      | 仪表盘事件操作 |

  @dashboard @dashboardSmoke
  Scenario: 添加事件列表 RZY-3389,RZY-339
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "仪表盘事件操作"
    Then I will see the "dashboard.DetailPage" page
    And I wait for "AddEventButton" will be visible
    When I click the "AddEventButton" button
    And I click the "AddEvent" button
    And I set the parameter "EventName" with value "测试事件操作"
    And I set the parameter "Spl" with value "appname:apache"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "Ensure" button

  @dashboard @dashboardSmoke
  Scenario: 添加事件操作
    Given open the "event.ListPage" page for uri "/event/action/"
    When I click the "Create" button
    Then I will see the "event.CreatePage" page
    And I set the parameter "Name" with value "仪表盘测试事件列表"
    And I set the parameter "Url" with value "/trend/"
    And I click the "CreateButton" button
    And I wait for "Message" will be visible
    Then I will see the message "提交事件操作成功"

  @dashboard @dashboardSmoke
  Scenario: 验证事件操作 RZY-338
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "仪表盘事件操作"
    Then I will see the "dashboard.DetailPage" page
    And I wait for "Progress" will be invisible
    And I wait for "HoverElement" will be visible
#    And I move the mouse pointer to the "HoverElement"
#    And I click the "HoverElement" button
    And I click the "EventOperate" button
    And I click the "Event" button
    And switch to another window
    And I close all tabs except main tab
    Then the page's title will be "趋势图列表"

  @dashboard @dashboardSmoke
  Scenario: 修改事件操作 RZY-3291,RZY-3289
    Given open the "event.ListPage" page for uri "/event/action/"
    When the data name is "{'column':'1','name':'仪表盘测试事件列表'}" then i click the "编辑" button
    Then I will see the "event.CreatePage" page
    And I set the parameter "Field" with value "appname"
    And I choose the "两者" from the "Display"
    And I click the "Save" button
    And I wait for "Message" will be visible
    Then I will see the message "提交事件操作成功"

  @dashboard @dashboardSmoke
  Scenario: 验证事件操作显示于两者 RZY-3291,RZY-3288
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "仪表盘事件操作"
    Then I will see the "dashboard.DetailPage" page
    And I wait for "HoverElement" will be visible
#    And I click the "HoverElement" button
    And I click the "EventOperate" button
    And I click the "Event" button
    And switch to another window
    And I close all tabs except main tab
    Then the page's title will be "趋势图列表"

  @dashboard @dashboardSmoke
  Scenario: 验证事件操作显示于两者
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "仪表盘事件操作"
    Then I will see the "dashboard.DetailPage" page
    And I wait for "Progress" will be invisible
    And I wait for "HoverElement" will be visible
    And I click the "HoverElement" button
    And I click the "IconRight" button
    And I wait for "500" millsecond
    And I click the "EventAppname" button
    And I wait for "500" millsecond
    And I click the "Event" button
    And switch to another window
    And I close all tabs except main tab
    Then the page's title will be "趋势图列表"

  @dashboard @dashboardSmoke
  Scenario: 修改事件操作显示于字段 RZY-3628,RZY-3290
    Given open the "event.ListPage" page for uri "/event/action/"
    When the data name is "{'column':'1','name':'仪表盘测试事件列表'}" then i click the "编辑" button
    Then I will see the "event.CreatePage" page
    And I set the parameter "Field" with value "appname"
    And I choose the "字段菜单" from the "Display"
    And I click the "Save" button
    And I wait for "Message" will be visible
    Then I will see the message "提交事件操作成功"

  @dashboard @dashboardSmoke
  Scenario: 验证事件操作显示于字段 RZY-3628,RZY-3290
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "仪表盘事件操作"
    Then I will see the "dashboard.DetailPage" page
    And I wait for "Progress" will be invisible
    And I wait for "HoverElement" will be visible
#    And I click the "HoverElement" button
    And I click the "EventOperate" button
    And I wait for "1000" millsecond
    Then I will see the "Event" doesn't exist

  @dashboard @dashboardSmoke
  Scenario: 验证事件操作显示于字段 RZY-3628,RZY-3290
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "仪表盘事件操作"
    Then I will see the "dashboard.DetailPage" page
    And I wait for "Progress" will be invisible
    And I wait for "HoverElement" will be visible
    And I click the "HoverElement" button
    And I click the "IconRight" button
    And I click the "EventAppname" button
    And I click the "Event" button
    And switch to another window
    And I close all tabs except main tab
    Then the page's title will be "趋势图列表"

  @dashboard @dashboardSmoke
  Scenario: 修改事件操作动作类型为搜索
    Given open the "event.ListPage" page for uri "/event/action/"
    When the data name is "{'column':'1','name':'仪表盘测试事件列表'}" then i click the "编辑" button
    Then I will see the "event.CreatePage" page
    And I wait for "3000" millsecond
    And I wait for loading invisible
    And I choose the "搜索" from the "Action"
    And I set the parameter "Spl" with value "appname:${appname}"
    And I click the "Save" button
    And I wait for "Message" will be visible
    Then I will see the message "提交事件操作成功"

  @dashboard @dashboardSmoke
  Scenario Outline: 验证事件操作动作类型为搜索
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "仪表盘事件操作"
    Then I will see the "dashboard.DetailPage" page
    And I wait for "Progress" will be invisible
    And I wait for "HoverElement" will be visible
    And I click the "HoverElement" button
    And I click the "IconRight" button
    And I click the "<button>" button
    And I click the "Event" button
    And switch to another window
    And I close all tabs except main tab
    And I will see the "splSearch.SearchPage" page
    Then I will see the "SearchInput" result will be "appname:apache"

    Examples:
      | button       |
      | EventAppname |

  @dashboard @dashboardSmoke
  Scenario: 实时查看 RZY-3409
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "仪表盘事件操作"
    Then I will see the "dashboard.DetailPage" page
    And I wait for "Progress" will be invisible
    And I wait for "HoverElement" will be visible
    And I click the "HoverElement" button
    And I click the "EventOperate" button
    And I click the "RealTime" button
    And switch to another window
    And I close all tabs except main tab
    And I will see the "splSearch.SearchPage" page
    And I wait for "2000" millsecond
#    Then I will see the input element "TimeRange" value will contains "30秒窗口"
    Then I will see the "TimeRange" result will be "30秒窗口"

  @dashboard @dashboardSmoke
  Scenario: 配置字段提取 RZY-3412
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "仪表盘事件操作"
    Then I will see the "dashboard.DetailPage" page
#    And I wait for "Progress" will be invisible
    And I wait for "HoverElement" will be visible
#    And I click the "HoverElement" button
    And I click the "EventOperate" button
    And I click the "CreateConfig" button
    And switch to another window
    And I close all tabs except main tab
    Then I will see the "configs.CreatePage" page
    And I wait for loading invisible
    And I click the "AddRule" button
    And I choose the "手机号码解析" from the "ParseRule" in config
    And I choose the "raw_message" from the "SourceField" in config
#    And I choose the "手机号码解析" from the "ParseRule"
#    And I wait for "500" millsecond
#    And I choose the "raw_message" from the "SourceField"
    And I wait for "500" millsecond
    And I click the "EnsureAddParseRule" button
    And I click the "NextButton" button under some element
    When I set the parameter "Name" with value "仪表盘配置字段提取"
    And I set the parameter "Logtype" with value "other"
    And I click the "Done" button
    Then I wait for "ConfigDone" will be visible

  @dashboard @dashboardSmoke
  Scenario: 添加到知识库 RZY-3413
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "仪表盘事件操作"
    Then I will see the "dashboard.DetailPage" page
    And I wait for "Progress" will be invisible
    And I wait for "HoverElement" will be visible
#    And I click the "HoverElement" button
    And I click the "EventOperate" button
    And I click the "AddKnowledge" button
    And switch to another window
    And I close all tabs except main tab
    And I will see the "knowledge.CreatePage" page
    And I click the "Next" button
    And I wait for "1000" millsecond
    And I click the "Next" button
    And I wait for element "EventCode" value change text to "apache"
    And I click the "Done" button
    Then I will see the element "SuccessAdd" name is "新建成功"

  @dashboard @dashboardSmoke
  Scenario: 通用配置 RZY-3619
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "仪表盘事件操作"
    Then I will see the "dashboard.DetailPage" page
    And I wait for "Progress" will be invisible
    When the chart title is "测试事件操作" then I click the button which classname is "yotta-icon yotta-icon-DotEmblemOutlined" in dashboard
    And I click the "Configs" button
    And I wait for loading invisible
    And I set the parameter "ChartTitle" with value "通用配置"
    And I wait for "500" millsecond
    And I set the parameter "Spl" with value "'apache.geo.city': 成都市"
    And I click the "OpenInSearch" button
    And switch to another window
#    And I close all tabs except main tab
    Then I will see the "splSearch.SearchPage" page
    Then I will see the element "SearchInput" name is "'apache.geo.city': 成都市"
    And I wait for "2000" millsecond
    Then I will see the "TimeRange" result will contain "今天"
#    Then I will see the input element "TimeRange" value will contains "今天"
    And switch to another window
    And I close all tabs except main tab
    Then I will see the "dashboard.DetailPage" page
    And I set the parameter "ChartDesc" with value "测试描述"
    And I click the "Ensure" button
    And I wait for "Ensure" will be invisible
    And I wait for "500" millsecond
#    And I click the "CustomTitle" button
#    And I wait for "1500" millsecond
    And I move the mouse pointer to the "Describe"
#    And I click the "Describe" button
    And I wait for "500" millsecond
#    And I move the mouse pointer to the "CustomTitle"
    Then I will see the text "测试描述" exist in page
#    Then I will see the "DescribeText" result will be "测试描述"

  @dashboard
  Scenario Outline: 高级编辑 RZY-3620
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "<name>"
    Then I will see the "dashboard.DetailPage" page
    When the chart title is "通用配置" then I click the button which classname is "yotta-icon yotta-icon-DotEmblemOutlined" in dashboard
    And I click the "Edit" button
#    Then I will see the "TextLayer" result will contain "<json>"
    Then I will see the "TextLayer" result will be "<json>"

    Examples:
      | name        | json                                                                                                                                                                                                                          |
      | 仪表盘事件操作 | {\n  "title": "通用配置",\n  "description": "测试描述",\n  "x": 0,\n  "y": 0,\n  "w": 12,\n  "h": 6,\n  "search": {\n    "query": "'apache.geo.city': 成都市",\n    "startTime": "now/d",\n    "endTime": "now"\n  }\n} |


  @dashboard @dashboardSmoke
  Scenario: 开启钻取配置
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "仪表盘事件操作"
    Then I will see the "dashboard.DetailPage" page
    And I click the "SettingIcon" button
    And I switch the dashboard "OpenDrilldown" button to "enable"
#    And I click the "OpenDrilldown" button
    And I wait for "500" millsecond

  @dashboard @dashboardSmoke
  Scenario: 跳转到搜索页1 RZY-3622
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "仪表盘事件操作"
    Then I will see the "dashboard.DetailPage" page
    And I wait for "Progress" will be invisible
    When the chart title is "通用配置" then I click the button which classname is "yotta-icon yotta-icon-DotEmblemOutlined" in dashboard
    And I click the "DrillSetting" button
    And I wait for "1500" millsecond
    And I choose the "跳转到搜索页" from the "DrillAction"
    And I wait for "1000" millsecond
    And I "checked" the checkbox which name is "在浏览器新标签页中打开"
    And I click the "Ensure" button
    And I wait for "500" millsecond
#    And I wait for "HoverElement" will be visible
#    And I click the "HoverElement" button
    And I move the mouse pointer to the "HoverElement"
    And I click the "IconRight" button
    And I click the "ChengDuShi" button
    And switch to another window
    And I will see the "splSearch.SearchPage" page
#    Then I will see the element "SearchInput" name is "apache.geo.city:成都市 AND 'apache.geo.city':成都市"
    Then I will see the "SearchInput" result will be "apache.geo.city:成都市 AND 'apache.geo.city':成都市"

  @dashboard @dashboardSmoke
  Scenario: 跳转到搜索页2 RZY-3622
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "仪表盘事件操作"
    Then I will see the "dashboard.DetailPage" page
    And I wait for "Progress" will be invisible
    When the chart title is "通用配置" then I click the button which classname is "yotta-icon yotta-icon-DotEmblemOutlined" in dashboard
    And I click the "DrillSetting" button
    And I wait for "1500" millsecond
    And I choose the "跳转到搜索页" from the "DrillAction"
    And I click the "Custom" button
    And I set the parameter "Spl" with value "* | stats count() by appname"
    And I click the "DateEditor" button
    And I click the "Shortcut" button
    And I click the "WholeTime" button
    And I "checked" the checkbox which name is "在浏览器新标签页中打开"
    And I click the "Ensure" button
    And I wait for "500" millsecond
#    And I wait for "HoverElement" will be visible
#    And I click the "HoverElement" button
    And I move the mouse pointer to the "HoverElement"
    And I click the "IconRight" button
    And I click the "ChengDuShi" button
    And switch to another window
    And I close all tabs except main tab
    And I will see the "splSearch.SearchPage" page
    Then I will see the "SearchInput" result will be "* | stats count() by appname"
    And I wait for "3000" millsecond
#    Then I will see the input element "TimeRange" value will contains "所有时间"
    Then I will see the "TimeRange" result will be "所有时间"

  @dashboard @dashboardSmoke
  Scenario Outline: 在新标签跳转到自定义URL RZY-3625
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "仪表盘事件操作"
    Then I will see the "dashboard.DetailPage" page
    And I wait for "Progress" will be invisible
    When the chart title is "通用配置" then I click the button which classname is "yotta-icon yotta-icon-DotEmblemOutlined" in dashboard
    And I click the "DrillSetting" button
    And I choose the "跳转到自定义URL" from the "DrillAction"
    And I set the parameter "Url" with value "<url>"
    And I "checked" the checkbox which name is "在浏览器新标签页中打开"
    And I click the "Ensure" button
    And I wait for "500" millsecond
#    And I wait for "HoverElement" will be visible
#    And I click the "HoverElement" button
    And I move the mouse pointer to the "HoverElement"
    And I click the "IconRight" button
    And I wait for "ChengDuShi" will be visible
    And I click the "ChengDuShi" button
    And switch to another window
    Then the page's title will be "<title>"

    Examples:
      | url                    | title     |
      | https://www.baidu.com/ | 百度一下，你就知道 |

  @dashboard @dashboardSmoke
  Scenario: 新建全局时间选择器
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    When I click the detail which name is "仪表盘事件操作"
    Then I will see the "dashboard.DetailPage" page
    And I click the "AddIcon" button
    And I click the "addInput" button
    And I set the parameter "inputSettingTitle" with value "全局时间"
    And I click the "inputSettingType" button
#    And I choose the "时间范围" from the "LastDropdownList"
    And I click the "timeRangee" button
    And I wait for "500" millsecond
    And I click the "FilterDateEditor" button
    And I click the "Shortcut" button
    And I click the "Today" button
    Then I wait for "setGlobalTimeRange" will be visible
    And I click the "setGlobalTimeRange" button
    And I wait for "2000" millsecond
    And I click the "Ensure" button
    And I wait for "SuccessMessage" will be visible
#    Then I will see the success message "添加输入项成功"

  @dashboard @dashboardSmoke
  Scenario: 跳转到标签页 RZY-3802,RZY-3624
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "仪表盘事件操作"
    Then I will see the "dashboard.DetailPage" page
    And I wait for "Progress" will be invisible
    When the chart title is "通用配置" then I click the button which classname is "yotta-icon yotta-icon-DotEmblemOutlined" in dashboard
    And I click the "DrillSetting" button
    And I wait for "DrillAction" will be visible
    And I choose the "跳转到标签页" from the "DrillAction"
    And I wait for "1500" millsecond
    And I "checked" the checkbox which name is "在浏览器新标签页中打开"
    And I click the "TargetTag" button
    And I click the "TagPageEvent" button
#    And I choose the "仪表盘事件操作" from the "DashboardMenu"
    And I wait for "1000" millsecond
    And I click the "EventOpera" button
#    And I choose the "事件操作" from the "DashboardMenu"
    And I wait for "500" millsecond
    And I click the "TargetParam" button
    And I wait for "1000" millsecond
    And I click the "GlobalTimeRange" button
    And I wait for "1000" millsecond
#    And I choose the "globalTimeRange" from the "InputGroup"
#    And I hide the element "ParamDropdown"
    And I click the "ParamValue" button
    And I click the "StartEnd" button
    And I click the "Ensure" button
    And I wait for "500" millsecond
#    And I wait for "HoverElement" will be visible
#    And I click the "HoverElement" button
    And I move the mouse pointer to the "HoverElement"
    And I click the "IconRight" button
    And I click the "ChengDuShi" button
    And switch to another window
    And I close all tabs except main tab
    And I wait for "Progress" will be invisible
    Then the page's title will be "仪表盘"
    Then I will see the url contains "globalTimeRange="


  @dashboard @dashboardSmoke
  Scenario: 删除全局时间添加文本输入过滤项
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    When I click the detail which name is "仪表盘事件操作"
    Then I will see the "dashboard.DetailPage" page
    And I click the "settingIcon" button
    And I wait for "FilterAutoRefresh" will be visible
    And I switch the dashboard "OpenEdit" button to "enable"
    And I click the "TimeName" button
    And I click the "DeleteTag" button
    And I wait for "Ensure" will be visible
    And I click the "Ensure" button under some element
    Then I wait for "TimeName" will be invisible
    When I click the "AddEventButton" button
    And I click the "AddFilter" button
    And I set the parameter "FilterTitle" with value "filter"
    And I set the parameter "FilterToken" with value "filter"
    And I set the parameter "FilterField" with value "apache.geo.city"
#    And I set the parameter "FilterDefaultValue" with value "成都市"
    Then I "checked" the checkbox which name is "通用配置"
    Then I click the "Ensure" button
    Then I wait for "FilterName" will be visible

  @dashboard @dashboardSmoke
  Scenario: 管理本页过滤项/输入项 数值 RZY-3626,RZY-320
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "仪表盘事件操作"
    Then I will see the "dashboard.DetailPage" page
    And I wait for "Progress" will be invisible
    When the chart title is "通用配置" then I click the button which classname is "yotta-icon yotta-icon-DotEmblemOutlined" in dashboard
    And I click the "DrillSetting" button
    And I wait for "DrillAction" will be visible
    And I choose the "管理本页过滤项/输入项数值" from the "DrillAction"
    And I wait for "1000" millsecond
    And I click the "NewCreat" button
    And I set the parameter "TokenInput" with value "filter"
    And I click the "ParamValue1" button
    And I click the "ClickValue1" button
    And I click the "Ensure" button
    And I wait for "500" millsecond
#    And I wait for "HoverElement" will be visible
#    And I click the "HoverElement" button
    And I move the mouse pointer to the "HoverElement"
    And I click the "IconRight" button
    And I click the "ChengDuShi" button
    And I wait for "Progress" will be invisible
    Then I will see the element "FilterInput" value is "成都市"
    And I will see the "shanghai" doesn't exist

  @dashboard @dashboardSmoke
  Scenario: 校验添加名称 RZY-337
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "仪表盘事件操作"
    Then I will see the "dashboard.DetailPage" page
    And I wait for "AddEventButton" will be visible
    When I click the "AddEventButton" button
    And I click the "AddEvent" button
    And I set the parameter "EventName" with value "12345rewqASD?><.¥#@！～哈萨克哈萨克挥洒啊快点好#@！gfds"
    And I set the parameter "Spl" with value "*"
    And I click the "Ensure" button
    Then I will see the success message "添加中，请稍后"

  @cleanDashboard
  Scenario: 删除知识库
    Given open the "knowledge.ListPage" page for uri "/knowledge/"
    Given the data name is "apache" then i click the "删除" button in more menu
    And I wait for "Ensure" will be visible
    When I click the "Ensure" button
    And I will see the success message "删除知识成功"

  @cleanDashboard
  Scenario: 删除字段提取
    Given open the "configs.ListPage" page for uri "/configs/"
    When the data name is "{'column':'1','name':'仪表盘配置字段提取'}" then i click the "删除" button in more menu
    And I wait for "Ensure" will be visible
    And I click the "Ensure" button
    Then I will see the success message "删除成功"

  @dashboard @cleanDashboard
  Scenario: 删除事件操作
    Given open the "event.ListPage" page for uri "/event/action/"
    When the data name is "{'column':'1','name':'仪表盘测试事件列表'}" then i click the "删除" button
    And I wait for "Ensure" will be visible
    And I click the "Ensure" button
    Then I will see the success message "删除事件操作成功"

  @cleanDashboard
  Scenario Outline: 删除仪表盘
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    When the data name is "<name>" then i click the "删除" button in more menu
    And I wait for "Ensure" will be visible
    And I click the "Ensure" button
    And I wait for "500" millsecond
    Then I will see the success message "删除仪表盘成功"

    Examples:
      | name    |
      | 仪表盘事件操作 |

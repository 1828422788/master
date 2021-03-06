@dashboardConfig @dashboardEvent
Feature: 仪表盘1事件列表

  @dashboardConfigSmoke
  Scenario: 新建仪表盘
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    When I click the "Create" button
    And I set the parameter "DashBoardName" with value "仪表盘事件操作"
    And I click the "Ensure" button
    Then I will see the success message "新建仪表盘成功"

  @dashboardConfigSmoke
  Scenario Outline: 新建标签页
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "<name>"
    And switch to window "仪表盘"
    And I close all tabs except main tab
    Then I will see the "dashboard.DetailPage" page
    When I set the parameter "TagName" with value "事件操作"
    And I click the "Ensure" button
    Then I wait for "SettingIcon" will be visible

    Examples:
      | name    |
      | 仪表盘事件操作 |

  @dashboardConfigSmoke
  Scenario: 添加事件列表 RZY-3389,RZY-339
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "仪表盘事件操作"
    And switch to window "仪表盘"
    And I close all tabs except main tab
    Then I will see the "dashboard.DetailPage" page
    And I click the "SettingIcon" button
    And I switch the dashboard "OpenEdit" button to "enable"
    And I click the "SettingIcon" button
    And I wait for "SuccessMessage" will be invisible
    And I choose the "添加事件列表" from the "AddItemMenu"
    And I set the parameter "EventName" with value "测试事件操作"
    And I set the parameter "Spl" with value "appname:apache"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "Ensure" button
    Then I wait for "SuccessMessage" will be visible

  @dashboardConfigSmoke
  Scenario: 添加事件操作
    Given open the "event.ListPage" page for uri "/event/action/"
    When I click the "Create" button
    Then I will see the "event.CreatePage" page
    And I set the parameter "Name" with value "仪表盘测试事件列表"
    And I set the parameter "Url" with value "/trend/"
    And I click the "CreateButton" button
    Then I will see the message "提交事件操作成功"

  @dashboardConfigSmoke
  Scenario: 验证事件操作 RZY-338
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "仪表盘事件操作"
    And switch to window "仪表盘"
    And I close all tabs except main tab
    Then I will see the "dashboard.DetailPage" page
    And I click the "SettingIcon" button
    And I switch the dashboard "OpenEdit" button to "enable"
    And I click the "SettingIcon" button
    And I wait for "SuccessMessage" will be invisible
    And I click the "EventOperate" button
    And I click the "Event" button
    And switch to another window
    And I close all tabs except main tab
    Then the page's title will be "趋势图列表"

  @dashboardConfigSmoke
  Scenario: 修改事件操作 RZY-3291,RZY-3289
    Given open the "event.ListPage" page for uri "/event/action/"
    And I wait for loading invisible
    When the data name is "{'column':'1','name':'仪表盘测试事件列表'}" then i click the "编辑" button
    Then I will see the "event.CreatePage" page
    And I set the parameter "Field" with value "appname"
    And I choose the "两者" from the "Display"
    And I click the "Save" button
    Then I will see the message "提交事件操作成功"

  @dashboardConfigSmoke
  Scenario: 验证事件操作显示于两者 RZY-3291,RZY-3288
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "仪表盘事件操作"
    And switch to window "仪表盘"
    And I close all tabs except main tab
    Then I will see the "dashboard.DetailPage" page
    And I click the "SettingIcon" button
    And I switch the dashboard "OpenEdit" button to "enable"
    And I click the "SettingIcon" button
    And I wait for "SuccessMessage" will be invisible
    And I click the "EventOperate" button
    And I click the "Event" button
    And switch to another window
    And I close all tabs except main tab
    Then the page's title will be "趋势图列表"

  @dashboardConfigSmoke
  Scenario: 验证事件操作显示于两者
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "仪表盘事件操作"
    And switch to window "仪表盘"
    And I close all tabs except main tab
    Then I will see the "dashboard.DetailPage" page
    And I click the "SettingIcon" button
    And I switch the dashboard "OpenEdit" button to "enable"
    And I click the "SettingIcon" button
    And I wait for "SuccessMessage" will be invisible
    And I click the "HoverElement" button
    And I click the "IconRight" button
    And I click the "EventAppname" button
    And I click the "Event" button
    And switch to another window
    And I close all tabs except main tab
    Then the page's title will be "趋势图列表"

  @dashboardConfigSmoke
  Scenario: 修改事件操作显示于字段 RZY-3628,RZY-3290
    Given open the "event.ListPage" page for uri "/event/action/"
    And I wait for loading invisible
    When the data name is "{'column':'1','name':'仪表盘测试事件列表'}" then i click the "编辑" button
    Then I will see the "event.CreatePage" page
    And I set the parameter "Field" with value "appname"
    And I choose the "字段菜单" from the "Display"
    And I click the "Save" button
    Then I will see the message "提交事件操作成功"

  @dashboardConfigSmoke
  Scenario: 验证事件操作显示于字段 RZY-3628,RZY-3290
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "仪表盘事件操作"
    And switch to window "仪表盘"
    And I close all tabs except main tab
    Then I will see the "dashboard.DetailPage" page
    And I click the "SettingIcon" button
    And I switch the dashboard "OpenEdit" button to "enable"
    And I click the "SettingIcon" button
    And I wait for "SuccessMessage" will be invisible
    And I click the "EventOperate" button
    Then I will see the "Event" doesn't exist

  @dashboardConfigSmoke
  Scenario: 验证事件操作显示于字段 RZY-3628,RZY-3290
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "仪表盘事件操作"
    And switch to window "仪表盘"
    And I close all tabs except main tab
    Then I will see the "dashboard.DetailPage" page
    And I click the "SettingIcon" button
    And I switch the dashboard "OpenEdit" button to "enable"
    And I click the "SettingIcon" button
    And I wait for "SuccessMessage" will be invisible
    And I click the "HoverElement" button
    And I click the "IconRight" button
    And I click the "EventAppname" button
    And I click the "Event" button
    And switch to another window
    And I close all tabs except main tab
    Then the page's title will be "趋势图列表"

  @dashboardConfigSmoke
  Scenario: 修改事件操作动作类型为搜索
    Given open the "event.ListPage" page for uri "/event/action/"
    And I wait for loading invisible
    When the data name is "{'column':'1','name':'仪表盘测试事件列表'}" then i click the "编辑" button
    Then I will see the "event.CreatePage" page
    And I wait for loading invisible
    And I choose the "搜索" from the "Action"
    And I set the parameter "Spl" with value "appname:${appname}"
    And I click the "Save" button
    Then I will see the message "提交事件操作成功"

  Scenario Outline: 验证事件操作动作类型为搜索
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "仪表盘事件操作"
    And switch to window "仪表盘"
    And I close all tabs except main tab
    Then I will see the "dashboard.DetailPage" page
    And I click the "SettingIcon" button
    And I switch the dashboard "OpenEdit" button to "enable"
    And I click the "SettingIcon" button
    And I wait for "SuccessMessage" will be invisible
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

  Scenario: 实时查看 RZY-3409
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "仪表盘事件操作"
    And switch to window "仪表盘"
    And I close all tabs except main tab
    Then I will see the "dashboard.DetailPage" page
    And I click the "SettingIcon" button
    And I switch the dashboard "OpenEdit" button to "enable"
    And I click the "SettingIcon" button
    And I wait for "SuccessMessage" will be invisible
    And I click the "HoverElement" button
    And I click the "EventOperate" button
    And I click the "RealTime" button
    And switch to another window
    And I close all tabs except main tab
    And I will see the "splSearch.SearchPage" page
    Then I will see the "TimeRange" result will be "30秒窗口"
    
  Scenario: 配置字段提取 RZY-3412
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "仪表盘事件操作"
    And switch to window "仪表盘"
    And I close all tabs except main tab
    Then I will see the "dashboard.DetailPage" page
    And I click the "SettingIcon" button
    And I switch the dashboard "OpenEdit" button to "enable"
    And I click the "SettingIcon" button
    And I wait for "SuccessMessage" will be invisible
    And I click the "EventOperate" button
    And I click the "CreateConfig" button
    And switch to another window
    And I close all tabs except main tab
    Then I will see the "configs.CreatePage" page
    And I wait for loading invisible
    And I click the "AddRule" button
    And I choose the "手机号码解析" from the "ParseRule"
    And I choose the "raw_message" from the "SourceField"
    And I click the "EnsureAddParseRule" button
    And I click the "NextButton" button
    When I set the parameter "Name" with value "仪表盘配置字段提取"
    And I set the parameter "Logtype" with value "other"
    And I click the "Done" button
    And I will see the element "ResultMessage" contains "新建成功"
    
  Scenario: 添加到知识库 RZY-3413
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "仪表盘事件操作"
    And switch to window "仪表盘"
    And I close all tabs except main tab
    Then I will see the "dashboard.DetailPage" page
    And I click the "SettingIcon" button
    And I switch the dashboard "OpenEdit" button to "enable"
    And I click the "SettingIcon" button
    And I wait for "SuccessMessage" will be invisible
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

  Scenario: 通用配置 RZY-3619
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "仪表盘事件操作"
    And switch to window "仪表盘"
    And I close all tabs except main tab
    Then I will see the "dashboard.DetailPage" page
    And I click the "SettingIcon" button
    And I switch the dashboard "OpenEdit" button to "enable"
    And I click the "SettingIcon" button
    And I wait for "SuccessMessage" will be invisible
    When the chart title is "测试事件操作" then I click the button which classname is "yotta-icon yotta-icon-DotEmblem" in dashboard
    And I click the "Configs" button
    And I wait for loading invisible
    And I set the parameter "ChartTitle" with value "通用配置"
    And I set the parameter "Spl" with value "'apache.geo.city': 成都市"
    And I click the "OpenInSearch" button
    And switch to another window
    Then I will see the "splSearch.SearchPage" page
    Then I will see the element "SearchInput" name is "'apache.geo.city': 成都市"
    And I will see the element "TimeRange" contains "今天"
    And switch to another window
    And I close all tabs except main tab
    Then I will see the "dashboard.DetailPage" page
    And I set the parameter "ChartDesc" with value "测试描述"
    And I click the "Ensure" button
    And I click the "CustomTitle" button
    And I wait for loading invisible
    And I move the mouse pointer to the "Describe"
    Then I will see the text "测试描述" exist in page

  Scenario Outline: 高级编辑 RZY-3620
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "<name>"
    And switch to window "仪表盘"
    And I close all tabs except main tab
    Then I will see the "dashboard.DetailPage" page
    And I click the "SettingIcon" button
    And I switch the dashboard "OpenEdit" button to "enable"
    And I click the "SettingIcon" button
    And I wait for "SuccessMessage" will be invisible
    When the chart title is "通用配置" then I click the button which classname is "yotta-icon yotta-icon-DotEmblem" in dashboard
    And I click the "Edit" button
    Then I will see the "TextLayer" result will be "<json>"

    Examples:
      | name        | json                                                                                                                                                                                                                          |
      | 仪表盘事件操作 | {\n  "title": "通用配置",\n  "description": "测试描述",\n  "x": 0,\n  "y": 0,\n  "w": 12,\n  "h": 6,\n  "search": {\n    "query": "'apache.geo.city': 成都市",\n    "startTime": "now/d",\n    "endTime": "now"\n  }\n} |


  Scenario: 开启钻取配置
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "仪表盘事件操作"
    And switch to window "仪表盘"
    And I close all tabs except main tab
    Then I will see the "dashboard.DetailPage" page
    And I click the "SettingIcon" button
    And I switch the dashboard "OpenDrilldown" button to "enable"
    And I wait for element "SuccessMessage" change text to "钻取功能已启用"

  Scenario: 跳转到搜索页1 RZY-3622
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "仪表盘事件操作"
    And switch to window "仪表盘"
    And I close all tabs except main tab
    Then I will see the "dashboard.DetailPage" page
    And I click the "SettingIcon" button
    And I switch the dashboard "OpenEdit" button to "enable"
    And I click the "SettingIcon" button
    And I wait for "SuccessMessage" will be invisible
    When the chart title is "通用配置" then I click the button which classname is "yotta-icon yotta-icon-DotEmblem" in dashboard
    And I click the "DrillSetting" button
    And I choose the "跳转到搜索页" from the "DrillAction"
    And I "checked" the checkbox which name is "在浏览器新标签页中打开"
    And I click the "Ensure" button
    And I wait for "SuccessMessage" will be invisible
    And I move the mouse pointer to the "HoverElement"
    And I click the "IconRight" button
    And I click the Element with text "成都市"
    And switch to another window
    And I close all tabs except main tab
    And I will see the "splSearch.SearchPage" page
    Then I will see the "SearchInput" result will be "apache.geo.city:成都市 AND 'apache.geo.city':成都市"

  Scenario: 跳转到搜索页2 RZY-3622
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "仪表盘事件操作"
    And switch to window "仪表盘"
    And I close all tabs except main tab
    Then I will see the "dashboard.DetailPage" page
    And I click the "SettingIcon" button
    And I switch the dashboard "OpenEdit" button to "enable"
    And I click the "SettingIcon" button
    And I wait for "SuccessMessage" will be invisible
    When the chart title is "通用配置" then I click the button which classname is "yotta-icon yotta-icon-DotEmblem" in dashboard
    And I click the "DrillSetting" button
    And I choose the "跳转到搜索页" from the "DrillAction"
    And I click the "Custom" button
    And I set the parameter "Spl" with value "* | stats count() by appname"
    And I click the "DateEditor" button
    And I click the "Shortcut" button
    And I click the "WholeTime" button
    And I "checked" the checkbox which name is "在浏览器新标签页中打开"
    And I click the "Ensure" button
    And I wait for "SuccessMessage" will be invisible
    And I move the mouse pointer to the "HoverElement"
    And I click the "IconRight" button
    And I click the Element with text "成都市"
    And switch to another window
    And I close all tabs except main tab
    And I will see the "splSearch.SearchPage" page
    Then I will see the "SearchInput" result will be "* | stats count() by appname"
    Then I will see the "TimeRange" result will be "所有时间"

  Scenario Outline: 在新标签跳转到自定义URL RZY-3625
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "仪表盘事件操作"
    And switch to window "仪表盘"
    And I close all tabs except main tab
    Then I will see the "dashboard.DetailPage" page
    And I click the "SettingIcon" button
    And I switch the dashboard "OpenEdit" button to "enable"
    And I click the "SettingIcon" button
    And I wait for "SuccessMessage" will be invisible
    When the chart title is "通用配置" then I click the button which classname is "yotta-icon yotta-icon-DotEmblem" in dashboard
    And I click the "DrillSetting" button
    And I choose the "跳转到自定义URL" from the "DrillAction"
    And I set the parameter "Url" with value "<url>"
    And I "checked" the checkbox which name is "在浏览器新标签页中打开"
    And I click the "Ensure" button
    And I wait for "SuccessMessage" will be invisible
    And I move the mouse pointer to the "HoverElement"
    And I click the "IconRight" button
    And I click the Element with text "成都市"
    And switch to another window
    And I close all tabs except main tab
    Then the page's title will be "<title>"

    Examples:
      | url                    | title     |
      | https://www.baidu.com/ | 百度一下，你就知道 |


  Scenario: 新建全局时间选择器
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    When I click the detail which name is "仪表盘事件操作"
    And switch to window "仪表盘"
    And I close all tabs except main tab
    Then I will see the "dashboard.DetailPage" page
    And I click the "SettingIcon" button
    And I switch the dashboard "OpenEdit" button to "enable"
    And I click the "SettingIcon" button
    And I wait for "SuccessMessage" will be invisible
    And I choose the "添加输入项" from the "AddItemMenu"
    And I set the parameter "FilterTitle" with value "全局时间"
    And I choose the "时间范围" from the "FilterType"
    And I click the "FilterDateEditor" button
    And I click the "Shortcut" button
    And I click the "Today" button
    Then I "checked" the checkbox which name is "设为全局时间"
    And I click the "Ensure" button
    And I wait for element "SuccessMessage" change text to "添加输入项成功"

  Scenario: 跳转到标签页 RZY-3802,RZY-3624
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "仪表盘事件操作"
    And switch to window "仪表盘"
    And I close all tabs except main tab
    Then I will see the "dashboard.DetailPage" page
    And I click the "SettingIcon" button
    And I switch the dashboard "OpenEdit" button to "enable"
    And I click the "SettingIcon" button
    And I wait for "SuccessMessage" will be invisible
    When the chart title is "通用配置" then I click the button which classname is "yotta-icon yotta-icon-DotEmblem" in dashboard
    And I click the "DrillSetting" button
    And I choose the "跳转到标签页" from the "DrillAction"
    And I "checked" the checkbox which name is "在浏览器新标签页中打开"
    And I click the "TargetTag" button
    And I click the "TagPageEvent" button
    And I click the "EventOpera" button
    And I click the "TargetParam" button
    And I click the "GlobalTimeRange" button
    And I click the "ParamValue" button
    And I click the "StartEnd" button
    And I click the "Ensure" button
    And I wait for "SuccessMessage" will be invisible
    And I move the mouse pointer to the "HoverElement"
    And I click the "IconRight" button
    And I click the Element with text "成都市"
    And switch to another window
    And I close all tabs except main tab
    And I wait for loading invisible
    Then the page's title will be "仪表盘"
    Then I will see the url contains "globalTimeRange="

  Scenario: 删除全局时间添加文本输入过滤项
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    When I click the detail which name is "仪表盘事件操作"
    And switch to window "仪表盘"
    And I close all tabs except main tab
    Then I will see the "dashboard.DetailPage" page
    And I click the "SettingIcon" button
    And I switch the dashboard "OpenEdit" button to "enable"
    And I wait for "SuccessMessage" will be invisible
    And I click the "TimeName" button
    And I click the "DeleteFilter" button
    And I click the "Ensure" button
    Then I wait for "TimeName" will be invisible
    And I choose the "添加过滤项" from the "AddItemMenu"
    And I set the parameter "FilterTitle" with value "filter"
    And I set the parameter "FilterToken" with value "filter"
    And I set the parameter "FilterField" with value "apache.geo.city"
    Then I "checked" the checkbox which name is "通用配置"
    Then I click the "Ensure" button
    Then I wait for "FilterName" will be visible

  Scenario: 管理本页过滤项/输入项 数值 RZY-3626,RZY-320
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "仪表盘事件操作"
    And switch to window "仪表盘"
    And I close all tabs except main tab
    Then I will see the "dashboard.DetailPage" page
    And I click the "SettingIcon" button
    And I switch the dashboard "OpenEdit" button to "enable"
    And I click the "SettingIcon" button
    And I wait for "SuccessMessage" will be invisible
    When the chart title is "通用配置" then I click the button which classname is "yotta-icon yotta-icon-DotEmblem" in dashboard
    And I click the "DrillSetting" button
    And I choose the "管理本页过滤项/输入项数值" from the "DrillAction"
    And I click the "AddDrilldownFilter" button
    And I set the parameter "TokenInput" with value "filter"
    And I choose the "${click.value}" from the "ParameterValue"
    And I click the "Ensure" button
    And I wait for "SuccessMessage" will be invisible
    And I move the mouse pointer to the "HoverElement"
    And I click the "IconRight" button
    And I click the Element with text "成都市"
    And I wait for loading invisible
    Then I will see the element "FilterInput" value is "成都市"
    And I will see the text "上海市" is not existed in page

  Scenario: 校验添加名称 RZY-337
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "仪表盘事件操作"
    And switch to window "仪表盘"
    And I close all tabs except main tab
    Then I will see the "dashboard.DetailPage" page
    And I click the "SettingIcon" button
    And I switch the dashboard "OpenEdit" button to "enable"
    And I click the "SettingIcon" button
    And I wait for "SuccessMessage" will be invisible
    And I choose the "添加事件列表" from the "AddItemMenu"
    And I set the parameter "EventName" with value "12345rewqASD?><.¥#@！～哈萨克哈萨克挥洒啊快点好#@！gfds"
    And I set the parameter "Spl" with value "*"
    And I click the "Ensure" button
    Then I will see the success message "添加中，请稍后"
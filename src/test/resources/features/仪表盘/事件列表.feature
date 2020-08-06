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
  Scenario: 添加事件列表
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
  Scenario: 验证事件操作
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "仪表盘事件操作"
    Then I will see the "dashboard.DetailPage" page
    And I wait for "Progress" will be invisible
    And I wait for "HoverElement" will be visible
    And I click the "HoverElement" button
    And I click the "EventOperate" button
    And I click the "Event" button
    And switch to another window
    And I close all tabs except main tab
    Then the page's title will be "趋势图"

  @dashboard @dashboardSmoke
  Scenario: 修改事件操作
    Given open the "event.ListPage" page for uri "/event/action/"
    When the data name is "{'column':'1','name':'仪表盘测试事件列表'}" then i click the "编辑" button
    Then I will see the "event.CreatePage" page
    And I set the parameter "Field" with value "appname"
    And I choose the "两者" from the "Display"
    And I click the "Save" button
    And I wait for "Message" will be visible
    Then I will see the message "提交事件操作成功"

  @dashboard @dashboardSmoke
  Scenario: 验证事件操作显示于两者
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "仪表盘事件操作"
    Then I will see the "dashboard.DetailPage" page
    And I wait for "HoverElement" will be visible
    And I click the "HoverElement" button
    And I click the "EventOperate" button
    And I click the "Event" button
    And switch to another window
    And I close all tabs except main tab
    Then the page's title will be "趋势图"

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
    And I click the "EventAppname" button
    And I click the "Event" button
    And switch to another window
    And I close all tabs except main tab
    Then the page's title will be "趋势图"

  @dashboard @dashboardSmoke
  Scenario: 修改事件操作显示于字段
    Given open the "event.ListPage" page for uri "/event/action/"
    When the data name is "{'column':'1','name':'仪表盘测试事件列表'}" then i click the "编辑" button
    Then I will see the "event.CreatePage" page
    And I set the parameter "Field" with value "appname"
    And I choose the "字段菜单" from the "Display"
    And I click the "Save" button
    And I wait for "Message" will be visible
    Then I will see the message "提交事件操作成功"

  @dashboard @dashboardSmoke
  Scenario: 验证事件操作显示于字段
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "仪表盘事件操作"
    Then I will see the "dashboard.DetailPage" page
    And I wait for "Progress" will be invisible
    And I wait for "HoverElement" will be visible
    And I click the "HoverElement" button
    And I click the "EventOperate" button
    And I wait for "1000" millsecond
    Then I will see the "Event" doesn't exist

  @dashboard @dashboardSmoke
  Scenario: 验证事件操作显示于字段
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
    Then the page's title will be "趋势图"

  @dashboard @dashboardSmoke
  Scenario: 修改事件操作动作类型为搜索
    Given open the "event.ListPage" page for uri "/event/action/"
    When the data name is "{'column':'1','name':'仪表盘测试事件列表'}" then i click the "编辑" button
    Then I will see the "event.CreatePage" page
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
  Scenario: 实时查看
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
    Then I will see the input element "TimeRange" value will contains "30秒窗口"

  @dashboard @dashboardSmoke
  Scenario: 配置字段提取
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "仪表盘事件操作"
    Then I will see the "dashboard.DetailPage" page
    And I wait for "Progress" will be invisible
    And I wait for "HoverElement" will be visible
    And I click the "HoverElement" button
    And I click the "EventOperate" button
    And I click the "CreateConfig" button
    And switch to another window
    And I close all tabs except main tab
    Then I will see the "configs.CreatePage" page
    And I wait for element "AppName" value change text to "apache"
    And I click the "AddRule" button
    And I choose the "手机号码解析" from the "ParseRule"
    And I choose the "raw_message" from the "SourceField"
    And I click the "EnsureAddParseRule" button
    And I click the "NextButton" button under some element
    When I set the parameter "Name" with value "仪表盘配置字段提取"
    And I set the parameter "Logtype" with value "other"
    And I click the "Done" button
    Then I wait for "ConfigDone" will be visible

  @dashboard @dashboardSmoke
  Scenario: 添加到知识库
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "仪表盘事件操作"
    Then I will see the "dashboard.DetailPage" page
    And I wait for "Progress" will be invisible
    And I wait for "HoverElement" will be visible
    And I click the "HoverElement" button
    And I click the "EventOperate" button
    And I click the "AddKnowledge" button
    And switch to another window
    And I close all tabs except main tab
    And I will see the "knowledge.CreatePage" page
    And I click the "Next" button
    And I click the "Next" button
    And I wait for element "EventCode" value change text to "apache"
    And I click the "Next" button
    Then I will see the element "SuccessAdd" name is "添加成功"

  @cleanDashboard
  Scenario: 删除知识库
    Given open the "knowledge.ListPage" page for uri "/knowledge/"
    Given the data name is "apache" then i click the "删除" button
    And I wait for "Ensure" will be visible
    When I click the "Ensure" button
    And I will see the success message "删除知识成功"

  @cleanDashboard
  Scenario: 删除字段提取
    Given open the "configs.ListPage" page for uri "/configs/"
    When the data name is "{'column':'1','name':'仪表盘配置字段提取'}" then i click the "删除" button
    And I wait for "Ensure" will be visible
    And I click the "Ensure" button
    Then I will see the success message "删除成功"

  @cleanDashboard
  Scenario: 删除事件操作
    Given open the "event.ListPage" page for uri "/event/action/"
    When the data name is "{'column':'1','name':'仪表盘测试事件列表'}" then i click the "删除" button
    And I wait for "Ensure" will be visible
    And I click the "Ensure" button
    Then I will see the success message "删除事件操作成功"

  @cleanDashboard
  Scenario Outline: 删除仪表盘
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    When the data name is "<name>" then i click the "删除" button
    And I wait for "Ensure" will be visible
    And I click the "Ensure" button
    Then I will see the success message "删除仪表盘成功"

    Examples:
      | name    |
      | 仪表盘事件操作 |

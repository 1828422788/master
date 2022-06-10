@dashboard @dashboardDetails
Feature: 仪表盘03详情页

  @dashboardSmoke
  Scenario Outline: 新建趋势图
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
    And I will see the element "ResultMessage" contains "新建成功"

    Examples:
      | name               | spl                                   |
      | 验证仪表盘全局时间 | tag:sample04061424_chart \|stats count() by 'apache.geo.city' |

  @dashboardSmoke
  Scenario: 新建第一个tag(RZY-3388)
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I set the parameter "TextFilter" with value "FirstAutoTest"
    And I wait for loading invisible
    When I click the detail which name is "FirstAutoTest"
    And switch to window "仪表盘"
    And I close all tabs except main tab
    Then I will see the "dashboard.DetailPage" page
    When I set the parameter "TagName" with value "first"
    And I click the "Ensure" button
    Then I wait for "SettingIcon" will be visible

  @dashboardSmoke
  Scenario: 新建待删除tag(RZY-3390)
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I set the parameter "TextFilter" with value "FirstAutoTest"
    And I wait for loading invisible
    When I click the detail which name is "FirstAutoTest"
    And switch to window "仪表盘"
    And I close all tabs except main tab
    Then I will see the "dashboard.DetailPage" page
    And I click the "ShowDashboards" button
    And I open the context menu of the "{'DashboardName':'FirstAutoTest'}" element
    And I choose the "新建标签页" from the "ContextMenu"
    When I set the parameter "TagName" with value "forDelete"
    And I click the "Ensure" button
    Then I will see the success message "创建标签成功"

  @dashboardSmoke
  Scenario: 编辑tag(RZY-4488)
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I set the parameter "TextFilter" with value "FirstAutoTest"
    And I wait for loading invisible
    When I click the detail which name is "FirstAutoTest"
    And switch to window "仪表盘"
    And I close all tabs except main tab
    Then I will see the "dashboard.DetailPage" page
    And I click the "ShowDashboards" button
    And I open the context menu of the "{'TabName':'forDelete'}" element
    And I choose the "编辑" from the "ContextMenu"
    And I set the parameter "InputforTag" with value "Delete"
    And I click the "Save" button
    Then I will see the success message "标签名称修改成功"

  @dashboardSmoke
  Scenario: 删除tag(RZY-4489)
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I set the parameter "TextFilter" with value "FirstAutoTest"
    And I wait for loading invisible
    When I click the detail which name is "FirstAutoTest"
    And switch to window "仪表盘"
    And I close all tabs except main tab
    Then I will see the "dashboard.DetailPage" page
    And I click the "ShowDashboards" button
    And I open the context menu of the "{'TabName':'Delete'}" element
    And I choose the "删除" from the "ContextMenu"
    And I click the "Ensure" button
    Then I will see the success message "标签页删除成功"

  Scenario: 夜间模式(RZY-237)
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I set the parameter "TextFilter" with value "FirstAutoTest"
    And I wait for loading invisible
    When I click the detail which name is "FirstAutoTest"
    And switch to window "仪表盘"
    And I close all tabs except main tab
    Then I will see the "dashboard.DetailPage" page
    And I click the "SettingIcon" button
    And I switch the dashboard "NightMode" button to "enable"
    Then I will see the success message "夜间模式已启用"
    And I switch the dashboard "NightMode" button to "disable"
    And I wait for element "SuccessMessage" change text to "夜间模式已关闭"

  Scenario: 启用编辑(RZY-228)
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I set the parameter "TextFilter" with value "FirstAutoTest"
    And I wait for loading invisible
    When I click the detail which name is "FirstAutoTest"
    And switch to window "仪表盘"
    And I close all tabs except main tab
    Then I will see the "dashboard.DetailPage" page
    And I click the "SettingIcon" button
    Then I will see the element "EditLayout" attribute "class" is "yotta-menu-item-disabled"
    Then I will see the element "ManualRefresh" attribute "class" is "yotta-menu-item-disabled"
    Then I will see the element "AutoRefresh" attribute "class" is "yotta-menu-item-disabled"
    And I switch the dashboard "OpenEdit" button to "enable"
    Then I will see the success message "编辑功能已启用"

  Scenario: 验证关闭编辑(RZY-229)
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I set the parameter "TextFilter" with value "FirstAutoTest"
    And I wait for loading invisible
    When I click the detail which name is "FirstAutoTest"
    And switch to window "仪表盘"
    And I close all tabs except main tab
    Then I will see the "dashboard.DetailPage" page
    And I wait for "SettingIcon" will be visible
    And I will see the "AddEventButton" doesn't exist
    And I click the "SettingIcon" button
    Then I will see the "EditLayout,RemoveTag,ManualRefresh,AutoRefresh" is "yotta-menu-item-disabled"

  @dashboardSmoke
  Scenario: 新建标签页，验证搜索
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I set the parameter "TextFilter" with value "FirstAutoTest"
    And I wait for loading invisible
    When I click the detail which name is "FirstAutoTest"
    And switch to window "仪表盘"
    And I close all tabs except main tab
    Then I will see the "dashboard.DetailPage" page
    And I click the "ShowDashboards" button
    And I open the context menu of the "{'DashboardName':'FirstAutoTest'}" element
    And I choose the "新建标签页" from the "ContextMenu"
    When I set the parameter "TagName" with value "testSearch"
    And I click the "Ensure" button
    And I wait for "SettingIcon" will be visible

  Scenario: 验证标签搜索
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I set the parameter "TextFilter" with value "FirstAutoTest"
    And I wait for loading invisible
    When I click the detail which name is "FirstAutoTest"
    And switch to window "仪表盘"
    And I close all tabs except main tab
    Then I will see the "dashboard.DetailPage" page
    And I click the "ShowDashboards" button
    And I open the context menu of the "{'TabName':'testSearch'}" element
    And I choose the "设为默认" from the "ContextMenu"
    And I set the parameter "SearchTagInput" with value "Search"
    And I will see the text "first" is not existed in page

  Scenario: 仪表盘搜索，切换 RZY-240
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I set the parameter "TextFilter" with value "FirstAutoTest"
    And I wait for loading invisible
    When I click the detail which name is "FirstAutoTest"
    And switch to window "仪表盘"
    And I close all tabs except main tab
    Then I will see the "dashboard.DetailPage" page
    And I click the "ShowDashboards" button
    And I set the parameter "SearchTagInput" with value "UIautotest"
    And I wait for loading invisible
    And I will see the element "DashboardList" does not contain "FirstAutoTest"
    And I click the "{'DashboardName':'UIautotest'}" button
    And I wait for loading invisible
    Then I will see the url contains "null"

  @dashboardSmoke
  Scenario: 添加趋势图至仪表盘(RZY-3389)
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I set the parameter "TextFilter" with value "FirstAutoTest"
    And I wait for loading invisible
    When I click the detail which name is "FirstAutoTest"
    And switch to window "仪表盘"
    And I close all tabs except main tab
    Then I will see the "dashboard.DetailPage" page
    And I click the "SettingIcon" button
    And I switch the dashboard "OpenEdit" button to "enable"
    And I click the "SettingIcon" button
    And I choose the "添加图表" from the "AddItemMenu"
    And I wait for loading invisible
    And I click the "{'Checkbox':'验证仪表盘全局时间'}" button
    And I click the "Ensure" button
    Then I wait for element "SuccessMessage" change text to "添加成功"

  @dashboardSmoke
  Scenario: 复制标签页(RZY-4484)
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I set the parameter "TextFilter" with value "FirstAutoTest"
    And I wait for loading invisible
    When I click the detail which name is "FirstAutoTest"
    And switch to window "仪表盘"
    And I close all tabs except main tab
    Then I will see the "dashboard.DetailPage" page
    And I click the "SettingIcon" button
    And I switch the dashboard "OpenEdit" button to "enable"
    And I wait for "SuccessMessage" will be invisible
    And I click the Element with text "复制标签页"
    And I wait for "SuccessMessage" will be invisible
    And I wait for "2000" millsecond
    And I click the "ShowDashboards" button
    And I will see the element "DashboardList" contains "testSearch_copy"

  Scenario: 高级编辑
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I set the parameter "TextFilter" with value "FirstAutoTest"
    And I wait for loading invisible
    When I click the detail which name is "FirstAutoTest"
    And switch to window "仪表盘"
    And I close all tabs except main tab
    Then I will see the "dashboard.DetailPage" page
    And I click the "SettingIcon" button
    And I switch the dashboard "OpenEdit" button to "enable"
    And I click the Element with text "高级编辑"
    And I click the "Check" button
    And I wait for element "SuccessMessage" change text to "校验通过"
    And I click the "Ensure" button
    And I wait for element "SuccessMessage" change text to "标签页配置成功"

  @dashboardSmoke
  Scenario: 新建全局时间选择器(RZY-225,RZY-4566)
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I set the parameter "TextFilter" with value "FirstAutoTest"
    And I wait for loading invisible
    When I click the detail which name is "FirstAutoTest"
    And switch to window "仪表盘"
    And I close all tabs except main tab
    Then I will see the "dashboard.DetailPage" page
    And I click the "SettingIcon" button
    And I switch the dashboard "OpenEdit" button to "enable"
    And I click the "SettingIcon" button
    And I wait for "SuccessMessage" will be invisible
    And I choose the "添加输入项" from the "AddItemMenu"
    And I choose the "时间范围" from the "FilterType"
    And I set the parameter "inputSettingTitle" with value "全局时间"
    Then I "checked" the checkbox which name is "设为全局时间"
    And I click the "Ensure" button
    And I wait for "SuccessMessage" will be visible

  Scenario: 验证全局时间生效及打开过滤输入项(RZY-4567,RZY-225,RZY-4638,RZY-3392)
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I set the parameter "TextFilter" with value "FirstAutoTest"
    And I wait for loading invisible
    When I click the detail which name is "FirstAutoTest"
    And switch to window "仪表盘"
    And I close all tabs except main tab
    Then I will see the "dashboard.DetailPage" page
    And I click the "SettingIcon" button
    And I switch the dashboard "OpenEdit" button to "enable"
    And I switch the dashboard "FilterAutoRefresh" button to "enable"
    And I click the "DateEditor" button
    And I click the "Yesterday" button
    And I wait for loading invisible
    Then I will see the "DropdownLink" result will be "昨天"

  Scenario: 关闭过滤输入项自动更新(RZY-4637,)
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I set the parameter "TextFilter" with value "FirstAutoTest"
    And I wait for loading invisible
    When I click the detail which name is "FirstAutoTest"
    And switch to window "仪表盘"
    And I close all tabs except main tab
    Then I will see the "dashboard.DetailPage" page
    And I click the "SettingIcon" button
    And I switch the dashboard "OpenEdit" button to "enable"
    And I switch the dashboard "FilterAutoRefresh" button to "disable"
    And I click the "SettingIcon" button
    And I wait for "Update" will be visible
    And I click the "DateEditor" button
    And I click the "Today" button
    And I will see the "DropdownLink" result will be "最近10分钟"
    And I click the "Update" button
    And I wait for element "DropdownLink" change text to "今天"
    And I click the "SettingIcon" button
    And I switch the dashboard "FilterAutoRefresh" button to "enable"

  @dashboardSmoke
  Scenario: 存为报表(RZY-235)
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I set the parameter "TextFilter" with value "FirstAutoTest"
    And I wait for loading invisible
    When I click the detail which name is "FirstAutoTest"
    And switch to window "仪表盘"
    And I close all tabs except main tab
    Then I will see the "dashboard.DetailPage" page
    And I click the "SettingIcon" button
    And I click the Element with text "保存为"
    And I click the Element with text "存为报表"
    And switch to another window
    And I close all tabs except main tab
    Then I will see the "report.CreatePage" page
    And I set the parameter "Name" with value "仪表盘保存为报表"
    And I choose the "PDF" from the "ReportType"
    And I set the parameter "Hour" with value "11"
    And I set the parameter "Minute" with value "11"
    And I click the "NextButton" button
    Then I will see the text "验证仪表盘全局时间" exist in page
    And I click the "Complete" button
    And I will see the element "ResultMessage" contains "新建成功"
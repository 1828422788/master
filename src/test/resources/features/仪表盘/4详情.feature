@dashboard @dashboardSmoke
Feature: 仪表盘详情页

  Scenario: 新建第一个tag(RZY-3388)
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    When I click the detail which name is "FirstAutoTest"
    Then I will see the "dashboard.DetailPage" page
    When I set the parameter "TagName" with value "first"
    And I click the "EnsureCreateTagButton" button
    And I wait for "1500" millsecond
    And I back to before


  Scenario: 新建待删除tag(RZY-3390)
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    When I click the detail which name is "FirstAutoTest"
    Then I will see the "dashboard.DetailPage" page
    And I wait for "First" will be visible
    And I click the "First" button
    And I wait for "500" millsecond
    And I click the "CreatNewTag" button
    When I set the parameter "TagName" with value "forDelete"
    And I click the "EnsureCreateTagButton" button
    And I wait for "1500" millsecond
    And I back to before

  Scenario: 编辑tag(RZY-4488)
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    When I click the detail which name is "FirstAutoTest"
    Then I will see the "dashboard.DetailPage" page
    And I wait for "First" will be visible
    And I click the "First" button
    And I wait for "500" millsecond
    And I click the "EditTag" button
    And I wait for "InputforTag" will be visible
    And I alter the input element "InputforTag" value to "Delete"
#    And I wait for "500" millsecond
    And I click the "SaveTagInput" button
    And I wait for "500" millsecond
    Then I will see the success message "标签名称修改成功"

  Scenario: 删除tag(RZY-4489)
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    When I click the detail which name is "FirstAutoTest"
    Then I will see the "dashboard.DetailPage" page
    And I wait for "First" will be visible
    And I click the "First" button
    And I wait for "500" millsecond
    And I click the "DeleteNewTag" button
    And I click the "Ensure" button
    And I wait for "1500" millsecond
    Then I will see the success message "标签页删除成功"

  Scenario: 夜间模式(RZY-237)
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    When I click the detail which name is "FirstAutoTest"
    Then I will see the "dashboard.DetailPage" page
    And I click the "SettingIcon" button
    And I switch the dashboard "NightMode" button to "enable"
    And I wait for "SuccessMessage" will be visible
    Then I will see the success message "夜间模式已启用"
    And I wait for "5000" millsecond
    And I switch the dashboard "NightMode" button to "disable"
    And I wait for "SuccessMessage" will be visible
    Then I will see the success message "夜间模式已关闭"
#    And I compare source image "<string>" with target image "<string>"

  Scenario: 关闭编辑(RZY-228)
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    When I click the detail which name is "FirstAutoTest"
    Then I will see the "dashboard.DetailPage" page
    And I click the "SettingIcon" button
    Then I will see the element "EditLayout" attribute "aria-disabled" is "false"
    Then I will see the element "ManualRefresh" attribute "aria-disabled" is "false"
    Then I will see the element "AutoRefresh" attribute "aria-disabled" is "false"
    And I switch the dashboard "OpenEdit" button to "disable"
    And I wait for "SuccessMessage" will be visible
    Then I will see the success message "编辑功能已禁用"

  Scenario: 验证关闭编辑(RZY-229)
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    When I click the detail which name is "FirstAutoTest"
    Then I will see the "dashboard.DetailPage" page
    And I wait for "SettingIcon" will be visible
    And I click the "SettingIcon" button
    Then I will see the "EditLayout,RemoveTag,ManualRefresh,AutoRefresh" is "disabled"

  Scenario: 验证关闭编辑(RZY-229)
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    When I click the detail which name is "FirstAutoTest"
    Then I will see the "dashboard.DetailPage" page
    And I click the "AddEventButton" button
    Then I will see the "LiList" is "disabled"
    And I hide the element "EventList"

  Scenario: 新建标签页，验证搜索
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    When I click the detail which name is "FirstAutoTest"
    Then I will see the "dashboard.DetailPage" page
    And I click the "TagIcon" button
    And I click the "AddTag" button
    When I set the parameter "TagName" with value "testSearch"
    And I click the "EnsureCreateTagButton" button
#    And I set the parameter "TagInput" with value "testSearch"
#    And I click the "SaveTagInput" button

  Scenario: 验证标签搜索
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    When I click the detail which name is "FirstAutoTest"
    Then I will see the "dashboard.DetailPage" page
    And I click the "TagIcon" button
    And I set the parameter "SearchTagInput" with value "Search"
    Then I will see the "FirstTag" doesn't exist
    Then I click the "TestSearch" button

  Scenario: 仪表盘搜索，切换 RZY-240
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    When I click the detail which name is "FirstAutoTest"
    Then I will see the "dashboard.DetailPage" page
    And I click the "DashboardIcon" button
    And I set the parameter "SearchTagInput" with value "UIautotest"
    And I wait for loading invisible
    Then I will see the "FirstAutoTest" doesn't exist
    And I click the "UIAutoTest" button
    And I wait for loading invisible
    Then I will see the url contains "null"

  Scenario Outline: 新建趋势图
    And open the "trend.ListPage" page for uri "/trend/"
    And I click the "CreateButton" button
    And I click the "Create" button
    Then I will see the "trend.CreatePage" page
    And I set the parameter "SearchInput" with value "<spl>"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "FenPianQuYang" button
    And I alter the input element "FenPianQuYang" value to "0"
    And I click the "SearchButton" button
    And I wait for "Header" will be visible
    And I click the "NextButton" button
    And I wait for "Header" will be visible
    And I click the "NextButton" button
    When I set the parameter "NameInput" with value "<name>"
    And I click the "NextButton" button
    And I wait for "SuccessCreate" will be visible

    Examples:
      | name      | spl                                   |
      | 验证仪表盘全局时间 | *\|stats count() by 'apache.geo.city' |

  Scenario: 添加趋势图至仪表盘(RZY-3389)
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    When I click the detail which name is "FirstAutoTest"
    Then I will see the "dashboard.DetailPage" page
    When I click the "AddEventButton" button
    And I click the "AddChart" button
    And I wait for "SpinDot" will be invisible
    And I set the parameter "SearchChartInput" with value "验证仪表盘全局时间"
    And I wait for loading invisible
    And I click the "{'Checkbox':'验证仪表盘全局时间'}" button
    And I click the "Ensure" button
    And I wait for "1000" millsecond

  Scenario: 复制标签页(RZY-4484)
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    When I click the detail which name is "FirstAutoTest"
    Then I will see the "dashboard.DetailPage" page
    And I wait for "SettingIcon" will be visible
    And I click the "SettingIcon" button
    And I click the "CopyTag" button
    And I wait for "3000" millsecond
    And I click the "TagIcon" button
    And I wait for "LastTag" will be visible
    Then I will see the element "LastTag" value is "testSearch_copy"

  Scenario: 高级编辑
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    When I click the detail which name is "FirstAutoTest"
    Then I will see the "dashboard.DetailPage" page
    And I wait for "SettingIcon" will be visible
    And I click the "SettingIcon" button
    And I click the "SuperEdit" button
    And I click the "Check" button
    And I wait for "500" millsecond
    Then I will see the success message "校验通过"
    And I click the "Ensure" button
    And I wait for loading invisible
    And I wait for "1500" millsecond
    Then I will see the "TrendTitle" result will be "验证仪表盘全局时间"

  Scenario: 新建全局时间选择器(RZY-225,RZY-4566)
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    When I click the detail which name is "FirstAutoTest"
    Then I will see the "dashboard.DetailPage" page
    And I click the "AddIcon" button
    And I click the "addInput" button
    And I set the parameter "inputSettingTitle" with value "全局时间"
    And I wait for "500" millsecond
    And I click the "inputSettingType" button

#    And I choose the "时间范围" from the "LastDropdownList"
    And I click the "timeRangee" button
    Then I wait for "setGlobalTimeRange" will be visible
    And I click the "setGlobalTimeRange" button
    And I click the "Ensure" button
    And I wait for "SuccessMessage" will be visible
    Then I will see the success message "添加输入项成功"


  Scenario: 验证全局时间生效及打开过滤输入项(RZY-4567,RZY-225,RZY-4638,RZY-3392)
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    When I click the detail which name is "FirstAutoTest"
    Then I will see the "dashboard.DetailPage" page
    And I click the "settingIcon" button
    And I wait for "FilterAutoRefresh" will be visible
    And I switch the dashboard "FilterAutoRefresh" button to "enable"
    And I click the "DateEditor" button under some element
    And I click the "Shortcut" button
    And I click the "Yesterday" button
    And I wait for "Progress" will be invisible
    Then I will see the "DropdownLink" result will be "昨天"

  Scenario: 关闭过滤输入项自动更新(RZY-4637,)
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    When I click the detail which name is "FirstAutoTest"
    Then I will see the "dashboard.DetailPage" page
    And I click the "settingIcon" button
    And I wait for "FilterAutoRefresh" will be visible
    And I switch the dashboard "FilterAutoRefresh" button to "disable"
    And I wait for "Update" will be visible
    And I click the "DateEditor" button under some element
    And I click the "Shortcut" button
    And I click the "Today" button
#    And I wait for "Progress" will be invisible
    And I will see the "DropdownLink" result will be "最近1天"
    And I click the "Update" button
    And I wait for "Progress" will be invisible
    Then I will see the "DropdownLink" result will be "今天"
    And I click the "settingIcon" button
    And I wait for "FilterAutoRefresh" will be visible
    And I switch the dashboard "FilterAutoRefresh" button to "enable"

  Scenario: 存为报表(RZY-235)
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    When I click the detail which name is "FirstAutoTest"
    Then I will see the "dashboard.DetailPage" page
    And I click the "SettingIcon" button
    And I click the "SaveAs" button
    And I click the "SaveAsReport" button
    And switch to another window
    And I close all tabs except main tab
    Then I will see the "report.CreatePage" page
    And I set the parameter "Name" with value "仪表盘保存为报表"
    And I choose the "PDF" from the "ReportType"
    And I set the parameter "Subject" with value "test"
    And I set the parameter "Hour" with value "11"
    And I set the parameter "Minute" with value "11"
    And I click the "NextButton" button
    Then I will see the "TopoTitle" result will be "1验证仪表盘全局时间"
    And I click the "Save" button
    And I wait for "SuccessMessage" will be visible
    Then I will see the success message "保存成功"

  Scenario: 删除全局时间 RZY-4570
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    When I click the detail which name is "FirstAutoTest"
    Then I will see the "dashboard.DetailPage" page
    And I click the "settingIcon" button
    And I wait for "FilterAutoRefresh" will be visible
    And I switch the dashboard "OpenEdit" button to "enable"
    And I click the "TimeName" button
    And I click the "deleteTimeTag" button
    And I wait for "Ensure" will be visible
    And I click the "Ensure" button under some element
    Then I wait for "TimeName" will be invisible

  @cleanDashboard
  Scenario Outline: 删除验证仪表盘全局时间趋势图
    Given open the "trend.ListPage" page for uri "/trend/"
    When the data name is "<name>" then i click the "删除" button
    And I wait for "Ensure" will be visible
    And I click the "Ensure" button
    And I wait for "500" millsecond
    And I will see the success message "删除成功"

    Examples:
      | name   |
      | 验证仪表盘全局时间 |


  Scenario Outline: 删除报表
    When open the "report.ListPage" page for uri "/reports/"
    And I set the parameter "SearchInput" with value "<name>"
    And I wait for loading invisible
    And the data name is "{'column':'1','name':'<name>'}" then i click the "删除" button
    And I wait for "EnsureButton" will be visible
    When I click the "EnsureButton" button
    And I wait for "Message" will be visible
    Then I wait for element "Message" change text to "删除成功"

    Examples:
      | name     |
      | 仪表盘保存为报表 |

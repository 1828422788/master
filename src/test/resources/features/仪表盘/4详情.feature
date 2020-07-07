@dashboard @dashboardSmoke
Feature: 仪表盘详情页

  Scenario: 新建第一个tag
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    When I click the detail which name is "FirstAutoTest"
    Then I will see the "dashboard.DetailPage" page
    When I set the parameter "TagName" with value "first"
    And I click the "EnsureCreateTagButton" button

  Scenario: 关闭编辑
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    When I click the detail which name is "FirstAutoTest"
    Then I will see the "dashboard.DetailPage" page
    And I click the "SettingIcon" button
    And I click the "OpenEdit" button
    And I wait for "SuccessMessage" will be visible
    Then I will see the success message "编辑功能已禁用"

  Scenario: 验证关闭编辑
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    When I click the detail which name is "FirstAutoTest"
    Then I will see the "dashboard.DetailPage" page
    And I wait for "SettingIcon" will be visible
    And I click the "SettingIcon" button
    Then I will see the "EditLayout,RemoveTag,ManualRefresh,AutoRefresh" is "disabled"

  Scenario: 验证关闭编辑
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
    And I set the parameter "TagInput" with value "testSearch"
    And I click the "SaveTagInput" button

  Scenario: 验证标签搜索
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    When I click the detail which name is "FirstAutoTest"
    Then I will see the "dashboard.DetailPage" page
    And I click the "TagIcon" button
    And I set the parameter "SearchTagInput" with value "Search"
    Then I will see the "FirstTag" doesn't exist
    Then I click the "TestSearch" button

  Scenario: 仪表盘搜索
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    When I click the detail which name is "FirstAutoTest"
    Then I will see the "dashboard.DetailPage" page
    And I click the "DashboardIcon" button
    And I set the parameter "SearchTagInput" with value "UIautotest"
    And I wait for loading invisible
    Then I will see the "FirstAutoTest" doesn't exist
    Then I click the "UIAutoTest" button

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
    And I click the "NextButton" button
    And I wait for "Header" will be visible
    And I click the "NextButton" button
    When I set the parameter "NameInput" with value "<name>"
    And I click the "NextButton" button
    And I wait for "SuccessCreate" will be visible

    Examples:
      | name      | spl                                   |
      | 验证仪表盘全局时间 | *\|stats count() by 'apache.geo.city' |

  Scenario: 添加趋势图至仪表盘
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    When I click the detail which name is "FirstAutoTest"
    Then I will see the "dashboard.DetailPage" page
    When I click the "AddEventButton" button
    And I click the "AddChart" button
    And I set the parameter "SearchChartInput" with value "验证仪表盘全局时间"
    And I click the "{'Checkbox':'验证仪表盘全局时间'}" button
    And I click the "Ensure" button

  Scenario: 验证全局时间生效
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    When I click the detail which name is "FirstAutoTest"
    Then I will see the "dashboard.DetailPage" page
    And I click the "SettingIcon" button
    And I click the "ShowFilter" button
    And I click the "DateEditor" button
    And I click the "Shortcut" button
    And I click the "Yesterday" button
    And I wait for "Progress" will be invisible
    Then I will see the "DropdownLink" result will be "昨天"

  Scenario: 存为报表
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

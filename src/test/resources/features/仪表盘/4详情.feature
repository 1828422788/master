@dashboard @dashboardSmoke
Feature: 仪表盘详情页

  Background:
    Given open the "dashboard.ListPage" page for uri "/dashboard/"

  Scenario: 新建第一个tag
    When I click the detail which name is "FirstAutoTest"
    Then I will see the "dashboard.DetailPage" page
    When I set the parameter "TagName" with value "first"
    And I click the "EnsureCreateTagButton" button

  Scenario: 关闭编辑
    When I click the detail which name is "FirstAutoTest"
    Then I will see the "dashboard.DetailPage" page
    And I click the "SettingIcon" button
    And I click the "OpenEdit" button
    Then I will see the success message "编辑功能已禁用"

  Scenario: 验证关闭编辑（少一个自动刷新后的switch button未验证）
    When I click the detail which name is "FirstAutoTest"
    Then I will see the "dashboard.DetailPage" page
    And I click the "AddEventButton" button
    Then I will see the "LiList" is "disabled"
    And I hide the element "EventList"
    And I click the "SettingIcon" button
    Then I will see the "EditLayout,RemoveTag,ManualRefresh,AutoRefresh" is "disabled"

  Scenario: 新建标签页，验证搜索
    When I click the detail which name is "FirstAutoTest"
    Then I will see the "dashboard.DetailPage" page
    And I click the "TagIcon" button
    And I click the "AddTag" button
    And I set the parameter "TagInput" with value "testSearch"
    And I click the "SaveTagInput" button

  Scenario: 验证标签搜索
    When I click the detail which name is "FirstAutoTest"
    Then I will see the "dashboard.DetailPage" page
    And I click the "TagIcon" button
    And I set the parameter "SearchTagInput" with value "Search"
    Then I will see the "FirstTag" doesn't exist
    Then I click the "TestSearch" button

  Scenario: 仪表盘搜索
    When I click the detail which name is "FirstAutoTest"
    Then I will see the "dashboard.DetailPage" page
    And I click the "DashboardIcon" button
    And I set the parameter "SearchTagInput" with value "UIautotest"
    Then I will see the "FirstAutoTest" doesn't exist
    Then I click the "UIAutoTest" button
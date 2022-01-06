@dashboard34 @dashboardinput
Feature: 仪表盘输入项联动
  
  Background:
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for "2000" millsecond
    
  @dashboard34a
  Scenario: 新建仪表盘
    When I click the "Create" button
    And I set the parameter "DashBoardName" with value "仪表盘输入项联动"
    And I click the "Ensure" button
    And I wait for "SuccessMessage" will be visible
    Then I will see the success message "新建仪表盘成功"

  @dashboard34b
  Scenario Outline: 新建标签页
    And I click the detail which name is "<name>"
    And switch to window "仪表盘"
    And I close all tabs except main tab
    Then I will see the "dashboard.DetailPage" page
    When I set the parameter "TagName" with value "输入项联动"
    And I click the "Ensure" button
    And I wait for loading complete
    And I back to before

    Examples:
      | name     |
      | 仪表盘输入项联动 |

  @dashboard34c
  Scenario Outline: 添加下拉菜单输入项
    And I click the detail which name is "仪表盘输入项联动"
    And switch to window "仪表盘"
    And I close all tabs except main tab
    Then I will see the "dashboard.DetailPage" page
    When I click the "AddEventButton" button
    And I click the "AddInput" button
    And I set the parameter "FilterTitle" with value "<name>"
    And I set the parameter "FilterToken" with value "<name>"
    And I choose the "下拉菜单" from the "InputType"
    And I wait for "1000" millsecond
    And I click the "SingleChoice" button
    And I set the parameter "ChoiceValue" with value "json"
    And I click the "AddChoiceValueButton" button
    And I set the parameter "ChoiceValue" with value "apache"
    And I click the "AddChoiceValueButton" button
    And I set the parameter "ChoiceValue" with value "other"
    And I click the "AddChoiceValueButton" button
    And I choose the "apache" from the "DefaultDropdownList"
    And I wait for "1000" millsecond
    Then I click the "Ensure" button

    Examples:
      | name |
      | f1   |

  @dashboard34d
  Scenario: 添加动态菜单输入项
    And I click the detail which name is "仪表盘输入项联动"
    And switch to window "仪表盘"
    And I close all tabs except main tab
    Then I will see the "dashboard.DetailPage" page
    When I click the "AddEventButton" button
    And I click the "AddInput" button
    And I set the parameter "FilterTitle" with value "f2"
    And I set the parameter "FilterToken" with value "f2"
    And I choose the "动态菜单" from the "InputType"
    And I wait for "1000" millsecond
    And I click the "SingleChoice" button
    And I set the parameter "DynamicField" with value "hostname"
    And I set the parameter "Spl" with value "logtype:${f1} | stats count() by hostname"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchFilterButton" button under some element
    And I wait for loading invisible
    Then I click the "Ensure" button

  @dashboard34e
  Scenario: 添加事件列表
    And I click the detail which name is "仪表盘输入项联动"
    And switch to window "仪表盘"
    And I close all tabs except main tab
    Then I will see the "dashboard.DetailPage" page
    And I wait for "AddEventButton" will be visible
    When I click the "AddEventButton" button
    And I click the "AddEvent" button
    And I set the parameter "EventName" with value "测试输入项联动"
    And I set the parameter "Spl" with value "logtype:${f1} AND hostname:${f2}"
    And I click the "DateEditor" button
    And I click the "Today" button
    Then I click the "Ensure" button

  @rzy3635
  Scenario: 验证 RZY-3635
    And I set the parameter "SearchInput" with value "仪表盘输入项联动"
    And I wait for "2000" millsecond
    And I click the detail which name is "仪表盘输入项联动"
    And switch to window "仪表盘"
    And I close all tabs except main tab
    Then I will see the "dashboard.DetailPage" page
    And I click the "settingIcon" button
    And I wait for "FilterAutoRefresh" will be visible
    And I switch the dashboard "FilterAutoRefresh" button to "disable"
    And I click the "LastFilterSpan" button
    And I set the parameter "LastFilterInput" with value "192.168.1.183"
    And I click the "LastFilter" button
    And I wait for "1000" millsecond
    And I click the "Update" button
    And I wait for loading invisible
    When the chart title is "测试输入项联动" then I click the button which classname is "yotta-icon yotta-icon-DotEmblem" in dashboard
    And I click the "Configs" button
    And I wait for "5000" millsecond
    And I click the "OpenInSearch" button
    And switch to another window
    And I close all tabs except main tab
    Then I will see the "splSearch.SearchPage" page
    Then I will see the element "SearchInput" name is "logtype:apache AND hostname:192.168.1.183"


  Scenario: 添加输入项
    And I click the detail which name is "仪表盘输入项联动"
    And switch to window "仪表盘"
    And I close all tabs except main tab
    Then I will see the "dashboard.DetailPage" page
    When I click the "AddEventButton" button
    And I click the "AddInput" button
    And I set the parameter "FilterTitle" with value "filter"
    And I set the parameter "FilterToken" with value "filter"
    Then I click the "Ensure" button
    Then I wait for "FilterName" will be visible


  Scenario: 修改搜索语句
    And I click the detail which name is "仪表盘输入项联动"
    And switch to window "仪表盘"
    And I close all tabs except main tab
    Then I will see the "dashboard.DetailPage" page
    And I wait for "500" millsecond
    When the chart title is "测试输入项联动" then I click the button which classname is "yotta-icon yotta-icon-DotEmblem" in dashboard
    And I click the "Configs" button
    And I wait for "Spl" will be visible
    And I set the parameter "Spl" with value "${filter|e}"
    And I click the "Ensure" button
    And I wait for "500" millsecond
    Then I will see the success message "配置成功"


  Scenario: 验证支持token filter RZY-3530
    And I click the detail which name is "仪表盘输入项联动"
    And switch to window "仪表盘"
    And I close all tabs except main tab
    Then I will see the "dashboard.DetailPage" page
    And I set the parameter "FilterInput" with value "a+b"
    And I click the "Update" button
    And I wait for "500" millsecond
    When the chart title is "测试输入项联动" then I click the button which classname is "yotta-icon yotta-icon-DotEmblem" in dashboard
    And I click the "Configs" button
    And I wait for "OpenInSearch" will be visible
    And I click the "OpenInSearch" button
    And switch to another window
    And I close all tabs except main tab
    Then I will see the "splSearch.SearchPage" page
    Then I will see the element "SearchInput" name is "a\+b"

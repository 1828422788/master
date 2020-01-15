Feature: 仪表盘输入项联动

  Scenario: 新建仪表盘
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    When I click the "Create" button
    And I set the parameter "DashBoardName" with value "仪表盘输入项联动"
    And I click the "Ensure" button
    Then I will see the success message "新建成功"

  Scenario Outline: 新建标签页
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I click the detail which name is "<name>"
    Then I will see the "dashboard.DetailPage" page
    When I set the parameter "TagName" with value "输入项联动"
    And I click the "EnsureCreateTagButton" button
    And I wait for loading complete

    Examples:
      | name     |
      | 仪表盘输入项联动 |

  Scenario Outline: 添加下拉菜单输入项
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I click the detail which name is "仪表盘输入项联动"
    Then I will see the "dashboard.DetailPage" page
    When I click the "AddEventButton" button
    And I choose the "添加输入项" from the "EventList"
    And I set the parameter "FilterTitle" with value "<name>"
    And I set the parameter "FilterToken" with value "<name>"
    And I choose the "下拉菜单" from the "InputType"
    And I click the "SingleChoice" button
    And I set the parameter "ChoiceValue" with value "json"
    And I click the "AddChoiceValueButton" button
    And I set the parameter "ChoiceValue" with value "apache"
    And I click the "AddChoiceValueButton" button
    And I set the parameter "ChoiceValue" with value "other"
    And I click the "AddChoiceValueButton" button
    And I choose the "json" from the "DefaultDropdownList"
    Then I click the "EnsureCreateInput" button
    And I wait for "EnsureCreateInput" will be invisible

    Examples:
      | name |
      | f1   |

  Scenario: 添加动态菜单输入项
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I click the detail which name is "仪表盘输入项联动"
    Then I will see the "dashboard.DetailPage" page
    When I click the "AddEventButton" button
    And I choose the "添加输入项" from the "EventList"
    And I set the parameter "FilterTitle" with value "f2"
    And I set the parameter "FilterToken" with value "f2"
    And I choose the "动态菜单" from the "InputType"
    And I click the "SingleChoice" button
    And I set the parameter "DynamicField" with value "hostname"
    And I set the parameter "Spl" with value "logtype:${f1} | stats count() by hostname"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "Search" button under some element
    Then I click the "EnsureCreateInput" button
    And I wait for "EnsureCreateInput" will be invisible

  Scenario: 添加事件列表
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I click the detail which name is "仪表盘输入项联动"
    Then I will see the "dashboard.DetailPage" page
    And I wait for "AddEventButton" will be visible
    When I click the "AddEventButton" button
    And I choose the "添加事件列表" from the "EventList"
    And I set the parameter "TagName" with value "测试输入项联动"
    And I set the parameter "Spl" with value "logtype:${f1} AND hostname:${f2}"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "AddEventEnsure" button

  Scenario: 验证
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I click the detail which name is "仪表盘输入项联动"
    Then I will see the "dashboard.DetailPage" page
    And I click the "ShowFilter" button
    And I click the "Update" button
    And I choose the "192.168.1.26" from the "FilterDropdown"
    And I click the "Update" button
    And I click the "ChartSetting" button
    And I click the "Configs" button
    And I wait for "OpenInSearch" will be visible
    And I click the "OpenInSearch" button
    And switch to another window
    Then I will see the "splSearch.SearchPage" page
    Then I will see the element "SearchInput" name is "logtype:json AND hostname:192.168.1.26"

  Scenario: 添加输入项
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I click the detail which name is "仪表盘输入项联动"
    Then I will see the "dashboard.DetailPage" page
    When I click the "AddEventButton" button
    And I choose the "添加输入项" from the "EventList"
    And I set the parameter "FilterTitle" with value "filter"
    And I set the parameter "FilterToken" with value "filter"
    Then I click the "EnsureCreateInput" button
    Then I wait for "FilterName" will be visible

  Scenario: 修改搜索语句
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I click the detail which name is "仪表盘输入项联动"
    Then I will see the "dashboard.DetailPage" page
    And I wait for "ChartSetting" will be visible
    And I click the "ChartSetting" button
    And I click the "Configs" button
    And I set the parameter "Spl" with value ""
    And I set the parameter "Spl" with value "${filter|e}"
    And I click the "SettingEnsure" button

  Scenario: 验证支持token filter
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I click the detail which name is "仪表盘输入项联动"
    Then I will see the "dashboard.DetailPage" page
    And I set the parameter "FilterInput" with value "a+b"
    And I click the "Update" button
    And I click the "ChartSetting" button
    And I click the "Configs" button
    And I wait for "OpenInSearch" will be visible
    And I click the "OpenInSearch" button
    And switch to another window
    Then I will see the "splSearch.SearchPage" page
    Then I will see the element "SearchInput" name is "a\+b"

  Scenario Outline: 删除仪表盘
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    When the data name is "<name>" then i click the "删除" button
    And I wait for "Ensure" will be visible
    And I click the "Ensure" button
    Then I will see the success message "删除成功"

    Examples:
      | name     |
      | 仪表盘输入项联动 |


@dashboard @dashboardSmoke
Feature: 仪表盘配置

  Scenario Outline: 添加下拉菜单类型的过滤项（RZY-1869）
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I click the detail which name is "UI自动化创建"
    Then I will see the "dashboard.DetailPage" page
    When I click the "AddEventButton" button
    And I choose the "<eventList>" from the "EventList"
    And I set the parameter "FilterTitle" with value "<title>"
    And I set the parameter "FilterToken" with value "<token>"
    And I set the parameter "FilterField" with value "<field>"
    And I choose the "<inputType>" from the "InputType"
    And I click the "Radio" button
    And I set the parameter "ChoiceValue" with value "json"
    And I click the "AddChoiceValueButton" button
    And I set the parameter "ChoiceValue" with value "<choiceValue>"
    And I click the "AddChoiceValueButton" button
    And I set the parameter "ChoiceValue" with value "http"
    And I click the "AddChoiceValueButton" button
    And I choose the "<choiceValue>" from the "DefaultDropdownList"
    Then I click the "EnsureCreateFilter" button

    Examples:
      | eventList | title  | token  | field   | inputType | choiceValue |
      | 添加过滤项     | filter | filter | appname | 下拉菜单      | java        |

  Scenario: RZY-1668:单引号包裹
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I click the detail which name is "UI自动化创建"
    Then I will see the "dashboard.DetailPage" page
    When I click the "AddEventButton" button
    And I choose the "添加输入项" from the "EventList"
    And I set the parameter "FilterTitle" with value "input"
    And I set the parameter "FilterToken" with value "input"
    And I set the parameter "FilterDefaultValue" with value "appname"
    Then I click the "EnsureCreateInput" button

  Scenario: 创建仪表盘所用趋势图
    Given open the "trend.ListPage" page for uri "/trend/"
    And I click the "CreateButton" button
    Then I will see the "trend.CreatePage" page
    When I set the parameter "NameInput" with value "仪表盘所用趋势图"
    And I set the parameter "DescribeInput" with value "AutoCreate"
    And I choose the "default_Trend" from the "GroupDropdown"
    And I click the "NextButton" button
    And I set the parameter "SearchInput" with value "*|stats count() by 'appname',logtype"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for "Header" will be visible
    And I click the "NextButton" button
    And I wait for "Header" will be visible
    And I click the "Save" button

  Scenario: 验证RZY-1668
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I click the detail which name is "UI自动化创建"
    Then I will see the "dashboard.DetailPage" page
    When I click the "AddEventButton" button
    And I choose the "添加图表" from the "EventList"
    And I set the parameter "TrendName" with value "仪表盘"
    And I click the "DashboardTrend" button
    And I click the "EnsureAddTrend" button
    And I wait for "ChartSetting" will be visible
    And I set value with element "TableList"
    And I click the "ChartSetting" button

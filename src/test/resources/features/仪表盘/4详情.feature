@dashboard
Feature: 仪表盘详情页

  Background:
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I click the detail which name is "sxjautotest"
    Then I will see the "dashboard.DetailPage" page

  @dashboardSmoke
  Scenario Outline: 打开/关闭编辑、全屏操作、夜间模式（RZY-228、RZY-229、RZY-237、RZY-238）
    When I set the parameter "TagName" with value "<tagName>"
    And I click the "EnsureCreateTagButton" button
    And I will see the "<button>" is clickable
    And I click the "ClickableButton" button
    And I will see the "<disabledButton>" is "disabled"
    And I click the "ShowFilter" button
    And I will see the "Filter" is display
    And I click the "NightModeButton" button
    And I click the "FullScreenButton" button

    Examples:
      | tagName | button                                                                                 | disabledButton                     |
      | first   | AddButton,MoveButton,RefreshButton,SaveAsReportButton,NightModeButton,FullScreenButton | AddButton,MoveButton,RefreshButton |

  @dashboardSmoke
  Scenario: 新建tag
    When I click the "OpenEdit" button
    And I click the "AddTag" button
    When I set the parameter "TagName" with value "second"
    And I click the "EnsureCreateTagButton" button
    And I wait for "Main" will be visible

  @dashboardSmoke
  Scenario: 跳转到其他仪表盘（RZY-240）
    And I click the "SwitchButton" button
    And I wait for "Circular" will be invisible
    And I click the "Uiautotest" button
    And I wait for loading invisible
    Then the page's title will be "UIautotest | 仪表盘"

  @dashboardSmoke
  Scenario Outline: 添加动态菜单类型的过滤项（RZY-258）
    When I set the parameter "TagName" with value "second"
    And I click the "EnsureCreateTagButton" button
    Given I click the "AddEventButton" button
    And I choose the "<eventList>" from the "EventList"
    And I set the parameter "FilterTitle" with value "<title>"
    And I set the parameter "FilterToken" with value "<token>"
    And I set the parameter "FilterField" with value "<field>"
    And I choose the "<inputType>" from the "InputType"
    And I set the parameter "DynamicField" with value "<dynamicField>"
    And I set the parameter "SearchInput" with value "<search>"
    And I click the "TimeRange" button
    And I click the "ThisMonth" button
    And I click the "SearchInputButton" button
    And I will see the success message "动态字段搜索完成!"
    And I choose the "<choiceValue>" from the "DefaultDropdownList"
    And I click the "EnsureCreateFilter" button

    Examples:
      | eventList | title | token     | field | inputType | dynamicField | search                        | choiceValue |
      | 添加过滤项     | test  | testtoken |       | 动态菜单      | appname      | * \| stats count() by appname | java        |

  Scenario Outline: 添加过滤项以及输入项失败
    Given I click the "AddEventButton" button
    And I choose the "<eventList>" from the "EventList"
    And I set the parameter "<titleName>" with value "<title>"
    And I click the "<ensure>" button
    Then I will see the success message "<message>"

    Examples:
      | eventList | titleName   | title | ensure             | message     |
      | 添加过滤项     | FilterTitle |       | EnsureCreateFilter | 请输入过滤项标题    |
      | 添加输入项     | InputTitle  |       | EnsureCreateInput  | 请输入输入项标题    |
      | 添加过滤项     | FilterTitle | test  | EnsureCreateFilter | 请输入过滤项标识    |
      | 添加输入项     | InputTitle  | test  | EnsureCreateInput  | 请输入输入项token |

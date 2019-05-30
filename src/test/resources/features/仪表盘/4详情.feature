@dashboard
Feature: 仪表盘详情页

  Background:
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I click the detail which name is "sxjautotest"
    Then I will see the "dashboard.DetailPage" page

  Scenario Outline: 新建标签页失败
    When I set the parameter "TagName" with value "<tagName>"
    And I click the "EnsureCreateTagButton" button
    Then I will see the success message "<message>"

    Examples:
      | tagName | message                     |
      |         | 标签页名称不能为空                   |
      | t e s t | 名称格式有误, 仅支持汉字，数字，字母，中划线及下划线 |

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
  Scenario:
    When I click the "OpenEdit" button
    And I click the "AddTag" button
    When I set the parameter "TagName" with value "second"
    And I click the "EnsureCreateTagButton" button

  @dashboardSmoke
  Scenario Outline: 移出标签页（RZY-230）
    When I click the "MoveButton" button
    And I check "<dashboardName>" from the "CheckBox"
    And I click the "EnsureMoveTagButton" button
    And I refresh the website
    And open the "dashboard.ListPage" page for uri "/dashboard/"
    Then I will see the data "<dashboardName>" values "{'column':'2','name':'second'}"
    Then I will see the data "sxjautotest" values "{'column':'2','name':'first'}"

    Examples:
      | dashboardName |
      | UIautotest    |

  @dashboardSmoke
  Scenario: 跳转到其他仪表盘（RZY-240）
    And I click the "SwitchButton" button
    And I wait for "Circular" will be invisible
    And I click the "Uiautotest" button
    And I wait for loading invisible
    Then the page's title will be "UIautotest | 仪表盘"

  @dashboardSmoke
  Scenario Outline: 回收站操作（RZY-241至RZY-244）
    When I click the "CloseTag" button
#    And I wait for loading invisible
    Then I will see the "DropDownLinkButton" result will be "<num>"
    When I click the "RecoverTag" button
    Then I will see the element "Tab" name is "<tagName>"
    When I click the "CloseTag" button
    And I click the "MoveoutTag" button
    And I check "<dashboardName>" from the "CheckBox"
    And I click the "EnsureMoveTagButton" button
    And open the "dashboard.ListPage" page for uri "/dashboard/"
    And I click the detail which name is "<dashboardName>"
    And I will see the "dashboard.DetailPage" page
    And I will see the "DropDownLinkButton" result will be "<num>"

    Examples:
      | tagName | num   | dashboardName |
      | second   | [ 1 ] | UIautotest    |

  @dashboardSmoke
  Scenario Outline: 标签页删除
    When I set the parameter "TagName" with value "<tagName>"
    And I click the "EnsureCreateTagButton" button
    When I click the "CloseTag" button
    And I will see the "DropDownLinkButton" result will be "<num>"
    And I click the "DeleteTag" button
    And I click the "EnsureDeleteTagButton" button

    Examples:
      | tagName | num   |
      | second   | [ 1 ] |

  @dashboardSmoke
  Scenario Outline: 添加下拉菜单类型的过滤项（RZY-253）
    When I set the parameter "TagName" with value "<tagName>"
    And I click the "EnsureCreateTagButton" button
    And I click the "AddEventButton" button
    And I choose the "<eventList>" from the "EventList"
    And I set the parameter "FilterTitle" with value "<title>"
    And I set the parameter "FilterToken" with value "<token>"
    And I set the parameter "FilterField" with value "<field>"
    And I choose the "<inputType>" from the "InputType"
    And I set the parameter "ChoiceValue" with value "<choiceValue>"
    And I click the "AddChoiceValueButton" button
    And I choose the "<choiceValue>" from the "DefaultDropdownList"
    And I click the "EnsureCreateFilter" button
    Then take a screenshot

    Examples:
      | tagName | eventList | title | token | field | inputType | choiceValue   |
      | first   | 添加过滤项     | test  | token |       | 下拉菜单      | default_value |

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

  @dashboardSmoke
  Scenario Outline: 添加动态菜单类型的过滤项（RZY-258）
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
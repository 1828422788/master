@dashboard
Feature: 仪表盘详情页

  Background:
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I click the detail which name is "FirstAutoTest"
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
    And I click the "UIautotest" button
    And I wait for loading invisible
    Then the page's title will be "UIautotest | 仪表盘"
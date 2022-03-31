@trend @acceleration @accelerationDashboard
Feature: 趋势图加速_4仪表盘引用趋势图

  Background:
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for "Loading" will be invisible

  Scenario Outline: 新建仪表盘
    When I click the "Create" button
    And I set the parameter "DashBoardName" with value "<name>"
    And I click the "Ensure" button
    And I wait for "SuccessMessage" will be visible
    Then I will see the success message "新建仪表盘成功"

  Examples:
    | name             |
    | 仪表盘引用趋势图 |

  Scenario Outline: 新建标签页
    And I click the detail which name is "<name>"
    And switch to window "仪表盘"
    And I close all tabs except main tab
    Then I will see the "dashboard.DetailPage" page
    When I set the parameter "TagName" with value "测试标签页"
    And I click the "Ensure" button
    Then I wait for "SettingIcon" will be visible

  Examples:
    | name             |
    | 仪表盘引用趋势图 |

  Scenario Outline: 添加图表
    And I click the detail which name is "<name>"
    And switch to window "仪表盘"
    And I close all tabs except main tab
    Then I will see the "dashboard.DetailPage" page
    And I click the "SettingIcon" button
    And I switch the dashboard "OpenEdit" button to "enable"
    And I click the "SettingIcon" button
    And I wait for "SuccessMessage" will be invisible
    And I wait for "AddEventButton" will be visible
    When I click the "AddEventButton" button
    And I click the "AddChart" button
    And I set the parameter "SearchChartInput" with value "<trend>"
    And I wait for loading invisible
    And I click the "<button>" button
    And I click the "{'Checkbox':'<trend>'}" button
    And I click the "Ensure" button
    And I wait for "SuccessMessage" will be visible
    Then I wait for element "SuccessMessage" change text to "添加成功"
    And I wait for "SuccessMessage" will be invisible

  Examples:
    |      name       | trend               | button     |
    |仪表盘引用趋势图 | 趋势图_仪表盘(引用) | Reference  |
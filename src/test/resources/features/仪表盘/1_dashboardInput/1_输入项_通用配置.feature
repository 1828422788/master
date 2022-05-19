@dashboardInput
Feature:仪表盘输入项_1通用配置

  Background:
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I set the parameter "TextFilter" with value "测试输入项1"
    And I wait for loading invisible
    And I click the detail which name is "测试输入项1"
    And switch to window "仪表盘"
    And I close all tabs except main tab
    Then I will see the "dashboard.DetailPage" page
    And I click the "SettingIcon" button
    And I switch the dashboard "OpenEdit" button to "enable"
    And I click the "SettingIcon" button
    And I wait for "SuccessMessage" will be invisible

  Scenario Outline: RZY-1668添加单引号输入项
    And I choose the "添加输入项" from the "AddItemMenu"
    And I set the parameter "FilterTitle" with value "<filtername>"
    And I set the parameter "FilterToken" with value "<filtername>"
    And I set the parameter "FilterDefaultValue" with value "<defaultValue>"
    Then I click the "Ensure" button
    Then I wait for element "SuccessMessage" change text to "添加输入项成功"

    Examples:
      | filtername | defaultValue    |
      | filter     | apache.geo.city |

  Scenario: 验证单引号输入项
    And I set value with element "TableList"
    When the chart title is "仪表盘所用趋势图" then I click the button which classname is "yotta-icon yotta-icon-DotEmblem" in dashboard
    And I click the "Configs" button
    And I set the parameter "Spl" with value "tag: sample04061424_chart | stats count() by ${filter|s}"
    And I click the "Ensure" button
    Then I wait for element "SuccessMessage" change text to "配置成功"
    And I wait for "SuccessMessage" will be invisible
    Then I compare with list "TableList"

  Scenario Outline: 修改输入项宽度设置
    And I move the mouse pointer to the text "filter"
    And I click the "FilterSetting" button
    And I set the parameter "FilterWidth" with value "<width>" using step buttons
    And I click the "<action>Width" button
    And I will see the input element "FilterWidth" value will be "<width_check>"
    Then I click the "Ensure" button
    And I will see the element "FirstFilterElement" style contains "width: <width_check>px;"

    Examples:
      | width  | width_check | action  |
      | 1000   | 1000        | Increase|
      | 200    | 200         | Decrease|
      | 400    | 500         | Increase|

  Scenario: 检查输入项宽度
    And I will see the element "FirstFilterElement" style contains "width: 500px;"

  Scenario: 删除图表单引号包裹
    When the chart title is "仪表盘所用趋势图" then I click the button which classname is "yotta-icon yotta-icon-Delete" in dashboard
    And I will see the element "DialogMessage" contains "是否删除图表 仪表盘所用趋势图 ？"
    And I click the "Ensure" button
    And I wait for element "SuccessMessage" change text to "删除成功"

  Scenario: 删除单引号输入项
    And I move the mouse pointer to the text "filter"
    And I click the "DeleteFilter" button
    And I will see the element "DialogMessage" contains "是否删除过滤/输入项 filter ？"
    And I click the "Ensure" button
    And I wait for loading invisible
    And I will see the text "filter" is not existed in page
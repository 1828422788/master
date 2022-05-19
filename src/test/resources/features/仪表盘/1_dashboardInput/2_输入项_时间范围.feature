@dashboardInput
Feature:仪表盘输入项_2时间范围

  Background:
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I set the parameter "TextFilter" with value "测试输入项_时间范围"
    And I wait for loading invisible
    And I click the detail which name is "测试输入项_时间范围"
    And switch to window "仪表盘"
    And I close all tabs except main tab
    Then I will see the "dashboard.DetailPage" page
    And I click the "SettingIcon" button
    And I switch the dashboard "OpenEdit" button to "enable"
    And I click the "SettingIcon" button
    And I wait for "SuccessMessage" will be invisible

  Scenario: 添加时间范围输入项(RZY-4573,RZY-227)
    And I choose the "添加输入项" from the "AddItemMenu"
    And I set the parameter "FilterTitle" with value "time-filter"
    And I set the parameter "FilterToken" with value "time-filter"
    And I choose the "时间范围" from the "FilterType"
    And I click the "DateEditor" button
    And I click the "Shortcut" button
    And I click the "Today" button
    Then I click the "Ensure" button
    Then I wait for element "SuccessMessage" change text to "添加输入项成功"

  Scenario: 验证默认值 RZY-4617
    And I will see the element "DateEditor" value is "今天"

  Scenario: 验证时间范围输入项 RZY-4573
    And I set value with element "TableList"
    When the chart title is "仪表盘所用趋势图" then I click the button which classname is "yotta-icon yotta-icon-DotEmblem" in dashboard
    And I click the "Configs" button
    And I set the parameter "Spl" with value "starttime=${time-filter.start} endtime=${time-filter.end} tag: sample04061424_chart | stats count() by 'apache.geo.city' "
    And I click the "Ensure" button
    And I wait for element "SuccessMessage" change text to "配置成功"
    And I wait for "SuccessMessage" will be invisible
    Then I compare with list "TableList"

  Scenario: 验证时间范围标识前后缀 RZY-4641
    And I set value with element "TableList"
    And I move the mouse pointer to the text "time-filter"
    And I click the "FilterSetting" button
    And I set the parameter "Prefix" with value "="
    And I click the "FilterDateEditor" button
    And I click the "Today" button
    And I click the "Ensure" button
    When the chart title is "仪表盘所用趋势图" then I click the button which classname is "yotta-icon yotta-icon-DotEmblem" in dashboard
    And I click the "Configs" button
    And I set the parameter "Spl" with value "starttime${time-filter.start} endtime${time-filter.end} tag: sample04061424_chart | stats count() by 'apache.geo.city' "
    And I click the "Ensure" button
    And I wait for element "SuccessMessage" change text to "配置成功"
    And I wait for "SuccessMessage" will be invisible
    Then I compare with list "TableList"
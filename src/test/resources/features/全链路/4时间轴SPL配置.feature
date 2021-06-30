@fulllink @fulllinkTimeline
Feature: 全链路_时间轴SPL配置

  Background:
    Given open the "fulllink.ListPage" page for uri "/fulllink/"
    And I wait for "3000" millsecond
    When the data name is "AutoTest" then i click the "编辑" button
    And I will see the "fulllink.CreatePage" page
    And I wait for "3000" millsecond
    And I wait for "DisabledSave" will be visible
    And I click the "Switch" button
    And I wait for "Save" will be visible

  Scenario: 时间轴SPL配置
    When the data name is "FullLink_Test" then i click the "编辑" button
    And I will see the "fulllink.CreatePage" page
    And I wait for "3000" millsecond
    And I wait for "DisabledSave" will be visible
    And I click the "Switch" button
    And I wait for "Save" will be visible
    And I choose the "时间轴SPL配置" from the "Settings"
    And I wait for "TimelineSPL" will be visible
    And I set the value "index=schedule schedule_name:FullLink_Autotest method:${method}  | bucket start_timestamp span=1h as ts" to the textarea "TimelineSPL"
    And I click the "RequestData" button
    And I wait for "SuccessMessage" will be invisible
    And I wait for "2000" millsecond
    And I click the "Save" button
    And I wait for "SuccessMessage" will be visible
    And I will see the element "SuccessMessage" contains "保存成功"
@fulllink @fulllinkTimeline
Feature: 全链路_5时间轴SPL配置

  Background:
    Given open the "fulllink.ListPage" page for uri "/fulllink/"
    And I wait for loading invisible
    When the data name is "AutoTest" then i click the "编辑" button
    And I will see the "fulllink.CreatePage" page
    And I wait for "3000" millsecond
    And I wait for "DisabledSave" will be visible
    And I click the "Switch" button
    And I wait for "Save" will be visible

  Scenario: 时间轴SPL配置_取消
    And I choose the "时间轴SPL配置" from the "Settings"
    And I wait for "TimelineSPL" will be visible
    And I set the value "index=schedule schedule_name:FullLink_Autotest method:${method}  | bucket start_timestamp span=1h as ts" to the textarea "TimelineSPL"
    And I click the "Cancel" button
    And I choose the "时间轴SPL配置" from the "Settings"
    And I wait for "TimelineSPL" will be visible
    And I will see the input element "TimelineSPL" value will be ""
    And I click the "Cancel" button

  Scenario Outline: 时间轴SPL配置
    And I choose the "时间轴SPL配置" from the "Settings"
    And I wait for "TimelineSPL" will be visible
    And I set the value "index=schedule schedule_name:FullLink_Autotest method:${method}  | bucket start_timestamp span=1h as ts | stats count()  as _COUNT by ts | eval level = <level>" to the textarea "TimelineSPL"
    And I click the "RequestData" button
    And I wait for "SuccessMessage" will be invisible
    And I click the "Save" button
    And I wait for "SuccessMessage" will be visible
    And I will see the element "SuccessMessage" contains "保存成功"
    And I wait for "TimeAxis" will be visible
    When I click the "TimeAxis" button
    And I wait for "Tick0000" will be visible
    And I will see the element "Tick0000" fill contains "<color>"
    And I move the mouse pointer to the "Tick0000"
    And I wait for "Tooltip" will be visible
    And I will see the element "Tooltip" contains "COUNT:"
    And I wait for "2000" millsecond

  Examples:
    | level   | color    |
    | 3       | #1785ff  |
    | 2       | #CB3B2F  |
    | 1       | #ECA222  |

   @fulllinkSmoke
    Examples:
    | level    | color   |
    | 0        | #3034B3 |
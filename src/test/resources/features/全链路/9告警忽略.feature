@fulllink @fulllinkAlarmIgnore
Feature: 全链路_9告警忽略

  Background:
    Given open the "fulllink.ListPage" page for uri "/fulllink/"
    And I wait for "3000" millsecond
    When the data name is "AutoTest_1" then i click the "编辑" button
    And I will see the "fulllink.CreatePage" page
    And I wait for "3000" millsecond

  Scenario: 告警忽略_提示
    And I wait for "DisabledSave" will be visible
    And I click the "Switch" button
    And I wait for "Save" will be visible
    When I click the "TimeAxis" button
    And I wait for "AlarmIgnore" will be visible
    And I click the "AlarmIgnore" button
    And I wait for "Message" will be visible
    And I will see the element "Message" contains "无法操作该数据"

  Scenario: 告警忽略_取消
    And I wait for "DisabledSave" will be visible
    And I click the "Switch" button
    And I wait for "Save" will be visible
    When I click the "TimeAxis" button
    And I wait for "Tick0000" will be visible
    And I click the Circle "Tick0000" button
    And I wait for "1000" millsecond
    And I wait for "FirstTick" will be visible
    And I click the Circle "FirstTick" button
    And I click the "AlarmIgnore" button
    And I set the value "TEST" to the textarea "AlarmIgnoreTextarea"
    And I click the "Cancel" button
    And I move the mouse pointer to the "Tick0000"
    And I wait for "Tooltip" will be visible
    And I will see the element "Tooltip" contains "COUNT:"
    And I will see the element "Tooltip" contains "处理状态:0/4"
    And I move the mouse pointer to the "FirstTick"
    And I wait for "Tooltip" will be visible
    And I will see the element "Tooltip" contains "未处理"

  Scenario: 告警忽略_没有保存
    And I wait for "DisabledSave" will be visible
    And I click the "Switch" button
    And I wait for "Save" will be visible
    When I click the "TimeAxis" button
    And I wait for "Tick0000" will be visible
    And I click the Circle "Tick0000" button
    And I wait for "1000" millsecond
    And I wait for "FirstTick" will be visible
    And I will see the element "FirstTick" fill contains "#ECA222"
    And I click the Circle "FirstTick" button
    And I click the "AlarmIgnore" button
    And I set the value "TEST" to the textarea "AlarmIgnoreTextarea"
    And I click the "Ensure" button
    And I move the mouse pointer to the "Tick0000"
    And I wait for "Tooltip" will be visible
    And I will see the element "Tooltip" contains "COUNT:"
    And I will see the element "Tooltip" contains "处理状态:1/4"
    And I move the mouse pointer to the "FirstTick"
    And I wait for "Tooltip" will be visible
    And I will see the element "Tooltip" contains "处理人:admin"
    And I will see the element "Tooltip" contains "处理信息:TEST"

  Scenario Outline: 告警忽略
    And I wait for "DisabledSave" will be visible
    And I click the "Switch" button
    And I wait for "Save" will be visible
    When I click the "TimeAxis" button
    And I wait for "Tick0000" will be visible
    And I click the Circle "Tick0000" button
    And I wait for "1000" millsecond
    And I wait for "<tick>" will be visible
    And I will see the element "<tick>" fill contains "<tickcolor>"
    And I click the Circle "<tick>" button
    And I click the "AlarmIgnore" button
    And I set the value "<text>" to the textarea "AlarmIgnoreTextarea"
    And I click the "Ensure" button
    And I move the mouse pointer to the "Tick0000"
    And I wait for "Tooltip" will be visible
    And I will see the element "Tooltip" contains "处理状态:<info>"
    And I will see the element "Tick0000" fill contains "<color>"
    And I move the mouse pointer to the "<tick>"
    And I wait for "Tooltip" will be visible
    And I will see the element "Tooltip" contains "处理信息:<text>"
    And I click the "Save" button
    And I wait for "SuccessMessage" will be visible
    And I will see the element "SuccessMessage" contains "保存成功"

  Examples:
    | tick        | text   | info  | tickcolor | color   |
    | FirstTick   | Test   | 1/4   | #ECA222   | #3034B3 |
    | SecondTick  | 测试   | 2/4   | #CB3B2F   | #3034B3 |
    | ThirdTick   | 12345  | 3/4   | #ECA222   | #3034B3 |
    | ForthTick   | TEST   | 4/4   | #CB3B2F   | #1785ff |

  Scenario: 告警忽略_修改
    And I wait for "DisabledSave" will be visible
    And I click the "Switch" button
    And I wait for "Save" will be visible
    When I click the "TimeAxis" button
    And I wait for "Tick0000" will be visible
    And I click the Circle "Tick0000" button
    And I wait for "1000" millsecond
    And I click the Circle "FirstTick" button
    And I click the "AlarmIgnore" button
    And I set the value "Text_1" to the textarea "AlarmIgnoreTextarea"
    And I click the "Ensure" button
    And I move the mouse pointer to the "Tick0000"
    And I wait for "Tooltip" will be visible
    And I will see the element "Tooltip" contains "处理状态:4/4"
    And I will see the element "Tick0000" fill contains "#1785ff"
    And I move the mouse pointer to the "FirstTick"
    And I wait for "Tooltip" will be visible
    And I will see the element "Tooltip" contains "处理信息:Text_1"
    And I will see the element "FirstTick" fill contains "#1785ff"
    And I click the "Save" button
    And I wait for "SuccessMessage" will be visible
    And I will see the element "SuccessMessage" contains "保存成功"


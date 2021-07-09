@fulllink @fulllinkCheck
Feature: 全链路_8查看链路图

  Background:
    Given open the "fulllink.ListPage" page for uri "/fulllink/"
    And I wait for "3000" millsecond
    
  Scenario: 查看全链路1
    When the data name is "AutoTest" then i click the "编辑" button
    And I will see the "fulllink.CreatePage" page
    And I wait for "3000" millsecond
    And I wait for "Canvas" will be visible
    And I wait for "5000" millsecond
    When I click the "CanvasElement" button
    And I wait for "ElementDetails" will be visible
    And I will see the element "ElementDetails" contains "节点详情"
    And I will see the element "ElementDetails" contains "GET_"
    And I will see the element "ElementDetails" contains "市"
    And I will see the element "ElementDetails" contains "节点异常状态"
    And I will see the element "ElementDetails" contains "数量："
    And I will see the element "ElementDetails" contains "3"

  Scenario: 查看全链路2
    When the data name is "AutoTest_TimeAxis" then i click the "编辑" button
    And I will see the "fulllink.CreatePage" page
    And I wait for "3000" millsecond
    And I wait for "TimeAxis" will be visible
    When I click the "TimeAxis" button
    And I wait for "Tick0000" will be visible
    And I click the Circle "Tick0000" button
    And I wait for "1000" millsecond
    And I wait for "FirstTick" will be visible
    And I click the Circle "FirstTick" button
    And I wait for "1000" millsecond
    And I wait for "Canvas" will be visible
    And I wait for "5000" millsecond
    When I click the "CanvasElement" button
    And I wait for "ElementDetails" will be visible
    And I will see the element "ElementDetails" contains "节点详情"
    And I will see the element "ElementDetails" contains "_"
    And I will see the element "ElementDetails" contains "市"
    And I will see the element "ElementDetails" contains "节点异常状态"
    And I will see the element "ElementDetails" contains "数量："
    And I wait for "MediumAlarm" will be visible

  Scenario: 更新当前场景链路布局
    When the data name is "AutoTest" then i click the "编辑" button
    And I will see the "fulllink.CreatePage" page
    And I wait for "3000" millsecond
    And I wait for "DisabledSave" will be visible
    And I click the "Switch" button
    And I wait for "Save" will be visible
    And I choose the "更新当前场景链路布局" from the "Settings"
    And I wait for "SuccessMessage" will be visible
    And I will see the element "SuccessMessage" contains "更新当前链路布局成功！"
    And I wait for "SuccessMessage" will be invisible
    And I click the "Save" button
    And I wait for "SuccessMessage" will be visible
    And I will see the element "SuccessMessage" contains "保存成功"
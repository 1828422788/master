@fulllink @fulllinkCheck
Feature: 全链路_8查看链路图

  Background:
    Given open the "fulllink.ListPage" page for uri "/fulllink/"
    And I wait for "3000" millsecond
    When the data name is "AutoTest" then i click the "编辑" button
    And I will see the "fulllink.CreatePage" page
    And I wait for "3000" millsecond
    
  Scenario: 查看全链路1
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
    And I wait for "HighAlarm" will be visible


  Scenario: 修改指标项配置
    And I wait for "DisabledSave" will be visible
    And I click the "Switch" button
    And I wait for "Save" will be visible
    And I choose the "链路指标项配置" from the "Settings"
    And I wait for "High_Min" will be visible
    And I set the parameter "High_Min" with value "11"
    And I set the parameter "High_Max" with value "34"
    And I set the parameter "Medium_Min" with value "0"
    And I set the parameter "Medium_Max" with value "10"
    And I click the Circle "High_Min" button
    And I click the "Render" button
    And I wait for "2000" millsecond
    When I click the "Filter" button
    And I wait for "FirstInput" will be visible
    And I choose the "POST" from the "FirstInputList"
    And I wait for "SuccessMessage" will be visible
    And I will see the element "SuccessMessage" contains "更新变量 "method" 成功"
    And I click the "Update" button
    And I wait for "SuccessMessage" will be invisible
    When I click the "Filter" button
    And I wait for "FirstInput" will be invisible
    And I wait for "5000" millsecond
    And I click the "Save" button
    And I wait for "SuccessMessage" will be visible
    And I will see the element "SuccessMessage" contains "保存成功"

  Scenario: 查看全链路2
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
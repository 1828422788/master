@fulllink @fulllinkIndex
Feature: 全链路_6指标项配置

  Background:
    Given open the "fulllink.ListPage" page for uri "/fulllink/"
    And I wait for "3000" millsecond
    When the data name is "AutoTest" then i click the "编辑" button
    And I will see the "fulllink.CreatePage" page
    And I wait for "3000" millsecond
    And I wait for "DisabledSave" will be visible
    And I click the "Switch" button
    And I wait for "Save" will be visible

  Scenario: 指标项配置_取消
    And I choose the "链路指标项配置" from the "Settings"
    And I wait for "High_Min" will be visible
    And I set the parameter "High_Min" with value "10"
    And I set the parameter "High_Max" with value "34"
    And I set the parameter "Medium_Min" with value "1"
    And I set the parameter "Medium_Max" with value "3"
    And I click the Circle "High_Min" button
    And I click the "Cancel" button
    And I choose the "链路指标项配置" from the "Settings"
    And I wait for "High_Min" will be visible
    And I will see the input element "High_Min" value will be ""
    And I will see the input element "High_Max" value will be ""
    And I will see the input element "Medium_Min" value will be ""
    And I will see the input element "Medium_Max" value will be ""

  Scenario: 指标项配置_步进按钮
    And I choose the "链路指标项配置" from the "Settings"
    And I wait for "High_Min" will be visible
    And I set the parameter "High_Min" with value "0"
    And I set the parameter "High_Max" with value "0"
    And I set the parameter "Medium_Min" with value "0"
    And I set the parameter "Medium_Max" with value "0"
    And I set the parameter "High_Min" with value "2" using step buttons
    And I set the parameter "High_Max" with value "3" using step buttons
    And I set the parameter "Medium_Min" with value "1" using step buttons
    And I set the parameter "Medium_Max" with value "2" using step buttons
    And I click the Circle "High_Min" button
    And I click the "Render" button
    And I choose the "链路指标项配置" from the "Settings"
    And I wait for "Render" will be visible
    And I will see the input element "High_Min" value will be "2"
    And I will see the input element "High_Max" value will be "3"
    And I will see the input element "Medium_Min" value will be "1"
    And I will see the input element "Medium_Max" value will be "2"

  @fulllink_test
  Scenario: 指标项配置
    And I choose the "链路指标项配置" from the "Settings"
    And I wait for "High_Min" will be visible
    And I set the parameter "High_Min" with value "10"
    And I set the parameter "High_Max" with value "34"
    And I set the parameter "Medium_Min" with value "1"
    And I set the parameter "Medium_Max" with value "3"
    And I click the Circle "High_Min" button
    And I click the "Render" button
    And I wait for "2000" millsecond
    And I click the "Save" button
    And I wait for "SuccessMessage" will be visible
    And I will see the element "SuccessMessage" contains "保存成功"
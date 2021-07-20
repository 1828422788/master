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
    And I click the "MinorAlarm" button
    And I set the parameter "URL" with value "http://www.baidu.com/"
    And I click the "NewTab" button
    And I click the "Cancel" button
    And I choose the "链路指标项配置" from the "Settings"
    And I wait for "High_Min" will be visible
    And I wait for "5000" millsecond
    And I will see the input element "High_Min" value will be ""
    And I will see the input element "High_Max" value will be ""
    And I will see the input element "Medium_Min" value will be ""
    And I will see the input element "Medium_Max" value will be ""
    And I will see the input element "URL" value will be ""
    And I will see the checkbox with text "次要告警" is "unchecked"
    And I will see the checkbox with text "新窗口" is "unchecked"

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

  Scenario: 修改指标项配置2_钻取
    And I choose the "链路指标项配置" from the "Settings"
    And I wait for "High_Min" will be visible
    And I set the parameter "URL" with link "search/?query=${click.nodeName}" for current environment
    And I click the "NewTab" button
    And I click the "Render" button
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
    And I wait for "HighAlarm" will be visible
    And I click the Circle "HighAlarm" button
    And switch to window "搜索"
    And I close all tabs except main tab
    Then I will see the "splSearch.SearchPage" page
    And I wait for "SearchInput" will be visible
    And I will see the element "SearchInput" contains "POST_"
    And I will see the element "SearchInput" contains "市"


  Scenario: 修改指标项配置3
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

  Scenario: 查看全链路3
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

  Scenario: 修改指标项配置4_次要告警
    And I choose the "链路指标项配置" from the "Settings"
    And I wait for "High_Min" will be visible
    And I click the "MinorAlarm" button
    And I click the "Render" button
    And I wait for "5000" millsecond
    And I click the "Save" button
    And I wait for "SuccessMessage" will be visible
    And I will see the element "SuccessMessage" contains "保存成功"

  Scenario: 查看全链路4
    And I wait for "Canvas" will be visible
    And I wait for "5000" millsecond
    When I click the "CanvasElement" button
    And I wait for "ElementDetails" will be visible
    And I will see the element "ElementDetails" contains "节点详情"
    And I will see the element "ElementDetails" contains "_"
    And I will see the element "ElementDetails" contains "市"
    And I will see the element "ElementDetails" contains "节点异常状态"
    And I will see the element "ElementDetails" contains "数量："
    And I wait for "AlarmLine" will be visible
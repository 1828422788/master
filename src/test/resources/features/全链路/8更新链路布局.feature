@fulllink @fulllinkUpdate
Feature: 全链路_8更新链路布局

  Background:
    Given open the "fulllink.ListPage" page for uri "/fulllink/"
    And I wait for "3000" millsecond
    When the data name is "AutoTest" then i click the "编辑" button
    And I will see the "fulllink.CreatePage" page
    And I wait for "3000" millsecond

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
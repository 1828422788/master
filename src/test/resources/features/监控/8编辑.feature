@all
Feature: 编辑一个告警

  Background:
    Given open the "alert.ListPage" page for uri "/alerts/"

  Scenario:
    When the data name is "AutoTest" then i click the "编辑" button
    And I will see the "alert.CreatePage" page
    And I set the parameter "AlertName" with value "AutoTest1"
    And I click the "SaveButton" button
    Then I will see the success message "保存成功"
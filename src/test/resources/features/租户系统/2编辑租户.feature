@all @tenant @smoke @tenantSmoke
Feature: 租户编辑

  Background:
    Given open the "tenant.ListPage" page for uri "/domain/tenant/"

  Scenario:
    When the data name is "{'column':'1','name':'AutoTest (auto_test)'}" then i click the label "管理"
    And I will see the "tenant.CreatePage" page
    And I click the "SwitchButton" button
    And I set the parameter "ManagerPassword" with value "12345678a"
    And I set the parameter "InputAgain" with value "12345678a"
    And I click the "SaveButton" button
    Then I will see the success message "保存成功"

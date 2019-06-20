@all @tenant @smoke @tenantSmoke
Feature: 租户编辑（RZY-1705）

  Background:
    Given open the "saas.SaasLoginPage" page for uri "/domain/tenant/"
    When I set the parameter "Username" with properties "saas_username"
    And I set the parameter "Password" with properties "saas_password"
    And I click the "LoginButton" button
    And I will see the "tenant.ListPage" page

  Scenario:
    When the data name is "{'column':'1','name':'ops (ops)'}" then i click the label "管理"
    And I will see the "tenant.CreatePage" page
    And I click the "SwitchButton" button
    And I set the parameter "ManagerPassword" with value "all123456"
    And I set the parameter "InputAgain" with value "all123456"
    And I click the "SaveButton" button
    Then I will see the success message "保存成功"

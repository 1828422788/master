@authorization @all @smoke @roleSmoke
Feature: 角色授权功能

  Background:
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "AutoTestRole" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    Then I click the "{'TabButton':'功能'}" button

  Scenario: 授权查看未分配资源
    When I "checked" the checkbox which name is "可查看未分配资源"
    And I click the "SaveButton" button
    Then I will see the success message "保存成功"
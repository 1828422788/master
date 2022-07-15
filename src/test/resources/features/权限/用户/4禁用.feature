@all @smoke @users
Feature: 用户禁用（RZY-1165）

  Background:
    Given open the "users.ListPage" page for uri "/account/users/"
    And I wait for loading invisible

  Scenario: 禁用一个用户成功
    When the data name is "{'column':'1','name':'AutoTestForEdit'}" then i click the "禁用" button in more menu
    Then I wait for "SuccessMessage" will be visible

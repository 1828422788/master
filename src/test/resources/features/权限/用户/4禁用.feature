@all @smoke @users @usersSmoke
Feature: 用户禁用（RZY-1165）

  Background:
    Given open the "users.ListPage" page for uri "/account/users/"

  Scenario: 禁用一个用户成功
    When the data name is "{'column':'1','name':'AutoTestForEdit'}" then i click the "禁用" button
    Then I wait for "SuccessMessage" will be visible

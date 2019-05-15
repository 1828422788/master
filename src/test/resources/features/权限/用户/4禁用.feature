@all @smoke @users @usersSmoke
Feature: 用户禁用（RZY-1165）

  Background:
    Given open the "users.ListPage" page for uri "/account/users/"

  Scenario: 禁用一个用户成功
    When the data name is "{'column':'1','name':'SuccessEditAutoTest'}" then i click the "禁用" button
    And I refresh the website
    Then I will see the "UserStatus" result will be "已禁用"
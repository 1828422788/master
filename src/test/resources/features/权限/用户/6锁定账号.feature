@users @all
Feature: 用户账号锁定

  Background:
    Given I logout current user
    And open the "LoginPage" page for uri "/auth/login/"

  Scenario: 密码输入错误次数达到设定值，账户会被锁定
    Given I run a method "Login" for "10" times with parameters "{'name':'AutoTestForEdit','password':'123'}"
    When I set the parameter "Username" with value "AutoTestForEdit"
    And I set the parameter "Password" with value "123"
    And I click the "LoginButton" button
    Then I will see the error message contains "错误码: API_1100"

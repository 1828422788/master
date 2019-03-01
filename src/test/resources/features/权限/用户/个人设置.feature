@users @smoke @all @usersSmoke
Feature: 用户个人设置 需先赋予权限

  Background:
    Given I logout current user

  Scenario: 修改用户名
    When open the "LoginPage" page for uri "/auth/login/"
    And I set the parameter "Username" with value "AutoTest"
    And I set the parameter "Password" with value "qqqqq11111"
    And I click the "LoginButton" button
    And I will see the "PublicNavBarPage" page
    And I click the "OwnerIcon" button
    And I click the "AccountInfo" button
    And I will see the "users.EditPage" page
    And I click the "EditInfoButton" button
    And I set the parameter "UserName" with value "AutoTestEdit"
    And I click the "SaveButton" button
    Then I will see the success message "更新成功"

  Scenario: 验证修改名称后的用户无法登陆系统
    When open the "LoginPage" page for uri "/auth/login/"
    And I set the parameter "Username" with value "AutoTest"
    And I set the parameter "Password" with value "qqqqq11111"
    And I click the "LoginButton" button
    Then I will see the error message contains "登录名不存在"

  Scenario: 修改其他信息
    When open the "LoginPage" page for uri "/auth/login/"
    And I set the parameter "Username" with value "AutoTestEdit"
    And I set the parameter "Password" with value "qqqqq11111"
    And I click the "LoginButton" button
    And I will see the "PublicNavBarPage" page
    And I click the "OwnerIcon" button
    And I click the "AccountInfo" button
    And I will see the "users.EditPage" page
    And I click the "EditInfoButton" button
    And I set the parameter "UserName" with value "AutoTest"
    And I set the parameter "FullName" with value "UIAutoTest"
    And I set the parameter "Telephone" with value "1333336666666"
    And I click the "SaveButton" button
    Then I will see the success message "更新成功"


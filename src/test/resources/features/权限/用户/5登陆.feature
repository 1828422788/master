@all @users @usersSmoke
Feature: 用户登陆（RZY-1152、RZY-1153）
#
#  @logout
#  Scenario Outline: 登陆失败
#    Given I logout current user
#    And I refresh the website
#    And I wait for title change text to "登录"
#    And open the "LoginPage" page for uri "/auth/login/"
#    When I set the parameter "Username" with value "<usernameValue>"
#    And I set the parameter "Password" with value "<passwordValue>"
#    And I click the "LoginButton" button
#    Then I will see the <errorMessage>
#
#    Examples:
#      | usernameValue   | passwordValue | errorMessage                        |
#      |                 | All#123456    | message contains "请填写用户名"           |
#      | owner           |               | message contains "请填写密码"            |
#      | owner           | asd           | error message contains "用户名邮箱或密码错误" |
#      | qweax           | asd           | error message contains "用户名邮箱或密码错误" |
#      | AutoTestForEdit | All#123456    | error message contains "账户被禁用"      |

  Scenario Outline: 启用账号
    Given open the "users.ListPage" page for uri "/account/users/"
    When the data name is "{'column':'3','name':'<name>'}" then i click the "启用" button
    Then I wait for "SuccessMessage" will be visible

    Examples:
    |name|
    |测试用户所需分组|
@all @users
Feature: 用户登陆（RZY-1152、RZY-1153）

  Scenario Outline: 登陆失败
    Given I logout current user
    And I wait for title change text to "登录"
    And open the "LoginPage" page for uri "/auth/login/"
    When I set the parameter "Username" with value "<usernameValue>"
    And I set the parameter "Password" with value "<passwordValue>"
    And I click the "LoginButton" button
    Then I will see the error message contains "<errorMessage>"

    Examples:
      | usernameValue       | passwordValue | errorMessage |
      |                     | All#123456     | 请输入用户名       |
      | owner               |               | 请输入密码        |
      | owner               | asd           | 用户名或密码错误     |
      | qweax               | asd           | 登录名不存在       |
      | SuccessEditAutoTest | All#123456        | 该账号已被禁用      |

  @smoke @usersSmoke
  Scenario: 启用账号
    Given open the "users.ListPage" page for uri "/account/users/"
    When the data name is "{'column':'1','name':'SuccessEditAutoTest\n已禁用'}" then i click the "启用" button
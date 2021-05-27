Feature:

  Scenario Outline:
#    Given I logout current user
#    And I refresh the website
    Given open the "users.LoginPage" page

#    And I wait for title change text to "登录"
#    And open the "LoginPage" page for uri "/auth/login/"
#    When I set the parameter "Username" with value "<usernameValue>"
#    And I set the parameter "Password" with value "<passwordValue>"
#    And I click the "LoginButton" button

    And I click the "Modify" button
    When I set the parameter "NewPassword" with value "All#123456"
    When I set the parameter "RepeatPassword" with value "All#123456"


    Then I will see the <errorMessage>

    Examples:
      | usernameValue | passwordValue     | errorMessage                        |
      | admin         | admin@rizhiyi.com | error message contains "用户名邮箱或密码错误" |

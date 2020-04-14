@users @all
Feature: 用户新建（RZY-1164）

  Background:
    Given open the "users.ListPage" page for uri "/account/users/"

  Scenario Outline: 添加普通用户
    And I click the "CreateUser" button
    And I will see the "users.CreatePage" page
    When I set the parameter "UserName" with value "<UserName>"
    And I set the parameter "FullName" with value "<FullName>"
    And I set the parameter "Email" with value "<Email>"
    And I set the parameter "Telephone" with value "<Telephone>"
    And I set the parameter "Password" with value "<Password>"
    And I click the "CreateButton" button
    Then I will see the <Result>

  @smoke @usersSmoke
    Examples:
      | UserName        | FullName         | Email                        | Telephone | Password   | Result                 |
      | AutoTestForEdit | autoTestFullName | autoTestForEdit@yottabyte.cn |           | All#123456 | success message "创建成功" |

    Examples: 添加用户失败
      | UserName | FullName         | Email                     | Telephone   | Password          | Result                                           |
      |          | autoTestFullName | autoFullName@yottabyte.cn |             | All#123456        | error message "用户名 不能为空"                         |
      | AutoTest | autoTestFullName |                           |             | All#123456        | error message "邮箱地址 不能为空"                        |
      | AutoTest | autoTestFullName | autoFullName              | 13111111111 | All#123456        | error message "邮箱地址 不合法"                         |
      | AutoTest |                  | autoFullName@aa.          |             | All#123456        | error message "邮箱地址 不合法"                         |
      | AutoTest |                  | autoFullName@.cn          |             | All#123456        | error message "邮箱地址 不合法"                         |
      | AutoTest |                  | autoFullName.cn           |             | All#123456        | error message "邮箱地址 不合法"                         |
      | AutoTest |                  | autoFullName@yottabyte.cn |             |                   | error message "密码 不能为空"                          |
      | AutoTest |                  | autoFullName@yottabyte.cn |             | qqqqqq1           | error message "密码需满足：8-16个字符"                    |
      | AutoTest |                  | autoFullName@yottabyte.cn |             | qqqqqqqq          | error message "密码需满足：必须同时包含数字、大小写字母和特殊字符"                    |
      | AutoTest |                  | autoFullName@yottabyte.cn |             | 11111111          | error message "密码需满足：必须同时包含数字、大小写字母和特殊字符"        |
      | AutoTest |                  | autoFullName@yottabyte.cn |             | qqqAll#1234561111 | error message "密码需满足：8-16个字符"                    |
      | AutoTest |                  | autoFullName@rizhiyi.com  |             | All#123456        | error message "email: AutoTest 已存在\n错误码: AUTH_7" |

  Scenario Outline: 邮箱重复校验
    And I click the "CreateUser" button
    And I will see the "users.CreatePage" page
    When I set the parameter "UserName" with value "<UserName>"
    And I set the parameter "Email" with properties "<Email>"
    And I set the parameter "Password" with value "<Password>"
    And I click the "CreateButton" button
    Then I will see the error message "<Result>"

    Examples:
      | UserName | Email     | Password   | Result                                            |
      | aaa      | userEmail | All#123456 | email: autoFullName@yottabyte.cn 已存在\n错误码: AUTH_7 |

  Scenario Outline: 名称重复校验
    And I click the "CreateUser" button
    And I will see the "users.CreatePage" page
    When I set the parameter "UserName" with properties "<UserName>"
    And I set the parameter "Email" with value "<Email>"
    And I set the parameter "Password" with value "<Password>"
    And I click the "CreateButton" button
    Then I will see the error message "<Result>"

    Examples:
      | UserName | Email                    | Password   | Result                           |
      | user     | autoFullName@rizhiyi.com | All#123456 | email: AutoTest 已存在\n错误码: AUTH_7 |

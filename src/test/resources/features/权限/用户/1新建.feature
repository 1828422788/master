@users @all
Feature: 用户新建（RZY-1164）

  Background:
    Given open the "users.ListPage" page for uri "/account/users/"

  Scenario Outline: 添加用户
    And I click the "CreateUser" button
    And I will see the "users.CreatePage" page
    When I set the parameter "UserName" with value "<UserName>"
    And I set the parameter "FullName" with value "<FullName>"
    And I set the parameter "Email" with value "<Email>"
    And I set the parameter "Telephone" with value "<Telephone>"
    And I set the parameter "Password" with value "<Password>"
    And I choose the "<UserGroups>" from the "UserGroups"
    And I click the "CreateButton" button
    Then I wait for "SuccessMessage" will be visible

  @createUsers
    Examples: 成功添加一个用户
      | UserName | FullName         | Email                     | Telephone | Password   | UserGroups    |
      | AutoTest | autoTestFullName | autoFullName@yottabyte.cn |           | qqqqq11111 | AutoTestGroup |

  Scenario Outline: 添加用户
    And I click the "CreateUser" button
    And I will see the "users.CreatePage" page
    When I set the parameter "UserName" with value "<UserName>"
    And I set the parameter "FullName" with value "<FullName>"
    And I set the parameter "Email" with value "<Email>"
    And I set the parameter "Telephone" with value "<Telephone>"
    And I set the parameter "Password" with value "<Password>"
    And I choose the "<UserGroups>" from the "UserGroups"
    And I click the "CreateButton" button
    Then I will see the <Result>

  @smoke @usersSmoke
    Examples:
      | UserName               | FullName               | Email                               | Telephone | Password   | UserGroups    | Result                 |
      | AutoTestForEdit        | autoTestFullName       | autoTestForEdit@yottabyte.cn        |           | qqqqq11111 | AutoTestGroup | success message "创建成功" |
      | AutoTestForSavedSearch | AutoTestForSavedSearch | AutoTestForSavedSearch@yottabyte.cn |           | qqqqq11111 | AutoTestGroup | success message "创建成功" |

    Examples: 添加用户失败
      | UserName | FullName         | Email                     | Telephone   | Password          | UserGroups    | Result                              |
      |          | autoTestFullName | autoFullName@yottabyte.cn |             | qqqqq11111        | AutoTestGroup | error message "用户名 不能为空"            |
      | AutoTest | autoTestFullName |                           |             | qqqqq11111        | AutoTestGroup | error message "邮箱地址 不能为空"           |
      | AutoTest | autoTestFullName | autoFullName              | 13111111111 | qqqqq11111        | AutoTestGroup | error message "邮箱地址 不合法"            |
      | AutoTest |                  | autoFullName@aa.          |             | qqqqq11111        | AutoTestGroup | error message "邮箱地址 不合法"            |
      | AutoTest |                  | autoFullName@.cn          |             | qqqqq11111        | AutoTestGroup | error message "邮箱地址 不合法"            |
      | AutoTest |                  | autoFullName.cn           |             | qqqqq11111        | AutoTestGroup | error message "邮箱地址 不合法"            |
      | AutoTest |                  | autoFullName@yottabyte.cn |             |                   | AutoTestGroup | error message "密码 不能为空"             |
      | AutoTest |                  | autoFullName@yottabyte.cn |             | qqqqqq1           | AutoTestGroup | error message "密码输入有误，请重新输入"        |
      | AutoTest |                  | autoFullName@yottabyte.cn |             | qqqqqqqq          | AutoTestGroup | error message "密码输入有误，请重新输入"        |
      | AutoTest |                  | autoFullName@yottabyte.cn |             | 11111111          | AutoTestGroup | error message "密码输入有误，请重新输入"        |
      | AutoTest |                  | autoFullName@yottabyte.cn |             | qqqqqqqq111111111 | AutoTestGroup | error message "密码输入有误，请重新输入"        |
      | AutoTest |                  | autoFullName@yottabyte.cn |             | qqqqq11111        |               | error message "用户分组 不能为空"           |
      | AutoTest |                  | autoFullName@rizhiyi.com  |             | qqqqq11111        | AutoTestGroup | error message "用户名已存在\n错误码: FE_532" |
      | aaa      |                  | autoFullName@yottabyte.cn |             | qqqqq11111        | AutoTestGroup | error message "邮件名已存在\n错误码: FE_533" |


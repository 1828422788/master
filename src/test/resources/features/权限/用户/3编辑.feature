@users
Feature: 用户编辑（RZY-1554）

  Background:
    Given open the "users.ListPage" page for uri "/account/users/"

  @smoke @all @usersSmoke
  Scenario Outline: 编辑用户信息成功（RZY-2214）
    When I click the detail which name is "{'column':'1','name':'<UserName>'}"
    And I will see the "users.DetailPage" page
    And I click the "EditButton" button
    And I will see the "users.EditPage" page
    When I set the parameter "UserName" with value "<NewUserName>"
    And I set the parameter "FullName" with value "<FullName>"
    And I set the parameter "Email" with value "<Email>"
    And I set the parameter "Telephone" with value "<Telephone>"
    And I click the "SaveButton" button
    Then I will see the <Result>
    And I click the "EnsureButton" button
    And I refresh the website
    Then I will see the search result contains "{'column':'1','name':'<NewUserName>'}"

    Examples:
      | UserName        | NewUserName         | FullName | Email                            | Telephone   | Result                 |
      | AutoTestForEdit | SuccessEditAutoTest | FullName | AutoTestForUserEdit@yottabyte.cn | 13111111111 | success message "更新成功" |

  @all
  Scenario Outline: 编辑用户信息失败
    When I click the detail which name is "{'column':'1','name':'<UserName>'}"
    And I will see the "users.DetailPage" page
    And I click the "EditButton" button
    And I will see the "users.EditPage" page
    When I set the parameter "UserName" with value "<NewUserName>"
    And I set the parameter "FullName" with value "<FullName>"
    And I set the parameter "Email" with value "<Email>"
    And I set the parameter "Telephone" with value "<Telephone>"
    And I click the "SaveButton" button
    Then I will see the <Result>

    Examples:
      | UserName            | NewUserName            | FullName | Email                            | Telephone | Result                              |
      | SuccessEditAutoTest | AutoTest               |          | AutoTestForUserEdit@yottabyte.cn |           | error message "用户名已存在\n错误码: FE_532" |
      | SuccessEditAutoTest |                        |          | AutoTestForUserEdit@yottabyte.cn |           | error message "用户名 不能为空"            |
      | SuccessEditAutoTest | AutoTestForUserEditNew |          |                                  |           | error message "邮箱地址 不能为空"           |
      | SuccessEditAutoTest | AutoTestForUserEditTmp |          | autoTest@yottabyte.cn            |           | error message "邮件名已存在\n错误码: FE_533" |

  @users
  Scenario Outline: 编辑用户信息失败（修改密码）
    When I click the detail which name is "{'column':'1','name':'<UserName>'}"
    And I will see the "users.DetailPage" page
    And I click the "EditButton" button
    And I will see the "users.EditPage" page
    When I click the "ModifyPassword" button
    And I set the parameter "NewPassword" with value "<NewPassword>"
    And I set the parameter "RepeatPassword" with value "<RepeatPassword>"
    And I click the "SaveButton" button
    Then I will see the <Result>

  @all
    Examples:
      | UserName            | NewPassword | RepeatPassword | Result                                           |
      | SuccessEditAutoTest | qqqqq11111  | qqqqq11111     | success message "新设置的密码与最近使用过的密码重复\n错误码: FE_593" |

  @all
    Examples:
      | UserName            | NewPassword | RepeatPassword | Result                           |
      | SuccessEditAutoTest | qqqqq11111  |                | error message "重复密码 不能为空"        |
      | SuccessEditAutoTest |             | qqqqq11111     | error message "新密码 不能为空"         |
      | SuccessEditAutoTest | 112         | qqqqq11111     | error message "密码需满足: 8-16个字符"   |
      | SuccessEditAutoTest | qqqqq       | qqqqq          | error message "密码需满足: 8-16个字符"   |
      | SuccessEditAutoTest | qqqqqqqq    | qqqqqqqqq      | error message "密码需满足: 至少包含数字和字母" |
      | SuccessEditAutoTest | 1234567qwer | 123456qwert    | error message "两次密码输入不一致，请重新输入"  |
Feature: 编辑指定用户

  Background:
    Given Delete a "user" with "{'name':['AutoTestForUserEditNew','AutoTestForUserEdit','AutoTestForUserEditTmp']}"
    And Create a "user" with "{'name':'AutoTestForUserEdit','fullname':'','email':'AutoTestForUserEdit@yottabyte.cn','telephone':'','password':'qqqqq11111','userGroup':['admin']}"
    And open the "users.ListPage" page for uri "/account/users/"

  @users
  Scenario Outline: 编辑用户信息
    Given I need "<NeedRun>" create a "user" with "{'name':'AutoTestForUserEditNew','fullname':'','email':'AutoTestForUserEditNew@yottabyte.cn','telephone':'','password':'qqqqq11111','userGroup':['admin']}"
    And I set the parameter "SearchInput" with value "<UserName>"
    And I wait table element "SearchResultTable-1.2" change text to "<UserName>"
    And I click the table "TableSeeDetailButton-1" button
    And I will see the "users.DetailPage" page
    And I click the "EditButton" button
    And I will see the "users.EditPage" page
    When I set the parameter "UserName" with value "<NewUserName>"
    And I set the parameter "FullName" with value "<FullName>"
    And I set the parameter "Email" with value "<Email>"
    And I set the parameter "Telephone" with value "<Telephone>"
    And I click the "SaveButton" button
    Then I will see the <Result>

  @smoke @all
    Examples: 编辑用户成功
      | NeedRun | UserName            | NewUserName            | FullName    | Email                               | Telephone   | Result                 |
      | N       | AutoTestForUserEdit | AutoTestForUserEditNew | FullName    | AutoTestForUserEdit@yottabyte.cn    | 13111111111 | success message "更新成功" |
      | N       | AutoTestForUserEdit | AutoTestForUserEdit    | NewFullName | AutoTestForUserEdit@yottabyte.cn    | 13111111111 | success message "更新成功" |
      | N       | AutoTestForUserEdit | AutoTestForUserEdit    | NewFullName | AutoTestForUserEditNew@yottabyte.cn | 13111111111 | success message "更新成功" |
      | N       | AutoTestForUserEdit | AutoTestForUserEdit    | NewFullName | AutoTestForUserEdit@yottabyte.cn    | 13111112222 | success message "更新成功" |

  @all
    Examples:  编辑用户失败
      | NeedRun | UserName            | NewUserName            | FullName | Email                               | Telephone | Result                              |
      | Y       | AutoTestForUserEdit | AutoTestForUserEditNew |          | AutoTestForUserEdit@yottabyte.cn    |           | error message "用户名已存在\n错误码: FE_532" |
      | N       | AutoTestForUserEdit |                        |          | AutoTestForUserEdit@yottabyte.cn    |           | error message "用户名 不能为空"            |
      | N       | AutoTestForUserEdit | AutoTestForUserEditNew |          |                                     |           | error message "邮箱地址 不能为空"           |
      | Y       | AutoTestForUserEdit | AutoTestForUserEditTmp |          | AutoTestForUserEditNew@yottabyte.cn |           | error message "邮件名已存在\n错误码: FE_533" |
      | Y       | AutoTestForUserEdit | AutoTestForUserEditNew |          | AutoTestForUserEditTmp@yottabyte.cn |           | error message "用户名已存在\n错误码: FE_532" |

  @users
  Scenario Outline:
    Given I set the parameter "SearchInput" with value "<UserName>"
    And I wait table element "SearchResultTable-1.2" change text to "<UserName>"
    And I click the table "TableSeeDetailButton-1" button
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
      | UserName            | NewPassword | RepeatPassword | Result                 |
      | AutoTestForUserEdit | qqqqq11111  | qqqqq11111     | success message "更新成功" |

  @all
    Examples:
      | UserName            | NewPassword | RepeatPassword | Result                           |
      | AutoTestForUserEdit | qqqqq11111  |                | error message "重复密码 不能为空"        |
      | AutoTestForUserEdit |             | qqqqq11111     | error message "新密码 不能为空"         |
      | AutoTestForUserEdit | 112         | qqqqq11111     | error message "密码需满足: 8-16个字符"   |
      | AutoTestForUserEdit | qqqqq       | qqqqq          | error message "密码需满足: 8-16个字符"   |
      | AutoTestForUserEdit | qqqqqqqq    | qqqqqqqqq      | error message "密码需满足: 至少包含数字和字母" |
      | AutoTestForUserEdit | 1234567qwer | 123456qwert    | error message "两次密码输入不一致，请重新输入"  |
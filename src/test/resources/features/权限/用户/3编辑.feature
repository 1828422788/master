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
    And I set the parameter "FullName" with value "<FullName>"
    And I set the parameter "Email" with value "<Email>"
    And I set the parameter "Telephone" with value "<Telephone>"
    And I click the "SaveButton" button
    Then I will see the <Result>
    And I click the "EnsureButton" button

    Examples:
      | UserName        | FullName | Email                            | Telephone   | Result                 |
      | AutoTestForEdit | FullName | AutoTestForUserEdit@yottabyte.cn | 13111111111 | success message "更新成功" |
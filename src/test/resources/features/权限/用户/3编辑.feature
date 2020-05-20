@users
Feature: 用户编辑（RZY-1554）

  Background:
    Given open the "users.ListPage" page for uri "/account/users/"

  Scenario Outline: 编辑用户信息成功（RZY-2214）
    When I click the detail which name is "{'column':'1','name':'<UserName>'}"
    And I will see the "users.CreatePage" page
    And I click the "EditButton" button
    And I set the parameter "FullName" with value "<FullName>"
    And I set the parameter "Email" with value "<Email>"
    And I set the parameter "Telephone" with value "<Telephone>"
    And I click the "Save" button

    Examples:
      | UserName        | FullName | Email                            | Telephone   |
      | AutoTestForEdit | FullName | AutoTestForUserEdit@yottabyte.cn | 13111111111 |

  Scenario: 验证用户信息编辑成功
    When I click the detail which name is "{'column':'1','name':'AutoTestForEdit'}"
    And I will see the "users.DetailPage" page
    Then I will see the element "FullName,Email,Tel" name is "FullName,AutoTestForUserEdit@yottabyte.cn,13111111111"
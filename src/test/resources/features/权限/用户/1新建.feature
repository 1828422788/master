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
    And I set the parameter "Password" with value "<Password>"
    And I click the "CreateButton" button
    And I wait for "SuccessMessage" will be visible
    Then I will see the <Result>

    @smoke @usersSmoke
    Examples:
      | UserName        | FullName         | Email                        | Password   | Result                 |
      | AutoTestForEdit | autoTestFullName | autoTestForEdit@yottabyte.cn | All#123456 | success message "创建成功" |

  Scenario Outline: 添加普通用户失败
    And I click the "CreateUser" button
    And I will see the "users.CreatePage" page
    When I set the parameter "UserName" with value "<UserName>"
    And I set the parameter "Email" with value "<Email>"
    And I set the parameter "Telephone" with value "<Telephone>"
    And I set the parameter "Password" with value "<Password>"
    And I click the "CreateButton" button
    Then I will see the element "ExplainMessage" value is "<message>"

    Examples:
      | UserName | Email                     | Telephone   | Password   | message |
      |          | autoFullName@yottabyte.cn |             | All#123456 | 请输入名称   |
      | AutoTest |                           |             | All#123456 | 请输入邮箱   |
      | AutoTest | autoFullName              | 13111111111 | All#123456 | 邮箱地址不合法 |
      | AutoTest | autoFullName@aa.          |             | All#123456 | 邮箱地址不合法 |
      | AutoTest | autoFullName@.cn          |             | All#123456 | 邮箱地址不合法 |
      | AutoTest | autoFullName.cn           |             | All#123456 | 邮箱地址不合法 |

  Scenario Outline: 用户重复校验
    And I click the "CreateUser" button
    And I will see the "users.CreatePage" page
    When I set the parameter "UserName" with value "<UserName>"
    And I set the parameter "Email" with value "<Email>"
    And I set the parameter "Password" with value "<Password>"
    And I click the "CreateButton" button
    Then I will see the success message "<message>"

    Examples:
      | UserName        | Email                        | Password      | message                                       |
      | AutoTestForEdit | autoFullName@yottabyte.cn    | qqqAll#123456 | 创建失败: account: AutoTestForEdit 已存在              |
      | fffff           | autoTestForEdit@yottabyte.cn | qqqAll#123456 | 创建失败: email: autoTestForEdit@yottabyte.cn 已存在 |

  Scenario Outline: 密码格式校验
    And I click the "CreateUser" button
    And I will see the "users.CreatePage" page
    When I set the parameter "UserName" with value "<UserName>"
    And I set the parameter "Email" with value "<Email>"
    And I set the parameter "Password" with value "<Password>"
    And I click the "CreateButton" button
    Then I will see the success message "<message>"

    Examples:
      | UserName | Email            | Password           | message                   |
      | test     | eee@yottabyte.cn | 123456             | 密码须满足：8-16个字符             |
      | test     | 22@yottabyte.cn  | qqq123456          | 密码须满足：必须同时且仅包含数字、大小写字母和特殊字符 |
      | test     | 22@yottabyte.cn  | Qqq123456          | 密码须满足：必须同时且仅包含数字、大小写字母和特殊字符 |
      | test     | 22@yottabyte.cn  | Qqq123456#12134555 | 密码须满足：8-16个字符             |
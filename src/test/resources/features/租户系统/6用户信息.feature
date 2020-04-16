@tenant
Feature: 租户系统-用户信息

Scenario Outline: 用户信息-修改管理员名称和邮箱
    Given open the "saas.SaasLoginPage" page for uri "/domain/tenant/"
#    When I set the parameter "Username" with properties "saas_username"
#    And I set the parameter "Password" with properties "saas_password"
#    And I click the "LoginButton" button
    And I will see the "tenant.ListPage" page
#修改
    And I click the "people" button
    And I click the "userInformation" button
    And I click the "modifyInformation" button
   And I set the parameter "managerName" with value "admin1"
   And I set the parameter "acceptMailbox" with value "jiang.nadie@yottabyte.cn"
    And I click the "Save" button
    Then I click the "Ensure" button
#验证
    Then I will see the "saas.SaasLoginPage" page
#输入原来的账户密码错误提示
    And I set the parameter "Username" with properties "saas_username"
    And I set the parameter "Password" with properties "saas_password"
    And I click the "LoginButton" button
    Then I will see the error message "<message>"
    And I click the "ensure" button
    And I wait for "<message>" will be invisible
#输入新的账户密码成功登陆
    And I set the parameter "Username" with value "admin1"
    And I set the parameter "Password" with properties "saas_password"
    And I click the "LoginButton" button
    Then I will see the "tenant.ListPage" page
#验证用户信息中的账户邮箱是否显示正确
    And I click the "people" button
    And I click the "userInformation" button
    Then I will see the "verifyAdminName" result will be "admin1"
    Then I will see the "verifyMailbox" result will be "jiang.nadie@yottabyte.cn"
#修改回原来的账户密码
    And I click the "modifyInformation" button
    And I set the parameter "managerName" with value "admin"
    And I set the parameter "acceptMailbox" with value "rizhiyi@yottabyte.cn"
    And I click the "Save" button
    Then I click the "Ensure" button

   Examples:
    |message|
    |超级管理员登陆失败\n错误码: AUTH_913 |


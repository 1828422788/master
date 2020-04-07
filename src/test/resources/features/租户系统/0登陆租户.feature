@all @tenant
Feature: 租户登陆（RZY-1695）

  Background:
    Given open the "saas.SaasLoginPage" page for uri "/auth/domainlogin/"

  Scenario Outline: 登录租户失败验证
    When I set the parameter "Username" with value "<name>"
    And I set the parameter "Password" with value "<password>"
    And I click the "LoginButton" button
    Then I will see the error message "<message>"

    Examples:
      | name  | password | message                |
      | test  | 111      | 超级管理员登陆失败\n错误码: AUTH_913 |
      | admin | 11       | 超级管理员登陆失败\n错误码: AUTH_913      |

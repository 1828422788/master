@all @tenant
Feature: 租户登陆

  Background:
    Given I logout current user
    And open the "saas.SaasLoginPage" page for uri "/auth/domainlogin/"

  Scenario Outline:
    When I set the parameter "Username" with value "<name>"
    And I set the parameter "Password" with value "<password>"
    And I click the "LoginButton" button
    Then I will see the error message "<message>"

    Examples:
      | name  | password | message                |
      | test  | 111      | 不存在的系统管理员\n错误码: FE_182 |
      | admin | 11       | 密码错误\n错误码: FE_183      |

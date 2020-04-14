@tenant
Feature: 租户系统-系统状态

  Background:
    Given open the "saas.SaasLoginPage" page for uri "/domain/tenant/"

Scenario: 租户系统状态
#  Given open the "saas.SaasLoginPage" page for uri "/domain/tenant/"
  When I set the parameter "Username" with properties "saas_username"
  And I set the parameter "Password" with properties "saas_password"
  And I click the "LoginButton" button
  And I will see the "tenant.ListPage" page

  And I click the "systemStatus" button
  Then take a screenshot with name "tenantStatus/租户系统状态"




  Scenario: 租户系统支持特性
#    Given open the "saas.SaasLoginPage" page for uri "/domain/tenant/"
#    When I set the parameter "Username" with properties "saas_username"
#    And I set the parameter "Password" with properties "saas_password"
#    And I click the "LoginButton" button

    And I will see the "tenant.ListPage" page
    And I click the "systemStatus" button
    And I click the "supportCharacter" button
    Then take a screenshot with name "tenantStatus/租户系统支持特性"
    Then I click the "characterRetract" button




  Scenario: 租户系统许可证详情
#    Given open the "saas.SaasLoginPage" page for uri "/domain/tenant/"
#    When I set the parameter "Username" with properties "saas_username"
#    And I set the parameter "Password" with properties "saas_password"
#    And I click the "LoginButton" button
    And I will see the "tenant.ListPage" page

    And I click the "systemStatus" button
    And I click the "permitDetails" button
    Then take a screenshot with name "tenantStatus/租户系统许可证详情"
    Then I click the "permitDetailsRetract" button







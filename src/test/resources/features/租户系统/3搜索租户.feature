@all @tenant @smoke @tenantSmoke
Feature: 租户搜索（RZY-1713）

  Background:
    Given open the "saas.SaasLoginPage" page for uri "/domain/tenant/"
    When I set the parameter "Username" with properties "saas_username"
    And I set the parameter "Password" with properties "saas_password"
    And I click the "LoginButton" button
    And I will see the "tenant.ListPage" page

  Scenario Outline:
    When I set the parameter "SearchInput" with value "<name>"
    Then I will see the search result "{'column':'1','name':'<name>'}"

    Examples:
      | name |
      | ops  |
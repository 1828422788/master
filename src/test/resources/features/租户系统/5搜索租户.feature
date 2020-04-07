@all @tenant @smoke @tenantSmoke
Feature: 租户搜索（RZY-1713）


#  Index: 0, Size: 0    list 集合没有添加非空校验

  Background:
    Given open the "saas.SaasLoginPage" page for uri "/domain/tenant/"
    When I set the parameter "Username" with properties "saas_username"
    And I set the parameter "Password" with properties "saas_password"
    And I click the "LoginButton" button
    And I will see the "tenant.ListPage" page

  Scenario Outline: 搜索租户
    When I set the parameter "SearchInput" with value "<name>"

    Then I will see the search result "{'column':'0','name':'<name>'}"
  #  Then I will see the search result contains "{'column':'1','name':'<name>'}"

    Examples:
      | name |
      | ops (ops)  |
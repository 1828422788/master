@all @tenant @smoke @tenantSmoke
Feature: 租户管理（RZY-1713）

  Scenario: RZY-1867:不同域内上传的插件互不干扰
    Given open the "alert.PluginPage" page for uri "/plugins/"
    When I click the "Upload" button
    And I upload a file with name "/src/test/resources/testdata/alertPlugins/hengshuiyinhang_socket.py"
    And I wait for "VerifyText" will be visible
    And I click the "EnsureButton" button
    And I logout current user
    And I wait for title change text to "登录"
    And open the "LoginPage" page for uri "/auth/login/"
    When I set the parameter "Username" with value "notester"
    And I set the parameter "Password" with value "all123456"
    And I click the "LoginButton" button
    Given I will see the "PublicNavBarPage" page
    And I wait for "Dashboard" will be visible
    Given open the "alert.PluginPage" page for uri "/plugins/"
    Then I will see the search result "{'column':'0','name':'hengshuiyinhang_socket','contains':'no'}"

#    undone
  Scenario: RZY-1690:SAAS租户启用机器学习
    Given I logout current user
    And I wait for title change text to "登录"
    And open the "LoginPage" page for uri "/auth/login/"
    When I set the parameter "Username" with value "notester"
    And I set the parameter "Password" with value "all123456"
    And I click the "LoginButton" button
    Given I will see the "PublicNavBarPage" page
    And I wait for "Dashboard" will be visible
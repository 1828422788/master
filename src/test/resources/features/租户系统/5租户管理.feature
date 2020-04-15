@tenant
Feature: 租户系统-租户管理

  Scenario: RZY-1867:不同域内上传的插件互不干扰
    Given open the "alert.PluginPage" page for uri "/plugins/"
    When I click the "Upload" button
    And I upload a file with name "/src/test/resources/testdata/alertPlugins/hengshuiyinhang_socket.py"
    And I wait for "VerifyText" will be visible
    And I click the "EnsureButton" button
    And I logout current user
    And I wait for title change text to "登录"
    And open the "LoginPage" page for uri "/auth/login/"
    When I set the parameter "Username" with value "first"
    And I set the parameter "Password" with value "All#123456"
    And I click the "LoginButton" button
#    Given I will see the "PublicNavBarPage" page
#    And I wait for "Dashboard" will be visible
    Given open the "alert.PluginPage" page for uri "/plugins/"
    Then I will see the search result "{'column':'0','name':'hengshuiyinhang_socket','contains':'no'}"

  Scenario: RZY-1690:取消机器学习支持特性
    Given open the "saas.SaasLoginPage" page for uri "/domain/tenant/"
#    When I set the parameter "Username" with properties "saas_username"
#    And I set the parameter "Password" with properties "saas_password"
#    And I click the "LoginButton" button
    And I will see the "tenant.ListPage" page
    When the data name is "{'column':'1','name':'no_scheduler (noschedule)'}" then i click the label "管理"
    And I will see the "tenant.CreatePage" page
    And I choose the "MachineLearning" from the "SupportFeature"
    And I click the "SaveButton" button
    Then I will see the success message "保存成功"

  Scenario: RZY-1690:验证租户无机器学习权限
    Given I logout current user
    And I wait for title change text to "登录"
    And open the "LoginPage" page for uri "/auth/login/"
    When I set the parameter "Username" with value "notester"
    And I set the parameter "Password" with value "all123456"
    And I click the "LoginButton" button
    Given I will see the "PublicNavBarPage" page
    And I wait for "Dashboard" will be visible
    Given open the "alert.PluginPage" page for uri "/app/machine_learning/showcase/"
    Then the page's title will be "403 Permission Denied"

  Scenario: RZY-1690:增加机器学习支持特性
    Given open the "saas.SaasLoginPage" page for uri "/domain/tenant/"
#    When I set the parameter "Username" with properties "saas_username"
#    And I set the parameter "Password" with properties "saas_password"
#    And I click the "LoginButton" button
    And I will see the "tenant.ListPage" page
    When the data name is "{'column':'1','name':'no_scheduler (noschedule)'}" then i click the label "管理"
    And I will see the "tenant.CreatePage" page
    And I choose the "MachineLearning" from the "SupportFeature"
    And I click the "SaveButton" button
    Then I will see the success message "保存成功"

  Scenario: RZY-1690:验证租户有机器学习权限
    Given I logout current user
    And I wait for title change text to "登录"
    And open the "LoginPage" page for uri "/auth/login/"
    When I set the parameter "Username" with value "notester"
    And I set the parameter "Password" with value "all123456"
    And I click the "LoginButton" button
    Given I will see the "PublicNavBarPage" page
    And I wait for "Dashboard" will be visible
    Given open the "alert.PluginPage" page for uri "/app/machine_learning/showcase/"
    Then the page's title will be "机器学习"
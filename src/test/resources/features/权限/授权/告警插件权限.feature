@auth
Feature: 授权告警插件

  Scenario: 上传告警插件
    Given open the "alert.PluginPage" page for uri "/plugins/"
    And I wait for loading invisible
    And I click the "Upload" button
    And I choose the "告警类型" from the "PluginType"
    And I upload a file with name "/src/test/resources/testdata/alertPlugins/sendSms.py"
    And I wait for "VerifyText" will be visible
    And I click the "EnsureButton" button
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "__user_AutoTest__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    Then I click the "{'TabButton':'告警插件'}" button
    And I wait for loading invisible
    And I "checked" the label before "sendsms"
    And I "unchecked" the label before "sendsms"
    And I click the "SaveButton" button
    And I will see the success message "保存成功"
    Then I click the "{'TabButton':'功能'}" button
    And I wait for loading invisible
    And I "checked" the checkbox which name is "可查看告警插件,可使用监控"
    And I click the "SaveButton" button

  Scenario: 验证无读取权限
    Given I will see the "PublicNavBarPage" page
    And I wait for "Dashboard" will be visible
    And I wait for loading invisible
    And I logout current user
    And I wait for title change text to "登录"
    And open the "LoginPage" page for uri "/auth/login/"
    When I set the parameter "Username" with value "AutoTest"
    And I set the parameter "Password" with value "all123456"
    And I click the "LoginButton" button
    And I wait for "2000" millsecond
    Given open the "alert.PluginPage" page for uri "/plugins/"
    Then I will see the search result "{'column':'0','name':'sendsms','contains':'no'}"

  Scenario: 授权读取
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "__user_AutoTest__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    Then I click the "{'TabButton':'告警插件'}" button
    And I wait for loading invisible
    And I "checked" the label before "sendsms"
    When I "unchecked" function "转授" from the auth table which name is "sendsms"
    And I click the "SaveButton" button
    And I will see the success message "保存成功"
    Then I click the "{'TabButton':'功能'}" button
    And I wait for loading invisible
    And I "checked" the checkbox which name is "可查看告警插件,可使用监控"
    And I click the "SaveButton" button
    Given I will see the "PublicNavBarPage" page
    And I wait for "Dashboard" will be visible
    And I logout current user
    And I wait for title change text to "登录"
    And open the "LoginPage" page for uri "/auth/login/"
    When I set the parameter "Username" with value "AutoTest"
    And I set the parameter "Password" with value "all123456"
    And I click the "LoginButton" button
    And I wait for "2000" millsecond
    Given open the "alert.PluginPage" page for uri "/plugins/"
    Then I will see the search result contains "sendsms"

  Scenario: 有效期限
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "__user_AutoTest__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    Then I click the "{'TabButton':'告警插件'}" button
    And I wait for "Loading" will be invisible
    And I "checked" the label before "sendsms"
    When the data name is "sendsms" then I click the "无期限" button without total page
    And I click the "Customize" button
    And I click the "DateEditor" button
    And I set the time input "TimeInput" to "1" minutes later
    And I click the "EnsureTime" button
    And I click the "SaveButton" button
    And I will see the success message "保存成功"
    Then I click the "{'TabButton':'功能'}" button
    And I wait for "Loading" will be invisible
    When I "checked" the checkbox which name is "全选"
    And I click the "SaveButton" button


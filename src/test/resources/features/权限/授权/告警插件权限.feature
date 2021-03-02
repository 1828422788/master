@authtest
Feature: 权限-授权告警插件

  Scenario Outline: 告警插件功能权限
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "<name>" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    And I wait for loading invisible
    And I click the "Resource" button
    When I "checked" the checkbox which name is "全选"
    And I "unchecked" the checkbox which name is "全选"
    And I "checked" the checkbox which name is "可查看告警插件"
    And I "checked" the checkbox which name is "可查看仪表盘"
    And I click the "SaveButton" button

    Examples:
      | name              |
      | __user_AutoTest__ |
      | __user_验证授权用户__   |

  Scenario: 上传告警插件
    Given open the "alert.PluginPage" page for uri "/plugins/"
    And I wait for loading invisible
    And I click the "Upload" button
    And I upload a file with name "/src/test/resources/testdata/alertPlugins/sendSms.py"
    And I click the "EnsureButton" button
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "__user_AutoTest__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    And I click the "ResourceAuth" button
    And I wait for loading invisible
    Then I click the "{'TabButton':'告警插件'}" button
    And I wait for loading invisible
    And I "checked" the checkbox which name is "sendsms" in auth table
    And I "unchecked" the checkbox which name is "sendsms" in auth table
    And I click the "SaveButton" button
    And I will see the success message "更新成功"

  @logout
  Scenario: 验证无读取权限
    Given I login user "AutoTest" with password "All#123456"
    And I wait for "2000" millsecond
    Given open the "alert.PluginPage" page for uri "/plugins/"
    Then I will see the search result "{'column':'0','name':'sendsms','contains':'no'}"

  @logout
  Scenario: 授权读取
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "__user_AutoTest__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    And I click the "ResourceAuth" button
    And I wait for loading invisible
    Then I click the "{'TabButton':'告警插件'}" button
    And I wait for loading invisible
    And I "checked" the checkbox which name is "sendsms" in auth table
    When I "unchecked" function "转授" from the auth table which name is "sendsms"
    And I click the "SaveButton" button
    And I will see the success message "更新成功"
    Then I logout current user

  Scenario: 验证读取
    Given I login user "AutoTest" with password "All#123456"
    And I wait for "2000" millsecond
    Given open the "alert.PluginPage" page for uri "/plugins/"
    When the data name is "sendsms" then i click the "授权" button
    And I wait for loading invisible
    Then I will see the checkbox in tiny table before "验证授权用户" is disabled
    Then I logout current user

  Scenario: 有效期限
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "__user_AutoTest__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    And I click the "ResourceAuth" button
    And I wait for "Loading" will be invisible
    Then I click the "{'TabButton':'告警插件'}" button
    And I wait for "Loading" will be invisible
    And I "checked" the checkbox which name is "sendsms" in auth table
    When the data name is "sendsms" then I click the "无限期" button in auth table
    And I click the "Customize" button
    And I click the "DateEditor" button
    And I set the time input "TimeInput" to "1" minutes later
    And I click the "EnsureTime" button
    And I click the "SaveButton" button
    And I will see the success message "更新成功"

  Scenario: 上传告警插件并勾选所有权限
    Given open the "alert.PluginPage" page for uri "/plugins/"
    And I wait for loading invisible
    And I click the "Upload" button
    And I upload a file with name "/src/test/resources/testdata/alertPlugins/5_baixin_alert.py"
    And I click the "EnsureButton" button
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "__user_AutoTest__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    And I click the "ResourceAuth" button
    And I wait for loading invisible
    Then I click the "{'TabButton':'告警插件'}" button
    And I wait for loading invisible
    And I "checked" the checkbox which name is "baixin_alert" in auth table
    And I click the "SaveButton" button

  Scenario: 验证转授权限
    Given I login user "AutoTest" with password "All#123456"
    And I wait for "2000" millsecond
    Given open the "alert.PluginPage" page for uri "/plugins/"
    And I wait for loading invisible
    When the data name is "baixin_alert" then i click the "授权" button
    And I "check" the checkbox which name is "验证授权用户" in tiny table
    And I click the "EnsureButton" button
    And I wait for "Message" will be visible
    Then I will see the message "保存成功"
    Given I login user "验证授权用户" with password "All#123456"
    Given open the "alert.PluginPage" page for uri "/plugins/"
    And I wait for loading invisible
    When the data name is "baixin_alert" then i click the "授权" button
    And I "uncheck" the checkbox which name is "AutoTest" in tiny table
    And I click the "EnsureButton" button
    And I wait for "Message" will be visible
    Then I will see the message "保存成功"

  Scenario: 取消可查看告警插件权限
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "__user_AutoTest__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    And I click the "Resource" button
    And I wait for "Loading" will be invisible
    And I "unchecked" the checkbox which name is "可查看告警插件"
    And I click the "SaveButton" button

  @logout
  Scenario: 验证无告警插件权限
    Given I login user "AutoTest" with password "All#123456"
    And I wait for "2000" millsecond
    Given open the "alert.ListPage" page for uri "/alerts/"
    Then I will see the "AlertPlugin" doesn't exist

  Scenario: 勾选可查看告警插件权限
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "__user_AutoTest__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    And I wait for loading invisible
    And I wait for "Resource" will be visible
    And I click the "Resource" button
    And I "checked" the checkbox which name is "可查看告警插件"
    And I click the "SaveButton" button

  @logout
  Scenario: 验证告警插件有效期限生效
    Given I login user "AutoTest" with password "All#123456"
    And I wait for "2000" millsecond
    Given open the "alert.PluginPage" page for uri "/plugins/"
    Then I will see the search result "{'column':'0','name':'sendsms','contains':'no'}"


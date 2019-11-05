Feature: 权限-监控

  Scenario: 验证无新建监控、查看告警插件的权限
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "AutoTestRole" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    Then I click the "{'TabButton':'功能'}" button
    And I wait for "Loading" will be invisible
    When I "checked" the checkbox which name is "全选"
    And I "unchecked" the checkbox which name is "新建监控,可查看告警插件"
    And I click the "SaveButton" button
    Then I will see the success message "保存成功"
    Given I will see the "PublicNavBarPage" page
    And I wait for "Dashboard" will be visible
    Given I logout current user
    And I wait for title change text to "登录"
    And open the "LoginPage" page for uri "/auth/login/"
    When I set the parameter "Username" with value "AutoTest"
    And I set the parameter "Password" with value "all123456"
    And I click the "LoginButton" button
    And I wait for "2000" millsecond
    Given open the "alert.ListPage" page for uri "/alerts/"
    Then I will see the "CreateAlert" doesn't exist
    Then I will see the "AlertPlugin" doesn't exist

  Scenario: 验证可查看告警插件，无新建告警插件权限
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "AutoTestRole" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    Then I click the "{'TabButton':'功能'}" button
    And I wait for "Loading" will be invisible
    When I "checked" the checkbox which name is "全选"
    And I "unchecked" the checkbox which name is "全选"
    And I "checked" the checkbox which name is "可查看告警插件,可使用监控"
    And I click the "SaveButton" button
    Then I will see the success message "保存成功"
    Given I will see the "PublicNavBarPage" page
    And I wait for "Dashboard" will be visible
    Given I logout current user
    And I wait for title change text to "登录"
    And open the "LoginPage" page for uri "/auth/login/"
    When I set the parameter "Username" with value "AutoTest"
    And I set the parameter "Password" with value "all123456"
    And I click the "LoginButton" button
    And I wait for "2000" millsecond
    Given open the "alert.ListPage" page for uri "/alerts/"
    Then I will see the "CreateAlert" doesn't exist
    And I click the "AlertPlugin" button
    Then I will see the "alert.PluginPage" page
    Then I will see the "Upload" doesn't exist

  Scenario: 验证可新建监控
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "AutoTestRole" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    Then I click the "{'TabButton':'功能'}" button
    And I wait for "Loading" will be invisible
    When I "checked" the checkbox which name is "全选"
    And I "unchecked" the checkbox which name is "全选"
    And I "checked" the checkbox which name is "可查看告警插件,可使用监控,新建监控"
    And I click the "SaveButton" button
    Then I will see the success message "保存成功"
    Given I will see the "PublicNavBarPage" page
    And I wait for "Dashboard" will be visible
    Given I logout current user
    And I wait for title change text to "登录"
    And open the "LoginPage" page for uri "/auth/login/"
    When I set the parameter "Username" with value "AutoTest"
    And I set the parameter "Password" with value "all123456"
    And I click the "LoginButton" button
    And I wait for "2000" millsecond
    Given open the "alert.ListPage" page for uri "/alerts/"
    And I click the "CreateAlert" button
    Then I will see the "alert.CreatePage" page
    And I set the parameter "AlertName" with value "AutoTest用户创建"
    And I set the parameter "SearchContent" with value "*"
    And I set the parameter "AlertTriggerInput" with value "8080"
    And I set the parameter "AlertLevelInput" with value "8787"
    And I click the "SaveButton" button
    Then I will see the success message "保存成功"

  Scenario: 验证可新建/更新告警插件
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "AutoTestRole" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    Then I click the "{'TabButton':'功能'}" button
    And I wait for "Loading" will be invisible
    When I "checked" the checkbox which name is "全选"
    And I "unchecked" the checkbox which name is "全选"
    And I "checked" the checkbox which name is "可查看告警插件,可新建/更新告警插件,可使用监控,新建监控"
    And I click the "SaveButton" button
    Then I will see the success message "保存成功"
    Given I will see the "PublicNavBarPage" page
    And I wait for "Dashboard" will be visible
    Given I logout current user
    And I wait for title change text to "登录"
    And open the "LoginPage" page for uri "/auth/login/"
    When I set the parameter "Username" with value "AutoTest"
    And I set the parameter "Password" with value "all123456"
    And I click the "LoginButton" button
    And I wait for "2000" millsecond
    Given open the "alert.ListPage" page for uri "/alerts/"
    And I click the "AlertPlugin" button
    Then I will see the "alert.PluginPage" page
    When I click the "Upload" button
    And I choose the "告警类型" from the "PluginType"
    And I upload a file with name "/src/test/resources/testdata/alertPlugins/5_baixin_alert.py"
    And I wait for "VerifyText" will be visible
    And I click the "EnsureButton" button
    Then I will see the success message "上传成功"

  Scenario: owner账户新建监控
    Given open the "alert.ListPage" page for uri "/alerts/"
    And I click the "CreateAlert" button
    Then I will see the "alert.CreatePage" page
    And I set the parameter "AlertName" with value "AutoTest权限验证"
    And I set the parameter "SearchContent" with value "*"
    And I set the parameter "AlertTriggerInput" with value "8080"
    And I set the parameter "AlertLevelInput" with value "8787"
    And I click the "SaveButton" button
    Then I will see the success message "保存成功"

  Scenario: 验证无任何权限
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "AutoTestRole" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    Then I click the "{'TabButton':'功能'}" button
    And I wait for "Loading" will be invisible
    When I "checked" the checkbox which name is "全选"
    And I "unchecked" the checkbox which name is "全选"
    And I "checked" the checkbox which name is "可查看告警插件,可新建/更新告警插件,可使用监控,新建监控"
    And I click the "SaveButton" button
    Then I will see the success message "保存成功"
    Given I will see the "PublicNavBarPage" page
    And I wait for "Dashboard" will be visible
    Given I logout current user
    And I wait for title change text to "登录"
    And open the "LoginPage" page for uri "/auth/login/"
    When I set the parameter "Username" with value "AutoTest"
    And I set the parameter "Password" with value "all123456"
    And I click the "LoginButton" button
    And I wait for "2000" millsecond
    Given open the "alert.ListPage" page for uri "/alerts/"
    Then I will see the search result "{'column':'1','name':'AutoTest权限验证','contains':'no'}"

  Scenario: 验证有读取权限
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "AutoTestRole" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    Then I click the "{'TabButton':'功能'}" button
    And I wait for "Loading" will be invisible
    When I "checked" the checkbox which name is "全选"
    And I "unchecked" the checkbox which name is "全选"
    And I "checked" the checkbox which name is "可查看告警插件,可新建/更新告警插件,可使用监控,新建监控"
    And I click the "SaveButton" button
    Then I click the "{'TabButton':'监控'}" button
    When I "checked" function "读取" from the auth table which name is "AutoTest权限验证"
    And I click the "SaveButton" button
    Then I will see the success message "保存成功"
    Given I will see the "PublicNavBarPage" page
    And I wait for "Dashboard" will be visible
    Given I logout current user
    And I wait for title change text to "登录"
    And open the "LoginPage" page for uri "/auth/login/"
    When I set the parameter "Username" with value "AutoTest"
    And I set the parameter "Password" with value "all123456"
    And I click the "LoginButton" button
    And I wait for "2000" millsecond
    Given open the "alert.ListPage" page for uri "/alerts/"
    Then I will see the search result contains "{'column':'1','name':'AutoTest权限验证'}"

  Scenario: 授权有读取+编辑权限
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "AutoTestRole" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    Then I click the "{'TabButton':'功能'}" button
    And I wait for "Loading" will be invisible
    When I "checked" the checkbox which name is "全选"
    And I "unchecked" the checkbox which name is "全选"
    And I "checked" the checkbox which name is "可查看告警插件,可新建/更新告警插件,可使用监控,新建监控"
    And I click the "SaveButton" button
    Then I click the "{'TabButton':'监控'}" button
    When I "checked" function "读取,编辑" from the auth table which name is "AutoTest权限验证"
    And I click the "SaveButton" button
    Then I will see the success message "保存成功"

  Scenario Outline: 验证有读取+编辑权限
    Given I will see the "PublicNavBarPage" page
    And I wait for "Dashboard" will be visible
    Given I logout current user
    And I wait for title change text to "登录"
    And open the "LoginPage" page for uri "/auth/login/"
    When I set the parameter "Username" with value "AutoTest"
    And I set the parameter "Password" with value "all123456"
    And I click the "LoginButton" button
    And I wait for "2000" millsecond
    Given open the "alert.ListPage" page for uri "/alerts/"
    And I wait for loading invisible
    Then the data name is "{'column':'1','name':'<name>'}" then i will see "编辑标签复制在搜索中打开" button
    When the data name is "{'column':'1','name':'<name>'}" then i click the "编辑" button
    Then I will see the "alert.CreatePage" page
    And I set the parameter "AlertName" with value "AutoTest权限验证修改名称"
    And I click the "SaveButton" button
    Then I will see the success message "保存成功"

    Examples:
      | name         |
      | AutoTest权限验证 |

  Scenario: 授权读取+编辑+转授权限
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "AutoTestRole" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    Then I click the "{'TabButton':'功能'}" button
    And I wait for "Loading" will be invisible
    When I "checked" the checkbox which name is "全选"
    And I "unchecked" the checkbox which name is "全选"
    And I "checked" the checkbox which name is "可查看告警插件,可新建/更新告警插件,可使用监控,新建监控"
    And I click the "SaveButton" button
    Then I click the "{'TabButton':'监控'}" button
    When I "checked" function "读取,编辑,转授" from the auth table which name is "AutoTest权限验证修改名称"
    And I click the "SaveButton" button
    Then I will see the success message "保存成功"

  Scenario Outline: 验证有读取+编辑+转授权限
    Given I will see the "PublicNavBarPage" page
    And I wait for "Dashboard" will be visible
    Given I logout current user
    And I wait for title change text to "登录"
    And open the "LoginPage" page for uri "/auth/login/"
    When I set the parameter "Username" with value "AutoTest"
    And I set the parameter "Password" with value "all123456"
    And I click the "LoginButton" button
    And I wait for "2000" millsecond
    Given open the "alert.ListPage" page for uri "/alerts/"
    And I wait for loading invisible
    Then the data name is "{'column':'1','name':'<name>'}" then i will see "编辑标签复制授权在搜索中打开" button
    When the data name is "{'column':'1','name':'<name>'}" then i click the "授权" button
    Then I will see the "alert.CreatePage" page
    And I set the parameter "AlertName" with value "AutoTest权限验证修改名称"
    And I click the "SaveButton" button
    Then I will see the success message "保存成功"

    Examples:
      | name             |
      | AutoTest权限验证修改名称 |

  Scenario: 验证在搜索中打开无权限
    Given I will see the "PublicNavBarPage" page
    And I wait for "Dashboard" will be visible
    Given I logout current user
    And I wait for title change text to "登录"
    And open the "LoginPage" page for uri "/auth/login/"
    When I set the parameter "Username" with value "AutoTest"
    And I set the parameter "Password" with value "all123456"
    And I click the "LoginButton" button
    And I wait for "2000" millsecond
    Given open the "alert.ListPage" page for uri "/alerts/"
    And I wait for loading invisible
    When the data name is "{'column':'1','name':'AutoTest权限验证修改名称'}" then i click the "在搜索中打开" button
    And switch to another window
    And I wait for loading invisible
    Then the page's title will be "403 Permission Denied"

  Scenario: 授权可使用搜索页
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "AutoTestRole" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    Then I click the "{'TabButton':'功能'}" button
    And I wait for "Loading" will be invisible
    When I "checked" the checkbox which name is "全选"
    And I "unchecked" the checkbox which name is "全选"
    And I "checked" the checkbox which name is "可使用搜索权限,可使用监控,新建监控,可使用搜索页,可使用数据集"
    And I click the "SaveButton" button
    Then I click the "{'TabButton':'监控'}" button
    When I "checked" function "读取,编辑,转授" from the auth table which name is "AutoTest权限验证修改名称"
    And I click the "SaveButton" button
    Then I will see the success message "保存成功"

  Scenario: 验证在搜索中打开有权限
    Given I will see the "PublicNavBarPage" page
    And I wait for "Dashboard" will be visible
    Given I logout current user
    And I wait for title change text to "登录"
    And open the "LoginPage" page for uri "/auth/login/"
    When I set the parameter "Username" with value "AutoTest"
    And I set the parameter "Password" with value "all123456"
    And I click the "LoginButton" button
    And I wait for "2000" millsecond
    Given open the "alert.ListPage" page for uri "/alerts/"
    And I wait for loading invisible
    When the data name is "{'column':'1','name':'AutoTest权限验证修改名称'}" then i click the "在搜索中打开" button
    And switch to another window
    And I wait for loading invisible
    Then the page's title will be "搜索"
    And I will see the "splSearch.SearchPage" page
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"

  Scenario: 授权读取+删除权限
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "AutoTestRole" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    Then I click the "{'TabButton':'功能'}" button
    And I wait for "Loading" will be invisible
    When I "checked" the checkbox which name is "全选"
    And I "unchecked" the checkbox which name is "全选"
    And I "checked" the checkbox which name is "可使用监控,新建监控"
    And I click the "SaveButton" button
    Then I click the "{'TabButton':'监控'}" button
    When I "checked" function "读取,删除" from the auth table which name is "AutoTest权限验证修改名称"
    And I "unchecked" function "编辑,转授" from the auth table which name is "AutoTest权限验证修改名称"
    And I click the "SaveButton" button
    Then I will see the success message "保存成功"

  Scenario Outline: 验证有读取+删除权限
    Given I will see the "PublicNavBarPage" page
    And I wait for "Dashboard" will be visible
    Given I logout current user
    And I wait for title change text to "登录"
    And open the "LoginPage" page for uri "/auth/login/"
    When I set the parameter "Username" with value "AutoTest"
    And I set the parameter "Password" with value "all123456"
    And I click the "LoginButton" button
    And I wait for "2000" millsecond
    Given open the "alert.ListPage" page for uri "/alerts/"
    And I wait for loading invisible
    When the data name is "{'column':'1','name':'<name>'}" then i click the "删除" button
    And I click the "Ensure" button

    Examples:
      | name             |
      | AutoTest权限验证修改名称 |
      | AutoTest用户创建     |

  Scenario: 验证删除成功
    Given open the "alert.ListPage" page for uri "/alerts/"
    And I wait for loading invisible
    And I set the parameter "SearchInput" with value "AutoTest权限验证修改名称"
    And I wait for loading invisible
    Then I will see the element "NoneData" name is "暂无数据"


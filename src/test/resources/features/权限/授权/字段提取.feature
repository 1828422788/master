Feature: 权限-字段提取

  Scenario: 验证无新建权限
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "AutoTestRole" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    Then I click the "{'TabButton':'功能'}" button
    And I wait for "Loading" will be invisible
    When I "checked" the checkbox which name is "全选"
    And I "unchecked" the checkbox which name is "新建字段提取"
    And I click the "SaveButton" button
    And I will see the success message "保存成功"
    Given I will see the "PublicNavBarPage" page
    And I wait for "Dashboard" will be visible
    And I logout current user
    And I wait for title change text to "登录"
    And open the "LoginPage" page for uri "/auth/login/"
    When I set the parameter "Username" with value "AutoTest"
    And I set the parameter "Password" with value "all123456"
    And I click the "LoginButton" button
    And I wait for "2000" millsecond
    Given open the "configs.ListPage" page for uri "/configs/"
    And I wait for loading invisible
    Then I will see the "CreateButton" doesn't exist

  Scenario: 验证有新建权限
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "AutoTestRole" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    Then I click the "{'TabButton':'功能'}" button
    And I wait for "Loading" will be invisible
    When I "checked" the checkbox which name is "全选"
    And I click the "SaveButton" button
    And I will see the success message "保存成功"
    Given I will see the "PublicNavBarPage" page
    And I wait for "Dashboard" will be visible
    And I logout current user
    And I wait for title change text to "登录"
    And open the "LoginPage" page for uri "/auth/login/"
    When I set the parameter "Username" with value "AutoTest"
    And I set the parameter "Password" with value "all123456"
    And I click the "LoginButton" button
    And I wait for "2000" millsecond
    Given open the "configs.ListPage" page for uri "/configs/"
    And I click the "CreateButton" button
    Then I will see the "configs.CreatePage" page
    And I click the "AddRule" button
    And I choose the "CSV解析" from the "ParseRule"
    And I choose the "raw_message" from the "SourceField"
    And I set the parameter "Separate" with value ","
    And I set the parameter "FieldList" with value "1,2,3,4,5"
    And I click the "EnsureAddParseRule" button
    And I click the "NextButton" button under some element
    And I click the "SwitchButton" button
    When I set the parameter "Name" with value "AutoTestUserCreate"
    And I set the parameter "Logtype" with value "other"
    And I click the "NextButton" button
    Then I wait for "ConfigDone" will be visible

  Scenario: 取消读取权限
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "__user_AutoTest__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    Then I click the "{'TabButton':'字段提取'}" button
    And I wait for "Loading" will be invisible
    And I "checked" the label before "AutoTestUserCreate"
    And I "unchecked" the label before "AutoTestUserCreate"
    And I click the "SaveButton" button
    And I will see the success message "保存成功"
    Given I will see the "PublicNavBarPage" page
    And I wait for "Dashboard" will be visible
    And I logout current user
    And I wait for title change text to "登录"
    And open the "LoginPage" page for uri "/auth/login/"
    When I set the parameter "Username" with value "AutoTest"
    And I set the parameter "Password" with value "all123456"
    And I click the "LoginButton" button
    And I wait for "2000" millsecond
    Given open the "configs.ListPage" page for uri "/configs/"
    Then I will see the search result "{'column':'0','name':'AutoTestUserCreate','contains':'no'}"

  Scenario: 授权读取权限
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "__user_AutoTest__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    Then I click the "{'TabButton':'字段提取'}" button
    And I wait for "Loading" will be invisible
    And I "checked" the label before "AutoTestUserCreate"
    And I "unchecked" the label before "AutoTestUserCreate"
    When I "checked" function "读取" from the auth table which name is "AutoTestUserCreate"
    And I click the "SaveButton" button
    And I will see the success message "保存成功"

  Scenario: 验证读取权限
    Given I will see the "PublicNavBarPage" page
    And I wait for "Dashboard" will be visible
    And I logout current user
    And I wait for title change text to "登录"
    And open the "LoginPage" page for uri "/auth/login/"
    When I set the parameter "Username" with value "AutoTest"
    And I set the parameter "Password" with value "all123456"
    And I click the "LoginButton" button
    And I wait for "2000" millsecond
    Given open the "configs.ListPage" page for uri "/configs/"
    Then the data name is "{'column':'1','name':'AutoTestUserCreate'}" then i will see "查看复制授权" button
    And the data name is "{'column':'1','name':'AutoTestUserCreate'}" then i click the "授权" button
    Then I wait for "NoAuth" will be visible

  Scenario: 授权读取+编辑权限
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "__user_AutoTest__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    Then I click the "{'TabButton':'字段提取'}" button
    And I wait for "Loading" will be invisible
    And I "checked" the label before "AutoTestUserCreate"
    When I "unchecked" function "删除,转授" from the auth table which name is "AutoTestUserCreate"
    And I click the "SaveButton" button
    And I will see the success message "保存成功"

  Scenario: 验证读取+编辑权限
    Given I will see the "PublicNavBarPage" page
    And I wait for "Dashboard" will be visible
    And I logout current user
    And I wait for title change text to "登录"
    And open the "LoginPage" page for uri "/auth/login/"
    When I set the parameter "Username" with value "AutoTest"
    And I set the parameter "Password" with value "all123456"
    And I click the "LoginButton" button
    And I wait for "2000" millsecond
    Given open the "configs.ListPage" page for uri "/configs/"
    Then the data name is "{'column':'1','name':'AutoTestUserCreate'}" then i will see "编辑标签复制授权" button
    When the data name is "{'column':'1','name':'AutoTestUserCreate'}" then i click the "编辑" button
    Then I will see the "configs.CreatePage" page
    When I set the parameter "LogSample" with value "192.168.1.200,xmxm,rzy,13800000000"
    And I click the "NextButton" button under some element
    When I set the parameter "Name" with value "AutoTestUserRename"
    And I click the "NextButton" button
    Then I wait for "ConfigDone" will be visible

  Scenario: 验证标签及搜索
    Given I will see the "PublicNavBarPage" page
    And I wait for "Dashboard" will be visible
    And I logout current user
    And I wait for title change text to "登录"
    And open the "LoginPage" page for uri "/auth/login/"
    When I set the parameter "Username" with value "AutoTest"
    And I set the parameter "Password" with value "all123456"
    And I click the "LoginButton" button
    And I wait for "2000" millsecond
    Given open the "configs.ListPage" page for uri "/configs/"
    When the data name is "{'column':'1','name':'AutoTestUserRename'}" then i click the "标签" button
    And I set the parameter "TagInput" with value "自动化测试标签"
    And I choose the "自动化测试标签" from the "Group"
    And I click the "Ensure" button
    Then I will see the success message "修改成功"
    And I choose the "default_Alert" from the "ResourceDropdown"
    Then I will see the element "EmptyData" name is "暂无数据"
    And I refresh the website
    And I wait for loading invisible
    And I choose the "自动化测试标签" from the "ResourceDropdown"
    Then I will see the search result "{'column':'1','name':'AutoTestUserRename'}"

  Scenario: 授权读取+转授
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "__user_AutoTest__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    Then I click the "{'TabButton':'字段提取'}" button
    And I wait for "Loading" will be invisible
    And I "checked" the label before "AutoTestUserRename"
    When I "unchecked" function "编辑,删除" from the auth table which name is "AutoTestUserRename"
    And I click the "SaveButton" button
    And I will see the success message "保存成功"

#    Scenario: 验证读取+转授

  Scenario: 授权所有权限
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "__user_AutoTest__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    Then I click the "{'TabButton':'字段提取'}" button
    And I wait for "Loading" will be invisible
    And I "checked" the label before "AutoTestUserRename"
    And I click the "SaveButton" button
    And I will see the success message "保存成功"

  Scenario: 验证所有权限
    Given I will see the "PublicNavBarPage" page
    And I wait for "Dashboard" will be visible
    And I logout current user
    And I wait for title change text to "登录"
    And open the "LoginPage" page for uri "/auth/login/"
    When I set the parameter "Username" with value "AutoTest"
    And I set the parameter "Password" with value "all123456"
    And I click the "LoginButton" button
    And I wait for "2000" millsecond
    Given open the "configs.ListPage" page for uri "/configs/"
    Then the data name is "{'column':'1','name':'AutoTestUserRename'}" then i will see "编辑标签复制删除授权" button
    When the data name is "{'column':'1','name':'AutoTestUserRename'}" then i click the "删除" button
    And I click the "Ensure" button
    Then I wait for "SuccessMessage" will be visible

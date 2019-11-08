Feature: 权限-定时任务

  Scenario: 验证无新建权限
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "AutoTestRole" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    Then I click the "{'TabButton':'功能'}" button
    And I wait for "Loading" will be invisible
    When I "checked" the checkbox which name is "全选"
    And I "unchecked" the checkbox which name is "新建定时任务"
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
    Given open the "splSearch.SearchPage" page for uri "/search/"
    And I set the parameter "SearchInput" with value "tag:sample04061424_chart | bucket timestamp span=1h as ts | stats count(apache.clientip) as c_ip by ts"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I click the "SaveAsOther" button
    Then I will see the "TimedTask" doesn't exist

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
    Given open the "splSearch.SearchPage" page for uri "/search/"
    And I set the parameter "SearchInput" with value "tag:sample04061424_chart | bucket timestamp span=1h as ts | stats count(apache.clientip) as c_ip by ts"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I click the "SaveAsOther" button
    And I click the "TimedTask" button
    And I set the parameter "TaskName" with value "AutoTestCreate"
    And I click the "Crontab" button
    And I set the parameter "CrontabInput" with value "0 0 0/10 * * ?"
    And I click the "EnsureCrontab" button
    Then I will see the success message "保存成功"

  Scenario: 验证无读取权限
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "__user_AutoTest__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    Then I click the "{'TabButton':'定时任务'}" button
    And I wait for "Loading" will be invisible
    And I "checked" the label before "AutoTestCreate"
    And I "unchecked" the label before "AutoTestCreate"
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
    Given open the "timedTask.ListPage" page for uri "/schedule/"
    Then I will see the search result "{'column':'2','name':'AutoTestCreate','contains':'no'}"

  Scenario: 授权有读取权限
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "__user_AutoTest__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    Then I click the "{'TabButton':'定时任务'}" button
    And I wait for "Loading" will be invisible
    And I "checked" the label before "AutoTestCreate"
    And I "unchecked" the label before "AutoTestCreate"
    When I "checked" function "读取" from the auth table which name is "AutoTestCreate"
    And I click the "SaveButton" button
    And I will see the success message "保存成功"

  Scenario: 验证有读取权限
    Given I will see the "PublicNavBarPage" page
    And I wait for "Dashboard" will be visible
    And I logout current user
    And I wait for title change text to "登录"
    And open the "LoginPage" page for uri "/auth/login/"
    When I set the parameter "Username" with value "AutoTest"
    And I set the parameter "Password" with value "all123456"
    And I click the "LoginButton" button
    And I wait for "2000" millsecond
    Given open the "timedTask.ListPage" page for uri "/schedule/"
    Then the data name is "{'column':'2','name':'AutoTestCreate'}" then i will see "查看复制授权" button
    And the data name is "{'column':'2','name':'AutoTestCreate'}" then i click the "授权" button
#    Then I wait for "NoAuth" will be visible

  Scenario: 授权读取+编辑
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "__user_AutoTest__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    Then I click the "{'TabButton':'定时任务'}" button
    And I wait for "Loading" will be invisible
    And I "checked" the label before "AutoTestCreate"
    When I "unchecked" function "删除,转授" from the auth table which name is "AutoTestCreate"
    And I click the "SaveButton" button
    And I will see the success message "保存成功"

  Scenario: 验证读取+编辑
    Given I will see the "PublicNavBarPage" page
    And I wait for "Dashboard" will be visible
    And I logout current user
    And I wait for title change text to "登录"
    And open the "LoginPage" page for uri "/auth/login/"
    When I set the parameter "Username" with value "AutoTest"
    And I set the parameter "Password" with value "all123456"
    And I click the "LoginButton" button
    And I wait for "2000" millsecond
    Given open the "timedTask.ListPage" page for uri "/schedule/"
    Then the data name is "{'column':'2','name':'AutoTestCreate'}" then i will see "编辑复制标签授权" button
    When the data name is "{'column':'2','name':'AutoTestCreate'}" then i click the "标签" button
    And I set the parameter "Tag" with value "测试标签"
    And I choose the "测试标签" from the "TagDropdown"
    And I click the "Ensure" button
    Then I will see the success message "更新成功"
    When the data name is "{'column':'2','name':'AutoTestCreate'}" then i click the "编辑" button
    Then I will see the "timedTask.EditPage" page
    And I set the parameter "Name" with value "AutoTestRename"
    And I click the "SaveButton" button
    Then I will see the success message "保存成功"

#  Scenario: 验证无转授权限

  Scenario: 授权读取+删除
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "__user_AutoTest__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    Then I click the "{'TabButton':'定时任务'}" button
    And I wait for "Loading" will be invisible
    And I "checked" the label before "AutoTestRename"
    When I "unchecked" function "编辑,转授" from the auth table which name is "AutoTestRename"
    And I click the "SaveButton" button
    And I will see the success message "保存成功"

  Scenario: 取消新建权限
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "AutoTestRole" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    Then I click the "{'TabButton':'功能'}" button
    And I wait for "Loading" will be invisible
    When I "checked" the checkbox which name is "全选"
    And I "unchecked" the checkbox which name is "新建定时任务"
    And I click the "SaveButton" button
    And I will see the success message "保存成功"

  Scenario: 验证读取+删除
    Given I will see the "PublicNavBarPage" page
    And I wait for "Dashboard" will be visible
    And I logout current user
    And I wait for title change text to "登录"
    And open the "LoginPage" page for uri "/auth/login/"
    When I set the parameter "Username" with value "AutoTest"
    And I set the parameter "Password" with value "all123456"
    And I click the "LoginButton" button
    And I wait for "2000" millsecond
    Given open the "timedTask.ListPage" page for uri "/schedule/"
    Then the data name is "{'column':'2','name':'AutoTestRename'}" then i will see "查看授权删除" button
    When the data name is "{'column':'2','name':'AutoTestRename'}" then i click the "删除" button
    And I click the "Ensure" button
    Then I will see the success message "删除成功"
Feature: 权限-趋势图

  Scenario: 验证无新建权限
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "__user_AutoTest__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    Then I click the "{'TabButton':'功能'}" button
    And I wait for "Loading" will be invisible
    When I "checked" the checkbox which name is "全选"
    And I "unchecked" the checkbox which name is "新建趋势图"
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
    And open the "trend.ListPage" page for uri "/trend/"
    Then I will see the "Create" doesn't exist

  Scenario: 新建趋势图
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "__user_AutoTest__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    Then I click the "{'TabButton':'功能'}" button
    And I wait for "Loading" will be invisible
    When I "checked" the checkbox which name is "全选"
    When I "unchecked" the checkbox which name is "全选"
    And I "checked" the checkbox which name is "可使用搜索权限,可使用数据集,可使用趋势图,新建趋势图,可使用应用功能,可使用搜索页"
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
    And open the "trend.ListPage" page for uri "/trend/"
    And I click the "Create" button
    Then I will see the "trend.CreatePage" page
    When I set the parameter "NameInput" with value "AutoTest"
    And I click the "NextButton" button
    And I set the parameter "SearchInput" with value "tag:*display | stats count() by apache.clientip,apache.resp_len | limit 10 "
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for "Header" will be visible
    And I click the "NextButton" button
    And I click the "NextButton" button
    Then I will see the element "SuccessCreate" name is "新建成功！"

  Scenario: 复制
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "__user_AutoTest__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    Then I click the "{'TabButton':'功能'}" button
    And I wait for "Loading" will be invisible
    When I "checked" the checkbox which name is "全选"
    When I "unchecked" the checkbox which name is "全选"
    And I "checked" the checkbox which name is "可使用搜索权限,可使用数据集,可使用趋势图,新建趋势图,可使用应用功能,可使用搜索页"
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
    And open the "trend.ListPage" page for uri "/trend/"
    When the data name is "AutoTest" then i click the "复制" button
    Then I will see the message "复制成功"
    And open the "trend.ListPage" page for uri "/trend/"
    Then I will see the search result contains "AutoTest(副本)"

  Scenario: 根据名称搜索
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "__user_AutoTest__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    Then I click the "{'TabButton':'功能'}" button
    And I wait for "Loading" will be invisible
    When I "checked" the checkbox which name is "全选"
    When I "unchecked" the checkbox which name is "全选"
    And I "checked" the checkbox which name is "可使用搜索权限,可使用数据集,可使用趋势图,新建趋势图,可使用应用功能,可使用搜索页"
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
    And open the "trend.ListPage" page for uri "/trend/"
    And I wait for loading invisible
    And I set the parameter "SearchInput" with value "副本"
    And I wait for loading invisible
    Then I will see the search result "AutoTest(副本)"

  Scenario: 不授予任何权限
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "__user_AutoTest__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    Then I click the "{'TabButton':'功能'}" button
    And I wait for "Loading" will be invisible
    When I "checked" the checkbox which name is "全选"
    When I "unchecked" the checkbox which name is "全选"
    And I "checked" the checkbox which name is "可使用搜索权限,可使用数据集,可使用趋势图,新建趋势图,可使用应用功能,可使用搜索页"
    And I click the "SaveButton" button
    And I will see the success message "保存成功"
    Then I click the "{'TabButton':'趋势图'}" button
    And I wait for loading invisible
    And I "checked" the label before "AutoTest(副本)"
    And I "unchecked" the label before "AutoTest(副本)"
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
    And open the "trend.ListPage" page for uri "/trend/"
    And I wait for loading invisible
    Then I will see the search result "{'column':'0','name':'AutoTest(副本)','contains':'no'}"

  Scenario: 仅授权读取
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "__user_AutoTest__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    Then I click the "{'TabButton':'功能'}" button
    And I wait for "Loading" will be invisible
    When I "checked" the checkbox which name is "全选"
    When I "unchecked" the checkbox which name is "全选"
    And I "checked" the checkbox which name is "可使用搜索权限,可使用数据集,可使用趋势图,新建趋势图,可使用应用功能,可使用搜索页"
    And I click the "SaveButton" button
    And I will see the success message "保存成功"
    Then I click the "{'TabButton':'趋势图'}" button
    And I wait for loading invisible
    And I "checked" the label before "AutoTest(副本)"
    And I "unchecked" the label before "AutoTest(副本)"
    When I "checked" function "读取" from the auth table which name is "AutoTest(副本)"
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
    And open the "trend.ListPage" page for uri "/trend/"
    And I wait for loading invisible
    Then the data name is "{'column':'0','name':'AutoTest(副本)'}" then i will see "查看复制授权" button

  Scenario: 验证复制权限
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "__user_AutoTest__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    Then I click the "{'TabButton':'功能'}" button
    And I wait for "Loading" will be invisible
    When I "checked" the checkbox which name is "全选"
    When I "unchecked" the checkbox which name is "全选"
    And I "checked" the checkbox which name is "可使用搜索权限,可使用数据集,可使用趋势图,可使用应用功能,可使用搜索页"
    And I click the "SaveButton" button
    And I will see the success message "保存成功"
    Then I click the "{'TabButton':'趋势图'}" button
    And I wait for loading invisible
    And I "checked" the label before "AutoTest(副本)"
    And I "unchecked" the label before "AutoTest(副本)"
    When I "checked" function "读取" from the auth table which name is "AutoTest(副本)"
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
    And open the "trend.ListPage" page for uri "/trend/"
    And I wait for loading invisible
    Then the data name is "{'column':'0','name':'AutoTest(副本)'}" then i will see "查看授权" button

  Scenario: 验证读取+编辑
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "__user_AutoTest__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    Then I click the "{'TabButton':'功能'}" button
    And I wait for "Loading" will be invisible
    When I "checked" the checkbox which name is "全选"
    When I "unchecked" the checkbox which name is "全选"
    And I "checked" the checkbox which name is "可使用搜索权限,可使用数据集,可使用趋势图,可使用应用功能,可使用搜索页"
    And I click the "SaveButton" button
    And I will see the success message "保存成功"
    Then I click the "{'TabButton':'趋势图'}" button
    And I wait for loading invisible
    And I "checked" the label before "AutoTest(副本)"
    And I "unchecked" the label before "AutoTest(副本)"
    When I "checked" function "读取,编辑" from the auth table which name is "AutoTest(副本)"
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
    And open the "trend.ListPage" page for uri "/trend/"
    And I wait for loading invisible
    Then the data name is "{'column':'0','name':'AutoTest(副本)'}" then i will see "编辑标签授权" button
    When the data name is "AutoTest(副本)" then i click the "编辑" button
    Then I will see the "trend.CreatePage" page
    And I wait for loading invisible
    And I set the parameter "NameInput" with value "AutoEditCopy"
    And I click the "NextButton" button
    And I wait for "Header" will be visible
    And I click the "NextButton" button
    And I click the "NextButton" button
    Then I will see the element "SuccessUpdate" name is "更新成功"
    And I click the "Report" button
    And switch to another window
    Then the page's title will be "403 Permission Denied"

  Scenario: 修改标签
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "__user_AutoTest__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    Then I click the "{'TabButton':'功能'}" button
    And I wait for "Loading" will be invisible
    When I "checked" the checkbox which name is "全选"
    When I "unchecked" the checkbox which name is "全选"
    And I "checked" the checkbox which name is "可使用搜索权限,可使用数据集,可使用趋势图,可使用应用功能,可使用搜索页"
    And I click the "SaveButton" button
    And I will see the success message "保存成功"
    Then I click the "{'TabButton':'趋势图'}" button
    And I wait for loading invisible
    And I "checked" the label before "AutoEditCopy"
    And I "unchecked" the label before "AutoEditCopy"
    When I "checked" function "读取,编辑" from the auth table which name is "AutoEditCopy"
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
    And open the "trend.ListPage" page for uri "/trend/"
    When the data name is "AutoEditCopy" then i click the "标签" button
    And I set the parameter "Tag" with value "AutoTag"
    And I choose the "AutoTag" from the "TagDropdown"
    And I click the "Ensure" button
    Then I will see the success message "更新成功"

  Scenario: 根据标签搜索
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "__user_AutoTest__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    Then I click the "{'TabButton':'功能'}" button
    And I wait for "Loading" will be invisible
    When I "checked" the checkbox which name is "全选"
    When I "unchecked" the checkbox which name is "全选"
    And I "checked" the checkbox which name is "可使用搜索权限,可使用数据集,可使用趋势图,可使用应用功能,可使用搜索页"
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
    And open the "trend.ListPage" page for uri "/trend/"
    And I wait for loading invisible
    And I choose the "AutoTag" from the "ResourceDropdown"
    And I wait for loading invisible
    Then I will see the search result "AutoEditCopy"

  Scenario: 验证读取+删除
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "__user_AutoTest__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    Then I click the "{'TabButton':'功能'}" button
    And I wait for "Loading" will be invisible
    When I "checked" the checkbox which name is "全选"
    When I "unchecked" the checkbox which name is "全选"
    And I "checked" the checkbox which name is "可使用搜索权限,可使用数据集,可使用趋势图,可使用应用功能,可使用搜索页"
    And I click the "SaveButton" button
    And I will see the success message "保存成功"
    Then I click the "{'TabButton':'趋势图'}" button
    And I wait for loading invisible
    And I "checked" the label before "AutoEditCopy"
    When I "unchecked" function "编辑,转授" from the auth table which name is "AutoEditCopy"
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
    And open the "trend.ListPage" page for uri "/trend/"
    And I wait for loading invisible
    Then the data name is "{'column':'0','name':'AutoEditCopy'}" then i will see "查看删除授权" button
    When the data name is "AutoEditCopy" then i click the "删除" button
    And I click the "Ensure" button
    Then I will see the success message "删除成功"

  Scenario: 删除趋势图
    And open the "trend.ListPage" page for uri "/trend/"
    And I wait for loading invisible
    When the data name is "AutoTest" then i click the "删除" button
    And I click the "Ensure" button
    Then I will see the success message "删除成功"
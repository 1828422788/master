#@auth
Feature: 权限-搜索权限

  Scenario Outline: 无读取权限
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "__user_AutoTest__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    And I wait for "Loading" will be invisible
    Then I click the "{'TabButton':'功能'}" button
    And I wait for "Loading" will be invisible
    When I "checked" the checkbox which name is "全选"
    And I "unchecked" the checkbox which name is "全选"
    And I "checked" the checkbox which name is "可使用搜索权限"
    And I click the "SaveButton" button
    And I will see the success message "更新成功"
    Then I click the "{'TabButton':'搜索权限'}" button
    And I wait for loading invisible
    And I "checked" the checkbox which name is "<name>" in auth table
    And I "unchecked" the checkbox which name is "<name>" in auth table
    And I click the "SaveButton" button
    Given I will see the "PublicNavBarPage" page
    And I wait for "Dashboard" will be visible
    And I logout current user
    And I wait for title change text to "登录"
    And open the "LoginPage" page for uri "/auth/login/"
    When I set the parameter "Username" with value "AutoTest"
    And I set the parameter "Password" with value "All#123456"
    And I click the "LoginButton" button
    And I wait for "2000" millsecond
    Given open the "queryScopes.ListPage" page for uri "/queryscopes/"
    Then I will see the search result "{'column':'0','name':'<name>','contains':'no'}"

    Examples:
      | name       |
      | SearchAuth |

  Scenario Outline: 仅授权读取
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "__user_AutoTest__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    And I wait for "Loading" will be invisible
    Then I click the "{'TabButton':'功能'}" button
    And I wait for "Loading" will be invisible
    When I "checked" the checkbox which name is "全选"
    And I "unchecked" the checkbox which name is "全选"
    And I "checked" the checkbox which name is "可使用搜索权限"
    And I click the "SaveButton" button
    And I will see the success message "更新成功"
    Then I click the "{'TabButton':'搜索权限'}" button
    And I wait for loading invisible
    And I "checked" the checkbox which name is "<name>" in auth table
    When I "unchecked" function "转授" from the auth table which name is "<name>"
    And I click the "SaveButton" button
    Given I will see the "PublicNavBarPage" page
    And I wait for "Dashboard" will be visible
    And I logout current user
    And I wait for title change text to "登录"
    And open the "LoginPage" page for uri "/auth/login/"
    When I set the parameter "Username" with value "AutoTest"
    And I set the parameter "Password" with value "All#123456"
    And I click the "LoginButton" button
    And I wait for "2000" millsecond
    Given open the "queryScopes.ListPage" page for uri "/queryscopes/"
    And I wait for loading invisible
    Then the data name is "{'column':'0','name':'<name>'}" then i will see "查看授权" button
    And the data name is "{'column':'0','name':'<name>'}" then i click the "授权" button
    And I wait for loading invisible
    Then I will see the checkbox in tiny table before "验证授权用户" is disabled

    Examples:
      | name       |
      | SearchAuth |

  Scenario Outline: 授权所有权限
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "__user_AutoTest__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    And I wait for "Loading" will be invisible
    Then I click the "{'TabButton':'功能'}" button
    And I wait for "Loading" will be invisible
    When I "checked" the checkbox which name is "全选"
    And I click the "SaveButton" button
    And I will see the success message "更新成功"
    Then I click the "{'TabButton':'搜索权限'}" button
    And I wait for loading invisible
    And I "checked" the checkbox which name is "<name>" in auth table
    And I click the "SaveButton" button
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "__user_验证授权用户__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    And I wait for "Loading" will be invisible
    Then I click the "{'TabButton':'功能'}" button
    And I wait for "Loading" will be invisible
    When I "checked" the checkbox which name is "全选"
    And I click the "SaveButton" button
    Given I will see the "PublicNavBarPage" page
    And I wait for "Dashboard" will be visible
    And I logout current user
    And I wait for title change text to "登录"
    And open the "LoginPage" page for uri "/auth/login/"
    When I set the parameter "Username" with value "AutoTest"
    And I set the parameter "Password" with value "All#123456"
    And I click the "LoginButton" button
    And I wait for "2000" millsecond
    Given open the "queryScopes.ListPage" page for uri "/queryscopes/"
    And I wait for loading invisible
    Then the data name is "{'column':'0','name':'<name>'}" then i will see "查看授权" button
    And the data name is "{'column':'0','name':'<name>'}" then i click the "授权" button
    And I "check" the checkbox which name is "验证授权用户" in tiny table
    And I click the "Ensure" button
    And I wait for "Message" will be visible
    Then I will see the message "保存成功"
    And I logout current user
    And I wait for title change text to "登录"
    And open the "LoginPage" page for uri "/auth/login/"
    When I set the parameter "Username" with value "验证授权用户"
    And I set the parameter "Password" with value "All#123456"
    And I click the "LoginButton" button
    And I wait for "2000" millsecond
    Given open the "queryScopes.ListPage" page for uri "/queryscopes/"
    And I wait for loading invisible
    Then the data name is "{'column':'0','name':'<name>'}" then i will see "查看授权" button

    Examples:
      | name       |
      | SearchAuth |

  Scenario: 有效期限
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "__user_AutoTest__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    And I wait for "Loading" will be invisible
    Then I click the "{'TabButton':'功能'}" button
    And I wait for "Loading" will be invisible
    When I "checked" the checkbox which name is "全选"
    And I click the "SaveButton" button
    Then I click the "{'TabButton':'搜索权限'}" button
    And I wait for loading invisible
    And I "checked" the checkbox which name is "SearchAuth" in auth table
    When the data name is "SearchAuth" then I click the "无限期" button in auth table
    And I click the "Customize" button
    And I click the "DateEditor" button
    And I set the time input "TimeInput" to "1" minutes later
    And I click the "EnsureTime" button
    And I click the "SaveButton" button
    And I will see the success message "更新成功"

  Scenario: 新建搜索权限
    Given open the "queryScopes.ListPage" page for uri "/queryscopes/"
    And I click the "Create" button
    And I set the parameter "Name" with value "测试二次授权"
    And I set the parameter "Appname" with value "*"
    And I click the "Ensure" button
    Then I will see the success message "操作成功"

  Scenario: 给AutoTest授权所有权限
    Given open the "queryScopes.ListPage" page for uri "/queryscopes/"
    And the data name is "{'column':'0','name':'测试二次授权'}" then i click the "授权" button
    And I "check" the checkbox which name is "AutoTest" in tiny table
    And I click the "Ensure" button
    Then I will see the message "保存成功"

  Scenario: 验证有效期限
    When I wait for "2000" millsecond
    And I logout current user
    And I wait for title change text to "登录"
    And open the "LoginPage" page for uri "/auth/login/"
    When I set the parameter "Username" with value "AutoTest"
    And I set the parameter "Password" with value "All#123456"
    And I click the "LoginButton" button
    And I wait for "2000" millsecond
    Given open the "queryScopes.ListPage" page for uri "/queryscopes/"
    And I wait for loading invisible
    Then I will see the search result "{'column':'0','name':'SearchAuth','contains':'no'}"

  Scenario Outline: 二次授权读取
    When I wait for "2000" millsecond
    And I logout current user
    And I wait for title change text to "登录"
    And open the "LoginPage" page for uri "/auth/login/"
    When I set the parameter "Username" with value "AutoTest"
    And I set the parameter "Password" with value "All#123456"
    And I click the "LoginButton" button
    And I wait for "2000" millsecond
    Given open the "queryScopes.ListPage" page for uri "/queryscopes/"
    And I wait for loading invisible
    When the data name is "<name>" then i click the "授权" button
    And I choose the "<authRole>" from the "AuthDropdown"
    When I "check" the function "<function>" which name is "<authName>" in tiny table
    And I click the "Ensure" button
    And I wait for "Message" will be visible
    Then I will see the message "保存成功"
    Given I will see the "PublicNavBarPage" page
    And I wait for "Dashboard" will be visible
    And I wait for loading invisible
    And I logout current user
    And I wait for title change text to "登录"
    And open the "LoginPage" page for uri "/auth/login/"
    When I set the parameter "Username" with value "验证授权用户"
    And I set the parameter "Password" with value "All#123456"
    And I click the "LoginButton" button
    And I wait for "2000" millsecond
    Given open the "queryScopes.ListPage" page for uri "/queryscopes/"
    And I wait for loading invisible
    Then the data name is "{'column':'0','name':'<name>'}" then i will see "查看授权" button
    And the data name is "{'column':'0','name':'<name>'}" then i click the "授权" button
    And I wait for loading invisible
    Then I will see the checkbox in tiny table before "AutoTest" is disabled

    Examples:
      | authRole | authName | function | name   |
      | 用户       | 验证授权用户   | 读取       | 测试二次授权 |

  Scenario: 还原SearchAuth权限并删除测试二次授权
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "__user_AutoTest__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    And I wait for loading invisible
    Then I click the "{'TabButton':'搜索权限'}" button
    And I wait for loading invisible
    And I "checked" the checkbox which name is "SearchAuth" in auth table
    And I click the "SaveButton" button
    And I will see the success message "更新成功"
    Given open the "queryScopes.ListPage" page for uri "/queryscopes/"
    And I wait for loading invisible
    And the data name is "{'column':'0','name':'测试二次授权'}" then i click the "删除" button
    And I click the "Ensure" button
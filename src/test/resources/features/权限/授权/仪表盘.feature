@auth
Feature: 权限-仪表盘

  Scenario: 验证无新建权限
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "__user_AutoTest__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    And I wait for "Loading" will be invisible
    Then I click the "{'TabButton':'功能'}" button
    And I wait for "Loading" will be invisible
    When I "checked" the checkbox which name is "全选"
    And I "unchecked" the checkbox which name is "全选"
    And I "checked" the checkbox which name is "可使用仪表盘"
    And I click the "SaveButton" button
    And I will see the success message "更新成功"
    Given I will see the "PublicNavBarPage" page
    And I wait for "Dashboard" will be visible
    And I logout current user
    And I wait for title change text to "登录"
    And open the "LoginPage" page for uri "/auth/login/"
    When I set the parameter "Username" with value "AutoTest"
    And I set the parameter "Password" with value "All#123456"
    And I click the "LoginButton" button
    And I wait for "2000" millsecond
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    Then I will see the "Create" doesn't exist

  Scenario: 授权新建仪表盘
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "__user_AutoTest__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    And I wait for "Loading" will be invisible
    Then I click the "{'TabButton':'功能'}" button
    And I wait for "Loading" will be invisible
    When I "checked" the checkbox which name is "全选"
    And I click the "SaveButton" button
    And I will see the success message "更新成功"
    Given I will see the "PublicNavBarPage" page
    And I wait for "Dashboard" will be visible
    And I logout current user
    And I wait for title change text to "登录"
    And open the "LoginPage" page for uri "/auth/login/"
    When I set the parameter "Username" with value "AutoTest"
    And I set the parameter "Password" with value "All#123456"
    And I click the "LoginButton" button
    And I wait for "2000" millsecond
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I click the "Create" button under some element
    And I set the parameter "DashBoardName" with value "仪表盘验证权限1"
    And I click the "Ensure" button
    Then I will see the success message "新建仪表盘成功"

  Scenario: 验证无读取权限
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "__user_AutoTest__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    And I wait for "Loading" will be invisible
    Then I click the "{'TabButton':'功能'}" button
    And I wait for "Loading" will be invisible
    When I "checked" the checkbox which name is "全选"
    And I "unchecked" the checkbox which name is "全选"
    And I "checked" the checkbox which name is "可使用仪表盘"
    And I click the "SaveButton" button
    And I will see the success message "更新成功"
    Then I click the "Dashboard" button
    And I wait for "Loading" will be invisible
    And I "checked" the checkbox which name is "仪表盘验证权限1" in auth table
    And I "unchecked" the checkbox which name is "仪表盘验证权限1" in auth table
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
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    Then I will see the search result "{'column':'0','name':'仪表盘验证权限1','contains':'no'}"

  Scenario Outline: 授权读取（RZY-615）
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "__user_AutoTest__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    And I wait for "Loading" will be invisible
    Then I click the "Dashboard" button
    And I wait for "Loading" will be invisible
    And I "checked" the checkbox which name is "仪表盘验证权限1" in auth table
    And I "unchecked" the checkbox which name is "仪表盘验证权限1" in auth table
    When I "checked" function "读取" from the auth table which name is "<name>"
    And I click the "SaveButton" button
    And I will see the success message "更新成功"
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
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    Then the data name is "<name>" then i will see "设为默认授权" button
    When the data name is "<name>" then i click the "授权" button
    And I wait for loading invisible
    Then I will see the checkbox in tiny table before "验证授权用户" is disabled
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "<name>"
    Then I will see the "dashboard.DetailPage" page
    Then I will see the "AddTag" doesn't exist

    Examples:
      | name     |
      | 仪表盘验证权限1 |

  Scenario Outline: 授权读取+编辑（RZY-616）
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "__user_AutoTest__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    And I wait for "Loading" will be invisible
    Then I click the "Dashboard" button
    And I wait for "Loading" will be invisible
    And I "checked" the checkbox which name is "<name>" in auth table
    And I "unchecked" function "转授,删除" from the auth table which name is "<name>"
    And I click the "SaveButton" button
    And I will see the success message "更新成功"
    Then I click the "{'TabButton':'功能'}" button
    And I wait for "Loading" will be invisible
    When I "checked" the checkbox which name is "全选"
    And I click the "SaveButton" button

    Examples:
      | name     |
      | 仪表盘验证权限1 |

  Scenario Outline: 验证读取+编辑
    Given I wait for "2000" millsecond
    And I logout current user
    Given I wait for "2000" millsecond
    And open the "LoginPage" page for uri "/auth/login/"
    When I set the parameter "Username" with value "AutoTest"
    And I set the parameter "Password" with value "All#123456"
    And I click the "LoginButton" button
    And I wait for "2000" millsecond
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    Then the data name is "{'column':'0','name':'<name>'}" then i will see "设为默认重命名标签授权" button
    When the data name is "<name>" then i click the "标签" button
    And I set the parameter "Tag" with value "AutoTestTag"
    And I choose the "AutoTestTag" from the "TagDropdown"
    And I click the "Ensure" button
    Then I will see the success message "更新仪表盘成功"
    And I wait for "SuccessMessage" will be invisible
    When the data name is "<name>" then i click the "重命名" button
    And I set the parameter "DashBoardName" with value "<name>重命名"
    And I click the "Ensure" button
    Then I will see the success message "重命名仪表盘成功"
    And I wait for "SuccessMessage" will be invisible
    And I click the detail which name is "<name>重命名"
    Then I will see the "dashboard.DetailPage" page
    When I set the parameter "TagName" with value "test"
    And I click the "EnsureCreateTagButton" button
    And I wait for loading invisible
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    Then I will see the data "{'column':'0','name':'<name>重命名'}" values "{'column':'2','name':'test'}"
    When the data name is "<name>重命名" then i click the "授权" button
    And I wait for loading invisible
    Then I will see the checkbox in tiny table before "验证授权用户" is disabled

    Examples:
      | name     |
      | 仪表盘验证权限1 |

  Scenario: 有效期限
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "__user_AutoTest__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    And I wait for "Loading" will be invisible
    Then I click the "Dashboard" button
    And I wait for "Loading" will be invisible
    And I "checked" the checkbox which name is "仪表盘验证权限1重命名" in auth table
    When the data name is "仪表盘验证权限1重命名" then I click the "无限期" button in auth table
    And I click the "Customize" button
    And I click the "DateEditor" button
    And I set the time input "TimeInput" to "1" minutes later
    And I click the "EnsureTime" button
    And I click the "SaveButton" button
    And I will see the success message "更新成功"
    Then I click the "{'TabButton':'功能'}" button
    And I wait for "Loading" will be invisible
    When I "checked" the checkbox which name is "全选"
    And I "unchecked" the checkbox which name is "全选"
    And I "checked" the checkbox which name is "可使用仪表盘"
    And I click the "SaveButton" button

  Scenario Outline: 新建权限仪表盘
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I click the "Create" button
    And I set the parameter "DashBoardName" with value "<name>"
    And I click the "Ensure" button
    Then I will see the success message "新建仪表盘成功"

    Examples:
      | name               |
      | 仪表盘验证权限            |
      | AutoTestUserCreate |

  Scenario: 授权功能权限
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "__user_AutoTest__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    And I wait for "Loading" will be invisible
    Then I click the "{'TabButton':'功能'}" button
    And I wait for "Loading" will be invisible
    When I "checked" the checkbox which name is "全选"
    And I click the "SaveButton" button

  Scenario: 验证有效期限生效
    Given I will see the "PublicNavBarPage" page
    And I wait for "2000" millsecond
    And I logout current user
    And I wait for "2000" millsecond
    And open the "LoginPage" page for uri "/auth/login/"
    When I set the parameter "Username" with value "AutoTest"
    And I set the parameter "Password" with value "All#123456"
    And I click the "LoginButton" button
    And I wait for "2000" millsecond
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I will see the search result "{'column':'0','name':'仪表盘验证权限1重命名','contains':'no'}"

  Scenario Outline: 授权读取+删除
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "__user_AutoTest__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    And I wait for loading invisible
    Then I click the "Dashboard" button
    And I wait for loading invisible
    And I "checked" the checkbox which name is "<name>" in auth table
    And I "unchecked" the checkbox which name is "<name>" in auth table
    And I "checked" the checkbox which name is "<name>" in auth table
    And I "unchecked" function "编辑,转授" from the auth table which name is "<name>"
    And I click the "SaveButton" button
    And I will see the success message "更新成功"
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
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    Then the data name is "{'column':'0','name':'<name>'}" then i will see "设为默认授权删除" button
    And the data name is "<name>" then i click the "授权" button
    And I wait for loading invisible
    Then I will see the checkbox in tiny table before "验证授权用户" is disabled
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I click the detail which name is "<name>"
    Then I will see the "TagName" doesn't exist
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And the data name is "<name>" then i click the "删除" button
    And I wait for "Ensure" will be visible
    And I click the "Ensure" button
    Then I will see the success message "删除仪表盘成功"

    Examples:
      | name        |
      | 仪表盘验证权限1重命名 |

  Scenario Outline: 授权读取+编辑+删除
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "__user_AutoTest__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    And I wait for loading invisible
    Then I click the "Dashboard" button
    And I wait for loading invisible
    And I "checked" the checkbox which name is "<name>" in auth table
    And I "unchecked" the checkbox which name is "<name>" in auth table
    And I "checked" the checkbox which name is "<name>" in auth table
    And I "unchecked" function "转授" from the auth table which name is "<name>"
    And I click the "SaveButton" button
    And I will see the success message "更新成功"
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
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    Then the data name is "{'column':'0','name':'<name>'}" then i will see "设为默认重命名标签授权删除" button
    And the data name is "<name>" then i click the "授权" button
    And I wait for loading invisible
    Then I will see the checkbox in tiny table before "验证授权用户" is disabled
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    When the data name is "<name>" then i click the "标签" button
    And I set the parameter "Tag" with value "AutoTestTag"
    And I choose the "AutoTestTag" from the "TagDropdown"
    And I click the "Ensure" button
    Then I will see the success message "更新仪表盘成功"
    And I wait for "SuccessMessage" will be invisible
    When the data name is "<name>" then i click the "重命名" button
    And I set the parameter "DashBoardName" with value "<name>重命名"
    And I click the "Ensure" button
    Then I will see the success message "重命名仪表盘成功"
    And I click the detail which name is "<name>重命名"
    Then I will see the "dashboard.DetailPage" page
    When I set the parameter "TagName" with value "test"
    And I click the "EnsureCreateTagButton" button
    And I wait for loading invisible
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    Then I will see the data "{'column':'0','name':'<name>重命名'}" values "{'column':'2','name':'test'}"
    And the data name is "<name>重命名" then i click the "删除" button
    And I wait for "Ensure" will be visible
    And I click the "Ensure" button
    Then I will see the success message "删除仪表盘成功"

    Examples:
      | name               |
      | AutoTestUserCreate |

  Scenario Outline: 授权读取+转授
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "__user_AutoTest__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    And I wait for "Loading" will be invisible
    Then I click the "Dashboard" button
    And I wait for "Loading" will be invisible
    And I "checked" the checkbox which name is "<name>" in auth table
    When I "unchecked" function "编辑,删除" from the auth table which name is "<name>"
    And I click the "SaveButton" button
    And I will see the success message "更新成功"
    Then I click the "{'TabButton':'功能'}" button
    And I wait for "Loading" will be invisible
    When I "checked" the checkbox which name is "全选"
    And I click the "SaveButton" button
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "__user_验证授权用户__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    And I wait for "Loading" will be invisible
    Then I click the "Dashboard" button
    And I wait for "Loading" will be invisible
    And I "checked" the checkbox which name is "<name>" in auth table
    And I "unchecked" the checkbox which name is "<name>" in auth table
    And I click the "SaveButton" button
    And I will see the success message "更新成功"
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
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    Then the data name is "<name>" then i will see "设为默认授权" button
    When the data name is "<name>" then i click the "授权" button
    And I wait for loading invisible
    And I "check" the checkbox which name is "验证授权用户" in tiny table
    And I click the "Ensure" button
    Then I will see the message "保存成功"
    Given I will see the "PublicNavBarPage" page
    And I wait for "Dashboard" will be visible
    And I logout current user
    And I wait for title change text to "登录"
    And open the "LoginPage" page for uri "/auth/login/"
    When I set the parameter "Username" with value "验证授权用户"
    And I set the parameter "Password" with value "All#123456"
    And I click the "LoginButton" button
    And I wait for "2000" millsecond
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    Then the data name is "<name>" then i will see "设为默认授权" button
    And I wait for loading invisible
    And I click the detail which name is "<name>"
    Then I will see the "dashboard.DetailPage" page
    Then I will see the "AddTag" doesn't exist

    Examples:
      | name    |
      | 仪表盘验证权限 |

  Scenario Outline: 授权读取+编辑+转授
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "__user_AutoTest__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    And I wait for "Loading" will be invisible
    Then I click the "Dashboard" button
    And I wait for "Loading" will be invisible
    And I "checked" the checkbox which name is "<name>" in auth table
    And I "unchecked" function "删除" from the auth table which name is "<name>"
    And I click the "SaveButton" button
    And I will see the success message "更新成功"
    Then I click the "{'TabButton':'功能'}" button
    And I wait for "Loading" will be invisible
    When I "checked" the checkbox which name is "全选"
    And I click the "SaveButton" button
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "__user_验证授权用户__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    And I wait for "Loading" will be invisible
    Then I click the "Dashboard" button
    And I wait for "Loading" will be invisible
    And I "checked" the checkbox which name is "<name>" in auth table
    And I "unchecked" the checkbox which name is "<name>" in auth table
    And I click the "SaveButton" button
    And I will see the success message "更新成功"
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
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    Then the data name is "{'column':'0','name':'<name>'}" then i will see "设为默认重命名标签授权" button
    When the data name is "<name>" then i click the "标签" button
    And I set the parameter "Tag" with value "AutoTestTag"
    And I choose the "AutoTestTag" from the "TagDropdown"
    And I click the "Ensure" button
    Then I will see the success message "更新仪表盘成功"
    And I wait for "SuccessMessage" will be invisible
    When the data name is "<name>" then i click the "重命名" button
    And I set the parameter "DashBoardName" with value "<name>重命名"
    And I click the "Ensure" button
    Then I will see the success message "重命名仪表盘成功"
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    When the data name is "<name>重命名" then i click the "授权" button
    And I wait for loading invisible
    And I "check" the checkbox which name is "验证授权用户" in tiny table
    And I click the "Ensure" button
    Then I will see the message "保存成功"
    Given I will see the "PublicNavBarPage" page
    And I wait for "Dashboard" will be visible
    And I logout current user
    And I wait for title change text to "登录"
    And open the "LoginPage" page for uri "/auth/login/"
    When I set the parameter "Username" with value "验证授权用户"
    And I set the parameter "Password" with value "All#123456"
    And I click the "LoginButton" button
    And I wait for "2000" millsecond
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    Then the data name is "{'column':'0','name':'<name>重命名'}" then i will see "设为默认重命名标签授权" button
    And I click the detail which name is "<name>重命名"
    Then I will see the "dashboard.DetailPage" page
    When I set the parameter "TagName" with value "test"
    And I click the "EnsureCreateTagButton" button
    And I wait for loading invisible
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    Then I will see the data "{'column':'0','name':'<name>重命名'}" values "{'column':'2','name':'test'}"

    Examples:
      | name    |
      | 仪表盘验证权限 |

  Scenario Outline: 授权读取+删除+转授
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "__user_AutoTest__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    And I wait for "Loading" will be invisible
    Then I click the "Dashboard" button
    And I wait for "Loading" will be invisible
    And I "checked" the checkbox which name is "<name>" in auth table
    When I "unchecked" function "编辑" from the auth table which name is "<name>"
    And I click the "SaveButton" button
    And I will see the success message "更新成功"
    Then I click the "{'TabButton':'功能'}" button
    And I wait for "Loading" will be invisible
    When I "checked" the checkbox which name is "全选"
    And I click the "SaveButton" button
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "__user_验证授权用户__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    And I wait for "Loading" will be invisible
    Then I click the "Dashboard" button
    And I wait for "Loading" will be invisible
    And I "checked" the checkbox which name is "<name>" in auth table
    And I "unchecked" the checkbox which name is "<name>" in auth table
    And I click the "SaveButton" button
    And I will see the success message "更新成功"
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
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    Then the data name is "<name>" then i will see "设为默认授权删除" button
    When the data name is "<name>" then i click the "授权" button
    And I wait for loading invisible
    And I "check" the checkbox which name is "验证授权用户" in tiny table
    And I click the "Ensure" button
    Then I will see the message "保存成功"
    Given I will see the "PublicNavBarPage" page
    And I wait for "Dashboard" will be visible
    And I logout current user
    And I wait for title change text to "登录"
    And open the "LoginPage" page for uri "/auth/login/"
    When I set the parameter "Username" with value "验证授权用户"
    And I set the parameter "Password" with value "All#123456"
    And I click the "LoginButton" button
    And I wait for "2000" millsecond
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    Then the data name is "<name>" then i will see "设为默认授权" button
    And I wait for loading invisible
    And I click the detail which name is "<name>"
    Then I will see the "dashboard.DetailPage" page
    Then I will see the "AddTag" doesn't exist
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And the data name is "<name>" then i click the "删除" button
    And I wait for "Ensure" will be visible
    And I click the "Ensure" button
    Then I will see the success message "删除仪表盘成功"

    Examples:
      | name       |
      | 仪表盘验证权限重命名 |

  Scenario Outline: 新建仪表盘并设为默认
    When I wait for "2000" millsecond
    And I logout current user
    When I wait for "2000" millsecond
    And open the "LoginPage" page for uri "/auth/login/"
    When I set the parameter "Username" with value "AutoTest"
    And I set the parameter "Password" with value "All#123456"
    And I click the "LoginButton" button
    And I wait for "2000" millsecond
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I click the "Create" button
    And I set the parameter "DashBoardName" with value "<name>"
    And I click the "Ensure" button
    Then I will see the success message "新建仪表盘成功"
#    And I wait for "SuccessMessage" will be invisible
#    When the data name is "<name>" then i click the "设为默认" button
#    And I wait for "Ensure" will be visible
#    And I click the "Ensure" button
#    Then I will see the success message "设置默认仪表盘成功"
#    And I refresh the website
#    And I wait for title change text to "<title>"
#    And I click the "ReturnList" button under some element
#    And I wait for loading invisible
#    When the data name is "<name>" then i click the "取消默认" button
#    And I wait for "Ensure" will be visible
#    And I click the "Ensure" button
#    Then I will see the success message "取消默认仪表盘成功"

    Examples:
      | name     | title           |
      | AutoAuth | AutoAuth \| 仪表盘 |

  Scenario Outline: 授权所有权限
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "__user_AutoTest__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    And I wait for "Loading" will be invisible
    Then I click the "Dashboard" button
    And I wait for "Loading" will be invisible
    And I "checked" the checkbox which name is "<name>" in auth table
    And I click the "SaveButton" button
    And I will see the success message "更新成功"
    Then I click the "{'TabButton':'功能'}" button
    And I wait for "Loading" will be invisible
    When I "checked" the checkbox which name is "全选"
    And I click the "SaveButton" button
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "__user_验证授权用户__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    And I wait for "Loading" will be invisible
    Then I click the "Dashboard" button
    And I wait for "Loading" will be invisible
    And I "checked" the checkbox which name is "<name>" in auth table
    And I "unchecked" the checkbox which name is "<name>" in auth table
    And I click the "SaveButton" button
    And I will see the success message "更新成功"
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
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    Then the data name is "{'column':'0','name':'<name>'}" then i will see "设为默认重命名标签授权删除" button
    When the data name is "<name>" then i click the "标签" button
    And I set the parameter "Tag" with value "AutoTestTag"
    And I choose the "AutoTestTag" from the "TagDropdown"
    And I click the "Ensure" button
    Then I will see the success message "更新仪表盘成功"
    And I wait for "SuccessMessage" will be invisible
    When the data name is "<name>" then i click the "重命名" button
    And I set the parameter "DashBoardName" with value "<name>重命名"
    And I click the "Ensure" button
    Then I will see the success message "重命名仪表盘成功"
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    When the data name is "<name>重命名" then i click the "授权" button
    And I wait for loading invisible
    And I "check" the checkbox which name is "验证授权用户" in tiny table
    And I click the "Ensure" button
    Then I will see the message "保存成功"
    Given I will see the "PublicNavBarPage" page
    And I wait for "Dashboard" will be visible
    And I logout current user
    And I wait for title change text to "登录"
    And open the "LoginPage" page for uri "/auth/login/"
    When I set the parameter "Username" with value "验证授权用户"
    And I set the parameter "Password" with value "All#123456"
    And I click the "LoginButton" button
    And I wait for "2000" millsecond
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    Then the data name is "{'column':'0','name':'<name>重命名'}" then i will see "设为默认重命名标签授权删除" button
    And I click the detail which name is "<name>重命名"
    Then I will see the "dashboard.DetailPage" page
    When I set the parameter "TagName" with value "test"
    And I click the "EnsureCreateTagButton" button
    And I wait for loading invisible
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    Then I will see the data "{'column':'0','name':'<name>重命名'}" values "{'column':'2','name':'test'}"
    And the data name is "<name>重命名" then i click the "删除" button
    And I wait for "Ensure" will be visible
    And I click the "Ensure" button
    Then I will see the success message "删除仪表盘成功"

    Examples:
      | name     |
      | AutoAuth |

  Scenario: 新建仪表盘以测试二次授权
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I click the "Create" button under some element
    And I set the parameter "DashBoardName" with value "测试二次授权"
    And I click the "Ensure" button
    Then I will see the success message "新建仪表盘成功"

  Scenario: 给用户授权所有权限
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    When the data name is "测试二次授权" then i click the "授权" button
    And I "check" the checkbox which name is "AutoTest" in tiny table
    And I click the "Ensure" button
    Then I will see the message "保存成功"
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "__user_验证授权用户__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    And I wait for "Loading" will be invisible
    Then I click the "{'TabButton':'功能'}" button
    And I wait for "Loading" will be invisible
    And I "checked" the checkbox which name is "全选"
    And I click the "SaveButton" button

  Scenario Outline: 二次授权读取
    When I wait for "2000" millsecond
    And I logout current user
    When I wait for "2000" millsecond
    And I wait for title change text to "登录"
    And open the "LoginPage" page for uri "/auth/login/"
    When I set the parameter "Username" with value "AutoTest"
    And I set the parameter "Password" with value "All#123456"
    And I click the "LoginButton" button
    And I wait for "2000" millsecond
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    When the data name is "测试二次授权" then i click the "授权" button
    And I choose the "<authRole>" from the "AuthDropdown"
    When I "check" the function "<function>" which name is "<authName>" in tiny table
    And I click the "Ensure" button
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
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    Then the data name is "<name>" then i will see "设为默认授权" button
    When the data name is "<name>" then i click the "授权" button
    And I wait for loading invisible
    Then I will see the checkbox in tiny table before "AutoTest" is disabled
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "<name>"
    Then I will see the "dashboard.DetailPage" page
    Then I will see the "AddTag" doesn't exist

    Examples:
      | authRole | authName | function | name   |
      | 用户       | 验证授权用户   | 读取       | 测试二次授权 |

  Scenario Outline: 二次授权读取+编辑
    When I wait for "2000" millsecond
    And I logout current user
    When I wait for "2000" millsecond
    And open the "LoginPage" page for uri "/auth/login/"
    When I set the parameter "Username" with value "AutoTest"
    And I set the parameter "Password" with value "All#123456"
    And I click the "LoginButton" button
    And I wait for "2000" millsecond
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    When the data name is "测试二次授权" then i click the "授权" button
    And I choose the "<authRole>" from the "AuthDropdown"
    And I wait for loading invisible
    When I "check" the function "<function>" which name is "<authName>" in tiny table
    And I click the "Ensure" button
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
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    Then the data name is "{'column':'0','name':'<name>'}" then i will see "设为默认重命名标签授权" button
    When the data name is "<name>" then i click the "标签" button
    And I set the parameter "Tag" with value "AutoTestTag"
    And I choose the "AutoTestTag" from the "TagDropdown"
    And I click the "Ensure" button
    Then I will see the success message "更新仪表盘成功"
    And I wait for "SuccessMessage" will be invisible
    When the data name is "<name>" then i click the "重命名" button
    And I set the parameter "DashBoardName" with value "<name>重命名"
    And I click the "Ensure" button
    Then I will see the success message "重命名仪表盘成功"
    And I wait for "SuccessMessage" will be invisible
    And I click the detail which name is "<name>重命名"
    Then I will see the "dashboard.DetailPage" page
    When I set the parameter "TagName" with value "test"
    And I click the "EnsureCreateTagButton" button
    And I wait for loading invisible
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    Then I will see the data "{'column':'0','name':'<name>重命名'}" values "{'column':'2','name':'test'}"
    When the data name is "<name>重命名" then i click the "授权" button
    And I wait for loading invisible
    Then I will see the checkbox in tiny table before "AutoTest" is disabled

    Examples:
      | authRole | authName        | function | name   |
      | 角色       | __user_验证授权用户__ | 编辑       | 测试二次授权 |

  Scenario Outline: 二次授权读取+编辑+删除
    When I wait for "2000" millsecond
    And I logout current user
    When I wait for "2000" millsecond
    And open the "LoginPage" page for uri "/auth/login/"
    When I set the parameter "Username" with value "AutoTest"
    And I set the parameter "Password" with value "All#123456"
    And I click the "LoginButton" button
    And I wait for "2000" millsecond
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    When the data name is "<name>" then i click the "授权" button
    And I choose the "<authRole>" from the "AuthDropdown"
    And I wait for loading invisible
    When I "check" the function "<function>" which name is "<authName>" in tiny table
    And I click the "Ensure" button
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
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    Then the data name is "{'column':'0','name':'<name>'}" then i will see "设为默认重命名标签授权删除" button
    And the data name is "<name>" then i click the "授权" button
    And I wait for loading invisible
    Then I will see the checkbox in tiny table before "AutoTest" is disabled
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    When the data name is "<name>" then i click the "标签" button
    And I set the parameter "Tag" with value "AutoTestTag"
    And I choose the "AutoTestTag" from the "TagDropdown"
    And I click the "Ensure" button
    Then I will see the success message "更新仪表盘成功"
    And I wait for "SuccessMessage" will be invisible
    When the data name is "<name>" then i click the "重命名" button
    And I set the parameter "DashBoardName" with value "<name>重命名"
    And I click the "Ensure" button
    Then I will see the success message "重命名仪表盘成功"
    And I click the detail which name is "<name>重命名"
    Then I will see the "dashboard.DetailPage" page
    And I wait for "AddEventButton" will be visible
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    Then I will see the data "{'column':'0','name':'<name>重命名'}" values "{'column':'2','name':'test'}"
    And the data name is "<name>重命名" then i click the "删除" button
    And I wait for "Ensure" will be visible
    And I click the "Ensure" button
    Then I will see the success message "删除仪表盘成功"

    Examples:
      | authRole | authName | function | name      |
      | 用户分组     | 验证授权用户分组 | 读取,编辑,删除 | 测试二次授权重命名 |
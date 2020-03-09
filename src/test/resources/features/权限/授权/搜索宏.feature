@auth
Feature: 权限-搜索宏

  Scenario: 验证无新建权限
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "__user_AutoTest__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    Then I click the "{'TabButton':'功能'}" button
    And I wait for "Loading" will be invisible
    When I "checked" the checkbox which name is "全选"
    And I "unchecked" the checkbox which name is "全选"
    And I "checked" the checkbox which name is "可使用搜索宏"
    And I click the "SaveButton" button
    And I will see the success message "保存成功"
    Given I will see the "PublicNavBarPage" page
    And I wait for "Dashboard" will be visible
    And I logout current user
    And I wait for title change text to "登录"
    And open the "LoginPage" page for uri "/auth/login/"
    When I set the parameter "Username" with value "AutoTest"
    And I set the parameter "Password" with value "All#123456"
    And I click the "LoginButton" button
    And I wait for "2000" millsecond
    Given open the "searchMacro.ListPage" page for uri "/macro/"
    And I wait for loading invisible
    Then I will see the "Create" doesn't exist

  Scenario: 验证有新建权限
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "__user_AutoTest__" then i click the "授权" button
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
    And I set the parameter "Password" with value "All#123456"
    And I click the "LoginButton" button
    And I wait for "2000" millsecond
    Given open the "searchMacro.ListPage" page for uri "/macro/"
    And I wait for loading invisible
    And I click the "Create" button
    Then I will see the "searchMacro.CreatePage" page
    When I set the parameter "Name" with value "AutoTestUserCreate"
    And I click the "Save" button
    Then I will see the success message "保存成功"

  Scenario: 验证无读取权限
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "__user_AutoTest__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    Then I click the "{'TabButton':'搜索宏'}" button
    And I wait for "Loading" will be invisible
    And I "checked" the label before "AutoTestUserCreate"
    And I "unchecked" the label before "AutoTestUserCreate"
    And I click the "SaveButton" button
    And I will see the success message "保存成功"
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
    Given open the "searchMacro.ListPage" page for uri "/macro/"
    Then I will see the search result "{'column':'0','name':'AutoTestUserCreate','contains':'no'}"

  Scenario: 授权读取权限
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "__user_AutoTest__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    Then I click the "{'TabButton':'搜索宏'}" button
    And I wait for "Loading" will be invisible
    And I "checked" the label before "AutoTestUserCreate"
    And I "unchecked" the label before "AutoTestUserCreate"
    When I "checked" function "读取" from the auth table which name is "AutoTestUserCreate"
    And I click the "SaveButton" button
    And I will see the success message "保存成功"
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
    And I wait for title change text to "仪表盘|搜索"
    Given open the "searchMacro.ListPage" page for uri "/macro/"
    Then the data name is "AutoTestUserCreate" then i will see "授权" button
    And the data name is "AutoTestUserCreate" then i click the "授权" button
    And I wait for loading invisible
    Then I will see the checkbox in tiny table before "验证授权用户" is disabled

  Scenario Outline: 授权读取+编辑
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "__user_AutoTest__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    Then I click the "{'TabButton':'搜索宏'}" button
    And I wait for "Loading" will be invisible
    And I "checked" the label before "AutoTestUserCreate"
    When I "unchecked" function "删除,转授" from the auth table which name is "AutoTestUserCreate"
    And I click the "SaveButton" button
    And I will see the success message "保存成功"
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
    And I wait for title change text to "仪表盘|搜索"
    Given open the "searchMacro.ListPage" page for uri "/macro/"
    And I wait for loading invisible
    Then the data name is "<name>" then i will see "编辑标签授权" button
    When the data name is "<name>" then i click the "标签" button
    And I set the parameter "Tag" with value "AutoTest"
    And I choose the "AutoTest" from the "TagDropdown"
    And I click the "Ensure" button
    Then I will see the success message "修改成功"
    Given open the "searchMacro.ListPage" page for uri "/macro/"
    And I wait for loading invisible
    And the data name is "AutoTestUserCreate" then i click the "授权" button
    And I wait for loading invisible
    Then I will see the checkbox in tiny table before "验证授权用户" is disabled
    Given open the "searchMacro.ListPage" page for uri "/macro/"
    And I wait for loading invisible
    And the data name is "<name>" then i click the "编辑" button
    Then I will see the "searchMacro.CreatePage" page
    When I set the parameter "Name" with value "AutoTestRename"
    And I click the "Save" button
    Then I will see the success message "保存成功"

    Examples:
      | name               |
      | AutoTestUserCreate |

  Scenario Outline: 授权读取+编辑+删除
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "__user_AutoTest__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    Then I click the "{'TabButton':'搜索宏'}" button
    And I wait for "Loading" will be invisible
    And I "checked" the label before "<name>"
    When I "unchecked" function "转授" from the auth table which name is "<name>"
    And I click the "SaveButton" button
    And I will see the success message "保存成功"
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
    And I wait for title change text to "仪表盘|搜索"
    Given open the "searchMacro.ListPage" page for uri "/macro/"
    And I wait for loading invisible
    Then the data name is "<name>" then i will see "编辑标签授权删除" button
    When the data name is "<name>" then i click the "标签" button
    And I set the parameter "Tag" with value "AutoTest"
    And I choose the "AutoTest" from the "TagDropdown"
    And I click the "Ensure" button
    Then I will see the success message "修改成功"
    Given open the "searchMacro.ListPage" page for uri "/macro/"
    And I wait for loading invisible
    And the data name is "<name>" then i click the "授权" button
    And I wait for loading invisible
    Then I will see the checkbox in tiny table before "验证授权用户" is disabled
    Given open the "searchMacro.ListPage" page for uri "/macro/"
    And I wait for loading invisible
    And the data name is "<name>" then i click the "编辑" button
    Then I will see the "searchMacro.CreatePage" page
    When I set the parameter "Name" with value "AutoTestCreate"
    And I click the "Save" button
    Then I will see the success message "保存成功"
    Given open the "searchMacro.ListPage" page for uri "/macro/"
    And I wait for loading invisible
    And the data name is "AutoTestCreate" then i click the "删除" button
    Then I click the "Ensure" button
    Then I wait for element "SuccessMessage" change text to "删除成功"

    Examples:
      | name           |
      | AutoTestRename |

  Scenario: 授权读取+删除
    Given open the "searchMacro.ListPage" page for uri "/macro/"
    And I wait for loading invisible
    And I click the "Create" button
    Then I will see the "searchMacro.CreatePage" page
    When I set the parameter "Name" with value "AutoTestUserCreate"
    And I click the "Save" button
    Then I will see the success message "保存成功"
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "__user_AutoTest__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    Then I click the "{'TabButton':'搜索宏'}" button
    And I wait for "Loading" will be invisible
    And I "checked" the label before "AutoTestUserCreate"
    When I "unchecked" function "编辑,转授" from the auth table which name is "AutoTestUserCreate"
    And I click the "SaveButton" button
    And I will see the success message "保存成功"
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
    And I wait for title change text to "仪表盘|搜索"
    Given open the "searchMacro.ListPage" page for uri "/macro/"
    Then the data name is "AutoTestUserCreate" then i will see "授权删除" button
    And the data name is "AutoTestUserCreate" then i click the "授权" button
    And I wait for loading invisible
    Then I will see the checkbox in tiny table before "验证授权用户" is disabled
    Given open the "searchMacro.ListPage" page for uri "/macro/"
    And I wait for loading invisible
    And the data name is "AutoTestUserCreate" then i click the "删除" button
    Then I click the "Ensure" button
    Then I wait for element "SuccessMessage" change text to "删除成功"

  Scenario Outline: 授权读取+转授
    Given open the "searchMacro.ListPage" page for uri "/macro/"
    And I wait for loading invisible
    And I click the "Create" button
    Then I will see the "searchMacro.CreatePage" page
    When I set the parameter "Name" with value "<name>"
    And I click the "Save" button
    Then I will see the success message "保存成功"
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "__user_AutoTest__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    Then I click the "{'TabButton':'搜索宏'}" button
    And I wait for "Loading" will be invisible
    And I "checked" the label before "<name>"
    When I "unchecked" function "编辑,删除" from the auth table which name is "<name>"
    And I click the "SaveButton" button
    And I will see the success message "保存成功"
    Then I click the "{'TabButton':'功能'}" button
    And I wait for "Loading" will be invisible
    When I "checked" the checkbox which name is "全选"
    And I click the "SaveButton" button
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "__user_验证授权用户__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    And I wait for "Loading" will be invisible
    Then I click the "{'TabButton':'搜索宏'}" button
    And I wait for "Loading" will be invisible
    And I "checked" the label before "<name>"
    And I "unchecked" the label before "<name>"
    And I click the "SaveButton" button
    Then I will see the success message "保存成功"
    Then I click the "{'TabButton':'功能'}" button
    And I wait for "Loading" will be invisible
    When I "checked" the checkbox which name is "全选"
    And I click the "SaveButton" button

    Examples:
      | name     |
      | AutoTest |

  Scenario Outline: 验证读取+转授
    Given I will see the "PublicNavBarPage" page
    And I wait for "Dashboard" will be visible
    And I wait for loading invisible
    And I logout current user
    And I wait for title change text to "登录"
    And open the "LoginPage" page for uri "/auth/login/"
    When I set the parameter "Username" with value "AutoTest"
    And I set the parameter "Password" with value "All#123456"
    And I click the "LoginButton" button
    And I wait for title change text to "仪表盘|搜索"
    Given open the "searchMacro.ListPage" page for uri "/macro/"
    Then the data name is "<name>" then i will see "授权" button
    And the data name is "<name>" then i click the "授权" button
    And I "check" the checkbox which name is "验证授权用户" in tiny table
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
    And I wait for title change text to "仪表盘|搜索"
    Given open the "searchMacro.ListPage" page for uri "/macro/"
    And I wait for loading invisible
    Then the data name is "<name>" then i will see "授权" button

    Examples:
      | name     |
      | AutoTest |

  Scenario Outline: 授权读取+编辑+转授
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "__user_AutoTest__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    Then I click the "{'TabButton':'搜索宏'}" button
    And I wait for "Loading" will be invisible
    And I "checked" the label before "<name>"
    When I "unchecked" function "删除" from the auth table which name is "<name>"
    And I click the "SaveButton" button
    And I will see the success message "保存成功"
    Then I click the "{'TabButton':'功能'}" button
    And I wait for "Loading" will be invisible
    When I "checked" the checkbox which name is "全选"
    And I click the "SaveButton" button
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "__user_验证授权用户__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    And I wait for "Loading" will be invisible
    Then I click the "{'TabButton':'搜索宏'}" button
    And I wait for "Loading" will be invisible
    And I "checked" the label before "<name>"
    And I "unchecked" the label before "<name>"
    And I click the "SaveButton" button
    Then I will see the success message "保存成功"
    Then I click the "{'TabButton':'功能'}" button
    And I wait for "Loading" will be invisible
    When I "checked" the checkbox which name is "全选"
    And I click the "SaveButton" button

    Examples:
      | name     |
      | AutoTest |

  Scenario Outline: 验证读取+编辑+转授
    Given I will see the "PublicNavBarPage" page
    And I wait for "Dashboard" will be visible
    And I wait for loading invisible
    And I logout current user
    And I wait for title change text to "登录"
    And open the "LoginPage" page for uri "/auth/login/"
    When I set the parameter "Username" with value "AutoTest"
    And I set the parameter "Password" with value "All#123456"
    And I click the "LoginButton" button
    And I wait for title change text to "仪表盘|搜索"
    Given open the "searchMacro.ListPage" page for uri "/macro/"
    Then the data name is "<name>" then i will see "编辑标签授权" button
    When the data name is "<name>" then i click the "标签" button
    And I set the parameter "Tag" with value "AutoTest"
    And I choose the "AutoTest" from the "TagDropdown"
    And I click the "Ensure" button
    Then I will see the success message "修改成功"
    Given open the "searchMacro.ListPage" page for uri "/macro/"
    And I wait for loading invisible
    And the data name is "<name>" then i click the "授权" button
    And I wait for loading invisible
    And I "check" the checkbox which name is "验证授权用户" in tiny table
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
    And I wait for title change text to "仪表盘|搜索"
    Given open the "searchMacro.ListPage" page for uri "/macro/"
    And I wait for loading invisible
    Then the data name is "<name>" then i will see "编辑标签授权" button
    And the data name is "<name>" then i click the "编辑" button
    Then I will see the "searchMacro.CreatePage" page
    When I set the parameter "Name" with value "AutoTestCreate"
    And I click the "Save" button
    Then I will see the success message "保存成功"
    Given open the "searchMacro.ListPage" page for uri "/macro/"
    And I wait for loading invisible

    Examples:
      | name     |
      | AutoTest |

  Scenario: 有效期限
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "__user_AutoTest__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    Then I click the "{'TabButton':'功能'}" button
    And I wait for "Loading" will be invisible
    When I "checked" the checkbox which name is "全选"
    And I click the "SaveButton" button
    Then I click the "{'TabButton':'搜索宏'}" button
    And I wait for loading invisible
    And I "checked" the label before "AutoTestCreate"
    When the data name is "AutoTestCreate" then I click the "无期限" button without total page
    And I click the "Customize" button
    And I click the "DateEditor" button
    And I set the time input "TimeInput" to "1" minutes later
    And I click the "EnsureTime" button
    And I click the "SaveButton" button
    And I will see the success message "保存成功"

  Scenario: 新建
    Given open the "searchMacro.ListPage" page for uri "/macro/"
    And I wait for loading invisible
    And I click the "Create" button
    Then I will see the "searchMacro.CreatePage" page
    When I set the parameter "Name" with value "AutoTest"
    And I click the "Save" button
    Then I will see the success message "保存成功"

  Scenario: 验证有效期限
    Given I will see the "PublicNavBarPage" page
    And I wait for "Dashboard" will be visible
    And I wait for loading invisible
    And I logout current user
    And I wait for title change text to "登录"
    And open the "LoginPage" page for uri "/auth/login/"
    When I set the parameter "Username" with value "AutoTest"
    And I set the parameter "Password" with value "All#123456"
    And I click the "LoginButton" button
    And I wait for title change text to "仪表盘|搜索"
    Given open the "searchMacro.ListPage" page for uri "/macro/"
    Then I will see the search result "{'column':'0','name':'AutoTestCreate','contains':'no'}"

  Scenario Outline: 授权读取+删除+转授
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "__user_AutoTest__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    Then I click the "{'TabButton':'搜索宏'}" button
    And I wait for "Loading" will be invisible
    And I "checked" the label before "<name>"
    And I "unchecked" the label before "<name>"
    And I "checked" the label before "<name>"
    When I "unchecked" function "编辑" from the auth table which name is "<name>"
    And I click the "SaveButton" button
    And I will see the success message "保存成功"
    Then I click the "{'TabButton':'功能'}" button
    And I wait for "Loading" will be invisible
    When I "checked" the checkbox which name is "全选"
    And I click the "SaveButton" button
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "__user_验证授权用户__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    And I wait for "Loading" will be invisible
    Then I click the "{'TabButton':'搜索宏'}" button
    And I wait for "Loading" will be invisible
    And I "checked" the label before "<name>"
    And I "unchecked" the label before "<name>"
    And I click the "SaveButton" button
    Then I will see the success message "保存成功"
    Then I click the "{'TabButton':'功能'}" button
    And I wait for "Loading" will be invisible
    When I "checked" the checkbox which name is "全选"
    And I click the "SaveButton" button

    Examples:
      | name           |
      | AutoTestCreate |

  Scenario Outline: 验证读取+删除+转授
    Given I will see the "PublicNavBarPage" page
    And I wait for "Dashboard" will be visible
    And I wait for loading invisible
    And I logout current user
    And I wait for title change text to "登录"
    And open the "LoginPage" page for uri "/auth/login/"
    When I set the parameter "Username" with value "AutoTest"
    And I set the parameter "Password" with value "All#123456"
    And I click the "LoginButton" button
    And I wait for title change text to "仪表盘|搜索"
    Given open the "searchMacro.ListPage" page for uri "/macro/"
    Then the data name is "<name>" then i will see "授权删除" button
    And the data name is "<name>" then i click the "授权" button
    And I "check" the checkbox which name is "验证授权用户" in tiny table
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
    And I wait for title change text to "仪表盘|搜索"
    Given open the "searchMacro.ListPage" page for uri "/macro/"
    And I wait for loading invisible
    Then the data name is "<name>" then i will see "授权删除" button
    And the data name is "<name>" then i click the "删除" button
    Then I click the "Ensure" button
    Then I wait for element "SuccessMessage" change text to "删除成功"

    Examples:
      | name           |
      | AutoTestCreate |

  Scenario Outline: 授权所有权限
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "__user_AutoTest__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    Then I click the "{'TabButton':'搜索宏'}" button
    And I wait for "Loading" will be invisible
    And I "checked" the label before "<name>"
    And I click the "SaveButton" button
    And I will see the success message "保存成功"
    Then I click the "{'TabButton':'功能'}" button
    And I wait for "Loading" will be invisible
    When I "checked" the checkbox which name is "全选"
    And I click the "SaveButton" button
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "__user_验证授权用户__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    And I wait for "Loading" will be invisible
    Then I click the "{'TabButton':'搜索宏'}" button
    And I wait for "Loading" will be invisible
    And I "checked" the label before "<name>"
    And I "unchecked" the label before "<name>"
    And I click the "SaveButton" button
    Then I will see the success message "保存成功"
    Then I click the "{'TabButton':'功能'}" button
    And I wait for "Loading" will be invisible
    When I "checked" the checkbox which name is "全选"
    And I click the "SaveButton" button

    Examples:
      | name     |
      | AutoTest |

  Scenario Outline: 验证所有权限
    Given I will see the "PublicNavBarPage" page
    And I wait for "Dashboard" will be visible
    And I wait for loading invisible
    And I logout current user
    And I wait for title change text to "登录"
    And open the "LoginPage" page for uri "/auth/login/"
    When I set the parameter "Username" with value "AutoTest"
    And I set the parameter "Password" with value "All#123456"
    And I click the "LoginButton" button
    And I wait for title change text to "仪表盘|搜索"
    Given open the "searchMacro.ListPage" page for uri "/macro/"
    Then the data name is "<name>" then i will see "编辑标签授权删除" button
    When the data name is "<name>" then i click the "标签" button
    And I set the parameter "Tag" with value "AutoTest"
    And I choose the "AutoTest" from the "TagDropdown"
    And I click the "Ensure" button
    Then I will see the success message "修改成功"
    Given open the "searchMacro.ListPage" page for uri "/macro/"
    And I wait for loading invisible
    And the data name is "<name>" then i click the "授权" button
    And I wait for loading invisible
    And I "check" the checkbox which name is "验证授权用户" in tiny table
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
    And I wait for title change text to "仪表盘|搜索"
    Given open the "searchMacro.ListPage" page for uri "/macro/"
    And I wait for loading invisible
    Then the data name is "<name>" then i will see "编辑标签授权删除" button
    And the data name is "<name>" then i click the "编辑" button
    Then I will see the "searchMacro.CreatePage" page
    When I set the parameter "Name" with value "AutoTestCreate"
    And I click the "Save" button
    Then I will see the success message "保存成功"
    Given open the "searchMacro.ListPage" page for uri "/macro/"
    And I wait for loading invisible
    And the data name is "AutoTestCreate" then i click the "删除" button
    Then I click the "Ensure" button
    Then I wait for element "SuccessMessage" change text to "删除成功"

    Examples:
      | name     |
      | AutoTest |

  Scenario: 新建搜索宏以测试二次授权
    Given open the "searchMacro.ListPage" page for uri "/macro/"
    And I wait for loading invisible
    And I click the "Create" button
    Then I will see the "searchMacro.CreatePage" page
    When I set the parameter "Name" with value "测试二次授权"
    And I click the "Save" button
    Then I will see the success message "保存成功"

  Scenario: 给AutoTest用户授权
    Given open the "searchMacro.ListPage" page for uri "/macro/"
    And I wait for loading invisible
    When the data name is "测试二次授权" then i click the "授权" button
    And I "check" the checkbox which name is "AutoTest" in tiny table
    And I click the "Ensure" button
    Then I will see the message "保存成功"
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "__user_验证授权用户__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    Then I click the "{'TabButton':'功能'}" button
    And I wait for "Loading" will be invisible
    And I "checked" the checkbox which name is "全选"
    And I click the "SaveButton" button

  Scenario Outline: 二次授权读取
    Given I will see the "PublicNavBarPage" page
    And I wait for "Dashboard" will be visible
    And I wait for loading invisible
    And I logout current user
    And I wait for title change text to "登录"
    And open the "LoginPage" page for uri "/auth/login/"
    When I set the parameter "Username" with value "AutoTest"
    And I set the parameter "Password" with value "All#123456"
    And I click the "LoginButton" button
    And I wait for title change text to "仪表盘|搜索"
    Given open the "searchMacro.ListPage" page for uri "/macro/"
    And I wait for loading invisible
    When the data name is "<name>" then i click the "授权" button
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
    And I wait for title change text to "仪表盘|搜索"
    Given open the "searchMacro.ListPage" page for uri "/macro/"
    Then the data name is "<name>" then i will see "授权" button
    And the data name is "<name>" then i click the "授权" button
    And I wait for loading invisible
    Then I will see the checkbox in tiny table before "AutoTest" is disabled

    Examples:
      | authRole | authName | function | name   |
      | 用户       | 验证授权用户   | 读取       | 测试二次授权 |

  Scenario Outline: 二次授权读取+编辑
    Given I will see the "PublicNavBarPage" page
    And I wait for "Dashboard" will be visible
    And I wait for loading invisible
    And I logout current user
    And I wait for title change text to "登录"
    And open the "LoginPage" page for uri "/auth/login/"
    When I set the parameter "Username" with value "AutoTest"
    And I set the parameter "Password" with value "All#123456"
    And I click the "LoginButton" button
    And I wait for title change text to "仪表盘|搜索"
    Given open the "searchMacro.ListPage" page for uri "/macro/"
    And I wait for loading invisible
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
    And I wait for title change text to "仪表盘|搜索"
    Given open the "searchMacro.ListPage" page for uri "/macro/"
    And I wait for loading invisible
    Then the data name is "<name>" then i will see "编辑标签授权" button
    When the data name is "<name>" then i click the "标签" button
    And I set the parameter "Tag" with value "AutoTest"
    And I choose the "AutoTest" from the "TagDropdown"
    And I click the "Ensure" button
    Then I will see the success message "修改成功"
    Given open the "searchMacro.ListPage" page for uri "/macro/"
    And I wait for loading invisible
    And the data name is "<name>" then i click the "授权" button
    And I wait for loading invisible
    Then I will see the checkbox in tiny table before "AutoTest" is disabled
    Given open the "searchMacro.ListPage" page for uri "/macro/"
    And I wait for loading invisible
    And the data name is "<name>" then i click the "编辑" button
    Then I will see the "searchMacro.CreatePage" page
    When I set the parameter "Name" with value "测试二次授权Rename"
    And I click the "Save" button
    Then I will see the success message "保存成功"

    Examples:
      | authRole | authName        | function | name   |
      | 角色       | __user_验证授权用户__ | 编辑       | 测试二次授权 |

  Scenario Outline: 二次授权读取+编辑+删除
    Given I will see the "PublicNavBarPage" page
    And I wait for "Dashboard" will be visible
    And I wait for loading invisible
    And I logout current user
    And I wait for title change text to "登录"
    And open the "LoginPage" page for uri "/auth/login/"
    When I set the parameter "Username" with value "AutoTest"
    And I set the parameter "Password" with value "All#123456"
    And I click the "LoginButton" button
    And I wait for title change text to "仪表盘|搜索"
    Given open the "searchMacro.ListPage" page for uri "/macro/"
    And I wait for loading invisible
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
    And I wait for title change text to "仪表盘|搜索"
    Given open the "searchMacro.ListPage" page for uri "/macro/"
    And I wait for loading invisible
    Then the data name is "<name>" then i will see "编辑标签授权删除" button
    When the data name is "<name>" then i click the "标签" button
    And I set the parameter "Tag" with value "AutoTest"
    And I choose the "AutoTest" from the "TagDropdown"
    And I click the "Ensure" button
    Then I will see the success message "修改成功"
    Given open the "searchMacro.ListPage" page for uri "/macro/"
    And I wait for loading invisible
    And the data name is "<name>" then i click the "授权" button
    And I wait for loading invisible
    Then I will see the checkbox in tiny table before "AutoTest" is disabled
    Given open the "searchMacro.ListPage" page for uri "/macro/"
    And I wait for loading invisible
    And the data name is "<name>" then i click the "编辑" button
    Then I will see the "searchMacro.CreatePage" page
    When I set the parameter "Name" with value "测试二次授权RenameAgain"
    And I click the "Save" button
    Then I will see the success message "保存成功"
    Given open the "searchMacro.ListPage" page for uri "/macro/"
    And I wait for loading invisible
    And the data name is "测试二次授权RenameAgain" then i click the "删除" button
    Then I click the "Ensure" button
    Then I wait for element "SuccessMessage" change text to "删除成功"

    Examples:
      | authRole | authName | function | name         |
      | 用户分组     | 验证授权用户分组 | 读取,编辑,删除 | 测试二次授权Rename |

  Scenario Outline: 新建搜索宏验证
    Given I will see the "PublicNavBarPage" page
    And I wait for "Dashboard" will be visible
    And I wait for loading invisible
    And I logout current user
    And I wait for title change text to "登录"
    And open the "LoginPage" page for uri "/auth/login/"
    When I set the parameter "Username" with value "AutoTest"
    And I set the parameter "Password" with value "All#123456"
    And I click the "LoginButton" button
    And I wait for title change text to "仪表盘|搜索"
    Given open the "searchMacro.ListPage" page for uri "/macro/"
    When I click the "Create" button
    Then I will see the "searchMacro.CreatePage" page
    When I set the parameter "Name" with value "<name>"
    And I set the parameter "Definition" with value "<definition>"
    And I set the parameter "Param" with value "<param>"
    And I set the parameter "ValidateExpression" with value "<validateExpression>"
    And I set the parameter "ValidateFalseInfo" with value "<validateFalseInfo>"
    And I click the "Save" button
    Then I will see the <message>

    Examples:
      | name        | definition                                                                                           | param | validateExpression | validateFalseInfo | message                |
      | AuthTest(1) | tag:sample04061424 \| stats count() by apache.clientip, apache.version \| where apache.clientip==$x$ | x     | isstr(x)           | 请输⼊字符串            | success message "保存成功" |

  Scenario Outline: 验证参数
    Given I will see the "PublicNavBarPage" page
    And I wait for "Dashboard" will be visible
    And I wait for loading invisible
    And I logout current user
    And I wait for title change text to "登录"
    And open the "LoginPage" page for uri "/auth/login/"
    When I set the parameter "Username" with value "AutoTest"
    And I set the parameter "Password" with value "All#123456"
    And I click the "LoginButton" button
    And I wait for title change text to "仪表盘|搜索"
    Given open the "splSearch.SearchPage" page for uri "/search/"
    And I set the parameter "SearchInput" with value "<splQuery>"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I save the result "{'ClientIp':'Column1','Version':'Column2','Count':'Column3'}"
    And I set the parameter "SearchInput" with value "<splQuery1>"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    Then I compare with "{'ClientIp':'Column1','Version':'Column2','Count':'Column3'}"

    Examples:
      | splQuery                      | splQuery1                                                                                                          |
      | `AuthTest(\"23.166.125.53\")` | tag:sample04061424 \| stats count() by apache.clientip, apache.version \| where apache.clientip==\"23.166.125.53\" |


@auth
Feature: 权限-知识

  Scenario: 验证无新建权限
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "__user_AutoTest__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    Then I click the "{'TabButton':'功能'}" button
    And I wait for "Loading" will be invisible
    When I "checked" the checkbox which name is "全选"
    And I "unchecked" the checkbox which name is "全选"
    And I "checked" the checkbox which name is "可使用知识库"
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
    Given open the "knowledge.ListPage" page for uri "/knowledge/"
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
    Given open the "knowledge.ListPage" page for uri "/knowledge/"
    And I wait for loading invisible
    And I click the "Create" button
    Then I will see the "knowledge.CreatePage" page
    And I wait for loading invisible
    When I set the parameter "EventCode" with value "AutoTestUserCreate"
    And I set the parameter "Describe" with value "test"
    And I click the "Save" button
    And I wait for loading invisible

  Scenario: 取消读取权限
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "__user_AutoTest__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    Then I click the "{'TabButton':'知识'}" button
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
    Given open the "knowledge.ListPage" page for uri "/knowledge/"
    And I wait for loading invisible
    Then I will see the search result "{'column':'0','name':'AutoTestUserCreate','contains':'no'}"

  Scenario Outline: 授权读取
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "__user_AutoTest__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    Then I click the "{'TabButton':'知识'}" button
    And I wait for "Loading" will be invisible
    And I "checked" the label before "<name>"
    And I "unchecked" the label before "<name>"
    When I "checked" function "读取" from the auth table which name is "<name>"
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
    Given open the "knowledge.ListPage" page for uri "/knowledge/"
    And I wait for loading invisible
    Then I will see the search result "{'column':'0','name':'<name>'}"
    Then the data name is "{'column':'0','name':'<name>'}" then i will see "查看授权" button
    And the data name is "<name>" then i click the "授权" button
    And I wait for loading invisible
    Then I will see the checkbox in tiny table before "验证授权用户" is disabled
    Given open the "knowledge.ListPage" page for uri "/knowledge/"
    And the data name is "<name>" then i click the "查看" button
    Then I will see the "knowledge.CreatePage" page
    Then I will see the element "EventCode" attribute is "disabled"

    Examples:
      | name               |
      | AutoTestUserCreate |

  Scenario Outline: 授权读取+编辑
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "__user_AutoTest__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    Then I click the "{'TabButton':'知识'}" button
    And I wait for "Loading" will be invisible
    And I "checked" the label before "<name>"
    When I "unchecked" function "删除,转授" from the auth table which name is "<name>"
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
    Given open the "knowledge.ListPage" page for uri "/knowledge/"
    And I wait for loading invisible
    Then the data name is "{'column':'0','name':'<name>'}" then i will see "编辑标签授权" button
    And the data name is "<name>" then i click the "标签" button
    And I set the parameter "Tag" with value "testTag"
    And I choose the "testTag" from the "TagDropdown"
    And I click the "Ensure" button
    Then I will see the success message "修改成功"
    And the data name is "<name>" then i click the "授权" button
    And I wait for loading invisible
    Then I will see the checkbox in tiny table before "验证授权用户" is disabled
    Given open the "knowledge.ListPage" page for uri "/knowledge/"
    And the data name is "<name>" then i click the "编辑" button
    Then I will see the "knowledge.CreatePage" page
    When I set the parameter "EventCode" with value "AutoTestRename"
    And I click the "Save" button
    And I wait for loading invisible

    Examples:
      | name               |
      | AutoTestUserCreate |

  Scenario Outline: 授权读取+编辑+删除
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "__user_AutoTest__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    Then I click the "{'TabButton':'知识'}" button
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
    And I wait for "2000" millsecond
    Given open the "knowledge.ListPage" page for uri "/knowledge/"
    And I wait for loading invisible
    Then the data name is "{'column':'0','name':'<name>'}" then i will see "编辑标签删除授权" button
    And the data name is "<name>" then i click the "标签" button
    And I set the parameter "Tag" with value "testTag"
    And I choose the "testTag" from the "TagDropdown"
    And I click the "Ensure" button
    Then I will see the success message "修改成功"
    And the data name is "<name>" then i click the "授权" button
    And I wait for loading invisible
    Then I will see the checkbox in tiny table before "验证授权用户" is disabled
    Given open the "knowledge.ListPage" page for uri "/knowledge/"
    And the data name is "{'column':'1','name':'AutoTestRename'}" then i click the "编辑" button
    Then I will see the "knowledge.CreatePage" page
    When I set the parameter "EventCode" with value "AutoTestRename"
    And I click the "Save" button
    And I wait for loading invisible
    Then I will see the "knowledge.ListPage" page
    And the data name is "<name>" then i click the "删除" button
    And I click the "Ensure" button
    Then I will see the success message "删除知识成功"

    Examples:
      | name               |
      | AutoTestUserCreate |

  Scenario Outline: 授权读取+删除
    Given open the "knowledge.ListPage" page for uri "/knowledge/"
    And I wait for loading invisible
    And I click the "Create" button
    Then I will see the "knowledge.CreatePage" page
    And I wait for loading invisible
    When I set the parameter "EventCode" with value "<name>"
    And I set the parameter "Describe" with value "test"
    And I click the "Save" button
    And I wait for loading invisible
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "__user_AutoTest__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    Then I click the "{'TabButton':'知识'}" button
    And I wait for "Loading" will be invisible
    And I "checked" the label before "<name>"
    When I "unchecked" function "编辑,转授" from the auth table which name is "<name>"
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
    Given open the "knowledge.ListPage" page for uri "/knowledge/"
    And I wait for loading invisible
    Then the data name is "{'column':'0','name':'<name>'}" then i will see "查看删除授权" button
    And the data name is "<name>" then i click the "查看" button
    Then I will see the "knowledge.CreatePage" page
    Then I will see the element "EventCode" attribute is "disabled"
    Given open the "knowledge.ListPage" page for uri "/knowledge/"
    And the data name is "<name>" then i click the "授权" button
    And I wait for loading invisible
    Then I will see the checkbox in tiny table before "验证授权用户" is disabled
    Given open the "knowledge.ListPage" page for uri "/knowledge/"
    And the data name is "<name>" then i click the "删除" button
    And I wait for "Ensure" will be visible
    And I click the "Ensure" button
    Then I will see the success message "删除知识成功"

    Examples:
      | name               |
      | AutoTestUserCreate |

  Scenario Outline: 读取+授权
    Given open the "knowledge.ListPage" page for uri "/knowledge/"
    And I wait for loading invisible
    And I click the "Create" button
    Then I will see the "knowledge.CreatePage" page
    And I wait for loading invisible
    When I set the parameter "EventCode" with value "<name>"
    And I set the parameter "Describe" with value "test"
    And I click the "Save" button
    And I wait for loading invisible
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "__user_AutoTest__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    And I wait for loading invisible
    Then I click the "{'TabButton':'知识'}" button
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
    Given open the "knowledge.ListPage" page for uri "/knowledge/"
    And I wait for loading invisible
    Then the data name is "{'column':'0','name':'<name>'}" then i will see "查看授权" button
    And the data name is "<name>" then i click the "查看" button
    Then I will see the "knowledge.CreatePage" page
    Then I will see the element "EventCode" attribute is "disabled"
    Given open the "knowledge.ListPage" page for uri "/knowledge/"
    And the data name is "<name>" then i click the "授权" button
    And I "check" the checkbox which name is "验证授权用户" in tiny table
    And I click the "Ensure" button
    Then I will see the message "保存成功"
    Given I will see the "PublicNavBarPage" page
    And I wait for "Dashboard" will be visible
    And I logout current user
    And I wait for title change text to "登录"
    And open the "LoginPage" page for uri "/auth/login/"
    When I set the parameter "Username" with value "AutoTest"
    And I set the parameter "Password" with value "All#123456"
    And I click the "LoginButton" button
    And I wait for "2000" millsecond
    Given open the "knowledge.ListPage" page for uri "/knowledge/"
    And I wait for loading invisible
    Then the data name is "{'column':'0','name':'<name>'}" then i will see "查看授权" button
    And the data name is "<name>" then i click the "查看" button
    Then I will see the "knowledge.CreatePage" page
    Then I will see the element "EventCode" attribute is "disabled"

    Examples:
      | name         |
      | AutoTestAuth |

  Scenario Outline: 读取+编辑+授权
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "__user_AutoTest__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    And I wait for loading invisible
    Then I click the "{'TabButton':'知识'}" button
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
    Given open the "knowledge.ListPage" page for uri "/knowledge/"
    And I wait for loading invisible
    Then the data name is "{'column':'0','name':'<name>'}" then i will see "编辑标签授权" button
    And the data name is "<name>" then i click the "标签" button
    And I set the parameter "Tag" with value "testTag"
    And I choose the "testTag" from the "TagDropdown"
    And I click the "Ensure" button
    Then I will see the success message "修改成功"
    And I wait for loading invisible
    And the data name is "<name>" then i click the "编辑" button
    Then I will see the "knowledge.CreatePage" page
    When I set the parameter "EventCode" with value "AutoTestRename"
    And I click the "Save" button
    And I wait for loading invisible
    Then I will see the "knowledge.ListPage" page
    And the data name is "<name>" then i click the "授权" button
    And I "check" the checkbox which name is "验证授权用户" in tiny table
    And I click the "Ensure" button
    Then I will see the message "保存成功"
    Given I will see the "PublicNavBarPage" page
    And I wait for "Dashboard" will be visible
    And I logout current user
    And I wait for title change text to "登录"
    And open the "LoginPage" page for uri "/auth/login/"
    When I set the parameter "Username" with value "AutoTest"
    And I set the parameter "Password" with value "All#123456"
    And I click the "LoginButton" button
    And I wait for "2000" millsecond
    Given open the "knowledge.ListPage" page for uri "/knowledge/"
    And I wait for loading invisible
    Then the data name is "{'column':'0','name':'<name>'}" then i will see "编辑标签授权" button

    Examples:
      | name         |
      | AutoTestAuth |

  Scenario: 有效期限
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "__user_AutoTest__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    Then I click the "{'TabButton':'功能'}" button
    And I wait for "Loading" will be invisible
    When I "checked" the checkbox which name is "全选"
    And I click the "SaveButton" button
    Then I click the "{'TabButton':'知识'}" button
    And I wait for loading invisible
    And I "checked" the label before "AutoTestAuth"
    When the data name is "AutoTestAuth" then I click the "无期限" button without total page
    And I click the "Customize" button
    And I click the "DateEditor" button
    And I set the time input "TimeInput" to "1" minutes later
    And I click the "EnsureTime" button
    And I click the "SaveButton" button
    And I will see the success message "保存成功"

  Scenario: 新建知识
    Given open the "knowledge.ListPage" page for uri "/knowledge/"
    And I wait for loading invisible
    And I click the "Create" button
    Then I will see the "knowledge.CreatePage" page
    And I wait for loading invisible
    When I set the parameter "EventCode" with value "AutoTest"
    And I set the parameter "Describe" with value "test"
    And I click the "Save" button
    And I wait for loading invisible

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
    And I wait for "2000" millsecond
    Given open the "knowledge.ListPage" page for uri "/knowledge/"
    And I wait for loading invisible
    Then I will see the search result "{'column':'0','name':'AutoTestAuth','contains':'no'}"

  Scenario Outline: 读取+删除+授权
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "__user_AutoTest__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    And I wait for loading invisible
    Then I click the "{'TabButton':'知识'}" button
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
    Then I click the "{'TabButton':'知识'}" button
    And I wait for "Loading" will be invisible
    And I "checked" the label before "<name>"
    And I "unchecked" the label before "<name>"
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
    Given open the "knowledge.ListPage" page for uri "/knowledge/"
    And I wait for loading invisible
    Then the data name is "{'column':'0','name':'<name>'}" then i will see "查看删除授权" button
    And the data name is "<name>" then i click the "查看" button
    Then I will see the "knowledge.CreatePage" page
    Then I will see the element "EventCode" attribute is "disabled"
    Given open the "knowledge.ListPage" page for uri "/knowledge/"
    And the data name is "<name>" then i click the "授权" button
    And I "check" the checkbox which name is "验证授权用户" in tiny table
    And I click the "Ensure" button
    Then I will see the message "保存成功"
    Given I will see the "PublicNavBarPage" page
    And I wait for "Dashboard" will be visible
    And I logout current user
    And I wait for title change text to "登录"
    And open the "LoginPage" page for uri "/auth/login/"
    When I set the parameter "Username" with value "AutoTest"
    And I set the parameter "Password" with value "All#123456"
    And I click the "LoginButton" button
    And I wait for "2000" millsecond
    Given open the "knowledge.ListPage" page for uri "/knowledge/"
    And I wait for loading invisible
    Then the data name is "{'column':'0','name':'<name>'}" then i will see "查看删除授权" button
    And the data name is "<name>" then i click the "删除" button
    And I wait for "Ensure" will be visible
    And I click the "Ensure" button
    Then I will see the success message "删除知识成功"

    Examples:
      | name         |
      | AutoTestAuth |

  Scenario Outline: 授权所有权限
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "__user_AutoTest__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    And I wait for loading invisible
    Then I click the "{'TabButton':'知识'}" button
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
    Given open the "knowledge.ListPage" page for uri "/knowledge/"
    And I wait for loading invisible
    Then the data name is "{'column':'0','name':'<name>'}" then i will see "编辑标签删除授权" button
    And the data name is "<name>" then i click the "标签" button
    And I set the parameter "Tag" with value "testTag"
    And I choose the "testTag" from the "TagDropdown"
    And I click the "Ensure" button
    Then I will see the success message "修改成功"
    And I wait for loading invisible
    And the data name is "<name>" then i click the "编辑" button
    Then I will see the "knowledge.CreatePage" page
    When I set the parameter "EventCode" with value "AutoTestRename"
    And I click the "Save" button
    And I wait for loading invisible
    Then I will see the "knowledge.ListPage" page
    And the data name is "<name>" then i click the "授权" button
    And I "check" the checkbox which name is "验证授权用户" in tiny table
    And I click the "Ensure" button
    Then I will see the message "保存成功"
    Given I will see the "PublicNavBarPage" page
    And I wait for "Dashboard" will be visible
    And I logout current user
    And I wait for title change text to "登录"
    And open the "LoginPage" page for uri "/auth/login/"
    When I set the parameter "Username" with value "AutoTest"
    And I set the parameter "Password" with value "All#123456"
    And I click the "LoginButton" button
    And I wait for "2000" millsecond
    Given open the "knowledge.ListPage" page for uri "/knowledge/"
    And I wait for loading invisible
    Then the data name is "{'column':'0','name':'<name>'}" then i will see "编辑标签删除授权" button
    And the data name is "<name>" then i click the "删除" button
    And I wait for "Ensure" will be visible
    And I click the "Ensure" button
    Then I will see the success message "删除知识成功"

    Examples:
      | name     |
      | AutoTest |

  Scenario: 新建知识以测试二次授权
    Given open the "knowledge.ListPage" page for uri "/knowledge/"
    And I wait for loading invisible
    And I click the "Create" button
    Then I will see the "knowledge.CreatePage" page
    And I wait for loading invisible
    When I set the parameter "EventCode" with value "测试二次授权"
    And I set the parameter "Describe" with value "test"
    And I click the "Save" button
    And I wait for loading invisible

  Scenario: 给AutoTest用户授权
    Given open the "knowledge.ListPage" page for uri "/knowledge/"
    And I wait for loading invisible
    When the data name is "{'column':'0','name':'测试二次授权'}" then i click the "授权" button
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
    And I wait for "2000" millsecond
    Given open the "knowledge.ListPage" page for uri "/knowledge/"
    And I wait for loading invisible
    When the data name is "{'column':'0','name':'<name>'}" then i click the "授权" button
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
    Given open the "knowledge.ListPage" page for uri "/knowledge/"
    And I wait for loading invisible
    Then I will see the search result "{'column':'0','name':'<name>'}"
    Then the data name is "{'column':'0','name':'<name>'}" then i will see "查看授权" button
    And the data name is "<name>" then i click the "授权" button
    And I wait for loading invisible
    Then I will see the checkbox in tiny table before "AutoTest" is disabled
    Given open the "knowledge.ListPage" page for uri "/knowledge/"
    And the data name is "<name>" then i click the "查看" button
    Then I will see the "knowledge.CreatePage" page
    Then I will see the element "EventCode" attribute is "disabled"

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
    And I wait for "2000" millsecond
    Given open the "knowledge.ListPage" page for uri "/knowledge/"
    And I wait for loading invisible
    When the data name is "{'column':'0','name':'<name>'}" then i click the "授权" button
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
    Given open the "knowledge.ListPage" page for uri "/knowledge/"
    And I wait for loading invisible
    Then the data name is "{'column':'0','name':'<name>'}" then i will see "编辑标签授权" button
    And the data name is "<name>" then i click the "标签" button
    And I set the parameter "Tag" with value "testTag"
    And I choose the "testTag" from the "TagDropdown"
    And I click the "Ensure" button
    Then I will see the success message "修改成功"
    And the data name is "<name>" then i click the "授权" button
    And I wait for loading invisible
    Then I will see the checkbox in tiny table before "AutoTest" is disabled
    Given open the "knowledge.ListPage" page for uri "/knowledge/"
    And the data name is "<name>" then i click the "编辑" button
    Then I will see the "knowledge.CreatePage" page
    When I set the parameter "EventCode" with value "AutoTestRename"
    And I click the "Save" button
    And I wait for loading invisible

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
    And I wait for "2000" millsecond
    Given open the "knowledge.ListPage" page for uri "/knowledge/"
    And I wait for loading invisible
    When the data name is "{'column':'0','name':'<name>'}" then i click the "授权" button
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
    Given open the "knowledge.ListPage" page for uri "/knowledge/"
    And I wait for loading invisible
    Then the data name is "{'column':'0','name':'<name>'}" then i will see "编辑标签删除授权" button
    And the data name is "<name>" then i click the "标签" button
    And I set the parameter "Tag" with value "testTag"
    And I choose the "testTag" from the "TagDropdown"
    And I click the "Ensure" button
    Then I will see the success message "修改成功"
    And the data name is "<name>" then i click the "授权" button
    And I wait for loading invisible
    Then I will see the checkbox in tiny table before "AutoTest" is disabled
    Given open the "knowledge.ListPage" page for uri "/knowledge/"
    And the data name is "{'column':'1','name':'AutoTestRename'}" then i click the "编辑" button
    Then I will see the "knowledge.CreatePage" page
    When I set the parameter "EventCode" with value "AutoTestRename"
    And I click the "Save" button
    And I wait for loading invisible
    Then I will see the "knowledge.ListPage" page
    And the data name is "<name>" then i click the "删除" button
    And I click the "Ensure" button
    Then I will see the success message "删除知识成功"

    Examples:
      | authRole | authName | function | name   |
      | 用户分组     | 验证授权用户分组 | 读取,编辑,删除 | 测试二次授权 |



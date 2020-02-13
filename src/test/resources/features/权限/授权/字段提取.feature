@auth
Feature: 权限-字段提取

  Scenario: 验证无新建权限
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "__user_AutoTest__" then i click the "授权" button
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
    And I set the parameter "Password" with value "All#123456"
    And I click the "LoginButton" button
    And I wait for "2000" millsecond
    Given open the "configs.ListPage" page for uri "/configs/"
    And I wait for loading invisible
    Then I will see the "CreateButton" doesn't exist

  Scenario: 验证有新建权限
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "__user_AutoTest__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    Then I click the "{'TabButton':'功能'}" button
    And I wait for "Loading" will be invisible
    When I "checked" the checkbox which name is "全选"
    When I "unchecked" the checkbox which name is "全选"
    And I "checked" the checkbox which name is "可使用字段提取,新建字段提取,可查看角色页,可使用应用功能"
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
    Given open the "configs.ListPage" page for uri "/configs/"
    And I wait for loading invisible
    And I click the "Create" button
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
    And I click the "Done" button
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
    And I set the parameter "Password" with value "All#123456"
    And I click the "LoginButton" button
    And I wait for "2000" millsecond
    Given open the "configs.ListPage" page for uri "/configs/"
    Then I will see the search result "{'column':'0','name':'AutoTestUserCreate','contains':'no'}"

  Scenario Outline: 授权读取权限
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "__user_AutoTest__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    Then I click the "{'TabButton':'字段提取'}" button
    And I wait for "Loading" will be invisible
    And I "checked" the label before "<name>"
    And I "unchecked" the label before "<name>"
    When I "checked" function "读取" from the auth table which name is "<name>"
    And I click the "SaveButton" button
    And I will see the success message "保存成功"
    Then I click the "{'TabButton':'功能'}" button
    And I wait for "Loading" will be invisible
    When I "checked" the checkbox which name is "全选"
    When I "unchecked" the checkbox which name is "全选"
    And I "checked" the checkbox which name is "可使用字段提取,可查看角色页,可使用应用功能"
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
    Given open the "configs.ListPage" page for uri "/configs/"
    Then the data name is "{'column':'1','name':'<name>'}" then i will see "查看授权" button
    Then I will see the checkbox in list before "{'column':'1','name':'<name>'}" is "disabled"
    When the data name is "{'column':'1','name':'<name>'}" then i click the "查看" button
    Then I will see the "configs.CreatePage" page
    When I set the parameter "LogSample" with value "192.168.1.200,xmxm,rzy,13800000000"
    And I click the "NextButton" button
    Then I will see the element "Done" attribute is "disabled"
    Given open the "configs.ListPage" page for uri "/configs/"
    And the data name is "{'column':'1','name':'<name>'}" then i click the "授权" button
    And I wait for loading invisible
    Then I will see the checkbox in tiny table before "__user_验证授权用户__" is disabled

    Examples:
      | name               |
      | AutoTestUserCreate |

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
    Then I click the "{'TabButton':'功能'}" button
    And I wait for "Loading" will be invisible
    When I "checked" the checkbox which name is "全选"
    When I "unchecked" the checkbox which name is "全选"
    And I "checked" the checkbox which name is "可使用字段提取,新建字段提取,可查看角色页,可使用应用功能"
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
    Given open the "configs.ListPage" page for uri "/configs/"
    Then the data name is "{'column':'1','name':'AutoTestUserCreate'}" then i will see "编辑标签复制授权" button
    Then I will see the checkbox in list before "{'column':'1','name':'AutoTestUserCreate'}" is "enabled"
    When the data name is "{'column':'1','name':'AutoTestUserCreate'}" then i click the "复制" button
    Then I will see the success message "复制成功"
    When the data name is "{'column':'1','name':'AutoTestUserCreate'}" then i click the "编辑" button
    Then I will see the "configs.CreatePage" page
    When I set the parameter "LogSample" with value "192.168.1.200,xmxm,rzy,13800000000"
    And I click the "NextButton" button under some element
    When I set the parameter "Name" with value "AutoTestUserRename"
    And I click the "Done" button
    Then I wait for "ConfigDone" will be visible
    Given open the "configs.ListPage" page for uri "/configs/"
    When the data name is "{'column':'1','name':'AutoTestUserRename'}" then i click the "标签" button
    And I set the parameter "TagInput" with value "自动化测试标签"
    And I choose the "自动化测试标签" from the "Group"
    And I click the "Ensure" button
    Then I will see the success message "修改成功"
    And the data name is "{'column':'1','name':'AutoTestUserRename'}" then i click the "授权" button
    And I wait for loading invisible
    Then I will see the checkbox in tiny table before "验证授权用户" is disabled

  Scenario Outline: 授权读取+编辑+删除权限
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "__user_AutoTest__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    Then I click the "{'TabButton':'字段提取'}" button
    And I wait for "Loading" will be invisible
    And I "checked" the label before "<name>"
    When I "unchecked" function "转授" from the auth table which name is "<name>"
    And I click the "SaveButton" button
    And I will see the success message "保存成功"
    Then I click the "{'TabButton':'功能'}" button
    And I wait for "Loading" will be invisible
    When I "checked" the checkbox which name is "全选"
    When I "unchecked" the checkbox which name is "全选"
    And I "checked" the checkbox which name is "可使用字段提取,新建字段提取,可查看角色页,可使用应用功能"
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
    Given open the "configs.ListPage" page for uri "/configs/"
    Then the data name is "{'column':'1','name':'<name>'}" then i will see "编辑标签复制删除授权" button
    Then I will see the checkbox in list before "{'column':'1','name':'<name>'}" is "enabled"
    When the data name is "{'column':'1','name':'<name>'}" then i click the "复制" button
    Then I will see the success message "复制成功"
    When the data name is "{'column':'1','name':'<name>'}" then i click the "编辑" button
    Then I will see the "configs.CreatePage" page
    When I set the parameter "LogSample" with value "192.168.1.200,xmxm,rzy,13800000000"
    And I click the "NextButton" button under some element
    When I set the parameter "Name" with value "副本"
    And I click the "Done" button
    Then I wait for "ConfigDone" will be visible
    Given open the "configs.ListPage" page for uri "/configs/"
    When the data name is "{'column':'1','name':'副本'}" then i click the "标签" button
    And I set the parameter "TagInput" with value "自动化测试标签"
    And I choose the "自动化测试标签" from the "Group"
    And I click the "Ensure" button
    Then I will see the success message "修改成功"
    And I wait for loading invisible
    And the data name is "{'column':'1','name':'副本'}" then i click the "授权" button
    And I wait for loading invisible
    Then I will see the checkbox in tiny table before "验证授权用户" is disabled
    Given open the "configs.ListPage" page for uri "/configs/"
    And I wait for loading invisible
    When the data name is "{'column':'1','name':'副本'}" then i click the "删除" button
    And I wait for "Ensure" will be visible
    And I click the "Ensure" button
    Then I will see the success message "删除成功"

    Examples:
      | name                   |
      | AutoTestUserCreate(副本) |

  Scenario Outline: 授权读取+删除
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "__user_AutoTest__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    Then I click the "{'TabButton':'字段提取'}" button
    And I wait for "Loading" will be invisible
    And I "checked" the label before "<name>"
    When I "unchecked" function "编辑,转授" from the auth table which name is "<name>"
    And I click the "SaveButton" button
    And I will see the success message "保存成功"
    Then I click the "{'TabButton':'功能'}" button
    And I wait for "Loading" will be invisible
    When I "checked" the checkbox which name is "全选"
    When I "unchecked" the checkbox which name is "全选"
    And I "checked" the checkbox which name is "可使用字段提取,可查看角色页,可使用应用功能"
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
    Given open the "configs.ListPage" page for uri "/configs/"
    Then the data name is "{'column':'1','name':'<name>'}" then i will see "查看删除授权" button
    Then I will see the checkbox in list before "{'column':'1','name':'<name>'}" is "disabled"
    When the data name is "{'column':'1','name':'<name>'}" then i click the "查看" button
    Then I will see the "configs.CreatePage" page
    When I set the parameter "LogSample" with value "192.168.1.200,xmxm,rzy,13800000000"
    And I click the "NextButton" button
    Then I will see the element "Done" attribute is "disabled"
    Given open the "configs.ListPage" page for uri "/configs/"
    And the data name is "{'column':'1','name':'<name>'}" then i click the "授权" button
    And I wait for loading invisible
    Then I will see the checkbox in tiny table before "验证授权用户" is disabled
    Given open the "configs.ListPage" page for uri "/configs/"
    When the data name is "{'column':'1','name':'<name>'}" then i click the "删除" button
    And I wait for "Ensure" will be visible
    And I click the "Ensure" button
    Then I will see the success message "删除成功"

    Examples:
      | name                       |
      | AutoTestUserCreate(副本)(副本) |

  Scenario Outline: 授权读取+转授权限
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "__user_AutoTest__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    Then I click the "{'TabButton':'字段提取'}" button
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
    Then I click the "{'TabButton':'字段提取'}" button
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
    Given open the "configs.ListPage" page for uri "/configs/"
    And I wait for loading invisible
    Then the data name is "{'column':'1','name':'<name>'}" then i will see "查看复制授权" button
    Then I will see the checkbox in list before "{'column':'1','name':'<name>'}" is "disabled"
    When the data name is "{'column':'1','name':'<name>'}" then i click the "查看" button
    Then I will see the "configs.CreatePage" page
    When I set the parameter "LogSample" with value "192.168.1.200,xmxm,rzy,13800000000"
    And I click the "NextButton" button
    Then I will see the element "Done" attribute is "disabled"
    Given open the "configs.ListPage" page for uri "/configs/"
    And the data name is "{'column':'1','name':'<name>'}" then i click the "授权" button
    And I wait for loading invisible
    And I "check" the checkbox which name is "验证授权用户" in tiny table
    And I click the "Ensure" button
    Then I will see the error message "保存成功"
    Given I will see the "PublicNavBarPage" page
    And I wait for "Dashboard" will be visible
    And I logout current user
    And I wait for title change text to "登录"
    And open the "LoginPage" page for uri "/auth/login/"
    When I set the parameter "Username" with value "验证授权用户"
    And I set the parameter "Password" with value "All#123456"
    And I click the "LoginButton" button
    And I wait for "2000" millsecond
    Given open the "configs.ListPage" page for uri "/configs/"
    Then the data name is "{'column':'1','name':'<name>'}" then i will see "查看复制授权" button

    Examples:
      | name               |
      | AutoTestUserRename |

  Scenario Outline: 授权读取+编辑+转授权限
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "__user_AutoTest__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    Then I click the "{'TabButton':'字段提取'}" button
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
    Then I click the "{'TabButton':'字段提取'}" button
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
    Given open the "configs.ListPage" page for uri "/configs/"
    Then the data name is "{'column':'1','name':'<name>'}" then i will see "编辑标签复制授权" button
    When the data name is "{'column':'1','name':'<name>'}" then I "close" the switch
    Then I will see the success message "禁用成功"
    And I wait for "SuccessMessage" will be invisible
    When the data name is "{'column':'1','name':'<name>'}" then i click the "标签" button
    And I set the parameter "TagInput" with value "自动化测试标签"
    And I choose the "自动化测试标签" from the "Group"
    And I click the "Ensure" button
    Then I will see the success message "修改成功"
    Given open the "configs.ListPage" page for uri "/configs/"
    And the data name is "{'column':'1','name':'<name>'}" then i click the "授权" button
    And I wait for loading invisible
    And I "check" the checkbox which name is "验证授权用户" in tiny table
    And I click the "Ensure" button
    Then I will see the error message "保存成功"
    Given I will see the "PublicNavBarPage" page
    And I wait for "Dashboard" will be visible
    And I logout current user
    And I wait for title change text to "登录"
    And open the "LoginPage" page for uri "/auth/login/"
    When I set the parameter "Username" with value "验证授权用户"
    And I set the parameter "Password" with value "All#123456"
    And I click the "LoginButton" button
    And I wait for "2000" millsecond
    Given open the "configs.ListPage" page for uri "/configs/"
    Then the data name is "{'column':'1','name':'<name>'}" then i will see "编辑标签复制授权" button
    When the data name is "{'column':'1','name':'<name>'}" then i click the "编辑" button
    Then I will see the "configs.CreatePage" page
    When I set the parameter "LogSample" with value "192.168.1.200,xmxm,rzy,13800000000"
    And I click the "NextButton" button under some element
    When I set the parameter "Name" with value "副本"
    And I click the "Done" button
    Then I wait for "ConfigDone" will be visible

    Examples:
      | name               |
      | AutoTestUserRename |

  Scenario Outline: 授权读取+删除+转授权限
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "__user_AutoTest__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    Then I click the "{'TabButton':'字段提取'}" button
    And I wait for "Loading" will be invisible
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
    Then I click the "{'TabButton':'字段提取'}" button
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
    Given open the "configs.ListPage" page for uri "/configs/"
    And I wait for loading invisible
    Then the data name is "{'column':'1','name':'<name>'}" then i will see "查看复制删除授权" button
    Then I will see the checkbox in list before "{'column':'1','name':'<name>'}" is "disabled"
    When the data name is "{'column':'1','name':'<name>'}" then i click the "复制" button
    Then I will see the success message "复制成功"
    When the data name is "{'column':'1','name':'<name>'}" then i click the "查看" button
    Then I will see the "configs.CreatePage" page
    When I set the parameter "LogSample" with value "192.168.1.200,xmxm,rzy,13800000000"
    And I click the "NextButton" button
    Then I will see the element "Done" attribute is "disabled"
    Given open the "configs.ListPage" page for uri "/configs/"
    And the data name is "{'column':'1','name':'<name>'}" then i click the "授权" button
    And I wait for loading invisible
    And I "check" the checkbox which name is "验证授权用户" in tiny table
    And I click the "Ensure" button
    Then I will see the error message "保存成功"
    Given I will see the "PublicNavBarPage" page
    And I wait for "Dashboard" will be visible
    And I logout current user
    And I wait for title change text to "登录"
    And open the "LoginPage" page for uri "/auth/login/"
    When I set the parameter "Username" with value "验证授权用户"
    And I set the parameter "Password" with value "All#123456"
    And I click the "LoginButton" button
    And I wait for "2000" millsecond
    Given open the "configs.ListPage" page for uri "/configs/"
    Then the data name is "{'column':'1','name':'<name>'}" then i will see "查看复制删除授权" button
    When the data name is "{'column':'1','name':'<name>'}" then i click the "删除" button
    And I wait for "Ensure" will be visible
    And I click the "Ensure" button
    Then I will see the success message "删除成功"

    Examples:
      | name |
      | 副本   |

  Scenario Outline: 授权所有权限
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "__user_AutoTest__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    Then I click the "{'TabButton':'字段提取'}" button
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
    Then I click the "{'TabButton':'字段提取'}" button
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
    Given open the "configs.ListPage" page for uri "/configs/"
    Then the data name is "{'column':'1','name':'<name>'}" then i will see "编辑标签复制删除授权" button
    When the data name is "{'column':'1','name':'<name>'}" then I "open" the switch
    Then I will see the success message "启用成功"
    And I wait for "SuccessMessage" will be invisible
    When the data name is "{'column':'1','name':'<name>'}" then i click the "标签" button
    And I set the parameter "TagInput" with value "自动化测试标签"
    And I choose the "自动化测试标签" from the "Group"
    And I click the "Ensure" button
    Then I will see the success message "修改成功"
    Given open the "configs.ListPage" page for uri "/configs/"
    And the data name is "{'column':'1','name':'<name>'}" then i click the "授权" button
    And I wait for loading invisible
    And I "check" the checkbox which name is "验证授权用户" in tiny table
    And I click the "Ensure" button
    Then I will see the error message "保存成功"
    Given I will see the "PublicNavBarPage" page
    And I wait for "Dashboard" will be visible
    And I logout current user
    And I wait for title change text to "登录"
    And open the "LoginPage" page for uri "/auth/login/"
    When I set the parameter "Username" with value "验证授权用户"
    And I set the parameter "Password" with value "All#123456"
    And I click the "LoginButton" button
    And I wait for "2000" millsecond
    Given open the "configs.ListPage" page for uri "/configs/"
    Then the data name is "{'column':'1','name':'<name>'}" then i will see "编辑标签复制删除授权" button
    When the data name is "{'column':'1','name':'<name>'}" then i click the "编辑" button
    Then I will see the "configs.CreatePage" page
    When I set the parameter "LogSample" with value "192.168.1.200,xmxm,rzy,13800000000"
    And I click the "NextButton" button under some element
    When I set the parameter "Name" with value "副本"
    And I click the "Done" button
    Then I wait for "ConfigDone" will be visible

    Examples:
      | name   |
      | 副本(副本) |

  Scenario: 有效期限
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "__user_AutoTest__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    Then I click the "{'TabButton':'功能'}" button
    And I wait for "Loading" will be invisible
    When I "checked" the checkbox which name is "全选"
    And I click the "SaveButton" button
    Then I click the "{'TabButton':'字段提取'}" button
    And I wait for loading invisible
    And I "checked" the label before "副本"
    When the data name is "副本" then I click the "无期限" button without total page
    And I click the "Customize" button
    And I click the "DateEditor" button
    And I set the time input "TimeInput" to "1" minutes later
    And I click the "EnsureTime" button
    And I click the "SaveButton" button
    And I will see the success message "保存成功"

  Scenario Outline: 修改字段提取名称
    Given open the "configs.ListPage" page for uri "/configs/"
    When the data name is "{'column':'1','name':'<name>'}" then i click the "编辑" button
    Then I will see the "configs.CreatePage" page
    When I set the parameter "LogSample" with value "192.168.1.200,xmxm,rzy,13800000000"
    And I click the "NextButton" button under some element
    When I set the parameter "Name" with value "测试有效期限"
    And I click the "Done" button
    Then I wait for "ConfigDone" will be visible

    Examples:
      | name |
      | 副本   |

  Scenario: 验证有效期限生效
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
    Given open the "configs.ListPage" page for uri "/configs/"
    Then I will see the search result "{'column':'1','name':'测试有效期限','contains':'no'}"

  Scenario: 删除字段提取
    Given open the "configs.ListPage" page for uri "/configs/"
    When the data name is "{'column':'1','name':'测试有效期限'}" then i click the "删除" button
    And I wait for "Ensure" will be visible
    And I click the "Ensure" button
    Then I will see the success message "删除成功"
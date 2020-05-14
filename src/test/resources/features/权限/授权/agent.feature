@auth
Feature: 权限-agent

  Scenario: 验证无新建分组权限
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "__user_AutoTest__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    And I wait for "Loading" will be invisible
    Then I click the "{'TabButton':'功能'}" button
    And I wait for "Loading" will be invisible
    When I "checked" the checkbox which name is "全选"
    When I "unchecked" the checkbox which name is "新建 Agent"
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
    Given open the "agent.GroupPage" page for uri "/sources/input/agent/group/"
    Then I will see the "Create" doesn't exist

  Scenario: 验证有新建分组权限
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "__user_AutoTest__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
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
    Given open the "agent.GroupPage" page for uri "/sources/input/agent/group/"
    And I click the "Create" button
    Then I will see the "agent.CreatePage" page
    And I set the parameter "GroupName" with value "TestAuth"
    And I choose the "__user_验证授权用户__" from the "RoleDropdown"
    Then I will see the "agent.GroupPage" page
    And I click the "CreateAgentGroupButton" button
    Then I will see the "agent.CreatePage" page
    Then I will see the message "创建成功"

  Scenario Outline: 验证无读取权限
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "__user_AutoTest__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    Then I click the "{'TabButton':'Agent 管理'}" button
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
    Given open the "agent.GroupPage" page for uri "/sources/input/agent/group/"
    Then I will see the search result "{'column':'0','name':'<name>','contains':'no'}"

    Examples:
      | name     |
      | TestAuth |

  Scenario Outline: 验证有读权限
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "__user_AutoTest__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    Then I click the "{'TabButton':'Agent 管理'}" button
    And I wait for "Loading" will be invisible
    And I "checked" the label before "<name>"
    And I "unchecked" the label before "<name>"
    And I "checked" function "读取" from the auth table which name is "<name>"
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
    Given open the "agent.GroupPage" page for uri "/sources/input/agent/group/"
    Then the data name is "<name>" then i will see "跳转" button
    And the data name is "<name>" then i click the "跳转" button
    And I wait for "Message" will be visible
    Then I will see the message "<message>"

    Examples:
      | name     | message                    |
      | TestAuth | 获取 Agent 数据失败，原因：没有相关的功能权限 |

  Scenario Outline: 验证读取+编辑
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "__user_AutoTest__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    Then I click the "{'TabButton':'Agent 管理'}" button
    And I wait for "Loading" will be invisible
    And I "checked" the label before "<name>"
    And I "unchecked" the label before "<name>"
    And I "checked" function "读取,编辑" from the auth table which name is "<name>"
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
    Given open the "agent.GroupPage" page for uri "/sources/input/agent/group/"
    And I wait for loading invisible
    Then the data name is "<name>" then i will see "编辑 跳转" button
    When the data name is "<name>" then i click the "编辑" button
    Then I will see the "agent.CreatePage" page
    And I set the parameter "GroupName" with value "TestAuthRename"
    And I click the "Save" button
    Given open the "agent.GroupPage" page for uri "/sources/input/agent/group/"
    And the data name is "TestAuthRename" then i click the "跳转" button
    Then I will see the message "<message>"

    Examples:
      | name     | message                    |
      | TestAuth | 获取 Agent 数据失败，原因：没有相关的功能权限 |

  Scenario: 有效期限
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "__user_AutoTest__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    Then I click the "{'TabButton':'Agent 管理'}" button
    And I wait for "Loading" will be invisible
    And I "checked" the label before "TestAuth"
    When the data name is "TestAuth" then I click the "无期限" button without total page
    And I click the "Customize" button
    And I click the "DateEditor" button
    And I set the time input "TimeInput" to "1" minutes later
    And I click the "EnsureTime" button
    And I click the "SaveButton" button
    And I will see the success message "保存成功"
    Then I click the "{'TabButton':'功能'}" button
    And I wait for "Loading" will be invisible
    When I "checked" the checkbox which name is "全选"
    And I click the "SaveButton" button

  Scenario: 新建agent分组
    Given I wait for "2000" millsecond
    And I logout current user
    And I wait for title change text to "登录"
    And open the "LoginPage" page for uri "/auth/login/"
    When I set the parameter "Username" with value "AutoTest"
    And I set the parameter "Password" with value "All#123456"
    And I click the "LoginButton" button
    And I wait for "2000" millsecond
    Given open the "agent.GroupPage" page for uri "/sources/input/agent/group/"
    And I click the "Create" button
    Then I will see the "agent.CreatePage" page
    And I set the parameter "GroupName" with value "AutoTestAgent"
    And I choose the "__user_验证授权用户__" from the "RoleDropdown"
    Then I will see the "agent.GroupPage" page
    And I click the "CreateAgentGroupButton" button
    Then I will see the "agent.CreatePage" page
    Then I will see the message "创建成功"

  Scenario: 验证有效期限生效
    Given I will see the "PublicNavBarPage" page
    And I wait for "Dashboard" will be visible
    And I logout current user
    And I wait for title change text to "登录"
    And open the "LoginPage" page for uri "/auth/login/"
    When I set the parameter "Username" with value "AutoTest"
    And I set the parameter "Password" with value "All#123456"
    And I click the "LoginButton" button
    And I wait for "2000" millsecond
    Given open the "agent.GroupPage" page for uri "/sources/input/agent/group/"
    Then I will see the search result "{'column':'0','name':'TestAuthRename','contains':'no'}"

  Scenario Outline: 验证读取+删除
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "__user_AutoTest__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    Then I click the "{'TabButton':'Agent 管理'}" button
    And I wait for "Loading" will be invisible
    And I "unchecked" the label before "<name>"
    And I "checked" the label before "<name>"
    And I "unchecked" the label before "<name>"
    And I "checked" function "读取,删除" from the auth table which name is "<name>"
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
    Given open the "agent.GroupPage" page for uri "/sources/input/agent/group/"
    Then the data name is "<name>" then i will see "跳转 删除" button
    And the data name is "<name>" then i click the "跳转" button
    Then I will see the message "<message>"
    Given open the "agent.GroupPage" page for uri "/sources/input/agent/group/"
    And the data name is "<name>" then i click the "删除" button
    And I click the "Ensure" button
    Then I wait for element "SuccessMessage" change text to "删除成功"

    Examples:
      | name           | message                    |
      | TestAuthRename | 获取 Agent 数据失败，原因：没有相关的功能权限 |

  Scenario Outline: 验证读取+编辑+删除
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "__user_AutoTest__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    Then I click the "{'TabButton':'Agent 管理'}" button
    And I wait for "Loading" will be invisible
    And I "checked" the label before "<name>"
    And I "unchecked" the label before "<name>"
    And I "checked" function "读取,编辑,删除" from the auth table which name is "<name>"
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
    Given open the "agent.GroupPage" page for uri "/sources/input/agent/group/"
    Then the data name is "<name>" then i will see "编辑 跳转 删除" button
    And the data name is "<name>" then i click the "跳转" button
    Then I will see the message "<message>"
    Given open the "agent.GroupPage" page for uri "/sources/input/agent/group/"
    When the data name is "<name>" then i click the "编辑" button
    Then I will see the "agent.CreatePage" page
    And I set the parameter "GroupName" with value "TestAuthRename"
    And I click the "Save" button
    Given open the "agent.GroupPage" page for uri "/sources/input/agent/group/"
    And the data name is "TestAuthRename" then i click the "删除" button
    And I click the "Ensure" button
    Then I wait for element "SuccessMessage" change text to "删除成功"

    Examples:
      | name          | message                    |
      | AutoTestAgent | 获取 Agent 数据失败，原因：没有相关的功能权限 |

  Scenario: 新建
    Given open the "agent.GroupPage" page for uri "/sources/input/agent/group/"
    And I click the "Create" button
    Then I will see the "agent.CreatePage" page
    And I set the parameter "GroupName" with value "验证组内权限"
    And I choose the "__user_验证授权用户__" from the "RoleDropdown"
    Then I will see the "agent.GroupPage" page
    And I click the "CreateAgentGroupButton" button
    Then I will see the "agent.CreatePage" page
    Then I will see the message "创建成功"

  Scenario Outline: 授权组内读取权限
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "__user_AutoTest__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    Then I click the "{'TabButton':'Agent 管理'}" button
    And I wait for "Loading" will be invisible
    And I "checked" the label before "<name>"
    And I "unchecked" the label before "<name>"
    And I "checked" function "读取" from the auth table which name is "<name>"
    And I "checked" function "读取" from the auth table in group which name is "<name>"
    And I click the "SaveButton" button
    And I will see the success message "保存成功"

    Examples:
      | name   |
      | 验证组内权限 |

  Scenario: 修改agent分组
    Given open the "agent.ListPage" page for uri "/sources/input/agent/"
    And I wait for loading invisible
    When the column is "1" then i click the "分组" button in agent page
    And I click the "Auth" button
    Then I click the "Complete" button

  Scenario Outline: 验证组内读取权限
    Given I will see the "PublicNavBarPage" page
    And I wait for "Dashboard" will be visible
    And I logout current user
    And I wait for title change text to "登录"
    And open the "LoginPage" page for uri "/auth/login/"
    When I set the parameter "Username" with value "AutoTest"
    And I set the parameter "Password" with value "All#123456"
    And I click the "LoginButton" button
    And I wait for "2000" millsecond
    Given open the "agent.GroupPage" page for uri "/sources/input/agent/group/"
    And the data name is "<name>" then i click the "跳转" button
    Then I will see the agent result in column "1"

    Examples:
      | name   |
      | 验证组内权限 |

  Scenario Outline: 授权组内读取+编辑权限
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "__user_AutoTest__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    Then I click the "{'TabButton':'Agent 管理'}" button
    And I wait for "Loading" will be invisible
    And I "checked" the label before "<name>"
    And I "unchecked" the label before "<name>"
    And I "checked" function "读取" from the auth table which name is "<name>"
    And I "checked" function "读取,编辑" from the auth table in group which name is "<name>"
    And I click the "SaveButton" button
    And I will see the success message "保存成功"

    Examples:
      | name   |
      | 验证组内权限 |

#  Scenario Outline: 验证组内读取+编辑权限
#    Given I will see the "PublicNavBarPage" page
#    And I wait for "Dashboard" will be visible
#    And I logout current user
#    And I wait for title change text to "登录"
#    And open the "LoginPage" page for uri "/auth/login/"
#    When I set the parameter "Username" with value "AutoTest"
#    And I set the parameter "Password" with value "All#123456"
#    And I click the "LoginButton" button
#    And I wait for "2000" millsecond
#    Given open the "agent.ListPage" page for uri "/sources/input/agent/"
#    And I wait for loading invisible
#    Then the data name is "{'column':'1','name':'<name>'}" then i will see "分组停止重启升级修改备注" button
#    When the column is "1" then i click the "修改备注" button in agent page
#    And I set the parameter "Memo" with value "testAuth"
#    And I click the "EnsureButton" button
#    And  I wait for loading invisible
#    Then I will see the search result contains "{'column':'3','name':'testAuth'}"
#
#    Examples:
#      | name   |
#      | 验证组内权限 |

  Scenario: 删除Agent分组
    Given open the "agent.GroupPage" page for uri "/sources/input/agent/group/"
    And I wait for loading invisible
    When the data name is "验证组内权限" then i click the "删除" button
    And I wait for "Ensure" will be visible
    And I click the "Ensure" button

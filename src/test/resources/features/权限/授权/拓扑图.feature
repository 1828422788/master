@auth
Feature: 权限-拓扑图

  Scenario: 验证无新建权限
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "__user_AutoTest__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    Then I click the "{'TabButton':'功能'}" button
    And I wait for "Loading" will be invisible
    When I "checked" the checkbox which name is "全选"
    And I "unchecked" the checkbox which name is "新建拓扑图"
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
    And I wait for title change text to "仪表盘|搜索"
    And open the "topology.ListPage" page for uri "/topology/"
    Then I will see the "Create" doesn't exist

  Scenario Outline: 新建拓扑图
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
    And I set the parameter "Password" with value "all123456"
    And I click the "LoginButton" button
    And I wait for title change text to "仪表盘|搜索"
    And open the "topology.ListPage" page for uri "/topology/"
    And I wait for loading invisible
    And I click the "Create" button
    And I set the parameter "NameInput" with value "<name>"
    And I click the "Ensure" button
    Then I will see the success message "创建成功"

    Examples:
      | name     |
      | AutoTest |

  Scenario Outline: 取消读取权限
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "__user_AutoTest__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    Then I click the "{'TabButton':'拓扑图'}" button
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
    And I set the parameter "Password" with value "all123456"
    And I click the "LoginButton" button
    And I wait for title change text to "仪表盘|搜索"
    And open the "topology.ListPage" page for uri "/topology/"
    Then I will see the search result "{'column':'0','name':'<name>','contains':'no'}"

    Examples:
      | name     |
      | AutoTest |

  Scenario Outline: 授权读取
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "__user_AutoTest__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    Then I click the "{'TabButton':'拓扑图'}" button
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
    And I set the parameter "Password" with value "all123456"
    And I click the "LoginButton" button
    And I wait for title change text to "仪表盘|搜索"
    And open the "topology.ListPage" page for uri "/topology/"
    Then the data name is "<name>" then i will see "授权" button
    When the data name is "<name>" then i click the "授权" button
    And I wait for loading invisible
    Then I will see the checkbox in tiny table before "__user_验证授权用户__" is disabled
    And open the "topology.ListPage" page for uri "/topology/"
    And I click the detail which name is "<name>"
    Then I will see the "topology.DetailPage" page
    And I wait for "2000" millsecond
    And I set the parameter "NodeName" with value "node1"
    And I set the parameter "NodeGroup" with value "测试组"
    And I click the "AddNodeButton" button
    Then I will see the error message "<message>"

    Examples:
      | name     | message                  |
      | AutoTest | 没有相关的资源权限\n错误码: API_1604 |

  Scenario Outline: 授权读取+编辑
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "__user_AutoTest__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    Then I click the "{'TabButton':'拓扑图'}" button
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
    And I set the parameter "Password" with value "all123456"
    And I click the "LoginButton" button
    And I wait for title change text to "仪表盘|搜索"
    And open the "topology.ListPage" page for uri "/topology/"
    Then the data name is "<name>" then i will see "标签重命名授权" button
    When the data name is "<name>" then i click the "标签" button
    And I set the parameter "Tag" with value "AutoTest"
    And I choose the "AutoTest" from the "TagDropdown"
    And I click the "Ensure" button
    Then I will see the success message "修改成功"
    And I wait for loading invisible
    When the data name is "<name>" then i click the "授权" button
    And I wait for loading invisible
    Then I will see the checkbox in tiny table before "__user_验证授权用户__" is disabled
    And open the "topology.ListPage" page for uri "/topology/"
    And I click the detail which name is "<name>"
    Then I will see the "topology.DetailPage" page
    And I wait for "2000" millsecond
    And I set the parameter "NodeName" with value "node1"
    And I set the parameter "NodeGroup" with value "测试组"
    And I click the "AddNodeButton" button
    And I click the "Update" button

    Examples:
      | name     |
      | AutoTest |

  Scenario Outline: 授权读取+编辑+删除
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "__user_AutoTest__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    Then I click the "{'TabButton':'拓扑图'}" button
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
    And I set the parameter "Password" with value "all123456"
    And I click the "LoginButton" button
    And I wait for title change text to "仪表盘|搜索"
    And open the "topology.ListPage" page for uri "/topology/"
    Then the data name is "<name>" then i will see "标签重命名删除授权" button
    When the data name is "<name>" then i click the "标签" button
    And I set the parameter "Tag" with value "AutoTest"
    And I choose the "AutoTest" from the "TagDropdown"
    And I click the "Ensure" button
    Then I will see the success message "修改成功"
    And I wait for loading invisible
    When the data name is "<name>" then i click the "授权" button
    And I wait for loading invisible
    Then I will see the checkbox in tiny table before "__user_验证授权用户__" is disabled
    And open the "topology.ListPage" page for uri "/topology/"
    And I click the detail which name is "<name>"
    Then I will see the "topology.DetailPage" page
    And I wait for "2000" millsecond
    And I click the "SwitchButton" button
    And I set the parameter "NodeName" with value "node2"
    And I set the parameter "NodeGroup" with value "测试组2"
    And I click the "AddNodeButton" button
    And I click the "Update" button
    And open the "topology.ListPage" page for uri "/topology/"
    And I wait for loading invisible
    When the data name is "<name>" then i click the "删除" button
    And I wait for "Ensure" will be visible
    And I click the "Ensure" button
    Then I will see the success message "删除成功"

    Examples:
      | name     |
      | AutoTest |

  Scenario Outline: 授权读取+删除
    Given open the "topology.ListPage" page for uri "/topology/"
    And I wait for loading invisible
    And I click the "Create" button
    And I set the parameter "NameInput" with value "<name>"
    And I click the "Ensure" button
    Then I will see the success message "创建成功"
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "__user_AutoTest__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    Then I click the "{'TabButton':'拓扑图'}" button
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
    And I set the parameter "Password" with value "all123456"
    And I click the "LoginButton" button
    And I wait for title change text to "仪表盘|搜索"
    And open the "topology.ListPage" page for uri "/topology/"
    Then the data name is "<name>" then i will see "删除授权" button
    When the data name is "<name>" then i click the "授权" button
    And I wait for loading invisible
    Then I will see the checkbox in tiny table before "__user_验证授权用户__" is disabled
    And open the "topology.ListPage" page for uri "/topology/"
    And I click the detail which name is "<name>"
    Then I will see the "topology.DetailPage" page
    And I wait for "2000" millsecond
    And I set the parameter "NodeName" with value "node1"
    And I set the parameter "NodeGroup" with value "测试组"
    And I click the "AddNodeButton" button
    Then I will see the error message "<message>"
    And open the "topology.ListPage" page for uri "/topology/"
    And I wait for loading invisible
    When the data name is "<name>" then i click the "删除" button
    And I wait for "Ensure" will be visible
    And I click the "Ensure" button
    Then I will see the success message "删除成功"

    Examples:
      | name     | message                  |
      | AutoTest | 没有相关的资源权限\n错误码: API_1604 |

  Scenario Outline: 授权读取+转授
    Given open the "topology.ListPage" page for uri "/topology/"
    And I wait for loading invisible
    And I click the "Create" button
    And I set the parameter "NameInput" with value "<name>"
    And I click the "Ensure" button
    Then I will see the success message "创建成功"
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "__user_AutoTest__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    Then I click the "{'TabButton':'拓扑图'}" button
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
    Then I click the "{'TabButton':'拓扑图'}" button
    And I wait for "Loading" will be invisible
    And I "checked" the label before "<name>"
    And I "unchecked" the label before "<name>"
    And I click the "SaveButton" button
    Then I will see the success message "保存成功"
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
    And I set the parameter "Password" with value "all123456"
    And I click the "LoginButton" button
    And I wait for title change text to "仪表盘|搜索"
    And open the "topology.ListPage" page for uri "/topology/"
    Then the data name is "<name>" then i will see "授权" button
    When the data name is "<name>" then i click the "授权" button
    And I wait for loading invisible
    And I "check" the checkbox which name is "__user_验证授权用户__" in tiny table
    And I click the "Ensure" button
    Then I will see the message "保存成功"
    And open the "topology.ListPage" page for uri "/topology/"
    Given I will see the "PublicNavBarPage" page
    And I wait for "Dashboard" will be visible
    And I logout current user
    And I wait for title change text to "登录"
    And open the "LoginPage" page for uri "/auth/login/"
    When I set the parameter "Username" with value "验证授权用户"
    And I set the parameter "Password" with value "all123456"
    And I click the "LoginButton" button
    And I wait for title change text to "仪表盘|搜索"
    And open the "topology.ListPage" page for uri "/topology/"
    Then the data name is "<name>" then i will see "授权" button
    And I click the detail which name is "<name>"
    Then I will see the "topology.DetailPage" page
    And I wait for "2000" millsecond
    And I set the parameter "NodeName" with value "node1"
    And I set the parameter "NodeGroup" with value "测试组"
    And I click the "AddNodeButton" button
    Then I will see the error message "<message>"

    Examples:
      | name     | message                  |
      | AutoTest | 没有相关的资源权限\n错误码: API_1604 |

  Scenario Outline: 授权读取+编辑+转授
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "__user_AutoTest__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    Then I click the "{'TabButton':'拓扑图'}" button
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
    Then I click the "{'TabButton':'拓扑图'}" button
    And I wait for "Loading" will be invisible
    And I "checked" the label before "<name>"
    And I "unchecked" the label before "<name>"
    And I click the "SaveButton" button
    Then I will see the success message "保存成功"
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
    And I set the parameter "Password" with value "all123456"
    And I click the "LoginButton" button
    And I wait for title change text to "仪表盘|搜索"
    And open the "topology.ListPage" page for uri "/topology/"
    Then the data name is "<name>" then i will see "标签重命名授权" button
    When the data name is "<name>" then i click the "标签" button
    And I set the parameter "Tag" with value "AutoTest"
    And I choose the "AutoTest" from the "TagDropdown"
    And I click the "Ensure" button
    Then I will see the success message "修改成功"
    And I wait for loading invisible
    When the data name is "<name>" then i click the "授权" button
    And I wait for loading invisible
    And I "check" the checkbox which name is "__user_验证授权用户__" in tiny table
    And I click the "Ensure" button
    Then I will see the message "保存成功"
    And open the "topology.ListPage" page for uri "/topology/"
    Given I will see the "PublicNavBarPage" page
    And I wait for "Dashboard" will be visible
    And I logout current user
    And I wait for title change text to "登录"
    And open the "LoginPage" page for uri "/auth/login/"
    When I set the parameter "Username" with value "验证授权用户"
    And I set the parameter "Password" with value "all123456"
    And I click the "LoginButton" button
    And I wait for title change text to "仪表盘|搜索"
    And open the "topology.ListPage" page for uri "/topology/"
    Then the data name is "<name>" then i will see "标签重命名授权" button
    When the data name is "<name>" then i click the "重命名" button
    And I set the parameter "NameInput" with value "AutoRename"
    And I click the "Ensure" button
    Then I will see the success message "修改成功"
    And I wait for loading invisible
    And I click the detail which name is "AutoRename"
    Then I will see the "topology.DetailPage" page
    And I wait for "2000" millsecond
    And I set the parameter "NodeName" with value "node1"
    And I set the parameter "NodeGroup" with value "测试组"
    And I click the "AddNodeButton" button
    And I click the "Update" button

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
    Then I click the "{'TabButton':'拓扑图'}" button
    And I wait for loading invisible
    And I "checked" the label before "AutoRename"
    When the data name is "AutoRename" then I click the "无期限" button without total page
    And I click the "Customize" button
    And I click the "DateEditor" button
    And I set the time input "TimeInput" to "1" minutes later
    And I click the "EnsureTime" button
    And I click the "SaveButton" button
    And I will see the success message "保存成功"

  Scenario: 新建
    Given open the "topology.ListPage" page for uri "/topology/"
    And I wait for loading invisible
    And I click the "Create" button
    And I set the parameter "NameInput" with value "AutoTest"
    And I click the "Ensure" button
    Then I will see the success message "创建成功"

  Scenario: 验证有效期限
    Given I will see the "PublicNavBarPage" page
    And I wait for "Dashboard" will be visible
    And I wait for loading invisible
    And I logout current user
    And I wait for title change text to "登录"
    And open the "LoginPage" page for uri "/auth/login/"
    When I set the parameter "Username" with value "AutoTest"
    And I set the parameter "Password" with value "all123456"
    And I click the "LoginButton" button
    And I wait for title change text to "仪表盘|搜索"
    And open the "topology.ListPage" page for uri "/topology/"
    Then I will see the search result "{'column':'0','name':'AutoRename','contains':'no'}"

  Scenario Outline: 授权读取+删除+转授
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "__user_AutoTest__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    Then I click the "{'TabButton':'拓扑图'}" button
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
    Then I click the "{'TabButton':'拓扑图'}" button
    And I wait for "Loading" will be invisible
    And I "checked" the label before "<name>"
    And I "unchecked" the label before "<name>"
    And I click the "SaveButton" button
    Then I will see the success message "保存成功"
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
    And I set the parameter "Password" with value "all123456"
    And I click the "LoginButton" button
    And I wait for title change text to "仪表盘|搜索"
    And open the "topology.ListPage" page for uri "/topology/"
    Then the data name is "<name>" then i will see "删除授权" button
    When the data name is "<name>" then i click the "授权" button
    And I wait for loading invisible
    And I "check" the checkbox which name is "__user_验证授权用户__" in tiny table
    And I click the "Ensure" button
    Then I will see the message "保存成功"
    And open the "topology.ListPage" page for uri "/topology/"
    Given I will see the "PublicNavBarPage" page
    And I wait for "Dashboard" will be visible
    And I logout current user
    And I wait for title change text to "登录"
    And open the "LoginPage" page for uri "/auth/login/"
    When I set the parameter "Username" with value "验证授权用户"
    And I set the parameter "Password" with value "all123456"
    And I click the "LoginButton" button
    And I wait for title change text to "仪表盘|搜索"
    And open the "topology.ListPage" page for uri "/topology/"
    Then the data name is "<name>" then i will see "删除授权" button
    And I click the detail which name is "<name>"
    Then I will see the "topology.DetailPage" page
    And I wait for "2000" millsecond
    And I click the "SwitchButton" button
    And I set the parameter "NodeName" with value "node1"
    And I set the parameter "NodeGroup" with value "测试组"
    And I click the "AddNodeButton" button
    Then I will see the error message "<message>"
    And open the "topology.ListPage" page for uri "/topology/"
    And I wait for "2000" millsecond
    When the data name is "<name>" then i click the "删除" button
    And I wait for "Ensure" will be visible
    And I click the "Ensure" button
    Then I will see the success message "删除成功"

    Examples:
      | name       | message                  |
      | AutoRename | 没有相关的资源权限\n错误码: API_1604 |

  Scenario Outline: 授权所有权限
    Given open the "topology.ListPage" page for uri "/topology/"
    And I wait for loading invisible
    And I click the "Create" button
    And I set the parameter "NameInput" with value "<name>"
    And I click the "Ensure" button
    Then I will see the success message "创建成功"
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "__user_AutoTest__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    Then I click the "{'TabButton':'拓扑图'}" button
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
    Then I click the "{'TabButton':'拓扑图'}" button
    And I wait for "Loading" will be invisible
    And I "checked" the label before "<name>"
    And I "unchecked" the label before "<name>"
    And I click the "SaveButton" button
    Then I will see the success message "保存成功"
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
    And I set the parameter "Password" with value "all123456"
    And I click the "LoginButton" button
    And I wait for title change text to "仪表盘|搜索"
    And open the "topology.ListPage" page for uri "/topology/"
    Then the data name is "<name>" then i will see "标签重命名删除授权" button
    When the data name is "<name>" then i click the "标签" button
    And I set the parameter "Tag" with value "AutoTest"
    And I choose the "AutoTest" from the "TagDropdown"
    And I click the "Ensure" button
    Then I will see the success message "修改成功"
    And I wait for loading invisible
    When the data name is "<name>" then i click the "授权" button
    And I wait for loading invisible
    And I "check" the checkbox which name is "__user_验证授权用户__" in tiny table
    And I click the "Ensure" button
    Then I will see the message "保存成功"
    And open the "topology.ListPage" page for uri "/topology/"
    Given I will see the "PublicNavBarPage" page
    And I wait for "Dashboard" will be visible
    And I logout current user
    And I wait for title change text to "登录"
    And open the "LoginPage" page for uri "/auth/login/"
    When I set the parameter "Username" with value "验证授权用户"
    And I set the parameter "Password" with value "all123456"
    And I click the "LoginButton" button
    And I wait for title change text to "仪表盘|搜索"
    And open the "topology.ListPage" page for uri "/topology/"
    Then the data name is "<name>" then i will see "标签重命名删除授权" button
    When the data name is "<name>" then i click the "重命名" button
    And I set the parameter "NameInput" with value "AutoRename"
    And I click the "Ensure" button
    Then I will see the success message "修改成功"
    And I wait for loading invisible
    And I click the detail which name is "AutoRename"
    Then I will see the "topology.DetailPage" page
    And I wait for "2000" millsecond
    And I set the parameter "NodeName" with value "node1"
    And I set the parameter "NodeGroup" with value "测试组"
    And I click the "AddNodeButton" button
    And I click the "Update" button
    And open the "topology.ListPage" page for uri "/topology/"
    And I wait for "2000" millsecond
    When the data name is "AutoRename" then i click the "删除" button
    And I wait for "Ensure" will be visible
    And I click the "Ensure" button
    Then I will see the success message "删除成功"

    Examples:
      | name     |
      | AutoTest |
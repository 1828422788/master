#@auth
Feature: 权限-仪表盘

  @logout
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
    And I wait for "SuccessMessage" will be visible
    And I login user "AutoTest" with password "All#123456"
    And open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for "2000" millsecond
    Then I will see the "Create" doesn't exist
    And I logout current user

  @logout
  Scenario: 授权新建仪表盘
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "__user_AutoTest__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    And I wait for "Loading" will be invisible
    Then I click the "{'TabButton':'功能'}" button
    And I wait for "Loading" will be invisible
    When I "checked" the checkbox which name is "全选"
    And I "unchecked" the checkbox which name is "全选"
    When I "checked" the checkbox which name is "可使用搜索权限,可使用仪表盘,新建仪表盘,可使用搜索页"
    And I click the "SaveButton" button
    And I wait for "SuccessMessage" will be visible
    And I login user "AutoTest" with password "All#123456"
    And open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the "Create" button under some element
    And I set the parameter "DashBoardName" with value "仪表盘验证权限1"
    And I click the "Ensure" button
    And I wait for "SuccessMessage" will be visible
    Then I will see the success message "新建仪表盘成功"
    And I logout current user

  @logout
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
    And I wait for "SuccessMessage" will be visible
    Then I click the "Dashboard" button
    And I wait for "Loading" will be invisible
    And I "checked" the checkbox which name is "仪表盘验证权限1" in auth table
    And I "unchecked" the checkbox which name is "仪表盘验证权限1" in auth table
    And I click the "SaveButton" button
    And I login user "AutoTest" with password "All#123456"
    And open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    Then I will see the search result "{'column':'0','name':'仪表盘验证权限1','contains':'no'}"
    And I logout current user

  @logout
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
    And I wait for "SuccessMessage" will be visible
    Then I click the "{'TabButton':'功能'}" button
    And I wait for "Loading" will be invisible
    When I "checked" the checkbox which name is "全选"
    And I "unchecked" the checkbox which name is "全选"
    When I "checked" the checkbox which name is "可使用搜索权限,可使用仪表盘,新建仪表盘,可使用搜索页"
    And I click the "SaveButton" button
    And I login user "AutoTest" with password "All#123456"
    And open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    Then the data name is "<name>" then i will see "设为默认授权" button
    When the data name is "<name>" then i click the "授权" button
    And I wait for loading invisible
    Then I will see the checkbox in tiny table before "验证授权用户" is disabled
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "<name>"
    Then I will see the "dashboard.DetailPage" page
    Then I will see the "AddTag" doesn't exist
    And I logout current user

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
    And I wait for "SuccessMessage" will be visible
    Then I click the "{'TabButton':'功能'}" button
    And I wait for "Loading" will be invisible
    When I "checked" the checkbox which name is "全选"
    And I "unchecked" the checkbox which name is "全选"
    When I "checked" the checkbox which name is "可使用搜索权限,可使用仪表盘,新建仪表盘,可使用搜索页"
    And I click the "SaveButton" button

    Examples:
      | name     |
      | 仪表盘验证权限1 |

  @logout
  Scenario Outline: 验证读取+编辑
    Given I login user "AutoTest" with password "All#123456"
    And open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    Then the data name is "{'column':'0','name':'<name>'}" then i will see "设为默认重命名标签授权" button
    When the data name is "<name>" then i click the "标签" button
    And I set the parameter "Tag" with value "AutoTestTag"
    And I choose the "AutoTestTag" from the "TagDropdown"
    And I click the "Ensure" button
    And I wait for "SuccessMessage" will be visible
    Then I will see the success message "更新仪表盘成功"
    And I wait for "SuccessMessage" will be invisible
    When the data name is "<name>" then i click the "重命名" button
    And I set the parameter "DashBoardName" with value "<name>重命名"
    And I click the "Ensure" button
    And I wait for "SuccessMessage" will be visible
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
    And I logout current user

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
    And I wait for "TimeInput" will be visible
    And I set the time input "TimeInput" to "1" minutes later
    And I click the "EnsureTime" button
    And I click the "SaveButton" button
    And I wait for "SuccessMessage" will be visible
    And I will see the success message "更新成功"
    Then I click the "{'TabButton':'功能'}" button
    And I wait for "Loading" will be invisible
    When I "checked" the checkbox which name is "全选"
    And I "unchecked" the checkbox which name is "全选"
    When I "checked" the checkbox which name is "可使用搜索权限,可使用仪表盘,新建仪表盘,可使用搜索页"
    And I click the "SaveButton" button

  Scenario Outline: 新建权限仪表盘
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I click the "Create" button
    And I set the parameter "DashBoardName" with value "<name>"
    And I click the "Ensure" button
    And I wait for "SuccessMessage" will be visible
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
    And I "unchecked" the checkbox which name is "全选"
    When I "checked" the checkbox which name is "可使用搜索权限,可使用仪表盘,新建仪表盘,可使用搜索页"
    And I click the "SaveButton" button

  @logout
  Scenario: 验证有效期限生效
    And I logout current user
    Given I login user "AutoTest" with password "All#123456"
    And open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I will see the search result "{'column':'0','name':'仪表盘验证权限1重命名','contains':'no'}"
    And I logout current user

  @logout
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
    And I wait for "SuccessMessage" will be visible
    Then I click the "{'TabButton':'功能'}" button
    And I wait for "Loading" will be invisible
    When I "checked" the checkbox which name is "全选"
    And I "unchecked" the checkbox which name is "全选"
    When I "checked" the checkbox which name is "可使用搜索权限,可使用仪表盘,新建仪表盘,可使用搜索页"
    And I click the "SaveButton" button
    Given I login user "AutoTest" with password "All#123456"
    And open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
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
    And I wait for "SuccessMessage" will be visible
    Then I will see the success message "删除仪表盘成功"
    And I logout current user

    Examples:
      | name        |
      | 仪表盘验证权限1重命名 |

  @logout
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
    And I wait for "SuccessMessage" will be visible
    Then I click the "{'TabButton':'功能'}" button
    And I wait for "Loading" will be invisible
    When I "checked" the checkbox which name is "全选"
    And I "unchecked" the checkbox which name is "全选"
    When I "checked" the checkbox which name is "可使用搜索权限,可使用仪表盘,新建仪表盘,可使用搜索页"
    And I click the "SaveButton" button
    Given I login user "AutoTest" with password "All#123456"
    And open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    Then the data name is "{'column':'0','name':'<name>'}" then i will see "设为默认重命名标签授权删除" button
    And the data name is "<name>" then i click the "授权" button
    And I wait for loading invisible
    Then I will see the checkbox in tiny table before "验证授权用户" is disabled
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    When the data name is "<name>" then i click the "标签" button
    And I set the parameter "Tag" with value "AutoTestTag"
    And I choose the "AutoTestTag" from the "TagDropdown"
    And I click the "Ensure" button
    And I wait for "SuccessMessage" will be visible
    Then I will see the success message "更新仪表盘成功"
    And I wait for "SuccessMessage" will be invisible
    When the data name is "<name>" then i click the "重命名" button
    And I set the parameter "DashBoardName" with value "<name>重命名"
    And I click the "Ensure" button
    And I wait for "SuccessMessage" will be visible
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
    And I wait for "SuccessMessage" will be visible
    Then I will see the success message "删除仪表盘成功"
    And I logout current user

    Examples:
      | name               |
      | AutoTestUserCreate |

  @logout
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
    And I wait for "SuccessMessage" will be visible
    Then I click the "{'TabButton':'功能'}" button
    And I wait for "Loading" will be invisible
    When I "checked" the checkbox which name is "全选"
    And I "unchecked" the checkbox which name is "全选"
    When I "checked" the checkbox which name is "可使用搜索权限,可使用仪表盘,新建仪表盘,可使用搜索页"
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
    And I wait for "SuccessMessage" will be visible
    Then I click the "{'TabButton':'功能'}" button
    And I wait for "Loading" will be invisible
    When I "checked" the checkbox which name is "全选"
    And I "unchecked" the checkbox which name is "全选"
    When I "checked" the checkbox which name is "可使用搜索权限,可使用仪表盘,新建仪表盘,可使用搜索页"
    And I click the "SaveButton" button
    Given I login user "AutoTest" with password "All#123456"
    And open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    Then the data name is "<name>" then i will see "设为默认授权" button
    When the data name is "<name>" then i click the "授权" button
    And I wait for loading invisible
    And I "check" the checkbox which name is "验证授权用户" in tiny table
    And I click the "Ensure" button
    Then I will see the message "保存成功"
    Given I login user "验证授权用户" with password "All#123456"
    And open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    Then the data name is "<name>" then i will see "设为默认授权" button
    And I wait for loading invisible
    And I click the detail which name is "<name>"
    Then I will see the "dashboard.DetailPage" page
    Then I will see the "AddTag" doesn't exist
    And I logout current user

    Examples:
      | name    |
      | 仪表盘验证权限 |


  @logout
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
    And I wait for "SuccessMessage" will be visible
    Then I click the "{'TabButton':'功能'}" button
    And I wait for "Loading" will be invisible
    When I "checked" the checkbox which name is "全选"
    And I "unchecked" the checkbox which name is "全选"
    When I "checked" the checkbox which name is "可使用搜索权限,可使用仪表盘,新建仪表盘,可使用搜索页"
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
    And I wait for "SuccessMessage" will be visible
    And I will see the success message "更新成功"
    Then I click the "{'TabButton':'功能'}" button
    And I wait for "Loading" will be invisible
    When I "checked" the checkbox which name is "全选"
    And I "unchecked" the checkbox which name is "全选"
    When I "checked" the checkbox which name is "可使用搜索权限,可使用仪表盘,新建仪表盘,可使用搜索页"
    And I click the "SaveButton" button
    Given I login user "AutoTest" with password "All#123456"
    And open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    Then the data name is "{'column':'0','name':'<name>'}" then i will see "设为默认重命名标签授权" button
    When the data name is "<name>" then i click the "标签" button
    And I set the parameter "Tag" with value "AutoTestTag"
    And I choose the "AutoTestTag" from the "TagDropdown"
    And I click the "Ensure" button
    And I wait for "SuccessMessage" will be visible
    Then I will see the success message "更新仪表盘成功"
    And I wait for "SuccessMessage" will be invisible
    When the data name is "<name>" then i click the "重命名" button
    And I set the parameter "DashBoardName" with value "<name>重命名"
    And I click the "Ensure" button
    And I wait for "SuccessMessage" will be visible
    Then I will see the success message "重命名仪表盘成功"
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    When the data name is "<name>重命名" then i click the "授权" button
    And I wait for loading invisible
    And I "check" the checkbox which name is "验证授权用户" in tiny table
    And I click the "Ensure" button
    And I wait for "Message" will be visible
    Then I will see the message "保存成功"
    Given I login user "AutoTest" with password "All#123456"
    And open the "dashboard.ListPage" page for uri "/dashboard/"
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
    And I logout current user

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
    And I wait for "SuccessMessage" will be visible
    Then I click the "{'TabButton':'功能'}" button
    And I wait for "Loading" will be invisible
    When I "checked" the checkbox which name is "全选"
    And I "unchecked" the checkbox which name is "全选"
    When I "checked" the checkbox which name is "可使用搜索权限,可使用仪表盘,新建仪表盘,可使用搜索页"
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
    And I wait for "SuccessMessage" will be visible
    And I will see the success message "更新成功"
    Then I click the "{'TabButton':'功能'}" button
    And I wait for "Loading" will be invisible
    When I "checked" the checkbox which name is "全选"
    And I "unchecked" the checkbox which name is "全选"
    When I "checked" the checkbox which name is "可使用搜索权限,可使用仪表盘,新建仪表盘,可使用搜索页"
    And I click the "SaveButton" button
    Given I login user "AutoTest" with password "All#123456"
    And open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    Then the data name is "<name>" then i will see "设为默认授权删除" button
    When the data name is "<name>" then i click the "授权" button
    And I wait for loading invisible
    And I "check" the checkbox which name is "验证授权用户" in tiny table
    And I click the "Ensure" button
    And I wait for "Message" will be visible
    Then I will see the message "保存成功"
    And I logout current user
    Given I login user "验证授权用户" with password "All#123456"
    And open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
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
    And I wait for "SuccessMessage" will be visible
    Then I will see the success message "删除仪表盘成功"

    Examples:
      | name       |
      | 仪表盘验证权限重命名 |

  @logout
  Scenario Outline: 新建仪表盘
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the "Create" button
    And I set the parameter "DashBoardName" with value "<name>"
    And I click the "Ensure" button
    Then I will see the success message "新建仪表盘成功"
    And I logout current user

    Examples:
      | name     |
      | AutoAuth |

  @logout
  Scenario Outline: 授权所有权限
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "__user_AutoTest__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    And I wait for "Loading" will be invisible
    Then I click the "Dashboard" button
    And I wait for "Loading" will be invisible
    And I "checked" the checkbox which name is "<name>" in auth table
    And I click the "SaveButton" button
    And I wait for "SuccessMessage" will be visible
    Then I click the "{'TabButton':'功能'}" button
    And I wait for "Loading" will be invisible
    When I "checked" the checkbox which name is "全选"
    And I "unchecked" the checkbox which name is "全选"
    When I "checked" the checkbox which name is "可使用搜索权限,可使用仪表盘,新建仪表盘,可使用搜索页"
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
    And I wait for "SuccessMessage" will be visible
    Then I click the "{'TabButton':'功能'}" button
    And I wait for "Loading" will be invisible
    When I "checked" the checkbox which name is "全选"
    And I "unchecked" the checkbox which name is "全选"
    When I "checked" the checkbox which name is "可使用搜索权限,可使用仪表盘,新建仪表盘,可使用搜索页"
    And I click the "SaveButton" button
    Given I login user "AutoTest" with password "All#123456"
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    Then the data name is "{'column':'0','name':'<name>'}" then i will see "设为默认重命名标签授权删除" button
    When the data name is "<name>" then i click the "标签" button
    And I set the parameter "Tag" with value "AutoTestTag"
    And I choose the "AutoTestTag" from the "TagDropdown"
    And I click the "Ensure" button
    And I wait for "SuccessMessage" will be visible
    Then I will see the success message "更新仪表盘成功"
    And I wait for "SuccessMessage" will be invisible
    When the data name is "<name>" then i click the "重命名" button
    And I set the parameter "DashBoardName" with value "<name>重命名"
    And I click the "Ensure" button
    And I wait for "SuccessMessage" will be visible
    Then I will see the success message "重命名仪表盘成功"
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    When the data name is "<name>重命名" then i click the "授权" button
    And I wait for loading invisible
    And I "check" the checkbox which name is "验证授权用户" in tiny table
    And I click the "Ensure" button
    And I wait for "Message" will be visible
    Then I will see the message "保存成功"
    Given I login user "验证授权用户" with password "All#123456"
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
    And I wait for "SuccessMessage" will be visible
    Then I will see the success message "删除仪表盘成功"
    And I logout current user

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
    And I wait for loading invisible
    And I "check" the checkbox which name is "AutoTest" in tiny table
    And I click the "Ensure" button
    And I wait for "Message" will be visible
    Then I will see the message "保存成功"
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "__user_验证授权用户__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    And I wait for "Loading" will be invisible
    Then I click the "{'TabButton':'功能'}" button
    And I wait for "Loading" will be invisible
    And I "checked" the checkbox which name is "全选"
    And I click the "SaveButton" button


  @logout
  Scenario Outline: 二次授权读取
    Given I login user "AutoTest" with password "All#123456"
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    When the data name is "测试二次授权" then i click the "授权" button
    And I choose the "<authRole>" from the "AuthDropdown"
    When I "check" the function "<function>" which name is "<authName>" in tiny table
    And I click the "Ensure" button
    And I wait for "Message" will be visible
    Then I will see the message "保存成功"
    Given I login user "验证授权用户" with password "All#123456"
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    Then the data name is "<name>" then i will see "设为默认授权" button
    When the data name is "<name>" then i click the "授权" button
    And I wait for loading invisible
    Then I will see the checkbox in tiny table before "AutoTest" is disabled
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "<name>"
    Then I will see the "dashboard.DetailPage" page
    Then I will see the "AddTag" doesn't exist
    And I logout current user

    Examples:
      | authRole | authName | function | name   |
      | 用户       | 验证授权用户   | 读取       | 测试二次授权 |

  @logout
  Scenario Outline: 二次授权读取+编辑
    Given I login user "AutoTest" with password "All#123456"
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    When the data name is "测试二次授权" then i click the "授权" button
    And I choose the "<authRole>" from the "AuthDropdown"
    And I wait for loading invisible
    When I "check" the function "<function>" which name is "<authName>" in tiny table
    And I click the "Ensure" button
    And I wait for "Message" will be visible
    Then I will see the message "保存成功"
    Given I login user "验证授权用户" with password "All#123456"
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    Then the data name is "{'column':'0','name':'<name>'}" then i will see "设为默认重命名标签授权" button
    When the data name is "<name>" then i click the "标签" button
    And I set the parameter "Tag" with value "AutoTestTag"
    And I choose the "AutoTestTag" from the "TagDropdown"
    And I click the "Ensure" button
    And I wait for "SuccessMessage" will be visible
    Then I will see the success message "更新仪表盘成功"
    And I wait for "SuccessMessage" will be invisible
    When the data name is "<name>" then i click the "重命名" button
    And I set the parameter "DashBoardName" with value "<name>重命名"
    And I click the "Ensure" button
    And I wait for "SuccessMessage" will be visible
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
    And I logout current user

    Examples:
      | authRole | authName        | function | name   |
      | 角色       | __user_验证授权用户__ | 编辑       | 测试二次授权 |

  @logout
  Scenario Outline: 二次授权读取+编辑+删除
    Given I login user "AutoTest" with password "All#123456"
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    When the data name is "<name>" then i click the "授权" button
    And I choose the "<authRole>" from the "AuthDropdown"
    And I wait for loading invisible
    When I "check" the function "<function>" which name is "<authName>" in tiny table
    And I click the "Ensure" button
    And I wait for "Message" will be visible
    Then I will see the message "保存成功"
    Given I login user "验证授权用户" with password "All#123456"
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    Then the data name is "{'column':'0','name':'<name>'}" then i will see "设为默认重命名标签授权删除" button
    And the data name is "<name>" then i click the "授权" button
    And I wait for loading invisible
    Then I will see the checkbox in tiny table before "AutoTest" is disabled
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    When the data name is "<name>" then i click the "标签" button
    And I wait for "Tag" will be visible
    And I set the parameter "Tag" with value "AutoTestTag"
    And I choose the "AutoTestTag" from the "TagDropdown"
    And I click the "Ensure" button
    And I wait for "SuccessMessage" will be visible
    Then I will see the success message "更新仪表盘成功"
    And I wait for "SuccessMessage" will be invisible
    When the data name is "<name>" then i click the "重命名" button
    And I set the parameter "DashBoardName" with value "<name>重命名"
    And I click the "Ensure" button
    And I wait for "SuccessMessage" will be visible
    Then I will see the success message "重命名仪表盘成功"
    And I click the detail which name is "<name>重命名"
    Then I will see the "dashboard.DetailPage" page
    And I wait for "AddEventButton" will be visible
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    Then I will see the data "{'column':'0','name':'<name>重命名'}" values "{'column':'2','name':'test'}"
    And the data name is "<name>重命名" then i click the "删除" button
    And I wait for "Ensure" will be visible
    And I click the "Ensure" button
    And I wait for "SuccessMessage" will be visible
    Then I will see the success message "删除仪表盘成功"
    And I logout current user

    Examples:
      | authRole | authName | function | name      |
      | 用户分组     | 验证授权用户分组 | 读取,编辑,删除 | 测试二次授权重命名 |
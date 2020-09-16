@authtest
Feature: 权限-用户分组

  Scenario: 授权无新建用户分组的权限
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "__user_AutoTest__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    When I "checked" the checkbox which name is "全选"
    When I "unchecked" the checkbox which name is "全选"
    And I click the "UserAndValidate" button
    When I "checked" the checkbox which name is "可查看用户分组"
    And I click the "SaveButton" button
    Then I will see the success message "更新成功"

  Scenario: 验证无新建用户分组的权限
    Given I login user "AutoTest" with password "All#123456"
    And I wait for "2000" millsecond
    Given open the "userGroups.ListPage" page for uri "/account/usergroups/"
    Then I will see the "Create" doesn't exist

  Scenario: 授权新建用户分组
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "__user_AutoTest__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    And I click the "UserAndValidate" button
    When I "checked" the checkbox which name is "新建用户分组"
    And I click the "SaveButton" button
    Then I will see the success message "更新成功"

  Scenario: 验证新建用户分组
    Given I login user "AutoTest" with password "All#123456"
    And I wait for "2000" millsecond
    Given open the "userGroups.ListPage" page for uri "/account/usergroups/"
    And I click the "Create" button
    Then I will see the "userGroups.CreatePage" page
    When I set the parameter "UserGroupName" with value "用户分组权限验证"
    And I click the "CreateButton" button
    Then I will see the success message "创建成功"

  Scenario Outline: 授权读取
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "__user_AutoTest__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    And I click the "UserGroup" button
    And I "checked" the checkbox which name is "<name>" in auth table
    And I "unchecked" the checkbox which name is "<name>" in auth table
    When I "checked" function "读取" from the auth table which name is "<name>"
    And I click the "SaveButton" button
    Then I will see the success message "更新成功"

    Examples:
      | name     |
      | 用户分组权限验证 |

  Scenario Outline: 验证读取
    Given I login user "AutoTest" with password "All#123456"
    And I wait for "2000" millsecond
    Given open the "userGroups.ListPage" page for uri "/account/usergroups/"
    And I wait for "Loading" will be invisible
    Then the data name is "{'column':'1','name':'<name>'}" then i will see "申请加入" button
    When I click the detail which name is "{'column':'1','name':'<name>'}"
    Then I will see the "userGroups.CreatePage" page
    Then I will see the element "UserGroupName" attribute is "disabled"

    Examples:
      | name     |
      | 用户分组权限验证 |

  Scenario Outline: 授权读取+编辑
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "__user_AutoTest__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    And I click the "UserGroup" button
    And I "checked" the checkbox which name is "<name>" in auth table
    When I "unchecked" function "删除,转授" from the auth table which name is "<name>"
    And I click the "SaveButton" button
    Then I will see the success message "更新成功"

    Examples:
      | name     |
      | 用户分组权限验证 |

  Scenario Outline: 验证读取+编辑
    Given I login user "AutoTest" with password "All#123456"
    And I wait for "2000" millsecond
    Given open the "userGroups.ListPage" page for uri "/account/usergroups/"
    And I wait for "Loading" will be invisible
    Then the data name is "{'column':'1','name':'<name>'}" then i will see "编辑授权申请加入" button
    When the data name is "{'column':'1','name':'<name>'}" then i click the "授权" button
    And I wait for loading invisible
    Then I will see the checkbox in tiny table before "验证授权用户" is disabled
    Given open the "userGroups.ListPage" page for uri "/account/usergroups/"
    And I wait for "Loading" will be invisible
    When the data name is "{'column':'1','name':'<name>'}" then i click the "编辑" button
    And I will see the "userGroups.EditPage" page
    And I wait for "UserGroupName" will be visible
    And I set the parameter "UserGroupName" with value "AutoTest用户修改"
    And I click the "SaveButton" button
    Then I will see the success message "更新成功"

    Examples:
      | name     |
      | 用户分组权限验证 |

  Scenario: 有效期限
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "__user_AutoTest__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    And I click the "UserGroup" button
    And I "checked" the checkbox which name is "AutoTest用户修改" in auth table
    When the data name is "AutoTest用户修改" then I click the "无限期" button in auth table
    And I click the "Customize" button
    And I click the "DateEditor" button
    And I set the time input "TimeInput" to "1" minutes later
    And I click the "EnsureTime" button
    And I click the "SaveButton" button
    And I will see the success message "更新成功"

  Scenario: 新建用户分组
    Given open the "userGroups.ListPage" page for uri "/account/usergroups/"
    And I click the "Create" button
    Then I will see the "userGroups.CreatePage" page
    When I set the parameter "UserGroupName" with value "AutoTest用户测试"
    And I click the "CreateButton" button
    Then I will see the success message "创建成功"

  Scenario: 验证有效期限
    Given I login user "AutoTest" with password "All#123456"
    And I wait for "2000" millsecond
    Given open the "userGroups.ListPage" page for uri "/account/usergroups/"
    And I wait for "Loading" will be invisible
    When I click the detail which name is "{'column':'1','name':'AutoTest用户修改'}"
    And I will see the "userGroups.EditPage" page
    Then I will see the element "SaveButton" attribute is "disabled"

  Scenario Outline: 授权读取+编辑+删除
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "__user_AutoTest__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    And I click the "UserGroup" button
    And I "checked" the checkbox which name is "<name>" in auth table
    When I "unchecked" function "转授" from the auth table which name is "<name>"
    And I click the "SaveButton" button
    Then I will see the success message "更新成功"

    Examples:
      | name         |
      | AutoTest用户修改 |

  Scenario Outline: 验证读取+编辑+删除
    Given I login user "AutoTest" with password "All#123456"
    And I wait for "2000" millsecond
    Given open the "userGroups.ListPage" page for uri "/account/usergroups/"
    And I wait for "Loading" will be invisible
    Then the data name is "{'column':'1','name':'<name>'}" then i will see "编辑删除授权申请加入" button
    When the data name is "{'column':'1','name':'<name>'}" then i click the "编辑" button
    And I will see the "userGroups.EditPage" page
    And I set the parameter "UserGroupName" with value "AutoTest测试"
    And I click the "SaveButton" button
    Then I will see the success message "更新成功"
    Given open the "userGroups.ListPage" page for uri "/account/usergroups/"
    And I wait for "Loading" will be invisible
    When the data name is "{'column':'1','name':'AutoTest测试'}" then i click the "删除" button
    And I click the "MessageBoxOKButton" button
    Then I will see the success message "删除成功"

    Examples:
      | name         |
      | AutoTest用户修改 |

  Scenario Outline: 授权读取+删除
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "__user_AutoTest__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    And I click the "UserGroup" button
    And I "checked" the checkbox which name is "<name>" in auth table
    When I "unchecked" function "编辑,转授" from the auth table which name is "<name>"
    And I click the "SaveButton" button
    Then I will see the success message "更新成功"

    Examples:
      | name         |
      | AutoTest用户测试 |

  Scenario Outline: 验证读取+删除
    Given I login user "AutoTest" with password "All#123456"
    And I wait for "2000" millsecond
    Given open the "userGroups.ListPage" page for uri "/account/usergroups/"
    And I wait for "Loading" will be invisible
    Then the data name is "{'column':'1','name':'<name>'}" then i will see "删除授权申请加入" button
    When I click the detail which name is "{'column':'1','name':'<name>'}"
    Then I will see the "userGroups.CreatePage" page
    Then I will see the element "UserGroupName" attribute is "disabled"
    Given open the "userGroups.ListPage" page for uri "/account/usergroups/"
    And I wait for "Loading" will be invisible
    When the data name is "{'column':'1','name':'<name>'}" then i click the "删除" button
    And I click the "MessageBoxOKButton" button
    Then I will see the success message "删除成功"

    Examples:
      | name         |
      | AutoTest用户测试 |


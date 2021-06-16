#@authtest
Feature: 权限-用户

  Scenario: 授权无新建权限
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And I wait for loading invisible
    And the data name is "__user_AutoTest__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    And I wait for loading invisible
    And I click the "Resource" button
    And I wait for "2000" millsecond
    And I "checked" the checkbox which name is "可查看仪表盘"
    And I wait for "2000" millsecond
    And I click the "UserAndValidate" button
    And I wait for "1000" millsecond
   # And I "checked" the checkbox which name is "全选"
   # And I "unchecked" the checkbox which name is "全选"
    And I "checked" the checkbox which name is "可查看用户页"
    And I click the "SaveButton" button
    Then I logout current user

  Scenario: 验证无新建权限
    Given I login user "AutoTest" with password "All#123456"
    Given open the "users.ListPage" page for uri "/account/users/"
    And I wait for loading invisible
    Then I will see the "Create" doesn't exist
    Then I logout current user

  Scenario: 授权新建用户权限
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And I wait for loading invisible
    And the data name is "__user_AutoTest__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    And I wait for loading invisible
    And I click the "UserAndValidate" button
    And I wait for "1000" millsecond
    And I click the "CreateUser" button
    And I click the "SaveButton" button
    Then I logout current user

  Scenario: 验证新建用户权限
    Given I login user "AutoTest" with password "All#123456"
    Given open the "users.ListPage" page for uri "/account/users/"
    And I wait for loading invisible
    And I click the "Create" button
    And I will see the "users.CreatePage" page
    When I set the parameter "UserName" with value "AutoTestAuth"
    And I set the parameter "Email" with value "AutoTestAuth@152.cn"
    And I set the parameter "Password" with value "All#123456"
    And I click the "CreateButton" button
    And I wait for "SuccessMessage" will be visible
    Then I will see the success message "创建成功"
    Then I logout current user

 # Scenario: 有效期限
 #   Given open the "roles.ListPage" page for uri "/account/roles/"
 #   And I wait for loading invisible
 #   And the data name is "__user_AutoTest__" then i click the "授权" button
 #   And I will see the "roles.AuthorizationPage" page
 #   And I wait for loading invisible
 #   And I click the "User" button
 #   And I wait for loading invisible
 #   And I "checked" the checkbox which name is "AutoTestAuth" in auth table
 #   When the data name is "AutoTestAuth" then I click the "无限期" button in auth table
 #   And I click the "Customize" button
 #   And I click the "DateEditor" button
 #   And I set the time input "TimeInput" to "1" minutes later
 #   And I click the "EnsureTime" button
 #   And I click the "SaveButton" button
 #   Then I logout current user

  Scenario: 验证无可修改自己账户信息权限
    Given I login user "AutoTest" with password "All#123456"
    Given open the "users.ListPage" page for uri "/account/users/"
    And I wait for loading invisible
    And I click the detail which name is "{'column':'1','name':'AutoTest'}"
    Then I will see the "users.EditPage" page
    And I wait for "2000" millsecond
    Then I will see the "EditInfoButton" doesn't exist
    Then I logout current user

 # Scenario: 验证有效期限生效
 #   Given I login user "AutoTest" with password "All#123456"
 #   Given open the "users.ListPage" page for uri "/account/users/"
 #   And I click the detail which name is "{'column':'1','name':'AutoTest'}"
 #   Then I will see the "RoleText" doesn't exist
 #   Then I logout current user

  Scenario: 授权可修改自己账户信息
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And I wait for loading invisible
    And the data name is "__user_AutoTest__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    And I wait for loading invisible
    And I click the "UserAndValidate" button
    And I wait for "1000" millsecond
    And I "checked" the checkbox which name is "可修改自己账户信息"
    And I click the "SaveButton" button
    Then I logout current user

  Scenario: 验证可修改自己账户信息
    Given I login user "AutoTest" with password "All#123456"
    Given open the "users.ListPage" page for uri "/account/users/"
    And I wait for loading invisible
    And I click the detail which name is "{'column':'1','name':'AutoTest'}"
    Then I will see the "users.EditPage" page
    And I wait for loading invisible
    And I click the "EditInfoButton" button
    And I set the parameter "FullName" with value "test"
    And I let element "FullName" lose focus
    And I wait for "SuccessMessage" will be visible
    Then I will see the success message "更新成功"
    Then I logout current user

  Scenario: 授权无读取权限
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And I wait for loading invisible
    And the data name is "__user_AutoTest__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    And I wait for loading invisible
    Then I click the "User" button
    And I wait for loading invisible

    And I "checked" the checkbox which name is "AutoTestAuth" in auth table
    And I "unchecked" the checkbox which name is "AutoTestAuth" in auth table
    And I click the "SaveButton" button
    Then I logout current user

  Scenario: 验证无读取权限
    Given I login user "AutoTest" with password "All#123456"
    Given open the "users.ListPage" page for uri "/account/users/"
    And I wait for loading invisible
    And I click the detail which name is "{'column':'1','name':'AutoTestAuth'}"
    And I wait for loading invisible
    Then I will see the "Role" doesn't exist
    Then I logout current user

  Scenario Outline: 授权有读取权限
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And I wait for loading invisible
    And the data name is "__user_AutoTest__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    And I wait for loading invisible
    Then I click the "User" button
    And I wait for loading invisible
    And I "checked" the checkbox which name is "<name>" in auth table
    And I "unchecked" the checkbox which name is "<name>" in auth table
    When I "checked" function "读取" from the auth table which name is "<name>"
    And I click the "SaveButton" button
    Then I logout current user

    Examples:
      | name         |
      | AutoTestAuth |

  Scenario Outline: 验证有读取权限
    Given I login user "AutoTest" with password "All#123456"
    Given open the "users.ListPage" page for uri "/account/users/"
    And I wait for loading invisible
    Then the data name is "{'column':'1','name':'<name>'}" then i will see "查看" button
    And I click the detail which name is "{'column':'1','name':'<name>'}"
    And I wait for "RoleAuth" will be visible
    Then I will see the "users.EditPage" page
    Then I will see the "EditInfoButton" doesn't exist
    Then I logout current user

    Examples:
      | name         |
      | AutoTestAuth |

  Scenario Outline: 授权读取+编辑
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And I wait for loading invisible
    And the data name is "__user_AutoTest__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    And I wait for loading invisible
    Then I click the "User" button
    And I wait for loading invisible
    And I "checked" the checkbox which name is "<name>" in auth table
    When I "unchecked" function "转授" from the auth table which name is "<name>"
    And I click the "SaveButton" button
    Then I logout current user

    Examples:
      | name         |
      | AutoTestAuth |

  Scenario Outline: 验证读取+编辑
    Given I login user "AutoTest" with password "All#123456"
    Given open the "users.ListPage" page for uri "/account/users/"
    And I wait for loading invisible
    Then the data name is "{'column':'1','name':'<name>'}" then i will see "<function>" button
    And I click the detail which name is "{'column':'1','name':'<name>'}"
    And I wait for "RoleAuth" will be visible
    Then I will see the "users.EditPage" page
    And I click the "EditInfoButton" button
    And I set the parameter "FullName" with value "test"
    And I let element "FullName" lose focus
    And I wait for "SuccessMessage" will be visible
    Then I will see the success message "更新成功"
    Then I logout current user

    Examples:
      | name         |function|
      | AutoTestAuth |查看\n更多    |

  Scenario Outline: 删除用户
    Given open the "users.ListPage" page for uri "/account/users/"
    And I wait for loading invisible
    When the data name is "{'column':'1','name':'<name>'}" then i click the "更多" button
    And I click the "Delete" button
    And I wait for "EnsureButton" will be visible
    And I click the "EnsureButton" button

    Examples:
      | name         |
      | AutoTestAuth |



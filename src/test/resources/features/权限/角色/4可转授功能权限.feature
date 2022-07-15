#@role @roleSmoke
Feature: 角色可转授功能权限

  Scenario Outline: 添加用户
    Given open the "users.ListPage" page for uri "/account/users/"
    And I click the "CreateUser" button
    And I will see the "users.CreatePage" page
    And I wait for "UserName" will be visible
    When I set the parameter "UserName" with value "<name>"
    And I set the parameter "Email" with value "<email>"
    And I set the parameter "Password" with value "All!123456"
    And I choose the "<role>" from the "Role"
    And I click the "CreateButton" button
    Then I wait for "SuccessMessage" will be visible

    Examples:
      | name                 | email                             | role         |
      | AutoTestRole         | autoRoleFullName@yottabyte.cn     | AutoTestEdit |
      | AutoTestFunctionRole | autoRoleFunctionName@yottabyte.cn | AutoTestCopy |

  Scenario Outline: 修改密码（首次登录需修改）
    Given I logout current user
    And I wait for title change text to "登录"
    And open the "LoginPage" page for uri "/auth/login/"
    When I set the parameter "Username" with value "<name>"
    And I set the parameter "Password" with value "All!123456"
    And I click the "LoginButton" button
    And I wait for "Modify" will be visible
    And I click the "Modify" button
    And I set the parameter "NewPassword" with value "All#123456"
   # And I hide the element "InnerContent"
    And I set the parameter "RepeatPassword" with value "All#123456"
    And I click the "Update" button

    Examples:
      | name                 |
      | AutoTestRole         |
      | AutoTestFunctionRole |

  Scenario: 添加AutoTestRole的可管理角色
    Given open the "users.ListPage" page for uri "/account/users/"
    And I wait for loading invisible
    When I click the detail which name is "{'column':'1','name':'AutoTestRole'}"
    And I will see the "users.CreatePage" page
    And I click the "EditButton" button
    And I choose the "AutoTestCopy" from the "ManageRole"
#    And I click the "Save" button

  Scenario: 分配搜索权限
    Given open the "queryScopes.ListPage" page for uri "/queryscopes/"
    And I wait for loading invisible
    When the data name is "SearchAuth" then i click the "授权" button in more menu
    And I wait for loading invisible
    And I "check" the checkbox which name is "AutoTestRole" in tiny table
    And I click the "Ensure" button
    Then I will see the message "保存成功"

  Scenario: 给角色授权
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And I wait for loading invisible
    When the data name is "AutoTestEdit" then i click the "授权" button in more menu
    And I will see the "roles.AuthorizationPage" page
    When I "checked" the checkbox which name is "全选"
    When I "unchecked" the checkbox which name is "全选"
    When I "checked" the checkbox which name is "可查看敏感内容,可下载搜索结果(download指令)"
    Then I wait for "2000" millsecond
    And I click the "UserAndValidate" button
    When I "checked" the checkbox which name is "可转授功能权限"
    And I click the "SaveButton" button
    Then I will see the success message "更新成功"

  Scenario: 给角色授权
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And I wait for loading invisible
    When the data name is "AutoTestCopy" then i click the "授权" button in more menu
    And I will see the "roles.AuthorizationPage" page
    When I "checked" the checkbox which name is "全选"
    When I "unchecked" the checkbox which name is "全选"
    When I "checked" the checkbox which name is "可查看搜索页"
    And I click the "SaveButton" button
    Then I will see the success message "更新成功"

  Scenario: 验证可转授功能权限
    Given I login user "AutoTestRole" with password "All#123456"
    And open the "queryScopes.ListPage" page for uri "/queryscopes/"
    And I click the "TempAuth" button
    And I click the "SearchAuth" button
    When the data name is "TestResource" then i click the "授权" button in more menu
    And I choose the "AutoTestFunctionRole" from the "AuthUser"
    And I click the "ExpiredTime" button
    And I wait for "1000" millsecond
    And I set the time input "CalendarInput" to "50" minutes later
    And I click the "CalendarEnsure" button
    And I "checked" the checkbox which name is "可查看敏感内容,可下载搜索结果"
    And I click the "Ensure" button
    Then I will see the message "临时授权成功"

  Scenario: 验证转授功能权限成功
    Given I login user "AutoTestFunctionRole" with password "All#123456"
    And open the "splSearch.SearchPage" page for uri "/search/"
    And I set the parameter "SearchInput" with value " * | chart count() by appname | download filename=\"AutoTestAuthDownload\" fileformat=\"csv\""
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    Then I wait for element "SearchStatus" change text to "搜索完成!"

  Scenario: 验证下载管理页面
    Given I login user "AutoTestFunctionRole" with password "All#123456"
    And open the "ListPageFactory" page for uri "/download/"
    And the data name contains "AutoTestAuthDownload" then i click the "下载" button
    And the data name contains "AutoTestAuthDownload" then i click the "删除" button
    And I wait for "Ensure" will be visible
    And I click the "Ensure" button
    Then I will see the success message "删除成功"

  Scenario: 授权无可转授功能权限
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And I wait for loading invisible
    When the data name is "AutoTestEdit" then i click the "授权" button in more menu
    And I will see the "roles.AuthorizationPage" page
    And I wait for loading invisible
    Then I click the "{'TabButton':'功能'}" button
    And I wait for loading invisible
    When I "unchecked" the checkbox which name is "可转授功能权限"
    And I click the "SaveButton" button
    Then I will see the success message "更新成功"

  Scenario: 验证无可转授功能权限
    Given I login user "AutoTestRole" with password "All#123456"
    And open the "queryScopes.ListPage" page for uri "/queryscopes/"
    And I click the "TempAuth" button
    And I click the "SearchAuth" button
    And I click the "Auth" button
    Then I will see the "DesensiveChecked" is "ant-checkbox-disabled"

  Scenario Outline: 删除用户
    Given open the "users.ListPage" page for uri "/account/users/"
    And I wait for loading invisible
    When the data name is "{'column':'1','name':'<name>'}" then i click the "删除" button
    And I wait for "Ensure" will be visible
    And I click the "Ensure" button
    And I will see the success message "删除成功"

    Examples:
      | name                 |
      | AutoTestRole         |
      | AutoTestFunctionRole |
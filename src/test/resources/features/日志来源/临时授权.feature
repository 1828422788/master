@logSource
Feature: 日志来源临时授权

  Scenario: 允许二次授权日志来源
    Given open the "sourceGroup.ListPage" page for uri "/sources/sourcegroups/"
    And I set the parameter "SearchInput" with value "autotest"
    And I click the "Search" button
    And I wait for loading invisible
    And I click the "Authorize" button
    And I click the "FirstCheckbox" button
    And I click the "Auth" button
    And I choose the "user" from the "User" with property
    And I set the parameter "ValidTime" with value "120"
    And I "checked" the checkbox which name is "允许二次授权"
    And I click the "SaveButton" button
    Then I will see the message "添加临时授权成功！"

  Scenario Outline: 修改角色权限
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "<role>" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    And I click the "{'TabButton':'功能'}" button
    And I "checked" the checkbox which name is "全选"
    And I click the "{'TabButton':'URL 访问'}" button
    And I "checked" the checkbox which name is "全选"
    And I click the "{'TabButton':'日志来源'}" button
    And I "checked" the checkbox which name is "新建日志来源分组"
    And I click the "{'TabButton':'用户分组'}" button
    And I "checked" the checkbox which name is "新建用户分组"
    And I check "读取,编辑,删除" from the "{'GroupManagement':['AutoTest']}"
    And I check "读取,分配,编辑" from the "{'IntraGroupManagement':['AutoTest']}"
    Then I click the "SaveButton" button

    Examples:
      | role                        |
      | AutoTestRole                |
      | AutoTestRoleWithAllResource |

  Scenario Outline: 进行二次授权
    Given I will see the "PublicNavBarPage" page
    And I wait for "Dashboard" will be visible
    Given I logout current user
    And I wait for title change text to "登录"
    And open the "LoginPage" page for uri "/auth/login/"
    When I set the parameter "Username" with properties "<name>"
    And I set the parameter "Password" with properties "<pwd>"
    And I click the "LoginButton" button
    Given I will see the "PublicNavBarPage" page
    And I wait for "Dashboard" will be visible
    Given open the "sourceGroup.ListPage" page for uri "/sources/sourcegroups/"
    And I set the parameter "SearchInput" with value "sxjautotest"
    And I click the "Search" button
    And I wait for loading invisible
    And I click the "Authorize" button
    And I click the "FirstCheckbox" button
    And I click the "Auth" button
    And I choose the "userWithResources" from the "User" with property
    And I set the parameter "ValidTime" with value "120"
    And I "checked" the checkbox which name is "允许二次授权"
    And I click the "SaveButton" button
    Then I will see the message "添加临时授权成功！"

    Examples:
      | name              | pwd                  |
      | user              | userPwd              |
      | userWithResources | userWithResourcesPwd |

  Scenario: RZY-1227:按照日志来源搜索临时授权管理
    Given open the "sourceGroup.ListPage" page for uri "/sources/sourcegroups/"
    And I click the "ManageAuthorize" button
    And I choose the "tempautotest" from the "Resource"
    And I wait for "1000" millsecond
    Then I will see the search result "{'column':'1','name':'tempautotest'}"

  Scenario: RZY-1228:按提权人搜索
    Given open the "sourceGroup.ListPage" page for uri "/sources/sourcegroups/"
    And I click the "ManageAuthorize" button
    And I set the parameter "Name" with value "AutoTestAllResource"
    And I click the "Search" button
    And I wait for "1000" millsecond
    Then I will see the search result "{'column':'0','name':'AutoTestAllResource'}"

  Scenario: RZY-1224:授权管理-回收
    Given open the "sourceGroup.ListPage" page for uri "/sources/sourcegroups/"
    And I click the "ManageAuthorize" button
    When the data name is "AutoTest" then i click the "回收" button
    And I click the "Retrieve" button

  Scenario Outline: 验证日志来源是否回收成功
    Given I will see the "PublicNavBarPage" page
    And I wait for "Dashboard" will be visible
    Given I logout current user
    And I wait for title change text to "登录"
    And open the "LoginPage" page for uri "/auth/login/"
    When I set the parameter "Username" with properties "<name>"
    And I set the parameter "Password" with properties "<pwd>"
    And I click the "LoginButton" button
    Given I will see the "PublicNavBarPage" page
    And I wait for "Dashboard" will be visible
    Given open the "sourceGroup.ListPage" page for uri "/sources/sourcegroups/"
    Then I wait for "EmptyText" will be visible

    Examples:
      | name | pwd     |
      | user | userPwd |

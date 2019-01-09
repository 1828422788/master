@authorization @all @smoke @roleSmoke
Feature: 角色授权仪表盘

  Background:
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "AutoTestRole" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    Then I click the "{'TabButton':'仪表盘'}" button

  Scenario: 授权新建仪表盘（RZY-606）
    When I "checked" the checkbox which name is "新建仪表盘"
    And I click the "SaveButton" button
    And I will see the success message "保存成功"
    And I logout current user
    And open the "LoginPage" page for uri "/auth/login/"
    When I set the parameter "Username" with value "AutoTest"
    And I set the parameter "Password" with value "qqqqq11111"
    And I click the "LoginButton" button
    And I wait for "2000" millsecond
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I click the "CreateButton" button
    And I set the parameter "DashBoardName" with value "AutoTestUserCreate"
    And I choose the "AutoTestRoleWithAllResource" from the "DashBoardGroup"
    And I click the "EnsureCreateButton" button
    Then I will see the success message "仪表盘新建成功"

  Scenario: 验证未授权组内管理权限时列表页结果（RZY-614）
    Given I logout current user
    And open the "LoginPage" page for uri "/auth/login/"
    When I set the parameter "Username" with value "AutoTest"
    And I set the parameter "Password" with value "qqqqq11111"
    And I click the "LoginButton" button
    And I wait for "2000" millsecond
    Given open the "alert.ListPage" page for uri "/dashboard/"
    Then I will see the element "NoSearchResultMessage" name is "暂无数据"

  Scenario Outline: 授权读取（RZY-615）
    When I check "读取" from the "{'IntraGroupManagement':['AutoTestRoleWithAllResource']}"
    And I click the "SaveButton" button
#    And I will see the success message "保存成功"
    And open the "dashboard.ListPage" page for uri "/dashboard/"
    And the data name is "<name>" then i click the "分组" button
    Then I choose the "AutoTestRoleWithAllResource" from the "GroupInput"
    And I click the "EnsureChangeGroupButton" button
    Then I will see the success message "仪表盘更改分组成功"
    And I logout current user
    And open the "LoginPage" page for uri "/auth/login/"
    When I set the parameter "Username" with value "AutoTest"
    And I set the parameter "Password" with value "qqqqq11111"
    And I click the "LoginButton" button
    And I wait for "2000" millsecond
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    Then I will see the search result contains "{'column':'0','name':'<name>'}"

    Examples:
      | name               |
      | AutoTestUserCreate |

  Scenario Outline: 授权读取+分配（RZY-616）
    When I check "读取,分配" from the "{'IntraGroupManagement':['AutoTestRoleWithAllResource']}"
    And I click the "SaveButton" button
    And I logout current user
    And open the "LoginPage" page for uri "/auth/login/"
    When I set the parameter "Username" with value "AutoTest"
    And I set the parameter "Password" with value "qqqqq11111"
    And I click the "LoginButton" button
    And I wait for "2000" millsecond
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    Then I will see the search result contains "{'column':'0','name':'<name>'}"

    Examples:
      | name               |
      | AutoTestUserCreate |

  Scenario: 授权读取+编辑（RZY-616）
    When I check "读取,编辑" from the "{'IntraGroupManagement':['AutoTestRoleWithAllResource']}"
    And I click the "SaveButton" button
    And I logout current user
    And open the "LoginPage" page for uri "/auth/login/"
    When I set the parameter "Username" with value "AutoTest"
    And I set the parameter "Password" with value "qqqqq11111"
    And I click the "LoginButton" button
    And I wait for "2000" millsecond
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    Then the data name is "AutoTestUserCreate" then i will see "{'column':'4','name':'设为默认 分组 重命名'}" button

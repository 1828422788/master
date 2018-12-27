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

  Scenario: 验证未授权组内管理权限时列表页结果（RZY-596）
    Given I logout current user
    And open the "LoginPage" page for uri "/auth/login/"
    When I set the parameter "Username" with value "AutoTest"
    And I set the parameter "Password" with value "qqqqq11111"
    And I click the "LoginButton" button
    And I wait for "2000" millsecond
    Given open the "alert.ListPage" page for uri "/alerts/"
    Then I will see the element "NoSearchResultMessage" name is "暂无数据"


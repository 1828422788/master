@authorization @all @smoke @roleSmoke
Feature: 角色授权搜索宏

  Background:
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "AutoTestRole" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    Then I click the "{'TabButton':'搜索宏'}" button

  Scenario: 授权新建搜索宏（RZY-2585）
    When I "checked" the checkbox which name is "新建宏"
    And I click the "SaveButton" button
    And I will see the success message "保存成功"
    And I logout current user
    And open the "LoginPage" page for uri "/auth/login/"
    When I set the parameter "Username" with value "AutoTest"
    And I set the parameter "Password" with value "qqqqq11111"
    And I click the "LoginButton" button
    And I wait for "2000" millsecond
    And open the "searchMacro.ListPage" page for uri "/macro/"
    When I click the "CreateButton" button
    Then I will see the "searchMacro.CreatePage" page
    When I set the parameter "Name" with value "AutoTestUserCreate"
    And I click the "SaveButton" button
    Then I will see the success message "保存成功"

  Scenario Outline: 授权读取（RZY-2594）
    When I check "读取" from the "{'IntraGroupManagement':['<group>']}"
    And I click the "SaveButton" button
    And I will see the success message "保存成功"
    And open the "searchMacro.ListPage" page for uri "/macro/"
    When the data name is "<name>" then i click the "分组" button
    And I choose the "AutoTestRoleWithAllResource" from the "Group"
    And I click the "EnsureButton" button
    Then I will see the success message "保存成功"
    And I logout current user
    And open the "LoginPage" page for uri "/auth/login/"
    When I set the parameter "Username" with value "AutoTest"
    And I set the parameter "Password" with value "qqqqq11111"
    And I click the "LoginButton" button
    And I wait for "2000" millsecond
    And open the "searchMacro.ListPage" page for uri "/macro/"
    Then I will see the search result contains "{'column':'0','name':'<name>'}"

    Examples:
      | group                       | name               |
      | AutoTestRoleWithAllResource | AutoTestUserCreate |
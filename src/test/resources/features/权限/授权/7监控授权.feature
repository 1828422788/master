@authorization @all @smoke
Feature: 角色授权监控（有bug，未修复）

  Background:
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "AutoTestRole" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    Then I click the "{'TabButton':'监控'}" button

  Scenario: 授权新建监控（RZY-588）
    When I "checked" the checkbox which name is "新建监控"
    And I click the "SaveButton" button
    And I will see the success message "保存成功"
    And I logout current user
    And open the "LoginPage" page for uri "/auth/login/"
    When I set the parameter "Username" with value "AutoTest"
    And I set the parameter "Password" with value "qqqqq11111"
    And I click the "LoginButton" button
    And I wait for "2000" millsecond
    Given open the "alert.ListPage" page for uri "/alerts/"
    And I click the "CreateAlert" button
    And I will see the "alert.CreatePage" page
    When I set the parameter "AlertName" with value "AutoTestUserCreate"
    And I choose the "所有日志" from the "AlertSources"
    And I set the parameter "SearchContent" with value "*"
    And I switch the "AlertEnable" button to "disable"
    And I set the parameter "AlertTriggerInput" with value "5"
    And I choose the ">" from the "Conditions"
    And I set the parameter "AlertLevelInput" with value "3"
    And I click the "SaveButton" button
    Then I will see the success message "保存成功"

  Scenario Outline: 授权读取（RZY-597）
    When I check "读取" from the "{'IntraGroupManagement':['AutoTestRoleWithAllResource']}"
    And I click the "SaveButton" button
    And I will see the success message "保存成功"
    And I logout current user
    And open the "LoginPage" page for uri "/auth/login/"
    When I set the parameter "Username" with value "AutoTest"
    And I set the parameter "Password" with value "qqqqq11111"
    And I click the "LoginButton" button
    And I wait for "2000" millsecond
    Given open the "alert.ListPage" page for uri "/alerts/"
    Then I will see the search result contains "{'column':'0','name':'<name>'}"
    And the data name is "<name>" then i click the "在搜索中打开" button
    And switch to another window
    And I wait for "2000" millsecond
    Then the page's title will be "搜索"

    Examples:
      | name               |
      | AutoTestUserCreate |

  Scenario Outline: 授权读取+分配（RZY-598）
    When I check "读取,分配" from the "{'IntraGroupManagement':['AutoTestRoleWithAllResource']}"
    And I click the "SaveButton" button
    And I will see the success message "保存成功"
    And I logout current user
    And open the "LoginPage" page for uri "/auth/login/"
    When I set the parameter "Username" with value "AutoTest"
    And I set the parameter "Password" with value "qqqqq11111"
    And I click the "LoginButton" button
    And I wait for "2000" millsecond
    Given open the "alert.ListPage" page for uri "/alerts/"
    And the data name is "<name>" then i click the "复制" button
    And I refresh the website
    Then I will see the search result contains "{'column':'0','name':'<name>(1)'}"
    And open the "alert.MaintenancePage" page for uri "/alerts/maintenance/"
    And I click the "Create" button
    And I click the "Group" button
    Then I will see the "DisabledLi" is "is-disabled"

    Examples:
      | name               |
      | AutoTestUserCreate |

  Scenario Outline: 授权读取+编辑（RZY-599）
    When I check "读取,编辑" from the "{'IntraGroupManagement':['AutoTestRoleWithAllResource']}"
    And I click the "SaveButton" button
    And I will see the success message "保存成功"
    And I logout current user
    And open the "LoginPage" page for uri "/auth/login/"
    When I set the parameter "Username" with value "AutoTest"
    And I set the parameter "Password" with value "qqqqq11111"
    And I click the "LoginButton" button
    And I wait for "2000" millsecond
    Given open the "alert.ListPage" page for uri "/alerts/"
    And the data name is "<name>" then i click the "分组" button
    And I click the "ChangeGroup" button
    Then I will see the "DisabledLi" is "is-disabled"
    Given open the "alert.ListPage" page for uri "/alerts/"
    And the data name is "<name>" then i click the "编辑" button
    And I will see the "alert.CreatePage" page
    And I click the "AlertGroups" button
    Then I will see the "DisabledLi" is "is-disabled"
    And I click the "SaveButton" button
    Then I will see the success message "保存成功"

    Examples:
      | name               |
      | AutoTestUserCreate |

  Scenario: 授权读取+删除（RZY-600）
    When I check "读取,删除" from the "{'IntraGroupManagement':['AutoTestRoleWithAllResource']}"
    And I click the "SaveButton" button
    And I will see the success message "保存成功"
    And I logout current user
    And open the "LoginPage" page for uri "/auth/login/"
    When I set the parameter "Username" with value "AutoTest"
    And I set the parameter "Password" with value "qqqqq11111"
    And I click the "LoginButton" button
    And I wait for "2000" millsecond
    Given open the "alert.ListPage" page for uri "/alerts/"
    And the data name is "AutoTestUserCreate(1)" then i click the "删除" button
    And I click the "EnsureDeleteButton" button
    Then I will see the success message "删除成功"

  Scenario: 授权读取+分配+编辑（RZY-601）(有bug，第二个检查点未验证)
    When I check "读取,分配,编辑" from the "{'IntraGroupManagement':['AutoTestRoleWithAllResource']}"
    And I click the "SaveButton" button
    And I will see the success message "保存成功"
    And I logout current user
    And open the "LoginPage" page for uri "/auth/login/"
    When I set the parameter "Username" with value "AutoTest"
    And I set the parameter "Password" with value "qqqqq11111"
    And I click the "LoginButton" button
    And I wait for "2000" millsecond
    Given open the "alert.ListPage" page for uri "/alerts/"
    Then the data name is "AutoTestUserCreate" then i will see "{'column':'5','name':'编辑 分组 复制 在搜索中打开'}" button

  Scenario: 授权读取+分配+删除（RZY-602）(有bug，第二个检查点未验证)
    When I check "读取,分配,删除" from the "{'IntraGroupManagement':['AutoTestRoleWithAllResource']}"
    And I click the "SaveButton" button
    And I will see the success message "保存成功"
    And I logout current user
    And open the "LoginPage" page for uri "/auth/login/"
    When I set the parameter "Username" with value "AutoTest"
    And I set the parameter "Password" with value "qqqqq11111"
    And I click the "LoginButton" button
    And I wait for "2000" millsecond
    Given open the "alert.ListPage" page for uri "/alerts/"
    Then the data name is "AutoTestUserCreate" then i will see "{'column':'5','name':'复制 删除 在搜索中打开'}" button

  Scenario: 授权读取+编辑+删除（RZY-603）(有bug，第二个检查点未验证)
    When I check "读取,编辑,删除" from the "{'IntraGroupManagement':['AutoTestRoleWithAllResource']}"
    And I click the "SaveButton" button
    And I will see the success message "保存成功"
    And I logout current user
    And open the "LoginPage" page for uri "/auth/login/"
    When I set the parameter "Username" with value "AutoTest"
    And I set the parameter "Password" with value "qqqqq11111"
    And I click the "LoginButton" button
    And I wait for "2000" millsecond
    Given open the "alert.ListPage" page for uri "/alerts/"
    Then the data name is "AutoTestUserCreate" then i will see "{'column':'5','name':'编辑 分组 删除 在搜索中打开'}" button

  Scenario Outline: 授权读取+分配+编辑+删除权限（RZY-595）(有bug，第二个检查点未验证)
    When I check "读取,分配,编辑,删除" from the "{'IntraGroupManagement':['AutoTestRoleWithAllResource']}"
    And I click the "SaveButton" button
    And I will see the success message "保存成功"
    And I logout current user
    And open the "LoginPage" page for uri "/auth/login/"
    When I set the parameter "Username" with value "AutoTest"
    And I set the parameter "Password" with value "qqqqq11111"
    And I click the "LoginButton" button
    And I wait for "2000" millsecond
    Given open the "alert.ListPage" page for uri "/alerts/"
    Then the data name is "<name>" then i will see "{'column':'5','name':'编辑 分组 复制 删除 在搜索中打开'}" button
    When the data name is "<name>" then i click the "删除" button
    And I click the "EnsureDeleteButton" button
    Then I will see the success message "删除成功"

    Examples:
      | name               |
      | AutoTestUserCreate |
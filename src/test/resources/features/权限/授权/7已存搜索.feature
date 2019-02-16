@authorization @all @smoke
Feature: 角色授权已存搜索

  Background:
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "AutoTestRole" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    Then I click the "{'TabButton':'已存搜索'}" button

  Scenario: 授权新建已存搜索（RZY-710）
    When I "checked" the checkbox which name is "新建已存搜索"
    When I check "读取,分配" from the "{'IntraGroupManagement':['AutoTestRoleWithAllResource']}"
    And I click the "SaveButton" button
    And I will see the success message "保存成功"
    And I logout current user
    And open the "LoginPage" page for uri "/auth/login/"
    When I set the parameter "Username" with value "AutoTest"
    And I set the parameter "Password" with value "qqqqq11111"
    And I click the "LoginButton" button
    And I wait for "2000" millsecond
    Given open the "splSearch.SearchPage" page for uri "/search/"
    When I set the parameter "SearchInput" with value "starttime="-2d/w" endtime="now" tag:*"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I click the "SavedSearch" button
    And I wait for loading invisible
    And I set the parameter "OfflineTaskName" with value "AutoTestUserCreate"
    And I choose the "AutoTestRoleWithAllResource" from the "GroupComboBox"
    And I click the "EnsureCreateSavedSearch" button
    Then I will see the success message "创建成功"

  Scenario Outline: 授权读取（RZY-719）
    When I check "读取" from the "{'IntraGroupManagement':['<group>']}"
    And I click the "SaveButton" button
    And I will see the success message "保存成功"
    And I logout current user
    And open the "LoginPage" page for uri "/auth/login/"
    When I set the parameter "Username" with value "AutoTest"
    And I set the parameter "Password" with value "qqqqq11111"
    And I click the "LoginButton" button
    And I wait for "2000" millsecond
    Given open the "splSearch.SearchPage" page for uri "/search/"
    Given I click the "OpenSavedSearchButton" button
    And I wait for loading invisible
    Then I get the data "{'column':'1','name':'<name>'}" from page then I will see "{'column':'6','name':'加载'}" button
    And I click the "Star" button
    Then I will see the message "<message>"

    Examples:
      | group                       | name               | message             |
      | AutoTestRoleWithAllResource | AutoTestUserCreate | 操作者没有权限\n错误码: FE_42 |

  Scenario Outline: 授权读取+分配（RZY-720）
    When I check "读取,分配" from the "{'IntraGroupManagement':['AutoTestRoleWithAllResource']}"
    And I click the "SaveButton" button
    And I will see the success message "保存成功"
    And I logout current user
    And open the "LoginPage" page for uri "/auth/login/"
    When I set the parameter "Username" with value "AutoTest"
    And I set the parameter "Password" with value "qqqqq11111"
    And I click the "LoginButton" button
    And I wait for "2000" millsecond
    Given open the "splSearch.SearchPage" page for uri "/search/"
    Given I click the "OpenSavedSearchButton" button
    And I wait for loading invisible
    Then I get the data "{'column':'1','name':'<name>'}" from page then I will see "{'column':'6','name':'加载'}" button
    And I click the "Star" button
    Then I will see the message "<message>"

    Examples:
      | name               | message             |
      | AutoTestUserCreate | 操作者没有权限\n错误码: FE_42 |

  Scenario: 授权读取+编辑（RZY-721）
    When I check "读取,编辑" from the "{'IntraGroupManagement':['AutoTestRoleWithAllResource']}"
    And I click the "SaveButton" button
    And I will see the success message "保存成功"
    And I logout current user
    And open the "LoginPage" page for uri "/auth/login/"
    When I set the parameter "Username" with value "AutoTest"
    And I set the parameter "Password" with value "qqqqq11111"
    And I click the "LoginButton" button
    And I wait for "2000" millsecond
    Given open the "splSearch.SearchPage" page for uri "/search/"
    Given I click the "OpenSavedSearchButton" button
    And I wait for loading invisible
    Then I will see the "Star" is "el-icon-star-off"
    And I click the "Star" button

  Scenario Outline: 授权读取+删除（RZY-722）
    When I check "读取,删除" from the "{'IntraGroupManagement':['AutoTestRoleWithAllResource']}"
    And I click the "SaveButton" button
    And I will see the success message "保存成功"
    And I logout current user
    And open the "LoginPage" page for uri "/auth/login/"
    When I set the parameter "Username" with value "AutoTest"
    And I set the parameter "Password" with value "qqqqq11111"
    And I click the "LoginButton" button
    And I wait for "2000" millsecond
    Given open the "splSearch.SearchPage" page for uri "/search/"
    Given I click the "OpenSavedSearchButton" button
    And I wait for loading invisible
    Then I get the data "{'column':'1','name':'<name>'}" from page then I will see "{'column':'6','name':'加载删除'}" button
    And I click the "Star" button
    Then I will see the message "<message>"

    Examples:
      | name               | message             |
      | AutoTestUserCreate | 操作者没有权限\n错误码: FE_42 |

  Scenario Outline: 授权读取+分配+编辑（RZY-723）
    When I check "读取,分配,编辑" from the "{'IntraGroupManagement':['<group>']}"
    And I click the "SaveButton" button
    And I will see the success message "保存成功"
    And I logout current user
    And open the "LoginPage" page for uri "/auth/login/"
    When I set the parameter "Username" with value "AutoTest"
    And I set the parameter "Password" with value "qqqqq11111"
    And I click the "LoginButton" button
    And I wait for "2000" millsecond
    Given open the "splSearch.SearchPage" page for uri "/search/"
    Given I click the "OpenSavedSearchButton" button
    And I wait for loading invisible
    Then I get the data "{'column':'1','name':'<name>'}" from page then I will see "{'column':'6','name':'加载'}" button
    Then I will see the "Star" is "el-icon-star-on"
    And I click the "Star" button

    Examples:
      | group                       | name               |
      | AutoTestRoleWithAllResource | AutoTestUserCreate |

  Scenario Outline: 授权读取+分配+删除（RZY-724）
    When I check "读取,分配,删除" from the "{'IntraGroupManagement':['<group>']}"
    And I click the "SaveButton" button
    And I will see the success message "保存成功"
    And I logout current user
    And open the "LoginPage" page for uri "/auth/login/"
    When I set the parameter "Username" with value "AutoTest"
    And I set the parameter "Password" with value "qqqqq11111"
    And I click the "LoginButton" button
    And I wait for "2000" millsecond
    Given open the "splSearch.SearchPage" page for uri "/search/"
    Given I click the "OpenSavedSearchButton" button
    And I wait for loading invisible
    Then I get the data "{'column':'1','name':'<name>'}" from page then I will see "{'column':'6','name':'加载删除'}" button
    Then I will see the "Star" is "el-icon-star-off"
    And I click the "Star" button
    Then I will see the message "<message>"

    Examples:
      | group                       | name               | message             |
      | AutoTestRoleWithAllResource | AutoTestUserCreate | 操作者没有权限\n错误码: FE_42 |

  Scenario Outline: 授权读取+编辑+删除（RZY-725）
    When I check "读取,编辑,删除" from the "{'IntraGroupManagement':['<group>']}"
    And I click the "SaveButton" button
    And I will see the success message "保存成功"
    And I logout current user
    And open the "LoginPage" page for uri "/auth/login/"
    When I set the parameter "Username" with value "AutoTest"
    And I set the parameter "Password" with value "qqqqq11111"
    And I click the "LoginButton" button
    And I wait for "2000" millsecond
    Given open the "splSearch.SearchPage" page for uri "/search/"
    Given I click the "OpenSavedSearchButton" button
    And I wait for loading invisible
    Then I get the data "{'column':'1','name':'<name>'}" from page then I will see "{'column':'6','name':'加载删除'}" button
    Then I will see the "Star" is "el-icon-star-off"
    And I click the "Star" button

    Examples:
      | group                       | name               |
      | AutoTestRoleWithAllResource | AutoTestUserCreate |

  Scenario Outline: 授权读取+分配+编辑+删除（RZY-717）
    When I check "读取,分配,编辑,删除" from the "{'IntraGroupManagement':['<group>']}"
    And I click the "SaveButton" button
    And I will see the success message "保存成功"
    And I logout current user
    And open the "LoginPage" page for uri "/auth/login/"
    When I set the parameter "Username" with value "AutoTest"
    And I set the parameter "Password" with value "qqqqq11111"
    And I click the "LoginButton" button
    And I wait for "2000" millsecond
    Given open the "splSearch.SearchPage" page for uri "/search/"
    Given I click the "OpenSavedSearchButton" button
    And I wait for loading invisible
    Then I get the data "{'column':'1','name':'<name>'}" from page then I will see "{'column':'6','name':'加载删除'}" button
    Then I will see the "Star" is "el-icon-star-on"
    And I click the "Star" button
    And "删除" the data "<name>" in columnNum "1"
    Then I click the "DeleteSavedSearch" button

    Examples:
      | group                       | name               |
      | AutoTestRoleWithAllResource | AutoTestUserCreate |
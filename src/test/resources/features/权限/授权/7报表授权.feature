@authorization @all @smoke
Feature: 角色授权报表

  Background:
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "AutoTestRole" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    Then I click the "{'TabButton':'报表'}" button

  Scenario: 授权新建报表（RZY-674）
    When I "checked" the checkbox which name is "新建报表"
    And I click the "SaveButton" button
    And I will see the success message "保存成功"
    And I logout current user
    And open the "LoginPage" page for uri "/auth/login/"
    When I set the parameter "Username" with value "AutoTest"
    And I set the parameter "Password" with value "qqqqq11111"
    And I click the "LoginButton" button
    And I wait for "2000" millsecond
    Given open the "report.ListPage" page for uri "/reports/"
    When I click the "CreateButton" button
    Then I will see the "report.CreatePage" page
    When I set the parameter "Name" with value "AutoTestUserCreate"
    And I set the parameter "Subject" with value "test"
    And I set the parameter "Hour" with value "11"
    And I set the parameter "Minute" with value "30"
    And I click the "NextButton" button
    And I choose the "AutoTestUserCreate" from the "ChartList"
    And I click the "Layout1" button
    And I click the "Save" button
    Then I will see the success message "保存成功"

  Scenario Outline: 授权读取（RZY-683）
    When I check "读取" from the "{'IntraGroupManagement':['<group>']}"
    And I click the "SaveButton" button
    And I will see the success message "保存成功"
    Given open the "report.ListPage" page for uri "/reports/"
    When the data name is "<name>" then i click the "分组" button
    And I choose the "<group>" from the "ChangeGroup"
    And I click the "Ensure" button
    Then I will see the success message "保存成功"
    And I logout current user
    And open the "LoginPage" page for uri "/auth/login/"
    When I set the parameter "Username" with value "AutoTest"
    And I set the parameter "Password" with value "qqqqq11111"
    And I click the "LoginButton" button
    And I wait for "2000" millsecond
    Given open the "report.ListPage" page for uri "/reports/"
    Then I will see the search result contains "{'column':'0','name':'<name>'}"

    Examples:
      | group                       | name               |
      | AutoTestRoleWithAllResource | AutoTestUserCreate |

  Scenario: 授权读取+分配（RZY-684）
    When I check "读取,分配" from the "{'IntraGroupManagement':['AutoTestRoleWithAllResource']}"
    And I click the "SaveButton" button
    And I will see the success message "保存成功"
    And I logout current user
    And open the "LoginPage" page for uri "/auth/login/"
    When I set the parameter "Username" with value "AutoTest"
    And I set the parameter "Password" with value "qqqqq11111"
    And I click the "LoginButton" button
    And I wait for "2000" millsecond
    Given open the "report.ListPage" page for uri "/reports/"
    Then I will see the search result contains "{'column':'0','name':'AutoTestUserCreate'}"

  Scenario Outline: 授权读取+编辑（RZY-685）
    When I check "读取,编辑" from the "{'IntraGroupManagement':['AutoTestRoleWithAllResource']}"
    And I click the "SaveButton" button
    And I will see the success message "保存成功"
    And I logout current user
    And open the "LoginPage" page for uri "/auth/login/"
    When I set the parameter "Username" with value "AutoTest"
    And I set the parameter "Password" with value "qqqqq11111"
    And I click the "LoginButton" button
    And I wait for "2000" millsecond
    Given open the "report.ListPage" page for uri "/reports/"
    Then the data name is "<name>" then i will see "{'column':'6','name':'编辑 分组'}" button
    When the data name is "<name>" then i click the "分组" button
    And I trigger the button "ChangeGroup"
    Then I will see the "DisabledLi" is "is-disabled"

    Examples:
      | name               |
      | AutoTestUserCreate |

  Scenario Outline: 授权读取+删除（RZY-686）
    When I check "读取,删除" from the "{'IntraGroupManagement':['AutoTestRoleWithAllResource']}"
    And I click the "SaveButton" button
    And I will see the success message "保存成功"
    And I logout current user
    And open the "LoginPage" page for uri "/auth/login/"
    When I set the parameter "Username" with value "AutoTest"
    And I set the parameter "Password" with value "qqqqq11111"
    And I click the "LoginButton" button
    And I wait for "2000" millsecond
    Given open the "report.ListPage" page for uri "/reports/"
    Then the data name is "<name>" then i will see "{'column':'6','name':'删除'}" button
    When the data name is "<name>" then i click the "删除" button
    Then I will see the message "此操作将删除 [<name>], 是否继续?"

    Examples:
      | name               |
      | AutoTestUserCreate |

  Scenario Outline: 授权读取+分配+编辑（RZY-687）
    When I check "读取,分配,编辑" from the "{'IntraGroupManagement':['<group>']}"
    And I click the "SaveButton" button
    And I will see the success message "保存成功"
    And I logout current user
    And open the "LoginPage" page for uri "/auth/login/"
    When I set the parameter "Username" with value "AutoTest"
    And I set the parameter "Password" with value "qqqqq11111"
    And I click the "LoginButton" button
    And I wait for "2000" millsecond
    Given open the "report.ListPage" page for uri "/reports/"
    Then the data name is "<name>" then i will see "{'column':'6','name':'编辑 分组'}" button
    When the data name is "<name>" then i click the "分组" button
    And I cancel selection "<group>" from the "ChangeGroup"
    And I click the "Ensure" button
    Then I will see the success message "保存成功"

    Examples:
      | group                       | name               |
      | AutoTestRoleWithAllResource | AutoTestUserCreate |

  Scenario Outline: 授权读取+分配+删除（RZY-688）
    When I check "读取,分配,删除" from the "{'IntraGroupManagement':['<group>']}"
    And I click the "SaveButton" button
    And I will see the success message "保存成功"
    Given open the "report.ListPage" page for uri "/reports/"
    And the data name is "<name>" then i click the "分组" button
    And I choose the "<group>" from the "ChangeGroup"
    And I click the "Ensure" button
    Then I will see the success message "保存成功"
    And I logout current user
    And open the "LoginPage" page for uri "/auth/login/"
    When I set the parameter "Username" with value "AutoTest"
    And I set the parameter "Password" with value "qqqqq11111"
    And I click the "LoginButton" button
    And I wait for "2000" millsecond
    Given open the "report.ListPage" page for uri "/reports/"
    Then the data name is "<name>" then i will see "{'column':'6','name':'删除'}" button
    When the data name is "<name>" then i click the "删除" button
    Then I will see the message "此操作将删除 [<name>], 是否继续?"

    Examples:
      | group                       | name               |
      | AutoTestRoleWithAllResource | AutoTestUserCreate |

  Scenario Outline: 授权读取+编辑+删除（RZY-689）
    When I check "读取,编辑,删除" from the "{'IntraGroupManagement':['<group>']}"
    And I click the "SaveButton" button
    And I will see the success message "保存成功"
    And I logout current user
    And open the "LoginPage" page for uri "/auth/login/"
    When I set the parameter "Username" with value "AutoTest"
    And I set the parameter "Password" with value "qqqqq11111"
    And I click the "LoginButton" button
    And I wait for "2000" millsecond
    Given open the "report.ListPage" page for uri "/reports/"
    Then the data name is "<name>" then i will see "{'column':'6','name':'编辑 分组 删除'}" button
    When the data name is "<name>" then i click the "编辑" button
    And I trigger the button "ChangeGroup"
    Then I will see the "DisabledLi" is "is-disabled"
    Given open the "report.ListPage" page for uri "/reports/"
    When the data name is "<name>" then i click the "删除" button
    Then I will see the message "此操作将删除 [<name>], 是否继续?"

    Examples:
      | group                       | name               |
      | AutoTestRoleWithAllResource | AutoTestUserCreate |

  Scenario Outline: 授权读取+分配+编辑+删除（RZY-681）
    When I check "读取,分配,编辑,删除" from the "{'IntraGroupManagement':['<group>']}"
    And I click the "SaveButton" button
    And I will see the success message "保存成功"
    And I logout current user
    And open the "LoginPage" page for uri "/auth/login/"
    When I set the parameter "Username" with value "AutoTest"
    And I set the parameter "Password" with value "qqqqq11111"
    And I click the "LoginButton" button
    And I wait for "2000" millsecond
    Given open the "report.ListPage" page for uri "/reports/"
    Then the data name is "<name>" then i will see "{'column':'6','name':'编辑 分组 删除'}" button
    When the data name is "<name>" then i click the "删除" button
    And I click the "DeleteEnsure" button
    And I will see the success message "删除成功"
    Given open the "trend.ListPage" page for uri "/trend/"
    When the data name is "<name>" then i click the "删除" button
    And I click the "EnsureButton" button
    And I will see the success message "删除成功"

    Examples:
      | group                       | name               |
      | AutoTestRoleWithAllResource | AutoTestUserCreate |
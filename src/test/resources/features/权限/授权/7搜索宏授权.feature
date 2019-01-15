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
    And I choose the "<group>" from the "Group"
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

  Scenario: 授权读取+分配（RZY-2595）
    When I check "读取,分配" from the "{'IntraGroupManagement':['AutoTestRoleWithAllResource']}"
    And I click the "SaveButton" button
    And I will see the success message "保存成功"
    And I logout current user
    And open the "LoginPage" page for uri "/auth/login/"
    When I set the parameter "Username" with value "AutoTest"
    And I set the parameter "Password" with value "qqqqq11111"
    And I click the "LoginButton" button
    And I wait for "2000" millsecond
    And open the "searchMacro.ListPage" page for uri "/macro/"
    Then I will see the search result contains "{'column':'0','name':'AutoTestUserCreate'}"

  Scenario Outline: 授权读取+编辑（RZY-2596）
    When I check "读取,编辑" from the "{'IntraGroupManagement':['AutoTestRoleWithAllResource']}"
    And I click the "SaveButton" button
    And I will see the success message "保存成功"
    And I logout current user
    And open the "LoginPage" page for uri "/auth/login/"
    When I set the parameter "Username" with value "AutoTest"
    And I set the parameter "Password" with value "qqqqq11111"
    And I click the "LoginButton" button
    And I wait for "2000" millsecond
    And open the "searchMacro.ListPage" page for uri "/macro/"
    Then the data name is "<name>" then i will see "{'column':'5','name':'编辑 分组'}" button
    When the data name is "<name>" then i click the "分组" button
    And I trigger the button "Group"
    Then I will see the "DisabledLi" is "is-disabled"

    Examples:
      | name               |
      | AutoTestUserCreate |

  Scenario Outline: 授权读取+删除（RZY-2597）
    When I check "读取,删除" from the "{'IntraGroupManagement':['AutoTestRoleWithAllResource']}"
    And I click the "SaveButton" button
    And I will see the success message "保存成功"
    And I logout current user
    And open the "LoginPage" page for uri "/auth/login/"
    When I set the parameter "Username" with value "AutoTest"
    And I set the parameter "Password" with value "qqqqq11111"
    And I click the "LoginButton" button
    And I wait for "2000" millsecond
    And open the "searchMacro.ListPage" page for uri "/macro/"
    Then the data name is "<name>" then i will see "{'column':'5','name':'删除'}" button
    When the data name is "<name>" then i click the "删除" button
    Then I will see the message "确认删除 [ <name> ] ?"

    Examples:
      | name               |
      | AutoTestUserCreate |

  Scenario Outline: 授权读取+分配+编辑（RZY-2598）
    When I check "读取,分配,编辑" from the "{'IntraGroupManagement':['<group>']}"
    And I click the "SaveButton" button
    And I will see the success message "保存成功"
    And I logout current user
    And open the "LoginPage" page for uri "/auth/login/"
    When I set the parameter "Username" with value "AutoTest"
    And I set the parameter "Password" with value "qqqqq11111"
    And I click the "LoginButton" button
    And I wait for "2000" millsecond
    And open the "searchMacro.ListPage" page for uri "/macro/"
    Then the data name is "<name>" then i will see "{'column':'5','name':'编辑 分组'}" button
    When the data name is "<name>" then i click the "分组" button
    And I cancel selection "<group>" from the "Group"
    And I click the "EnsureButton" button
    Then I will see the success message "保存成功"

    Examples:
      | group                       | name               |
      | AutoTestRoleWithAllResource | AutoTestUserCreate |

  Scenario Outline: 授权读取+分配+删除（RZY-2599）
    When I check "读取,分配,删除" from the "{'IntraGroupManagement':['<group>']}"
    And I click the "SaveButton" button
    And I will see the success message "保存成功"
    And open the "searchMacro.ListPage" page for uri "/macro/"
    And the data name is "<name>" then i click the "分组" button
    And I choose the "<group>" from the "Group"
    And I click the "EnsureButton" button
    Then I will see the success message "保存成功"
    And I logout current user
    And open the "LoginPage" page for uri "/auth/login/"
    When I set the parameter "Username" with value "AutoTest"
    And I set the parameter "Password" with value "qqqqq11111"
    And I click the "LoginButton" button
    And I wait for "2000" millsecond
    And open the "searchMacro.ListPage" page for uri "/macro/"
    Then the data name is "<name>" then i will see "{'column':'5','name':'删除'}" button
    When the data name is "<name>" then i click the "删除" button
    Then I will see the message "确认删除 [ <name> ] ?"

    Examples:
      | group                       | name               |
      | AutoTestRoleWithAllResource | AutoTestUserCreate |

  Scenario Outline: 授权读取+编辑+删除（RZY-2600）
    When I check "读取,编辑,删除" from the "{'IntraGroupManagement':['<group>']}"
    And I click the "SaveButton" button
    And I will see the success message "保存成功"
    And I logout current user
    And open the "LoginPage" page for uri "/auth/login/"
    When I set the parameter "Username" with value "AutoTest"
    And I set the parameter "Password" with value "qqqqq11111"
    And I click the "LoginButton" button
    And I wait for "2000" millsecond
    And open the "searchMacro.ListPage" page for uri "/macro/"
    Then the data name is "<name>" then i will see "{'column':'5','name':'编辑 分组 删除'}" button
    When the data name is "<name>" then i click the "编辑" button
    And I trigger the button "Group"
    Then I will see the "DisabledLi" is "is-disabled"
    And open the "searchMacro.ListPage" page for uri "/macro/"
    When the data name is "<name>" then i click the "删除" button
    Then I will see the message "确认删除 [ <name> ] ?"

    Examples:
      | group                       | name               |
      | AutoTestRoleWithAllResource | AutoTestUserCreate |

  Scenario Outline: 授权读取+分配+编辑+删除（RZY-2592）
    When I check "读取,分配,编辑,删除" from the "{'IntraGroupManagement':['<group>']}"
    And I click the "SaveButton" button
    And I will see the success message "保存成功"
    And I logout current user
    And open the "LoginPage" page for uri "/auth/login/"
    When I set the parameter "Username" with value "AutoTest"
    And I set the parameter "Password" with value "qqqqq11111"
    And I click the "LoginButton" button
    And I wait for "2000" millsecond
    And open the "searchMacro.ListPage" page for uri "/macro/"
    Then the data name is "<name>" then i will see "{'column':'5','name':'编辑 分组 删除'}" button
    When the data name is "<name>" then i click the "删除" button
    And I click the "EnsureDelete" button
    Then I will see the success message "删除成功"

    Examples:
      | group                       | name               |
      | AutoTestRoleWithAllResource | AutoTestUserCreate |
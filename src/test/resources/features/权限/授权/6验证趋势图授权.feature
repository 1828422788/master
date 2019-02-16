@authorization @all @smoke
Feature: 角色授权趋势图

  Background:
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "AutoTestRole" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    Then I click the "{'TabButton':'趋势图'}" button

  Scenario: 授权新建趋势图（RZY-746）
    When I "checked" the checkbox which name is "新建趋势图"
    And I click the "SaveButton" button
    And I will see the success message "保存成功"
    And I logout current user
    And open the "LoginPage" page for uri "/auth/login/"
    When I set the parameter "Username" with value "AutoTest"
    And I set the parameter "Password" with value "qqqqq11111"
    And I click the "LoginButton" button
    And I wait for "2000" millsecond
    Given open the "trend.ListPage" page for uri "/trend/"
    And I click the "CreateButton" button
    Then I will see the "trend.CreatePage" page
    When I set the parameter "NameInput" with value "AutoTestUserCreate"
    And I click the "NextButton" button
    And I set the parameter "SearchInput" with value "tag:*display | stats count() by apache.clientip,apache.resp_len | limit 10"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for "Header" will be visible
    And I click the "NextButton" button
    And I wait for "Header" will be visible
    And I click the "Save" button
    Then I will see the success message "创建成功"

  Scenario Outline: 授权读取（RZY-755）
    When I check "读取" from the "{'IntraGroupManagement':['<group>']}"
    And I click the "SaveButton" button
    And I will see the success message "保存成功"
    Given open the "trend.ListPage" page for uri "/trend/"
    When the data name is "<name>" then i click the "分组" button
    And I choose the "<group>" from the "Group"
    And I click the "Ensure" button
    And I will see the error message "保存成功"
    And I logout current user
    And open the "LoginPage" page for uri "/auth/login/"
    When I set the parameter "Username" with value "AutoTest"
    And I set the parameter "Password" with value "qqqqq11111"
    And I click the "LoginButton" button
    And I wait for "2000" millsecond
    Given open the "trend.ListPage" page for uri "/trend/"
    Then I will see the search result contains "{'column':'0','name':'<name>'}"

    Examples:
      | group                       | name               |
      | AutoTestRoleWithAllResource | AutoTestUserCreate |

  Scenario: 授权读取+分配（RZY-756）
    When I check "读取,分配" from the "{'IntraGroupManagement':['AutoTestRoleWithAllResource']}"
    And I click the "SaveButton" button
    And I will see the success message "保存成功"
    And I logout current user
    And open the "LoginPage" page for uri "/auth/login/"
    When I set the parameter "Username" with value "AutoTest"
    And I set the parameter "Password" with value "qqqqq11111"
    And I click the "LoginButton" button
    And I wait for "2000" millsecond
    Given open the "trend.ListPage" page for uri "/trend/"
    Then I will see the search result contains "{'column':'0','name':'AutoTestUserCreate'}"

  Scenario Outline: 授权读取+编辑（RZY-2529）
    When I check "读取,编辑" from the "{'IntraGroupManagement':['AutoTestRoleWithAllResource']}"
    And I click the "SaveButton" button
    And I will see the success message "保存成功"
    And I logout current user
    And open the "LoginPage" page for uri "/auth/login/"
    When I set the parameter "Username" with value "AutoTest"
    And I set the parameter "Password" with value "qqqqq11111"
    And I click the "LoginButton" button
    And I wait for "2000" millsecond
    Given open the "trend.ListPage" page for uri "/trend/"
    Then the data name is "<name>" then i will see "{'column':'3','name':'编辑 分组'}" button
    When the data name is "<name>" then i click the "分组" button
    And I trigger the button "Group"
    Then I will see the "DisabledLi" is "is-disabled"

    Examples:
      | name               |
      | AutoTestUserCreate |

  Scenario Outline: 授权读取+删除（RZY-758）
    When I check "读取,删除" from the "{'IntraGroupManagement':['AutoTestRoleWithAllResource']}"
    And I click the "SaveButton" button
    And I will see the success message "保存成功"
    And I logout current user
    And open the "LoginPage" page for uri "/auth/login/"
    When I set the parameter "Username" with value "AutoTest"
    And I set the parameter "Password" with value "qqqqq11111"
    And I click the "LoginButton" button
    And I wait for "2000" millsecond
    Given open the "trend.ListPage" page for uri "/trend/"
    Then the data name is "<name>" then i will see "{'column':'3','name':'删除'}" button
    When the data name is "<name>" then i click the "删除" button
    Then I will see the message "此操作将删除 [<name>], 是否继续?"

    Examples:
      | name               |
      | AutoTestUserCreate |

  Scenario Outline: 授权读取+分配+编辑（RZY-2528）
    When I check "读取,分配,编辑" from the "{'IntraGroupManagement':['<group>']}"
    And I click the "SaveButton" button
    And I will see the success message "保存成功"
    And I logout current user
    And open the "LoginPage" page for uri "/auth/login/"
    When I set the parameter "Username" with value "AutoTest"
    And I set the parameter "Password" with value "qqqqq11111"
    And I click the "LoginButton" button
    And I wait for "2000" millsecond
    Given open the "trend.ListPage" page for uri "/trend/"
    Then the data name is "<name>" then i will see "{'column':'3','name':'编辑 分组'}" button
    When the data name is "<name>" then i click the "分组" button
    And I cancel selection "<group>" from the "Group"
    And I click the "Ensure" button
    And I will see the error message "保存成功"

    Examples:
      | group                       | name               |
      | AutoTestRoleWithAllResource | AutoTestUserCreate |

  Scenario Outline: 授权读取+分配+删除（RZY-760）
    When I check "读取,分配,删除" from the "{'IntraGroupManagement':['<group>']}"
    And I click the "SaveButton" button
    And I will see the success message "保存成功"
    Given open the "trend.ListPage" page for uri "/trend/"
    And the data name is "<name>" then i click the "分组" button
    And I choose the "<group>" from the "Group"
    And I click the "Ensure" button
    And I will see the error message "保存成功"
    And I logout current user
    And open the "LoginPage" page for uri "/auth/login/"
    When I set the parameter "Username" with value "AutoTest"
    And I set the parameter "Password" with value "qqqqq11111"
    And I click the "LoginButton" button
    And I wait for "2000" millsecond
    Given open the "trend.ListPage" page for uri "/trend/"
    Then the data name is "<name>" then i will see "{'column':'3','name':'删除'}" button
    When the data name is "<name>" then i click the "删除" button
    Then I will see the message "此操作将删除 [<name>], 是否继续?"

    Examples:
      | group                       | name               |
      | AutoTestRoleWithAllResource | AutoTestUserCreate |

  Scenario Outline: 授权读取+编辑+删除
    When I check "读取,编辑,删除" from the "{'IntraGroupManagement':['<group>']}"
    And I click the "SaveButton" button
    And I will see the success message "保存成功"
    And I logout current user
    And open the "LoginPage" page for uri "/auth/login/"
    When I set the parameter "Username" with value "AutoTest"
    And I set the parameter "Password" with value "qqqqq11111"
    And I click the "LoginButton" button
    And I wait for "2000" millsecond
    Given open the "trend.ListPage" page for uri "/trend/"
    Then the data name is "<name>" then i will see "{'column':'3','name':'编辑 分组 删除'}" button
    When the data name is "<name>" then i click the "分组" button
    And I trigger the button "Group"
    Then I will see the "DisabledLi" is "is-disabled"
    Given open the "trend.ListPage" page for uri "/trend/"
    When the data name is "<name>" then i click the "删除" button
    Then I will see the message "此操作将删除 [<name>], 是否继续?"

    Examples:
      | group                       | name               |
      | AutoTestRoleWithAllResource | AutoTestUserCreate |

  Scenario Outline: 授权读取+分配+编辑+删除（RZY-2527）
    When I check "读取,分配,编辑,删除" from the "{'IntraGroupManagement':['<group>']}"
    And I click the "SaveButton" button
    And I will see the success message "保存成功"
    And I logout current user
    And open the "LoginPage" page for uri "/auth/login/"
    When I set the parameter "Username" with value "AutoTest"
    And I set the parameter "Password" with value "qqqqq11111"
    And I click the "LoginButton" button
    And I wait for "2000" millsecond
    Given open the "trend.ListPage" page for uri "/trend/"
    Then the data name is "<name>" then i will see "{'column':'3','name':'编辑 分组 删除'}" button

    Examples:
      | group                       | name               |
      | AutoTestRoleWithAllResource | AutoTestUserCreate |
@authorization @all @smoke
Feature: 角色授权日志来源

  Background:
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "AutoTestRole" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    Then I click the "{'TabButton':'日志来源'}" button

  Scenario Outline: 授权新建日志来源（RZY-728）
    When I "checked" the checkbox which name is "新建日志来源"
    And I click the "SaveButton" button
    And I will see the success message "保存成功"
    And I logout current user
    And open the "LoginPage" page for uri "/auth/login/"
    When I set the parameter "Username" with value "AutoTest"
    And I set the parameter "Password" with value "qqqqq11111"
    And I click the "LoginButton" button
    And I wait for "2000" millsecond
    Given open the "sourceGroup.ListPage" page for uri "/sources/sourcegroups/"
    When I click the "CreateButton" button
    And I will see the "sourceGroup.CreatePage" page
    And I set the parameter "Name" with value "<name>"
    And I set the parameter "Appname" with value "app"
    And I click the "EnsureCreateButton" button
    Then I will see the success message "创建成功"

    Examples:
      | name               |
      | AutoTestUserCreate |

  Scenario Outline: 授权读取（RZY-737）
    When I check "<function>" from the "{'IntraGroupManagement':['<group>']}"
    And I click the "SaveButton" button
    And I will see the success message "保存成功"
    Given open the "sourceGroup.ListPage" page for uri "/sources/sourcegroups/"
    And the data name is "<name>" then i click the "分组" button
    And I choose the "<group>" from the "GroupInput"
    And I click the "EnsureButton" button
    Then I will see the success message "保存成功"
    And I logout current user
    And open the "LoginPage" page for uri "/auth/login/"
    When I set the parameter "Username" with value "AutoTest"
    And I set the parameter "Password" with value "qqqqq11111"
    And I click the "LoginButton" button
    And I wait for "2000" millsecond
    Given open the "sourceGroup.ListPage" page for uri "/sources/sourcegroups/"
    Then I will see the column number "1" contains "<name>"
    Then the data name is "<name>" then i will see "{'column':'3','name':'设为默认'}" button

    Examples:
      | function | group                       | name               |
      | 读取       | AutoTestRoleWithAllResource | AutoTestUserCreate |

  Scenario Outline: 授权读取+分配（RZY-738）
    When I check "<function>" from the "{'IntraGroupManagement':['<group>']}"
    And I click the "SaveButton" button
    And I will see the success message "保存成功"
    And I logout current user
    And open the "LoginPage" page for uri "/auth/login/"
    When I set the parameter "Username" with value "AutoTest"
    And I set the parameter "Password" with value "qqqqq11111"
    And I click the "LoginButton" button
    And I wait for "2000" millsecond
    Given open the "sourceGroup.ListPage" page for uri "/sources/sourcegroups/"
    Then I will see the column number "1" contains "<name>"
    Then the data name is "<name>" then i will see "{'column':'3','name':'设为默认'}" button

    Examples:
      | function | group                       | name               |
      | 读取,分配    | AutoTestRoleWithAllResource | AutoTestUserCreate |

  Scenario Outline: 授权读取+编辑（RZY-739）
    When I check "<function>" from the "{'IntraGroupManagement':['AutoTestRoleWithAllResource']}"
    And I click the "SaveButton" button
    And I will see the success message "保存成功"
    And I logout current user
    And open the "LoginPage" page for uri "/auth/login/"
    When I set the parameter "Username" with value "AutoTest"
    And I set the parameter "Password" with value "qqqqq11111"
    And I click the "LoginButton" button
    And I wait for "2000" millsecond
    Given open the "sourceGroup.ListPage" page for uri "/sources/sourcegroups/"
    And I wait for loading invisible
    Then the data name is "<name>" then i will see "{'column':'3','name':'编辑 分组 设为默认'}" button
    Given the data name is "<name>" then i click the "分组" button
    And I trigger the button "GroupInput"
    Then I will see the "DisabledLi" is "is-disabled"

    Examples:
      | function | name               |
      | 读取,编辑    | AutoTestUserCreate |

  Scenario Outline: 授权读取+删除（RZY-740）
    When I check "读取,删除" from the "{'IntraGroupManagement':['AutoTestRoleWithAllResource']}"
    And I click the "SaveButton" button
    And I will see the success message "保存成功"
    And I logout current user
    And open the "LoginPage" page for uri "/auth/login/"
    When I set the parameter "Username" with value "AutoTest"
    And I set the parameter "Password" with value "qqqqq11111"
    And I click the "LoginButton" button
    And I wait for "2000" millsecond
    Given open the "sourceGroup.ListPage" page for uri "/sources/sourcegroups/"
    And I wait for loading invisible
    Then the data name is "<name>" then i will see "{'column':'3','name':'删除 设为默认'}" button
    When the data name is "<name>" then i click the "删除" button
    Then I will see the error message "此操作将删除 [<name>], 是否继续?"

    Examples:
      | name               |
      | AutoTestUserCreate |

  Scenario Outline: 授权读取+分配+编辑（RZY-741）
    When I check "读取,分配,编辑" from the "{'IntraGroupManagement':['<group>']}"
    And I click the "SaveButton" button
    And I will see the success message "保存成功"
    And I logout current user
    And open the "LoginPage" page for uri "/auth/login/"
    When I set the parameter "Username" with value "AutoTest"
    And I set the parameter "Password" with value "qqqqq11111"
    And I click the "LoginButton" button
    And I wait for "2000" millsecond
    Given open the "sourceGroup.ListPage" page for uri "/sources/sourcegroups/"
    And I wait for loading invisible
    Then the data name is "<name>" then i will see "{'column':'3','name':'编辑 分组 设为默认'}" button
    When the data name is "<name>" then i click the "分组" button
    And I cancel selection "<group>" from the "GroupInput"
    And I click the "EnsureButton" button
    Then I will see the success message "保存成功"

    Examples:
      | group                       | name               |
      | AutoTestRoleWithAllResource | AutoTestUserCreate |

  Scenario Outline: 授权读取+分配+删除（RZY-742）
    When I check "读取,分配,删除" from the "{'IntraGroupManagement':['<group>']}"
    And I click the "SaveButton" button
    And I will see the success message "保存成功"
    Given open the "sourceGroup.ListPage" page for uri "/sources/sourcegroups/"
    And I wait for loading invisible
    And the data name is "<name>" then i click the "分组" button
    And I choose the "<group>" from the "GroupInput"
    And I click the "EnsureButton" button
    Then I will see the success message "保存成功"
    And I logout current user
    And open the "LoginPage" page for uri "/auth/login/"
    When I set the parameter "Username" with value "AutoTest"
    And I set the parameter "Password" with value "qqqqq11111"
    And I click the "LoginButton" button
    And I wait for "2000" millsecond
    Given open the "sourceGroup.ListPage" page for uri "/sources/sourcegroups/"
    And I wait for loading invisible
    Then the data name is "<name>" then i will see "{'column':'3','name':'删除 设为默认'}" button

    Examples:
      | group                       | name               |
      | AutoTestRoleWithAllResource | AutoTestUserCreate |

  Scenario Outline: 授权读取+编辑+删除（RZY-743）
    When I check "读取,编辑,删除" from the "{'IntraGroupManagement':['<group>']}"
    And I click the "SaveButton" button
    And I will see the success message "保存成功"
    And I logout current user
    And open the "LoginPage" page for uri "/auth/login/"
    When I set the parameter "Username" with value "AutoTest"
    And I set the parameter "Password" with value "qqqqq11111"
    And I click the "LoginButton" button
    And I wait for "2000" millsecond
    Given open the "sourceGroup.ListPage" page for uri "/sources/sourcegroups/"
    And I wait for loading invisible
    Then the data name is "<name>" then i will see "{'column':'3','name':'编辑 分组 删除 设为默认'}" button
    When the data name is "<name>" then i click the "分组" button
    And I trigger the button "GroupInput"
    Then I will see the "DisabledLi" is "is-disabled"

    Examples:
      | group                       | name               |
      | AutoTestRoleWithAllResource | AutoTestUserCreate |

  Scenario Outline: 授权读取+分配+编辑+删除（RZY-735）
    When I check "读取,分配,编辑,删除" from the "{'IntraGroupManagement':['<group>']}"
    And I click the "SaveButton" button
    And I will see the success message "保存成功"
    And I logout current user
    And open the "LoginPage" page for uri "/auth/login/"
    When I set the parameter "Username" with value "AutoTest"
    And I set the parameter "Password" with value "qqqqq11111"
    And I click the "LoginButton" button
    And I wait for "2000" millsecond
    Given open the "sourceGroup.ListPage" page for uri "/sources/sourcegroups/"
    And I wait for loading invisible
    Then the data name is "<name>" then i will see "{'column':'3','name':'编辑 分组 删除 设为默认'}" button
    Given the data name is "<name>" then i click the "删除" button
    When I click the "Ensure" button
    And I will see the success message "删除成功"

    Examples:
      | group                       | name               |
      | AutoTestRoleWithAllResource | AutoTestUserCreate |
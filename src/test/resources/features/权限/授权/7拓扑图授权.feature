@authorization @all @smoke @roleSmoke
Feature: 角色授权知识

  Background:
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "AutoTestRole" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    Then I click the "{'TabButton':'拓扑图'}" button

  Scenario Outline: 授权新建拓扑图（RZY-981）
    When I "checked" the checkbox which name is "新建拓扑图"
    And I click the "SaveButton" button
    And I will see the success message "保存成功"
    And I logout current user
    And open the "LoginPage" page for uri "/auth/login/"
    When I set the parameter "Username" with value "AutoTest"
    And I set the parameter "Password" with value "qqqqq11111"
    And I click the "LoginButton" button
    And I wait for "2000" millsecond
    Given open the "topology.ListPage" page for uri "/topology/"
    When I click the "CreateButton" button
    And I set the parameter "NameInput" with value "<name>"
    And I click the "EnsureButton" button
    Then I will see the success message "创建成功"

    Examples:
      | name               |
      | AutoTestUserCreate |

  Scenario Outline: 授权读取（RZY-990）
    When I check "读取" from the "{'IntraGroupManagement':['<group>']}"
    And I click the "SaveButton" button
    And I will see the success message "保存成功"
    Given open the "topology.ListPage" page for uri "/topology/"
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
    Given open the "topology.ListPage" page for uri "/topology/"
    Then I will see the search result contains "{'column':'0','name':'<name>'}"

    Examples:
      | group                       | name               |
      | AutoTestRoleWithAllResource | AutoTestUserCreate |

  Scenario Outline: 授权读取+分配（RZY-991）
    When I check "读取,分配" from the "{'IntraGroupManagement':['<group>']}"
    And I click the "SaveButton" button
    And I will see the success message "保存成功"
    And I logout current user
    And open the "LoginPage" page for uri "/auth/login/"
    When I set the parameter "Username" with value "AutoTest"
    And I set the parameter "Password" with value "qqqqq11111"
    And I click the "LoginButton" button
    And I wait for "2000" millsecond
    Given open the "topology.ListPage" page for uri "/topology/"
    Then I will see the search result contains "{'column':'0','name':'<name>'}"

    Examples:
      | group                       | name               |
      | AutoTestRoleWithAllResource | AutoTestUserCreate |

  Scenario Outline: 授权读取+编辑（RZY-992）
    When I check "读取,编辑" from the "{'IntraGroupManagement':['AutoTestRoleWithAllResource']}"
    And I click the "SaveButton" button
    And I will see the success message "保存成功"
    And I logout current user
    And open the "LoginPage" page for uri "/auth/login/"
    When I set the parameter "Username" with value "AutoTest"
    And I set the parameter "Password" with value "qqqqq11111"
    And I click the "LoginButton" button
    And I wait for "2000" millsecond
    Given open the "topology.ListPage" page for uri "/topology/"
    Then the data name is "<name>" then i will see "{'column':'2','name':'分组 重命名'}" button
    When the data name is "<name>" then i click the "分组" button
    And I click the "GroupInput" button
    Then I will see the "DisabledLi" is "is-disabled"

    Examples:
      | name               |
      | AutoTestUserCreate |

  Scenario Outline: 授权读取+删除（RZY-993）
    When I check "读取,删除" from the "{'IntraGroupManagement':['AutoTestRoleWithAllResource']}"
    And I click the "SaveButton" button
    And I will see the success message "保存成功"
    And I logout current user
    And open the "LoginPage" page for uri "/auth/login/"
    When I set the parameter "Username" with value "AutoTest"
    And I set the parameter "Password" with value "qqqqq11111"
    And I click the "LoginButton" button
    And I wait for "2000" millsecond
    Given open the "topology.ListPage" page for uri "/topology/"
    Then the data name is "<name>" then i will see "{'column':'2','name':'删除'}" button
    When the data name is "<name>" then i click the "删除" button
    Then I will see the error message "此操作将删除 [<name>], 是否继续?"

    Examples:
      | name               |
      | AutoTestUserCreate |

  Scenario Outline: 授权读取+分配+编辑（RZY-994）
    When I check "读取,分配,编辑" from the "{'IntraGroupManagement':['<group>']}"
    And I click the "SaveButton" button
    And I will see the success message "保存成功"
    And I logout current user
    And open the "LoginPage" page for uri "/auth/login/"
    When I set the parameter "Username" with value "AutoTest"
    And I set the parameter "Password" with value "qqqqq11111"
    And I click the "LoginButton" button
    And I wait for "2000" millsecond
    Given open the "topology.ListPage" page for uri "/topology/"
    Then the data name is "<name>" then i will see "{'column':'2','name':'分组 重命名'}" button
    Given the data name is "<name>" then i click the "重命名" button
    Then I set the parameter "NameInput" with value "<newName>"
    Then I click the "EnsureButton" button
    Then I will see the success message "保存成功"
    And I refresh the website
    When the data name is "<newName>" then i click the "分组" button
    And I cancel selection "<group>" from the "GroupInput"
    And I click the "EnsureButton" button
    Then I will see the success message "保存成功"

    Examples:
      | group                       | name               | newName                |
      | AutoTestRoleWithAllResource | AutoTestUserCreate | AutoTestUserCreateTopo |

  Scenario Outline: 授权读取+分配+删除（RZY-995）
    When I check "读取,分配,删除" from the "{'IntraGroupManagement':['<group>']}"
    And I click the "SaveButton" button
    And I will see the success message "保存成功"
    Given open the "topology.ListPage" page for uri "/topology/"
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
    Given open the "topology.ListPage" page for uri "/topology/"
    Then the data name is "<name>" then i will see "{'column':'2','name':'删除'}" button
    When the data name is "<name>" then i click the "删除" button
    Then I will see the error message "此操作将删除 [<name>], 是否继续?"

    Examples:
      | group                       | name                   |
      | AutoTestRoleWithAllResource | AutoTestUserCreateTopo |

  Scenario Outline: 授权读取+编辑+删除（RZY-996）
    When I check "读取,编辑,删除" from the "{'IntraGroupManagement':['<group>']}"
    And I click the "SaveButton" button
    And I will see the success message "保存成功"
    And I logout current user
    And open the "LoginPage" page for uri "/auth/login/"
    When I set the parameter "Username" with value "AutoTest"
    And I set the parameter "Password" with value "qqqqq11111"
    And I click the "LoginButton" button
    And I wait for "2000" millsecond
    Given open the "topology.ListPage" page for uri "/topology/"
    Then the data name is "<name>" then i will see "{'column':'2','name':'分组 重命名 删除'}" button
    When the data name is "<name>" then i click the "分组" button
    And I click the "GroupInput" button
    Then I will see the "DisabledLi" is "is-disabled"
    Given open the "topology.ListPage" page for uri "/topology/"
    Given the data name is "<name>" then i click the "重命名" button
    Then I set the parameter "NameInput" with value "<newName>"
    Then I click the "EnsureButton" button
    Then I will see the success message "保存成功"

    Examples:
      | group                       | name                   | newName            |
      | AutoTestRoleWithAllResource | AutoTestUserCreateTopo | AutoTestUserCreate |

  Scenario Outline: 授权读取+分配+编辑+删除（RZY-988）
    When I check "读取,分配,编辑,删除" from the "{'IntraGroupManagement':['<group>']}"
    And I click the "SaveButton" button
    And I will see the success message "保存成功"
    And I logout current user
    And open the "LoginPage" page for uri "/auth/login/"
    When I set the parameter "Username" with value "AutoTest"
    And I set the parameter "Password" with value "qqqqq11111"
    And I click the "LoginButton" button
    And I wait for "2000" millsecond
    Given open the "topology.ListPage" page for uri "/topology/"
    Then the data name is "<name>" then i will see "{'column':'2','name':'分组 重命名 删除'}" button
    Given the data name is "<name>" then i click the "删除" button
    When I click the "Ensure" button
    And I will see the success message "删除成功"

    Examples:
      | group                       | name               |
      | AutoTestRoleWithAllResource | AutoTestUserCreate |
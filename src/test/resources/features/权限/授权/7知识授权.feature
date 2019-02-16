@authorization @all @smoke
Feature: 角色授权知识

  Background:
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "AutoTestRole" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    Then I click the "{'TabButton':'知识'}" button

  Scenario Outline: 授权新建知识（RZY-638）
    When I "checked" the checkbox which name is "新建知识"
    And I click the "SaveButton" button
    And I will see the success message "保存成功"
    And I logout current user
    And open the "LoginPage" page for uri "/auth/login/"
    When I set the parameter "Username" with value "AutoTest"
    And I set the parameter "Password" with value "qqqqq11111"
    And I click the "LoginButton" button
    And I wait for "2000" millsecond
    Given open the "knowledge.ListPage" page for uri "/knowledge/"
    Given I click the "CreateKnowledge" button
    When I set the parameter "EventCode" with value "<name>"
    And I set the parameter "Describe" with value "AutoTest"
    And I click the "Confirm" button

    Examples:
      | name               |
      | AutoTestUserCreate |

  Scenario Outline: 授权读取（RZY-647）
    When I check "<function>" from the "{'IntraGroupManagement':['<group>']}"
    And I click the "SaveButton" button
    And I will see the success message "保存成功"
    Given open the "knowledge.ListPage" page for uri "/knowledge/"
    And the data name is "<name>" then i click the "分组" button
    And I choose the "<group>" from the "GroupComboBox"
    And I click the "Ensure" button
    Then I will see the success message "保存成功"
    And I logout current user
    And open the "LoginPage" page for uri "/auth/login/"
    When I set the parameter "Username" with value "AutoTest"
    And I set the parameter "Password" with value "qqqqq11111"
    And I click the "LoginButton" button
    And I wait for "2000" millsecond
    Given open the "knowledge.ListPage" page for uri "/knowledge/"
    Then I will see the search result contains "{'column':'0','name':'<name>'}"

    Examples:
      | function | group                       | name               |
      | 读取       | AutoTestRoleWithAllResource | AutoTestUserCreate |

  Scenario Outline: 授权读取+分配（RZY-648）
    When I check "<function>" from the "{'IntraGroupManagement':['<group>']}"
    And I click the "SaveButton" button
    And I will see the success message "保存成功"
    And I logout current user
    And open the "LoginPage" page for uri "/auth/login/"
    When I set the parameter "Username" with value "AutoTest"
    And I set the parameter "Password" with value "qqqqq11111"
    And I click the "LoginButton" button
    And I wait for "2000" millsecond
    Given open the "knowledge.ListPage" page for uri "/knowledge/"
    Then I will see the search result contains "{'column':'0','name':'<name>'}"

    Examples:
      | function | group                       | name               |
      | 读取,分配    | AutoTestRoleWithAllResource | AutoTestUserCreate |

  Scenario Outline: 授权读取+编辑（RZY-649）
    When I check "<function>" from the "{'IntraGroupManagement':['AutoTestRoleWithAllResource']}"
    And I click the "SaveButton" button
    And I will see the success message "保存成功"
    And I logout current user
    And open the "LoginPage" page for uri "/auth/login/"
    When I set the parameter "Username" with value "AutoTest"
    And I set the parameter "Password" with value "qqqqq11111"
    And I click the "LoginButton" button
    And I wait for "2000" millsecond
    Given open the "knowledge.ListPage" page for uri "/knowledge/"
    Then the data name is "<name>" then i will see "{'column':'6','name':'<operator>'}" button
    When the data name is "<name>" then i click the "编辑" button
    And I click the "GroupInput" button
    Then I will see the "DisabledLi" is "is-disabled"

    Examples:
      | function | name               | operator |
      | 读取,编辑    | AutoTestUserCreate | 编辑 分组    |

  Scenario Outline: 授权读取+删除（RZY-650）
    When I check "读取,删除" from the "{'IntraGroupManagement':['AutoTestRoleWithAllResource']}"
    And I click the "SaveButton" button
    And I will see the success message "保存成功"
    And I logout current user
    And open the "LoginPage" page for uri "/auth/login/"
    When I set the parameter "Username" with value "AutoTest"
    And I set the parameter "Password" with value "qqqqq11111"
    And I click the "LoginButton" button
    And I wait for "2000" millsecond
    Given open the "knowledge.ListPage" page for uri "/knowledge/"
    Then the data name is "<name>" then i will see "{'column':'6','name':'删除'}" button
    When the data name is "<name>" then i click the "删除" button
    Then I will see the error message "确认删除 [ <name> ] ?"

    Examples:
      | name               |
      | AutoTestUserCreate |

  Scenario Outline: 授权读取+分配+编辑（RZY-651）
    When I check "读取,分配,编辑" from the "{'IntraGroupManagement':['<group>']}"
    And I click the "SaveButton" button
    And I will see the success message "保存成功"
    And I logout current user
    And open the "LoginPage" page for uri "/auth/login/"
    When I set the parameter "Username" with value "AutoTest"
    And I set the parameter "Password" with value "qqqqq11111"
    And I click the "LoginButton" button
    And I wait for "2000" millsecond
    Given open the "knowledge.ListPage" page for uri "/knowledge/"
    Then the data name is "<name>" then i will see "{'column':'6','name':'编辑 分组'}" button
    When the data name is "<name>" then i click the "分组" button
    And I cancel selection "<group>" from the "GroupComboBox"
    And I click the "Ensure" button
    Then I will see the success message "保存成功"

    Examples:
      | group                       | name               |
      | AutoTestRoleWithAllResource | AutoTestUserCreate |

  Scenario Outline: 授权读取+分配+删除（RZY-652）
    When I check "读取,分配,删除" from the "{'IntraGroupManagement':['<group>']}"
    And I click the "SaveButton" button
    And I will see the success message "保存成功"
    Given open the "knowledge.ListPage" page for uri "/knowledge/"
    And the data name is "<name>" then i click the "分组" button
    And I choose the "<group>" from the "GroupComboBox"
    And I click the "Ensure" button
    Then I will see the success message "保存成功"
    And I logout current user
    And open the "LoginPage" page for uri "/auth/login/"
    When I set the parameter "Username" with value "AutoTest"
    And I set the parameter "Password" with value "qqqqq11111"
    And I click the "LoginButton" button
    And I wait for "2000" millsecond
    Given open the "knowledge.ListPage" page for uri "/knowledge/"
    Then the data name is "<name>" then i will see "{'column':'6','name':'删除'}" button
    When the data name is "<name>" then i click the "删除" button
    Then I will see the error message "确认删除 [ <name> ] ?"

    Examples:
      | group                       | name               |
      | AutoTestRoleWithAllResource | AutoTestUserCreate |

  Scenario Outline: 授权读取+编辑+删除（RZY-653）
    When I check "读取,编辑,删除" from the "{'IntraGroupManagement':['<group>']}"
    And I click the "SaveButton" button
    And I will see the success message "保存成功"
    And I logout current user
    And open the "LoginPage" page for uri "/auth/login/"
    When I set the parameter "Username" with value "AutoTest"
    And I set the parameter "Password" with value "qqqqq11111"
    And I click the "LoginButton" button
    And I wait for "2000" millsecond
    Given open the "knowledge.ListPage" page for uri "/knowledge/"
    Then the data name is "<name>" then i will see "{'column':'6','name':'编辑 分组 删除'}" button
    When the data name is "<name>" then i click the "编辑" button
    And I click the "GroupInput" button
    Then I will see the "DisabledLi" is "is-disabled"
    And open the "knowledge.ListPage" page for uri "/knowledge/"
    When the data name is "<name>" then i click the "删除" button
    Then I will see the error message "确认删除 [ <name> ] ?"

    Examples:
      | group                       | name               |
      | AutoTestRoleWithAllResource | AutoTestUserCreate |

  Scenario Outline: 授权读取+分配+编辑+删除（RZY-645）
    When I check "读取,分配,编辑,删除" from the "{'IntraGroupManagement':['<group>']}"
    And I click the "SaveButton" button
    And I will see the success message "保存成功"
    And I logout current user
    And open the "LoginPage" page for uri "/auth/login/"
    When I set the parameter "Username" with value "AutoTest"
    And I set the parameter "Password" with value "qqqqq11111"
    And I click the "LoginButton" button
    And I wait for "2000" millsecond
    Given open the "knowledge.ListPage" page for uri "/knowledge/"
    Then the data name is "<name>" then i will see "{'column':'6','name':'编辑 分组 删除'}" button
    Given the data name is "<name>" then i click the "删除" button
    When I click the "EnsureDeleteButton" button
    And I will see the success message "删除成功"

    Examples:
      | group                       | name               |
      | AutoTestRoleWithAllResource | AutoTestUserCreate |
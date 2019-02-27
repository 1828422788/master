#@authorization @all @smoke @roleSmoke
Feature: 角色授权定时任务

  Background:
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "AutoTestRole" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    Then I click the "{'TabButton':'定时任务'}" button

  Scenario: 授权新建定时任务（RZY-692）
    When I "checked" the checkbox which name is "新建定时任务"
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
    Given I set the parameter "SearchInput" with value "tag:"sample04061424" | top 1 apache.resp_len"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait element "SearchStatus" change text to "搜索完成!"
    And I click the "SaveAsOther" button
    And I click the "TimedTask" button
    And I set the parameter "TaskName" with value "AutoTestUserCreate"
    And I choose the "AutoTestRoleWithAllResource" from the "GroupComboBox"
    And I set the parameter "Period" with value "360"
    And I click the "StartTime" button
    And I set the time input "StartTomrrow" to "2" minutes later
    And I click the "EnsureButton" button
    And I display the element "TimePanel"
    And I click the "Ensure" button
    Then I will see the success message "保存成功"

  Scenario Outline: 授权读取（RZY-701）
    When I check "读取" from the "{'IntraGroupManagement':['<group>']}"
    And I click the "SaveButton" button
    And I will see the success message "保存成功"
    And I logout current user
    And open the "LoginPage" page for uri "/auth/login/"
    When I set the parameter "Username" with value "AutoTest"
    And I set the parameter "Password" with value "qqqqq11111"
    And I click the "LoginButton" button
    And I wait for "2000" millsecond
    Given open the "timedTask.ListPage" page for uri "/schedule/"
    Then I will see the search result contains "{'column':'0','name':'<name>'}"

    Examples:
      | group                       | name               |
      | AutoTestRoleWithAllResource | AutoTestUserCreate |

  Scenario Outline: 授权读取+分配（RZY-702）
    When I check "读取,分配" from the "{'IntraGroupManagement':['AutoTestRoleWithAllResource']}"
    And I click the "SaveButton" button
    And I will see the success message "保存成功"
    And I logout current user
    And open the "LoginPage" page for uri "/auth/login/"
    When I set the parameter "Username" with value "AutoTest"
    And I set the parameter "Password" with value "qqqqq11111"
    And I click the "LoginButton" button
    And I wait for "2000" millsecond
    Given open the "timedTask.ListPage" page for uri "/schedule/"
    Then the data name is "<name>" then i will see "{'column':'6','name':'复制'}" button
    When the data name is "<name>" then i click the "复制" button
    Then I will see the success message "复制成功"

    Examples:
      | name               |
      | AutoTestUserCreate |

  Scenario Outline: 授权读取+编辑（RZY-703）
    When I check "读取,编辑" from the "{'IntraGroupManagement':['AutoTestRoleWithAllResource']}"
    And I click the "SaveButton" button
    And I will see the success message "保存成功"
    And I logout current user
    And open the "LoginPage" page for uri "/auth/login/"
    When I set the parameter "Username" with value "AutoTest"
    And I set the parameter "Password" with value "qqqqq11111"
    And I click the "LoginButton" button
    And I wait for "2000" millsecond
    Given open the "timedTask.ListPage" page for uri "/schedule/"
    Then the data name is "<name>" then i will see "{'column':'6','name':'编辑 分组'}" button
    When the data name is "<name>" then i click the "分组" button
    And I trigger the button "Group"
    Then I will see the "DisabledLi" is "is-disabled"

    Examples:
      | name               |
      | AutoTestUserCreate |

  Scenario Outline: 授权读取+删除（RZY-704）
    When I check "读取,删除" from the "{'IntraGroupManagement':['AutoTestRoleWithAllResource']}"
    And I click the "SaveButton" button
    And I will see the success message "保存成功"
    And I logout current user
    And open the "LoginPage" page for uri "/auth/login/"
    When I set the parameter "Username" with value "AutoTest"
    And I set the parameter "Password" with value "qqqqq11111"
    And I click the "LoginButton" button
    And I wait for "2000" millsecond
    Given open the "timedTask.ListPage" page for uri "/schedule/"
    Then the data name is "<name>" then i will see "{'column':'6','name':'删除'}" button
    When the data name is "<name>(1)" then i click the "删除" button
    And I click the "EnsureDelete" button
    Then I will see the success message "删除成功"

    Examples:
      | name               |
      | AutoTestUserCreate |

  Scenario Outline: 授权读取+分配+编辑（RZY-705）
    When I check "读取,分配,编辑" from the "{'IntraGroupManagement':['<group>']}"
    And I click the "SaveButton" button
    And I will see the success message "保存成功"
    And I logout current user
    And open the "LoginPage" page for uri "/auth/login/"
    When I set the parameter "Username" with value "AutoTest"
    And I set the parameter "Password" with value "qqqqq11111"
    And I click the "LoginButton" button
    And I wait for "2000" millsecond
    Given open the "timedTask.ListPage" page for uri "/schedule/"
    Then the data name is "<name>" then i will see "{'column':'6','name':'编辑 复制 分组'}" button
    When the data name is "<name>" then i click the "分组" button
    And I cancel selection "<group>" from the "Group"
    And I click the "EnsureChangeGroup" button
    Then I will see the success message "保存成功"

    Examples:
      | group                       | name               |
      | AutoTestRoleWithAllResource | AutoTestUserCreate |

  Scenario Outline: 授权读取+分配+删除（RZY-706）
    When I check "读取,分配,删除" from the "{'IntraGroupManagement':['<group>']}"
    And I click the "SaveButton" button
    And I will see the success message "保存成功"
    Given open the "timedTask.ListPage" page for uri "/schedule/"
    And the data name is "<name>" then i click the "分组" button
    And I choose the "<group>" from the "Group"
    And I click the "EnsureChangeGroup" button
    Then I will see the success message "保存成功"
    And I logout current user
    And open the "LoginPage" page for uri "/auth/login/"
    When I set the parameter "Username" with value "AutoTest"
    And I set the parameter "Password" with value "qqqqq11111"
    And I click the "LoginButton" button
    And I wait for "2000" millsecond
    Given open the "timedTask.ListPage" page for uri "/schedule/"
    Then the data name is "<name>" then i will see "{'column':'6','name':'复制 删除'}" button
    When the data name is "<name>" then i click the "删除" button
    Then I will see the message "此操作将删除 [<name>], 是否继续?"

    Examples:
      | group                       | name               |
      | AutoTestRoleWithAllResource | AutoTestUserCreate |

  Scenario Outline: 授权读取+编辑+删除（RZY-707）
    When I check "读取,编辑,删除" from the "{'IntraGroupManagement':['<group>']}"
    And I click the "SaveButton" button
    And I will see the success message "保存成功"
    And I logout current user
    And open the "LoginPage" page for uri "/auth/login/"
    When I set the parameter "Username" with value "AutoTest"
    And I set the parameter "Password" with value "qqqqq11111"
    And I click the "LoginButton" button
    And I wait for "2000" millsecond
    Given open the "timedTask.ListPage" page for uri "/schedule/"
    Then the data name is "<name>" then i will see "{'column':'6','name':'编辑 分组 删除'}" button
    When the data name is "<name>" then i click the "编辑" button
    And I trigger the button "Group"
    Then I will see the "DisabledLi" is "is-disabled"
    Given open the "timedTask.ListPage" page for uri "/schedule/"
    When the data name is "<name>" then i click the "删除" button
    Then I will see the message "此操作将删除 [<name>], 是否继续?"

    Examples:
      | group                       | name               |
      | AutoTestRoleWithAllResource | AutoTestUserCreate |

  Scenario Outline: 授权读取+分配+编辑+删除（RZY-699）
    When I check "读取,分配,编辑,删除" from the "{'IntraGroupManagement':['<group>']}"
    And I click the "SaveButton" button
    And I will see the success message "保存成功"
    And I logout current user
    And open the "LoginPage" page for uri "/auth/login/"
    When I set the parameter "Username" with value "AutoTest"
    And I set the parameter "Password" with value "qqqqq11111"
    And I click the "LoginButton" button
    And I wait for "2000" millsecond
    Given open the "timedTask.ListPage" page for uri "/schedule/"
    Then the data name is "<name>" then i will see "{'column':'6','name':'编辑 复制 分组 删除'}" button
    When the data name is "<name>" then i click the "删除" button
    And I click the "EnsureDelete" button
    Then I will see the success message "删除成功"

    Examples:
      | group                       | name               |
      | AutoTestRoleWithAllResource | AutoTestUserCreate |
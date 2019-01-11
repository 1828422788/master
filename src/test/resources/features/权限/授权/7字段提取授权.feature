@authorization @all @smoke @roleSmoke
Feature: 角色授权字段提取

  Background:
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "AutoTestRole" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    Then I click the "{'TabButton':'字段提取'}" button

  Scenario: 授权新建字段提取（RZY-656）
    When I "checked" the checkbox which name is "新建字段提取"
    And I click the "SaveButton" button
    And I will see the success message "保存成功"
    And I logout current user
    And open the "LoginPage" page for uri "/auth/login/"
    When I set the parameter "Username" with value "AutoTest"
    And I set the parameter "Password" with value "qqqqq11111"
    And I click the "LoginButton" button
    And I wait for "2000" millsecond
    Given open the "configs.ListPage" page for uri "/configs/"
    And I click the "CreateButton" button
    Then I will see the "configs.CreatePage" page
    When I set the parameter "Name" with value "AutoTestUserCreate"
    And I set the parameter "Logtype" with value "sequence"
    When I set the parameter "LogSample" with value "1511255129000, fred, bob, query1, 111"
    And I choose the "删除字段" from the "ParseRule"
    And I choose the "raw_message" from the "SourceField"
    And I click the "NextButton" button
    And I click the "SwitchButton" button
    And I click the "NextButton" button
    Then I wait for "ConfigDone" will be visible

  Scenario Outline: 授权读取（RZY-665）
    When I check "<function>" from the "{'IntraGroupManagement':['<group>']}"
    And I click the "SaveButton" button
    And I will see the success message "保存成功"
    Given open the "configs.ListPage" page for uri "/configs/"
    And the data name is "<name>" then i click the "分组" button
    And I choose the "<group>" from the "Group"
    And I click the "Ensure" button
    Then I will see the success message "保存成功"
    And I logout current user
    And open the "LoginPage" page for uri "/auth/login/"
    When I set the parameter "Username" with value "AutoTest"
    And I set the parameter "Password" with value "qqqqq11111"
    And I click the "LoginButton" button
    And I wait for "2000" millsecond
    Given open the "configs.ListPage" page for uri "/configs/"
    Then the data name is "<name>" then i will see "{'column':'4','name':'详情'}" button

    Examples:
      | function | group                       | name               |
      | 读取       | AutoTestRoleWithAllResource | AutoTestUserCreate |

  Scenario Outline: 授权读取+分配（RZY-666）
    When I check "读取,分配" from the "{'IntraGroupManagement':['<group>']}"
    And I click the "SaveButton" button
    And I will see the success message "保存成功"
    And I logout current user
    And open the "LoginPage" page for uri "/auth/login/"
    When I set the parameter "Username" with value "AutoTest"
    And I set the parameter "Password" with value "qqqqq11111"
    And I click the "LoginButton" button
    And I wait for "2000" millsecond
    Given open the "configs.ListPage" page for uri "/configs/"
    Then the data name is "<name>" then i will see "{'column':'4','name':'详情'}" button
    Then the data name is "<name>" then i will see "{'column':'5','name':'复制'}" button
    When the data name is "<name>" then i click the "复制" button
    And I refresh the website
    Then I will see the search result contains "{'column':'0','name':'<name>(1)'}"

    Examples:
      | group                       | name               |
      | AutoTestRoleWithAllResource | AutoTestUserCreate |

  Scenario Outline: 授权读取+编辑（RZY-667）（有bug未修复）
    When I check "读取,编辑" from the "{'IntraGroupManagement':['<group>']}"
    And I click the "SaveButton" button
    And I will see the success message "保存成功"
    And I logout current user
    And open the "LoginPage" page for uri "/auth/login/"
    When I set the parameter "Username" with value "AutoTest"
    And I set the parameter "Password" with value "qqqqq11111"
    And I click the "LoginButton" button
    And I wait for "2000" millsecond
    Given open the "configs.ListPage" page for uri "/configs/"
    Then the data name is "<name>" then i will see "{'column':'4','name':'详情'}" button
    Then the data name is "<name>" then i will see "{'column':'5','name':'编辑 分组'}" button

    Examples:
      | group                       | name               |
      | AutoTestRoleWithAllResource | AutoTestUserCreate |

  Scenario Outline: 授权读取+删除（RZY-668）
    When I check "读取,删除" from the "{'IntraGroupManagement':['AutoTestRoleWithAllResource']}"
    And I click the "SaveButton" button
    And I will see the success message "保存成功"
    And I logout current user
    And open the "LoginPage" page for uri "/auth/login/"
    When I set the parameter "Username" with value "AutoTest"
    And I set the parameter "Password" with value "qqqqq11111"
    And I click the "LoginButton" button
    And I wait for "2000" millsecond
    Given open the "configs.ListPage" page for uri "/configs/"
    Then the data name is "<name>" then i will see "{'column':'4','name':'详情'}" button
    Then the data name is "<name>" then i will see "{'column':'5','name':'删除'}" button
    When the data name is "<name>(1)" then i click the "删除" button
    And I click the "EnsureButton" button
    And I wait for "Message" will be invisible
    And I wait for "1500" millsecond
    And I will see the message "删除成功"

    Examples:
      | name               |
      | AutoTestUserCreate |

  Scenario Outline: 授权读取+分配+编辑（RZY-669）
    When I check "读取,分配,编辑" from the "{'IntraGroupManagement':['AutoTestRoleWithAllResource']}"
    And I click the "SaveButton" button
    And I will see the success message "保存成功"
    And I logout current user
    And open the "LoginPage" page for uri "/auth/login/"
    When I set the parameter "Username" with value "AutoTest"
    And I set the parameter "Password" with value "qqqqq11111"
    And I click the "LoginButton" button
    And I wait for "2000" millsecond
    Given open the "configs.ListPage" page for uri "/configs/"
    Then the data name is "<name>" then i will see "{'column':'4','name':'详情'}" button
    Then the data name is "<name>" then i will see "{'column':'5','name':'编辑 复制 分组'}" button
    When the data name is "<name>" then i click the "复制" button
    And I refresh the website
    When the data name is "<name>(1)" then i click the "编辑" button
    Then I will see the "configs.CreatePage" page
    And I click the "NextButton" button
    And I click the "SwitchButton" button
    And I click the "NextButton" button
    Then I wait for "ConfigDone" will be visible

    Examples:
      | name               |
      | AutoTestUserCreate |

  Scenario Outline: 授权读取+分配+删除（RZY-670）
    When I check "读取,分配,删除" from the "{'IntraGroupManagement':['AutoTestRoleWithAllResource']}"
    And I click the "SaveButton" button
    And I will see the success message "保存成功"
    And I logout current user
    And open the "LoginPage" page for uri "/auth/login/"
    When I set the parameter "Username" with value "AutoTest"
    And I set the parameter "Password" with value "qqqqq11111"
    And I click the "LoginButton" button
    And I wait for "2000" millsecond
    Given open the "configs.ListPage" page for uri "/configs/"
    Then the data name is "<name>" then i will see "{'column':'4','name':'详情'}" button
    Then the data name is "<name>" then i will see "{'column':'5','name':'复制 删除'}" button
    When the data name is "<name>(1)" then i click the "删除" button
    And I click the "EnsureButton" button
    And I wait for "Message" will be invisible
    And I wait for "1500" millsecond
    And I will see the message "删除成功"

    Examples:
      | name               |
      | AutoTestUserCreate |

  Scenario Outline: 授权读取+编辑+删除（RZY-671）（有bug）
    When I check "读取,编辑,删除" from the "{'IntraGroupManagement':['AutoTestRoleWithAllResource']}"
    And I click the "SaveButton" button
    And I will see the success message "保存成功"
    And I logout current user
    And open the "LoginPage" page for uri "/auth/login/"
    When I set the parameter "Username" with value "AutoTest"
    And I set the parameter "Password" with value "qqqqq11111"
    And I click the "LoginButton" button
    And I wait for "2000" millsecond
    Given open the "configs.ListPage" page for uri "/configs/"
    Then the data name is "<name>" then i will see "{'column':'4','name':'详情'}" button
    Then the data name is "<name>" then i will see "{'column':'5','name':'编辑 分组 删除'}" button

    Examples:
      | name               |
      | AutoTestUserCreate |

  Scenario Outline: 授权读取+分配+编辑+删除（RZY-663）
    When I check "读取,分配,编辑,删除" from the "{'IntraGroupManagement':['AutoTestRoleWithAllResource']}"
    And I click the "SaveButton" button
    And I will see the success message "保存成功"
    And I logout current user
    And open the "LoginPage" page for uri "/auth/login/"
    When I set the parameter "Username" with value "AutoTest"
    And I set the parameter "Password" with value "qqqqq11111"
    And I click the "LoginButton" button
    And I wait for "2000" millsecond
    Given open the "configs.ListPage" page for uri "/configs/"
    Then the data name is "<name>" then i will see "{'column':'4','name':'详情'}" button
    Then the data name is "<name>" then i will see "{'column':'5','name':'编辑 复制 分组 删除'}" button

    Examples:
      | name               |
      | AutoTestUserCreate |
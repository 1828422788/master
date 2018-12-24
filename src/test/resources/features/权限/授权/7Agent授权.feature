@authorization @all @smoke @roleSmoke
Feature: 角色授权Agent管理

  Background:
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "AutoTestRole" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    Then I click the "{'TabButton':'Agent 管理'}" button

  Scenario: 授权新建Agent分组
    When I "checked" the checkbox which name is "新建 Agent 分组"
    And I click the "SaveButton" button
    And I will see the success message "保存成功"
    And I logout current user
    And open the "LoginPage" page for uri "/auth/login/"
    When I set the parameter "Username" with value "AutoTest"
    And I set the parameter "Password" with value "qqqqq11111"
    And I click the "LoginButton" button
    And I wait for "2000" millsecond
    And open the "resourceGroups.ListPage" page for uri "/account/resourcegroups/"
    And I click the "CreateResourceGroup" button
    Then I will see the "resourceGroups.CreatePage" page
    When I set the parameter "ResourceGroupName" with value "AgentGroupByAutoTest"
    And I choose the "Agent 管理" from the "ResourceGroupType"
    And I choose the "AutoTestRole" from the "ResourceGroupOwner"
    And I click the "CreateButton" button
    Then I will see the success message "创建成功"

  Scenario Outline: 授权读取
    When I check "读取" from the "{'GroupManagement':['<name>']}"
    And I click the "SaveButton" button
    And I will see the success message "保存成功"
    And I logout current user
    And open the "LoginPage" page for uri "/auth/login/"
    When I set the parameter "Username" with value "AutoTest"
    And I set the parameter "Password" with value "qqqqq11111"
    And I click the "LoginButton" button
    And I wait for "2000" millsecond
    And open the "resourceGroups.ListPage" page for uri "/account/resourcegroups/"
    And I will see the search result contains "{'column':'0','name':'<name>'}"
    And the data name is "<name>" then i click the "跳转" button
    Then the page's title will be "Agent 管理"

    Examples:
      | name                        |
      | AutoTestRoleWithAllResource |

  Scenario Outline: 授权读取+编辑
    When I check "读取,编辑" from the "{'GroupManagement':['<name>']}"
    And I click the "SaveButton" button
    And I will see the success message "保存成功"
    And I logout current user
    And open the "LoginPage" page for uri "/auth/login/"
    When I set the parameter "Username" with value "AutoTest"
    And I set the parameter "Password" with value "qqqqq11111"
    And I click the "LoginButton" button
    And I wait for "2000" millsecond
    And open the "resourceGroups.ListPage" page for uri "/account/resourcegroups/"
    And the data name is "<name>" then i click the "编辑" button
    Then the page's title will be "Agent 管理"

    Examples:
      | name                        |
      | AutoTestRoleWithAllResource |
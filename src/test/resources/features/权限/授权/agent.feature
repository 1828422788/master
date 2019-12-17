@auth
Feature: 权限-agent

  Scenario: 新建agent分组
    Given open the "agent.CreatePage" page for uri "/sources/input/agent/group/new/"
    And I set the parameter "GroupName" with value "TestAuth"
    And I choose the "__user_验证授权用户__" from the "RoleDropdown"
    And I click the "Create" button
    Then I will see the message "创建成功"

  Scenario: 修改当前主机的分组
    Given open the "agent.ListPage" page for uri "/sources/input/agent/"
    When the data properties is "{'column':'1','name':'rizhiyi_server_host'}" then i click the "分组" button
    And I choose the "TestAuth" from the "AgentGroup"
    And I click the "Complete" button
    Then I wait for loading invisible

  Scenario Outline: 验证无读取权限
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "__user_AutoTest__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    Then I click the "{'TabButton':'Agent 管理'}" button
    And I wait for "Loading" will be invisible
    And I "checked" the label before "<name>"
    And I "unchecked" the label before "<name>"
    And I click the "SaveButton" button
    And I will see the success message "保存成功"
    Then I click the "{'TabButton':'功能'}" button
    And I wait for "Loading" will be invisible
    When I "checked" the checkbox which name is "全选"
    And I click the "SaveButton" button
    Given I will see the "PublicNavBarPage" page
    And I wait for "Dashboard" will be visible
    And I logout current user
    And I wait for title change text to "登录"
    And open the "LoginPage" page for uri "/auth/login/"
    When I set the parameter "Username" with value "AutoTest"
    And I set the parameter "Password" with value "all123456"
    And I click the "LoginButton" button
    And I wait for title change text to "仪表盘|搜索"
    Given open the "agent.ListPage" page for uri "/sources/input/agent/"
    And I wait for loading invisible
    Then I will see the search result "{'column':'1','name':'rizhiyi_server_host','contains':'no'}" with properties

    Examples:
      | name     |
      | TestAuth |

  Scenario: 验证读权限
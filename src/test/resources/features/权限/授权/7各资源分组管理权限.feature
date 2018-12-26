@authorization @all @smoke @roleSmoke
Feature: 角色授权资源读取（最好查看下截图）

  Background:
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "AutoTestRole" then i click the "授权" button
    Then I will see the "roles.AuthorizationPage" page

  Scenario Outline: 授权新建分组并验证无任何读取权限时的列表显示结果
    When I click the "{'TabButton':'<tab>'}" button
    When I "checked" the checkbox which name is "<checkName>"
    And I click the "SaveButton" button
    And I will see the success message "保存成功"
    And I logout current user
    And open the "LoginPage" page for uri "/auth/login/"
    When I set the parameter "Username" with value "AutoTest"
    And I set the parameter "Password" with value "qqqqq11111"
    And I click the "LoginButton" button
    And I wait for "2000" millsecond
    And open the "resourceGroups.ListPage" page for uri "/account/resourcegroups/"
    Then I will see the search result "{'column':'1','name':'<tab>','contains':'no'}"
    And I click the "CreateResourceGroup" button
    Then I will see the "resourceGroups.CreatePage" page
    When I set the parameter "ResourceGroupName" with value "<groupName>"
    And I choose the "<tab>" from the "ResourceGroupType"
    And I choose the "AutoTestRole" from the "ResourceGroupOwner"
    And I click the "CreateButton" button
    Then I will see the success message "创建成功"

    Examples:
      | tab      | checkName   | groupName                 |
      | Agent 管理 | 新建 Agent 分组 | AgentGroupByAutoTest      |
      | 监控       | 新建监控分组      | AlertGroupByAutoTest      |
      | 仪表盘      | 新建仪表盘分组     | DashboardGroupByAutoTest  |
      | 字典       | 新建字典分组      | DictionaryGroupByAutoTest |
      | 知识       | 新建知识分组      | KnowledgeGroupByAutoTest  |
      | 搜索宏      | 新建搜索宏分组     | MacroGroupByAutoTest      |
      | 字段提取     | 新建字段提取分组    | ConfigGroupByAutoTest     |

  Scenario Outline: 授权读取
    When I click the "{'TabButton':'<tab>'}" button
    And I check "读取" from the "{'GroupManagement':['AutoTestRoleWithAllResource']}"
    And I click the "SaveButton" button
    And I will see the success message "保存成功"
    And I logout current user
    And open the "LoginPage" page for uri "/auth/login/"
    When I set the parameter "Username" with value "AutoTest"
    And I set the parameter "Password" with value "qqqqq11111"
    And I click the "LoginButton" button
    And I wait for "2000" millsecond
    And open the "resourceGroups.ListPage" page for uri "/account/resourcegroups/"
    And I will see the search result contains "{'column':'1','name':'<tab>'}"
    And the data name is "{'column':'1','name':'<tab>'}" then i will see "{'column':'5','name':'跳转'}" button
    And the data name is "{'column':'1','name':'<tab>'}" then i click the "跳转" button
    Then the page's title will be "<title>"

    Examples:
      | tab      | title     |
      | Agent 管理 | Agent 管理  |
      | 监控       | 监控        |
      | 仪表盘      | 列表 \| 仪表盘 |

  Scenario Outline: 授权读取+编辑
    When I click the "{'TabButton':'<tab>'}" button
    When I check "读取,编辑" from the "{'GroupManagement':['AutoTestRoleWithAllResource']}"
    And I click the "SaveButton" button
    And I will see the success message "保存成功"
    And I logout current user
    And open the "LoginPage" page for uri "/auth/login/"
    When I set the parameter "Username" with value "AutoTest"
    And I set the parameter "Password" with value "qqqqq11111"
    And I click the "LoginButton" button
    And I wait for "2000" millsecond
    And open the "resourceGroups.ListPage" page for uri "/account/resourcegroups/"
    And the data name is "{'column':'1','name':'<tab>'}" then i will see "{'column':'5','name':'编辑 所属应用 跳转'}" button
    And the data name is "{'column':'1','name':'<tab>'}" then i click the "编辑" button
    And I will see the "resourceGroups.EditPage" page
    And I click the "SaveButton" button
    Then I will see the success message "保存成功"

    Examples:
      | tab      |
      | Agent 管理 |
      | 监控       |
      | 仪表盘      |

  Scenario Outline: 授权读取+编辑+删除
    When I click the "{'TabButton':'<tab>'}" button
    When I check "读取,编辑,删除" from the "{'GroupManagement':['AutoTestRoleWithAllResource']}"
    And I click the "SaveButton" button
    And I will see the success message "保存成功"
    And I logout current user
    And open the "LoginPage" page for uri "/auth/login/"
    When I set the parameter "Username" with value "AutoTest"
    And I set the parameter "Password" with value "qqqqq11111"
    And I click the "LoginButton" button
    And I wait for "2000" millsecond
    And open the "resourceGroups.ListPage" page for uri "/account/resourcegroups/"
    And the data name is "{'column':'1','name':'<tab>'}" then i will see "{'column':'5','name':'编辑 所属应用 跳转 删除'}" button
    And the data name is "{'column':'1','name':'<tab>'}" then i click the "删除" button
    Then I will see the message "确认删除 [AutoTestRoleWithAllResource] ?"

    Examples:
      | tab      |
      | Agent 管理 |
      | 监控       |
      | 仪表盘      |
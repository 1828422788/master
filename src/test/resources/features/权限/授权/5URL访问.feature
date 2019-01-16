@authorization @all @smoke @roleSmoke
Feature: 角色授权URL访问（RZY-558、RZY-559）

  Background:
    Given open the "roles.ListPage" page for uri "/account/roles/"

  Scenario Outline: 无任何URL访问权限时（RZY-558）
    Given I logout current user
    And open the "LoginPage" page for uri "/auth/login/"
    When I set the parameter "Username" with value "<username>"
    And I set the parameter "Password" with value "<password>"
    And I click the "LoginButton" button
    And I will see the "PublicNavBarPage" page
    And I click the "Setting" button
    And I will see the element value in json "<value>"

    Examples:
      | username | password   | value                        |
      | AutoTest | qqqqq11111 | {'NonPrivileged':'您暂无设置权限。'} |

  Scenario Outline: 赋予URL访问权限
    Given the data name is "AutoTestRole" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    And I click the "{'TabButton':'URL 访问'}" button
    And I "checked" the checkbox which name is "<name>"
    And I click the "SaveButton" button
    And I logout current user
    And open the "LoginPage" page for uri "/auth/login/"
    When I set the parameter "Username" with value "AutoTest"
    And I set the parameter "Password" with value "qqqqq11111"
    And I click the "LoginButton" button
    And I wait for "2000" millsecond
    And I will see the "PublicNavBarPage" page
    And I click the "<navigate>" button
    Then I will see the element "<elementName>" name is "<functionName>"
    And open the "PublicNavBarPage" page for uri "<uri>"
    Then the page's title will be "<title>"

    Examples:
      | name | navigate | elementName | functionName     | uri                      | title  |
      | 资源分组 | Setting  | Auth        | 资源分组             | /account/resourcegroups/ | 资源分组管理 |
      | 角色权限 | Setting  | Auth        | 角色权限资源分组         | /account/roles/          | 角色列表   |
      | 使用限额 | Status   | Running     | 使用限额             | /account/usage/          | 使用限额   |
      | 用户分组 | Setting  | Auth        | 角色权限资源分组用户分组     | /account/usergroups/     | 用户分组   |
      | 用户管理 | Setting  | Auth        | 角色权限资源分组用户分组用户管理 | /account/users/          | 用户管理   |
      | 监控   | Setting  | Source      | 监控               | /alerts/                 | 监控     |
#    |应用    |Application|


  Scenario Outline: 勾选所有URL访问权限（RZY-559）
    Given the data name is "AutoTestRole" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    And I click the "{'TabButton':'URL 访问'}" button
    When I click the "ChooseAllCheckBoxes" button
    And I click the "SaveButton" button
    And I logout current user
    And open the "LoginPage" page for uri "/auth/login/"
    When I set the parameter "Username" with value "<usernameValue>"
    And I set the parameter "Password" with value "<passwordValue>"
    And I click the "LoginButton" button
    And I will see the "PublicNavBarPage" page
    And I will see the element value in json "<value>"
    And I click the "Setting" button
    And I will see the element value in json "<value1>"

    Examples:
      | usernameValue | passwordValue | value                                                                                                                                     | value1                                                                                                                                                                                                                                                                                                                                                                    |
      | AutoTest      | qqqqq11111    | {'Dashboard':'仪表盘','LocateSearchPage':'搜索','AlertsListPage':'监控','TimedTaskPage':'定时任务','Report':'报表','Trend':'趋势图','KnowledgePage':'知识'} | {'Resource1':'搜索','Resource2':'仪表盘','Resource3':'监控','Resource4':'定时任务','Resource5':'报表','Resource7':'知识库','Resource8':'搜索宏','Resource9':'字段提取','Resource10':'事件操作','Resource11':'拓扑图','Resource12':'趋势图','Data1':'日志来源','Data2':'Agent 管理','Data3':'路由配置','Data5':'本地上传','Data6':'备份策略','Authority1':'角色权限','Authority2':'资源分组','Authority3':'用户分组','Authority4':'用户管理'} |
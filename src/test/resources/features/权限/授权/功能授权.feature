@authorization @all @smoke
Feature: 角色授权功能（校验URL）

#  Background:
#    Given open the "roles.ListPage" page for uri "/account/roles/"
#    And the data name is "AutoTestRole" then i click the "授权" button
#    And I will see the "roles.AuthorizationPage" page
#    Then I click the "{'TabButton':'功能'}" button
#    And I wait for "Loading" will be invisible

  Scenario Outline: 验证无任何权限
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "AutoTestRole" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    Then I click the "{'TabButton':'功能'}" button
    And I wait for "Loading" will be invisible
    When I "checked" the checkbox which name is "全选"
    And I "unchecked" the checkbox which name is "全选"
    And I click the "SaveButton" button
    Then I will see the success message "保存成功"
    Given I will see the "PublicNavBarPage" page
    And I wait for "Dashboard" will be visible
    Given I logout current user
    And I wait for title change text to "登录"
    And open the "LoginPage" page for uri "/auth/login/"
    When I set the parameter "Username" with value "AutoTest"
    And I set the parameter "Password" with value "all123456"
    And I click the "LoginButton" button
    And I wait for "2000" millsecond
    And I will see the "PublicNavBarPage" page
    And I click the "Setting" button
    Then I will see the element "Menu" name is "<settingMenu>"
    And I click the "System" button
    Then I will see the element "Menu" name is "<systemMenu>"
    And I click the "Help" button
    Then I will see the element "Menu" name is "<helpMenu>"
    And open the "LoginPage" page for uri "/alerts/"
    Then the page's title will be "<alerts>"
    And open the "LoginPage" page for uri "/plugins/"
    Then the page's title will be "<plugins>"
    And open the "LoginPage" page for uri "/payments/"
    Then the page's title will be "<payments>"
    And open the "LoginPage" page for uri "/ingestpriority/"
    Then the page's title will be "<ingestpriority>"
    And open the "LoginPage" page for uri "/queryscopes/"
    Then the page's title will be "<queryscopes>"
    And open the "LoginPage" page for uri "/search/"
    Then the page's title will be "<search>"
    And open the "LoginPage" page for uri "/sources/input/agent/"
    Then the page's title will be "<agent>"
    And open the "LoginPage" page for uri "/account/usage/"
    Then the page's title will be "<accountUsage>"
    And open the "LoginPage" page for uri "/dictionary/"
    Then the page's title will be "<dictionary>"
    And open the "LoginPage" page for uri "/macro/"
    Then the page's title will be "<macro>"
    And open the "LoginPage" page for uri "/macro/new/"
    Then the page's title will be "403 Permission Denied"
    And open the "LoginPage" page for uri "/usage/"
    Then the page's title will be "<usage>"
    And open the "LoginPage" page for uri "/reports/"
    Then the page's title will be "<reports>"
    And open the "LoginPage" page for uri "/reports/new/"
    Then the page's title will be "403 Permission Denied"
    And open the "LoginPage" page for uri "/trend/"
    Then the page's title will be "<trend>"
    And open the "LoginPage" page for uri "/trend/new/"
    Then the page's title will be "403 Permission Denied"
    And open the "LoginPage" page for uri "/schedule/"
    Then the page's title will be "<schedule>"
    And open the "LoginPage" page for uri "/backup/"
    Then the page's title will be "<backup>"
    And open the "LoginPage" page for uri "/sources/input/os/"
    Then the page's title will be "<sourcesInput>"
    And open the "LoginPage" page for uri "/account/roles/"
    Then the page's title will be "<roles>"
    And open the "LoginPage" page for uri "/account/roles/new/"
    Then the page's title will be "403 Permission Denied"
    And open the "LoginPage" page for uri "/account/users/"
    Then the page's title will be "<users>"
    And open the "LoginPage" page for uri "/account/users/new/"
    Then the page's title will be "403 Permission Denied"
    And open the "LoginPage" page for uri "/knowledge/"
    Then the page's title will be "<knowledge>"
    And open the "LoginPage" page for uri "/knowledge/new/"
    Then the page's title will be "403 Permission Denied"
    And open the "LoginPage" page for uri "/dashboard/"
    Then the page's title will be "<dashboard>"
    And open the "LoginPage" page for uri "/account/usergroups/"
    Then the page's title will be "<usergroups>"
    And open the "LoginPage" page for uri "/account/usergroups/new/"
    Then the page's title will be "403 Permission Denied"
    And open the "LoginPage" page for uri "/app/galaxee/manager/"
    Then the page's title will be "<galaxee>"
    And open the "LoginPage" page for uri "/app/machine_learning/showcase/"
    Then the page's title will be "<machine_learning>"
    And open the "LoginPage" page for uri "/app/lynxee/overview/"
    Then the page's title will be "<lynxee>"
    And open the "LoginPage" page for uri "/topology/"
    Then the page's title will be "<topology>"
    And open the "LoginPage" page for uri "/topology/new/"
    Then the page's title will be "403 Permission Denied"
    And open the "LoginPage" page for uri "/configs/"
    Then the page's title will be "<configs>"
    And open the "LoginPage" page for uri "/configs/new/"
    Then the page's title will be "403 Permission Denied"
    And open the "LoginPage" page for uri "/tokens/"
    Then the page's title will be "<tokens>"
    And open the "LoginPage" page for uri "/docs/"
    Then the page's title will be "<docs>"
    And open the "LoginPage" page for uri "/resource/"
    Then the page's title will be "<resource>"
    And open the "LoginPage" page for uri "/dataset/"
    Then the page's title will be "<dataset>"
    And open the "LoginPage" page for uri "/apikey/"
    Then the page's title will be "<apikey>"
    And open the "LoginPage" page for uri "/savedsearches/"
    Then the page's title will be "<savedsearches>"

    Examples:
      | alerts                | plugins               | payments              | ingestpriority        | queryscopes           | search                | agent                 | accountUsage          | dictionary            | macro                 | usage                 | reports               | trend                 | schedule              | backup                | sourcesInput          | roles                 | users                 | knowledge             | dashboard             | usergroups            | galaxee               | machine_learning      | lynxee                | topology              | configs               | tokens                | docs                  | savedsearches         | resource              | dataset               | apikey                | settingMenu | systemMenu       | helpMenu  |
      | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 您暂无设置权限。    | 运行 (系统版本: 3.1.0) | 帮助\n联系日志易 |

  Scenario Outline: 验证其他权限
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "AutoTestRole" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    Then I click the "{'TabButton':'功能'}" button
    And I wait for "Loading" will be invisible
    When I "checked" the checkbox which name is "全选"
    And I "unchecked" the checkbox which name is "全选"
    When I "checked" the checkbox which name is "<function>"
    And I click the "SaveButton" button
    Then I will see the success message "保存成功"
    Given I will see the "PublicNavBarPage" page
    And I wait for "Dashboard" will be visible
    Given I logout current user
    And I wait for title change text to "登录"
    And open the "LoginPage" page for uri "/auth/login/"
    When I set the parameter "Username" with value "AutoTest"
    And I set the parameter "Password" with value "all123456"
    And I click the "LoginButton" button
    And I wait for "2000" millsecond
    And I will see the "PublicNavBarPage" page
    And I click the "Setting" button
    Then I will see the element "Menu" name is "<settingMenu>"
    And I click the "System" button
    Then I will see the element "Menu" name is "<systemMenu>"
    And I click the "Help" button
    Then I will see the element "Menu" name is "<helpMenu>"
    And open the "LoginPage" page for uri "/alerts/"
    Then the page's title will be "<alerts>"
    And open the "PublicNavBarPage" page for uri "/plugins/"
    Then the page's title will be "<plugins>"
    And open the "LoginPage" page for uri "/payments/"
    Then the page's title will be "<payments>"
    And open the "LoginPage" page for uri "/ingestpriority/"
    Then the page's title will be "<ingestpriority>"
    And open the "LoginPage" page for uri "/queryscopes/"
    Then the page's title will be "<queryscopes>"
    And open the "LoginPage" page for uri "/search/"
    Then the page's title will be "<search>"
    And open the "LoginPage" page for uri "/sources/input/agent/"
    Then the page's title will be "<agent>"
    And open the "LoginPage" page for uri "/account/usage/"
    Then the page's title will be "<accountUsage>"
    And open the "LoginPage" page for uri "/dictionary/"
    Then the page's title will be "<dictionary>"
    And open the "LoginPage" page for uri "/macro/"
    Then the page's title will be "<macro>"
    And open the "LoginPage" page for uri "/usage/"
    Then the page's title will be "<usage>"
    And open the "LoginPage" page for uri "/reports/"
    Then the page's title will be "<reports>"
    And open the "LoginPage" page for uri "/reports/new/"
    Then the page's title will be "403 Permission Denied"
    And open the "LoginPage" page for uri "/trend/"
    Then the page's title will be "<trend>"
    And open the "LoginPage" page for uri "/trend/new/"
    Then the page's title will be "403 Permission Denied"
    And open the "LoginPage" page for uri "/schedule/"
    Then the page's title will be "<schedule>"
    And open the "LoginPage" page for uri "/backup/"
    Then the page's title will be "<backup>"
    And open the "LoginPage" page for uri "/sources/input/os/"
    Then the page's title will be "<sourcesInput>"
    And open the "LoginPage" page for uri "/account/roles/"
    Then the page's title will be "<roles>"
    And open the "LoginPage" page for uri "/account/roles/new/"
    Then the page's title will be "403 Permission Denied"
    And open the "LoginPage" page for uri "/account/users/"
    Then the page's title will be "<users>"
    And open the "LoginPage" page for uri "/account/users/new/"
    Then the page's title will be "403 Permission Denied"
    And open the "LoginPage" page for uri "/knowledge/"
    Then the page's title will be "<knowledge>"
    And open the "LoginPage" page for uri "/knowledge/new/"
    Then the page's title will be "403 Permission Denied"
    And open the "LoginPage" page for uri "/dashboard/"
    Then the page's title will be "<dashboard>"
    And open the "LoginPage" page for uri "/account/usergroups/"
    Then the page's title will be "<usergroups>"
    And open the "LoginPage" page for uri "/account/usergroups/new/"
    Then the page's title will be "403 Permission Denied"
    And open the "LoginPage" page for uri "/app/galaxee/manager/"
    Then the page's title will be "<galaxee>"
    And open the "LoginPage" page for uri "/app/machine_learning/showcase/"
    Then the page's title will be "<machine_learning>"
    And open the "LoginPage" page for uri "/app/lynxee/overview/"
    Then the page's title will be "<lynxee>"
    And open the "LoginPage" page for uri "/topology/"
    Then the page's title will be "<topology>"
    And open the "LoginPage" page for uri "/topology/new/"
    Then the page's title will be "403 Permission Denied"
    And open the "LoginPage" page for uri "/configs/"
    Then the page's title will be "<configs>"
    And open the "LoginPage" page for uri "/configs/new/"
    Then the page's title will be "403 Permission Denied"
    And open the "LoginPage" page for uri "/tokens/"
    Then the page's title will be "<tokens>"
    And open the "LoginPage" page for uri "/docs/"
    Then the page's title will be "<docs>"
    And open the "LoginPage" page for uri "/resource/"
    Then the page's title will be "<resource>"
    And open the "LoginPage" page for uri "/dataset/"
    Then the page's title will be "<dataset>"
    And open the "LoginPage" page for uri "/apikey/"
    Then the page's title will be "<apikey>"
    And open the "LoginPage" page for uri "/indexsettings/indexmatchrule/"
    Then the page's title will be "<index>"
    And open the "LoginPage" page for uri "/search/"
    Then the page's title will be "<search>"
    And open the "LoginPage" page for uri "/macro/new/"
    Then the page's title will be "403 Permission Denied"
    And open the "LoginPage" page for uri "/savedsearches/"
    Then the page's title will be "<savedsearches>"

    Examples:
      | function                                                                                        | alerts                | plugins | payments              | ingestpriority        | queryscopes           | search                | agent                 | accountUsage          | dictionary            | macro                 | usage                 | reports               | trend                 | schedule              | backup                | sourcesInput          | roles                 | users                 | knowledge             | dashboard             | usergroups            | galaxee               | machine_learning      | lynxee                | topology              | configs               | tokens                | docs                  | savedsearches         | resource              | dataset               | apikey                | index                 | search                | settingMenu                                  | systemMenu                       | helpMenu  |
      | 可查看告警插件                                                                                         | 403 Permission Denied | 告警插件    | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 您暂无设置权限。                                     | 运行 (系统版本: 3.1.0)                 | 帮助\n联系日志易 |
      | 可使用结算管理,可查看告警插件                                                                                 | 403 Permission Denied | 告警插件    | 结算管理                  | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 您暂无设置权限。                                     | 运行 (系统版本: 3.1.0)\n结算管理           | 帮助\n联系日志易 |
      | 可使用结算管理,可查看告警插件,可使用入库优先级                                                                        | 403 Permission Denied | 告警插件    | 结算管理                  | 入库优先级                 | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 数据\n入库优先级                                    | 运行 (系统版本: 3.1.0)\n结算管理           | 帮助\n联系日志易 |
      | 可使用结算管理,可查看告警插件,可使用入库优先级,可使用已存搜索                                                                | 403 Permission Denied | 告警插件    | 结算管理                  | 入库优先级                 | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 已存搜索                  | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 资源\n已存搜索\n数据\n入库优先级                          | 运行 (系统版本: 3.1.0)\n结算管理           | 帮助\n联系日志易 |
      | 可使用结算管理,可查看告警插件,可使用入库优先级,可使用已存搜索,可使用搜索权限                                                        | 403 Permission Denied | 告警插件    | 结算管理                  | 入库优先级                 | 搜索权限                  | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 已存搜索                  | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 资源\n已存搜索\n数据\n入库优先级\n权限\n搜索权限                | 运行 (系统版本: 3.1.0)\n结算管理           | 帮助\n联系日志易 |
      | 可使用结算管理,可查看告警插件,可使用入库优先级,可使用已存搜索,可使用搜索权限,可使用数据路由                                                | 403 Permission Denied | 告警插件    | 结算管理                  | 入库优先级                 | 搜索权限                  | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 已存搜索                  | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 路由配置                  | 403 Permission Denied | 资源\n已存搜索\n数据\n路由配置入库优先级\n权限\n搜索权限            | 运行 (系统版本: 3.1.0)\n结算管理           | 帮助\n联系日志易 |
      | 可使用结算管理,可查看告警插件,可使用入库优先级,可使用已存搜索,可使用搜索权限,可使用数据路由,可使用 Agent 管理                                   | 403 Permission Denied | 告警插件    | 结算管理                  | 入库优先级                 | 搜索权限                  | 403 Permission Denied | Agent 管理              | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 已存搜索                  | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 路由配置                  | 403 Permission Denied | 资源\n已存搜索\n数据\nAgent 管理路由配置入库优先级\n权限\n搜索权限    | 运行 (系统版本: 3.1.0)\n结算管理           | 帮助\n联系日志易 |
      | 可使用结算管理,可查看告警插件,可使用入库优先级,可使用已存搜索,可使用搜索权限,可使用数据路由,可使用 Agent 管理,可查看域使用额度                          | 403 Permission Denied | 告警插件    | 结算管理                  | 入库优先级                 | 搜索权限                  | 403 Permission Denied | Agent 管理              | 使用限额                  | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 已存搜索                  | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 路由配置                  | 403 Permission Denied | 资源\n已存搜索\n数据\nAgent 管理路由配置入库优先级\n权限\n搜索权限    | 运行 (系统版本: 3.1.0)\n使用限额 结算管理      | 帮助\n联系日志易 |
      | 可使用结算管理,可查看告警插件,可使用入库优先级,可使用已存搜索,可使用搜索权限,可使用数据路由,可使用 Agent 管理,可查看域使用额度,可使用字典管理                  | 403 Permission Denied | 告警插件    | 结算管理                  | 入库优先级                 | 搜索权限                  | 403 Permission Denied | Agent 管理              | 使用限额                  | 字典列表                  | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 已存搜索                  | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 路由配置                  | 403 Permission Denied | 资源\n已存搜索\n数据\nAgent 管理路由配置入库优先级\n权限\n搜索权限    | 运行 (系统版本: 3.1.0)\n使用限额 结算管理      | 帮助\n联系日志易 |
      | 可使用结算管理,可查看告警插件,可使用入库优先级,可使用已存搜索,可使用搜索权限,可使用数据路由,可使用 Agent 管理,可查看域使用额度,可使用字典管理,可使用搜索宏           | 403 Permission Denied | 告警插件    | 结算管理                  | 入库优先级                 | 搜索权限                  | 403 Permission Denied | Agent 管理              | 使用限额                  | 字典列表                  | 搜索宏                   | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 已存搜索                  | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 路由配置                  | 403 Permission Denied | 资源\n已存搜索搜索宏\n数据\nAgent 管理路由配置入库优先级\n权限\n搜索权限 | 运行 (系统版本: 3.1.0)\n使用限额 结算管理      | 帮助\n联系日志易 |
      | 可使用结算管理,可查看告警插件,可使用入库优先级,可使用已存搜索,可使用搜索权限,可使用数据路由,可使用 Agent 管理,可查看域使用额度,可使用字典管理,可使用搜索宏,可查看用户搜索用量 | 403 Permission Denied | 告警插件    | 结算管理                  | 入库优先级                 | 搜索权限                  | 403 Permission Denied | Agent 管理              | 使用限额                  | 字典列表                  | 搜索宏                   | 搜索用量                  | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 已存搜索                  | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 路由配置                  | 403 Permission Denied | 资源\n已存搜索搜索宏\n数据\nAgent 管理路由配置入库优先级\n权限\n搜索权限 | 运行 (系统版本: 3.1.0)\n使用限额 结算管理 搜索用量 | 帮助\n联系日志易 |

  Scenario Outline: 验证权限
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "AutoTestRole" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    Then I click the "{'TabButton':'功能'}" button
    And I wait for "Loading" will be invisible
    When I "checked" the checkbox which name is "全选"
    And I "unchecked" the checkbox which name is "全选"
    When I "checked" the checkbox which name is "<function>"
    And I click the "SaveButton" button
    Then I will see the success message "保存成功"
    Given I will see the "PublicNavBarPage" page
    And I wait for "Dashboard" will be visible
    Given I logout current user
    And I wait for title change text to "登录"
    And open the "LoginPage" page for uri "/auth/login/"
    When I set the parameter "Username" with value "AutoTest"
    And I set the parameter "Password" with value "all123456"
    And I click the "LoginButton" button
    And I wait for "2000" millsecond
    And open the "LoginPage" page for uri "/alerts/"
    Then the page's title will be "<alerts>"
    And open the "PublicNavBarPage" page for uri "/plugins/"
    Then the page's title will be "<plugins>"
    And I click the "Setting" button under some element
    Then I will see the element "Menu" name is "<settingMenu>"
    And I click the "System" button under some element
    Then I will see the element "Menu" name is "<systemMenu>"
    And I click the "Help" button under some element
    Then I will see the element "Menu" name is "<helpMenu>"
    Then I will see the element "Subnav" name is "<subnav>"
    And open the "LoginPage" page for uri "/payments/"
    Then the page's title will be "<payments>"
    And open the "LoginPage" page for uri "/ingestpriority/"
    Then the page's title will be "<ingestpriority>"
    And open the "LoginPage" page for uri "/queryscopes/"
    Then the page's title will be "<queryscopes>"
    And open the "LoginPage" page for uri "/search/"
    Then the page's title will be "<search>"
    And open the "LoginPage" page for uri "/sources/input/agent/"
    Then the page's title will be "<agent>"
    And open the "LoginPage" page for uri "/account/usage/"
    Then the page's title will be "<accountUsage>"
    And open the "LoginPage" page for uri "/dictionary/"
    Then the page's title will be "<dictionary>"
    And open the "LoginPage" page for uri "/macro/"
    Then the page's title will be "<macro>"
    And open the "LoginPage" page for uri "/usage/"
    Then the page's title will be "<usage>"
    And open the "LoginPage" page for uri "/reports/"
    Then the page's title will be "<reports>"
    And open the "LoginPage" page for uri "/trend/"
    Then the page's title will be "<trend>"
    And open the "LoginPage" page for uri "/schedule/"
    Then the page's title will be "<schedule>"
    And open the "LoginPage" page for uri "/backup/"
    Then the page's title will be "<backup>"
    And open the "LoginPage" page for uri "/sources/input/os/"
    Then the page's title will be "<sourcesInput>"
    And open the "LoginPage" page for uri "/account/roles/"
    Then the page's title will be "<roles>"
    And open the "LoginPage" page for uri "/account/users/"
    Then the page's title will be "<users>"
    And open the "LoginPage" page for uri "/knowledge/"
    Then the page's title will be "<knowledge>"
    And open the "LoginPage" page for uri "/dashboard/"
    Then the page's title will be "<dashboard>"
    And open the "LoginPage" page for uri "/account/usergroups/"
    Then the page's title will be "<usergroups>"
    And open the "LoginPage" page for uri "/app/galaxee/manager/"
    Then the page's title will be "<galaxee>"
    And open the "LoginPage" page for uri "/app/machine_learning/showcase/"
    Then the page's title will be "<machine_learning>"
    And open the "LoginPage" page for uri "/app/lynxee/overview/"
    Then the page's title will be "<lynxee>"
    And open the "LoginPage" page for uri "/topology/"
    Then the page's title will be "<topology>"
    And open the "LoginPage" page for uri "/configs/"
    Then the page's title will be "<configs>"
    And open the "LoginPage" page for uri "/tokens/"
    Then the page's title will be "<tokens>"
    And open the "LoginPage" page for uri "/docs/"
    Then the page's title will be "<docs>"
    And open the "LoginPage" page for uri "/savedsearches/"
    Then the page's title will be "<savedsearches>"
    And open the "LoginPage" page for uri "/resource/"
    Then the page's title will be "<resource>"
    And open the "LoginPage" page for uri "/dataset/"
    Then the page's title will be "<dataset>"
    And open the "LoginPage" page for uri "/apikey/"
    Then the page's title will be "<apikey>"
    And open the "LoginPage" page for uri "/indexsettings/indexmatchrule/"
    Then the page's title will be "<index>"
    And open the "LoginPage" page for uri "/search/"
    Then the page's title will be "<searchList>"
#    And open the "LoginPage" page for uri "/configs/new/"
#    Then the page's title will be "403 Permission Denied"
#    And open the "LoginPage" page for uri "/topology/new/"
#    Then the page's title will be "403 Permission Denied"
#    And open the "LoginPage" page for uri "/account/usergroups/new/"
#    Then the page's title will be "403 Permission Denied"
#    And open the "LoginPage" page for uri "/knowledge/new/"
#    Then the page's title will be "403 Permission Denied"
#    And open the "LoginPage" page for uri "/account/roles/new/"
#    Then the page's title will be "403 Permission Denied"
#    And open the "LoginPage" page for uri "/account/users/new/"
#    Then the page's title will be "403 Permission Denied"
#    And open the "LoginPage" page for uri "/macro/new/"
#    Then the page's title will be "403 Permission Denied"
#    And open the "LoginPage" page for uri "/reports/new/"
#    Then the page's title will be "403 Permission Denied"
#    And open the "LoginPage" page for uri "/trend/new/"
#    Then the page's title will be "403 Permission Denied"
    Given I logout current user
    And I wait for title change text to "登录"

    Examples:
      | function                                                                                                                                                                                                                                       | alerts                | plugins | subnav             | payments | ingestpriority | queryscopes | search                | agent    | accountUsage | dictionary | macro | usage | reports | trend                 | schedule              | backup                | sourcesInput          | roles                 | users                 | knowledge             | dashboard             | usergroups            | galaxee               | machine_learning      | lynxee                | topology              | configs               | tokens                | docs                  | savedsearches | resource              | dataset               | apikey                | index | searchList            | settingMenu                                                                                     | systemMenu                                 | helpMenu      |
      | 可使用结算管理,可查看告警插件,可使用入库优先级,可使用已存搜索,可使用搜索权限,可使用数据路由,可使用 Agent 管理,可查看域使用额度,可使用字典管理,可使用搜索宏,可查看用户搜索用量,可使用报表                                                                                                                                          | 403 Permission Denied | 告警插件    | 报表                 | 结算管理     | 入库优先级          | 搜索权限        | 403 Permission Denied | Agent 管理 | 使用限额         | 字典列表       | 搜索宏   | 搜索用量  | 报表      | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 已存搜索          | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 路由配置  | 403 Permission Denied | 资源\n报表已存搜索搜索宏\n数据\nAgent 管理路由配置入库优先级\n权限\n搜索权限                                                  | 运行 (系统版本: 3.1.0)\n使用限额 结算管理 搜索用量           | 帮助\n联系日志易     |
      | 可使用结算管理,可查看告警插件,可使用入库优先级,可使用已存搜索,可使用搜索权限,可使用数据路由,可使用 Agent 管理,可查看域使用额度,可使用字典管理,可使用搜索宏,可查看用户搜索用量,可使用报表,可使用趋势图                                                                                                                                   | 403 Permission Denied | 告警插件    | 报表趋势图              | 结算管理     | 入库优先级          | 搜索权限        | 403 Permission Denied | Agent 管理 | 使用限额         | 字典列表       | 搜索宏   | 搜索用量  | 报表      | 趋势图                   | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 已存搜索          | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 路由配置  | 403 Permission Denied | 资源\n报表趋势图已存搜索搜索宏\n数据\nAgent 管理路由配置入库优先级\n权限\n搜索权限                                               | 运行 (系统版本: 3.1.0)\n使用限额 结算管理 搜索用量           | 帮助\n联系日志易     |
      | 可使用结算管理,可查看告警插件,可使用入库优先级,可使用已存搜索,可使用搜索权限,可使用数据路由,可使用 Agent 管理,可查看域使用额度,可使用字典管理,可使用搜索宏,可查看用户搜索用量,可使用报表,可使用趋势图,可使用定时任务                                                                                                                           | 403 Permission Denied | 告警插件    | 定时任务报表趋势图          | 结算管理     | 入库优先级          | 搜索权限        | 403 Permission Denied | Agent 管理 | 使用限额         | 字典列表       | 搜索宏   | 搜索用量  | 报表      | 趋势图                   | 定时任务                  | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 已存搜索          | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 路由配置  | 403 Permission Denied | 资源\n定时任务报表趋势图已存搜索搜索宏\n数据\nAgent 管理路由配置入库优先级\n权限\n搜索权限                                           | 运行 (系统版本: 3.1.0)\n使用限额 结算管理 搜索用量           | 帮助\n联系日志易     |
      | 可使用结算管理,可查看告警插件,可使用入库优先级,可使用已存搜索,可使用搜索权限,可使用数据路由,可使用 Agent 管理,可查看域使用额度,可使用字典管理,可使用搜索宏,可查看用户搜索用量,可使用报表,可使用趋势图,可使用定时任务,可使用备份                                                                                                                     | 403 Permission Denied | 告警插件    | 定时任务报表趋势图          | 结算管理     | 入库优先级          | 搜索权限        | 403 Permission Denied | Agent 管理 | 使用限额         | 字典列表       | 搜索宏   | 搜索用量  | 报表      | 趋势图                   | 定时任务                  | 数据备份                  | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 已存搜索          | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 路由配置  | 403 Permission Denied | 资源\n定时任务报表趋势图已存搜索搜索宏\n数据\nAgent 管理路由配置入库优先级备份策略\n权限\n搜索权限                                       | 运行 (系统版本: 3.1.0)\n使用限额 结算管理 搜索用量           | 帮助\n联系日志易     |
      | 可使用结算管理,可查看告警插件,可使用入库优先级,可使用已存搜索,可使用搜索权限,可使用数据路由,可使用 Agent 管理,可查看域使用额度,可使用字典管理,可使用搜索宏,可查看用户搜索用量,可使用报表,可使用趋势图,可使用定时任务,可使用备份,可使用本地上传                                                                                                             | 403 Permission Denied | 告警插件    | 定时任务报表趋势图          | 结算管理     | 入库优先级          | 搜索权限        | 403 Permission Denied | Agent 管理 | 使用限额         | 字典列表       | 搜索宏   | 搜索用量  | 报表      | 趋势图                   | 定时任务                  | 数据备份                  | 本地上传                  | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 已存搜索          | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 路由配置  | 403 Permission Denied | 资源\n定时任务报表趋势图已存搜索搜索宏\n数据\nAgent 管理路由配置入库优先级本地上传备份策略\n权限\n搜索权限                                   | 运行 (系统版本: 3.1.0)\n使用限额 结算管理 搜索用量           | 帮助\n联系日志易     |
      | 可使用结算管理,可查看告警插件,可使用入库优先级,可使用已存搜索,可使用搜索权限,可使用数据路由,可使用 Agent 管理,可查看域使用额度,可使用字典管理,可使用搜索宏,可查看用户搜索用量,可使用报表,可使用趋势图,可使用定时任务,可使用备份,可使用本地上传,可查看角色页                                                                                                      | 403 Permission Denied | 告警插件    | 定时任务报表趋势图          | 结算管理     | 入库优先级          | 搜索权限        | 403 Permission Denied | Agent 管理 | 使用限额         | 字典列表       | 搜索宏   | 搜索用量  | 报表      | 趋势图                   | 定时任务                  | 数据备份                  | 本地上传                  | 角色列表                  | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 已存搜索          | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 路由配置  | 403 Permission Denied | 资源\n定时任务报表趋势图已存搜索搜索宏\n数据\nAgent 管理路由配置入库优先级本地上传备份策略\n权限\n角色权限搜索权限                               | 运行 (系统版本: 3.1.0)\n使用限额 结算管理 搜索用量           | 帮助\n联系日志易     |
      | 可使用结算管理,可查看告警插件,可使用入库优先级,可使用已存搜索,可使用搜索权限,可使用数据路由,可使用 Agent 管理,可查看域使用额度,可使用字典管理,可使用搜索宏,可查看用户搜索用量,可使用报表,可使用趋势图,可使用定时任务,可使用备份,可使用本地上传,可查看角色页,可查看用户页                                                                                               | 403 Permission Denied | 告警插件    | 定时任务报表趋势图          | 结算管理     | 入库优先级          | 搜索权限        | 403 Permission Denied | Agent 管理 | 使用限额         | 字典列表       | 搜索宏   | 搜索用量  | 报表      | 趋势图                   | 定时任务                  | 数据备份                  | 本地上传                  | 角色列表                  | 用户管理                  | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 已存搜索          | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 路由配置  | 403 Permission Denied | 资源\n定时任务报表趋势图已存搜索搜索宏\n数据\nAgent 管理路由配置入库优先级本地上传备份策略\n权限\n角色权限用户管理搜索权限                           | 运行 (系统版本: 3.1.0)\n使用限额 结算管理 搜索用量           | 帮助\n联系日志易     |
      | 可使用结算管理,可查看告警插件,可使用入库优先级,可使用已存搜索,可使用搜索权限,可使用数据路由,可使用 Agent 管理,可查看域使用额度,可使用字典管理,可使用搜索宏,可查看用户搜索用量,可使用报表,可使用趋势图,可使用定时任务,可使用备份,可使用本地上传,可查看角色页,可查看用户页,可使用知识库                                                                                        | 403 Permission Denied | 告警插件    | 定时任务报表趋势图知识        | 结算管理     | 入库优先级          | 搜索权限        | 403 Permission Denied | Agent 管理 | 使用限额         | 字典列表       | 搜索宏   | 搜索用量  | 报表      | 趋势图                   | 定时任务                  | 数据备份                  | 本地上传                  | 角色列表                  | 用户管理                  | 知识                    | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 已存搜索          | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 路由配置  | 403 Permission Denied | 资源\n定时任务报表趋势图知识库已存搜索搜索宏\n数据\nAgent 管理路由配置入库优先级本地上传备份策略\n权限\n角色权限用户管理搜索权限                        | 运行 (系统版本: 3.1.0)\n使用限额 结算管理 搜索用量           | 帮助\n联系日志易     |
      | 可使用结算管理,可查看告警插件,可使用入库优先级,可使用已存搜索,可使用搜索权限,可使用数据路由,可使用 Agent 管理,可查看域使用额度,可使用字典管理,可使用搜索宏,可查看用户搜索用量,可使用报表,可使用趋势图,可使用定时任务,可使用备份,可使用本地上传,可查看角色页,可查看用户页,可使用知识库,可使用仪表盘                                                                                 | 403 Permission Denied | 告警插件    | 仪表盘定时任务报表趋势图知识     | 结算管理     | 入库优先级          | 搜索权限        | 403 Permission Denied | Agent 管理 | 使用限额         | 字典列表       | 搜索宏   | 搜索用量  | 报表      | 趋势图                   | 定时任务                  | 数据备份                  | 本地上传                  | 角色列表                  | 用户管理                  | 知识                    | 仪表盘                   | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 已存搜索          | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 路由配置  | 403 Permission Denied | 资源\n仪表盘定时任务报表趋势图知识库已存搜索搜索宏\n数据\nAgent 管理路由配置入库优先级本地上传备份策略\n权限\n角色权限用户管理搜索权限                     | 运行 (系统版本: 3.1.0)\n使用限额 结算管理 搜索用量           | 帮助\n联系日志易     |
      | 可使用结算管理,可查看告警插件,可使用入库优先级,可使用已存搜索,可使用搜索权限,可使用数据路由,可使用 Agent 管理,可查看域使用额度,可使用字典管理,可使用搜索宏,可查看用户搜索用量,可使用报表,可使用趋势图,可使用定时任务,可使用备份,可使用本地上传,可查看角色页,可查看用户页,可使用知识库,可使用仪表盘,可查看用户分组                                                                         | 403 Permission Denied | 告警插件    | 仪表盘定时任务报表趋势图知识     | 结算管理     | 入库优先级          | 搜索权限        | 403 Permission Denied | Agent 管理 | 使用限额         | 字典列表       | 搜索宏   | 搜索用量  | 报表      | 趋势图                   | 定时任务                  | 数据备份                  | 本地上传                  | 角色列表                  | 用户管理                  | 知识                    | 仪表盘                   | 用户分组                  | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 已存搜索          | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 路由配置  | 403 Permission Denied | 资源\n仪表盘定时任务报表趋势图知识库已存搜索搜索宏\n数据\nAgent 管理路由配置入库优先级本地上传备份策略\n权限\n角色权限用户分组用户管理搜索权限                 | 运行 (系统版本: 3.1.0)\n使用限额 结算管理 搜索用量           | 帮助\n联系日志易     |
      | 可使用结算管理,可查看告警插件,可使用入库优先级,可使用已存搜索,可使用搜索权限,可使用数据路由,可使用 Agent 管理,可查看域使用额度,可使用字典管理,可使用搜索宏,可查看用户搜索用量,可使用报表,可使用趋势图,可使用定时任务,可使用备份,可使用本地上传,可查看角色页,可查看用户页,可使用知识库,可使用仪表盘,可查看用户分组,可使用拓扑图                                                                  | 403 Permission Denied | 告警插件    | 仪表盘定时任务报表趋势图知识     | 结算管理     | 入库优先级          | 搜索权限        | 403 Permission Denied | Agent 管理 | 使用限额         | 字典列表       | 搜索宏   | 搜索用量  | 报表      | 趋势图                   | 定时任务                  | 数据备份                  | 本地上传                  | 角色列表                  | 用户管理                  | 知识                    | 仪表盘                   | 用户分组                  | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 拓扑图                   | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 已存搜索          | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 路由配置  | 403 Permission Denied | 资源\n仪表盘定时任务报表趋势图知识库已存搜索搜索宏拓扑图\n数据\nAgent 管理路由配置入库优先级本地上传备份策略\n权限\n角色权限用户分组用户管理搜索权限              | 运行 (系统版本: 3.1.0)\n使用限额 结算管理 搜索用量           | 帮助\n联系日志易     |
      | 可使用结算管理,可查看告警插件,可使用入库优先级,可使用已存搜索,可使用搜索权限,可使用数据路由,可使用 Agent 管理,可查看域使用额度,可使用字典管理,可使用搜索宏,可查看用户搜索用量,可使用报表,可使用趋势图,可使用定时任务,可使用备份,可使用本地上传,可查看角色页,可查看用户页,可使用知识库,可使用仪表盘,可查看用户分组,可使用拓扑图,可使用字段提取                                                          | 403 Permission Denied | 告警插件    | 仪表盘定时任务报表趋势图知识     | 结算管理     | 入库优先级          | 搜索权限        | 403 Permission Denied | Agent 管理 | 使用限额         | 字典列表       | 搜索宏   | 搜索用量  | 报表      | 趋势图                   | 定时任务                  | 数据备份                  | 本地上传                  | 角色列表                  | 用户管理                  | 知识                    | 仪表盘                   | 用户分组                  | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 拓扑图                   | 字段提取                  | 403 Permission Denied | 403 Permission Denied | 已存搜索          | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 路由配置  | 403 Permission Denied | 资源\n仪表盘定时任务报表趋势图知识库已存搜索搜索宏字段提取拓扑图\n数据\nAgent 管理路由配置入库优先级本地上传备份策略\n权限\n角色权限用户分组用户管理搜索权限          | 运行 (系统版本: 3.1.0)\n使用限额 结算管理 搜索用量           | 帮助\n联系日志易     |
      | 可使用结算管理,可查看告警插件,可使用入库优先级,可使用已存搜索,可使用搜索权限,可使用数据路由,可使用 Agent 管理,可查看域使用额度,可使用字典管理,可使用搜索宏,可查看用户搜索用量,可使用报表,可使用趋势图,可使用定时任务,可使用备份,可使用本地上传,可查看角色页,可查看用户页,可使用知识库,可使用仪表盘,可查看用户分组,可使用拓扑图,可使用字段提取,可查看域标识                                                   | 403 Permission Denied | 告警插件    | 仪表盘定时任务报表趋势图知识     | 结算管理     | 入库优先级          | 搜索权限        | 403 Permission Denied | Agent 管理 | 使用限额         | 字典列表       | 搜索宏   | 搜索用量  | 报表      | 趋势图                   | 定时任务                  | 数据备份                  | 本地上传                  | 角色列表                  | 用户管理                  | 知识                    | 仪表盘                   | 用户分组                  | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 拓扑图                   | 字段提取                  | 域标识                   | 403 Permission Denied | 已存搜索          | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 路由配置  | 403 Permission Denied | 资源\n仪表盘定时任务报表趋势图知识库已存搜索搜索宏字段提取拓扑图\n数据\nAgent 管理路由配置入库优先级本地上传备份策略\n权限\n角色权限用户分组用户管理搜索权限          | 运行 (系统版本: 3.1.0)\n使用限额 域标识 结算管理 搜索用量       | 帮助\n联系日志易     |
      | 可使用结算管理,可查看告警插件,可使用入库优先级,可使用已存搜索,可使用搜索权限,可使用数据路由,可使用 Agent 管理,可查看域使用额度,可使用字典管理,可使用搜索宏,可查看用户搜索用量,可使用报表,可使用趋势图,可使用定时任务,可使用备份,可使用本地上传,可查看角色页,可查看用户页,可使用知识库,可使用仪表盘,可查看用户分组,可使用拓扑图,可使用字段提取,可查看域标识,可使用监控                                             | 监控                    | 告警插件    | 仪表盘监控定时任务报表趋势图知识   | 结算管理     | 入库优先级          | 搜索权限        | 403 Permission Denied | Agent 管理 | 使用限额         | 字典列表       | 搜索宏   | 搜索用量  | 报表      | 趋势图                   | 定时任务                  | 数据备份                  | 本地上传                  | 角色列表                  | 用户管理                  | 知识                    | 仪表盘                   | 用户分组                  | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 拓扑图                   | 字段提取                  | 域标识                   | 403 Permission Denied | 已存搜索          | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 路由配置  | 403 Permission Denied | 资源\n仪表盘监控定时任务报表趋势图知识库已存搜索搜索宏字段提取拓扑图\n数据\nAgent 管理路由配置入库优先级本地上传备份策略\n权限\n角色权限用户分组用户管理搜索权限        | 运行 (系统版本: 3.1.0)\n使用限额 域标识 结算管理 搜索用量       | 帮助\n联系日志易     |
      | 可使用结算管理,可查看告警插件,可使用入库优先级,可使用已存搜索,可使用搜索权限,可使用数据路由,可使用 Agent 管理,可查看域使用额度,可使用字典管理,可使用搜索宏,可查看用户搜索用量,可使用报表,可使用趋势图,可使用定时任务,可使用备份,可使用本地上传,可查看角色页,可查看用户页,可使用知识库,可使用仪表盘,可查看用户分组,可使用拓扑图,可使用字段提取,可查看域标识,可使用监控,可查看帮助文档                                     | 监控                    | 告警插件    | 仪表盘监控定时任务报表趋势图知识   | 结算管理     | 入库优先级          | 搜索权限        | 403 Permission Denied | Agent 管理 | 使用限额         | 字典列表       | 搜索宏   | 搜索用量  | 报表      | 趋势图                   | 定时任务                  | 数据备份                  | 本地上传                  | 角色列表                  | 用户管理                  | 知识                    | 仪表盘                   | 用户分组                  | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 拓扑图                   | 字段提取                  | 域标识                   | 帮助                    | 已存搜索          | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 路由配置  | 403 Permission Denied | 资源\n仪表盘监控定时任务报表趋势图知识库已存搜索搜索宏字段提取拓扑图\n数据\nAgent 管理路由配置入库优先级本地上传备份策略\n权限\n角色权限用户分组用户管理搜索权限        | 运行 (系统版本: 3.1.0)\n使用限额 域标识 结算管理 搜索用量       | 帮助\n帮助文档联系日志易 |
      | 可使用结算管理,可查看告警插件,可使用入库优先级,可使用已存搜索,可使用搜索权限,可使用数据路由,可使用 Agent 管理,可查看域使用额度,可使用字典管理,可使用搜索宏,可查看用户搜索用量,可使用报表,可使用趋势图,可使用定时任务,可使用备份,可使用本地上传,可查看角色页,可查看用户页,可使用知识库,可使用仪表盘,可查看用户分组,可使用拓扑图,可使用字段提取,可查看域标识,可使用监控,可查看帮助文档,可查看资源列表                             | 监控                    | 告警插件    | 仪表盘监控定时任务报表趋势图知识   | 结算管理     | 入库优先级          | 搜索权限        | 403 Permission Denied | Agent 管理 | 使用限额         | 字典列表       | 搜索宏   | 搜索用量  | 报表      | 趋势图                   | 定时任务                  | 数据备份                  | 本地上传                  | 角色列表                  | 用户管理                  | 知识                    | 仪表盘                   | 用户分组                  | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 拓扑图                   | 字段提取                  | 域标识                   | 帮助                    | 已存搜索          | 资源列表                  | 403 Permission Denied | 403 Permission Denied | 路由配置  | 403 Permission Denied | 资源\n仪表盘监控定时任务报表趋势图知识库已存搜索搜索宏字段提取拓扑图\n数据\nAgent 管理路由配置入库优先级本地上传备份策略\n权限\n角色权限用户分组用户管理资源列表搜索权限    | 运行 (系统版本: 3.1.0)\n使用限额 域标识 结算管理 搜索用量       | 帮助\n帮助文档联系日志易 |
      | 可使用结算管理,可查看告警插件,可使用入库优先级,可使用已存搜索,可使用搜索权限,可使用数据路由,可使用 Agent 管理,可查看域使用额度,可使用字典管理,可使用搜索宏,可查看用户搜索用量,可使用报表,可使用趋势图,可使用定时任务,可使用备份,可使用本地上传,可查看角色页,可查看用户页,可使用知识库,可使用仪表盘,可查看用户分组,可使用拓扑图,可使用字段提取,可查看域标识,可使用监控,可查看帮助文档,可查看资源列表,可使用数据集                      | 监控                    | 告警插件    | 仪表盘监控定时任务报表趋势图知识   | 结算管理     | 入库优先级          | 搜索权限        | 403 Permission Denied | Agent 管理 | 使用限额         | 字典列表       | 搜索宏   | 搜索用量  | 报表      | 趋势图                   | 定时任务                  | 数据备份                  | 本地上传                  | 角色列表                  | 用户管理                  | 知识                    | 仪表盘                   | 用户分组                  | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 拓扑图                   | 字段提取                  | 域标识                   | 帮助                    | 已存搜索          | 资源列表                  | 数据集                   | 403 Permission Denied | 路由配置  | 403 Permission Denied | 资源\n仪表盘监控定时任务报表趋势图知识库已存搜索搜索宏字段提取拓扑图\n数据\nAgent 管理路由配置入库优先级本地上传备份策略数据集\n权限\n角色权限用户分组用户管理资源列表搜索权限 | 运行 (系统版本: 3.1.0)\n使用限额 域标识 结算管理 搜索用量       | 帮助\n帮助文档联系日志易 |
      | 可使用结算管理,可查看告警插件,可使用入库优先级,可使用已存搜索,可使用搜索权限,可使用数据路由,可使用 Agent 管理,可查看域使用额度,可使用字典管理,可使用搜索宏,可查看用户搜索用量,可使用报表,可使用趋势图,可使用定时任务,可使用备份,可使用本地上传,可查看角色页,可查看用户页,可使用知识库,可使用仪表盘,可查看用户分组,可使用拓扑图,可使用字段提取,可查看域标识,可使用监控,可查看帮助文档,可查看资源列表,可使用数据集,可使用 ApiKey 认证        | 监控                    | 告警插件    | 仪表盘监控定时任务报表趋势图知识   | 结算管理     | 入库优先级          | 搜索权限        | 403 Permission Denied | Agent 管理 | 使用限额         | 字典列表       | 搜索宏   | 搜索用量  | 报表      | 趋势图                   | 定时任务                  | 数据备份                  | 本地上传                  | 角色列表                  | 用户管理                  | 知识                    | 仪表盘                   | 用户分组                  | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 拓扑图                   | 字段提取                  | 域标识                   | 帮助                    | 已存搜索          | 资源列表                  | 数据集                   | Apikey Management     | 路由配置  | 403 Permission Denied | 资源\n仪表盘监控定时任务报表趋势图知识库已存搜索搜索宏字段提取拓扑图\n数据\nAgent 管理路由配置入库优先级本地上传备份策略数据集\n权限\n角色权限用户分组用户管理资源列表搜索权限 | 运行 (系统版本: 3.1.0)\n使用限额 域标识 结算管理 搜索用量 API密钥 | 帮助\n帮助文档联系日志易 |
      | 可使用结算管理,可查看告警插件,可使用入库优先级,可使用已存搜索,可使用搜索权限,可使用数据路由,可使用 Agent 管理,可查看域使用额度,可使用字典管理,可使用搜索宏,可查看用户搜索用量,可使用报表,可使用趋势图,可使用定时任务,可使用备份,可使用本地上传,可查看角色页,可查看用户页,可使用知识库,可使用仪表盘,可查看用户分组,可使用拓扑图,可使用字段提取,可查看域标识,可使用监控,可查看帮助文档,可查看资源列表,可使用数据集,可使用 ApiKey 认证,可使用搜索页 | 监控                    | 告警插件    | 仪表盘搜索监控定时任务报表趋势图知识 | 结算管理     | 入库优先级          | 搜索权限        | 搜索                    | Agent 管理 | 使用限额         | 字典列表       | 搜索宏   | 搜索用量  | 报表      | 趋势图                   | 定时任务                  | 数据备份                  | 本地上传                  | 角色列表                  | 用户管理                  | 知识                    | 仪表盘                   | 用户分组                  | 403 Permission Denied | 403 Permission Denied | 403 Permission Denied | 拓扑图                   | 字段提取                  | 域标识                   | 帮助                    | 已存搜索          | 资源列表                  | 数据集                   | Apikey Management     | 路由配置  | 搜索                    | 资源\n仪表盘监控定时任务报表趋势图知识库已存搜索搜索宏字段提取拓扑图\n数据\nAgent 管理路由配置入库优先级本地上传备份策略数据集\n权限\n角色权限用户分组用户管理资源列表搜索权限 | 运行 (系统版本: 3.1.0)\n使用限额 域标识 结算管理 搜索用量 API密钥 | 帮助\n帮助文档联系日志易 |

  Scenario: 授权可接受消息提醒
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "AutoTestRole" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    Then I click the "{'TabButton':'功能'}" button
    And I wait for "Loading" will be invisible
    When I "checked" the checkbox which name is "全选"
    And I "unchecked" the checkbox which name is "全选"
    When I "checked" the checkbox which name is "可查看告警插件,可接收消息提醒"
    And I click the "SaveButton" button
    Then I will see the success message "保存成功"
    Given I will see the "PublicNavBarPage" page
    And I wait for "Dashboard" will be visible
    Given I logout current user
    And I wait for title change text to "登录"
    And open the "LoginPage" page for uri "/auth/login/"
    When I set the parameter "Username" with value "AutoTest"
    And I set the parameter "Password" with value "all123456"
    And I click the "LoginButton" button
    And I wait for "2000" millsecond
    And open the "PublicNavBarPage" page for uri "/plugins/"
    Then I wait for "News" will be visible

  Scenario Outline: 应用权限
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "AutoTestRole" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    Then I click the "{'TabButton':'功能'}" button
    And I wait for "Loading" will be invisible
    When I "checked" the checkbox which name is "全选"
    And I "unchecked" the checkbox which name is "全选"
    When I "checked" the checkbox which name is "可查看告警插件,<function>"
    And I click the "SaveButton" button
    Then I will see the success message "保存成功"
    Given I will see the "PublicNavBarPage" page
    And I wait for "Dashboard" will be visible
    Given I logout current user
    And I wait for title change text to "登录"
    And open the "LoginPage" page for uri "/auth/login/"
    When I set the parameter "Username" with value "AutoTest"
    And I set the parameter "Password" with value "all123456"
    And I click the "LoginButton" button
    And I wait for "2000" millsecond
    And open the "PublicNavBarPage" page for uri "/plugins/"
    And I click the "AppBtn" button
    Then I will see the element "App" name is "<app>"
    And open the "PublicNavBarPage" page for uri "<galaxee>"
    Then the page's title will be "<galaxeeTitle>"
    And open the "PublicNavBarPage" page for uri "<machine>"
    Then the page's title will be "<machineTitle>"
    And open the "PublicNavBarPage" page for uri "<overview>"
    Then the page's title will be "<overviewTitle>"
    And open the "PublicNavBarPage" page for uri "<incident>"
    Then the page's title will be "<incidentTitle>"

    Examples:
      | function                      | app                    | galaxee               | galaxeeTitle | machine                         | machineTitle          | overview              | overviewTitle         | incident       | incidentTitle         |
      | 可使用大屏                         | 数据大屏                   | /app/galaxee/manager/ | 大屏管理         | /app/machine_learning/showcase/ | 403 Permission Denied | /app/lynxee/overview/ | 403 Permission Denied | /app/incident/ | 403 Permission Denied |
      | 可使用大屏,可使用机器学习                 | 机器学习\n数据大屏             | /app/galaxee/manager/ | 大屏管理         | /app/machine_learning/showcase/ | 机器学习                  | /app/lynxee/overview/ | 403 Permission Denied | /app/incident/ | 403 Permission Denied |
      | 可使用大屏,可使用机器学习,可使用智能运维         | 机器学习\n数据大屏\n智能运维       | /app/galaxee/manager/ | 大屏管理         | /app/machine_learning/showcase/ | 机器学习                  | /app/lynxee/overview/ | 智能运维                  | /app/incident/ | 403 Permission Denied |
      | 可使用大屏,可使用机器学习,可使用智能运维,可使用事件管理 | 机器学习\n数据大屏\n智能运维\n事件管理 | /app/galaxee/manager/ | 大屏管理         | /app/machine_learning/showcase/ | 机器学习                  | /app/lynxee/overview/ | 智能运维                  | /app/incident/ | 事件管理                  |

#
#  Scenario: 授予可解锁用户权限（RZY-765）
#    When I "checked" the checkbox which name is "可解锁用户"
#    And I click the "SaveButton" button
#    Given open the "users.ListPage" page for uri "/account/users/"
#    And I click the "CreateUser" button
#    And I will see the "users.CreatePage" page
#    When I set the parameter "UserName" with value "TempUser"
#    And I set the parameter "Email" with value "142745@qq.com"
#    And I set the parameter "Password" with value "all123456"
#    And I choose the "AutoTestGroup" from the "UserGroups"
#    And I click the "CreateButton" button
#    Then I wait for "SuccessMessage" will be visible
#    And I logout current user
#    And open the "LoginPage" page for uri "/auth/login/"
#    And I run a method "Login" for "10" times with parameters "{'name':'TempUser','password':'123'}"
#    When I set the parameter "Username" with value "AutoTest"
#    And I set the parameter "Password" with value "qqqqq11111"
#    And I click the "LoginButton" button
#    And I wait for "2000" millsecond
#    Given open the "users.ListPage" page for uri "/account/users/"
#    When the data name is "{'column':'1','name':'TempUser'}" then i click the "解锁" button
#    And I logout current user
#    And open the "LoginPage" page for uri "/auth/login/"
#    When I set the parameter "Username" with value "TempUser"
#    And I set the parameter "Password" with value "all123456"
#    And I click the "LoginButton" button
#    And I will see the "PublicNavBarPage" page
#
#  Scenario: 授予可使用结算管理权限（RZY-769）
#    When I "checked" the checkbox which name is "可使用结算管理"
#    And I click the "SaveButton" button
#    Given open the "users.ListPage" page for uri "/account/users/"
#    When the data name is "{'column':'1','name':'TempUser'}" then i click the "删除" button
#    And I click the "EnsureButton" button
#    And I will see the success message "删除成功"
#    And I logout current user
#    And open the "LoginPage" page for uri "/auth/login/"
#    When I set the parameter "Username" with value "AutoTest"
#    And I set the parameter "Password" with value "qqqqq11111"
#    And I click the "LoginButton" button
#    And I wait for "2000" millsecond
#    And I will see the "PublicNavBarPage" page
#    And I click the "Status" button
#    Then I will see the element "Running" name is "使用限额 域标识 结算管理 搜索用量"
#    And open the "PublicNavBarPage" page for uri "/payments/"
#    Then the page's title will be "结算管理"
#
#  Scenario: 授予编辑所有角色权限（RZY-1214）
#    When I "checked" the checkbox which name is "编辑所有角色权限"
#    And I click the "SaveButton" button
#    And I logout current user
#    And open the "LoginPage" page for uri "/auth/login/"
#    When I set the parameter "Username" with value "AutoTest"
#    And I set the parameter "Password" with value "qqqqq11111"
#    And I click the "LoginButton" button
#    And I wait for "2000" millsecond
#    Given open the "roles.ListPage" page for uri "/account/roles/"
#    Then I will see the search result contains "{'column':'0','name':'admin'}"
#
#  Scenario: 授予新建角色（RZY-1210）
#    When I "checked" the checkbox which name is "可新建角色"
#    And I click the "SaveButton" button
#    And I logout current user
#    And open the "LoginPage" page for uri "/auth/login/"
#    When I set the parameter "Username" with value "AutoTest"
#    And I set the parameter "Password" with value "qqqqq11111"
#    And I click the "LoginButton" button
#    And I wait for "2000" millsecond
#    Given open the "roles.ListPage" page for uri "/account/roles/"
#    Then the data name is "AutoTestRoleWithAllResource" then i will see "{'column':'3','name':'编辑 授权 复制 删除'}" button
#    Given I click the "CreateRoleButton" button
#    And I will see the "roles.CreatePage" page
#    And I set the parameter "RoleName" with value "TempRole"
#    And I click the "CreateButton" button
#    Then I wait for "SuccessMessage" will be visible
#
#  Scenario: 授予可更新最大搜索时长（RZY-1208）
#    When I "checked" the checkbox which name is "可更新最大搜索时长"
#    And I click the "SaveButton" button
#    And I logout current user
#    And open the "LoginPage" page for uri "/auth/login/"
#    When I set the parameter "Username" with value "AutoTest"
#    And I set the parameter "Password" with value "qqqqq11111"
#    And I click the "LoginButton" button
#    And I wait for "2000" millsecond
#    Given open the "roles.ListPage" page for uri "/account/roles/"
#    And the data name is "AutoTestRole" then i click the "授权" button
#    And I will see the "roles.AuthorizationPage" page
#    Then I click the "{'TabButton':'配置'}" button
#    And I set the parameter "MaxTime" with value "1d"
#    And I click the "SaveButton" button
#    Then I will see the success message "保存成功"
#
#  Scenario Outline: 授予可转授功能权限（RZY-1211）
#    When I "checked" the checkbox which name is "可转授功能权限"
#    And I click the "SaveButton" button
#    And I logout current user
#    And open the "LoginPage" page for uri "/auth/login/"
#    When I set the parameter "Username" with value "AutoTest"
#    And I set the parameter "Password" with value "qqqqq11111"
#    And I click the "LoginButton" button
#    And I wait for "2000" millsecond
#    Given open the "roles.ListPage" page for uri "/account/roles/"
#    And the data name is "AutoTestRole" then i click the "授权" button
#    And I will see the "roles.AuthorizationPage" page
#    And I click the "{'TabButton':'功能'}" button
#    And I will see the element "CheckboxGroup" name is "<name>"
#
#    Examples:
#      | name                                      |
#      | 可使用结算管理\n可新建角色\n可解锁用户\n可更新最大搜索时长\n可转授功能权限 |
#
#  Scenario: 授予可新建/更新告警插件权限（RZY-771）
#    When I "checked" the checkbox which name is "可新建/更新告警插件"
#    And I click the "SaveButton" button
#    And I logout current user
#    And open the "LoginPage" page for uri "/auth/login/"
#    When I set the parameter "Username" with value "AutoTest"
#    And I set the parameter "Password" with value "qqqqq11111"
#    And I click the "LoginButton" button
#    And I wait for "2000" millsecond
#    And open the "alert.PluginPage" page for uri "/plugins/"
#    Then I wait for "Upload" will be visible
#
##  Scenario: 授权可搜索所有日志（RZY-768）
##    When I "checked" the checkbox which name is "可新建/更新告警插件"
##    And I click the "SaveButton" button
##    And I logout current user
##    And open the "LoginPage" page for uri "/auth/login/"
##    When I set the parameter "Username" with value "AutoTest"
##    And I set the parameter "Password" with value "qqqqq11111"
##    And I click the "LoginButton" button
##    And I wait for "2000" millsecond
#
##  Scenario: 授权可查看敏感内容（RZY-772）
##    When I "checked" the checkbox which name is "可查看敏感内容"
##    And I click the "SaveButton" button
##    And I logout current user
##    And open the "LoginPage" page for uri "/auth/login/"
##    When I set the parameter "Username" with value "AutoTest"
##    And I set the parameter "Password" with value "qqqqq11111"
##    And I click the "LoginButton" button
##    And I wait for "2000" millsecond
#
#  Scenario: 授权可使用离线任务（RZY-762）
#    When I "checked" the checkbox which name is "可使用离线任务"
#    And I click the "SaveButton" button
#    And I logout current user
#    And open the "LoginPage" page for uri "/auth/login/"
#    When I set the parameter "Username" with value "AutoTest"
#    And I set the parameter "Password" with value "qqqqq11111"
#    And I click the "LoginButton" button
#    And I wait for "2000" millsecond
#    And I will see the "PublicNavBarPage" page
#    And I click the "Setting" button
#    Then I will see the element "Data" name is "日志来源Agent 管理路由配置本地上传备份策略离线任务"
#    And open the "PublicNavBarPage" page for uri "/offlinetask/"
#    Then the page's title will be "离线任务"
#
##  Scenario: 授权可更改他人密码（RZY-1213）
#
#  Scenario: 可使用资源包导入导出（RZY-764）
#    When I "checked" the checkbox which name is "可使用资源包导入、导出"
#    And I click the "SaveButton" button
#    And I logout current user
#    And open the "LoginPage" page for uri "/auth/login/"
#    When I set the parameter "Username" with value "AutoTest"
#    And I set the parameter "Password" with value "qqqqq11111"
#    And I click the "LoginButton" button
#    And I wait for "2000" millsecond
#    Given open the "resourceGroups.ListPage" page for uri "/account/resourcegroups/"
#    Then I wait for "UploadButton" will be visible
#
#  Scenario: 可使用入库优先级并验证无大屏权限时是否有权访问（RZY-767）
#    When I "checked" the checkbox which name is "可使用入库优先级"
#    And I click the "SaveButton" button
#    And I logout current user
#    And open the "LoginPage" page for uri "/auth/login/"
#    When I set the parameter "Username" with value "AutoTest"
#    And I set the parameter "Password" with value "qqqqq11111"
#    And I click the "LoginButton" button
#    And I wait for "2000" millsecond
#    And I will see the "PublicNavBarPage" page
#    And I click the "Setting" button
#    Then I will see the element "Data" name is "日志来源Agent 管理路由配置入库优先级本地上传备份策略离线任务"
#    And open the "PublicNavBarPage" page for uri "/ingestpriority/"
#    Then the page's title will be "入库优先级"
#    And open the "PublicNavBarPage" page for uri "/app/galaxee/manager/"
#    Then the page's title will be "404 Page Not Found"
#
#  Scenario Outline: 大屏功能权限（RZY-2609）
#    When I "checked" the checkbox which name is "可使用 Galaxee"
#    And I click the "SaveButton" button
#    And I logout current user
#    And open the "LoginPage" page for uri "/auth/login/"
#    When I set the parameter "Username" with value "AutoTest"
#    And I set the parameter "Password" with value "qqqqq11111"
#    And I click the "LoginButton" button
#    And I wait for "2000" millsecond
#    And I will see the "PublicNavBarPage" page
#    And I click the "Application" button
#    Then I will see the element "App" name is "<name>"
#    And open the "PublicNavBarPage" page for uri "/app/galaxee/manager/"
#    Then the page's title will be "Galaxee"
#
#    Examples:
#      | name                      |
#      | 机器学习\n关联搜索\n应用表格\nGalaxee |
#
##  Scenario: 可使用告警分析（RZY-1207）
#
##  Scenario: 可修改用户详情（缺少验证同组用户）（RZY-766）
##    When I "checked" the checkbox which name is "可修改用户详情"
##    And I click the "SaveButton" button
##    And I logout current user
##    And open the "LoginPage" page for uri "/auth/login/"
##    When I set the parameter "Username" with value "AutoTest"
##    And I set the parameter "Password" with value "qqqqq11111"
##    And I click the "LoginButton" button
##    And I wait for "2000" millsecond
##    Given open the "users.ListPage" page for uri "/account/users/"
##    When I click the detail which name is "{'column':'1','name':'AutoTest'}"
##    And I will see the "users.DetailPage" page
##    And I click the "EditButton" button
##    And I will see the "users.EditPage" page
##    And I set the parameter "Telephone" with value "1511111111"
##    And I click the "SaveButton" button
##    Then I will see the success message "更新成功"
#
#  Scenario: 可导入导出树状日志来源（RZY-1212）
#    When I "checked" the checkbox which name is "可导入导出日志来源树状结构"
#    And I click the "SaveButton" button
#    And I logout current user
#    And open the "LoginPage" page for uri "/auth/login/"
#    When I set the parameter "Username" with value "AutoTest"
#    And I set the parameter "Password" with value "qqqqq11111"
#    And I click the "LoginButton" button
#    And I wait for "2000" millsecond
#    And I will see the "PublicNavBarPage" page
#    And I click the "Setting" button
#    Then I will see the element "System" name is "来源结构"
#    Given open the "sourceGroup.StructurePage" page for uri "/sources/sourcegroups/structure/"
#    And I click the "ImportButton" button
#    When I upload a file with name "/src/test/resources/testdata/sourceGroups/AutoUploadTest.yaml"
#    And I will see the element "VerifyText" name is "上传完成"
#    And I click the "NextButton" button
#    And I wait for "Preview" will be visible
#    And I click the "NextButton" button
#    And I wait for "ImportSuccessMsg" will be visible
#    And I click the "CompleteButton" button
#
#  Scenario: 可使用模式学习（RZY-1209）
#    When I "checked" the checkbox which name is "可使用模式学习"
#    And I click the "SaveButton" button
#    And I logout current user
#    And open the "LoginPage" page for uri "/auth/login/"
#    When I set the parameter "Username" with value "AutoTest"
#    And I set the parameter "Password" with value "qqqqq11111"
#    And I click the "LoginButton" button
#    And I wait for "2000" millsecond
#    Given open the "splSearch.SearchPage" page for uri "/search/"
#    Then I will see the element "SearchTabBar" name is "模式"
#
#  Scenario: 可下载搜索结果（RZY-770）
#    When I "checked" the checkbox which name is "可下载搜索结果"
#    And I click the "SaveButton" button
#    And I logout current user
#    And open the "LoginPage" page for uri "/auth/login/"
#    When I set the parameter "Username" with value "AutoTest"
#    And I set the parameter "Password" with value "qqqqq11111"
#    And I click the "LoginButton" button
#    And I wait for "2000" millsecond
#    And I will see the "PublicNavBarPage" page
#    And I click the "Setting" button
#    Then I will see the element "Data" name is "日志来源Agent 管理路由配置入库优先级本地上传备份策略下载管理离线任务"
#    And open the "PublicNavBarPage" page for uri "/download/"
#    Then the page's title will be "下载管理"
#
#  Scenario: 可查看统计菜单（RZY-774）
#    When I "checked" the checkbox which name is "可查看统计菜单"
#    And I click the "SaveButton" button
#    And I logout current user
#    And open the "LoginPage" page for uri "/auth/login/"
#    When I set the parameter "Username" with value "AutoTest"
#    And I set the parameter "Password" with value "qqqqq11111"
#    And I click the "LoginButton" button
#    And I wait for "2000" millsecond
#    Given open the "splSearch.SearchPage" page for uri "/search/"
#    And I wait element "SearchStatus" change text to "搜索完成!"
#    Then I will see the element "SearchTabBar" name is "统计"
#
#  Scenario: 授权查看未分配资源（RZY-775）
#    When I "checked" the checkbox which name is "可查看未分配资源"
#    And I click the "SaveButton" button
#    And I logout current user
#    And open the "LoginPage" page for uri "/auth/login/"
#    When I set the parameter "Username" with value "AutoTest"
#    And I set the parameter "Password" with value "qqqqq11111"
#    And I click the "LoginButton" button
#    And I wait for "2000" millsecond
#    Given open the "sourceGroup.ListPage" page for uri "/sources/sourcegroups/"
#    Then I will see the column number "1" contains "AutoTestUploadTest"
#
#  Scenario: 可新建应用（RZY-2610）
#    When I "checked" the checkbox which name is "可新建应用"
#    And I click the "SaveButton" button
#    And I logout current user
#    And open the "LoginPage" page for uri "/auth/login/"
#    When I set the parameter "Username" with value "AutoTest"
#    And I set the parameter "Password" with value "qqqqq11111"
#    And I click the "LoginButton" button
#    And I wait for "2000" millsecond
#    Given delete file "/target/download-files/TempTestApp.tar"
#    And open the "app.ListPage" page for uri "/app/list/"
#    And I click the "CreateButton" button
#    Then I will see the "app.CreatePage" page
#    When I set the parameter "NameInput" with value "TempTestApp"
#    And I click the "AddMenuButton" button
#    And I set the parameter "MenuName" with value "知识"
#    And I set the parameter "Url" with value "/knowledge/"
#    And I click the "SaveMenuButton" button
#    And I choose the "知识" from the "DefaultPage"
#    And I click the "CreateButton" button
#    Then I will see the success message "请等待下载开始后，点击确定返回列表页，然后等待下载完成"
#    Given open the "app.ListPage" page for uri "/app/list/"
#    And I click the "InstallButton" button
#    Then I will see the "app.InstallPage" page
#    When I upload a file with name "/target/download-files/TempTestApp.tar"
#    And I will see the element "VerifyText" name is "上传完成"
#    And I choose the "AutoTestRole" from the "Role"
#    And I choose the "AutoTestUploadTest" from the "Resource"
#    And I click the "NextButton" button
#    And I will see the "GroupPreview" is "active"
#    And I click the "NextButton" button
#    And I will see the "ResourcePreview" is "active"
#    And I click the "NextButton" button
#    And I will see the element "ImportSuccess" name is "导入成功"
#    Given open the "app.ListPage" page for uri "/app/list/"
#    Then I will see the search result contains "{'column':'0','name':'TempTestApp'}"
#    Given delete file "/target/download-files/AutoTest.tar"
#    And open the "app.ListPage" page for uri "/app/list/"
#    When the data name is "TempTestApp" then i click the "导出" button
#    And I will see the "app.CreatePage" page
#    And I wait for loading invisible
#    And I click the "ExportButton" button
#    Then I will see the success message "请等待下载开始后，点击确定返回列表页，然后等待下载完成"
#
#  Scenario: 删除上传的日志来源以及取消勾选查看未分配资源
#    When I "unchecked" the checkbox which name is "可查看未分配资源"
#    And I click the "SaveButton" button
#    Given open the "sourceGroup.ListPage" page for uri "/sources/sourcegroups/"
#    And I wait for loading invisible
#    Given the data name is "AutoTestUploadTest" then i click the "删除" button
#    Then I click the "Ensure" button
#    Then I will see the success message "删除成功"
#
#  Scenario: 删除app及其资源分组
#    When I logout current user
#    And open the "LoginPage" page for uri "/auth/login/"
#    And I set the parameter "Username" with value "AutoTest"
#    And I set the parameter "Password" with value "qqqqq11111"
#    And I click the "LoginButton" button
#    And I wait for "2000" millsecond
#    And open the "app.ListPage" page for uri "/app/list/"
#    And the data name is "TempTestApp" then i click the "删除" button
#    And I click the "EnsureButton" button
#    Then I will see the success message "删除成功"
#    Given open the "resourceGroups.ListPage" page for uri "/account/resourcegroups/"
#    When the data name is "TempTestApp" then i click the "删除" button
#    And I click the "MessageBoxOKButton" button
#    Then I will see the success message "删除成功"
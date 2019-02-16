@authorization @all @smoke
Feature: 角色授权URL访问

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

  Scenario Outline: 赋予URL访问权限（RZY-2629至2674）
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
      | name     | navigate    | elementName | functionName                      | uri                             | title     |
      | 资源分组     | Setting     | Auth        | 资源分组                              | /account/resourcegroups/        | 资源分组管理    |
      | 角色权限     | Setting     | Auth        | 角色权限资源分组                          | /account/roles/                 | 角色列表      |
      | 使用限额     | Status      | Running     | 使用限额                              | /account/usage/                 | 使用限额      |
      | 用户分组     | Setting     | Auth        | 角色权限资源分组用户分组                      | /account/usergroups/            | 用户分组      |
      | 用户管理     | Setting     | Auth        | 角色权限资源分组用户分组用户管理                  | /account/users/                 | 用户管理      |
      | 监控       | Setting     | Source      | 监控                                | /alerts/                        | 监控        |
      | 应用       | Application | App         | 机器学习\n关联搜索\n应用表格                  | /app/list/                      | 应用管理      |
      | 应用       | Application | App         | 机器学习\n关联搜索\n应用表格                  | /app/machine_learning/showcase/ | 机器学习      |
      | 应用       | Application | App         | 机器学习\n关联搜索\n应用表格                  | /app/application_table/         | 应用表格      |
      | 备份策略     | Setting     | Data        | 备份策略                              | /backup/                        | 数据备份      |
      | 字段提取     | Setting     | Source      | 监控字段提取                            | /configs/                       | 字段提取      |
      | 仪表盘      | Setting     | Source      | 仪表盘监控字段提取                         | /dashboard/                     | 列表 \| 仪表盘 |
      | 字典管理     |             |             |                                   | /dictionary/                    | 字典列表      |
      | 帮助       | Help        | HelpDocs    | 帮助文档联系日志易                         | /docs/                          | 帮助        |
      | 事件操作     | Setting     | Source      | 仪表盘监控字段提取事件操作                     | /event/action/                  | 事件操作      |
      | 路由配置     | Setting     | Data        | 路由配置备份策略                          | /backup/                        | 数据备份      |
      | 知识       | Setting     | Source      | 仪表盘监控知识库字段提取事件操作                  | /knowledge/                     | 知识        |
      | 搜索宏      | Setting     | Source      | 仪表盘监控知识库搜索宏字段提取事件操作               | /macro/                         | 搜索宏       |
      | 消息       |             |             |                                   | /notice/                        | 消息        |
      | 告警插件     |             |             |                                   | /plugins/                       | 告警插件      |
      | 报表管理     | Setting     | Source      | 仪表盘监控报表知识库搜索宏字段提取事件操作             | /reports/                       | 报表列表      |
      | 任务       | Setting     | Source      | 仪表盘监控定时任务报表知识库搜索宏字段提取事件操作         | /schedule/                      | 定时任务      |
      | 搜索       | Setting     | Source      | 搜索仪表盘监控定时任务报表知识库搜索宏字段提取事件操作       | /search/                        | 搜索        |
      | 来源详情     |             |             |                                   | /sources/detail/                | 来源详情      |
      | 本地上传     | Setting     | Data        | 路由配置本地上传备份策略                      | /sources/input/os/              | 本地上传      |
      | Agent 管理 | Setting     | Data        | Agent 管理路由配置本地上传备份策略              | /sources/input/agent/           | Agent 管理  |
      | 日志来源     | Setting     | Data        | 日志来源Agent 管理路由配置本地上传备份策略          | /sources/sourcegroups/          | 日志来源      |
      | 域标识      | Status      | Running     | 使用限额 域标识                          | /tokens/                        | 域标识       |
      | 拓扑图      | Setting     | Source      | 搜索仪表盘监控定时任务报表知识库搜索宏字段提取事件操作拓扑图    | /topology/                      | 拓扑图列表     |
      | 趋势图      | Setting     | Source      | 搜索仪表盘监控定时任务报表知识库搜索宏字段提取事件操作拓扑图趋势图 | /trend/                         | 趋势图       |
      | 搜索用量     | Status      | Running     | 使用限额 域标识 搜索用量                     | /usage/                         | 搜索用量      |

  Scenario: 撤销修改（RZY-2675）
    Given the data name is "AutoTestRole" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    And I click the "{'TabButton':'URL 访问'}" button
    When I click the "ChooseAllCheckBoxes" button
    And I click the "SaveButton" button
    And I click the "Recall" button
    Then I will see the "ChooseAllCheckBoxes" is "is-checked"

  Scenario Outline: 勾选所有URL访问权限（RZY-559）
    Given the data name is "AutoTestRole" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    And I click the "{'TabButton':'URL 访问'}" button
    When I click the "ChooseAllCheckBoxes" button
    And I click the "ChooseAllCheckBoxes" button
    And I click the "SaveButton" button
    And I logout current user
    And open the "LoginPage" page for uri "/auth/login/"
    When I set the parameter "Username" with value "<usernameValue>"
    And I set the parameter "Password" with value "<passwordValue>"
    And I click the "LoginButton" button
    And I wait for "2000" millsecond
    And I will see the "PublicNavBarPage" page
    And I will see the element "Subnav" name is "仪表盘搜索监控定时任务报表趋势图知识"
    And I click the "Setting" button
    And I will see the element value in json "<value>"
    And I click the "Status" button
    Then I will see the element "Running" name is "使用限额 域标识 搜索用量"
    And I click the "Help" button
    Then I will see the element "HelpDocs" name is "帮助文档联系日志易"

    Examples:
      | usernameValue | passwordValue | value                                                                                                     |
      | AutoTest      | qqqqq11111    | {'Data':'日志来源Agent 管理路由配置本地上传备份策略','Source':'搜索仪表盘监控定时任务报表知识库搜索宏字段提取事件操作拓扑图趋势图','Auth':'角色权限资源分组用户分组用户管理' |
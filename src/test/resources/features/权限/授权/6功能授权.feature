@authorization @all @smoke @roleSmoke
Feature: 角色授权功能

  Background:
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "AutoTestRole" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    Then I click the "{'TabButton':'功能'}" button

  Scenario: 授予可解锁用户权限（RZY-765）
    When I "checked" the checkbox which name is "可解锁用户"
    And I click the "SaveButton" button
    Given open the "users.ListPage" page for uri "/account/users/"
    And I click the "CreateUser" button
    And I will see the "users.CreatePage" page
    When I set the parameter "UserName" with value "TempUser"
    And I set the parameter "Email" with value "142745@qq.com"
    And I set the parameter "Password" with value "all123456"
    And I choose the "AutoTestForUser" from the "UserGroups"
    And I click the "CreateButton" button
    Then I wait for "SuccessMessage" will be visible
    And I logout current user
    And open the "LoginPage" page for uri "/auth/login/"
    And I run a method "Login" for "10" times with parameters "{'name':'TempUser','password':'123'}"
    When I set the parameter "Username" with value "AutoTest"
    And I set the parameter "Password" with value "qqqqq11111"
    And I click the "LoginButton" button
    And I wait for "2000" millsecond
    Given open the "users.ListPage" page for uri "/account/users/"
    When the data name is "{'column':'1','name':'TempUser'}" then i click the "解锁" button
    And I logout current user
    And open the "LoginPage" page for uri "/auth/login/"
    When I set the parameter "Username" with value "TempUser"
    And I set the parameter "Password" with value "all123456"
    And I click the "LoginButton" button
    And I will see the "PublicNavBarPage" page
    And I click the "Setting" button

  Scenario: 授予可使用结算管理权限（RZY-769）
    When I "checked" the checkbox which name is "可使用结算管理"
    And I click the "SaveButton" button
    Given open the "users.ListPage" page for uri "/account/users/"
    When the data name is "{'column':'1','name':'TempUser'}" then i click the "删除" button
    And I click the "EnsureButton" button
    And I will see the success message "删除成功"
    And I logout current user
    And open the "LoginPage" page for uri "/auth/login/"
    When I set the parameter "Username" with value "AutoTest"
    And I set the parameter "Password" with value "qqqqq11111"
    And I click the "LoginButton" button
    And I wait for "2000" millsecond
    And I will see the "PublicNavBarPage" page
    And I click the "Status" button
    Then I will see the element "Running" name is "使用限额 域标识 结算管理 搜索用量"
    And open the "PublicNavBarPage" page for uri "/payments/"
    Then the page's title will be "结算管理"

  Scenario: 授予编辑所有角色权限（RZY-1214）
    When I "checked" the checkbox which name is "编辑所有角色权限"
    And I click the "SaveButton" button
    And I logout current user
    And open the "LoginPage" page for uri "/auth/login/"
    When I set the parameter "Username" with value "AutoTest"
    And I set the parameter "Password" with value "qqqqq11111"
    And I click the "LoginButton" button
    And I wait for "2000" millsecond
    Given open the "roles.ListPage" page for uri "/account/roles/"
    Then I will see the search result contains "{'column':'0','name':'admin'}"

  Scenario: 授予新建角色（RZY-1210）
    When I "checked" the checkbox which name is "可新建角色"
    And I click the "SaveButton" button
    And I logout current user
    And open the "LoginPage" page for uri "/auth/login/"
    When I set the parameter "Username" with value "AutoTest"
    And I set the parameter "Password" with value "qqqqq11111"
    And I click the "LoginButton" button
    And I wait for "2000" millsecond
    Given open the "roles.ListPage" page for uri "/account/roles/"
    Then the data name is "AutoTestRoleWithAllResource" then i will see "{'column':'3','name':'编辑 授权 复制 删除'}" button
    Given I click the "CreateRoleButton" button
    And I will see the "roles.CreatePage" page
    And I set the parameter "RoleName" with value "TempRole"
    And I click the "CreateButton" button
    Then I wait for "SuccessMessage" will be visible

  Scenario: 授予可更新最大搜索时长（RZY-1208）
    When I "checked" the checkbox which name is "可更新最大搜索时长"
    And I click the "SaveButton" button
    And I logout current user
    And open the "LoginPage" page for uri "/auth/login/"
    When I set the parameter "Username" with value "AutoTest"
    And I set the parameter "Password" with value "qqqqq11111"
    And I click the "LoginButton" button
    And I wait for "2000" millsecond
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "AutoTestRole" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    Then I click the "{'TabButton':'配置'}" button
    And I set the parameter "MaxTime" with value "1d"
    And I click the "SaveButton" button
    Then I will see the success message "保存成功"
    And I set the parameter "MaxTime" with value "1d"
    And I click the "SaveButton" button
    Then I will see the success message "保存成功"

  Scenario Outline: 授予可转授功能权限（RZY-1211）
    When I "checked" the checkbox which name is "可转授功能权限"
    And I click the "SaveButton" button
    And I logout current user
    And open the "LoginPage" page for uri "/auth/login/"
    When I set the parameter "Username" with value "AutoTest"
    And I set the parameter "Password" with value "qqqqq11111"
    And I click the "LoginButton" button
    And I wait for "2000" millsecond
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "AutoTestRole" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    And I click the "{'TabButton':'功能'}" button
    And I will see the element "CheckboxGroup" name is "<name>"

    Examples:
      | name                                      |
      | 可使用结算管理\n可新建角色\n可解锁用户\n可更新最大搜索时长\n可转授功能权限 |

  Scenario: 授予可新建/更新告警插件权限（RZY-771）
    When I "checked" the checkbox which name is "可新建/更新告警插件"
    And I click the "SaveButton" button
    And I logout current user
    And open the "LoginPage" page for uri "/auth/login/"
    When I set the parameter "Username" with value "AutoTest"
    And I set the parameter "Password" with value "qqqqq11111"
    And I click the "LoginButton" button
    And I wait for "2000" millsecond
    And open the "alert.PluginPage" page for uri "/plugins/"
    Then I wait for "Upload" will be visible

#  Scenario: 授权可搜索所有日志（RZY-768）
#    When I "checked" the checkbox which name is "可新建/更新告警插件"
#    And I click the "SaveButton" button
#    And I logout current user
#    And open the "LoginPage" page for uri "/auth/login/"
#    When I set the parameter "Username" with value "AutoTest"
#    And I set the parameter "Password" with value "qqqqq11111"
#    And I click the "LoginButton" button
#    And I wait for "2000" millsecond

#  Scenario: 授权可查看敏感内容（RZY-772）
#    When I "checked" the checkbox which name is "可查看敏感内容"
#    And I click the "SaveButton" button
#    And I logout current user
#    And open the "LoginPage" page for uri "/auth/login/"
#    When I set the parameter "Username" with value "AutoTest"
#    And I set the parameter "Password" with value "qqqqq11111"
#    And I click the "LoginButton" button
#    And I wait for "2000" millsecond

  Scenario: 授权可使用离线任务（RZY-762）
    When I "checked" the checkbox which name is "可使用离线任务"
    And I click the "SaveButton" button
    And I logout current user
    And open the "LoginPage" page for uri "/auth/login/"
    When I set the parameter "Username" with value "AutoTest"
    And I set the parameter "Password" with value "qqqqq11111"
    And I click the "LoginButton" button
    And I wait for "2000" millsecond
    And I will see the "PublicNavBarPage" page
    And I click the "Setting" button
    Then I will see the element "Data" name is "日志来源Agent 管理路由配置本地上传备份策略离线任务"
    And open the "PublicNavBarPage" page for uri "/offlinetask/"
    Then the page's title will be "离线任务"

#  Scenario: 授权可更改他人密码（RZY-1213）

  Scenario: 可使用资源包导入导出（RZY-764）
    When I "checked" the checkbox which name is "可使用资源包导入、导出"
    And I click the "SaveButton" button
    And I logout current user
    And open the "LoginPage" page for uri "/auth/login/"
    When I set the parameter "Username" with value "AutoTest"
    And I set the parameter "Password" with value "qqqqq11111"
    And I click the "LoginButton" button
    And I wait for "2000" millsecond
    Given open the "resourceGroups.ListPage" page for uri "/account/resourcegroups/"
    Then I wait for "UploadButton" will be visible

  Scenario: 可使用入库优先级并验证无大屏权限时是否有权访问（RZY-767）
    When I "checked" the checkbox which name is "可使用入库优先级"
    And I click the "SaveButton" button
    And I logout current user
    And open the "LoginPage" page for uri "/auth/login/"
    When I set the parameter "Username" with value "AutoTest"
    And I set the parameter "Password" with value "qqqqq11111"
    And I click the "LoginButton" button
    And I wait for "2000" millsecond
    And I will see the "PublicNavBarPage" page
    And I click the "Setting" button
    Then I will see the element "Data" name is "日志来源Agent 管理路由配置入库优先级本地上传备份策略离线任务"
    And open the "PublicNavBarPage" page for uri "/ingestpriority/"
    Then the page's title will be "入库优先级"
    And open the "PublicNavBarPage" page for uri "/app/galaxee/manager/"
    Then the page's title will be "404 Page Not Found"

  Scenario Outline: 大屏功能权限（RZY-2609）
    When I "checked" the checkbox which name is "可使用 Galaxee"
    And I click the "SaveButton" button
    And I logout current user
    And open the "LoginPage" page for uri "/auth/login/"
    When I set the parameter "Username" with value "AutoTest"
    And I set the parameter "Password" with value "qqqqq11111"
    And I click the "LoginButton" button
    And I wait for "2000" millsecond
    And I will see the "PublicNavBarPage" page
    And I click the "Application" button
    Then I will see the element "App" name is "<name>"
    And open the "PublicNavBarPage" page for uri "/app/galaxee/manager/"
    Then the page's title will be "大屏管理"

    Examples:
      | name                      |
      | 机器学习\n关联搜索\n应用表格\nGalaxee |

#  Scenario: 可使用告警分析（RZY-1207）

  Scenario: 可新建应用（RZY-2610）
    When I "checked" the checkbox which name is "可新建应用"
    And I click the "SaveButton" button
    And I logout current user
    And open the "LoginPage" page for uri "/auth/login/"
    When I set the parameter "Username" with value "AutoTest"
    And I set the parameter "Password" with value "qqqqq11111"
    And I click the "LoginButton" button
    And I wait for "2000" millsecond
    Given delete file "/target/download-files/TempTestApp.tar"
    And open the "app.ListPage" page for uri "/app/list/"
    And I click the "CreateButton" button
    Then I will see the "app.CreatePage" page
    When I set the parameter "NameInput" with value "TempTestApp"
    And I click the "AddMenuButton" button
    And I set the parameter "MenuName" with value "知识"
    And I set the parameter "Url" with value "/knowledge/"
    And I click the "SaveMenuButton" button
    And I choose the "知识" from the "DefaultPage"
    And I click the "CreateButton" button
    Then I will see the success message "请等待下载开始后，点击确定返回列表页，然后等待下载完成"
    Given open the "app.ListPage" page for uri "/app/list/"
    And I click the "InstallButton" button
    Then I will see the "app.InstallPage" page
    When I upload a file with name "/target/download-files/TempTestApp.tar"
    And I will see the element "VerifyText" name is "上传完成"
    And I choose the "AutoTestRole" from the "Role"
    And I choose the "AutoTestLogSource" from the "Resource"
    And I click the "NextButton" button
    And I will see the "GroupPreview" is "active"
    And I click the "NextButton" button
    And I will see the "ResourcePreview" is "active"
    And I click the "NextButton" button
    And I will see the element "ImportSuccess" name is "导入成功"
    Given open the "app.ListPage" page for uri "/app/list/"
    Then I will see the search result contains "{'column':'0','name':'TempTestApp'}"
    Given delete file "/target/download-files/AutoTest.tar"
    And open the "app.ListPage" page for uri "/app/list/"
    When the data name is "AutoTestApp" then i click the "导出" button
    And I will see the "app.CreatePage" page
    And I wait for loading invisible
    And I click the "ExportButton" button
    Then I will see the success message "请等待下载开始后，点击确定返回列表页，然后等待下载完成"

  Scenario: 可修改用户详情（缺少验证同组用户）（RZY-766）
    When I "checked" the checkbox which name is "可修改用户详情"
    And I click the "SaveButton" button
    And I logout current user
    And open the "LoginPage" page for uri "/auth/login/"
    When I set the parameter "Username" with value "AutoTest"
    And I set the parameter "Password" with value "qqqqq11111"
    And I click the "LoginButton" button
    And I wait for "2000" millsecond
    Given open the "users.ListPage" page for uri "/account/users/"
    When I click the detail which name is "{'column':'1','name':'AutoTest'}"
    And I will see the "users.DetailPage" page
    And I click the "EditButton" button
    And I will see the "users.EditPage" page
    And I set the parameter "Telephone" with value "1511111111"
    And I click the "SaveButton" button
    Then I will see the success message "更新成功"

  Scenario: 可导入导出树状日志来源（RZY-1212）
    When I "checked" the checkbox which name is "可导入导出日志来源树状结构"
    And I click the "SaveButton" button
    And I logout current user
    And open the "LoginPage" page for uri "/auth/login/"
    When I set the parameter "Username" with value "AutoTest"
    And I set the parameter "Password" with value "qqqqq11111"
    And I click the "LoginButton" button
    And I wait for "2000" millsecond
    And I will see the "PublicNavBarPage" page
    And I click the "Setting" button
    Then I will see the element "System" name is "来源结构"
    Given open the "sourceGroup.StructurePage" page for uri "/sources/sourcegroups/structure/"
    And I click the "ImportButton" button
    When I upload a file with name "/src/test/resources/testdata/sourceGroups/AutoUploadTest.yaml"
    And I will see the element "VerifyText" name is "上传完成"
    And I click the "NextButton" button
    And I wait for "Preview" will be visible
    And I click the "NextButton" button
    And I wait for "ImportSuccessMsg" will be visible
    And I click the "CompleteButton" button

  Scenario: 可使用模式学习（RZY-1209）
    When I "checked" the checkbox which name is "可使用模式学习"
    And I click the "SaveButton" button
    And I logout current user
    And open the "LoginPage" page for uri "/auth/login/"
    When I set the parameter "Username" with value "AutoTest"
    And I set the parameter "Password" with value "qqqqq11111"
    And I click the "LoginButton" button
    And I wait for "2000" millsecond
    Given open the "splSearch.SearchPage" page for uri "/search/"
    Then I will see the element "SearchTabBar" name is "模式"

  Scenario: 可下载搜索结果（RZY-770）
    When I "checked" the checkbox which name is "可下载搜索结果"
    And I click the "SaveButton" button
    And I logout current user
    And open the "LoginPage" page for uri "/auth/login/"
    When I set the parameter "Username" with value "AutoTest"
    And I set the parameter "Password" with value "qqqqq11111"
    And I click the "LoginButton" button
    And I wait for "2000" millsecond
    And I will see the "PublicNavBarPage" page
    And I click the "Setting" button
    Then I will see the element "Data" name is "日志来源Agent 管理路由配置入库优先级本地上传备份策略下载管理离线任务"
    And open the "PublicNavBarPage" page for uri "/download/"
    Then the page's title will be "下载管理"

  Scenario: 可查看统计菜单（RZY-774）
    When I "checked" the checkbox which name is "可查看统计菜单"
    And I click the "SaveButton" button
    And I logout current user
    And open the "LoginPage" page for uri "/auth/login/"
    When I set the parameter "Username" with value "AutoTest"
    And I set the parameter "Password" with value "qqqqq11111"
    And I click the "LoginButton" button
    And I wait for "2000" millsecond
    Given open the "splSearch.SearchPage" page for uri "/search/"
    Then I will see the element "SearchTabBar" name is "统计"

  Scenario: 授权查看未分配资源（RZY-775）
    When I "checked" the checkbox which name is "可查看未分配资源"
    And I click the "SaveButton" button
    And I logout current user
    And open the "LoginPage" page for uri "/auth/login/"
    When I set the parameter "Username" with value "AutoTest"
    And I set the parameter "Password" with value "qqqqq11111"
    And I click the "LoginButton" button
    And I wait for "2000" millsecond
    Given open the "sourceGroup.ListPage" page for uri "/sources/sourcegroups/"
    Then I will see the column number "1" contains "AutoTestUploadTest"

  Scenario: 删除上传的日志来源以及取消勾选查看未分配资源
    When I "unchecked" the checkbox which name is "可查看未分配资源"
    And I click the "SaveButton" button
    Given open the "sourceGroup.ListPage" page for uri "/sources/sourcegroups/"
    And I wait for loading invisible
    Given the data name is "AutoTestUploadTest" then i click the "删除" button
    Then I click the "Ensure" button
    Then I will see the success message "删除成功"
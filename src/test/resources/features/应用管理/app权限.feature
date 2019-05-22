@all @app @appSmoke
Feature: 应用权限

  Scenario: 在AutoTest用户上安装app
    Given I will see the "PublicNavBarPage" page
    And I wait for "Dashboard" will be visible
    Given I logout current user
    Given I logout current user
    And I wait for title change text to "登录"
    And open the "LoginPage" page for uri "/auth/login/"
    When I set the parameter "Username" with properties "user"
    And I set the parameter "Password" with properties "userPwd"
    And I click the "LoginButton" button
    Given I will see the "PublicNavBarPage" page
    And I wait for "Dashboard" will be visible
    Given open the "app.ListPage" page for uri "/app/list/"
    And I click the "InstallButton" button
    Then I will see the "app.InstallPage" page
    When I upload a file with name "/target/download-files/AutoTestAuth.tar"
    And I will see the element "VerifyText" name is "上传完成"
    And I choose the "role" from the "Role" with property
    And I choose the "source" from the "Resource" with property
    And I click the "NextButton" button
    And I click the "NextButton" button
    And I will see the "ResourcePreview" is "active"
    And I click the "NextButton" button
    And I will see the element "ImportSuccess" name is "导入成功"

  Scenario: RZY-2043:角色权限授权-URL访问
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data properties is "role" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    And I click the "{'TabButton':'URL 访问'}" button
    And I "unchecked" the checkbox which name is "全选"
    And I "checked" the checkbox which name is "应用"
    And I "checked" the checkbox which name is "仪表盘"
    And I click the "{'TabButton':'功能'}" button
    And I "unchecked" the checkbox which name is "全选"
    And I click the "SaveButton" button
    And I logout current user
    And open the "LoginPage" page for uri "/auth/login/"
    When I set the parameter "Username" with properties "user"
    And I set the parameter "Password" with properties "userPwd"
    And I click the "LoginButton" button
    And I wait for "2000" millsecond
    Given open the "app.ListPage" page for uri "/app/list/"
    When the data name is "AutoTestAuth" then i click the "打开" button
    Then I will see the "app.AppPage" page
    And I click the "Alert" button
    Then the page's title will be "403 Permission Denied"
    And I back to before
    And I click the "Limit" button
    Then the page's title will be "403 Permission Denied"
    And I back to before
    And I click the "Report" button
    Then the page's title will be "403 Permission Denied"
    And I back to before
    And I click the "Topology" button
    Then the page's title will be "403 Permission Denied"
    And I back to before
    And I click the "Search" button
    Then the page's title will be "403 Permission Denied"
    And I back to before
    And I click the "TimedTask" button
    Then the page's title will be "403 Permission Denied"
    And I back to before
    And I click the "Trend" button
    Then the page's title will be "403 Permission Denied"
    And I back to before
    And I click the "SearchMacro" button
    Then the page's title will be "403 Permission Denied"
    And I back to before
    And I click the "Config" button
    Then the page's title will be "403 Permission Denied"
    And I back to before
    And I click the "Event" button
    Then the page's title will be "403 Permission Denied"
    And I back to before
    And I click the "Source" button
    Then the page's title will be "403 Permission Denied"
    And I back to before
    And I click the "Agent" button
    Then the page's title will be "403 Permission Denied"
    And I back to before
    And I click the "Indexsetting" button
    Then the page's title will be "403 Permission Denied"
    And I back to before
    And I click the "Ingestpriority" button
    Then the page's title will be "403 Permission Denied"
    And I back to before
    And I click the "Upload" button
    Then the page's title will be "403 Permission Denied"
    And I back to before
    And I click the "Backup" button
    Then the page's title will be "403 Permission Denied"
    And I back to before
    And I click the "Download" button
    Then the page's title will be "403 Permission Denied"
    And I back to before
    And I click the "OfflineTask" button
    Then the page's title will be "403 Permission Denied"
    And I back to before
    And I click the "Knowledge" button
    Then the page's title will be "403 Permission Denied"
    And I back to before
    And I click the "Role" button
    Then the page's title will be "403 Permission Denied"
    And I back to before
    And I click the "ResourceGroup" button
    Then the page's title will be "403 Permission Denied"
    And I back to before
    And I click the "UserGroup" button
    Then the page's title will be "403 Permission Denied"
    And I back to before
    And I click the "Payment" button
    Then the page's title will be "403 Permission Denied"
    And I back to before
    And I click the "User" button
    Then the page's title will be "403 Permission Denied"

  Scenario: 勾选全部URL访问权限
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data properties is "role" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    And I click the "{'TabButton':'URL 访问'}" button
    And I "checked" the checkbox which name is "全选"
    And I click the "SaveButton" button

  Scenario Outline: RZY-2168、2159、2170
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data properties is "role" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    And I click the "{'TabButton':'功能'}" button
    And I "checked" the checkbox which name is "<function>"
    And I click the "SaveButton" button
    And I logout current user
    And open the "LoginPage" page for uri "/auth/login/"
    When I set the parameter "Username" with properties "user"
    And I set the parameter "Password" with properties "userPwd"
    And I click the "LoginButton" button
    And I wait for "2000" millsecond
    Given open the "app.ListPage" page for uri "/app/list/"
    When the data name is "AutoTestAuth" then i click the "打开" button
    Then I will see the "app.AppPage" page
    And I click the "<tab>" button
    Then the page's title will be "<title>"

    Examples:
      | function | tab            | title |
      | 可使用入库优先级 | Ingestpriority | 入库优先级 |
      | 可使用离线任务  | OfflineTask    | 离线任务  |
      | 可使用结算管理  | Payment        | 结算管理  |

  Scenario Outline: RZY-2165、2173
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data properties is "role" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    And I click the "{'TabButton':'功能'}" button
    And I "checked" the checkbox which name is "<function>"
    And I click the "SaveButton" button
    And I logout current user
    And open the "LoginPage" page for uri "/auth/login/"
    When I set the parameter "Username" with properties "user"
    And I set the parameter "Password" with properties "userPwd"
    And I click the "LoginButton" button
    And I wait for "2000" millsecond
    Given open the "app.ListPage" page for uri "/app/list/"
    When the data name is "AutoTestAuth" then i click the "打开" button
    Then I will see the "app.AppPage" page
    And I click the "<tab>" button
    Then I will see the "<page>" page
    And I wait for "<button>" will be visible

    Examples:
      | function    | tab           | page                    | button                  |
      | 可使用资源包导入、导出 | ResourceGroup | resourceGroups.ListPage | UploadAndDownloadButton |
      | 可新建角色       | Role          | roles.ListPage          | CreateRoleButton        |

  Scenario: RZY-2162:不勾选时验证无最大搜索时长
    Given I logout current user
    And I logout current user
    And I wait for title change text to "登录"
    And open the "LoginPage" page for uri "/auth/login/"
    When I set the parameter "Username" with properties "user"
    And I set the parameter "Password" with properties "userPwd"
    And I click the "LoginButton" button
    And I wait for "2000" millsecond
    Given open the "app.ListPage" page for uri "/app/list/"
    When the data name is "AutoTestAuth" then i click the "打开" button
    Then I will see the "app.AppPage" page
    And I click the "Role" button
    When the data properties is "role" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    And I click the "{'TabButton':'功能'}" button
    Then I will see the "MaxLength" doesn't exist

  Scenario: RZY-2162:勾选时验证有最大搜索时长
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data properties is "role" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    And I click the "{'TabButton':'功能'}" button
    And I "checked" the checkbox which name is "可更新最大搜索时长"
    And I click the "SaveButton" button
    And I logout current user
    And I logout current user
    And I wait for title change text to "登录"
    And open the "LoginPage" page for uri "/auth/login/"
    When I set the parameter "Username" with properties "user"
    And I set the parameter "Password" with properties "userPwd"
    And I click the "LoginButton" button
    And I wait for "2000" millsecond
    Given open the "app.ListPage" page for uri "/app/list/"
    When the data name is "AutoTestAuth" then i click the "打开" button
    Then I will see the "app.AppPage" page
    And I click the "Role" button
    When the data properties is "role" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    And I click the "{'TabButton':'功能'}" button
    Then I set the parameter "MaxLength" with value "max"

  Scenario: RZY-2175:不勾选转授功能权限
    Given I logout current user
    And I logout current user
    And I wait for title change text to "登录"
    And open the "LoginPage" page for uri "/auth/login/"
    When I set the parameter "Username" with properties "user"
    And I set the parameter "Password" with properties "userPwd"
    And I click the "LoginButton" button
    And I wait for "2000" millsecond
    Given open the "app.ListPage" page for uri "/app/list/"
    When the data name is "AutoTestAuth" then i click the "打开" button
    Then I will see the "app.AppPage" page
    And I click the "Role" button
    When the data properties is "role" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    And I click the "{'TabButton':'功能'}" button
    Then I will see the "FunctionCheckbox" doesn't exist
    And I click the "{'TabButton':'URL 访问'}" button
    Then I will see the "CheckboxGroup" doesn't exist

  Scenario: RZY-2175:勾选转授功能权限
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data properties is "role" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    And I click the "{'TabButton':'功能'}" button
    And I "checked" the checkbox which name is "可转授功能权限"
    And I click the "SaveButton" button
    And I logout current user
    And I logout current user
    And I wait for title change text to "登录"
    And open the "LoginPage" page for uri "/auth/login/"
    When I set the parameter "Username" with properties "user"
    And I set the parameter "Password" with properties "userPwd"
    And I click the "LoginButton" button
    And I wait for "2000" millsecond
    Given open the "app.ListPage" page for uri "/app/list/"
    When the data name is "AutoTestAuth" then i click the "打开" button
    Then I will see the "app.AppPage" page
    And I click the "Role" button
    When the data properties is "role" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    And I click the "{'TabButton':'功能'}" button
    Then I wait for "FunctionCheckbox" will be visible
    And I click the "{'TabButton':'URL 访问'}" button
    Then I wait for "CheckboxGroup" will be visible

  Scenario: RZY-2172:不勾选新建告警插件
    Given I logout current user
    And I logout current user
    And I wait for title change text to "登录"
    And open the "LoginPage" page for uri "/auth/login/"
    When I set the parameter "Username" with properties "user"
    And I set the parameter "Password" with properties "userPwd"
    And I click the "LoginButton" button
    And I wait for "2000" millsecond
    Given open the "app.ListPage" page for uri "/app/list/"
    When the data name is "AutoTestAuth" then i click the "打开" button
    Then I will see the "app.AppPage" page
    And I click the "Alert" button
    Then I will see the "alert.ListPage" page
    And I click the "AlertPlugin" button
    And I will see the "alert.PluginPage" page
    Then I will see the "Upload" doesn't exist

  Scenario: RZY-2172:勾选新建告警插件
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data properties is "role" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    And I click the "{'TabButton':'功能'}" button
    And I "checked" the checkbox which name is "可新建/更新告警插件"
    And I click the "SaveButton" button
    And I logout current user
    And I logout current user
    And I wait for title change text to "登录"
    And open the "LoginPage" page for uri "/auth/login/"
    When I set the parameter "Username" with properties "user"
    And I set the parameter "Password" with properties "userPwd"
    And I click the "LoginButton" button
    And I wait for "2000" millsecond
    Given open the "app.ListPage" page for uri "/app/list/"
    When the data name is "AutoTestAuth" then i click the "打开" button
    Then I will see the "app.AppPage" page
    And I click the "Alert" button
    Then I will see the "alert.ListPage" page
    And I click the "AlertPlugin" button
    And I will see the "alert.PluginPage" page
    Then I click the "Upload" button

  Scenario: RZY-2194:不勾选新建应用
    Given I logout current user
    And I logout current user
    And I wait for title change text to "登录"
    And open the "LoginPage" page for uri "/auth/login/"
    When I set the parameter "Username" with properties "user"
    And I set the parameter "Password" with properties "userPwd"
    And I click the "LoginButton" button
    And I wait for "2000" millsecond
    Given open the "app.ListPage" page for uri "/app/list/"
    Then I will see the "CreateButton" doesn't exist

  Scenario: RZY-2194:勾选新建应用
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data properties is "role" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    And I click the "{'TabButton':'功能'}" button
    And I "checked" the checkbox which name is "可新建应用"
    And I click the "SaveButton" button
    And I logout current user
    And I logout current user
    And I wait for title change text to "登录"
    And open the "LoginPage" page for uri "/auth/login/"
    When I set the parameter "Username" with properties "user"
    And I set the parameter "Password" with properties "userPwd"
    And I click the "LoginButton" button
    And I wait for "2000" millsecond
    Given open the "app.ListPage" page for uri "/app/list/"
    And I click the "CreateButton" button

  Scenario: RZY-2167:不勾选可更改用户详情
    Given I logout current user
    And I logout current user
    And I wait for title change text to "登录"
    And open the "LoginPage" page for uri "/auth/login/"
    When I set the parameter "Username" with properties "user"
    And I set the parameter "Password" with properties "userPwd"
    And I click the "LoginButton" button
    And I wait for "2000" millsecond
    Given open the "app.ListPage" page for uri "/app/list/"
    When the data name is "AutoTestAuth" then i click the "打开" button
    Then I will see the "app.AppPage" page
    And I click the "User" button
    When the data properties is "{'column':'1','name':'user'}" then i click the "查看" button
    And I will see the "users.DetailPage" page
    Then I will see the "EditButton" doesn't exist

  Scenario: RZY-2167:勾选可更改用户详情
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data properties is "role" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    And I click the "{'TabButton':'功能'}" button
    And I "checked" the checkbox which name is "可修改用户详情"
    And I click the "SaveButton" button
    And I logout current user
    And I logout current user
    And I wait for title change text to "登录"
    And open the "LoginPage" page for uri "/auth/login/"
    When I set the parameter "Username" with properties "user"
    And I set the parameter "Password" with properties "userPwd"
    And I click the "LoginButton" button
    And I wait for "2000" millsecond
    Given open the "app.ListPage" page for uri "/app/list/"
    When the data name is "AutoTestAuth" then i click the "打开" button
    Then I will see the "app.AppPage" page
    And I click the "User" button
    When the data properties is "{'column':'1','name':'user'}" then i click the "查看" button
    And I will see the "users.DetailPage" page
    Then I click the "EditButton" button

  Scenario: RZY-2163:不勾选模式学习
    Given I logout current user
    And I logout current user
    And I wait for title change text to "登录"
    And open the "LoginPage" page for uri "/auth/login/"
    When I set the parameter "Username" with properties "user"
    And I set the parameter "Password" with properties "userPwd"
    And I click the "LoginButton" button
    And I wait for "2000" millsecond
    Given open the "app.ListPage" page for uri "/app/list/"
    When the data name is "AutoTestAuth" then i click the "打开" button
    Then I will see the "app.AppPage" page
    And I click the "Search" button
    And I will see the "splSearch.SearchPage" page
    Then I will see the "Mode" doesn't exist

  Scenario: RZY-2163:勾选模式学习
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data properties is "role" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    And I click the "{'TabButton':'功能'}" button
    And I "checked" the checkbox which name is "可使用模式学习"
    And I click the "SaveButton" button
    And I logout current user
    And I logout current user
    And I wait for title change text to "登录"
    And open the "LoginPage" page for uri "/auth/login/"
    When I set the parameter "Username" with properties "user"
    And I set the parameter "Password" with properties "userPwd"
    And I click the "LoginButton" button
    And I wait for "2000" millsecond
    Given open the "app.ListPage" page for uri "/app/list/"
    When the data name is "AutoTestAuth" then i click the "打开" button
    Then I will see the "app.AppPage" page
    And I click the "Search" button
    And I will see the "splSearch.SearchPage" page
    Then I click the "Mode" button

  Scenario: RZY-2171:不勾选可下载搜索结果
    Given I logout current user
    And I logout current user
    And I wait for title change text to "登录"
    And open the "LoginPage" page for uri "/auth/login/"
    When I set the parameter "Username" with properties "user"
    And I set the parameter "Password" with properties "userPwd"
    And I click the "LoginButton" button
    And I wait for "2000" millsecond
    Given open the "app.ListPage" page for uri "/app/list/"
    When the data name is "AutoTestAuth" then i click the "打开" button
    Then I will see the "app.AppPage" page
    And I click the "Search" button
    And I will see the "splSearch.SearchPage" page
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait element "SearchStatus" change text to "搜索完成!"
    Then I will see the "DownloadButton" doesn't exist

  Scenario: RZY-2171:勾选可下载搜索结果
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data properties is "role" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    And I click the "{'TabButton':'功能'}" button
    And I "checked" the checkbox which name is "可下载搜索结果"
    And I click the "SaveButton" button
    And I logout current user
    And I logout current user
    And I wait for title change text to "登录"
    And open the "LoginPage" page for uri "/auth/login/"
    When I set the parameter "Username" with properties "user"
    And I set the parameter "Password" with properties "userPwd"
    And I click the "LoginButton" button
    And I wait for "2000" millsecond
    Given open the "app.ListPage" page for uri "/app/list/"
    When the data name is "AutoTestAuth" then i click the "打开" button
    Then I will see the "app.AppPage" page
    And I click the "Search" button
    And I will see the "splSearch.SearchPage" page
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait element "SearchStatus" change text to "搜索完成!"
    Then I click the "DownloadButton" button

  Scenario: RZY-2177:不勾选可查看统计菜单
    Given I logout current user
    And I logout current user
    And I wait for title change text to "登录"
    And open the "LoginPage" page for uri "/auth/login/"
    When I set the parameter "Username" with properties "user"
    And I set the parameter "Password" with properties "userPwd"
    And I click the "LoginButton" button
    And I wait for "2000" millsecond
    Given open the "app.ListPage" page for uri "/app/list/"
    When the data name is "AutoTestAuth" then i click the "打开" button
    Then I will see the "app.AppPage" page
    And I click the "Search" button
    And I will see the "splSearch.SearchPage" page
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait element "SearchStatus" change text to "搜索完成!"
    Then I will see the "CountButton" doesn't exist

  Scenario: RZY-2177:勾选可查看统计菜单
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data properties is "role" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    And I click the "{'TabButton':'功能'}" button
    And I "checked" the checkbox which name is "可查看统计菜单"
    And I click the "SaveButton" button
    And I logout current user
    And I logout current user
    And I wait for title change text to "登录"
    And open the "LoginPage" page for uri "/auth/login/"
    When I set the parameter "Username" with properties "user"
    And I set the parameter "Password" with properties "userPwd"
    And I click the "LoginButton" button
    And I wait for "2000" millsecond
    Given open the "app.ListPage" page for uri "/app/list/"
    When the data name is "AutoTestAuth" then i click the "打开" button
    Then I will see the "app.AppPage" page
    And I click the "Search" button
    And I will see the "splSearch.SearchPage" page
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait element "SearchStatus" change text to "搜索完成!"
    Then I click the "CountButton" button

  Scenario: 不勾选用户新建
    Given I logout current user
    And I logout current user
    And I wait for title change text to "登录"
    And open the "LoginPage" page for uri "/auth/login/"
    When I set the parameter "Username" with properties "user"
    And I set the parameter "Password" with properties "userPwd"
    And I click the "LoginButton" button
    And I wait for "2000" millsecond
    Given open the "app.ListPage" page for uri "/app/list/"
    When the data name is "AutoTestAuth" then i click the "打开" button
    Then I will see the "app.AppPage" page
    And I click the "User" button
    And I will see the "users.ListPage" page
    Then I will see the "CreateUser" doesn't exist

  Scenario: 勾选用户新建
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data properties is "role" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    And I "checked" the checkbox which name is "新建用户"
    And I click the "SaveButton" button
    And I logout current user
    And I logout current user
    And I wait for title change text to "登录"
    And open the "LoginPage" page for uri "/auth/login/"
    When I set the parameter "Username" with properties "user"
    And I set the parameter "Password" with properties "userPwd"
    And I click the "LoginButton" button
    And I wait for "2000" millsecond
    Given open the "app.ListPage" page for uri "/app/list/"
    When the data name is "AutoTestAuth" then i click the "打开" button
    Then I will see the "app.AppPage" page
    And I click the "User" button
    And I will see the "users.ListPage" page
    And I click the "CreateUser" button
    And I will see the "users.CreatePage" page
    When I set the parameter "UserName" with value "AutoAppTest2166"
    And I set the parameter "Email" with value "AutoAppTest2166@163.com"
    And I set the parameter "Password" with value "all123456"
    And I choose the "group" from the "UserGroups" with property
    And I click the "CreateButton" button
    Then I wait for "SuccessMessage" will be visible

  Scenario: 锁定用户账号
    Given I logout current user
    Given I logout current user
    And I wait for title change text to "登录"
    And open the "LoginPage" page for uri "/auth/login/"
    Given I run a method "Login" for "10" times with parameters "{'name':'AutoAppTest2166','password':'123'}"
    When I set the parameter "Username" with value "AutoAppTest2166"
    And I set the parameter "Password" with value "123"
    And I click the "LoginButton" button
    Then I will see the error message contains "账号已锁"

  Scenario: RZY-2166:可解锁用户
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data properties is "role" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    And I click the "{'TabButton':'功能'}" button
    And I "checked" the checkbox which name is "可解锁用户"
    And I click the "SaveButton" button
    And I logout current user
    And I logout current user
    And I wait for title change text to "登录"
    And open the "LoginPage" page for uri "/auth/login/"
    When I set the parameter "Username" with properties "user"
    And I set the parameter "Password" with properties "userPwd"
    And I click the "LoginButton" button
    And I wait for "2000" millsecond
    Given open the "app.ListPage" page for uri "/app/list/"
    When the data name is "AutoTestAuth" then i click the "打开" button
    Then I will see the "app.AppPage" page
    And I click the "User" button
    Then the data name is "{'column':'1','name':'AutoAppTest2166'}" then i click the "解锁" button
    And I refresh the website
    And I click the "Role" button
    Then I will see the search result "{'column':'0','name':'AutoTestRole'}"

  Scenario Outline: RZY-2178:未勾选可查看未分配资源
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    When I click the "CreateButton" button
    Then I set the parameter "DashBoardName" with value "<name>"
    And I click the "EnsureCreateButton" button
    And I logout current user
    And I logout current user
    And I wait for title change text to "登录"
    And open the "LoginPage" page for uri "/auth/login/"
    When I set the parameter "Username" with properties "user"
    And I set the parameter "Password" with properties "userPwd"
    And I click the "LoginButton" button
    And I wait for "2000" millsecond
    Given open the "app.ListPage" page for uri "/app/list/"
    When the data name is "AutoTestAuth" then i click the "打开" button
    Then I will see the "app.AppPage" page
    And I click the "Dashboard" button
    Then I will see the search result "{'column':'0','name':'<name>','contains':'no'}"

    Examples:
      | name      |
      | AppCreate |

  Scenario: RZY-2178:勾选可查看未分配资源
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data properties is "role" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    And I click the "{'TabButton':'功能'}" button
    And I "checked" the checkbox which name is "可查看未分配资源"
    And I click the "SaveButton" button
    And I logout current user
    And I logout current user
    And I wait for title change text to "登录"
    And open the "LoginPage" page for uri "/auth/login/"
    When I set the parameter "Username" with properties "user"
    And I set the parameter "Password" with properties "userPwd"
    And I click the "LoginButton" button
    And I wait for "2000" millsecond
    Given open the "app.ListPage" page for uri "/app/list/"
    When the data name is "AutoTestAuth" then i click the "打开" button
    Then I will see the "app.AppPage" page
    And I click the "Dashboard" button
    Then I will see the search result "{'column':'0','name':'AppCreate'}"

  Scenario: RZY-2176:可编辑所有角色权限
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data properties is "role" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    And I click the "{'TabButton':'功能'}" button
    And I "checked" the checkbox which name is "编辑所有角色权限"
    And I click the "SaveButton" button
    Given open the "users.ListPage" page for uri "/account/users/"
    When the data name is "{'column':'1','name':'AutoAppTest2166'}" then i click the "删除" button
    And I click the "EnsureButton" button
    And I will see the success message "删除成功"
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    Given the data name is "AppCreate" then i click the "删除" button
    Then I click the "EnsureDeleteButton" button
    And I logout current user
    And I logout current user
    And I wait for title change text to "登录"
    And open the "LoginPage" page for uri "/auth/login/"
    When I set the parameter "Username" with properties "user"
    And I set the parameter "Password" with properties "userPwd"
    And I click the "LoginButton" button
    And I wait for "2000" millsecond
    Given open the "app.ListPage" page for uri "/app/list/"
    When the data name is "AutoTestAuth" then i click the "打开" button
    Then I will see the "app.AppPage" page
    And I click the "Role" button
    Then I will see the search result contains "{'column':'0','name':'admin'}"

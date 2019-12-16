@auth
Feature: 权限-应用列表页

  Scenario: 新建应用所需数据集
    Given open the "dataset.ListPage" page for uri "/dataset/"
    And I click the "Create" button
    And I set the parameter "Name" with value "AutoTestForApp"
    And I set the parameter "Alias" with value "app"
    And I set the parameter "Spl" with value "*"
    And I click the "Save" button

  Scenario: 授权可使用应用功能,可新建应用,可使用数据集,数据集操作权限
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "__user_AutoTest__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    Then I click the "{'TabButton':'功能'}" button
    And I wait for "Loading" will be invisible
    When I "checked" the checkbox which name is "全选"
    And I "unchecked" the checkbox which name is "全选"
    And I "checked" the checkbox which name is "可使用应用功能,可新建应用,可使用数据集"
    And I click the "SaveButton" button
    And I will see the success message "保存成功"

  Scenario Outline: 验证可新建应用
    Given I will see the "PublicNavBarPage" page
    And I wait for "Dashboard" will be visible
    And I wait for loading invisible
    And I logout current user
    And I wait for title change text to "登录"
    And open the "LoginPage" page for uri "/auth/login/"
    When I set the parameter "Username" with value "AutoTest"
    And I set the parameter "Password" with value "all123456"
    And I click the "LoginButton" button
    And I wait for "2000" millsecond
    Given open the "app.ListPage" page for uri "/app/list/"
    And I click the "CreateButton" button
    Then I will see the "app.CreatePage" page
    Given delete file "/target/download-files/<name>.tar"
    And I set the parameter "NameInput" with value "<name>"
    And I click the "AddMenuButton" button
    And I wait for "MenuName" will be visible
    And I set the parameter "MenuName" with value "<menuName>"
    And I set the parameter "Url" with value "<url>"
    And I click the "SaveMenuButton" button
    And I choose the "<menuName>" from the "DefaultPage"
    And I click the "ColorPicker" button
    And I set the parameter "ColorValue" with value "<color>"
    And I click the "EnsureColourButton" button
    And I click the "CreateButton" button
    Then I will see the success message "请等待下载开始后，点击确定返回列表页，然后等待下载完成"

    Examples:
      | name            | menuName | url            | color   |
      | EventAppForAuth | 事件操作     | /event/action/ | #68E632 |

  Scenario: 授权可使用应用功能
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "__user_AutoTest__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    Then I click the "{'TabButton':'功能'}" button
    And I wait for "Loading" will be invisible
    When I "checked" the checkbox which name is "全选"
    And I "unchecked" the checkbox which name is "全选"
    And I "checked" the checkbox which name is "可使用应用功能,可使用数据集"
    And I click the "SaveButton" button
    And I will see the success message "保存成功"
    Then I click the "{'TabButton':'数据集'}" button
    And I wait for "Loading" will be invisible
    And I "checked" the label before "AutoTestForApp"
    And I click the "SaveButton" button

  Scenario: 无新建权限
    Given I will see the "PublicNavBarPage" page
    And I wait for "Dashboard" will be visible
    And I wait for loading invisible
    And I logout current user
    And I wait for title change text to "登录"
    And open the "LoginPage" page for uri "/auth/login/"
    When I set the parameter "Username" with value "AutoTest"
    And I set the parameter "Password" with value "all123456"
    And I click the "LoginButton" button
    And I wait for "2000" millsecond
    Given open the "app.ListPage" page for uri "/app/list/"
    Then I will see the "CreateButton" doesn't exist
    And I click the "InstallButton" button
    Then I will see the "app.InstallPage" page
    And I wait for "AddDataset" will be visible
    When I upload a file with name "/target/download-files/EventAppForAuth.tar"
    Then I wait for "NoAuth" will be visible
    And I choose the "__user_AutoTest__" from the "Role"
    And I click the "AddDataset" button
    And I set the parameter "SearchInput" with value "app"
    And I click the "SearchIcon" button
    And I click the "ResultDataset" button
    And I click the "Ensure" button
    And I click the "NextButton" button under some element
    Then I will see the error message "您上传的应用包有误，或没有操作该APP的权限，请重新上传应用包"

  Scenario: 授权新建权限
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "__user_AutoTest__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    Then I click the "{'TabButton':'数据集'}" button
    And I wait for "Loading" will be invisible
    And I "checked" the label before "AutoTestForApp"
    And I click the "SaveButton" button
    And I will see the success message "保存成功"
    Then I click the "{'TabButton':'功能'}" button
    And I wait for "Loading" will be invisible
    When I "checked" the checkbox which name is "全选"
    And I click the "SaveButton" button

  Scenario: 安装应用
    Given I will see the "PublicNavBarPage" page
    And I wait for "Dashboard" will be visible
    And I logout current user
    And I wait for title change text to "登录"
    And open the "LoginPage" page for uri "/auth/login/"
    When I set the parameter "Username" with value "AutoTest"
    And I set the parameter "Password" with value "all123456"
    And I click the "LoginButton" button
    And I wait for "2000" millsecond
    Given open the "app.ListPage" page for uri "/app/list/"
    And I click the "InstallButton" button
    Then I will see the "app.InstallPage" page
    And I wait for "AddDataset" will be visible
    When I upload a file with name "/target/download-files/EventAppForAuth.tar"
    And I will see the element "VerifyText" name is "上传完成"
    And I choose the "__user_AutoTest__" from the "Role"
    And I click the "AddDataset" button
    And I set the parameter "SearchInput" with value "app"
    And I click the "SearchIcon" button
    And I click the "ResultDataset" button
    And I click the "Ensure" button
    And I click the "NextButton" button under some element
    And I click the "NextButton" button
    And I wait for "ImportSuccess" will be visible
    And I will see the element "ImportSuccess" name is "导入成功"

  Scenario: 验证无新建权限下安装包
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "__user_AutoTest__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    Then I click the "{'TabButton':'功能'}" button
    And I wait for "Loading" will be invisible
    When I "checked" the checkbox which name is "全选"
    And I "unchecked" the checkbox which name is "全选"
    And I "checked" the checkbox which name is "可使用应用功能,可使用数据集"
    And I click the "SaveButton" button
    And I will see the success message "保存成功"
    Given I will see the "PublicNavBarPage" page
    And I wait for "Dashboard" will be visible
    And I logout current user
    And I wait for title change text to "登录"
    And open the "LoginPage" page for uri "/auth/login/"
    When I set the parameter "Username" with value "AutoTest"
    And I set the parameter "Password" with value "all123456"
    And I click the "LoginButton" button
    And I wait for "2000" millsecond
    Given open the "app.ListPage" page for uri "/app/list/"
    And I click the "InstallButton" button
    Then I will see the "app.InstallPage" page
    And I wait for "AddDataset" will be visible
    When I upload a file with name "/target/download-files/EventAppForAuth.tar"
    And I will see the element "VerifyText" name is "上传完成"
    And I choose the "__user_AutoTest__" from the "Role"
    And I click the "AddDataset" button
    And I set the parameter "SearchInput" with value "app"
    And I click the "SearchIcon" button
    And I click the "ResultDataset" button
    And I click the "Ensure" button
    And I click the "NextButton" button under some element
    And I click the "NextButton" button
    And I wait for "ImportSuccess" will be visible
    And I will see the element "ImportSuccess" name is "导入成功"

  Scenario Outline: admin用户中新建应用
    Given open the "app.ListPage" page for uri "/app/list/"
    And I click the "CreateButton" button
    Then I will see the "app.CreatePage" page
    Given delete file "/target/download-files/<name>.tar"
    When I set the parameter "NameInput" with value "<name>"
    And I wait for "ResourceConfig" will be invisible
    And I click the "AddMenuButton" button
    And I set the parameter "MenuName" with value "监控"
    And I set the parameter "Url" with value "/alerts/"
    And I click the "SaveMenuButton" button
    And I click the "AddMenuButton" button under some element
    And I set the parameter "MenuName" with value "使用限额"
    And I set the parameter "Url" with value "/account/usage/"
    And I click the "SaveMenuButton" button
    And I click the "AddMenuButton" button under some element
    And I set the parameter "MenuName" with value "报表"
    And I set the parameter "Url" with value "/reports/"
    And I click the "SaveMenuButton" button
    And I click the "AddMenuButton" button under some element
    And I set the parameter "MenuName" with value "拓扑图"
    And I set the parameter "Url" with value "/topology/"
    And I click the "SaveMenuButton" button
    And I click the "AddMenuButton" button under some element
    And I set the parameter "MenuName" with value "搜索"
    And I set the parameter "Url" with value "/search/"
    And I click the "SaveMenuButton" button
    And I click the "AddMenuButton" button under some element
    And I set the parameter "MenuName" with value "仪表盘"
    And I set the parameter "Url" with value "/dashboard/"
    And I click the "SaveMenuButton" button
    And I click the "AddMenuButton" button under some element
    And I set the parameter "MenuName" with value "定时任务"
    And I set the parameter "Url" with value "/schedule/"
    And I click the "SaveMenuButton" button
    And I click the "AddMenuButton" button under some element
    And I set the parameter "MenuName" with value "趋势图"
    And I set the parameter "Url" with value "/trend/"
    And I click the "SaveMenuButton" button
    And I click the "AddMenuButton" button under some element
    And I set the parameter "MenuName" with value "知识"
    And I set the parameter "Url" with value "/knowledge/"
    And I click the "SaveMenuButton" button
    And I click the "AddMenuButton" button under some element
    And I set the parameter "MenuName" with value "搜索宏"
    And I set the parameter "Url" with value "/macro/"
    And I click the "SaveMenuButton" button
    And I click the "AddMenuButton" button under some element
    And I set the parameter "MenuName" with value "字段提取"
    And I set the parameter "Url" with value "/configs/"
    And I click the "SaveMenuButton" button
    And I click the "AddMenuButton" button under some element
    And I set the parameter "MenuName" with value "事件操作"
    And I set the parameter "Url" with value "/event/action/"
    And I click the "SaveMenuButton" button
    And I click the "AddMenuButton" button under some element
    And I set the parameter "MenuName" with value "日志来源"
    And I set the parameter "Url" with value "/sources/sourcegroups/"
    And I click the "SaveMenuButton" button
    And I click the "AddMenuButton" button under some element
    And I set the parameter "MenuName" with value "Agent管理"
    And I set the parameter "Url" with value "/sources/input/agent/"
    And I click the "SaveMenuButton" button
    And I click the "AddMenuButton" button under some element
    And I set the parameter "MenuName" with value "路由配置"
    And I set the parameter "Url" with value "/indexsettings/indexmatchrule/"
    And I click the "SaveMenuButton" button
    And I click the "AddMenuButton" button under some element
    And I set the parameter "MenuName" with value "入库优先级"
    And I set the parameter "Url" with value "/ingestpriority/"
    And I click the "SaveMenuButton" button
    And I click the "AddMenuButton" button under some element
    And I set the parameter "MenuName" with value "本地上传"
    And I set the parameter "Url" with value "/sources/input/os/"
    And I click the "SaveMenuButton" button
    And I click the "AddMenuButton" button under some element
    And I set the parameter "MenuName" with value "备份策略"
    And I set the parameter "Url" with value "/backup/"
    And I click the "SaveMenuButton" button
    And I click the "AddMenuButton" button under some element
    And I set the parameter "MenuName" with value "下载管理"
    And I set the parameter "Url" with value "/download/"
    And I click the "SaveMenuButton" button
    And I click the "AddMenuButton" button under some element
    And I set the parameter "MenuName" with value "离线任务"
    And I set the parameter "Url" with value "/offlinetask/"
    And I click the "SaveMenuButton" button
    And I click the "AddMenuButton" button under some element
    And I set the parameter "MenuName" with value "角色权限"
    And I set the parameter "Url" with value "/account/roles/"
    And I click the "SaveMenuButton" button
    And I click the "AddMenuButton" button under some element
    And I set the parameter "MenuName" with value "资源分组管理"
    And I set the parameter "Url" with value "/account/resourcegroups/"
    And I click the "SaveMenuButton" button
    And I click the "AddMenuButton" button under some element
    And I set the parameter "MenuName" with value "用户分组"
    And I set the parameter "Url" with value "/account/usergroups/"
    And I click the "SaveMenuButton" button
    And I click the "AddMenuButton" button under some element
    And I set the parameter "MenuName" with value "结算管理"
    And I set the parameter "Url" with value "/payments/"
    And I click the "SaveMenuButton" button
    And I click the "AddMenuButton" button under some element
    And I set the parameter "MenuName" with value "用户管理"
    And I set the parameter "Url" with value "/account/users/"
    And I click the "SaveMenuButton" button
    And I choose the "仪表盘" from the "DefaultPage"
    And I click the "ColorPicker" button
    And I set the parameter "ColorValue" with value "#68E632"
    And I click the "EnsureColourButton" button
    And I click the "OverallSituation" button
    And I click the "CreateButton" button
    Then I will see the success message "请等待下载开始后，点击确定返回列表页，然后等待下载完成"

    Examples:
      | name            |
      | AutoTestForAuth |

  Scenario: admin用户中安装应用
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "__user_AutoTest__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    Then I click the "{'TabButton':'功能'}" button
    And I wait for "Loading" will be invisible
    When I "checked" the checkbox which name is "全选"
    And I "unchecked" the checkbox which name is "全选"
    And I "checked" the checkbox which name is "可使用应用功能,可新建应用,可使用数据集"
    And I click the "SaveButton" button
    And I will see the success message "保存成功"
    Given open the "app.ListPage" page for uri "/app/list/"
    And I click the "InstallButton" button
    Then I will see the "app.InstallPage" page
    And I wait for "AddDataset" will be visible
    When I upload a file with name "/target/download-files/AutoTestForAuth.tar"
    And I will see the element "VerifyText" name is "上传完成"
    And I choose the "__user_AutoTest__" from the "Role"
    And I click the "AddDataset" button
    And I set the parameter "SearchInput" with value "app"
    And I click the "SearchIcon" button
    And I click the "ResultDataset" button
    And I click the "Ensure" button
    And I click the "NextButton" button under some element
    And I click the "NextButton" button
    And I wait for "ImportSuccess" will be visible
    And I will see the element "ImportSuccess" name is "导入成功"

  Scenario: 在AutoTest用户安装无更新权限的app
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "__user_AutoTest__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    Then I click the "{'TabButton':'应用'}" button
    And I wait for "Loading" will be invisible
    When I "checked" the label before "AutoTestForAuth"
    When I "unchecked" the label before "AutoTestForAuth"
    And I click the "SaveButton" button
    And I will see the success message "保存成功"
    Given I will see the "PublicNavBarPage" page
    And I wait for "Dashboard" will be visible
    And I wait for loading invisible
    And I logout current user
    And I wait for title change text to "登录"
    And open the "LoginPage" page for uri "/auth/login/"
    When I set the parameter "Username" with value "AutoTest"
    And I set the parameter "Password" with value "all123456"
    And I click the "LoginButton" button
    And I wait for "2000" millsecond
    Given open the "app.ListPage" page for uri "/app/list/"
    And I click the "InstallButton" button
    Then I will see the "app.InstallPage" page
    And I wait for "AddDataset" will be visible
    When I upload a file with name "/target/download-files/AutoTestForAuth.tar"
    Then I wait for "NoResourceAuth" will be visible
    And I choose the "__user_AutoTest__" from the "Role"
    And I click the "AddDataset" button
    And I set the parameter "SearchInput" with value "app"
    And I click the "SearchIcon" button
    And I click the "ResultDataset" button
    And I click the "Ensure" button
    And I click the "NextButton" button under some element
    Then I will see the error message "您上传的应用包有误，或没有操作该APP的权限，请重新上传应用包"

  Scenario Outline: 授权读取
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "__user_AutoTest__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    Then I click the "{'TabButton':'功能'}" button
    And I wait for "Loading" will be invisible
    When I "checked" the checkbox which name is "全选"
    And I "unchecked" the checkbox which name is "全选"
    And I "checked" the checkbox which name is "可使用应用功能,可使用数据集"
    And I click the "SaveButton" button
    And I will see the success message "保存成功"
    Then I click the "{'TabButton':'应用'}" button
    And I wait for "Loading" will be invisible
    When I "checked" the label before "<name>"
    And I "unchecked" the label before "<name>"
    And I "checked" function "读取" from the auth table which name is "<name>"
    And I click the "SaveButton" button
    Given I will see the "PublicNavBarPage" page
    And I wait for "Dashboard" will be visible
    And I logout current user
    And I wait for title change text to "登录"
    And open the "LoginPage" page for uri "/auth/login/"
    When I set the parameter "Username" with value "AutoTest"
    And I set the parameter "Password" with value "all123456"
    And I click the "LoginButton" button
    And I wait for "2000" millsecond
    Given open the "app.ListPage" page for uri "/app/list/"
    And I wait for loading invisible
    Then the data name is "{'column':'0','name':'<name>'}" then i will see "打开查看" button
    When the data name is "<name>" then i click the "打开" button
    Then the page's title will be "403 Permission Denied"
    Given open the "app.ListPage" page for uri "/app/list/"
    And the data name is "<name>" then i click the "查看" button
    And I wait for loading invisible
    Then I will see the element "NameText" name is "<name>"

    Examples:
      | name            |
      | AutoTestForAuth |

  Scenario Outline: 授权读取+编辑
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "__user_AutoTest__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    Then I click the "{'TabButton':'功能'}" button
    And I wait for "Loading" will be invisible
    When I "checked" the checkbox which name is "全选"
    And I "unchecked" the checkbox which name is "全选"
    And I "checked" the checkbox which name is "可使用应用功能,可使用数据集,可使用入库优先级"
    And I click the "SaveButton" button
    And I will see the success message "保存成功"
    Then I click the "{'TabButton':'应用'}" button
    And I wait for "Loading" will be invisible
    When I "checked" the label before "<name>"
    And I "unchecked" function "删除,转授" from the auth table which name is "<name>"
    And I click the "SaveButton" button
    Given I will see the "PublicNavBarPage" page
    And I wait for "Dashboard" will be visible
    And I logout current user
    And I wait for title change text to "登录"
    And open the "LoginPage" page for uri "/auth/login/"
    When I set the parameter "Username" with value "AutoTest"
    And I set the parameter "Password" with value "all123456"
    And I click the "LoginButton" button
    And I wait for "2000" millsecond
    Given open the "app.ListPage" page for uri "/app/list/"
    And I wait for loading invisible
    Then the data name is "{'column':'0','name':'<name>'}" then i will see "打开编辑查看" button
    When the data name is "<name>" then i click the "打开" button
    Then the page's title will be "403 Permission Denied"
    Given open the "app.ListPage" page for uri "/app/list/"
    And the data name is "<name>" then i click the "查看" button
    And I wait for loading invisible
    Then I will see the element "NameText" name is "<name>"
    Given open the "app.ListPage" page for uri "/app/list/"
    When the data name is "<name>" then i click the "编辑" button
    And I wait for loading invisible
    Then I will see the "app.CreatePage" page
    And I choose the "入库优先级" from the "DefaultPage"
    And I click the "SaveButton" button
    Then I will see the success message "保存成功"

    Examples:
      | name            |
      | AutoTestForAuth |

  Scenario Outline: 有效期限
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "__user_AutoTest__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    Then I click the "{'TabButton':'功能'}" button
    And I wait for "Loading" will be invisible
    When I "checked" the checkbox which name is "全选"
    And I "unchecked" the checkbox which name is "全选"
    And I "checked" the checkbox which name is "可使用应用功能,可使用数据集"
    And I click the "SaveButton" button
    Then I click the "{'TabButton':'应用'}" button
    And I wait for loading invisible
    When I "checked" the label before "<name>"
    When the data name is "<name>" then I click the "无期限" button without total page
    And I click the "Customize" button
    And I click the "DateEditor" button
    And I set the time input "TimeInput" to "1" minutes later
    And I click the "EnsureTime" button
    And I click the "SaveButton" button
    And I will see the success message "保存成功"

    Examples:
      | name            |
      | AutoTestForAuth |

  Scenario Outline: 授权读取+新建
    Given delete file "/target/download-files/<name>.tar"
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "__user_AutoTest__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    Then I click the "{'TabButton':'功能'}" button
    And I wait for "Loading" will be invisible
    When I "checked" the checkbox which name is "全选"
    And I "unchecked" the checkbox which name is "全选"
    And I "checked" the checkbox which name is "可使用应用功能,可新建应用,可使用数据集,可使用事件操作"
    And I click the "SaveButton" button
    And I will see the success message "保存成功"
    Then I click the "{'TabButton':'应用'}" button
    And I wait for "Loading" will be invisible
    When I "checked" the label before "<name>"
    When I "unchecked" the label before "<name>"
    And I "checked" function "读取" from the auth table which name is "<name>"
    And I click the "SaveButton" button
    Given I will see the "PublicNavBarPage" page
    And I wait for "Dashboard" will be visible
    And I logout current user
    And I wait for title change text to "登录"
    And open the "LoginPage" page for uri "/auth/login/"
    When I set the parameter "Username" with value "AutoTest"
    And I set the parameter "Password" with value "all123456"
    And I click the "LoginButton" button
    And I wait for "2000" millsecond
    Given open the "app.ListPage" page for uri "/app/list/"
    And I wait for loading invisible
    Then the data name is "{'column':'0','name':'<name>'}" then i will see "打开导出查看" button
    When the data name is "<name>" then i click the "打开" button
    Then the page's title will be "事件操作"
    Given open the "app.ListPage" page for uri "/app/list/"
    When the data name is "<name>" then i click the "导出" button
    And I will see the "app.CreatePage" page
    And I wait for loading invisible
    And I click the "ExportButton" button
    Then I will see the success message "请等待下载开始后，点击确定返回列表页，然后等待下载完成"
    Given open the "app.ListPage" page for uri "/app/list/"
    And the data name is "<name>" then i click the "查看" button
    And I wait for loading invisible
    Then I will see the element "NameText" name is "<name>"

    Examples:
      | name            |
      | EventAppForAuth |

  Scenario: 验证有效期限生效
    Given I will see the "PublicNavBarPage" page
    And I wait for "Dashboard" will be visible
    And I logout current user
    And I wait for title change text to "登录"
    And open the "LoginPage" page for uri "/auth/login/"
    When I set the parameter "Username" with value "AutoTest"
    And I set the parameter "Password" with value "all123456"
    And I click the "LoginButton" button
    And I wait for "2000" millsecond
    Given open the "app.ListPage" page for uri "/app/list/"
    And I wait for loading invisible
    And I will see the search result "{'column':'0','name':'AutoTestForAuth','contains':'no'}"

  Scenario Outline: 读取+删除
    Given delete file "/target/download-files/<name>.tar"
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "__user_AutoTest__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    Then I click the "{'TabButton':'功能'}" button
    And I wait for "Loading" will be invisible
    When I "checked" the checkbox which name is "全选"
    And I "unchecked" the checkbox which name is "全选"
    And I "checked" the checkbox which name is "可使用应用功能,可新建应用,可使用数据集,可使用入库优先级"
    And I click the "SaveButton" button
    And I will see the success message "保存成功"
    Then I click the "{'TabButton':'应用'}" button
    And I wait for "Loading" will be invisible
    When I "checked" the label before "<name>"
    When I "unchecked" the label before "<name>"
    And I "checked" function "读取,删除" from the auth table which name is "<name>"
    And I click the "SaveButton" button
    Given I will see the "PublicNavBarPage" page
    And I wait for "Dashboard" will be visible
    And I logout current user
    And I wait for title change text to "登录"
    And open the "LoginPage" page for uri "/auth/login/"
    When I set the parameter "Username" with value "AutoTest"
    And I set the parameter "Password" with value "all123456"
    And I click the "LoginButton" button
    And I wait for "2000" millsecond
    Given open the "app.ListPage" page for uri "/app/list/"
    And I wait for loading invisible
    Then the data name is "{'column':'0','name':'<name>'}" then i will see "打开导出查看删除" button
    When the data name is "<name>" then i click the "打开" button
    Then the page's title will be "403 Permission Denied"
    Given open the "app.ListPage" page for uri "/app/list/"
    When the data name is "<name>" then i click the "导出" button
    And I will see the "app.CreatePage" page
    And I wait for loading invisible
    And I click the "ExportButton" button
    Then I will see the success message "请等待下载开始后，点击确定返回列表页，然后等待下载完成"
    Given open the "app.ListPage" page for uri "/app/list/"
    And the data name is "<name>" then i click the "查看" button
    And I wait for loading invisible
    Then I will see the element "NameText" name is "<name>"
    Given open the "app.ListPage" page for uri "/app/list/"
    And I wait for loading invisible
    When the data name is "<name>" then i click the "删除" button
    And I click the "Ensure" button
    And I will see the success message "删除成功"

    Examples:
      | name            |
      | AutoTestForAuth |

  Scenario Outline: 授权读取+编辑+删除
    Given delete file "/target/download-files/<name>.tar"
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "__user_AutoTest__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    Then I click the "{'TabButton':'功能'}" button
    And I wait for "Loading" will be invisible
    When I "checked" the checkbox which name is "全选"
    And I "unchecked" the checkbox which name is "全选"
    And I "checked" the checkbox which name is "可使用应用功能,可新建应用,可使用数据集,可使用事件操作"
    And I click the "SaveButton" button
    And I will see the success message "保存成功"
    Then I click the "{'TabButton':'应用'}" button
    And I wait for "Loading" will be invisible
    When I "checked" the label before "<name>"
    And I "unchecked" function "转授" from the auth table which name is "<name>"
    And I click the "SaveButton" button
    Given I will see the "PublicNavBarPage" page
    And I wait for "Dashboard" will be visible
    And I logout current user
    And I wait for title change text to "登录"
    And open the "LoginPage" page for uri "/auth/login/"
    When I set the parameter "Username" with value "AutoTest"
    And I set the parameter "Password" with value "all123456"
    And I click the "LoginButton" button
    And I wait for "2000" millsecond
    Given open the "app.ListPage" page for uri "/app/list/"
    And I wait for loading invisible
    Then the data name is "{'column':'0','name':'<name>'}" then i will see "打开导出编辑查看删除" button
    When the data name is "<name>" then i click the "打开" button
    Then the page's title will be "事件操作"
    Given open the "app.ListPage" page for uri "/app/list/"
    When the data name is "<name>" then i click the "编辑" button
    And I wait for loading invisible
    Then I will see the "app.CreatePage" page
    And I choose the "入库优先级" from the "DefaultPage"
    And I click the "SaveButton" button
    Then I will see the success message "保存成功"
    Given open the "app.ListPage" page for uri "/app/list/"
    When the data name is "<name>" then i click the "导出" button
    And I will see the "app.CreatePage" page
    And I wait for loading invisible
    And I click the "ExportButton" button
    Then I will see the success message "请等待下载开始后，点击确定返回列表页，然后等待下载完成"
    Given open the "app.ListPage" page for uri "/app/list/"
    And the data name is "<name>" then i click the "查看" button
    And I wait for loading invisible
    Then I will see the element "NameText" name is "<name>"
    Given open the "app.ListPage" page for uri "/app/list/"
    When the data name is "<name>" then i click the "删除" button
    And I click the "Ensure" button
    And I will see the success message "删除成功"

    Examples:
      | name            |
      | EventAppForAuth |


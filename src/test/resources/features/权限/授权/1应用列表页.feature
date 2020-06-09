#@authtest
Feature: 权限-应用列表页

  Scenario: 授权可使用应用功能,可新建应用,可使用数据集,数据集操作权限
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "__user_AutoTest__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    And I wait for "Loading" will be invisible
    Then I click the "{'TabButton':'功能'}" button
    And I wait for "Loading" will be invisible
    When I "checked" the checkbox which name is "全选"
    When I "unchecked" the checkbox which name is "全选"
    When I "checked" the checkbox which name is "可使用应用功能,可新建应用,可使用拓扑图,新建拓扑图"
    And I click the "SaveButton" button

  Scenario Outline: 验证可新建应用
    Given I logout current user
    And I wait for "2000" millsecond
    And open the "LoginPage" page for uri "/auth/login/"
    When I set the parameter "Username" with value "AutoTest"
    And I set the parameter "Password" with value "All#123456"
    And I click the "LoginButton" button
    And I wait for "2000" millsecond
    Given open the "topology.ListPage" page for uri "/topology/"
    And I wait for "Create" will be visible
    When I click the "Create" button
    And I set the parameter "NameInput" with value "app权限应用所需资源"
    And I click the "Ensure" button
    Given open the "app.ListPage" page for uri "/app/list/"
    And I click the "CreateButton" button
    Then I will see the "app.CreatePage" page
    Given delete file "/target/download-files/<name>.tar"
    And I set the parameter "NameInput" with value "<name>"
    And I click the "AddResource" button
    And I set the parameter "SearchResourceInput" with value "app权限应用所需资源"
    And I wait for "SearchLoading" will be invisible
    And I "check" the checkbox which name is "app权限应用所需资源" in tiny table
    And I click the "SaveMenuButton" button
    And I click the "AddMenuButton" button under some element
    And I wait for "MenuName" will be visible
    And I set the parameter "MenuName" with value "<menuName>"
    And I set the parameter "Url" with value "<url>"
    And I click the "SaveMenuButton" button
    And I choose the "<menuName>" from the "DefaultPage"
    And I click the "CreateButton" button
    And I will see the "app.ListPage" page
    Then I wait for "CreateButton" will be visible

    Examples:
      | name            | menuName | url            |
      | EventAppForAuth | 事件操作     | /event/action/ |

  Scenario: 授权可使用应用功能
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "__user_AutoTest__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    And I wait for "Loading" will be invisible
    Then I click the "{'TabButton':'功能'}" button
    And I wait for "Loading" will be invisible
    When I "checked" the checkbox which name is "全选"
    When I "unchecked" the checkbox which name is "全选"
    And I "checked" the checkbox which name is "可使用应用功能,可使用数据集"
    And I click the "SaveButton" button
    And I will see the success message "更新成功"

  Scenario: 无新建权限
    Given I will see the "PublicNavBarPage" page
    And I wait for "2000" millsecond
    And I logout current user
    And I wait for "2000" millsecond
    And open the "LoginPage" page for uri "/auth/login/"
    When I set the parameter "Username" with value "AutoTest"
    And I set the parameter "Password" with value "All#123456"
    And I click the "LoginButton" button
    And I wait for "2000" millsecond
    Given open the "app.ListPage" page for uri "/app/list/"
    Then I will see the "CreateButton" doesn't exist
    And I click the "InstallButton" button
    Then I will see the "app.InstallPage" page
    And I wait for "AddDataset" will be visible
    When I upload a file with name "/target/download-files/EventAppForAuth.tar"
    And I wait for "Message" will be visible
    Then I will see the message "上传失败: 没有相关功能权限 `可新建应用`"

  Scenario: 授权新建权限
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "__user_AutoTest__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    And I wait for "Loading" will be invisible
    Then I click the "{'TabButton':'功能'}" button
    And I wait for "Loading" will be invisible
    When I "checked" the checkbox which name is "全选"
    When I "unchecked" the checkbox which name is "全选"
    And I "checked" the checkbox which name is "可使用应用功能,可使用数据集,可新建应用"
    And I click the "SaveButton" button
    And I will see the success message "更新成功"

  Scenario: 安装应用
    When I wait for "2000" millsecond
    And I logout current user
    And I wait for "2000" millsecond
    And open the "LoginPage" page for uri "/auth/login/"
    When I set the parameter "Username" with value "AutoTest"
    And I set the parameter "Password" with value "All#123456"
    And I click the "LoginButton" button
    And I wait for "2000" millsecond
    Given open the "app.ListPage" page for uri "/app/list/"
    And I wait for "Create" will be visible
    And I click the "InstallButton" button
    Then I will see the "app.InstallPage" page
    And I wait for "AddDataset" will be visible
    When I upload a file with name "/target/download-files/EventAppForAuth.tar"
    And I will see the element "VerifyText" name is "上传完成"
    And I choose the "__user_AutoTest__" from the "Role"
    And I click the "NextButton" button under some element
    And I click the "NextButton" button
    And I wait for "ImportSuccess" will be visible
    And I will see the element "ImportSuccess" name is "添加成功"

  Scenario: 验证无新建权限下安装包
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "__user_AutoTest__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    And I wait for loading invisible
    Then I click the "{'TabButton':'功能'}" button
    And I wait for "Loading" will be invisible
    When I "checked" the checkbox which name is "全选"
    And I "unchecked" the checkbox which name is "全选"
    And I "checked" the checkbox which name is "可使用应用功能,可使用数据集,新建拓扑图"
    And I click the "SaveButton" button
    And I will see the success message "更新成功"
    And I wait for "Loading" will be invisible
    Given I will see the "PublicNavBarPage" page
    And I wait for "Dashboard" will be visible
    And I logout current user
    And I wait for title change text to "登录"
    And open the "LoginPage" page for uri "/auth/login/"
    When I set the parameter "Username" with value "AutoTest"
    And I set the parameter "Password" with value "All#123456"
    And I click the "LoginButton" button
    And I wait for "2000" millsecond
    Given open the "app.ListPage" page for uri "/app/list/"
    And I click the "InstallButton" button
    Then I will see the "app.InstallPage" page
    And I wait for "AddDataset" will be visible
    When I upload a file with name "/target/download-files/EventAppForAuth.tar"
    And I will see the element "VerifyText" name is "上传完成"
    And I choose the "__user_AutoTest__" from the "Role"
    And I click the "NextButton" button under some element
    And I click the "NextButton" button
    And I wait for "ImportSuccess" will be visible
    And I will see the element "ImportSuccess" name is "添加成功"

  Scenario Outline: admin用户中新建应用
    Given open the "app.ListPage" page for uri "/app/list/"
    And I click the "CreateButton" button
    Then I will see the "app.CreatePage" page
    Given delete file "/target/download-files/<name>.tar"
    When I set the parameter "NameInput" with value "<name>"
    And I click the "AddResource" button
    And I set the parameter "SearchResourceInput" with value "app权限应用所需资源"
    And I wait for "SearchLoading" will be invisible
    And I "check" the checkbox which name is "app权限应用所需资源" in tiny table
    And I click the "SaveMenuButton" button
    And I click the "AddMenuButton" button under some element
    And I set the parameter "MenuName" with value "监控"
    And I set the parameter "Url" with value "/alerts/"
    And I click the "SaveMenuButton" button
    And I choose the "监控" from the "DefaultPage"
    And I click the "CreateButton" button
    And I will see the "app.ListPage" page
    Then I wait for "CreateButton" will be visible

    Examples:
      | name            |
      | AutoTestForAuth |

  Scenario: admin用户中安装应用
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "__user_AutoTest__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    And I wait for "Loading" will be invisible
    Then I click the "{'TabButton':'功能'}" button
    And I wait for "Loading" will be invisible
    When I "checked" the checkbox which name is "全选"
    And I "unchecked" the checkbox which name is "全选"
    And I "checked" the checkbox which name is "可使用应用功能,可新建应用,可使用数据集"
    And I click the "SaveButton" button
    And I will see the success message "更新成功"
    Given open the "app.ListPage" page for uri "/app/list/"
    And I click the "InstallButton" button
    Then I will see the "app.InstallPage" page
    And I wait for "AddDataset" will be visible
    When I upload a file with name "/target/download-files/AutoTestForAuth.tar"
    And I will see the element "VerifyText" name is "上传完成"
    And I choose the "__user_AutoTest__" from the "Role"
    And I click the "NextButton" button under some element
    And I click the "NextButton" button
    And I wait for "ImportSuccess" will be visible
    And I will see the element "ImportSuccess" name is "添加成功"

  Scenario: 在AutoTest用户安装无更新权限的app
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "__user_AutoTest__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    And I wait for "Loading" will be invisible
    Then I click the "{'TabButton':'应用'}" button
    And I wait for "Loading" will be invisible
    And I "checked" the checkbox which name is "AutoTestForAuth" in auth table
    And I "unchecked" the checkbox which name is "AutoTestForAuth" in auth table
    And I click the "SaveButton" button
    And I will see the success message "更新成功"
    Given I will see the "PublicNavBarPage" page
    And I wait for "Dashboard" will be visible
    And I wait for loading invisible
    And I logout current user
    And I wait for title change text to "登录"
    And open the "LoginPage" page for uri "/auth/login/"
    When I set the parameter "Username" with value "AutoTest"
    And I set the parameter "Password" with value "All#123456"
    And I click the "LoginButton" button
    And I wait for "2000" millsecond
    Given open the "app.ListPage" page for uri "/app/list/"
    And I click the "InstallButton" button
    Then I will see the "app.InstallPage" page
    And I wait for "AddDataset" will be visible
    When I upload a file with name "/target/download-files/AutoTestForAuth.tar"
    And I wait for "Message" will be visible
    Then I will see the message "上传失败: 没有相关资源权限"

  Scenario Outline: 授权读取
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "__user_AutoTest__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    And I wait for "Loading" will be invisible
    Then I click the "{'TabButton':'功能'}" button
    And I wait for "Loading" will be invisible
    When I "checked" the checkbox which name is "全选"
    And I "unchecked" the checkbox which name is "全选"
    And I "checked" the checkbox which name is "可使用应用功能,可使用数据集"
    And I click the "SaveButton" button
    And I wait for "SuccessMessage" will be visible
    And I will see the success message "更新成功"
    Then I click the "{'TabButton':'应用'}" button
    And I wait for "Loading" will be invisible
    And I "checked" the checkbox which name is "<name>" in auth table
    And I "unchecked" the checkbox which name is "<name>" in auth table
    And I "checked" function "读取" from the auth table which name is "<name>"
    And I click the "SaveButton" button
    Given I will see the "PublicNavBarPage" page
    And I wait for "Dashboard" will be visible
    And I logout current user
    And I wait for title change text to "登录"
    And open the "LoginPage" page for uri "/auth/login/"
    When I set the parameter "Username" with value "AutoTest"
    And I set the parameter "Password" with value "All#123456"
    And I click the "LoginButton" button
    And I wait for "2000" millsecond
    Given open the "app.ListPage" page for uri "/app/list/"
    And I wait for loading invisible
    Then the data name is "{'column':'0','name':'<name>'}" then i will see "打开查看" button
    When the data name is "<name>" then i click the "打开" button
    Then the page's title will be "403 Permission Denied"
    Given open the "app.ListPage" page for uri "/app/list/"
    And the data name is "<name>" then i click the "查看" button
    And I will see the "app.DetailPage" page
    And I wait for loading invisible
    And I will see the input element "Name" value will contains "<name>"

    Examples:
      | name            |
      | AutoTestForAuth |

  Scenario Outline: 授权读取+编辑
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "__user_AutoTest__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    And I wait for "Loading" will be invisible
    Then I click the "{'TabButton':'功能'}" button
    And I wait for "Loading" will be invisible
    When I "checked" the checkbox which name is "全选"
    And I "unchecked" the checkbox which name is "全选"
    And I "checked" the checkbox which name is "可使用应用功能,可使用数据集,可使用入库优先级"
    And I click the "SaveButton" button
    And I wait for "SuccessMessage" will be visible
    And I will see the success message "更新成功"
    Then I click the "{'TabButton':'应用'}" button
    And I wait for "Loading" will be invisible
    And I "checked" the checkbox which name is "<name>" in auth table
    And I "unchecked" function "删除,转授" from the auth table which name is "<name>"
    And I click the "SaveButton" button
    Given I will see the "PublicNavBarPage" page
    And I wait for "Dashboard" will be visible
    And I logout current user
    And I wait for title change text to "登录"
    And open the "LoginPage" page for uri "/auth/login/"
    When I set the parameter "Username" with value "AutoTest"
    And I set the parameter "Password" with value "All#123456"
    And I click the "LoginButton" button
    And I wait for "2000" millsecond
    Given open the "app.ListPage" page for uri "/app/list/"
    And I wait for loading invisible
    Then the data name is "{'column':'0','name':'<name>'}" then i will see "打开编辑查看" button
    When the data name is "<name>" then i click the "打开" button
    Then the page's title will be "403 Permission Denied"
    Given open the "app.ListPage" page for uri "/app/list/"
    And the data name is "<name>" then i click the "查看" button
    And I will see the "app.DetailPage" page
    And I wait for loading invisible
    And I will see the input element "Name" value will contains "<name>"
    Given open the "app.ListPage" page for uri "/app/list/"
    When the data name is "<name>" then i click the "编辑" button
    And I wait for loading invisible
    Then I will see the "app.CreatePage" page
    And I click the "AddMenuButton" button under some element
    And I set the parameter "MenuName" with value "下载"
    And I set the parameter "Url" with value "/download/"
    And I click the "SaveMenuButton" button
    And I click the "SaveButton" button under some element
    And I wait for "SuccessMessage" will be visible
    Then I will see the success message "更新成功"

    Examples:
      | name            |
      | AutoTestForAuth |

  Scenario Outline: 有效期限
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "__user_AutoTest__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    And I wait for "Loading" will be invisible
    Then I click the "{'TabButton':'功能'}" button
    And I wait for "Loading" will be invisible
    When I "checked" the checkbox which name is "全选"
    And I "unchecked" the checkbox which name is "全选"
    And I "checked" the checkbox which name is "可使用应用功能,可使用数据集"
    And I click the "SaveButton" button
    Then I click the "{'TabButton':'应用'}" button
    And I wait for loading invisible
    And I "checked" the checkbox which name is "<name>" in auth table
    When the data name is "<name>" then I click the "无限期" button in auth table
    And I click the "Customize" button
    And I click the "DateEditor" button
    And I set the time input "TimeInput" to "1" minutes later
    And I click the "EnsureTime" button
    And I click the "SaveButton" button
    And I wait for "SuccessMessage" will be visible
    And I will see the success message "更新成功"

    Examples:
      | name            |
      | AutoTestForAuth |

  Scenario Outline: 授权读取+新建
    Given delete file "/target/download-files/<name>.tar"
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "__user_AutoTest__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    And I wait for "Loading" will be invisible
    Then I click the "{'TabButton':'功能'}" button
    And I wait for "Loading" will be invisible
    When I "checked" the checkbox which name is "全选"
    And I "unchecked" the checkbox which name is "全选"
    And I "checked" the checkbox which name is "可使用应用功能,可新建应用,可使用数据集,可使用事件操作"
    And I click the "SaveButton" button
    And I wait for "SuccessMessage" will be visible
    And I will see the success message "更新成功"
    Then I click the "{'TabButton':'应用'}" button
    And I wait for "Loading" will be invisible
    And I "checked" the checkbox which name is "<name>" in auth table
    And I "unchecked" the checkbox which name is "<name>" in auth table
    And I "checked" function "读取" from the auth table which name is "<name>"
    And I click the "SaveButton" button
    Given I will see the "PublicNavBarPage" page
    And I wait for "Dashboard" will be visible
    And I logout current user
    And I wait for title change text to "登录"
    And open the "LoginPage" page for uri "/auth/login/"
    When I set the parameter "Username" with value "AutoTest"
    And I set the parameter "Password" with value "All#123456"
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
    And I will see the "app.ListPage" page
    Then I wait for "CreateButton" will be visible
    And the data name is "<name>" then i click the "查看" button
    And I will see the "app.DetailPage" page
    And I wait for loading invisible
    Then I will see the input element "Name" value will contains "<name>"

    Examples:
      | name            |
      | EventAppForAuth |

  @logout
  Scenario: 验证有效期限生效
    Given I wait for "2000" millsecond
    And I logout current user
    And I wait for "2000" millsecond
    And open the "LoginPage" page for uri "/auth/login/"
    When I set the parameter "Username" with value "AutoTest"
    And I set the parameter "Password" with value "All#123456"
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
    And I wait for "Loading" will be invisible
    Then I click the "{'TabButton':'功能'}" button
    And I wait for "Loading" will be invisible
    When I "checked" the checkbox which name is "全选"
    And I "unchecked" the checkbox which name is "全选"
    And I "checked" the checkbox which name is "可使用应用功能,可新建应用,可使用数据集"
    And I click the "SaveButton" button
    And I wait for "SuccessMessage" will be visible
    And I will see the success message "更新成功"
    Then I click the "{'TabButton':'应用'}" button
    And I wait for "Loading" will be invisible
    And I "checked" the checkbox which name is "<name>" in auth table
    And I "unchecked" the checkbox which name is "<name>" in auth table
    And I "checked" the checkbox which name is "<name>" in auth table
    And I "unchecked" function "编辑,转授" from the auth table which name is "<name>"
    And I click the "SaveButton" button
    Given I will see the "PublicNavBarPage" page
    And I wait for "Dashboard" will be visible
    And I logout current user
    And I wait for title change text to "登录"
    And open the "LoginPage" page for uri "/auth/login/"
    When I set the parameter "Username" with value "AutoTest"
    And I set the parameter "Password" with value "All#123456"
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
    And I will see the "app.ListPage" page
    Then I wait for "CreateButton" will be visible
    And the data name is "<name>" then i click the "查看" button
    And I wait for loading invisible
    And I will see the "app.DetailPage" page
    Then I will see the input element "Name" value will contains "<name>"
    Given open the "app.ListPage" page for uri "/app/list/"
    And I wait for loading invisible
    When the data name is "<name>" then i click the "删除" button
    And I wait for "Ensure" will be visible
    And I click the "Ensure" button
    And I wait for "SuccessMessage" will be visible
    And I will see the success message "删除成功"

    Examples:
      | name            |
      | AutoTestForAuth |

  Scenario Outline: 授权读取+编辑+删除
    Given delete file "/target/download-files/<name>.tar"
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "__user_AutoTest__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    And I wait for "Loading" will be invisible
    Then I click the "{'TabButton':'功能'}" button
    And I wait for "Loading" will be invisible
    When I "checked" the checkbox which name is "全选"
    And I "unchecked" the checkbox which name is "全选"
    And I "checked" the checkbox which name is "可使用应用功能,可新建应用,可使用数据集,可使用事件操作"
    And I click the "SaveButton" button
    And I wait for "SuccessMessage" will be visible
    And I will see the success message "更新成功"
    Then I click the "{'TabButton':'应用'}" button
    And I wait for "Loading" will be invisible
    And I "checked" the checkbox which name is "<name>" in auth table
    And I "unchecked" function "转授" from the auth table which name is "<name>"
    And I click the "SaveButton" button
    Given I will see the "PublicNavBarPage" page
    And I wait for "Dashboard" will be visible
    And I logout current user
    And I wait for title change text to "登录"
    And open the "LoginPage" page for uri "/auth/login/"
    When I set the parameter "Username" with value "AutoTest"
    And I set the parameter "Password" with value "All#123456"
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
    And I set the parameter "DescribeInput" with value "testDescribe"
    And I click the "SaveButton" button
    And I wait for "SuccessMessage" will be visible
    Then I will see the success message "更新成功"
    Given open the "app.ListPage" page for uri "/app/list/"
    When the data name is "<name>" then i click the "导出" button
    And I will see the "app.CreatePage" page
    And I wait for loading invisible
    And I click the "ExportButton" button
    And I will see the "app.ListPage" page
    Then I wait for "CreateButton" will be visible
    And the data name is "<name>" then i click the "查看" button
    And I will see the "app.DetailPage" page
    And I wait for loading invisible
    Then I will see the input element "Describe" value will contains "testDescribe"

    Examples:
      | name            |
      | EventAppForAuth |

  Scenario Outline: 授权所有权限
    Given delete file "/target/download-files/<name>.tar"
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "__user_AutoTest__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    And I wait for "Loading" will be invisible
    Then I click the "{'TabButton':'功能'}" button
    And I wait for "Loading" will be invisible
    When I "checked" the checkbox which name is "全选"
    And I click the "SaveButton" button
    And I wait for "SuccessMessage" will be visible
    And I will see the success message "更新成功"
    Then I click the "{'TabButton':'应用'}" button
    And I wait for "Loading" will be invisible
    And I "checked" the checkbox which name is "<name>" in auth table
    And I click the "SaveButton" button
    Given I will see the "PublicNavBarPage" page
    And I wait for "Dashboard" will be visible
    And I logout current user
    And I wait for title change text to "登录"
    And open the "LoginPage" page for uri "/auth/login/"
    When I set the parameter "Username" with value "AutoTest"
    And I set the parameter "Password" with value "All#123456"
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
    And I set the parameter "DescribeInput" with value "desc"
    And I click the "SaveButton" button
    And I wait for "SuccessMessage" will be visible
    Then I will see the success message "更新成功"
    Given open the "app.ListPage" page for uri "/app/list/"
    When the data name is "<name>" then i click the "导出" button
    And I will see the "app.CreatePage" page
    And I wait for loading invisible
    And I click the "ExportButton" button
    And I will see the "app.ListPage" page
    Then I wait for "CreateButton" will be visible
    And the data name is "<name>" then i click the "查看" button
    And I wait for loading invisible
    And I will see the "app.DetailPage" page
    Then I will see the input element "Describe" value will contains "desc"

    Examples:
      | name            |
      | EventAppForAuth |

  Scenario Outline: 创建角色
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And I wait for loading invisible
    Given I click the "Create" button
    And I will see the "roles.CreatePage" page
    And I set the parameter "RoleName" with value "<RoleName>"
    And I click the "CreateButton" button
    And I wait for "SuccessMessage" will be visible
    Then I will see the success message "创建成功"

    Examples:
      | RoleName |
      | 关联权限测试用户 |

  Scenario: 验证授权用户关联角色
    Given open the "users.ListPage" page for uri "/account/users/"
    And I click the detail which name is "{'column':'1','name':'验证授权用户'}"
    Then I will see the "users.EditPage" page
    And I wait for "EditInfoButton" will be visible
    And I click the "EditInfoButton" button
    And I wait for "2000" millsecond
    And I choose the "关联权限测试用户" from the "Roles"
    And I click the "Save" button
    And I wait for "SuccessMessage" will be visible
    Then I will see the success message "更新成功"

  Scenario: 增加AutoTest的可管理角色
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "__user_验证授权用户__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    And I wait for "Loading" will be invisible
    Then I click the "{'TabButton':'功能'}" button
    And I wait for "Loading" will be invisible
    When I "checked" the checkbox which name is "全选"
    And I click the "SaveButton" button
    And I wait for "SuccessMessage" will be visible
    And I will see the success message "更新成功"
    Given open the "users.ListPage" page for uri "/account/users/"
    And I click the detail which name is "{'column':'1','name':'AutoTest'}"
    Then I will see the "users.EditPage" page
    And  I wait for "EditInfoButton" will be visible
    And I click the "EditInfoButton" button
    And I wait for "2000" millsecond
    And I choose the "关联权限测试用户" from the "ManageRole"
    And I click the "Save" button
    And I wait for "SuccessMessage" will be visible
    Then I will see the success message "更新成功"

  Scenario: 增加用户分组管理员
    Given open the "userGroups.ListPage" page for uri "/account/usergroups/"
    When the data name is "{'column':'1','name':'验证授权用户分组'}" then i click the "编辑" button
    And I will see the "userGroups.EditPage" page
    And I click the "AddAdmin" button
    And I "check" the checkbox which name is "AutoTest" in tiny table
    And I click the "EnsureButton" button
    And I click the "SaveAdmin" button
    And I wait for "SuccessMessage" will be visible
    Then I will see the success message "更新成功"

#  Scenario Outline: 验证授权权限
#    Given delete file "/target/download-files/<name>.tar"
#    And I logout current user
#    And I wait for "2000" millsecond
#    And open the "LoginPage" page for uri "/auth/login/"
#    When I set the parameter "Username" with value "AutoTest"
#    And I set the parameter "Password" with value "All#123456"
#    And I click the "LoginButton" button
#    And I wait for "2000" millsecond
#    Given open the "roles.ListPage" page for uri "/account/roles/"
#    And the data name is "关联权限测试用户" then i click the "授权" button
#    And I will see the "roles.AuthorizationPage" page
#    And I wait for "Loading" will be invisible
#    Then I click the "{'TabButton':'应用'}" button
#    And I wait for "Loading" will be invisible
#    And I "checked" the checkbox which name is "<name>" in auth table
#    And I click the "SaveButton" button
#    And I wait for "SuccessMessage" will be visible
#    And I will see the success message "更新成功"
#    Given I will see the "PublicNavBarPage" page
#    And I wait for "Dashboard" will be visible
#    And I logout current user
#    And I wait for title change text to "登录"
#    And open the "LoginPage" page for uri "/auth/login/"
#    When I set the parameter "Username" with value "验证授权用户"
#    And I set the parameter "Password" with value "All#123456"
#    And I click the "LoginButton" button
#    And I wait for "2000" millsecond
#    Given open the "app.ListPage" page for uri "/app/list/"
#    And I wait for loading invisible
#    Then the data name is "{'column':'0','name':'<name>'}" then i will see "打开导出编辑查看删除" button
#    When the data name is "<name>" then i click the "打开" button
#    Then the page's title will be "事件操作"
#    Given open the "app.ListPage" page for uri "/app/list/"
#    When the data name is "<name>" then i click the "编辑" button
#    And I wait for loading invisible
#    Then I will see the "app.CreatePage" page
#    And I set the parameter "DescribeInput" with value "testDescribe"
#    And I click the "SaveButton" button
#    And I wait for "SuccessMessage" will be visible
#    Then I will see the success message "更新成功"
#    Given open the "app.ListPage" page for uri "/app/list/"
#    When the data name is "<name>" then i click the "导出" button
#    And I will see the "app.CreatePage" page
#    And I wait for loading invisible
#    And I click the "ExportButton" button
#    And I will see the "app.ListPage" page
#    Then I wait for "CreateButton" will be visible
#    And the data name is "<name>" then i click the "查看" button
#    And I wait for loading invisible
#    And I will see the "app.DetailPage" page
#    Then I will see the input element "Describe" value will contains "testDescribe"
#    Given open the "app.ListPage" page for uri "/app/list/"
#    When the data name is "<name>" then i click the "删除" button
#    And I wait for "Ensure" will be visible
#    And I click the "Ensure" button
#    And I wait for "SuccessMessage" will be visible
#    And I will see the success message "删除成功"
#
#    Examples:
#      | name            |
#      | EventAppForAuth |

  @cleanAuth
  Scenario Outline: 删除角色
    Given open the "roles.ListPage" page for uri "/account/roles/"
    Given the data name is "<name>" then i click the "删除" button
    And I wait for "Ensure" will be visible
    And I click the "Ensure" button
    And I wait for "SuccessMessage" will be visible

    Examples:
      | name     |
      | 关联权限测试用户 |

  @cleanAuth
  Scenario Outline: 清理
    Given open the "topology.ListPage" page for uri "/topology/"
    When the data name is "<name>" then i click the "删除" button
    And I wait for "Ensure" will be visible
    And I click the "Ensure" button
    Then I will see the success message "删除成功"

    Examples:
      | name        |
      | app权限应用所需资源 |
      | app权限应用所需资源 |
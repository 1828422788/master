Feature: 应用分配角色选择

  Scenario: 授权AutoTest用户日志来源权限
    Given open the "sourceGroup.ListPage" page for uri "/sources/sourcegroups/"
    And I set the parameter "SearchInput" with properties "source"
    And I click the "Search" button
    And I wait for loading invisible
    And I click the "Authorize" button
    And I click the "FirstCheckbox" button
    And I click the "Auth" button
    And I choose the "user" from the "User" with property
    And I set the parameter "ValidTime" with value "120"
    And I click the "SaveButton" button

  Scenario: 授予角色对应权限
    Given open the "role.ListPage" page for uri "/account/roles/"
    When the data properties is "role" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    Then I click the "{'TabButton':'功能'}" button
    And I "checked" the checkbox which name is "全选"
    Then I click the "{'TabButton':'URL 访问'}" button
    And I "checked" the checkbox which name is "全选"
    Then I click the "SaveButton" button
    Given open the "role.ListPage" page for uri "/account/roles/"
    When the data properties is "roleWithResources" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    Then I click the "{'TabButton':'功能'}" button
    And I "checked" the checkbox which name is "全选"
    Then I click the "{'TabButton':'URL 访问'}" button
    And I "checked" the checkbox which name is "全选"
    Then I click the "SaveButton" button

  Scenario Outline: 在AutoTest账户中新建app
    Given I will see the "PublicNavBarPage" page
    And I wait for "Dashboard" will be visible
    Given I logout current user
    And I wait for title change text to "登录"
    And open the "LoginPage" page for uri "/auth/login/"
    When I set the parameter "Username" with properties "user"
    And I set the parameter "Password" with properties "userPwd"
    And I click the "LoginButton" button
    Given I will see the "PublicNavBarPage" page
    And I wait for "Dashboard" will be visible
    Given open the "app.ListPage" page for uri "/app/list/"
    And I click the "CreateButton" button
    Then I will see the "app.CreatePage" page
    Given delete file "/target/download-files/<name>.tar"
    And I set the parameter "NameInput" with value "<name>"
    And I click the "AddMenuButton" button
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
      | name    | menuName | url       | color   |
      | AppRole | 报表       | /reports/ | #84460B |

  Scenario: 安装app并验证
    Given I will see the "PublicNavBarPage" page
    And I wait for "Dashboard" will be visible
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
    When I upload a file with name "/target/download-files/AppRole.tar"
    And I will see the element "VerifyText" name is "上传完成"
    And I choose the "roleWithResources" from the "Role" with property
    And I choose the "source" from the "Resource" with property
    And I click the "NextButton" button
    And I click the "NextButton" button
    And I will see the "ResourcePreview" is "active"
    And I click the "NextButton" button
    And I will see the element "ImportSuccess" name is "导入成功"
    Given open the "app.ListPage" page for uri "/app/list/"
    And I will see the element "EmptyText" value is "暂无数据"
    Given I logout current user
    And I wait for title change text to "登录"
    And open the "LoginPage" page for uri "/auth/login/"
    When I set the parameter "Username" with properties "userWithResources"
    And I set the parameter "Password" with properties "userWithResourcesPwd"
    And I click the "LoginButton" button
    Given I will see the "PublicNavBarPage" page
    And I wait for "Dashboard" will be visible
    Given open the "app.ListPage" page for uri "/app/list/"
    Then I will see the search result contains "{'column':'0','name':'AppRole'}"
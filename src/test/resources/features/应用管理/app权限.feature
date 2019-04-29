@all @app
Feature: 应用分配角色选择

  Scenario: 在AutoTest用户上安装app
    Given I will see the "PublicNavBarPage" page
    And I wait for "Dashboard" will be visible
    Given I logout current user
    Given I logout current user
    And open the "LoginPage" page for uri "/auth/login/"
    When I set the parameter "Username" with value "AutoTest"
    And I set the parameter "Password" with value "qqqqq11111"
    And I click the "LoginButton" button
    Given I will see the "PublicNavBarPage" page
    And I wait for "Dashboard" will be visible
#    And I wait for "2000" millsecond
    Given open the "app.ListPage" page for uri "/app/list/"
    And I click the "InstallButton" button
    Then I will see the "app.InstallPage" page
    When I upload a file with name "/target/download-files/AutoTestAuth.tar"
    And I will see the element "VerifyText" name is "上传完成"
    And I choose the "AutoTestRole" from the "Role"
    And I choose the "all_" from the "Resource"
    And I click the "NextButton" button
    And I click the "NextButton" button
    And I will see the "ResourcePreview" is "active"
    And I click the "NextButton" button
    And I will see the element "ImportSuccess" name is "导入成功"

  Scenario: RZY-2043:角色权限授权-URL访问
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "AutoTestRole" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    And I click the "{'TabButton':'URL 访问'}" button
    And I "unchecked" the checkbox which name is "全选"
    And I "checked" the checkbox which name is "应用"
    And I "checked" the checkbox which name is "仪表盘"
    And I click the "SaveButton" button
    And I logout current user
    And open the "LoginPage" page for uri "/auth/login/"
    When I set the parameter "Username" with value "AutoTest"
    And I set the parameter "Password" with value "qqqqq11111"
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
    And I click the "User" button
    Then the page's title will be "403 Permission Denied"

  Scenario: 勾选全部URL访问权限
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "AutoTestRole" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    And I click the "{'TabButton':'URL 访问'}" button
    And I "checked" the checkbox which name is "全选"
    And I click the "SaveButton" button

  Scenario Outline: RZY-2168、2159
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "AutoTestRole" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    And I click the "{'TabButton':'功能'}" button
    And I "checked" the checkbox which name is "<function>"
    And I click the "SaveButton" button
    And I logout current user
    And open the "LoginPage" page for uri "/auth/login/"
    When I set the parameter "Username" with value "AutoTest"
    And I set the parameter "Password" with value "qqqqq11111"
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

  Scenario Outline: RZY-2165、2173
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "AutoTestRole" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    And I click the "{'TabButton':'功能'}" button
    And I "checked" the checkbox which name is "<function>"
    And I click the "SaveButton" button
    And I logout current user
    And open the "LoginPage" page for uri "/auth/login/"
    When I set the parameter "Username" with value "AutoTest"
    And I set the parameter "Password" with value "qqqqq11111"
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
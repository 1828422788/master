@all @app @appSmoke
Feature: 应用权限

  Scenario: 授权所有权限
    Given open the "roles.ListPage" page for uri "/account/roles/"
    When the data name is "__user_AutoTest__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    And I click the "{'TabButton':'功能'}" button
    And I wait for "Loading" will be invisible
    And I "checked" the checkbox which name is "全选"
    And I click the "SaveButton" button

  Scenario: 在AutoTest用户上安装app
    Given I will see the "PublicNavBarPage" page
    And I wait for "Dashboard" will be visible
    Given I logout current user
    And I wait for title change text to "登录"
    And open the "LoginPage" page for uri "/auth/login/"
    When I set the parameter "Username" with properties "user"
    And I set the parameter "Password" with properties "userPwd"
    And I click the "LoginButton" button
    Given I will see the "PublicNavBarPage" page
    And I wait for "2000" millsecond
    Given open the "app.ListPage" page for uri "/app/list/"
    And I click the "InstallButton" button
    Then I will see the "app.InstallPage" page
    And I wait for "AddDataset" will be visible
    When I upload a file with name "/target/download-files/AutoTestAuth.tar"
    And I will see the element "VerifyText" name is "上传完成"
    And I choose the "__user_AutoTest__" from the "Role"
    And I click the "AddDataset" button
    And I set the parameter "SearchInput" with value "AutoTestApp"
    And I click the "SearchIcon" button
    And I drag the scroll bar to the element "ResultDataset"
    And I click the "ResultDataset" button
    And I click the "Ensure" button
    And I click the "NextButton" button under some element
    And I click the "NextButton" button
    And I wait for "ImportSuccess" will be visible
    And I will see the element "ImportSuccess" name is "导入成功"

  Scenario: 修改权限
    Given open the "roles.ListPage" page for uri "/account/roles/"
    When the data name is "__user_AutoTest__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    And I click the "{'TabButton':'功能'}" button
    And I wait for "Loading" will be invisible
    And I "checked" the checkbox which name is "全选"
    And I "unchecked" the checkbox which name is "全选"
    And I "checked" the checkbox which name is "可使用应用功能"
    And I "checked" the checkbox which name is "仪表盘"
    And I click the "SaveButton" button

  Scenario: RZY-2043:角色权限授权-URL访问
    Given I will see the "PublicNavBarPage" page
    And I wait for "Dashboard" will be visible
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
    And I click the "Source" button under some element
    Then the page's title will be "403 Permission Denied"
    And I back to before
    And I click the "Agent" button under some element
    Then the page's title will be "403 Permission Denied"
    And I back to before
    And I click the "Indexsetting" button under some element
    Then the page's title will be "403 Permission Denied"
    And I back to before
    And I click the "Ingestpriority" button under some element
    Then the page's title will be "403 Permission Denied"
    And I back to before
    And I click the "Upload" button under some element
    Then the page's title will be "403 Permission Denied"
    And I back to before
    And I click the "Backup" button under some element
    Then the page's title will be "403 Permission Denied"
    And I back to before
    And I click the "Download" button under some element
    Then the page's title will be "403 Permission Denied"
    And I back to before
    And I click the "OfflineTask" button under some element
    Then the page's title will be "403 Permission Denied"
    And I back to before
    And I click the "Knowledge" button under some element
    Then the page's title will be "403 Permission Denied"
    And I back to before
    And I click the "Role" button under some element
    Then the page's title will be "403 Permission Denied"
    And I back to before
    And I click the "UserGroup" button under some element
    Then the page's title will be "403 Permission Denied"
    And I back to before
    And I click the "Payment" button under some element
    Then the page's title will be "403 Permission Denied"
    And I back to before
    And I click the "User" button under some element
    Then the page's title will be "403 Permission Denied"

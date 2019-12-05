@app @appSmoke
Feature: 应用仪表盘

  Scenario: 新建仪表盘
    Given open the "app.ListPage" page for uri "/app/list/"
    When the data name is "DashboardApp" then i click the "打开" button
    And I will see the "app.AppPage" page
    And I will see the element "Title" name is "DashboardApp"
    Then I will see the "dashboard.ListPage" page
    Given I click the "Create" button
    Then I set the parameter "DashBoardName" with value "AutoApp"
    Then I click the "Ensure" button
    Then I will see the success message "新建成功"

  Scenario Outline: 仪表盘详情页
    Given open the "app.ListPage" page for uri "/app/list/"
    When the data name is "DashboardApp" then i click the "打开" button
    And I will see the "app.AppPage" page
    And I will see the element "Title" name is "DashboardApp"
    Then I will see the "dashboard.ListPage" page
    And I click the detail which name is "<name>"
    Then I will see the "dashboard.DetailPage" page
    When I set the parameter "TagName" with value "test"
    And I click the "EnsureCreateTagButton" button
    And I wait for loading invisible
    And I will see the "app.AppPage" page
    And I will see the element "OldTitle" name is "DashboardApp"
    Then the page's title will be "<title>"

    Examples:
      | name    | title          |
      | AutoApp | AutoApp \| 仪表盘 |

  Scenario: 在app外新建并选择所属应用
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I click the "Create" button
    And I set the parameter "DashBoardName" with value "仪表盘验证App"
    And I choose the "DashboardApp" from the "App"
    And I click the "Ensure" button
    Then I will see the success message "新建成功"

  Scenario: 在app外新建无应用的仪表盘
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I click the "Create" button
    And I set the parameter "DashBoardName" with value "仪表盘验证无app"
    And I click the "Ensure" button
    Then I will see the success message "新建成功"

  Scenario: 在app外按照应用搜索
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I choose the "DashboardApp" from the "AppDropdown"
    And I wait for loading invisible
    Then I will see the search result "{'column':'0','name':'仪表盘验证无app','contains':'no'}"
    Then I will see the search result contains "仪表盘验证App"
    Then I will see the search result contains "AutoApp"

  Scenario: 按照名称搜索
    Given open the "app.ListPage" page for uri "/app/list/"
    When the data name is "DashboardApp" then i click the "打开" button
    And I will see the "app.AppPage" page
    And I will see the element "Title" name is "DashboardApp"
    Then I will see the "dashboard.ListPage" page
    When I set the parameter "SearchInput" with value "AutoApp"
    And I click the "Search" button
    And I wait for loading invisible
    Then I will see the search result "AutoApp"
    And I will see the "app.AppPage" page
    Then I will see the element "Title" name is "DashboardApp"

  Scenario: 重命名仪表盘
    Given open the "app.ListPage" page for uri "/app/list/"
    When the data name is "DashboardApp" then i click the "打开" button
    And I will see the "app.AppPage" page
    And I will see the element "Title" name is "DashboardApp"
    Then I will see the "dashboard.ListPage" page
    When the data name is "AutoApp" then i click the "重命名" button
    And I set the parameter "DashBoardName" with value "仪表盘重命名"
    And I click the "Ensure" button
    Then I will see the success message "重命名成功"

  Scenario: 仪表盘标签
    Given open the "app.ListPage" page for uri "/app/list/"
    When the data name is "DashboardApp" then i click the "打开" button
    And I will see the "app.AppPage" page
    And I will see the element "Title" name is "DashboardApp"
    Then I will see the "dashboard.ListPage" page
    When the data name is "仪表盘重命名" then i click the "标签" button
    And I set the parameter "Tag" with value "testTag"
    And I choose the "testTag" from the "TagDropdown"
    And I click the "Ensure" button
    Then I will see the success message "更新成功"

  Scenario: 仪表盘授权
    Given open the "app.ListPage" page for uri "/app/list/"
    When the data name is "DashboardApp" then i click the "打开" button
    And I will see the "app.AppPage" page
    And I will see the element "Title" name is "DashboardApp"
    Then I will see the "dashboard.ListPage" page
    When the data name is "仪表盘重命名" then i click the "授权" button
    And I "check" the checkbox which name is "__user_AutoTest__" in tiny table
    And I click the "Ensure" button
    Then I will see the message "保存成功"

  Scenario Outline: 验证仪表盘授权是否成功
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "__user_AutoTest__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    Then I click the "{'TabButton':'功能'}" button
    And I wait for "Loading" will be invisible
    When I "checked" the checkbox which name is "全选"
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
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    Then the data name is "{'column':'0','name':'<name>'}" then i will see "设为默认重命名标签授权删除" button
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    When the data name is "<name>" then i click the "标签" button
    And I set the parameter "Tag" with value "AutoTestTag"
    And I choose the "AutoTestTag" from the "TagDropdown"
    And I click the "Ensure" button
    Then I will see the success message "更新成功"
    And I wait for "SuccessMessage" will be invisible
    When the data name is "<name>" then i click the "重命名" button
    And I wait for "DashBoardName" will be visible
    And I set the parameter "DashBoardName" with value "<name>重命名"
    And I click the "Ensure" button
    Then I will see the success message "重命名成功"
    And I click the detail which name is "<name>重命名"
    Then I will see the "dashboard.DetailPage" page
    When I set the parameter "TagName" with value "test"
    And I click the "EnsureCreateTagButton" button
    And I wait for loading invisible
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    Then I will see the data "{'column':'0','name':'<name>重命名'}" values "{'column':'2','name':'test'}"
    And the data name is "<name>重命名" then i click the "删除" button
    And I click the "Ensure" button
    Then I will see the success message "删除成功"

    Examples:
      | name   |
      | 仪表盘重命名 |

  Scenario: 删除仪表盘
    Given open the "app.ListPage" page for uri "/app/list/"
    When the data name is "DashboardApp" then i click the "打开" button
    And I will see the "app.AppPage" page
    And I will see the element "Title" name is "DashboardApp"
    And I click the "Dashboard" button
    Then I will see the "dashboard.ListPage" page
    Given the data name is "仪表盘验证App" then i click the "删除" button
    Then I click the "Ensure" button
    Then I will see the success message "删除成功"

  Scenario: 删除App外仪表盘
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    Given the data name is "仪表盘验证无app" then i click the "删除" button
    Then I click the "Ensure" button
    Then I will see the success message "删除成功"

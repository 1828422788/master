@app @appSmoke
Feature: 应用仪表盘

  Scenario Outline: 新建单个资源app
    Given open the "app.ListPage" page for uri "/app/list/"
    And I click the "CreateButton" button
    Then I will see the "app.CreatePage" page
    Given delete file "/target/download-files/<name>.tar"
    And I set the parameter "NameInput" with value "<name>"
    And I click the "AddResource" button
    And I set the parameter "SearchResourceInput" with value "app所选资源"
    And I wait for "SearchLoading" will be invisible
    And I "check" the checkbox which name is "app所选资源" in tiny table
    And I click the "SaveMenuButton" button
    And I click the "AddMenuButton" button under some element
    And I wait for "MenuName" will be visible
    And I set the parameter "MenuName" with value "<menuName>"
    And I set the parameter "Url" with value "<url>"
    And I click the "SaveMenuButton" button
    And I choose the "<menuName>" from the "DefaultPage"
    And I click the "CurrentApp" button
    And I click the "ColorPicker" button
    And I set the parameter "ColorValue" with value "<color>"
    And I click the "CreateButton" button under some element
    And I will see the "app.ListPage" page
    Then I wait for "CreateButton" will be visible

    Examples:
      | name         | menuName | url         | color   |
      | DashboardApp | 仪表盘      | /dashboard/ | #C6B8FF |

  Scenario Outline: 安装资源成功
    Given open the "app.ListPage" page for uri "/app/list/"
    And I click the "InstallButton" button
    Then I will see the "app.InstallPage" page
    And I wait for "AddDataset" will be visible
    When I upload a file "Upload" with name "/target/download-files/<appName>.tar"
    And I will see the element "VerifyText" name is "上传完成"
    And I choose the "__admin__" from the "Role"
    And I click the "AddDataset" button
    And I set the parameter "SearchInput" with value "AutoTestApp"
    And I click the "SearchIcon" button
    And I drag the scroll bar to the element "ResultDataset"
    And I click the "ResultDataset" button
    And I click the "Ensure" button
    And I click the "NextButton" button under some element
    And I click the "NextButton" button
    And I wait for "ImportSuccess" will be visible
    And I will see the element "ImportSuccess" name is "添加成功"

    Examples:
      | appName      |
      | DashboardApp |

  Scenario Outline: 验证单个资源的app资源范围是否正确
    Given open the "app.ListPage" page for uri "/app/list/"
    When the data name is "<name>" then i click the "打开" button
    And I will see the "app.AppPage" page
    And I wait for loading invisible
    And I wait for "EmptyText" will be visible
    And I will see the element "Title" name is "<name>"

    Examples:
      | name         |
      | DashboardApp |

  Scenario: 新建仪表盘
    Given open the "app.ListPage" page for uri "/app/list/"
    When the data name is "DashboardApp" then i click the "打开" button
    And I will see the "app.AppPage" page
    And I will see the element "Title" name is "DashboardApp"
    Then I will see the "dashboard.ListPage" page
    Given I click the "Create" button
    Then I set the parameter "DashBoardName" with value "AutoApp"
    Then I click the "Ensure" button
    Then I will see the success message "新建仪表盘成功"

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
    And I will see the element "Title" name is "DashboardApp"
    Then the page's title will be "<title>"

    Examples:
      | name    | title |
      | AutoApp | 仪表盘   |

  Scenario: 在app外新建并选择所属应用
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I click the "Create" button
    And I set the parameter "DashBoardName" with value "仪表盘验证App"
    And I choose the "DashboardApp" from the "BelongedApp"
    And I click the "Ensure" button
    Then I will see the success message "新建仪表盘成功"

  Scenario: 在app外新建无应用的仪表盘
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I click the "Create" button
    And I set the parameter "DashBoardName" with value "仪表盘验证无app"
    And I click the "Ensure" button
    Then I will see the success message "新建仪表盘成功"

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
    Then I will see the success message "重命名仪表盘成功"

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
    Then I will see the success message "更新仪表盘成功"

#  Scenario: 仪表盘授权
#    Given open the "app.ListPage" page for uri "/app/list/"
#    When the data name is "DashboardApp" then i click the "打开" button
#    And I will see the "app.AppPage" page
#    And I will see the element "Title" name is "DashboardApp"
#    Then I will see the "dashboard.ListPage" page
#    When the data name is "仪表盘重命名" then i click the "授权" button
#    And I "check" the checkbox which name is "AutoTest" in tiny table
#    And I click the "Ensure" button
#    Then I will see the message "保存成功"
#
#  Scenario Outline: 验证仪表盘授权是否成功
#    Given open the "roles.ListPage" page for uri "/account/roles/"
#    And the data name is "__user_AutoTest__" then i click the "授权" button
#    And I will see the "roles.AuthorizationPage" page
#    And I wait for "Loading" will be invisible
#    Then I click the "{'TabButton':'功能'}" button
#    And I wait for "Loading" will be invisible
#    When I "checked" the checkbox which name is "全选"
#    And I click the "SaveButton" button
#    And I will see the success message "更新成功"
#    Given I will see the "PublicNavBarPage" page
#    And I wait for "Dashboard" will be visible
#    And I logout current user
#    And I wait for title change text to "登录"
#    And open the "LoginPage" page for uri "/auth/login/"
#    When I set the parameter "Username" with value "AutoTest"
#    And I set the parameter "Password" with value "All#123456"
#    And I click the "LoginButton" button
#    And I wait for "2000" millsecond
#    Given open the "dashboard.ListPage" page for uri "/dashboard/"
#    Then the data name is "{'column':'0','name':'<name>'}" then i will see "设为默认重命名标签授权删除" button
#    Given open the "dashboard.ListPage" page for uri "/dashboard/"
#    When the data name is "<name>" then i click the "标签" button
#    And I set the parameter "Tag" with value "AutoTestTag"
#    And I choose the "AutoTestTag" from the "TagDropdown"
#    And I click the "Ensure" button
#    Then I will see the success message "更新仪表盘成功"
#    And I wait for "SuccessMessage" will be invisible
#    When the data name is "<name>" then i click the "重命名" button
#    And I wait for "DashBoardName" will be visible
#    And I set the parameter "DashBoardName" with value "<name>重命名"
#    And I click the "Ensure" button
#    Then I will see the success message "重命名仪表盘成功"
#    And I wait for "SuccessMessage" will be invisible
#    Then I will see the data "{'column':'0','name':'<name>重命名'}" values "{'column':'2','name':'test'}"
#    And the data name is "<name>重命名" then i click the "删除" button
#    And I click the "Ensure" button
#    Then I will see the success message "删除仪表盘成功"
#
#    Examples:
#      | name   |
#      | 仪表盘重命名 |

  Scenario: 删除仪表盘
    Given open the "app.ListPage" page for uri "/app/list/"
    When the data name is "DashboardApp" then i click the "打开" button
    And I will see the "app.AppPage" page
    And I will see the element "Title" name is "DashboardApp"
    And I click the "Dashboard" button
    Then I will see the "dashboard.ListPage" page
    Given the data name is "仪表盘验证App" then i click the "删除" button
    Then I click the "Ensure" button
    Then I will see the success message "删除仪表盘成功"

  Scenario Outline: 修改app资源范围
    Given open the "app.ListPage" page for uri "/app/list/"
    When the data name is "<name>" then i click the "编辑" button
    Then I will see the "app.CreatePage" page
    And I wait for loading invisible
    And I click the "OverallSituation" button
    And I click the "SaveButton" button
    Then I will see the success message "更新成功"

    Examples:
      | name         |
      | DashboardApp |

  Scenario: 验证资源范围修改成功并删除app外资源
    Given open the "app.ListPage" page for uri "/app/list/"
    When the data name is "DashboardApp" then i click the "打开" button
    And I will see the "app.AppPage" page
    And I will see the element "Title" name is "DashboardApp"
    And I click the "Dashboard" button
    Then I will see the "dashboard.ListPage" page
    Given the data name is "仪表盘验证无app" then i click the "删除" button
    Then I click the "Ensure" button
    Then I will see the success message "删除仪表盘成功"

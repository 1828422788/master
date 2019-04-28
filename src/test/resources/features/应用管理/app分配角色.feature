@all @app
Feature: 应用分配角色选择

  Background:
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
    Given open the "app.ListPage" page for uri "/app/list/"

  Scenario Outline: 在AutoTest账户中新建app
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
    And I click the "InstallButton" button
    Then I will see the "app.InstallPage" page
    When I upload a file with name "/target/download-files/AppRole.tar"
    And I will see the element "VerifyText" name is "上传完成"
    And I choose the "AutoTestRoleWithAllResource" from the "Role"
    And I choose the "all_" from the "Resource"
    And I click the "NextButton" button
    And I click the "NextButton" button
    And I will see the "ResourcePreview" is "active"
    And I click the "NextButton" button
    And I will see the element "ImportSuccess" name is "导入成功"
    Given open the "app.ListPage" page for uri "/app/list/"
    And I will see the element "EmptyText" value is "暂无数据"
    Given I logout current user
    Given I logout current user
    And open the "LoginPage" page for uri "/auth/login/"
    When I set the parameter "Username" with value "AutoTestAllResource"
    And I set the parameter "Password" with value "qqqqq11111"
    And I click the "LoginButton" button
    Given I will see the "PublicNavBarPage" page
    And I wait for "Dashboard" will be visible
    Given open the "app.ListPage" page for uri "/app/list/"
    Then I will see the search result contains "{'column':'0','name':'AppRole'}"
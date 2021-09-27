@app @appSmoke
Feature: 应用角色权限（RZY-2144）

  Background:
    Given open the "app.ListPage" page for uri "/app/list/"
    And I wait for loading invisible
    When  I click the detail which name is "AuthApp"
    And I will see the "app.AppPage" page
    Then I will see the "roles.ListPage" page

  Scenario: 新建角色
    Given I click the "Create" button
    And I will see the "app.AppPage" page
    And I will see the element "Title" name is "AuthApp"
    And I will see the "roles.CreatePage" page
    And I set the parameter "RoleName" with value "AutoApp"
    And I click the "CreateButton" button
    And I wait for "SuccessMessage" will be visible
    Then I will see the success message "创建成功"

  Scenario: 编辑角色
    And I wait for "2000" millsecond
    When the data name is "AutoApp" then i click the "编辑" button
    And I will see the "app.AppPage" page
    And I will see the element "Title" name is "AuthApp"
    And I will see the "roles.CreatePage" page
    And I set the parameter "RoleDes" with value "测试描述"
    And I click the "Save" button
    And I wait for "SuccessMessage" will be visible
    Then I will see the success message "更新成功"

  Scenario: 角色复制
    And I wait for "2000" millsecond
    When the data name is "AutoApp" then i click the "复制" button in more menu
    And I will see the "app.AppPage" page
    And I will see the element "Title" name is "AuthApp"
    And I will see the "roles.CreatePage" page
    And I wait for "2000" millsecond
    And I click the "Copy" button
    And I wait for "SuccessMessage" will be visible
    Then I will see the success message "复制成功"

  Scenario: 角色授权
    When the data name is "AutoApp" then i click the "授权" button in more menu
    And I will see the "app.AppPage" page
    And I will see the element "Title" name is "AuthApp"
    And I will see the "roles.AuthorizationPage" page
    And I click the "SaveButton" button under some element
    And I will see the "app.AppPage" page
    And I will see the element "Title" name is "AuthApp"

  Scenario Outline: 角色删除
    When the data name is "<name>" then i click the "删除" button in more menu
    And I wait for "Ensure" will be visible
    And I click the "Ensure" button
    And I will see the "app.AppPage" page
    And I will see the element "Title" name is "AuthApp"

    Examples:
      | name        |
      | AutoApp     |
      | AutoApp(副本) |


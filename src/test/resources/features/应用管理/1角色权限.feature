#@app @appSmoke
Feature: 应用角色权限（RZY-2144）

  Background:
    Given open the "app.ListPage" page for uri "/app/list/"
    When the data name is "AuthApp" then i click the "打开" button
    And I will see the "app.AppPage" page
    Then I will see the "roles.ListPage" page

  Scenario: 新建角色
    Given I click the "CreateRoleButton" button
    And I will see the "app.AppPage" page
    And I will see the element "OldTitle" name is "AuthApp"
    And I will see the "roles.CreatePage" page
    And I set the parameter "RoleName" with value "AutoTestApp"
    And I click the "CreateButton" button
    Then I wait for "SuccessMessage" will be visible

  Scenario: 编辑角色
    When the data name is "AutoTestApp" then i click the "编辑" button
    And I will see the "app.AppPage" page
    And I will see the element "OldTitle" name is "AuthApp"
    And I will see the "roles.CreatePage" page
    And I set the parameter "RoleName" with value "AutoApp"
    And I click the "CreateButton" button
    Then I will see the success message "保存成功"

  Scenario: 角色复制
    When the data name is "AutoApp" then i click the "复制" button
    And I will see the "app.AppPage" page
    And I will see the element "OldTitle" name is "AuthApp"
    And I will see the "roles.CreatePage" page
    And I click the "CreateButton" button
    Then I wait for "SuccessMessage" will be visible

  Scenario: 角色授权
    When the data name is "AutoApp" then i click the "授权" button
    And I will see the "app.AppPage" page
    And I will see the element "OldTitle" name is "AuthApp"
    And I will see the "roles.AuthorizationPage" page
    And I click the "SaveButton" button
    And I will see the "app.AppPage" page
    And I will see the element "OldTitle" name is "AuthApp"

  Scenario Outline: 角色删除
    When the data name is "<name>" then i click the "删除" button
    And I click the "MessageBoxOKButton" button
    Then I will see the success message "删除成功"
    And I will see the "app.AppPage" page
    And I will see the element "OldTitle" name is "AuthApp"

    Examples:
      | name        |
      | AutoApp     |
      | AutoApp(副本) |


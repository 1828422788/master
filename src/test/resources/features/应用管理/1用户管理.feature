#@app @appSmoke
Feature: 应用用户管理（RZY-2147）

  Background:
    Given open the "app.ListPage" page for uri "/app/list/"
    When the data name is "AuthApp" then i click the "打开" button
    And I will see the "app.AppPage" page
    And I will see the element "OldTitle" name is "AuthApp"
    And I click the "User" button
    And I wait for loading invisible
    Then I will see the "users.ListPage" page

  Scenario: 新建用户
    When I click the "CreateUser" button
    And I will see the "app.AppPage" page
    And I will see the element "OldTitle" name is "AuthApp"
    And I will see the "users.CreatePage" page
    When I set the parameter "UserName" with value "AutoAppCreate"
    And I set the parameter "Email" with value "test@163.com"
    And I set the parameter "Password" with value "All#123456"
    And I click the "CreateButton" button
    Then I will see the success message "创建成功"

  Scenario: 查看用户并编辑
    When the data name is "{'column':'1','name':'AutoAppCreate'}" then i click the "查看" button
    And I will see the "app.AppPage" page
    And I will see the element "OldTitle" name is "AuthApp"
    And I will see the "users.DetailPage" page
    And I click the "EditButton" button
    And I will see the "app.AppPage" page
    And I will see the element "OldTitle" name is "AuthApp"
    And I will see the "users.EditPage" page
    When I set the parameter "FullName" with value "AutoApp"
    And I click the "SaveButton" button
    Then I will see the success message "更新成功"

  Scenario Outline: 用户分组
    When the data name is "{'column':'1','name':'<name>'}" then i click the "分组" button
    And I choose the "AutoTestGroup" from the "UserGroups"
    And I wait for "1000" millsecond
    And I click the "ConfirmButton" button
    Then I will see the success message "保存成功"
    And I wait for loading invisible
    Then I will see the data "{'column':'1','name':'<name>'}" values "{'column':'4','name':'AutoTestGroup'}"

    Examples:
      | name          |
      | AutoAppCreate |

  Scenario Outline: 用户删除
    When the data name is "{'column':'1','name':'<name>'}" then i click the "删除" button
    And I click the "EnsureButton" button
    And I will see the success message "删除成功"

    Examples:
      | name    |
      | AutoAppCreate |
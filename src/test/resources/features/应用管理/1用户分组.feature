@app @appSmoke
Feature: 应用用户分组

  Background:
    Given open the "app.ListPage" page for uri "/app/list/"
    When the data name is "AutoTestAppWithAllResources" then i click the "打开" button
    And I will see the "app.AppPage" page
    And I click the "UserGroup" button
    Then I will see the "userGroups.ListPage" page

  Scenario: 新建用户分组
    And I click the "CreateUserGroup" button
    And I will see the "app.AppPage" page
    And I will see the element "Title" name is "AutoTest...pWithAllResources"
    Then I will see the "userGroups.CreatePage" page
    When I set the parameter "UserGroupName" with value "AutoAppRole"
    And I choose the "AutoTestRoleWithAllResource" from the "UserGroupOwner"
    And I choose the "AutoTestRoleWithAllResource" from the "UserGroupRole"
    And I click the "CreateButton" button
    Then I wait for "SuccessMessage" will be visible

  Scenario: 编辑用户分组
    When the data name is "{'column':'1','name':'AutoAppRole'}" then i click the "编辑" button
    And I will see the "app.AppPage" page
    And I will see the element "Title" name is "AutoTest...pWithAllResources"
    Then I will see the "userGroups.EditPage" page
    When I set the parameter "UserGroupName" with value "AutoAppRoleName"
    And I click the "BasicSaveButton" button
    Then I will see the success message "更新成功"

  Scenario: 搜索用户分组
    When I set the parameter "SearchInput" with value "AutoApp"
    And I click the "SearchIcon" button
    And I wait for loading invisible
    Then I will see the search result "{'column':'1','name':'AutoApp'}"
    And I will see the "app.AppPage" page
    And I will see the element "Title" name is "AutoTest...pWithAllResources"

  Scenario: 用户分组删除
    When the data name is "{'column':'1','name':'AutoAppRoleName'}" then i click the "删除" button
    And I click the "MessageBoxOKButton" button
    Then I will see the success message "删除成功"


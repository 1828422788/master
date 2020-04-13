@users @usersSmoke @all
Feature: 用户分组（RZY-1167）

  Scenario: 新建用户分组
    Given open the "userGroups.ListPage" page for uri "/account/usergroups/"
    And I click the "Create" button
    Then I will see the "userGroups.CreatePage" page
    When I set the parameter "UserGroupName" with value "测试用户所需分组"
    And I click the "CreateButton" button
    Then I will see the success message "创建成功"

  Scenario Outline: 用户分组成功
    Given open the "users.ListPage" page for uri "/account/users/"
    When the data name is "{'column':'1','name':'<name>'}" then i click the "分组" button
    And I choose the "测试用户所需分组" from the "UserGroups"
    And I wait for "2000" millsecond
    And I click the "ConfirmButton" button
    And I will see the success message "保存成功"
    And I wait for "2000" millsecond
    And I refresh the website
    And I wait for loading invisible
    Then I will see the data "{'column':'1','name':'<name>'}" values "{'column':'4','name':'<finalGroups>'}"

    Examples:
      | name            | finalGroups |
      | AutoTestForEdit | 测试用户所需分组    |
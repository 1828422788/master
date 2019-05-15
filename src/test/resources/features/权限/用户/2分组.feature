@users @all
Feature: 用户分组（RZY-1167）

  Background:
    Given open the "users.ListPage" page for uri "/account/users/"

  Scenario Outline: 用户分组失败
    When the data name is "{'column':'1','name':'<name>'}" then i click the "分组" button
    And I cancel selection "<oldGroup>" from the "UserGroups" with property
    And I click the "ConfirmButton" button
    Then I will see the error message "用户分组 不能为空"

    Examples:
      | name            | oldGroup |
      | AutoTestForEdit | group    |

  @smoke @usersSmoke
  Scenario Outline: 用户分组成功
    When the data name is "{'column':'1','name':'<name>'}" then i click the "分组" button
    And I choose the "admin" from the "UserGroups"
    And I wait for "1000" millsecond
    And I click the "ConfirmButton" button
    Then I will see the success message "保存成功"
    And I wait for loading invisible
    Then I will see the data "{'column':'1','name':'<name>'}" values "{'column':'4','name':'<finalGroups>'}"

    Examples:
      | name            | finalGroups          |
      | AutoTestForEdit | admin, AutoTestGroup |
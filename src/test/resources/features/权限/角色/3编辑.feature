Feature: 编辑角色

  Background:
    Given open the "roles.ListPage" page for uri "/account/roles/"

  @role
  Scenario Outline: 编辑角色
    And I set the parameter "SearchInput" with value "AutoTest"
    And I wait table element "SearchResultTable-1.1" change text to "AutoTest"
    And I click the table "TableEditButton-1" button
    And I will see the "roles.EditPage" page
    When I set the parameter "RoleName" with value "<RoleName>"
    And I set the parameter "RoleDes" with value "<RoleDes>"
    And I click the "UpdateButton" button
    Then I will see the <Result>

  @all @smoke @roleSmoke
    Examples: 编辑成功
      | RoleName | RoleDes | Result                 |
      | AutoTest |         | success message "保存成功" |
      | AutoTest | 无       | success message "保存成功" |

  @all
    Examples: 编辑失败
      | RoleName                | RoleDes | Result                                     |
      |                         |         | error message "填写角色名称"                     |
      | AutoTestWithAllResource |         | error message "保存失败: 角色名称已经在\n错误码: FE_590" |
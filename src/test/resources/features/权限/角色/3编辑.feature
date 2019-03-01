Feature: 角色编辑（RZY-522）

  Background:
    Given open the "roles.ListPage" page for uri "/account/roles/"

  @role
  Scenario Outline: 编辑角色
    Given the data name is "<OldName>" then i click the "编辑" button
    And I will see the "roles.EditPage" page
    When I set the parameter "RoleName" with value "<RoleName>"
    And I set the parameter "RoleDes" with value "<RoleDes>"
    And I click the "UpdateButton" button
    Then I will see the <Result>

  @all @smoke @roleSmoke
    Examples: 编辑成功
      | OldName      | RoleName     | RoleDes | Result                 |
      | AutoTestCopy | AutoTest     |         | success message "保存成功" |
      | AutoTest     | AutoTestCopy | 无       | success message "保存成功" |

  @all
    Examples: 编辑失败
      | OldName      | RoleName                    | RoleDes | Result                                     |
      | AutoTestCopy |                             |         | error message "填写角色名称"                     |
      | AutoTestCopy | AutoTestRoleWithAllResource |         | error message "保存失败: 角色名称已经在\n错误码: FE_590" |
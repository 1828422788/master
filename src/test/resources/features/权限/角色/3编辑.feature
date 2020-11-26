Feature: 角色编辑（RZY-522）

  Background:
    Given open the "roles.ListPage" page for uri "/account/roles/"

  @role
  Scenario Outline: 编辑角色
    Given the data name is "<OldName>" then i click the "编辑" button
    And I will see the "roles.CreatePage" page
    And I wait for "3000" millsecond
    When I set the parameter "RoleName" with value "<RoleName>"
    And I set the parameter "RoleDes" with value "<RoleDes>"
    And I click the "Save" button
    Then I will see the <Result>

  @roleSmoke
    Examples: 编辑成功
      | OldName      | RoleName     | RoleDes | Result                 |
      | AutoTestEdit | AutoTest     |         | success message "更新成功" |
      | AutoTest     | AutoTestEdit | 无       | success message "更新成功" |

    Examples: 编辑失败
      | OldName      | RoleName     | RoleDes | Result                                            |
      | AutoTestEdit | AutoTestCopy |         | error message "更新失败: role_name: AutoTestCopy 已存在" |
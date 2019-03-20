Feature: 仪表盘分组（RZY-212、RZY-217至RZY-221）

  Background:
    Given open the "dashboard.ListPage" page for uri "/dashboard/"

  Scenario Outline:
    Given the data name is "<name>" then i click the "分组" button
    Then I <group>
    And I click the "EnsureChangeGroupButton" button
    Then I will see the success message "仪表盘更改分组成功"

  @dashboard @all @smoke @dashboardSmoke
    Examples:
      | name        | group                                                                                            |
      | UIautotest  | cancel selection "AutoTestRoleWithAllResource" from the "GroupInput"                             |
      | UIautotest  | choose the "AutoTestRoleWithAllResource, AutoTestRoleWithAuth&SourceGroup" from the "GroupInput" |
      | sxjautotest | choose the "AutoTestRoleWithAllResource, AutoTestRoleWithAuth&SourceGroup" from the "GroupInput" |

  @first @dashboardSmoke
    Examples:
      | name          | group                                                          |
      | FirstAutoTest | choose the "AutoTestRoleWithAllResource" from the "GroupInput" |

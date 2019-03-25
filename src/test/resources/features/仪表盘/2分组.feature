@dashboard @dashboardSmoke
Feature: 仪表盘分组（RZY-212、RZY-217至RZY-221）

  Background:
    Given open the "dashboard.ListPage" page for uri "/dashboard/"

  Scenario Outline:
    Given the data name is "<name>" then i click the "分组" button
    Then I <group>
    And I click the "EnsureChangeGroupButton" button
    Then I will see the success message "仪表盘更改分组成功"

    Examples:
      | name        | group                                                           |
      | UIautotest  | cancel selection "default_DashBoardGroup" from the "GroupInput" |
      | UIautotest  | choose the "default_DashBoardGroup" from the "GroupInput"       |
      | sxjautotest | choose the "default_DashBoardGroup" from the "GroupInput"       |

  @first
    Examples:
      | name          | group                                                     |
      | FirstAutoTest | choose the "default_DashBoardGroup" from the "GroupInput" |

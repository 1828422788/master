@dashboard @all @smoke @dashboardSmoke
Feature: 仪表盘分组

  Background:
    Given open the "dashboard.ListPage" page for uri "/dashboard/"

  Scenario Outline:
    Given the data name is "<name>" then i click the "分组" button
    Then I <group>
    And I click the "EnsureChangeGroupButton" button
    Then I will see the success message "仪表盘更改分组成功"

    Examples:
      | name        | group                                                                                            |
      | UIautotest  | cancel selection "AutoTestRoleWithAllResource" from the "GroupInput"                             |
      | UIautotest  | choose the "AutoTestRoleWithAllResource, AutoTestRoleWithAuth&SourceGroup" from the "GroupInput" |
      | sxjautotest | choose the "AutoTestRoleWithAllResource, AutoTestRoleWithAuth&SourceGroup" from the "GroupInput" |
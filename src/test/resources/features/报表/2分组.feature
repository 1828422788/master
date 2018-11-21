@report @all @smoke @reportSmoke
Feature: 报表分组

  Background:
    Given open the "report.ListPage" page for uri "/reports/"

  Scenario Outline:
    When the data name is "<name>" then i click the "分组" button
    And I <group>
    And I click the "Ensure" button
    And I will see the success message "保存成功"

    Examples:
      | name        | group                                                                      |
      | sxjautotest | cancel selection "default_Report" from the "ChangeGroup"                   |
      | sxjautotest | choose the "default_Report,AutoTestWithAllResource" from the "ChangeGroup" |
@first @reportSmoke
Feature: 报表分组修改（RZY-130）

  Background:
    Given open the "report.ListPage" page for uri "/reports/"

  Scenario Outline:
    When the data name is "改为旭日图sample2报表" then i click the "分组" button
    And I <group>
    And I click the "Ensure" button
    And I will see the success message "保存成功"

    Examples:
      | group                                                                      |
      | cancel selection "default_Report" from the "ChangeGroup"                   |
      | choose the "default_Report,AutoTestWithAllResource" from the "ChangeGroup" |
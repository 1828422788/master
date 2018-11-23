@timedTask @all @smoke @timedTaskSmoke
Feature: 定时任务分组

  Background:
    Given open the "timedTask.ListPage" page for uri "/schedule/"

  Scenario Outline:
    When the data name is "<name>" then i click the "分组" button
    And I <group>
    And I click the "EnsureChangeGroup" button
    Then I will see the success message "保存成功"

    Examples:
      | name        | group                                                                       |
      | sxjAutoTest | cancel selection "default_SavedSchedule" from the "Group"                   |
      | sxjAutoTest | choose the "default_SavedSchedule,AutoTestWithAllResource" from the "Group" |
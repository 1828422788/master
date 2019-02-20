@timedTask @all @smoke @timedTaskSmoke
Feature: 定时任务分组（RZY-411）

  Background:
    Given open the "timedTask.ListPage" page for uri "/schedule/"

  Scenario Outline:
    When the data name is "<name>" then i click the "分组" button
    And I <group>
    And I click the "EnsureChangeGroup" button
    Then I will see the success message "保存成功"

    Examples:
      | name                       | group                                                                       |
      | RZY-396：定时任务_sample_表格_近一天 | cancel selection "default_SavedSchedule" from the "Group"                   |
      | RZY-396：定时任务_sample_表格_近一天 | choose the "default_SavedSchedule,AutoTestWithAllResource" from the "Group" |
@timedTask @all @smoke @timedTaskSmoke
Feature: 定时任务分组

  Background:
    Given open the "timedTask.ListPage" page for uri "/schedule/"

  Scenario Outline:
    When the data name is "<name>" then i click the "分组" button
    And I cancel selection "<group>" from the "Group"
    And I click the "EnsureChangeGroup" button
    Then I will see the error message "至少选择一个分组"
    And I choose the "<newGroup>" from the "Group"
    And I click the "EnsureChangeGroup" button
    Then I will see the success message "保存成功"

    Examples:
      | name        | group                 | newGroup                                      |
      | sxjAutoTest | default_SavedSchedule | default_SavedSchedule,AutoTestWithAllResource |
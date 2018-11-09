@timedTask @all @smoke @timedTaskSmoke
Feature: 定时任务禁用

  Background:
    Given open the "timedTask.ListPage" page for uri "/schedule/"

  Scenario Outline:
    Then I disabled the data "<name>"
    Then I will see the success message "<message>"

    Examples:
      | name        | message |
      | sxjAutoTest | 启用成功    |
      | sxjAutoTest | 禁用成功    |

@timedTask @all @smoke @timedTaskSmoke
Feature: 定时任务禁用（RZY-414、RZY-415）

  Background:
    Given open the "timedTask.ListPage" page for uri "/schedule/"

  Scenario Outline:
    Then I disabled the data "<name>"
    Then I will see the success message "<message>"

    Examples:
      | name          | message |
      | forceAutoTest | 禁用成功    |
      | forceAutoTest | 启用成功    |

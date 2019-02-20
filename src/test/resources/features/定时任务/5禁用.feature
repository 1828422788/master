@timedTask @all @smoke @timedTaskSmoke
Feature: 定时任务禁用（RZY-414、RZY-415）

  Background:
    Given open the "timedTask.ListPage" page for uri "/schedule/"

  Scenario Outline:
    Then I disabled the data "RZY-396：定时任务_sample_表格_近一天"
    Then I will see the success message "<message>"

    Examples:
      | message |
      | 禁用成功    |
      | 启用成功    |

@timedTask @all @smoke @timedTaskSmoke
Feature: 定时任务复制（RZY-398）

  Background:
    Given open the "timedTask.ListPage" page for uri "/schedule/"

  Scenario Outline: 复制定时任务
    When the data name is "<name>" then i click the "复制" button
    Then I will see the success message "复制成功"

    Examples:
      | name                       |
      | RZY-397：定时任务sample_昨天      |
      | RZY-397：定时任务sample_昨天      |
      | RZY-397：定时任务sample_昨天      |
      | RZY-397：定时任务sample_昨天      |
      | RZY-397：定时任务sample_昨天      |
      | RZY-396：定时任务_sample_表格_近一天 |
      | RZY-396：定时任务_sample_表格_近一天 |
      | RZY-396：定时任务_sample_表格_近一天 |
      | RZY-396：定时任务_sample_表格_近一天 |
      | RZY-396：定时任务_sample_表格_近一天 |
Feature: 定时任务删除（RZY-412）

  Background:
    Given open the "timedTask.ListPage" page for uri "/schedule/"

  Scenario Outline:
    When the data name is "<name>" then i click the "删除" button
    And I click the "EnsureDelete" button
    Then I will see the success message "删除成功"

  @timedTask @all @smoke @timedTaskSmoke
    Examples:
      | name               |
      | rangelineAutoTest  |
      | wordcloudAutoTest  |
      | singleAutoTest     |
      | liquidfillAutoTest |
      | areaAutoTest       |
      | columnAutoTest     |
      | scatterAutoTest    |
      | pieAutoTest        |
      | roseAutoTest       |
      | barAutoTest        |
      | multiaxisAutoTest  |
      | chordAutoTest      |
      | sankeyAutoTest     |
      | forceSunAutoTest   |
      | forceAutoTest      |
      | sequenceAutoTest   |

  @clean
    Examples:
      | name                       |
      | RZY-396：定时任务_sample_表格_近一天 |
      | RZY-397：定时任务sample_昨天      |
      | RZY-403：执行计划-定时_3小时        |
      | RZY-404：执行计划-定时1天          |
      | RZY-2695：执行计划-crontab_57分钟 |
      | RZY-398：定时任务_更新            |
      | RZY-1488：保存为各种类型的定时任务-序列   |
      | chs_task_funnel            |

#@timedTask @all @smoke @timedTaskSmoke
Feature: 定时任务启用（RZY-414、RZY-415）

  Background:
    Given open the "timedTask.ListPage" page for uri "/schedule/"

  Scenario Outline:
    Then I disabled the data "<name>"
#    Then I will see the success message "<message>"

    Examples:
      | name                              |
      | RZY-398:定时任务_更新                   |
      | RZY-399:运行用户_api_usr_m            |
      | RZY-400:日志来源_api_log_source_m     |
      | RZY-401:搜索内容                      |
      | RZY-402:任务分组hunter_roles_m        |
      | RZY-2696:执行计划-定时_7小时              |
      | RZY-2698:执行计划-定时_2天               |
      | RZY-2699:执行计划-crontab_每个月第15天开始   |
      | RZY-2700_执行计划-crontab_每天9点整至9点30分 |
      | RZY-2702_执行计划-crontab_周一到周五       |

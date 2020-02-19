@clean
Feature: 定时任务删除（RZY-412）

  @cleanTimedTask
  Scenario Outline: delete
    Given open the "timedTask.ListPage" page for uri "/schedule/"
    When the data name is "{'column':'2','name':'<name>'}" then i click the "删除" button
    And I click the "EnsureDelete" button under some element
    Then I will see the success message "删除成功"

    Examples:
    |    name       |
    |  396recent1d  |
    |  403recent2d  |
    |  404recent7d  |
    |  397today     |
    |  2695yesterday|
    |  2696thisWeek |
    |  2698lastWeek |
    |  397thisMonth |
    |  397lastMonth |
    |  2699every15th|
    |  2700_9_930   |
    |  2702_mon_fri |
    |  2703_5h      |
    |  2704_57min   |
    |  2705_7min    |

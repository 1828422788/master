@spl @all @timedTask
Feature: 定时任务时间范围

  Background:
    Given open the "timedTask.ListPage" page for uri "/schedule/"
    And I wait for loading complete

  @first @timedTaskSmoke
  Scenario Outline: sample_timeperiod(RZY-396,397,403,404,2695,2696,2698)
    When the data name is "{'column':'2','name':'<taskName>'}" then i click the "<taskName>" button
    Then I will see the "timedTask.DetailPage" page
    And I will see the element "TimePeriod" contains "<time>"

    Examples:
      | time                                      | taskName     |
      | -1d ~ now                                 | 396recent1d  |
      | -2d ~ now                                 | 403recent2d  |
      | -7d ~ now                                 | 404recent7d  |
      | now/d ~ now                               | 397today     |
      | -1d/d ~ now/d                             | 2695yesterday|
      | now/w ~ now                               | 2696thisWeek |
      | -1w/w ~ now/w                             | 2698lastWeek |
      | now/M ~ now                               | 397thisMonth |
      | -1M/M ~ now/M                             | 397lastMonth |
      | 2020-02-01 03:00:00 ~ 2020-02-05 03:00:00 | interval_date|
#bug RZY-5018
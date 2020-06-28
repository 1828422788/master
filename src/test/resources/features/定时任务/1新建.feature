@all @timedTask
Feature: 定时任务新建
# 26


  @startTomorrowTask
  Scenario: test_schedule_time
    Given open the "splSearch.SearchPage" page for uri "/search/"
    And I wait for element "SearchStatus" change text to "搜索完成!"
    When I set the parameter "SearchInput" with value "tag:sample04061424_chart  | stats count()"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I click the "SaveAsOther" button
    And I click the "TimedTask" button
    And I wait for element "SelectedUser" change text to username
    And I set the parameter "TaskName" with value "Test_StartTomorrow"
    And I set the parameter "Period" with value "5"
    And I choose the "分钟" from the "ExecuteTime"
    And I click the "StartTime" button
    And I set the parameter "StartTimeInput" with value "23:59:10"
    And I hide the element "TimePanel"
    And I will see the element "WhenToStart" contains "今天开始"
    And I click the "StartTime" button
    And I click the "StartTime" button
    And I set the parameter "StartTimeInput" with value "00:01:10"
    And I hide the element "TimePanel"
    And I will see the element "WhenToStart" contains "明天开始"
    And I click the "EnsureButton" button
    And I wait for "TimeTaskEnsure" will be visible
    Then I will see the success message "明天开始，是否继续"
    When I click the "Cancel" button
    And I click the "EnsureButton" button
    And I wait for "TimeTaskEnsure" will be visible
    And I will see the success message "明天开始，是否继续"
    And I click the "TimeTaskEnsure" button
    And I wait for "1500" millsecond
    And I wait for "TimeTaskEnsure" will be visible
    Then I will see the success message "保存成功"
    When open the "timedTask.ListPage" page for uri "/schedule/"
    And I wait for loading complete
    #bug RZY-5742
    # check that there was no executions
    # Then I will see the data "{'column':'2','name':'Test_StartTomorrow'}" values "{'column':'6','name':''}"

  Scenario Outline: sample(RZY-396,397,403,404,2695,2696,2698)
    Given open the "splSearch.SearchPage" page for uri "/search/"
    And I wait for element "SearchStatus" change text to "搜索完成!"
    When I set the parameter "SearchInput" with value "tag:sample04061424_chart \| stats count() as cnt \| eval icon=if(cnt>1000000,1,0)"
    And I click the "DateEditor" button
    And I click the "<time>" button
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I click the "SaveAsOther" button
    And I click the "TimedTask" button
    And I wait for element "SelectedUser" change text to username
    And I set the parameter "TaskName" with value "<taskName>"
    And I set the parameter "Describe" with value "testing"

    And I set the parameter "Period" with value "<periodNum>"
    And I choose the "<periodTime>" from the "ExecuteTime"
    And I click the "StartTime" button
    And I set the parameter "StartTimeInput" with value "23:58:10"
    And I hide the element "TimePanel"
    And I click the "EnsureButton" button
    And I wait for "TimeTaskEnsure" will be visible
    Then I will see the success message "保存成功"

    Examples:
   | time       | taskName  | periodNum | periodTime |
   | OneDay     | recent1d  | 17        |   分钟     |
   | TwoDays    | recent2d  | 3         |   小时     |
   | SevenDays  | recent7d  | 1         |    天      |
   | Today      | today     | 17        |            |
   | Yesterday  | yesterday | 57        |    分钟    |
   | ThisWeek   | thisWeek  | 7         |    小时    |
   | LastWeek   | lastWeek  | 2         |     天     |
   | ThisMonth  | thisMonth | 17        |            |
   | LastMonth  | lastMonth | 17        |            |



  Scenario Outline: date_interval
    Given open the "splSearch.SearchPage" page for uri "/search/"
    And I wait for element "SearchStatus" change text to "搜索完成!"
    When I set the parameter "SearchInput" with value "tag:sample04061424_chart | stats count() as cnt | eval icon=if(cnt>1000000,1,0)"
    And I click the "DateEditor" button
    And I click the "CustomTimeTab" button
    And I set the parameter "StartDateField" with value "<start_d>"
    And I set the parameter "EndDateField" with value "<end_d>"
    And I click the "StartTimeField" button
    And I click the "ApplyCustomTime" button
    And I wait for "1000" millsecond
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I click the "SaveAsOther" button
    And I click the "TimedTask" button
    And I wait for element "SelectedUser" change text to username
    And I set the parameter "TaskName" with value "<taskName>"
    And I set the parameter "Describe" with value "testing"

    And I set the parameter "Period" with value "<periodNum>"
    And I choose the "<periodTime>" from the "ExecuteTime"
    And I click the "StartTime" button
    And I set the parameter "StartTimeInput" with value "23:58:10"
    And I hide the element "TimePanel"
    And I click the "EnsureButton" button
    And I wait for "TimeTaskEnsure" will be visible
    Then I will see the success message "保存成功"

    Examples:
      | taskName      | start_d     | end_d       | periodNum | periodTime |
      | interval_date | 2020-06-01  | 2020-06-09  | 5         |  分钟      |



  Scenario Outline: sample_crontab(RZY-2699,2700,2702,2703,2704,2705)
    Given open the "splSearch.SearchPage" page for uri "/search/"
    And I wait for element "SearchStatus" change text to "搜索完成!"
    When I set the parameter "SearchInput" with value "tag:sample04061424_chart \| bucket timestamp span=1h as ts \| stats count(apache.clientip) as c_ip by ts"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I click the "SaveAsOther" button
    And I click the "TimedTask" button
    And I wait for element "SelectedUser" change text to username
    And I set the parameter "TaskName" with value "<taskName>"
    And I set the parameter "Describe" with value "testing"

    And I click the "Crontab" button
    And I set the parameter "CrontabInput" with value "<crontab>"
    And I click the "EnsureButton" button
    And I wait for "TimeTaskEnsure" will be visible
    Then I will see the success message "保存成功"

    Examples:
      | taskName          |   crontab             |
      | crontab_every15th |   0 5 9 15/3 * ?      |
      | crontab_9_930     |  0 0-30/10 9 * * ?    |
      | crontab_mon_fri   | 0 0/15 9 ? * MON-FRI  |
      | crontab_5h        | 0 0 */5 * * ?         |
      | crontab_57min     | 0 */57 * * * ?        |
      | crontab_7min      | 0 */7 * * * ?         |

    Scenario Outline:  crontab_message_error
      Given open the "splSearch.SearchPage" page for uri "/search/"
      And I wait for element "SearchStatus" change text to "搜索完成!"
      When I set the parameter "SearchInput" with value "tag:* \| stats count() by tag"
      And I click the "DateEditor" button
      And I click the "Today" button
      And I click the "SearchButton" button
      And I wait for element "SearchStatus" change text to "搜索完成!"
      And I click the "SaveAsOther" button
      And I click the "TimedTask" button
      And I wait for element "SelectedUser" change text to username
      And I set the parameter "TaskName" with value "<taskName>"
      And I set the parameter "Describe" with value "testing"
      And I click the "Crontab" button
      And I set the parameter "CrontabInput" with value "<crontab>"
      And I click the "EnsureButton" button
      And I wait for "TimeTaskEnsure" will be visible
      Then I will see the success message "<message>"

      Examples:
        | taskName | crontab | message                            |
        | test     |         | crontab模式下, 执行计划不能为零或空  |
        | test     | test    | crontab格式错误！                   |
        | test     | 0*      | crontab格式错误！                   |

  Scenario Outline: schedule_message_error_realtime
    Given open the "splSearch.SearchPage" page for uri "/search/"
    And I wait for element "SearchStatus" change text to "搜索完成!"
    When I set the parameter "SearchInput" with value "* | stats count()"
    And I click the "DateEditor" button
    And I click the "ThirtySeconds" button
    And I click the "SearchButton" button
    And I wait for "SaveAsOther" will be visible
    Then I click the "SaveAsOther" button
    Then I click the "TimedTask" button
    And I wait for element "SelectedUser" change text to username
    And I set the parameter "TaskName" with value "<name>"
    Then I set the parameter "Describe" with value "<describe>"
    And I click the "Crontab" button
    And I set the parameter "CrontabInput" with value "0 */30 * * * ?"
    Then I click the "EnsureButton" button
    And I wait for "TimeTaskEnsure" will be visible
    Then I will see the success message "<message>"

    Examples:
      | name | describe | message           |
      | test | autotest | 实时窗口搜索模式无法进行该操作!|

      Scenario Outline: schedule_message_error
        Given open the "splSearch.SearchPage" page for uri "/search/"
        And I wait for element "SearchStatus" change text to "搜索完成!"
        When I set the parameter "SearchInput" with value "tag:* \| stats count() by tag"
        And I click the "DateEditor" button
        And I click the "Today" button
        And I click the "SearchButton" button
        And I wait for element "SearchStatus" change text to "搜索完成!"
        Then I click the "SaveAsOther" button
        Then I click the "TimedTask" button
        And I wait for element "SelectedUser" change text to username
        And I set the parameter "TaskName" with value "<name>"
        Then I set the parameter "Describe" with value "<describe>"
        Then I set the parameter "Period" with value "<period>"
        Then I click the "EnsureButton" button
        And I wait for "TimeTaskEnsure" will be visible
        Then I will see the success message "<message>"

        Examples:
          | name | describe | period | message           |
          |      |          |        | 请输入名称            |
          | test | autotest |        | 定时模式下, 时间间隔不能为零或空 |
          | test | autotest | 0      | 定时模式下, 时间间隔不能为零或空 |
          | test | autotest | 1.5    | 定时模式下, 时间间隔应该为正整数 |
          | test | autotest | test   | 定时模式下, 时间间隔应该为正整数 |
          | test | autotest | 1      | 请输入开始时间           |


  Scenario Outline: sample_timeperiod(RZY-396,397,403,404,2695,2696,2698)
    Given open the "timedTask.ListPage" page for uri "/schedule/"
    And I wait for loading complete
    And I set the parameter "SearchInput" with value "<taskName>"
    And I wait for "Loading" will be invisible
    And I wait for "1000" millsecond
    When the data name is "{'column':'2','name':'<taskName>'}" then i click the "<taskName>" button
    Then I will see the "timedTask.DetailPage" page
    And I will see the element "TimePeriod" contains "<time>"

    Examples:
      | time                                      | taskName          |
      | 2020-06-01 08:00:00 ~ 2020-06-09 08:00:00 | interval_date     |
      | -1M/M ~ now/M                             | lastMonth         |
      | now/M ~ now                               | thisMonth         |
      | -1w/w ~ now/w                             | lastWeek          |
      | now/w ~ now                               | thisWeek          |
      | -1d/d ~ now/d                             | yesterday         |
      | now/d ~ now                               | today             |
      | -7d ~ now                                 | recent7d          |
      | -2d ~ now                                 | recent2d          |
      | -1d ~ now                                 | recent1d          |


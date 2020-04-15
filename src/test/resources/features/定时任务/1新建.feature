@all @timedTask
Feature: 定时任务新建
# 25
  Scenario Outline: sample(RZY-396,397,403,404,2695,2696,2698)
    Given open the "splSearch.SearchPage" page for uri "/search/"
    And I wait for element "SearchStatus" change text to "搜索完成!"
    When I set the parameter "SearchInput" with value "<spl>"
    And I click the "DateEditor" button
    And I click the "<time>" button
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I click the "SaveAsOther" button
    And I click the "TimedTask" button
    And I wait for element "SelectedUser" change text to "admin"
    And I set the parameter "TaskName" with value "<taskName>"
    And I set the parameter "Describe" with value "testing"
    And I choose the "AutoTestTag" from the "GroupComboBox"

    And I set the parameter "Period" with value "<periodNum>"
    And I choose the "<periodTime>" from the "ExecuteTime"
    And I click the "StartTime" button
    And I set the parameter "StartTimeInput" with value "21:10:10"
#    And I set the parameter "StartTimeInput" with value "CurrentTime5min"
    And I hide the element "TimePanel"
    And I click the "EnsureButton" button
    Then I will see the success message "保存成功"

    Examples:
   | time       | taskName  | periodNum | periodTime | startTime   | spl                                                                                                      |
   | OneDay     | recent1d  | 17        |   分钟     |5            | tag:sample04061424_chart \| bucket timestamp span=1h as ts \| stats count(apache.clientip) as c_ip by ts |
   | TwoDays    | recent2d  | 3         |   小时     |5            | tag:sample04061424_chart \| bucket timestamp span=1h as ts \| stats count(apache.clientip) as c_ip by ts |
   | SevenDays  | recent7d  | 1         |    天      |5            | tag:sample04061424_chart \| bucket timestamp span=1h as ts \| stats count(apache.clientip) as c_ip by ts |
   | Today      | today     | 17        |            |5            | tag:sample04061424_chart \| bucket timestamp span=1h as ts \| stats count(apache.clientip) as c_ip by ts |
   | Yesterday  | yesterday | 57        |    分钟    |5            | tag:sample04061424_chart \| bucket timestamp span=1h as ts \| stats count(apache.clientip) as c_ip by ts |
   | ThisWeek   | thisWeek  | 7         |    小时    |5            | tag:sample04061424_chart \| bucket timestamp span=1h as ts \| stats count(apache.clientip) as c_ip by ts |
   | LastWeek   | lastWeek  | 2         |     天     |5            | tag:sample04061424_chart \| bucket timestamp span=1h as ts \| stats count(apache.clientip) as c_ip by ts |
   | ThisMonth  | thisMonth | 17        |            |5            | tag:sample04061424_chart \| bucket timestamp span=1h as ts \| stats count(apache.clientip) as c_ip by ts |
   | LastMonth  | lastMonth | 17        |            |5            | tag:sample04061424_chart \| bucket timestamp span=1h as ts \| stats count(apache.clientip) as c_ip by ts |

    #check the results on details page
  # make for crontab
  #log resource


  Scenario Outline: date_interval
    Given open the "splSearch.SearchPage" page for uri "/search/"
    And I wait for element "SearchStatus" change text to "搜索完成!"
    When I set the parameter "SearchInput" with value "<spl>"
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
    And I wait for element "SelectedUser" change text to "admin"
    And I set the parameter "TaskName" with value "<taskName>"
    And I set the parameter "Describe" with value "testing"
    And I choose the "AutoTestTag" from the "GroupComboBox"

    And I set the parameter "Period" with value "<periodNum>"
    And I choose the "<periodTime>" from the "ExecuteTime"
    And I click the "StartTime" button
    And I set the parameter "StartTimeInput" with value "21:10:10"
#    And I set the parameter "StartTimeInput" with value "CurrentTime5min"
    And I hide the element "TimePanel"
    And I click the "EnsureButton" button
    Then I will see the success message "保存成功"

    Examples:
      | taskName      | start_d     | end_d       | periodNum | periodTime |spl                                                                                                      |
      | interval_date | 2020-04-01  | 2020-04-09  | 5         |  分钟      |* \| stats count() by tag|



  Scenario Outline: sample_crontab(RZY-2699,2700,2702,2703,2704,2705)
    Given open the "splSearch.SearchPage" page for uri "/search/"
    And I wait for element "SearchStatus" change text to "搜索完成!"
    When I set the parameter "SearchInput" with value "<spl>"
    And I click the "DateEditor" button
    And I click the "<time>" button
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I click the "SaveAsOther" button
    And I click the "TimedTask" button
    And I wait for element "SelectedUser" change text to "admin"
    And I set the parameter "TaskName" with value "<taskName>"
    And I set the parameter "Describe" with value "testing"
    And I choose the "AutoTestTag" from the "GroupComboBox"

    And I click the "Crontab" button
    And I set the parameter "CrontabInput" with value "<crontab>"
    And I click the "EnsureButton" button
    Then I will see the success message "保存成功"

    Examples:
      | time       | taskName          |   crontab             | spl      |
      |OneDay      | crontab_every15th |   0 5 9 15/3 * ?      | tag:sample04061424_chart \| bucket timestamp span=1h as ts \| stats count(apache.clientip) as c_ip by ts|
      |OneDay      | crontab_9_930     |  0 0-30/10 9 * * ?    | tag:sample04061424_chart \| bucket timestamp span=1h as ts \| stats count(apache.clientip) as c_ip by ts|
      |OneDay      | crontab_mon_fri   | 0 0/15 9 ? * MON-FRI  | tag:sample04061424_chart \| bucket timestamp span=1h as ts \| stats count(apache.clientip) as c_ip by ts|
      |OneDay      | crontab_5h        | 0 0 */5 * * ?         | tag:sample04061424_chart \| bucket timestamp span=1h as ts \| stats count(apache.clientip) as c_ip by ts|
      |OneDay      | crontab_57min     | 0 */57 * * * ?        | tag:sample04061424_chart \| bucket timestamp span=1h as ts \| stats count(apache.clientip) as c_ip by ts|
      |OneDay      | crontab_7min      | 0 */7 * * * ?         | tag:sample04061424_chart \| bucket timestamp span=1h as ts \| stats count(apache.clientip) as c_ip by ts|

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
      And I wait for element "SelectedUser" change text to "admin"
      And I set the parameter "TaskName" with value "<taskName>"
      And I set the parameter "Describe" with value "testing"
      And I choose the "AutoTestTag" from the "GroupComboBox"
      And I click the "Crontab" button
      And I set the parameter "CrontabInput" with value "<crontab>"
      And I click the "EnsureButton" button
      Then I will see the success message "<message>"

      Examples:
        | taskName | crontab | message                            |
        | test     |         | crontab模式下, 执行计划不能为零或空  |
        | test     | test    | crontab格式错误！                   |
        | test     | 0*      | crontab格式错误！                   |

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
        And I wait for element "SelectedUser" change text to "admin"
        And I set the parameter "TaskName" with value "<name>"
        Then I set the parameter "Describe" with value "<describe>"
        Then I set the parameter "Period" with value "<period>"
        Then I click the "EnsureButton" button
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
    And I wait for loading invisible
    When the data name is "{'column':'2','name':'<taskName>'}" then i click the "<taskName>" button
    Then I will see the "timedTask.DetailPage" page
    And I will see the element "TimePeriod" contains "<time>"

    Examples:
      | time                                      | taskName     |
#      | 2020-04-01 00:00:00 ~ 2020-04-09 00:00:00 | interval_date|
      | -1M/M ~ now/M                             | lastMonth    |
      | now/M ~ now                               | thisMonth    |
      | -1w/w ~ now/w                             | lastWeek     |
      | now/w ~ now                               | thisWeek     |
      | -1d/d ~ now/d                             | yesterday    |
      | now/d ~ now                               | today        |
      | -7d ~ now                                 | recent7d     |
      | -2d ~ now                                 | recent2d     |
      | -1d ~ now                                 | recent1d     |


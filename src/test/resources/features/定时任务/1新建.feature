@spl @all @timedTask
Feature: 定时任务新增

  Background:
    Given open the "splSearch.SearchPage" page for uri "/search/"
    And I wait for element "SearchStatus" change text to "搜索完成!"

  @first @timedTaskSmoke
  Scenario Outline: sample(RZY-396,397,403,404,2695,2696,2698)
    Given I set the parameter "SearchInput" with value "<spl>"
    And I click the "DateEditor" button
    And I click the "<time>" button
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I click the "SaveAsOther" button
    And I click the "TimedTask" button
    And I set the parameter "TaskName" with value "<taskName>"
    And I set the parameter "TaskName" with value "<taskName>"
    And I set the parameter "Describe" with value "testing"
    And I choose the "AutoTestTag" from the "GroupComboBox"
    And I choose the "无数集app之api全部测试用例" from the "AppComboBox"

    And I set the parameter "Period" with value "<periodNum>"
    And I choose the "<periodTime>" from the "ExecuteTime"
    And I click the "StartTime" button
    And I set the parameter "StartTimeInput" with value "21:10:10"
#    And I set the parameter "StartTimeInput" with value "CurrentTime5min"
    And I hide the element "TimePanel"
    And I click the "EnsureButton" button
    Then I will see the success message "保存成功"

    Examples:
   | time       | taskName     | periodNum | periodTime | startTime   | spl                                                                                                      |
   | OneDay     | 396recent1d  | 17        |   分钟     |5            | tag:sample04061424_chart \| bucket timestamp span=1h as ts \| stats count(apache.clientip) as c_ip by ts |
   | TwoDays    | 403recent2d  | 3         |   小时     |5            | tag:sample04061424_chart \| bucket timestamp span=1h as ts \| stats count(apache.clientip) as c_ip by ts |
   | SevenDays  | 404recent7d  | 1         |    天      |5            | tag:sample04061424_chart \| bucket timestamp span=1h as ts \| stats count(apache.clientip) as c_ip by ts |
   | Today      | 397today     | 17        |            |5            | tag:sample04061424_chart \| bucket timestamp span=1h as ts \| stats count(apache.clientip) as c_ip by ts |
   | Yesterday  | 2695yesterday| 57        |    分钟    |5            | tag:sample04061424_chart \| bucket timestamp span=1h as ts \| stats count(apache.clientip) as c_ip by ts |
   | ThisWeek   | 2696thisWeek | 7         |    小时    |5            | tag:sample04061424_chart \| bucket timestamp span=1h as ts \| stats count(apache.clientip) as c_ip by ts |
   | LastWeek   | 2698lastWeek | 2         |     天     |5            | tag:sample04061424_chart \| bucket timestamp span=1h as ts \| stats count(apache.clientip) as c_ip by ts |
   | ThisMonth  | 397thisMonth | 17        |            |5            | tag:sample04061424_chart \| bucket timestamp span=1h as ts \| stats count(apache.clientip) as c_ip by ts |
   | LastMonth  | 397lastMonth | 17        |            |5            | tag:sample04061424_chart \| bucket timestamp span=1h as ts \| stats count(apache.clientip) as c_ip by ts |

    #check the results on details page
  # make for crontab


  Scenario Outline: date_interval
    Given I set the parameter "SearchInput" with value "<spl>"
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
    And I set the parameter "TaskName" with value "<taskName>"
    And I set the parameter "TaskName" with value "<taskName>"
    And I set the parameter "Describe" with value "testing"
    And I choose the "AutoTestTag" from the "GroupComboBox"
    And I choose the "无数集app之api全部测试用例" from the "AppComboBox"

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
      | interval_date | 2020-02-01  | 2020-02-05  | 5         |  分钟      |tag:sample04061424_chart \| bucket timestamp span=1h as ts \| stats count(apache.clientip) as c_ip by ts |



  Scenario Outline: sample_crontab(RZY-2699,2700,2702,2703,2704,2705)
    Given I set the parameter "SearchInput" with value "<spl>"
    And I click the "DateEditor" button
    And I click the "<time>" button
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I click the "SaveAsOther" button
    And I click the "TimedTask" button
    And I set the parameter "TaskName" with value "<taskName>"
    And I set the parameter "TaskName" with value "<taskName>"
    And I set the parameter "Describe" with value "testing"
    And I choose the "AutoTestTag" from the "GroupComboBox"
    And I choose the "无数集app之api全部测试用例" from the "AppComboBox"

    And I click the "Crontab" button
    And I set the parameter "CrontabInput" with value "<crontab>"
    And I click the "EnsureButton" button
    Then I will see the success message "保存成功"

    Examples:
      | time       | taskName       |   crontab             | spl      |
      |OneDay      | 2699every15th  |   0 5 9 15/3 * ?      | tag:sample04061424_chart \| bucket timestamp span=1h as ts \| stats count(apache.clientip) as c_ip by ts|
      |OneDay      | 2700_9_930     |  0 0-30/10 9 * * ?    | tag:sample04061424_chart \| bucket timestamp span=1h as ts \| stats count(apache.clientip) as c_ip by ts|
      |OneDay      | 2702_mon_fri   | 0 0/15 9 ? * MON-FRI  | tag:sample04061424_chart \| bucket timestamp span=1h as ts \| stats count(apache.clientip) as c_ip by ts|
      |OneDay      | 2703_5h        | 0 0 */5 * * ?         | tag:sample04061424_chart \| bucket timestamp span=1h as ts \| stats count(apache.clientip) as c_ip by ts|
      |OneDay      | 2704_57min     | 0 */57 * * * ?        | tag:sample04061424_chart \| bucket timestamp span=1h as ts \| stats count(apache.clientip) as c_ip by ts|
      |OneDay      | 2705_7min      | 0 */7 * * * ?         | tag:sample04061424_chart \| bucket timestamp span=1h as ts \| stats count(apache.clientip) as c_ip by ts|



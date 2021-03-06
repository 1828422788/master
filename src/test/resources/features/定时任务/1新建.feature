@timedTask
Feature: 定时任务_1新建

  @timedTaskSmoke
  Scenario: 明天开始的定时任务
    Given open the "splSearch.SearchPage" page for uri "/search/"
    And I wait for element "SearchStatus" change text to "搜索完成!"
    When I set the parameter "SearchInput" with value "tag:sample04061424_chart  | stats count()"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I click the "SaveAsOther" button
    And I click the "TimedTask" button
    And switch to window "编辑报表"
    And I close all tabs except main tab
    Then I will see the "timedTask.EditPage" page
    And I wait for element "SelectedUser" change text to username
    And I choose the "test_app" from the "AppDropdown"
    And I set the parameter "Name" with value "Test_StartTomorrow"
    And I set the parameter "Period" with value "5"
    And I choose the "分钟" from the "Unit"
    And I set the parameter "StartTimeInput" with value "23:59:10"
    And I click the "StartTimeInput" button
    And I click the Circle "BasicSettings" button
    And I click the "AddIndex" button
    And I will see the element "IndexPanel" contains "schedule"
    And I will see the element "WhenToStart" contains "今天开始"
    And I set the parameter "StartTimeInput" with value "00:01:10"
    And I click the "StartTimeInput" button
    And I click the Circle "BasicSettings" button
    And I will see the element "WhenToStart" contains "明天开始"
    And I click the "Submit" button
    And I will see the message contains "明天开始，是否继续"
    When I click the "Cancel" button
    And I wait for "Cancel" will be invisible
    And I click the "Submit" button
    And I will see the message contains "明天开始，是否继续"
    And I click the "EnsureButton" button
    Then I will see the success message "保存成功"
    When open the "timedTask.ListPage" page for uri "/schedule/"
    And I wait for loading invisible
    Then I will see the data "{'column':'1','name':'Test_StartTomorrow'}" values "{'column':'3','name':'-'}"

  Scenario Outline: 新建定时任务(RZY-396,397,403,404,2695,2696,2698)
    Given open the "splSearch.SearchPage" page for uri "/search/"
    And I wait for element "SearchStatus" change text to "搜索完成!"
    When I set the parameter "SearchInput" with value "tag:sample04061424_chart \| stats count() as cnt \| eval icon=if(cnt>1000000,1,0)"
    And I click the "DateEditor" button
    And I click the "<time>" button
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I click the "SaveAsOther" button
    And I click the "TimedTask" button
    And switch to window "编辑报表"
    And I close all tabs except main tab
    Then I will see the "timedTask.EditPage" page
    And I wait for element "SelectedUser" change text to username
    And I set the parameter "Name" with value "<taskName>"
    And I set the parameter "Describe" with value "testing"

    And I set the parameter "Period" with value "<periodNum>"
    And I choose the "<periodTime>" from the "Unit"
    And I set the parameter "StartTimeInput" with value "23:58:10"
    And I click the "StartTimeInput" button
    And I click the Circle "BasicSettings" button
    And I click the "AddIndex" button
    And I will see the element "IndexPanel" contains "schedule"
    And I will see the element "DatePicker" contains "<timeDisplay>"
    And I click the "Submit" button
    Then I will see the success message "保存成功"

    Examples:
   | time       | taskName  | periodNum | periodTime | timeDisplay |
   | OneDay     | recent1d  | 17        |   分钟     | 最近1天     |
   | TwoDays    | recent2d  | 3         |   小时     | 最近2天     |
   | SevenDays  | recent7d  | 1         |    天      | 最近7天     |
   | Today      | today     | 17        |            | 今天        |
   | Yesterday  | yesterday | 57        |    分钟    | 昨天        |
   | ThisWeek   | thisWeek  | 7         |    小时    | 本周        |
   | LastWeek   | lastWeek  | 2         |     天     | 上周        |
   | ThisMonth  | thisMonth | 17        |            | 本月        |
   | LastMonth  | lastMonth | 17        |            | 上月        |

  @timedTaskSmoke
  Scenario Outline: 新建定时任务_自定义时间范围
    Given open the "splSearch.SearchPage" page for uri "/search/"
    And I wait for element "SearchStatus" change text to "搜索完成!"
    When I set the parameter "SearchInput" with value "tag:sample04061424_chart | stats count() as cnt | eval icon=if(cnt>1000000,1,0)"
    And I click the "DateEditor" button
    And I click the "CustomTimeTab" button
    And I set the parameter "StartDateField" with value "<start_d>"
    And I set the parameter "StartTimeField" with value "08:00:00.000"
    And I set the parameter "EndDateField" with value "<end_d>"
    And I set the parameter "EndTimeField" with value "08:00:00.000"
    And I click the "StartTimeField" button
    And I click the "ApplyCustomTime" button
    And I wait for "1000" millsecond
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I click the "SaveAsOther" button
    And I click the "TimedTask" button
    And switch to window "编辑报表"
    And I close all tabs except main tab
    Then I will see the "timedTask.EditPage" page
    And I wait for element "SelectedUser" change text to username
    And I set the parameter "Name" with value "<taskName>"
    And I set the parameter "Describe" with value "testing"
    And I choose the "auto_package" from the "TaskGroup"
    And I click the Circle "BasicSettings" button

    And I set the parameter "Period" with value "<periodNum>"
    And I set the parameter "StartTimeInput" with value "23:58:10"
    And I click the "StartTimeInput" button
    And I click the Circle "BasicSettings" button
    And I click the "AddIndex" button
    And I will see the element "IndexPanel" contains "schedule"
    And I will see the element "DatePicker" contains "2020-06-01 - 2020-06-09"
    And I click the "Submit" button
    Then I will see the success message "保存成功"

    Examples:
      | taskName      | start_d     | end_d       | periodNum |
      | interval_date | 2020-06-01  | 2020-06-09  | 5         |

  Scenario Outline: 新建定时任务_crontab(RZY-2699,2700,2702,2703,2704,2705)
    Given open the "splSearch.SearchPage" page for uri "/search/"
    And I wait for element "SearchStatus" change text to "搜索完成!"
    When I set the parameter "SearchInput" with value "tag:sample04061424_chart \| bucket timestamp span=1h as ts \| stats count(apache.clientip) as c_ip by ts"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I click the "SaveAsOther" button
    And I click the "TimedTask" button
    And switch to window "编辑报表"
    And I close all tabs except main tab
    Then I will see the "timedTask.EditPage" page
    And I wait for element "SelectedUser" change text to username
    And I set the parameter "Name" with value "<taskName>"
    And I set the parameter "Describe" with value "testing"

    And I set the parameter "CrontabInput" with value "<crontab>"
    And I click the "AddIndex" button
    And I will see the element "IndexPanel" contains "schedule"
    And I click the "Submit" button
    Then I will see the success message "保存成功"

    Examples:
      | taskName          |   crontab             |
      | crontab_every15th |   0 5 9 15/3 * ?      |
      | crontab_9_930     |  0 0-30/10 9 * * ?    |
      | crontab_mon_fri   | 0 0/15 9 ? * MON-FRI  |
      | crontab_5h        | 0 0 */5 * * ?         |

    @timedTaskSmoke
    Examples:
      | taskName          |   crontab             |
      | crontab_3min      | 0 */3 * * * ?         |

  Scenario Outline:  crontab_检查提示
    Given open the "splSearch.SearchPage" page for uri "/search/"
    And I wait for element "SearchStatus" change text to "搜索完成!"
    When I set the parameter "SearchInput" with value "tag:* \| stats count() by tag"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I click the "SaveAsOther" button
    And I click the "TimedTask" button
    And switch to window "编辑报表"
    And I close all tabs except main tab
    Then I will see the "timedTask.EditPage" page
    And I wait for element "SelectedUser" change text to username
    And I set the parameter "Name" with value "<taskName>"
    And I set the parameter "Describe" with value "testing"
    And I set the parameter "CrontabInput" with value "<crontab>"
    And I click the "Submit" button
    And I will see the element "<element>" contains "<message>"

    Examples:
      | taskName | crontab | message                             | element          |
      | test     |         | crontab模式下, 执行计划不能为零或空 | TipText          |
      | test     | test    | crontab格式错误！                   | Message          |
      | test     | 0*      | crontab格式错误！                   | Message          |

  @timedTaskSmoke
  Scenario: 实时窗口
    Given open the "splSearch.SearchPage" page for uri "/search/"
    And I wait for element "SearchStatus" change text to "搜索完成!"
    When I set the parameter "SearchInput" with value "* | stats count()"
    And I click the "DateEditor" button
    And I click the "TenSeconds" button
    And I click the "SearchButton" button
    And I wait for "SaveAsOther" will be visible
    Then I click the "SaveAsOther" button
    And I will see the "TimedTask" doesn't exist

  Scenario Outline: 检查提示1
    Given open the "splSearch.SearchPage" page for uri "/search/"
    And I wait for element "SearchStatus" change text to "搜索完成!"
    When I set the parameter "SearchInput" with value "tag:* \| stats count() by tag"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    Then I click the "SaveAsOther" button
    Then I click the "TimedTask" button
    And switch to window "编辑报表"
    And I close all tabs except main tab
    Then I will see the "timedTask.EditPage" page
    And I wait for element "SelectedUser" change text to username
    And I set the parameter "Name" with value "<name>"
    Then I set the parameter "Period" with value "<period>"
    And I click the "Submit" button
    And I will see the element "TipText" contains "<message>"

    Examples:
      | name | period | message                           |
      |      |        | 请输入名称                        |
      | test |        | 定时模式下, 时间间隔不能为零或空  |
      | test | 0      | 定时模式下, 时间间隔不能为零或空  |
      | test | 1.5    | 定时模式下, 时间间隔应该为正整数  |
      | test | test   | 定时模式下, 时间间隔应该为正整数  |
      | test | 1      | 请输入正确的时间格式：HH:mm:ss    |

  Scenario: 检查提示2
    Given open the "splSearch.SearchPage" page for uri "/search/"
    And I wait for element "SearchStatus" change text to "搜索完成!"
    When I set the parameter "SearchInput" with value "tag:* \| stats count() by tag"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    Then I click the "SaveAsOther" button
    Then I click the "TimedTask" button
    And switch to window "编辑报表"
    And I close all tabs except main tab
    Then I will see the "timedTask.EditPage" page
    And I wait for element "SelectedUser" change text to username
    And I set the parameter "Name" with value " "
    And I click the "Submit" button
    And I will see the element "TipText" contains "名称 不能为空"

  Scenario Outline: 定时任务_检查时间范围(RZY-396,397,403,404,2695,2696,2698)
    Given open the "timedTask.ListPage" page for uri "/schedule/"
    And I wait for loading invisible
    And I set the parameter "TextFilter" with value "<taskName>"
    And I wait for loading invisible
    When the data name is "{'column':'1','name':'<taskName>'}" then i click the "<taskName>" button
    Then I will see the "timedTask.DetailPage" page
    And I will see the element "TimePeriod" contains "<time>"

    Examples:
      | time                                      | taskName          |
      | -1M/M ~ now/M                             | lastMonth         |
      | now/M ~ now                               | thisMonth         |
      | -1w/w ~ now/w                             | lastWeek          |
      | now/w ~ now                               | thisWeek          |
      | -1d/d ~ now/d                             | yesterday         |
      | now/d ~ now                               | today             |
      | -7d ~ now                                 | recent7d          |
      | -2d ~ now                                 | recent2d          |
      | -1d ~ now                                 | recent1d          |

    @timedTaskSmoke
    Examples:
      | time                                      | taskName          |
      | 2020-06-01 08:00:00 ~ 2020-06-09 08:00:00 | interval_date     |




@spl @all @timedTask
Feature: 定时任务新增

  Background:
    Given open the "splSearch.SearchPage" page for uri "/search/"

  @smoke @timedTaskSmoke
  Scenario Outline: RZY-396：定时任务_sample_表格_近一天
    Given I set the parameter "SearchInput" with value "<spl>"
    And I choose the "所有日志" as log resource
    And I click the "DateEditor" button
    And I click the "<time>" button
    And I click the "SearchButton" button
    And I wait element "SearchStatus" change text to "搜索完成!"
    And I click the "SaveAsOther" button
    And I click the "TimedTask" button
    And I set the parameter "TaskName" with value "<taskName>"
    And I set the parameter "Describe" with value "testing 定时任务样例"
    And I choose the "default_SavedSchedule" from the "GroupComboBox"
    And I set the parameter "Period" with value "<period>"
    And I click the "StartTime" button
    And I set the time input "StartTomorrow" to "<startTime>" minutes later
    And I click the "EnsureButton" button
    And I display the element "TimePanel"
    And I click the "Ensure" button
    Then I will see the success message "保存成功"

    Examples:
      | spl                                                                                                      | time  | taskName                   | period | startTime |
      | tag:sample04061424_chart \| bucket timestamp span=1h as ts \| stats count(apache.clientip) as c_ip by ts | Today | RZY-396：定时任务_sample_表格_近一天 | 17     | 5         |

  @smoke @timedTaskSmoke
  Scenario Outline: RZY-403、404
    Given I set the parameter "SearchInput" with value "<spl>"
    And I choose the "所有日志" as log resource
    And I click the "DateEditor" button
    And I click the "<time>" button
    And I click the "SearchButton" button
    And I wait element "SearchStatus" change text to "搜索完成!"
    And I click the "SaveAsOther" button
    And I click the "TimedTask" button
    And I set the parameter "TaskName" with value "<taskName>"
    And I set the parameter "Describe" with value "testing 定时任务样例"
    And I choose the "default_SavedSchedule" from the "GroupComboBox"
    And I set the parameter "Period" with value "<period>"
    And I choose the "<unit>" from the "ExecuteTime"
    And I click the "StartTime" button
    And I set the time input "StartTomorrow" to "<startTime>" minutes later
    And I click the "EnsureButton" button
    And I display the element "TimePanel"
    And I click the "Ensure" button
    Then I will see the success message "保存成功"

    Examples:
      | spl                                                                                                      | time      | taskName            | period | unit | startTime |
      | tag:sample04061424_chart \| bucket timestamp span=1h as ts \| stats count(apache.clientip) as c_ip by ts | Today     | RZY-403：执行计划-定时_3小时 | 3      | 小时   | 5         |
      | tag:sample04061424_chart \| stats count() by apache.resp_len                                             | Yesterday | RZY-404：执行计划-定时1天   | 1      | 天    | 5         |

  Scenario Outline: RZY-2695：执行计划-crontab_57分钟
    Given I set the parameter "SearchInput" with value "<spl>"
    And I choose the "所有日志" as log resource
    And I click the "DateEditor" button
    And I click the "<time>" button
    And I click the "SearchButton" button
    And I wait element "SearchStatus" change text to "搜索完成!"
    And I click the "SaveAsOther" button
    And I click the "TimedTask" button
    And I set the parameter "TaskName" with value "<taskName>"
    And I set the parameter "Describe" with value "testing 定时任务样例"
    And I choose the "default_SavedSchedule" from the "GroupComboBox"
    And I set the parameter "CrontabInput" with value "<crontab>"
    And I click the "EnsureCrontab" button
    Then I will see the success message "<message>"

  @smoke @timedTaskSmoke
    Examples:
      | spl                                                          | time      | taskName                   | crontab        | message |
      | tag:sample04061424_chart \| stats count() by apache.resp_len | Yesterday | RZY-2695：执行计划-crontab_57分钟 | 0 */57 * * * ? | 保存成功    |

    Examples:
      | spl                                                          | time  | taskName | crontab | message                       |
      | tag:sample04061424_chart \| stats count() by apache.resp_len | Today | test     |         | crontab模式下, 执行计划不能为零或空        |
      | tag:sample04061424_chart \| stats count() by apache.resp_len | Today | test     | test    | 无效参数, 参数：[crontab]\n错误码: FE_7 |
      | tag:sample04061424_chart \| stats count() by apache.resp_len | Today | test     | 测试      | 无效参数, 参数：[crontab]\n错误码: FE_7 |

  @smoke @timedTaskSmoke
  Scenario Outline: RZY-2450、397
    When I set the parameter "SearchInput" with value "<spl>"
    And I click the "DateEditor" button
    And I click the "<time>" button
    And I click the "SearchButton" button
    And I wait element "SearchStatus" change text to "搜索完成!"
    Then I will see the "splSearch.StatisticalPage" page
    And I click the "Type" button
    Then I will see the "trend.CreatePage" page
    And I click the "<chartType>" button
    And I click the "<chart>" button
    And I wait for loading invisible
    And I display the element "ChartTypePopover"
    And I will see the "splSearch.SearchPage" page
    And I click the "SaveAsOther" button
    And I click the "TimedTask" button
    And I set the parameter "TaskName" with value "<taskName>"
    And I set the parameter "Describe" with value "<describe>"
    And I choose the "default_SavedSchedule" from the "GroupComboBox"
    And I set the parameter "Period" with value "30"
    And I click the "StartTime" button
    And I set the time input "StartTomorrow" to "5" minutes later
    And I click the "EnsureButton" button
    And I display the element "TimePanel"
    And I click the "Ensure" button
    Then I will see the success message "保存成功"

    Examples:
      | spl                                                                                    | time      | chartType | chart  | taskName              | describe                 |
      | tag:sample04061424_chart \| stats count() by apache.status,apache.clientip \| limit 10 | Today     | Other     | Funnel | chs_task_funnel       | RZY-2450：task_漏斗图_sample |
      | tag:sample04061424_chart \| stats count() by apache.resp_len                           | Yesterday |           | Line   | RZY-397：定时任务sample_昨天 | testing 定时任务样例           |

  @smoke @timedTaskSmoke
  Scenario Outline: 生成图表类型的定时任务（RZY-1488、RZY-2296、RZY-2297、RZY-2298、RZY-2300）
    Given I set the parameter "SearchInput" with value "<splQuery>"
    When I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait element "SearchStatus" change text to "搜索完成!"
    And I click the "Type" button
    And I click the "<groupType>" button
    And I click the "<type>" button
    And I click the "SaveAsOther" button
    And I click the "TimedTask" button
    And I set the parameter "TaskName" with value "<name>"
    And I set the parameter "Describe" with value "<describe>"
    And I choose the "<groups>" from the "GroupComboBox"
    And I set the parameter "Period" with value "<period>"
    And I click the "StartTime" button
    And I set the time input "StartTomorrow" to "2" minutes later
    And I click the "EnsureButton" button
    And I display the element "TimePanel"
    And I click the "Ensure" button
    Then I will see the success message "保存成功"

    Examples:
      | splQuery                                                                                                                       | groupType  | type       | name                     | describe | groups                | period |
      | (tag:heka) \|bucket timestamp timeranges=((2018-07-26:10:39:50, 2018-07-27:10:40:02)) as tr \| stats dc('appname') as ct by tr | Order      | Line       | RZY-1488：保存为各种类型的定时任务-序列 | owner    | default_SavedSchedule | 10     |
      | tag:"sample04061424" \| eval status = apache.status \| stats count() as cnt by status \| eval newField = cnt + status          | Other      | Wordcloud  | wordcloudAutoTest        | owner    | default_SavedSchedule | 15     |
      | * \| stats avg(raw_message_length) as avg_length, count(apache.clientip) as ip_count by appname \| sort by ip_count            | Connection | Force      | forceAutoTest            | owner    | default_SavedSchedule | 15     |
      | tag:"sample04061424" \| eval status = apache.status \| stats count() as cnt by status \| eval newField = cnt + status          | Other      | Single     | singleAutoTest           | owner    | default_SavedSchedule | 15     |
      | tag:"sample04061424" \| eval status = apache.status \| stats count() as cnt by status \| eval newField = cnt + status          | Other      | Liquidfill | liquidfillAutoTest       | owner    | default_SavedSchedule | 15     |
      | * \| stats avg(raw_message_length) as avg_length, count(apache.clientip) as ip_count by appname \| sort by ip_count            | Order      | Area       | areaAutoTest             | owner    | default_SavedSchedule | 15     |
      | * \| stats avg(raw_message_length) as avg_length, count(apache.clientip) as ip_count by appname \| sort by ip_count            | Order      | Column     | columnAutoTest           | owner    | default_SavedSchedule | 15     |
      | * \| stats avg(raw_message_length) as avg_length, count(apache.clientip) as ip_count by appname \| sort by ip_count            | Order      | Scatter    | scatterAutoTest          | owner    | default_SavedSchedule | 15     |
      | * \| stats avg(raw_message_length) as avg_length, count(apache.clientip) as ip_count by appname \| sort by ip_count            | Dimension  | Pie        | pieAutoTest              | owner    | default_SavedSchedule | 15     |
      | * \| stats avg(raw_message_length) as avg_length, count(apache.clientip) as ip_count by appname \| sort by ip_count            | Dimension  | Rose       | roseAutoTest             | owner    | default_SavedSchedule | 15     |
      | * \| stats avg(raw_message_length) as avg_length, count(apache.clientip) as ip_count by appname \| sort by ip_count            | Dimension  | Bar        | barAutoTest              | owner    | default_SavedSchedule | 15     |
      | * \| stats avg(raw_message_length) as avg_length, count(apache.clientip) as ip_count by appname \| sort by ip_count            | Compound   | Multiaxis  | multiaxisAutoTest        | owner    | default_SavedSchedule | 15     |
      | * \| stats avg(raw_message_length) as avg_length, count(apache.clientip) as ip_count by appname \| sort by ip_count            | Connection | Chord      | chordAutoTest            | owner    | default_SavedSchedule | 15     |
      | * \| stats avg(raw_message_length) as avg_length, count(apache.clientip) as ip_count by appname \| sort by ip_count            | Connection | Sankey     | sankeyAutoTest           | owner    | default_SavedSchedule | 15     |

  @smoke @timedTaskSmoke
  Scenario Outline: 生成循序图的定时任务（RZY-2300步骤5）
    Given I set the parameter "SearchInput" with value "<splQuery>"
    When I click the "DateEditor" button
    And I click the "Yesterday" button
    And I click the "SearchButton" button
    And I wait element "SearchStatus" change text to "搜索完成!"
    And I click the "Type" button
    And I click the "<groupType>" button
    And I click the "<type>" button
    And I click the "Setting" button
    And I choose the "<timeSequence>" from the "SelectData"
    And I click the "Source" button
    And I choose the "<source>" from the "SelectData"
    And I click the "Target" button
    And I choose the "<target>" from the "SelectData"
    And I click the "Cut" button
    And I choose the "<cut>" from the "SelectData"
    And I click the "Mark" button
    And I choose the "<mark>" from the "SelectData"
    And I click the "Generate" button
    And I click the "SaveAsOther" button
    And I wait for loading invisible
    And I click the "TimedTask" button
    And I set the parameter "TaskName" with value "<name>"
    And I set the parameter "Describe" with value "<describe>"
    And I choose the "<users>" from the "UserComboBox"
    And I choose the "<groups>" from the "GroupComboBox"
    And I set the parameter "Period" with value "<period>"
    And I click the "StartTime" button
    And I set the time input "StartTomorrow" to "2" minutes later
    And I click the "EnsureButton" button
    And I display the element "TimePanel"
    And I click the "Ensure" button
    Then I will see the success message "保存成功"

    Examples:
      | splQuery                                      | groupType | type     | timeSequence | source          | target   | cut             | mark            | name             | describe | users | groups                | period |
      | *\| stats count() by hostname,apache.clientip | Other     | Sequence | hostname     | apache.clientip | hostname | apache.clientip | apache.clientip | sequenceAutoTest |          | owner | default_SavedSchedule | 15     |

  @smoke @timedTaskSmoke
  Scenario Outline: 生成力图的定时任务（RZY-2297步骤3）
    Given I set the parameter "SearchInput" with value "<splQuery>"
    When I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait element "SearchStatus" change text to "搜索完成!"
    And I click the "Type" button
    And I click the "<groupType>" button
    And I click the "<type>" button
    And I wait for loading invisible
    And I click the "Setting" button
    And I click the "Target" button
    Then I choose the "<target>" from the "SelectData"
    And I click the "Weight" button
    Then I choose the "<weight>" from the "SelectData"
    And I click the "Show" button
    And I click the "Generate" button
    And I click the "SaveAsOther" button
    And I click the "TimedTask" button
    And I set the parameter "TaskName" with value "<name>"
    And I set the parameter "Describe" with value "<describe>"
    And I choose the "<users>" from the "UserComboBox"
    And I choose the "<groups>" from the "GroupComboBox"
    And I set the parameter "Period" with value "<period>"
    And I click the "StartTime" button
    And I set the time input "StartTomorrow" to "2" minutes later
    And I click the "EnsureButton" button
    And I display the element "TimePanel"
    And I click the "Ensure" button
    Then I will see the success message "保存成功"

    Examples:
      | splQuery                                                                                                            | groupType  | type  | source  | target  | weight   | name             | describe | users | groups                | period |
      | * \| stats avg(raw_message_length) as avg_length, count(apache.clientip) as ip_count by appname \| sort by ip_count | Connection | Force | appname | appname | ip_count | forceSunAutoTest |          | owner | default_SavedSchedule | 15     |

  @smoke @timedTaskSmoke
  Scenario Outline: 生成区间图的定时任务（RZY-2298步骤1）
    Given I set the parameter "SearchInput" with value "<splQuery>"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait element "SearchStatus" change text to "搜索完成!"
    And I click the "Type" button
    And I click the "<groupType>" button
    And I click the "<type>" button
    And I click the "Setting" button
    Then I choose the "<xaxis>" from the "SelectData"
    And I click the "Yaxis" button
    Then I choose the "<acturalData>" from the "ActuralData"
    Then I choose the "<predictData>" from the "PredictData"
    Then I choose the "<topLimit>" from the "TopLimit"
    Then I choose the "<lowerLimit>" from the "LowerLimit"
    And I click the "Generate" button
    Then I click the "SaveAsOther" button
    Then I click the "TimedTask" button
    Then I set the parameter "TaskName" with value "<name>"
    Then I set the parameter "Describe" with value "<describe>"
    Then I choose the "<users>" from the "UserComboBox"
    Then I choose the "<groups>" from the "GroupComboBox"
    Then I set the parameter "Period" with value "<period>"
    And I click the "StartTime" button
    And I set the time input "StartTomorrow" to "2" minutes later
    Then I click the "EnsureButton" button
    And I display the element "TimePanel"
    Then I click the "Ensure" button
    Then I will see the success message "保存成功"

    Examples:
      | splQuery                                                                                                                                                                                                                                     | groupType | type      | xaxis | acturalData | predictData | topLimit | lowerLimit | name              | describe | users | groups                | period |
      | * \| bucket timestamp span=3h as ts\| stats count(appname) as count_ by ts \| movingavg count_,5 as ma \| rollingstd count_,5 as rs\| eval lower=ma-3*rs\| eval upper=ma+3*rs \| eval outlier=if(count_>upper\|\|count_<lower, count_, null) | Compound  | rangeline | ts    | count_      | count_      | upper    | lower      | rangelineAutoTest |          | owner | default_SavedSchedule | 15     |

  Scenario: RZY-2956:task_其它_调用链_sample
    When I set the parameter "SearchInput" with value "tag:gf_dapper* AND dapper.msg.traceId:"511f8756ce1d0b8a" dapper.msg.duration:>0  | table dapper.msg.id, dapper.msg.parentId, dapper.class, dapper.msg.duration, dapper.msg.timestamp,dapper.msg.binaryAnnotations[].value, collector_recv_timestamp"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait element "SearchStatus" change text to "搜索完成!"
    Then I will see the "splSearch.StatisticalPage" page
    And I click the "Type" button
    Then I will see the "trend.CreatePage" page
    And I click the "Other" button
    And I click the "Tracing" button
    And I click the "Setting" button
    And I choose the "dapper.class" from the "SettingSelect"
    And I choose the "dapper.msg.parentId" from the "ParentId"
    And I choose the "dapper.msg.id" from the "ChildId"
    And I click the "Time" button
    And I choose the "dapper.msg.timestamp" from the "SettingSelect"
    And I choose the "dapper.msg.duration" from the "KeepTime"
    And I click the "Info" button
    And I choose the "dapper.msg.binaryAnnotations[].value" from the "SettingSelect"
    And I click the "Generate" button
    And I will see the "splSearch.SearchPage" page
    And I click the "SaveAsOther" button under some element
    And I click the "TimedTask" button
    And I set the parameter "TaskName" with value "RZY-2956:task_其它_调用链_sample"
    And I set the parameter "Describe" with value "UIAutoCreate"
    And I choose the "default_SavedSchedule" from the "GroupComboBox"
    And I set the parameter "CrontabInput" with value "0 0/600 * * * ?"
    And I click the "EnsureCrontab" button
    Then I will see the success message "保存成功"

  Scenario Outline: 生成定时任务失败
    Given I set the parameter "SearchInput" with value "<splQuery>"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait element "SearchStatus" change text to "搜索完成!"
    Then I click the "SaveAsOther" button
    Then I click the "TimedTask" button
    Then I set the parameter "TaskName" with value "<name>"
    Then I set the parameter "Describe" with value "<describe>"
    Then I choose the "<users>" from the "UserComboBox"
    Then I choose the "<groups>" from the "GroupComboBox"
    Then I set the parameter "Period" with value "<period>"
    Then I click the "EnsureCreateTask" button
    Then I will see the success message "<message>"

    Examples: 保存失败
      | splQuery                                                                                                                          | name    | describe | users | groups                | period | message           |
      | index=schedule schedule_name:bar_resp_len \| bucket timestamp span=1h as ts \| stats max(max_resp_len) as max_resp_len_hour by ts |         |          |       |                       |        | 请填写名称！            |
      | index=schedule schedule_name:bar_resp_len \| bucket timestamp span=1h as ts \| stats max(max_resp_len) as max_resp_len_hour by ts | sxjtest | autotest |       |                       |        | 请选择分组             |
      | index=schedule schedule_name:bar_resp_len \| bucket timestamp span=1h as ts \| stats max(max_resp_len) as max_resp_len_hour by ts | sxjtest | autotest | owner | default_SavedSchedule |        | 定时模式下, 时间间隔不能为零或空 |
      | index=schedule schedule_name:bar_resp_len \| bucket timestamp span=1h as ts \| stats max(max_resp_len) as max_resp_len_hour by ts | sxjtest | autotest | owner | default_SavedSchedule | 0      | 定时模式下, 时间间隔不能为零或空 |
      | index=schedule schedule_name:bar_resp_len \| bucket timestamp span=1h as ts \| stats max(max_resp_len) as max_resp_len_hour by ts | sxjtest | autotest | owner | default_SavedSchedule | 1.5    | 定时模式下, 时间间隔应该为正整数 |
      | index=schedule schedule_name:bar_resp_len \| bucket timestamp span=1h as ts \| stats max(max_resp_len) as max_resp_len_hour by ts | sxjtest | autotest | owner | default_SavedSchedule | 测试     | 定时模式下, 时间间隔应该为正整数 |
      | index=schedule schedule_name:bar_resp_len \| bucket timestamp span=1h as ts \| stats max(max_resp_len) as max_resp_len_hour by ts | stest   | autotest | owner | default_SavedSchedule | 1      | 请输入开始时间           |

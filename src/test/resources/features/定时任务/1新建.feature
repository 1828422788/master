@spl @all @timedTask
Feature: 定时任务新增

  Background:
    Given open the "splSearch.SearchPage" page for uri "/search/"

  Scenario Outline: 生成表格类型的定时任务
    Given I set the parameter "SearchInput" with value "<splQuery>"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait element "SearchStatus" change text to "搜索完成!"
    And I click the "SaveAsOther" button
    And I click the "TimedTask" button
    And I set the parameter "TaskName" with value "<name>"
    And I set the parameter "Describe" with value "<describe>"
    And I choose the "<users>" from the "UserComboBox"
    And I choose the "<groups>" from the "GroupComboBox"
    And I set the parameter "Period" with value "<period>"
    And I click the "StartTime" button
    And I set the time input "StartTomrrow" to "2" minutes later
    And I click the "EnsureButton" button
    And I display the element "TimePanel"
    And I click the "Ensure" button
    Then I will see the success message "<message>"

  @smoke @timedTaskSmoke
    Examples: 保存成功
      | splQuery                                      | name        | describe | users | groups                | period | message |
      | tag:"sample04061424" \| top 1 apache.resp_len | sxjAutoTest | autotest | owner | default_SavedSchedule | 360    | 保存成功    |

  Scenario Outline: 生成表格类型的定时任务
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
      | index=schedule schedule_name:bar_resp_len \| bucket timestamp span=1h as ts \| stats max(max_resp_len) as max_resp_len_hour by ts | sxjtest | autotest | owner | default_SavedSchedule | 1.5    | 定时模式下, 时间间隔应该为正整数 |
      | index=schedule schedule_name:bar_resp_len \| bucket timestamp span=1h as ts \| stats max(max_resp_len) as max_resp_len_hour by ts | stest   | autotest | owner | default_SavedSchedule | 1      | 请输入开始时间           |

  @smoke @timedTaskSmoke
  Scenario Outline: 生成曲线图类型的定时任务
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
    And I choose the "<users>" from the "UserComboBox"
    And I choose the "<groups>" from the "GroupComboBox"
    And I set the parameter "Period" with value "<period>"
    And I click the "StartTime" button
    And I set the time input "StartTomrrow" to "2" minutes later
    And I click the "EnsureButton" button
    And I display the element "TimePanel"
    And I click the "Ensure" button
    Then I will see the success message "保存成功"

    Examples:
      | splQuery                                                                                                                       | groupType  | type       | name               | describe | users | groups                | period |
      | (tag:heka) \|bucket timestamp timeranges=((2018-07-26:10:39:50, 2018-07-27:10:40:02)) as tr \| stats dc('appname') as ct by tr | Order      | Line       | lineAutoTest       |          | owner | default_SavedSchedule | 10     |

  @smoke @timedTaskSmoke
  Scenario Outline: 生成图表类型的定时任务
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
    And I choose the "<users>" from the "UserComboBox"
    And I choose the "<groups>" from the "GroupComboBox"
    And I set the parameter "Period" with value "<period>"
    And I click the "StartTime" button
    And I set the time input "StartTomrrow" to "2" minutes later
    And I click the "EnsureButton" button
    And I display the element "TimePanel"
    And I click the "Ensure" button
    Then I will see the success message "保存成功"

    Examples:
      | splQuery                                                                                                                       | groupType  | type       | name               | describe | users | groups                | period |
      | (tag:heka) \|bucket timestamp timeranges=((2018-07-26:10:39:50, 2018-07-27:10:40:02)) as tr \| stats dc('appname') as ct by tr | Order      | Line       | lineAutoTest       |          | owner | default_SavedSchedule | 10     |
      | tag:"sample04061424" \| eval status = apache.status \| stats count() as cnt by status \| eval newField = cnt + status          | Other      | Wordcloud  | wordcloudAutoTest  |          | owner | default_SavedSchedule | 15     |
      | tag:"sample04061424" \| eval status = apache.status \| stats count() as cnt by status \| eval newField = cnt + status          | Other      | Single     | singleAutoTest     |          | owner | default_SavedSchedule | 15     |
      | tag:"sample04061424" \| eval status = apache.status \| stats count() as cnt by status \| eval newField = cnt + status          | Other      | Liquidfill | liquidfillAutoTest |          | owner | default_SavedSchedule | 15     |
      | * \| stats avg(raw_message_length) as avg_length, count(apache.clientip) as ip_count by appname \| sort by ip_count            | Order      | Area       | areaAutoTest       |          | owner | default_SavedSchedule | 15     |
      | * \| stats avg(raw_message_length) as avg_length, count(apache.clientip) as ip_count by appname \| sort by ip_count            | Order      | Column     | columnAutoTest     |          | owner | default_SavedSchedule | 15     |
      | * \| stats avg(raw_message_length) as avg_length, count(apache.clientip) as ip_count by appname \| sort by ip_count            | Order      | Scatter    | scatterAutoTest    |          | owner | default_SavedSchedule | 15     |
      | * \| stats avg(raw_message_length) as avg_length, count(apache.clientip) as ip_count by appname \| sort by ip_count            | Dimension  | Pie        | pieAutoTest        |          | owner | default_SavedSchedule | 15     |
      | * \| stats avg(raw_message_length) as avg_length, count(apache.clientip) as ip_count by appname \| sort by ip_count            | Dimension  | Rose       | roseAutoTest       |          | owner | default_SavedSchedule | 15     |
      | * \| stats avg(raw_message_length) as avg_length, count(apache.clientip) as ip_count by appname \| sort by ip_count            | Dimension  | Bar        | barAutoTest        |          | owner | default_SavedSchedule | 15     |
      | * \| stats avg(raw_message_length) as avg_length, count(apache.clientip) as ip_count by appname \| sort by ip_count            | Compound   | Multiaxis  | multiaxisAutoTest  |          | owner | default_SavedSchedule | 15     |
      | * \| stats avg(raw_message_length) as avg_length, count(apache.clientip) as ip_count by appname \| sort by ip_count            | Connection | Chord      | chordAutoTest      |          | owner | default_SavedSchedule | 15     |
      | * \| stats avg(raw_message_length) as avg_length, count(apache.clientip) as ip_count by appname \| sort by ip_count            | Connection | Sankey     | sankeyAutoTest     |          | owner | default_SavedSchedule | 15     |
      | * \| stats avg(raw_message_length) as avg_length, count(apache.clientip) as ip_count by appname \| sort by ip_count            | Connection | Force      | forceAutoTest      |          | owner | default_SavedSchedule | 15     |

  @smoke @timedTaskSmoke
  Scenario Outline: 生成循序图的定时任务
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
    And I set the time input "StartTomrrow" to "2" minutes later
    And I click the "EnsureButton" button
    And I display the element "TimePanel"
    And I click the "Ensure" button
    Then I will see the success message "保存成功"

    Examples:
      | splQuery                                      | groupType | type     | timeSequence | source          | target   | cut             | mark            | name             | describe | users | groups                | period |
      | *\| stats count() by hostname,apache.clientip | Other     | Sequence | hostname     | apache.clientip | hostname | apache.clientip | apache.clientip | sequenceAutoTest |          | owner | default_SavedSchedule | 15     |

  @smoke @timedTaskSmoke
  Scenario Outline: 生成力图的定时任务
    Given I set the parameter "SearchInput" with value "<splQuery>"
    When I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait element "SearchStatus" change text to "搜索完成!"
    And I click the "Type" button
    And I click the "<groupType>" button
    And I click the "<type>" button
    And I click the "Setting" button
    Then I choose the "<source>" from the "SelectData"
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
    And I set the time input "StartTomrrow" to "2" minutes later
    And I click the "EnsureButton" button
    And I display the element "TimePanel"
    And I click the "Ensure" button
    Then I will see the success message "保存成功"

    Examples:
      | splQuery                                                                                                            | groupType  | type  | source  | target  | weight   | name             | describe | users | groups                | period |
      | * \| stats avg(raw_message_length) as avg_length, count(apache.clientip) as ip_count by appname \| sort by ip_count | Connection | Force | appname | appname | ip_count | forceSunAutoTest |          | owner | default_SavedSchedule | 15     |

  @smoke @timedTaskSmoke
  Scenario Outline: 生成区间图的定时任务
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
    And I set the time input "StartTomrrow" to "2" minutes later
    Then I click the "EnsureButton" button
    And I display the element "TimePanel"
    Then I click the "Ensure" button
    Then I will see the success message "保存成功"

    Examples:
      | splQuery                                                                                                                                                                                                                                     | groupType | type      | xaxis | acturalData | predictData | topLimit | lowerLimit | name              | describe | users | groups                | period |
      | * \| bucket timestamp span=3h as ts\| stats count(appname) as count_ by ts \| movingavg count_,5 as ma \| rollingstd count_,5 as rs\| eval lower=ma-3*rs\| eval upper=ma+3*rs \| eval outlier=if(count_>upper\|\|count_<lower, count_, null) | Compound  | rangeline | ts    | count_      | count_      | upper    | lower      | rangelineAutoTest |          | owner | default_SavedSchedule | 15     |

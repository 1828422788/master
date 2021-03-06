@fulllink @fulllinkTimeAxis
Feature: 全链路_7时间轴

  Scenario Outline: 创建定时任务
    Given open the "splSearch.SearchPage" page for uri "/search/"
    And I wait for element "SearchStatus" change text to "搜索完成!"
    When I set the parameter "SearchInput" with value "<spl>"
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
    And I set the parameter "Name" with value "FullLink_Autotest_TimeAxis"
    And I set the parameter "Period" with value "15"
    And I choose the "分钟" from the "Unit"
    And I set the parameter "Number" with value "50"
    And I will see the element "DatePicker" contains "今天"
    And I set the time parameter "StartTimeInput" as "1" minutes later from now
    And I click the Circle "BasicSettings" button
    And I click the "AddIndex" button
    And I will see the element "IndexPanel" contains "schedule"
    And I click the "Submit" button
    And I wait for "SuccessMessage" will be visible
    Then I will see the success message "保存成功"
    And I wait for "60000" millsecond

    Examples:
      | spl |
      | tag:sample04061424_chart AND NOT apache.geo.city:\"黔东南苗族侗族自治州\" \| bucket timestamp span=15m as tstamp \| stats count() as  _totalCount by tstamp, apache.geo.city, apache.method \| rename apache.geo.city as city, apache.method as method \| eval node =method+\"_\"+city, from = city, to = if(city==\"南京市\",\"北京市\",to), to = if(city==\"深圳市\",\"北京市\",to), to = if(city==\"成都市\",\"北京市\",to), to = if(city==\"北京市\",\"泰安市\",to), to = if(city==\"海口市\",\"济南市\",to), to = if(city==\"泰安市\",\"济南市\",to), to = if(city==\"济南市\",\"苏州市\",to), to = if(city==\"临沂市\",\"苏州市\",to), to = if(city==\"苏州市\",\"海口市\",to) \| eval from = method+\"_\"+from, to = method+\"_\"+to |


  Scenario: 创建全链路
    Given open the "fulllink.ListPage" page for uri "/fulllink/"
    And I wait for loading invisible
    When I click the "Create" button
    And I wait for "Name" will be visible
    And I set the parameter "Name" with value "AutoTest_TimeAxis"
    And I click the "Ensure" button
    Then I wait for "SuccessMessage" will be visible
    And I will see the element "SuccessMessage" contains "创建成功"

  Scenario Outline: 解析规则配置
    Given open the "fulllink.ListPage" page for uri "/fulllink/"
    And I wait for loading invisible
    When the data name is "<name>" then i click the "编辑" button
    And I will see the "fulllink.CreatePage" page
    And I wait for "3000" millsecond
    And I wait for "DisabledSave" will be visible
    And I click the "Switch" button
    And I wait for "Save" will be visible
    And I choose the "链路解析规则配置" from the "Settings"
    And I wait for "FieldName" will be visible
    And I set the parameter "FieldName" with value "<fieldName>"
    And I set the parameter "Timestamp" with value "<timestamp>"
    And I set the parameter "StartField" with value "<start>"
    And I set the parameter "EndField" with value "<end>"
    And I set the parameter "NameSeparator" with value "<separator>"
    And I set the parameter "LayerNumber" with value "<layernum>" using step buttons
    And I click the Circle "FieldName" button
    And I click the "Ensure" button
    And I wait for "5000" millsecond
    And I click the "Save" button
    And I wait for "SuccessMessage" will be visible
    And I will see the element "SuccessMessage" contains "保存成功"

    Examples:
      | name              | fieldName   | timestamp       | start    | end    | separator   | layernum    |
      | AutoTest_TimeAxis | node        | tstamp          | from     | to     | _           | 2           |
      | AutoTest_1        | node        | tstamp          | from     | to     | _           | 2           |

  Scenario Outline: 时间轴SPL配置
    Given open the "fulllink.ListPage" page for uri "/fulllink/"
    And I wait for loading invisible
    When the data name is "<name>" then i click the "编辑" button
    And I will see the "fulllink.CreatePage" page
    And I wait for "3000" millsecond
    And I wait for "DisabledSave" will be visible
    And I click the "Switch" button
    And I wait for "Save" will be visible
    And I choose the "时间轴SPL配置" from the "Settings"
    And I wait for "TimelineSPL" will be visible
    And I set the value "index=schedule schedule_name:FullLink_Autotest_TimeAxis  | bucket tstamp span=1h as ts | stats count()  as _COUNT by ts | eval level = 1" to the textarea "TimelineSPL"
    And I click the "RequestData" button
    And I wait for "SuccessMessage" will be invisible
    And I wait for "2000" millsecond
    And I click the "Save" button
    And I wait for "SuccessMessage" will be visible
    And I will see the element "SuccessMessage" contains "保存成功"

    Examples:
      | name              |
      | AutoTest_TimeAxis |
      | AutoTest_1        |

  Scenario Outline: 数据项配置
    Given open the "fulllink.ListPage" page for uri "/fulllink/"
    And I wait for loading invisible
    When the data name is "<name>" then i click the "编辑" button
    And I will see the "fulllink.CreatePage" page
    And I wait for "3000" millsecond
    And I wait for "DisabledSave" will be visible
    And I click the "Switch" button
    And I wait for "Save" will be visible
    And I click the "DataConfig" button
    When I will see the "splSearch.SearchPage" page
    When I set the parameter "SearchInput" with value "index=schedule schedule_name:FullLink_Autotest_TimeAxis | table start_timestamp, tstamp, method, city, node, from, to, _totalCount | rename _totalCount as \"_COUNT\""
    And I click the "DateEditor" button
    And I click the "Today" button
    And I wait for "1000" millsecond
    And I click the "SearchButton" button
    And I will see the "fulllink.CreatePage" page
    And I wait for "Table" will be visible
    And I wait for "SuccessMessage" will be invisible
    And I click the "Preview" button
    And I wait for "5000" millsecond
    And I wait for "NumLabel_1" will be visible
    And I click the "Save" button
    And I wait for "SuccessMessage" will be visible
    And I will see the element "SuccessMessage" contains "保存成功"

    Examples:
      | name              |
      | AutoTest_TimeAxis |
      | AutoTest_1        |


  Scenario Outline: 指标项配置
    Given open the "fulllink.ListPage" page for uri "/fulllink/"
    And I wait for loading invisible
    When the data name is "<name>" then i click the "编辑" button
    And I will see the "fulllink.CreatePage" page
    And I wait for "3000" millsecond
    And I wait for "DisabledSave" will be visible
    And I click the "Switch" button
    And I wait for "Save" will be visible
    And I wait for "TimeAxis" will be visible
    When I click the "TimeAxis" button
    And I wait for "Tick0000" will be visible
    And I click the Circle "Tick0000" button
    And I wait for "1000" millsecond
    And I choose the "链路指标项配置" from the "Settings"
    And I wait for "High_Min" will be visible
    And I set the parameter "High_Min" with value "5"
    And I set the parameter "High_Max" with value "15"
    And I set the parameter "Medium_Min" with value "3"
    And I set the parameter "Medium_Max" with value "4"
    And I click the Circle "High_Min" button
    And I click the "Render" button
    And I wait for "2000" millsecond
    And I click the "Save" button
    And I wait for "SuccessMessage" will be visible
    And I will see the element "SuccessMessage" contains "保存成功"

    Examples:
      | name              |
      | AutoTest_TimeAxis |
      | AutoTest_1        |

  Scenario:时间轴显示
    Given open the "fulllink.ListPage" page for uri "/fulllink/"
    And I wait for loading invisible
    When the data name is "AutoTest_TimeAxis" then i click the "编辑" button
    And I will see the "fulllink.CreatePage" page
    And I wait for "3000" millsecond
    And I wait for "DisabledSave" will be visible
    And I click the "Switch" button
    And I wait for "Save" will be visible
    And I wait for "TimeAxis" will be visible
    When I click the "TimeAxis" button
    And I click the "DateSetting" button
    And I wait for "SpeedHandle" will be visible
    Then I click the "TimeAxis" button
    And I wait for "SpeedHandle" will be invisible

  Scenario:时间轴_提示没有数据
    Given open the "fulllink.ListPage" page for uri "/fulllink/"
    And I wait for loading invisible
    When the data name is "AutoTest" then i click the "编辑" button
    And I will see the "fulllink.CreatePage" page
    And I wait for "3000" millsecond
    And I wait for "DisabledSave" will be visible
    And I wait for "TimeAxis" will be visible
    When I click the "TimeAxis" button
    And I click the "DateSetting" button
    And I wait for "DateEditor" will be visible
    Then I click the "DateEditor" button
    And I click the "LastDate" button
    And I wait for "Message" will be visible
    And I will see the message contains "当前日期没有数据！"

  Scenario: 直播
    Given open the "fulllink.ListPage" page for uri "/fulllink/"
    And I wait for loading invisible
    When the data name is "AutoTest_TimeAxis" then i click the "编辑" button
    And I will see the "fulllink.CreatePage" page
    And I wait for "3000" millsecond
    And I wait for "DisabledSave" will be visible
    And I click the "Switch" button
    And I wait for "Save" will be visible
    And I wait for "TimeAxis" will be visible
    When I click the "TimeAxis" button
    And I wait for "Tick0000" will be visible
    And I click the Circle "Tick0000" button
    And I wait for "1000" millsecond
    And I wait for "FirstTick" will be visible
    And I click the Circle "FirstTick" button
    And I wait for "1000" millsecond
    And I click the "LiveBroadcast" button
    And I wait for "SuccessMessage" will be visible
    And I will see the element "SuccessMessage" contains "直播中"
    And I click the "LiveBroadcast" button
    And I wait for "2000" millsecond
    And I will see the "SuccessMessage" doesn't exist
    And I click the "LiveBroadcast" button
    And I wait for "SuccessMessage" will be visible
    And I will see the element "SuccessMessage" contains "直播中"
    And I click the "LiveBroadcast" button
    And I wait for "2000" millsecond
    And I will see the "SuccessMessage" doesn't exist

  Scenario: 录播
    Given open the "fulllink.ListPage" page for uri "/fulllink/"
    And I wait for loading invisible
    When the data name is "AutoTest_TimeAxis" then i click the "编辑" button
    And I will see the "fulllink.CreatePage" page
    And I wait for "3000" millsecond
    And I wait for "DisabledSave" will be visible
    And I click the "Switch" button
    And I wait for "Save" will be visible
    And I wait for "TimeAxis" will be visible
    When I click the "TimeAxis" button
    And I wait for "Tick0000" will be visible
    And I click the Circle "Tick0000" button
    And I wait for "1000" millsecond
    And I wait for "FirstTick" will be visible
    And I click the Circle "FirstTick" button
    And I wait for "1000" millsecond
    And I click the Circle "Play" button
    And I wait for element "NumLabel_2" change text to "7"
    And take a screenshot with name "actual/fulllink/直播/FirstTick"
    And I wait for element "NumLabel_2" change text to "5"
    And take a screenshot with name "actual/fulllink/直播/SecondTick"
    And I wait for element "NumLabel_2" change text to "6"
    And take a screenshot with name "actual/fulllink/直播/ThirdTick"
    And I wait for element "NumLabel_2" change text to "9"
    And take a screenshot with name "actual/fulllink/直播/ForthTick"
    

  Scenario Outline: 时间轴
    Given open the "fulllink.ListPage" page for uri "/fulllink/"
    And I wait for loading invisible
    When the data name is "AutoTest_TimeAxis" then i click the "编辑" button
    And I will see the "fulllink.CreatePage" page
    And I wait for "3000" millsecond
    And I wait for "DisabledSave" will be visible
    And I click the "Switch" button
    And I wait for "Save" will be visible
    And I wait for "TimeAxis" will be visible
    When I click the "TimeAxis" button
    And I wait for "Tick0000" will be visible
    And I click the Circle "Tick0000" button
    And I wait for "1000" millsecond
    And I wait for "<tick>" will be visible
    And I click the Circle "<tick>" button
    And I wait for "4000" millsecond
    And take a screenshot with name "actual/fulllink/<tick>"
    And I will see the element "NumLabel_1" contains "<num1>"
    And I will see the element "NumLabel_2" contains "<num2>"

    Examples:
    | tick        | num1 | num2 |
    | FirstTick   | 2    | 7    |
    | SecondTick  | 2    | 5    |
    | ThirdTick   | 2    | 6    |
    | ForthTick   | 2    | 9    |
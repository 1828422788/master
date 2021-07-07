@fulllink @fulllinkTimeAxis
Feature: 全链路_7时间轴

  Scenario Outline: 创建定时任务
    Given open the "splSearch.SearchPage" page for uri "/search/"
    And I wait for element "SearchStatus" change text to "搜索完成!"
    When I set the parameter "SearchInput" with value "<spl>"
    And I click the "DateEditor" button under some element
    And I click the "Today" button
    And I click the "SearchButton" button under some element
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
    And I set the time parameter "StartTimeInput" as "2" minutes later from now
    And I click the Circle "BasicSettings" button
    And I click the "Submit" button
    And I wait for "SuccessMessage" will be visible
    Then I will see the success message "保存成功"

    Examples:
      | spl |
      | tag:sample04061424_chart AND NOT apache.geo.city:\"黔东南苗族侗族自治州\" \| bucket timestamp span=15m as ts \| stats count() as  _totalCount by ts, apache.geo.city, apache.method \| rename apache.geo.city as city, apache.method as method \| eval node =method+\"_\"+city, from = city, to = if(city==\"南京市\",\"北京市\",to), to = if(city==\"深圳市\",\"北京市\",to), to = if(city==\"成都市\",\"北京市\",to), to = if(city==\"北京市\",\"泰安市\",to), to = if(city==\"海口市\",\"济南市\",to), to = if(city==\"泰安市\",\"济南市\",to), to = if(city==\"济南市\",\"苏州市\",to), to = if(city==\"临沂市\",\"苏州市\",to), to = if(city==\"苏州市\",\"海口市\",to) \| eval from = method+\"_\"+from, to = method+\"_\"+to |


  Scenario: 创建全链路
    Given open the "fulllink.ListPage" page for uri "/fulllink/"
    And I wait for "3000" millsecond
    When I click the "Create" button
    And I wait for "Name" will be visible
    And I set the parameter "Name" with value "AutoTest_TimeAxis"
    And I click the "Ensure" button
    Then I wait for "SuccessMessage" will be visible
    And I will see the element "SuccessMessage" contains "创建成功"

  Scenario Outline: 解析规则配置
    Given open the "fulllink.ListPage" page for uri "/fulllink/"
    And I wait for "3000" millsecond
    When the data name is "AutoTest_TimeAxis" then i click the "编辑" button
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
      | fieldName   | timestamp       | start    | end    | separator   | layernum    |
      | node        | ts              | from     | to     | _           | 2           |

  Scenario: 时间轴SPL配置
    Given open the "fulllink.ListPage" page for uri "/fulllink/"
    And I wait for "3000" millsecond
    When the data name is "AutoTest_TimeAxis" then i click the "编辑" button
    And I will see the "fulllink.CreatePage" page
    And I wait for "3000" millsecond
    And I wait for "DisabledSave" will be visible
    And I click the "Switch" button
    And I wait for "Save" will be visible
    And I choose the "时间轴SPL配置" from the "Settings"
    And I wait for "TimelineSPL" will be visible
    And I set the value "index=schedule schedule_name:FullLink_Autotest_TimeAxis | bucket ts span=30m as ts_1" to the textarea "TimelineSPL"
    And I click the "RequestData" button
    And I wait for "SuccessMessage" will be invisible
    And I wait for "2000" millsecond
    And I click the "Save" button
    And I wait for "SuccessMessage" will be visible
    And I will see the element "SuccessMessage" contains "保存成功"

  Scenario: 数据项配置
    Given open the "fulllink.ListPage" page for uri "/fulllink/"
    And I wait for "3000" millsecond
    When the data name is "AutoTest_TimeAxis" then i click the "编辑" button
    And I will see the "fulllink.CreatePage" page
    And I wait for "3000" millsecond
    And I wait for "DisabledSave" will be visible
    And I click the "Switch" button
    And I wait for "Save" will be visible
    And I click the "DataConfig" button
    When I will see the "splSearch.SearchPage" page
    When I set the parameter "SearchInput" with value "index=schedule schedule_name:FullLink_Autotest_TimeAxis | table start_timestamp, ts, method, city, node, from, to, _totalCount | rename _totalCount as \"_数量\""
    And I click the "DateEditor" button under some element
    And I click the "Today" button
    And I wait for "1000" millsecond
    And I click the "SearchButton" button under some element
    And I will see the "fulllink.CreatePage" page
    And I wait for "Table" will be visible
    And I wait for "SuccessMessage" will be invisible
    And I click the "Preview" button
    And I wait for "5000" millsecond
    And I wait for "Preview" will be invisible
    And I click the "Save" button
    And I wait for "SuccessMessage" will be visible
    And I will see the element "SuccessMessage" contains "保存成功"


  Scenario: 指标项配置
    Given open the "fulllink.ListPage" page for uri "/fulllink/"
    And I wait for "3000" millsecond
    When the data name is "AutoTest_TimeAxis" then i click the "编辑" button
    And I will see the "fulllink.CreatePage" page
    And I wait for "3000" millsecond
    And I wait for "DisabledSave" will be visible
    And I click the "Switch" button
    And I wait for "Save" will be visible
    And I choose the "链路指标项配置" from the "Settings"
    And I wait for "High_Min" will be visible
    And I set the parameter "High_Min" with value "5"
    And I set the parameter "High_Max" with value "10"
    And I set the parameter "Medium_Min" with value "0"
    And I set the parameter "Medium_Max" with value "1"
    And I click the Circle "High_Min" button
    And I click the "Render" button
    And I wait for "2000" millsecond
    And I click the "Save" button
    And I wait for "SuccessMessage" will be visible
    And I will see the element "SuccessMessage" contains "保存成功"

  Scenario:时间轴显示
    Given open the "fulllink.ListPage" page for uri "/fulllink/"
    And I wait for "3000" millsecond
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

  Scenario: 直播
    Given open the "fulllink.ListPage" page for uri "/fulllink/"
    And I wait for "3000" millsecond
    When the data name is "AutoTest_TimeAxis" then i click the "编辑" button
    And I will see the "fulllink.CreatePage" page
    And I wait for "3000" millsecond
    And I wait for "DisabledSave" will be visible
    And I click the "Switch" button
    And I wait for "Save" will be visible
    And I wait for "TimeAxis" will be visible
    When I click the "TimeAxis" button
    And I click the Circle "Tick0000" button
    And I wait for "1000" millsecond
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

  Scenario Outline: 时间轴
    Given open the "fulllink.ListPage" page for uri "/fulllink/"
    And I wait for "3000" millsecond
    When the data name is "AutoTest_TimeAxis" then i click the "编辑" button
    And I will see the "fulllink.CreatePage" page
    And I wait for "3000" millsecond
    And I wait for "DisabledSave" will be visible
    And I click the "Switch" button
    And I wait for "Save" will be visible
    And I wait for "TimeAxis" will be visible
    When I click the "TimeAxis" button
    And I click the Circle "Tick0000" button
    And I wait for "1000" millsecond
    And I click the Circle "<tick>" button
    And I wait for "4000" millsecond
    And take a screenshot
#    And take part of "Canvas" with name "actual/fulllink/<tick>"
    And I will see the element "NumLabel_1" contains "<num1>"
    And I will see the element "NumLabel_2" contains "<num2>"

    Examples:
    | tick        | num1 | num2 |
    | FirstTick   | 2    | 7    |
    | SecondTick  | 2    | 5    |
    | ThirdTick   | 2    | 6    |
    | ForthTick   | 2    | 9    |
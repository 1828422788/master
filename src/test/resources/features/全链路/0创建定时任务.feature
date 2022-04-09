@fulllink @fulllinkCreateSchedule @fulllinkSmoke
Feature: 全链路_0定时任务

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
    And I set the parameter "Name" with value "FullLink_Autotest"
    And I set the parameter "Period" with value "1"
    And I choose the "天" from the "Unit"
    And I set the parameter "Number" with value "200"
    And I will see the element "DatePicker" contains "今天"
    And I set the time parameter "StartTimeInput" as "1" minutes later from now
    And I click the Circle "BasicSettings" button
    And I click the "Submit" button
    And I wait for "SuccessMessage" will be visible
    Then I will see the success message "保存成功"

    Examples:
    | spl |
    | tag:sample04061424_chart AND NOT apache.geo.city:\"黔东南苗族侗族自治州\" \| stats count() as  _totalCount by apache.geo.city, apache.method \| rename apache.geo.city as city, apache.method as method \| eval node =method+\"_\"+city, from = city, to = if(city==\"南京市\",\"北京市\",to), to = if(city==\"深圳市\",\"北京市\",to), to = if(city==\"成都市\",\"北京市\",to), to = if(city==\"北京市\",\"泰安市\",to), to = if(city==\"海口市\",\"济南市\",to), to = if(city==\"泰安市\",\"济南市\",to), to = if(city==\"济南市\",\"苏州市\",to), to = if(city==\"临沂市\",\"苏州市\",to), to = if(city==\"苏州市\",\"海口市\",to) \| eval from = method+\"_\"+from, to = method+\"_\"+to |
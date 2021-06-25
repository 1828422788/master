@fulllinkSchedule
Feature: 全链路_定时任务

  Scenario: 创建定时任务
    Given open the "splSearch.SearchPage" page for uri "/search/"
    And I wait for element "SearchStatus" change text to "搜索完成!"
    When I set the parameter "SearchInput" with value "tag:fulllink_test_1 | eval traceid=json.traceid | eval spanid=json.spanid | eval ssi=json.ssi | stats count() as _ct1 by traceid,spanid,ssi | join traceid [[ tag:fulllink_test_2 | eval traceid=json.traceid | eval productNoname=json.productNoname | eval eventNoname=json.eventNoname | stats count() as _ct2 by traceid,productNoname,eventNoname ]] | eval from = productNoname + \"_\" + eventNoname + \"_\" + ssi | stats count() as _ct3 by traceid,spanid,from | eval spid = spanid | join type=left max=15 spid [[ tag:fulllink_test_1 | eval traceid=json.traceid | eval parentspanid=json.parentspanid | eval ssi=json.ssi | stats count() as _ct4 by traceid,parentspanid,ssi | join traceid [[ tag:fulllink_test_2 | eval traceid=json.traceid | eval productNoname=json.productNoname | eval eventNoname=json.eventNoname | stats count() as _ct5 by traceid,productNoname,eventNoname ]] | eval to = productNoname + \"_\" + eventNoname + \"_\" + ssi | stats count() as _ct6 by traceid,parentspanid,to | eval spid = parentspanid ]] | eval to = if(empty(to),\"abc\",to) | stats count() by from,to | eval join_id = from | join join_id [[ tag:fulllink_test_1 | eval traceid=json.traceid | eval spanid=json.spanid | eval ssi=json.ssi | eval duration=json.duration | stats count() as _ct1 by traceid,spanid,ssi,duration | join traceid [[ tag:fulllink_test_2 | eval traceid=json.traceid | eval productNoname=json.productNoname | eval eventNoname=json.eventNoname | stats count() as _ct2 by traceid,productNoname,eventNoname ]] | stats count(traceid) as _totalCount, avg(duration) as _avgTimeCost, max(duration) as _maxTimeCost by productNoname,eventNoname,ssi | eval _avgTimeCost =format(\"%.2f\",_avgTimeCost) | eval _maxTimeCost =format(\"%.2f\",_maxTimeCost) | eval join_id = productNoname + \"_\" + eventNoname + \"_\" + ssi | join join_id [[ tag:fulllink_test_3 | eval traceid=json.traceid | eval ssi=json.ssi | eval errortype=json.errortype | stats count() as _ct1 by traceid,ssi,errortype | join traceid [[ tag:fulllink_test_2 | eval traceid=json.traceid | eval productNoname=json.productNoname | eval eventNoname=json.eventNoname | stats count() as _ct2 by traceid,productNoname,eventNoname ]] | eval errortype = case(errortype==\"0\",\"_selfErrorCount\",errortype==\"1\",\"_noSelfErrorCount\",errortype==\"2\",\"_TimeoutErrorCount\",default,\"ok\") | stats count() as _count by productNoname,eventNoname,ssi,errortype | eval tmp_count=_count | transpose row=productNoname,eventNoname,ssi column=errortype valuefield=tmp_count | eval _noSelfErrorCount=if(empty(_noSelfErrorCount),0,_noSelfErrorCount) | eval _selfErrorCount=if(empty(_selfErrorCount),0,_selfErrorCount) | eval _TimeoutErrorCount=if(empty(_TimeoutErrorCount),0,_TimeoutErrorCount) | eval join_id = productNoname + \"_\" + eventNoname + \"_\" + ssi | fields join_id,_TimeoutErrorCount,_noSelfErrorCount,_selfErrorCount ]] | eval _totalCoun1t = tolong(if(empty(_totalCount), 0, _totalCount)) | eval _succCount = _totalCoun1t - _selfErrorCount | eval _succRate=format(\"%.2f%%\",if(_totalCoun1t==0,0,tolong(_succCount)/_totalCoun1t)*100) ]] | eval from = if(to==\"abc\",null,from) | eval to = if(to==\"abc\",null,to) | fields productNoname,eventNoname,ssi,_totalCount,_avgTimeCost,_maxTimeCost,_succRate,_selfErrorCount,_noSelfErrorCount,_TimeoutErrorCount,from,to | parse field=from \"[^\\_]*\\_[^\\_]*\\_(?<from>\\S+)\" | parse field=to \"[^\\_]*\\_[^\\_]*\\_(?<to>\\S+)\""
    And I click the "DateEditor" button under some element
    And I click the "CustomTimeTab" button
    And I set the parameter "StartDateField" with value "2021-05-28"
    And I set the parameter "StartTimeField" with value "00:00:00.000"
    And I set the parameter "EndDateField" with value "2021-05-29"
    And I set the parameter "EndTimeField" with value "00:00:00.000"
    And I click the "StartTimeField" button
    And I click the "ApplyCustomTime" button
    And I wait for "1000" millsecond
    And I click the "SearchButton" button under some element
    And I wait for "10000" millsecond
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I click the "SaveAsOther" button
    And I click the "TimedTask" button
    And switch to window "编辑报表"
    And I close all tabs except main tab
    Then I will see the "timedTask.EditPage" page
    And I wait for element "SelectedUser" change text to username
    And I set the parameter "Name" with value "fulllink"
    And I set the parameter "Period" with value "10"
    And I choose the "天" from the "Unit"
    And I set the parameter "Number" with value "200"
    And I will see the element "DatePicker" contains "05-28 00:00:00 - 05-29 00:00:00"
    And I set the time parameter "StartTimeInput" as "2" minutes later from now
    And I click the Circle "BasicSettings" button
    And I click the "Submit" button
    And I wait for "SuccessMessage" will be visible
    Then I will see the success message "保存成功"
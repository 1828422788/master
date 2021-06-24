@fulllinkCreateFull
Feature: 全链路_创建
  Background:
    Given open the "fulllink.ListPage" page for uri "/fulllink/"
    And I wait for "3000" millsecond

  Scenario: 创建全链路
    When I click the "Create" button
    And I wait for "Name" will be visible
    And I set the parameter "Name" with value "FullLink_Test"
    And I click the "Ensure" button
    Then I wait for "SuccessMessage" will be visible
    And I will see the element "SuccessMessage" contains "创建成功"

  Scenario: 解析规则配置
    When the data name is "FullLink_Test" then i click the "编辑" button
    And I will see the "fulllink.CreatePage" page
    And I wait for "3000" millsecond
    And I wait for "DisabledSave" will be visible
    And I click the "Switch" button
    And I wait for "Save" will be visible
    And I choose the "链路解析规则配置" from the "Settings"
    And I wait for "FieldName" will be visible
    And I set the parameter "FieldName" with value "ssi"
    And I set the parameter "Timestamp" with value "start_timestamp"
    And I set the parameter "StartField" with value "from"
    And I set the parameter "EndField" with value "to"
    And I set the parameter "NameSeparator" with value "_"
    And I set the parameter "LayerNumber" with value "3" 
    And I click the Circle "FieldName" button
    And I click the "Ensure" button
    And I wait for "2000" millsecond
    And I click the "Save" button
    And I wait for "SuccessMessage" will be visible
    And I will see the element "SuccessMessage" contains "保存成功"

  Scenario: 时间轴SPL配置
    When the data name is "FullLink_Test" then i click the "编辑" button
    And I will see the "fulllink.CreatePage" page
    And I wait for "3000" millsecond
    And I wait for "DisabledSave" will be visible
    And I click the "Switch" button
    And I wait for "Save" will be visible
    And I choose the "时间轴SPL配置" from the "Settings"
    And I wait for "TimelineSPL" will be visible
    And I set the value "index=schedule schedule_name:fulllink | bucket start_timestamp span=1h as ts  | stats sum(_TimeoutErrorCount) as _TimeoutErrorCount,sum(_noSelfErrorCount) as _noSelfErrorCount,sum(_selfErrorCount) as _selfErrorCount by ts|eval level=case(_selfErrorCount>0,2,_selfErrorCount==0&&_TimeoutErrorCount>0,1,default,0)|rename _selfErrorCount as "_自身错误",_noSelfErrorCount as "_非自身错误",_TimeoutErrorCount as "_超时错误"" to the textarea "TimelineSPL"
    And I click the "RequestData" button
    And I wait for "2000" millsecond
    And I click the "Save" button
    And I wait for "SuccessMessage" will be visible
    And I will see the element "SuccessMessage" contains "保存成功"

  Scenario: 数据项配置
    When the data name is "FullLink_Test" then i click the "编辑" button
    And I will see the "fulllink.CreatePage" page
    And I wait for "3000" millsecond
    And I wait for "DisabledSave" will be visible
    And I click the "Switch" button
    And I wait for "Save" will be visible
    And I click the "DataConfig" button
    When I will see the "splSearch.SearchPage" page
    When I set the parameter "SearchInput" with value "index=schedule schedule_name:fulllink | table start_timestamp,productNoname,eventNoname,ssi,_totalCount,_avgTimeCost,_maxTimeCost,_succRate,_selfErrorCount,_noSelfErrorCount,_TimeoutErrorCount,from,to|rename _totalCount as \"_调用量\",_succRate as \"_成功率\",_avgTimeCost as \"_平均耗时\",_maxTimeCost as \"_最大耗时\",_selfErrorCount as \"_自身错误\",_noSelfErrorCount as \"_非自身错误\",_TimeoutErrorCount as \"_超时错误\""
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
    And I wait for "15000" millsecond
    And I will see the "fulllink.CreatePage" page
    And I wait for "SuccessMessage" will be invisible
    And I click the "Preview" button
    And I wait for "SuccessMessage" will be visible
    And I will see the element "SuccessMessage" contains "创建链路图成功"
    And I wait for "5000" millsecond
    And I click the "Save" button
    And I wait for "SuccessMessage" will be visible
    And I will see the element "SuccessMessage" contains "保存成功"
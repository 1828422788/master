@alert @alertSmoke @first
Feature: 监控新建

  Background:
    Given open the "alert.ListPage" page for uri "/alerts/"
    And I click the "CreateAlert" button
    Then I will see the "alert.CreatePage" page

  Scenario: RZY-419:新建监控流程-新建
    When I set the parameter "AlertName" with value "linux日志关键字告警"
    And I set the parameter "AlertDes" with value "AutoCreate"
    And I choose the "default_Alert" from the "AlertGroups"
    And I choose the "所有日志" from the "AlertSources"
    And I set the parameter "SearchContent" with value "appname:* AND (failed OR err OR error OR errors OR warn OR warning OR failure OR wrong OR bad OR critical OR emerg OR emergency OR alert OR crit OR err OR segmentation OR fault)"
    And I set the parameter "AlertTriggerInput" with value "5"
    And I set the parameter "AlertLevelInput" with value "3"
    And I click the "AddThresholdButton" button
    And I set the parameter "MiddleLevelInput" with value "5"
    And I click the "AddThresholdButton" button
    And I set the parameter "HighLevelInput" with value "10"
    And I click the "SaveButton" button
    Then I will see the success message "保存成功"

  Scenario: RZY-2478:新建监控类型-事件数监控
    When I set the parameter "AlertName" with value "RZY-2478:新建监控类型-事件数监控"
    And I set the parameter "AlertDes" with value "AutoCreate"
    And I choose the "default_Alert" from the "AlertGroups"
    And I choose the "所有日志" from the "AlertSources"
    And I set the parameter "SearchContent" with value "* AND 'appname':apache"
    And I set the parameter "AlertTriggerInput" with value "5"
    And I set the parameter "AlertLevelInput" with value "3"
    And I click the "SaveButton" button
    Then I will see the success message "保存成功"

  Scenario: RZY-2468:新建监控类型-字段统计监控
    When I set the parameter "AlertName" with value "RZY-2468:新建监控类型-字段统计监控"
    And I set the parameter "AlertDes" with value "AutoCreate"
    And I choose the "default_Alert" from the "AlertGroups"
    And I choose the "所有日志" from the "AlertSources"
    And I set the parameter "SearchContent" with value "* AND 'appname':apache"
    And I choose the "字段统计监控" from the "AlertTypes"
    And I set the parameter "AlertPlanTimeInput" with value "2"
    And I set the parameter "AlertTriggerFieldsInput" with value "apache.resp_len"
    And I set the parameter "AlertTriggerInput" with value "50"
    And I choose the "小时内" from the "AlertTriggerHourOrMinute"
    And I set the parameter "AlertLevelInput" with value "1000"
    And I click the "AddThresholdButton" button
    And I set the parameter "MiddleLevelInput" with value "2700"
    And I click the "AddThresholdButton" button
    And I set the parameter "HighLevelInput" with value "3000"
    And I click the "SaveButton" button
    Then I will see the success message "保存成功"

  Scenario: RZY-2469:新建监控类型-连续统计监控
    When I set the parameter "AlertName" with value "RZY-2469:新建监控类型-连续统计监控"
    And I set the parameter "AlertDes" with value "AutoCreate"
    And I choose the "default_Alert" from the "AlertGroups"
    And I choose the "所有日志" from the "AlertSources"
    And I set the parameter "SearchContent" with value "appname:apache"
    And I choose the "连续统计监控" from the "AlertTypes"
    And I set the parameter "AlertPlanTimeInput" with value "2"
    And I set the parameter "AlertTriggerFieldsInput" with value "apache.status"
    And I set the parameter "AlertTriggerInput" with value "200"
    And I choose the "小时内" from the "AlertTriggerHourOrMinute"
    And I choose the "=" from the "ConditionTypes"
    And I set the parameter "AlertTriggerRightInput" with value "200"
    And I set the parameter "AlertLevelInput" with value "2"
    And I click the "SaveButton" button
    Then I will see the success message "保存成功"

  Scenario: RZY-2470:新建监控类型-SPL统计监控
    When I set the parameter "AlertName" with value "RZY-2470:新建监控类型-SPL统计监控"
    And I set the parameter "AlertDes" with value "AutoCreate"
    And I choose the "default_Alert" from the "AlertGroups"
    And I choose the "所有日志" from the "AlertSources"
    And I set the parameter "SearchContent" with value "appname:apache"
    And I choose the "Spl统计监控" from the "AlertTypes"
    And I set the parameter "AlertPlanTimeInput" with value "2"
    And I set the parameter "AlertTriggerInput" with value "5"
    And I set the parameter "AlertTriggerRightInput" with value "cnt"
    And I set the parameter "AlertLevelInput" with value "100"
    And I click the "AddThresholdButton" button
    And I set the parameter "MiddleLevelInput" with value "200"
    And I click the "AddThresholdButton" button
    And I set the parameter "HighLevelInput" with value "250"
    And I click the "SaveButton" button
    Then I will see the success message "保存成功"

  Scenario: RZY-2471:新建监控类型-基线对比监控
    When I set the parameter "AlertName" with value "RZY-2471:新建监控类型-基线对比监控"
    And I set the parameter "AlertDes" with value "AutoCreate"
    And I choose the "default_Alert" from the "AlertGroups"
    And I choose the "所有日志" from the "AlertSources"
    And I set the parameter "SearchContent" with value "* AND 'appname':apache"
    And I choose the "基线对比监控" from the "AlertTypes"
    And I set the parameter "AlertTriggerFieldsInput" with value "apache.resp.len"
    And I set the parameter "AlertTriggerInput" with value "1"
    And I choose the "小时内" from the "AlertTriggerHourOrMinute"
    And I choose the "在区间外" from the "Conditions"
    And I set the parameter "AlertLevelInput" with value "50"
    And I set the parameter "BaseLineRightInput" with value "150"
    And I choose the "中" from the "AlertLevelUnit"
    And I choose the "过去七天" from the "BaseLineTimeSelectors"
    And I click the "SaveButton" button
    Then I will see the success message "保存成功"

  Scenario: RZY-2465:事件数监控-监控记录是否正确展示
    When I set the parameter "AlertName" with value "RZY-2465:事件数监控-监控记录是否正确展示"
    And I set the parameter "AlertDes" with value "AutoCreate"
    And I choose the "default_Alert" from the "AlertGroups"
    And I choose the "所有日志" from the "AlertSources"
    And I set the parameter "SearchContent" with value "appname:* AND (failed OR err OR error OR errors OR warn OR warning OR failure OR wrong OR bad OR critical OR emerg OR emergency OR alert OR crit OR err OR segmentation OR fault)"
    And I set the parameter "AlertPlanTimeInput" with value "2"
    And I set the parameter "AlertTriggerInput" with value "5"
    And I set the parameter "AlertLevelInput" with value "3"
    And I click the "AddThresholdButton" button
    And I set the parameter "MiddleLevelInput" with value "5"
    And I click the "AddThresholdButton" button
    And I set the parameter "HighLevelInput" with value "10"
    And I click the "SaveButton" button
    Then I will see the success message "保存成功"
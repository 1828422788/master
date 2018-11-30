@alert @all @smoke @alertSmoke
Feature: 监控新建Spl统计

  Background:
    Given open the "splSearch.SearchPage" page for uri "/search/"

  Scenario Outline: 创建一个新的告警-Spl统计监控-定时执行（在搜索中进入监控页）
    When I set the parameter "SearchInput" with value "<SearchContent>"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I click the "SaveAsReport" button
    And I click the "Alert" button
    And switch to another window
    And I will see the "alert.CreatePage" page
    When I set the parameter "AlertName" with value "<AlertName>"
    And I set the parameter "AlertDes" with value "alertDes"
    And I choose the "<AlertGroup>" from the "AlertGroups"
    And I choose the "<AlertUser>" from the "AlertUsers"
    And I choose the "<AlertSource>" from the "AlertSources"
    And I switch the "AlertEnable" button to "disable"
    And I choose the "Spl统计监控" from the "AlertTypes"
    And I click the "AlertPlanTimeButton" button
    And I set the parameter "AlertPlanTimeInput" with value "<AlertPlanTime>"
    And I choose the "<TimeUnits>" from the "AlertPlanTimeUnits"
    And I set the parameter "AlertTriggerInput" with value "<AlertTrigger>"
    And I choose the "<AlertTriggerTimeUnits>" from the "AlertTriggerHourOrMinute"
    And I set the parameter "AlertTriggerRightInput" with value "<FieldInput>"
    And I choose the ">" from the "Conditions"
    And I set the parameter "AlertLevelInput" with value "<AlertLevelInput>"
    And I choose the "<AlertLevel>" from the "AlertLevelUnit"
    And I click the "AddThresholdButton" button
    And I set the parameter "MiddleLevelInput" with value "<MiddleLevelInput>"
    And I click the "AddThresholdButton" button
    And I set the parameter "HighLevelInput" with value "<HighLevelInput>"
    And I click the "SaveButton" button
    Then I will see the <Result>

    Examples: 创建字段统计监控成功
      | AlertName | AlertGroup    | AlertUser | AlertSource | SearchContent                                | AlertPlanTime | TimeUnits | AlertTrigger | AlertTriggerTimeUnits | FieldInput | AlertLevelInput | AlertLevel | MiddleLevelInput | HighLevelInput | Result                 |
      | AutoTest  | default_Alert | owner     | 所有日志        | * \| stats count() as cnt by apache.clientip | 2             | 分钟        | 5            | 分钟内                   | cnt        | 100             | 低          | 200              | 250            | success message "保存成功" |
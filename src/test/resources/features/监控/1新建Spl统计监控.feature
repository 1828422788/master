@alert @all @smoke @alertSmoke @second
Feature: 监控新建Spl统计（RZY-436）

  Background:
    Given open the "splSearch.SearchPage" page for uri "/search/"

  Scenario Outline: 创建一个新的告警-Spl统计监控-定时执行（在搜索中进入监控页）
    When I set the parameter "SearchInput" with value "<SearchContent>"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I click the "Alert" button
    And switch to another window
    And I will see the "alert.CreatePage" page
    When I set the parameter "AlertName" with value "<AlertName>"
    And I set the parameter "AlertDes" with value "alertDes"
    And I choose the "<AlertGroup>" from the "AlertGroups"
    And I switch the "AlertEnable" button to "disable"
    And I choose the "Spl统计监控" from the "AlertTypes"
    And I set the parameter "AlertPlanTimeInput" with value "<AlertPlanTime>"
    And I set the parameter "AlertTriggerInput" with value "<AlertTrigger>"
    And I set the parameter "AlertTriggerRightInput" with value "<FieldInput>"
    And I set the parameter "AlertLevelInput" with value "<AlertLevelInput>"
    And I click the "AddThresholdButton" button
    And I set the parameter "MiddleLevelInput" with value "<MiddleLevelInput>"
    And I click the "AddThresholdButton" button
    And I set the parameter "HighLevelInput" with value "<HighLevelInput>"
    And I click the "SaveButton" button
    Then I will see the <Result>

    Examples: 创建字段统计监控成功
      | AlertName          | AlertGroup    | SearchContent                                | AlertPlanTime | AlertTrigger | FieldInput | AlertLevelInput | MiddleLevelInput | HighLevelInput | Result                 |
      | RZY-436：SPL统计监控步骤1 | default_Alert | * \| stats count() as cnt by apache.clientip | 2             | 5            | cnt        | 100             | 200              | 250            | success message "保存成功" |
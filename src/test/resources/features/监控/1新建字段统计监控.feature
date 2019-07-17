@smoke @alertSmoke @second
Feature: 监控新建字段统计（RZY-434）

  Background:
    Given open the "alert.ListPage" page for uri "/alerts/"

  Scenario Outline:
    Given I click the "CreateAlert" button
    And I will see the "alert.CreatePage" page
    When I set the parameter "AlertName" with value "<AlertName>"
    And I set the parameter "AlertDes" with value "AutoCreate"
    And I choose the "<AlertGroup>" from the "AlertGroups"
    And I choose the "<AlertSource>" from the "AlertSources"
    And I set the parameter "SearchContent" with value "<SearchContent>"
    And I switch the "AlertEnable" button to "disable"
    And I choose the "字段统计监控" from the "AlertTypes"
    And I click the "AlertPlanCrontabButton" button
    And I set the parameter "AlertPlanCrontabInput" with value "<AlertPlanCrontab>"
    And I set the parameter "AlertTriggerFieldsInput" with value "<AlertTriggerFields>"
    And I set the parameter "AlertTriggerInput" with value "<AlertTrigger>"
    And I choose the "<AlertTriggerTimeUnits>" from the "AlertTriggerHourOrMinute"
    And I set the parameter "AlertLevelInput" with value "<AlertLevelInput>"
    And I click the "AddThresholdButton" button
    And I set the parameter "MiddleLevelInput" with value "<MiddleLevelInput>"
    And I click the "AddThresholdButton" button
    And I set the parameter "HighLevelInput" with value "<HighLevelInput>"
    And I click the "SaveButton" button
    Then I will see the <Result>

    Examples:
      | AlertName         | AlertGroup    | AlertPlanCrontab | AlertSource | SearchContent | AlertTriggerFields | AlertTrigger | AlertTriggerTimeUnits | AlertLevelInput | MiddleLevelInput | HighLevelInput | Result                 |
      | RZY-434:字段统计监控步骤1 | default_Alert | 0 * * * * ?      | 所有日志        | *             | apache.resp_len    | 50           | 小时内                   | 0               | 2700             | 3000           | success message "保存成功" |

  Scenario Outline:
    Given I click the "CreateAlert" button
    And I will see the "alert.CreatePage" page
    When I set the parameter "AlertName" with value "<name>"
    And I set the parameter "AlertDes" with value "AutoCreate"
    And I choose the "default_Alert" from the "AlertGroups"
    And I choose the "所有日志" from the "AlertSources"
    And I set the parameter "SearchContent" with value "*"
    And I switch the "AlertEnable" button to "disable"
    And I choose the "字段统计监控" from the "AlertTypes"
    And I click the "AlertPlanCrontabButton" button
    And I set the parameter "AlertPlanCrontabInput" with value "0 * * * * ?"
    And I set the parameter "AlertTriggerFieldsInput" with value "<AlertTriggerFields>"
    And I set the parameter "AlertTriggerInput" with value "<AlertTrigger>"
    And I choose the "小时内" from the "AlertTriggerHourOrMinute"
    And I set the parameter "AlertLevelInput" with value "<AlertLevelInput>"
    And I click the "AddThresholdButton" button
    And I set the parameter "MiddleLevelInput" with value "<MiddleLevelInput>"
    And I click the "AddThresholdButton" button
    And I set the parameter "HighLevelInput" with value "<HighLevelInput>"
    And I click the "SaveButton" button
    Then I will see the success message "保存成功"

    Examples:
      | name              | AlertTriggerFields | AlertTrigger | AlertLevelInput | MiddleLevelInput | HighLevelInput |
      | RZY-434:字段统计监控步骤2 | apache.resp_len    | 50           | 1000            | 2700             | 3000           |
      | RZY-434:字段统计监控步骤3 | apache.resp_len    | 50           | 3000            | 4000             | 5000           |
      | RZY-434:字段统计监控步骤4 | apache.resp_len    | 50           | 1               | 20               | 30             |
      | RZY-434:字段统计监控步骤5 | apache.status      | 5            | 199             | 404              | 500            |

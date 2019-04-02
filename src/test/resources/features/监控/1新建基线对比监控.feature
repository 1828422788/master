@smoke @alertSmoke @second
Feature: 监控新建基线对比（RZY-437）

  Background:
    Given open the "alert.ListPage" page for uri "/alerts/"

  Scenario Outline: 步骤1、2
    Given I click the "CreateAlert" button
    And I will see the "alert.CreatePage" page
    When I set the parameter "AlertName" with value "<AlertName>"
    And I set the parameter "AlertDes" with value "AutoCreate"
    And I choose the "default_Alert" from the "AlertGroups"
    And I choose the "所有日志" from the "AlertSources"
    And I set the parameter "SearchContent" with value "apache.status:200"
    And I switch the "AlertEnable" button to "disable"
    And I choose the "基线对比监控" from the "AlertTypes"
    And I set the parameter "AlertTriggerFieldsInput" with value "<AlertTriggerFields>"
    And I set the parameter "AlertTriggerInput" with value "<AlertTrigger>"
    And I choose the "<AlertTriggerTimeUnits>" from the "AlertTriggerHourOrMinute"
    And I choose the "<ConditionTypes>" from the "Conditions"
    And I set the parameter "AlertLevelInput" with value "<AlertLevelInput>"
    And I choose the "<AlertLevel>" from the "AlertLevelUnit"
    And I choose the "<BaseTime>" from the "BaseLineTimeSelectors"
    And I click the "SaveButton" button
    Then I will see the <Result>

    Examples:
      | AlertName         | AlertTriggerFields | AlertTrigger | AlertTriggerTimeUnits | ConditionTypes | AlertLevelInput | AlertLevel | BaseTime | Result                 |
      | RZY-437:基线对比监控步骤1 | apache.resp.len    | 1            | 小时内                   | 大于             | 50              | 中          | 过去七天     | success message "保存成功" |
      | RZY-437:基线对比监控步骤2 | apache.resp.len    | 50           | 小时内                   | 小于             | 500             | 高          | 过去六天     | success message "保存成功" |

  Scenario Outline: 步骤3、4
    Given I click the "CreateAlert" button
    And I will see the "alert.CreatePage" page
    When I set the parameter "AlertName" with value "<AlertName>"
    And I set the parameter "AlertDes" with value "AutoCreate"
    And I choose the "default_Alert" from the "AlertGroups"
    And I choose the "所有日志" from the "AlertSources"
    And I set the parameter "SearchContent" with value "apache.status:200"
    And I switch the "AlertEnable" button to "disable"
    And I choose the "基线对比监控" from the "AlertTypes"
    And I set the parameter "AlertTriggerFieldsInput" with value "<AlertTriggerFields>"
    And I set the parameter "AlertTriggerInput" with value "<AlertTrigger>"
    And I choose the "<AlertTriggerTimeUnits>" from the "AlertTriggerHourOrMinute"
    And I choose the "<ConditionTypes>" from the "Conditions"
    And I set the parameter "AlertLevelInput" with value "<AlertLevelInput>"
    And I set the parameter "BaseLineRightInput" with value "<AlertLevelInputRight>"
    And I choose the "<AlertLevel>" from the "AlertLevelUnit"
    And I choose the "<BaseTime>" from the "BaseLineTimeSelectors"
    And I click the "SaveButton" button
    Then I will see the success message "保存成功"

    Examples: 创建字段统计监控成功
      | AlertName         | AlertTriggerFields | AlertTrigger | AlertTriggerTimeUnits | ConditionTypes | AlertLevelInput | AlertLevelInputRight | AlertLevel | BaseTime |
      | RZY-437:基线对比监控步骤3 | apache.resp.len    | 50           | 小时内                   | 在区间外           | 99              | 101                  | 中          | 过去六天     |
      | RZY-437:基线对比监控步骤4 | apache.status      | 50           | 小时内                   | 在区间内           | 1               | 120                  | 中          | 过去七天     |
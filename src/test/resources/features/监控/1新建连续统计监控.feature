@smoke @alertSmoke @second
Feature: 监控新建连续统计（RZY-435）

  Background:
    Given open the "alert.ListPage" page for uri "/alerts/"
    And I wait for "CreateAlert" will be visible

  Scenario Outline: 创建一个新的告警-连续统计监控-定时执行
    Given I click the "CreateAlert" button
    And I will see the "alert.CreatePage" page
    When I set the parameter "AlertName" with value "<AlertName>"
    And I set the parameter "AlertDes" with value "AutoCreate"
    And I choose the "default_Alert" from the "AlertGroups"
    And I choose the "所有日志" from the "AlertSources"
    And I set the parameter "SearchContent" with value "appname:apache"
#    And I switch the "AlertEnable" button to "disable"
    And I choose the "连续统计监控" from the "AlertTypes"
    And I click the "AlertPlanCrontabButton" button
    And I set the parameter "AlertPlanCrontabInput" with value "0 * * * * ?"
    And I set the parameter "AlertTriggerFieldsInput" with value "apache.status"
    And I set the parameter "AlertTriggerInput" with value "200"
    And I choose the "小时内" from the "AlertTriggerHourOrMinute"
    And I choose the "<ConditionTypes>" from the "ConditionTypes"
    And I set the parameter "AlertTriggerRightInput" with value "<BaseValue>"
    And I set the parameter "AlertLevelInput" with value "2"
    And I choose the "<level>" from the "AlertLevelUnit"
    And I click the "SaveButton" button
    Then I will see the success message "保存成功"

    Examples: 创建字段统计监控成功
      | AlertName         | ConditionTypes | BaseValue | level |
      | RZY-435:连续统计监控步骤1 | =              | 200       | 中     |
      | RZY-435:连续统计监控步骤2 | >              | 200       | 中     |
      | RZY-435:连续统计监控步骤3 | <              | 404       |      |
      | RZY-435:连续统计监控步骤5 | <=             | 404       | 高     |

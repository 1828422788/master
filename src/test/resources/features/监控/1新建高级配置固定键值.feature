@alert @all
Feature: 监控新建事件数并填写高级设置

  Background:
    Given open the "alert.ListPage" page for uri "/alerts/"

  Scenario Outline: 高级配置中已存搜索+固定键值（RZY-440、RZY-1866）
    Given I click the "CreateAlert" button
    And I will see the "alert.CreatePage" page
    When I set the parameter "AlertName" with value "<AlertName>"
    And I set the parameter "AlertDes" with value "<AlertDes>"
    And I choose the "<AlertGroup>" from the "AlertGroups"
    And I choose the "<AlertSource>" from the "AlertSources"
    And I set the parameter "SearchContent" with value "<SearchContent>"
    And I set the parameter "AlertPlanTimeInput" with value "<AlertPlanTime>"
    And I set the parameter "AlertTriggerInput" with value "<AlertTrigger>"
    And I set the parameter "AlertLevelInput" with value "<AlertLevelInput>"
    And I click the "AdvancedConfigTab" button
    And I choose the "alertSavedSearch" from the "SavedSearchList"
    And I click the "AddKeyValueButton" button
    And I set the parameter "Key" with value "ssue_alert"
    And I set the parameter "Value" with value "false"
    And I click the "SaveButton" button
    Then I will see the <Result>

    Examples: 创建监控成功
      | AlertName  | AlertDes | AlertGroup    | AlertSource | SearchContent | AlertPlanTime | AlertTrigger | AlertLevelInput | Result                 |
      | AutoTest35 | alertDes | default_Alert | 所有日志        | *             | 5             | 5            | 3               | success message "保存成功" |

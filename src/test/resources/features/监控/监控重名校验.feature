@alert @all
Feature: 监控重名校验

  Background:
    Given I insert into table "Alert" with "{'name':'sunxjautotest','domain_id':'1','saved_search_id':'1','owner_id':'1'}"
    And I insert into table "Alert" with "{'name':'11','domain_id':'1','saved_search_id':'1','owner_id':'1'}"
    And I insert into table "Alert" with "{'name':'test','domain_id':'1','saved_search_id':'1','owner_id':'1'}"
    And I insert into table "Alert" with "{'name':'1test','domain_id':'1','saved_search_id':'1','owner_id':'1'}"
    And I insert into table "Alert" with "{'name':'1重名','domain_id':'1','saved_search_id':'1','owner_id':'1'}"
    And I insert into table "Alert" with "{'name':'test重名','domain_id':'1','saved_search_id':'1','owner_id':'1'}"
    And I insert into table "Alert" with "{'name':'test重名12','domain_id':'1','saved_search_id':'1','owner_id':'1'}"
    Then open the "alert.ListPage" page for uri "/alerts/"

  Scenario Outline: 创建一个新的告警-事件数监控-crontab
    Given I click the "CreateAlert" button
    And I will see the "alert.CreatePage" page
    When I set the parameter "AlertName" with value "<AlertName>"
    And I set the parameter "AlertDes" with value "<AlertDes>"
    And I choose the "<AlertGroup>" from the "AlertGroups"
    And I choose the "<AlertUser>" from the "AlertUsers"
    And I choose the "<AlertSource>" from the "AlertSources"
    And I set the parameter "SearchContent" with value "<SearchContent>"
    And I switch the "AlertEnable" button to "disable"
    And I click the "AlertPlanCrontabButton" button
    And I set the parameter "AlertPlanCrontabInput" with value "<AlertPlanCrontab>"
    And I set the parameter "AlertTriggerInput" with value "<AlertTrigger>"
    And I choose the "<AlertTriggerTimeUnits>" from the "AlertTriggerHourOrMinute"
    And I set the parameter "AlertLevelInput" with value "<AlertLevelInput>"
    And I click the "SaveButton" button
    Then I will see the success message "<message>"

    Examples:
      | AlertName     | AlertDes | AlertGroup    | AlertUser | AlertSource | SearchContent | AlertPlanCrontab | AlertTrigger | AlertTriggerTimeUnits | AlertLevelInput | message |
      | sunxjautotest | alertDes | default_Alert | owner     | 所有日志        | where_es      | 0 5 9 1/3 * ?    | 10           | 分钟内                   | 100             | 保存成功    |
      | 11            | alertDes | default_Alert | owner     | 所有日志        | where_es      | 0 5 9 1/3 * ?    | 10           | 分钟内                   | 100             | 保存成功    |
      | test          | alertDes | default_Alert | owner     | 所有日志        | where_es      | 0 5 9 1/3 * ?    | 10           | 分钟内                   | 100             | 保存成功    |
      | 1test         | alertDes | default_Alert | owner     | 所有日志        | where_es      | 0 5 9 1/3 * ?    | 10           | 分钟内                   | 100             | 保存成功    |
      | 1重名           | alertDes | default_Alert | owner     | 所有日志        | where_es      | 0 5 9 1/3 * ?    | 10           | 分钟内                   | 100             | 保存成功    |
      | test重名        | alertDes | default_Alert | owner     | 所有日志        | where_es      | 0 5 9 1/3 * ?    | 10           | 分钟内                   | 100             | 保存成功    |
      | test重名12      | alertDes | default_Alert | owner     | 所有日志        | where_es      | 0 5 9 1/3 * ?    | 10           | 分钟内                   | 100             | 保存成功    |

  Scenario:
    Given I delete from "Alert" where "{'name':['sunxjautotest','11','test','1test','1重名','test重名','test重名12']}"
    And I delete from "Alert" where "{'name':['AutoTest','AutoTest_sum','AutoTest_avg','AutoTest_max','AutoTest_min','AutoTest_max']}"

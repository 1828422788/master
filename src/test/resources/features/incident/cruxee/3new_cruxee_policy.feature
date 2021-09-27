@cruxee @autoui01
Feature: 事件管理-合并策略-5个

  @newcru1 @newcru
  Scenario Outline: 合并2组_高_字段统计_分组条件name_归并告警数量18条
    Given open the "incident.CruxeePolicyPage" page for uri "/app/incident/policy/list/"
    When I click the "CreateCruxeePolicy" button
    And I set the parameter "CruxeePolicyName" with value "<CruxeePolicyName>"
    And I set the parameter "CruxeePolicyDes" with value "UI自动测试"

    When I click the "AddAppCondition" button
#    And I choose the "name" from the "AppConditionFieldslist" in config
#    And I choose the "like" from the "AppConditionOperatorsList" in config
    And I choose the "name" from the "AppConditionFieldslist"
    And I wait for "2000" millsecond
    And I choose the "like" from the "AppConditionOperatorsList"
    And I set the parameter "AppConditionInput" with value "字段统计"

    When I click the "AddGroupCondition" button
    And I choose the "name" from the "GroupConditionFieldslist"

    When I click the "AddStopCondition" button
    Given I wait for loading complete
    And I choose the "归并的告警数量" from the "StopConditionNameslist"
    Given I wait for loading complete

    And I set the parameter "StopConditionCruCountInput" with value "18"

    And I choose the "<SendPolicyName>" from the "SendPolicyNameslist"
    Given I wait for loading complete

    When I click the "StartCruxeePolicy" button
    When I click the "NewCruxeePolicy" button
    And I wait for "AffirmButton" will be visible
    When I click the "AffirmButton" button

    Examples:
      | CruxeePolicyName               | SendPolicyName |
      | 合并2组_高_字段统计_分组条件name_归并告警数量18条 | 邮件_all_20分钟    |

  @newcru2 @newcru
  Scenario Outline: 合并2组_高_事件_分组条件alertid_name包含停止或连续6小时
    Given open the "incident.CruxeePolicyPage" page for uri "/app/incident/policy/list/"
    When I click the "CreateCruxeePolicy" button
    And I set the parameter "CruxeePolicyName" with value "<CruxeePolicyName>"
    And I set the parameter "CruxeePolicyDes" with value "UI自动测试"

    When I click the "AddAppCondition" button
    Given I wait for loading complete
#    And I choose the "name" from the "AppConditionFieldslist" in config
    And I choose the "name" from the "AppConditionFieldslist"
    And I wait for "2000" millsecond
    And I choose the "like" from the "AppConditionOperatorsList"
    And I set the parameter "AppConditionInput" with value "事件"

    When I click the "AddSecondAppCondition" button
    Given I wait for loading complete
    And I wait for "2000" millsecond
#    And I choose the "alert_id" from the "AppConditionSecondFieldslist" in config
    And I choose the "alert_id" from the "AppConditionSecondFieldslist"
    And I wait for "2000" millsecond
    And I choose the ">" from the "AppConditionSecondOperatorsList"
    And I set the parameter "AppConditionSecondInput" with value "0"

    When I click the "AddGroupCondition" button
    And I choose the "alert_id" from the "GroupConditionFieldslist"

    When I click the "AddStopCondition" button
    And I choose the "最后一条告警的字段" from the "StopConditionNameslist"
    And I wait for "2000" millsecond
    And I choose the "name" from the "StopConditionLastAlertFieldNamesList"
    And I wait for "2000" millsecond
    And I choose the "like" from the "StopConditionLastAlertFieldOperatorsList"
    And I wait for "2000" millsecond
    And I set the parameter "StopConditionLastAlertFieldInput" with value "事件告警停止"

    And I choose the "<SendPolicyName>" from the "SendPolicyNameslist"

    When I click the "StartCruxeePolicy" button
    When I click the "NewCruxeePolicy" button
#    Then I will see the <Result>
    Given I wait for loading complete
    When I wait for "AffirmButton" will be visible

    When I click the "AffirmButton" button

    Examples:
      | CruxeePolicyName                     | SendPolicyName |
      | 合并2组_高_事件_分组条件alertid_name包含停止或连续6小时 | 邮件_all_20分钟    |

  @newcru3 @newcru
  Scenario Outline: 合并1组_低_连续统计_无分组_未收到新告警的时间1小时
    Given open the "incident.CruxeePolicyPage" page for uri "/app/incident/policy/list/"
    When I click the "CreateCruxeePolicy" button
    And I set the parameter "CruxeePolicyName" with value "<CruxeePolicyName>"
    And I set the parameter "CruxeePolicyDes" with value "UI自动测试"

    When I click the "AddAppCondition" button
#    And I choose the "name" from the "AppConditionFieldslist" in config
#    And I choose the "like" from the "AppConditionOperatorsList" in config
    And I choose the "name" from the "AppConditionFieldslist"
    And I wait for "2000" millsecond
    And I choose the "like" from the "AppConditionOperatorsList"
    And I wait for "2000" millsecond
    And I set the parameter "AppConditionInput" with value "连续统计"

    When I click the "AddStopCondition" button
    And I set the parameter "StopConditionContinuousAlertInput" with value "6"
#    And I choose the "小时" from the "StopConditionContinuousAlertInputUnitList" in config
    And I choose the "小时" from the "StopConditionContinuousAlertInputUnitList"
    And I wait for "2000" millsecond

#    And I choose the "未收到新告警的时间" from the "StopConditionSecondNameslist" in config
    And I choose the "未收到新告警的时间" from the "StopConditionSecondNameslist"
    And I wait for "2000" millsecond
    And I set the parameter "StopConditionNoAlertTimeInput" with value "360"
#    And I choose the "分钟" from the "StopConditionNoAlertTimeInputUnitList" in config
    And I choose the "分钟" from the "StopConditionNoAlertTimeInputUnitList"
    And I wait for "2000" millsecond

    And I choose the "<SendPolicyName>" from the "SendPolicyNameslist"

    When I click the "StartCruxeePolicy" button
    When I click the "NewCruxeePolicy" button
#    Then I will see the <Result>
    And I wait for "AffirmButton" will be visible
    When I click the "AffirmButton" button

    Examples:
      | CruxeePolicyName             | SendPolicyName |
      | 合并1组_低_连续统计_无分组_未收到新告警的时间1小时 | 邮件_all_20分钟    |

  @newcru4 @newcru
  Scenario Outline: 合并2组_高中_SPL统计_分组条件priority_最后一条告警字段priority低或5小时
    Given open the "incident.CruxeePolicyPage" page for uri "/app/incident/policy/list/"
    And I click the "CreateCruxeePolicy" button
    And I set the parameter "CruxeePolicyName" with value "<CruxeePolicyName>"
    And I set the parameter "CruxeePolicyDes" with value "UI自动测试"

    When I click the "AddAppCondition" button
#    And I choose the "name" from the "AppConditionFieldslist" in config
#    And I choose the "like" from the "AppConditionOperatorsList" in config
    And I choose the "name" from the "AppConditionFieldslist" in config
    And I wait for "2000" millsecond
    And I choose the "like" from the "AppConditionOperatorsList" in config
    And I wait for "2000" millsecond
    And I set the parameter "AppConditionInput" with value "spl统计"

    When I click the "AddGroupCondition" button
#    And I choose the "priority" from the "GroupConditionFieldslist" in config
    And I choose the "priority" from the "GroupConditionFieldslist" in config

    When I click the "AddStopCondition" button
    And I set the parameter "StopConditionContinuousAlertInput" with value "18000"
#    And I choose the "秒" from the "StopConditionContinuousAlertInputUnitList" in config
#    And I choose the "最后一条告警的字段" from the "StopConditionNameslist" in config
#    And I choose the "priority" from the "StopConditionLastAlertFieldNamesList" in config
#    And I choose the ">" from the "StopConditionLastAlertFieldOperatorsList" in config
#    And I choose the "(10) 恢复" from the "StopConditionLastAlertPriorityList" in config
    And I choose the "秒" from the "StopConditionContinuousAlertInputUnitList"
    And I wait for "2000" millsecond
    And I choose the "最后一条告警的字段" from the "StopConditionNameslist"
    And I wait for "2000" millsecond
    And I choose the "priority" from the "StopConditionLastAlertFieldNamesList"
    And I wait for "2000" millsecond
    And I choose the ">" from the "StopConditionLastAlertFieldOperatorsList"
    And I wait for "2000" millsecond
    And I choose the "(10) 恢复" from the "StopConditionLastAlertPriorityList"
    And I wait for "2000" millsecond
    And I choose the "<SendPolicyName>" from the "SendPolicyNameslist"
    And I wait for "2000" millsecond

    When I click the "StartCruxeePolicy" button
    When I click the "NewCruxeePolicy" button
#    Then I will see the <Result>
    When I wait for "AffirmButton" will be visible
    When I click the "AffirmButton" button

    Examples:
      | CruxeePolicyName                                 | SendPolicyName |
      | 合并2组_高中_SPL统计_分组条件priority_最后一条告警字段priority低或5小时 | 邮件_all_20分钟    |

  @newcru5 @newcru
  Scenario Outline: 合并1组_中低_基线_分组条件eventtype_连续不断发送6小时_自动规则
    Given open the "incident.CruxeePolicyPage" page for uri "/app/incident/policy/list/"
    When I click the "CreateCruxeePolicy" button
    And I set the parameter "CruxeePolicyName" with value "<CruxeePolicyName>"
    And I set the parameter "CruxeePolicyDes" with value "UI自动测试"

    When I click the "AddAppCondition" button
    And I choose the "name" from the "AppConditionFieldslist" in config
    And I wait for "2000" millsecond
    And I choose the "like" from the "AppConditionOperatorsList" in config
    And I wait for "2000" millsecond
    And I set the parameter "AppConditionInput" with value "基线"

    When I click the "AddGroupCondition" button
    And I choose the "event_type" from the "GroupConditionFieldslist" in config
    And I wait for "2000" millsecond

    And I set the parameter "StopConditionContinuousAlertInput" with value "300"
    And I choose the "分钟" from the "StopConditionContinuousAlertInputUnitList" in config
    And I wait for "2000" millsecond

    And I choose the "<SendPolicyName>" from the "SendPolicyNameslist"

    When I click the "StartCruxeePolicy" button
    When I click the "NewCruxeePolicy" button
#    Then I will see the <Result>
    When I wait for "AffirmButton" will be visible
    When I click the "AffirmButton" button

    Examples:
      | CruxeePolicyName | SendP合并1组_中低_基线_分组条件eventtype_连续不断发送6小时_自动规则olicyName |
      |                  | 邮件_all_20分钟                                           |


  @newcru6 @newcru
  Scenario Outline: 按name合并_连续不断发送1小时
    Given open the "incident.CruxeePolicyPage" page for uri "/app/incident/policy/list/"
    When I click the "CreateCruxeePolicy" button
    And I set the parameter "CruxeePolicyName" with value "<CruxeePolicyName>"
    And I set the parameter "CruxeePolicyDes" with value "UI自动测试"

    #添加应用条件--按name相等
    When I click the "AddAppCondition" button
    And I choose the "name" from the "AppConditionFieldslist" in config
    And I wait for "2000" millsecond
    And I choose the "like" from the "AppConditionOperatorsList" in config
    And I wait for "2000" millsecond
    And I set the parameter "AppConditionInput" with value "api00_incident界面用例"

    #添加分组条件--按name相等
    When I click the "AddGroupCondition" button
    And I choose the "name" from the "GroupConditionFieldslist" in config
    And I wait for "2000" millsecond

    #添加停止条件--(告警连续不断发送超过1小时，未收到新告警时间15秒)
    When I click the "AddStopCondition" button
    And I set the parameter "StopConditionContinuousAlertInput" with value "1"
    And I choose the "小时" from the "StopConditionContinuousAlertInputUnitList"
    And I wait for "2000" millsecond

    And I choose the "未收到新告警的时间" from the "StopConditionSecondNameslist"
    And I wait for "2000" millsecond
    And I set the parameter "StopConditionNoAlertTimeInput" with value "15"
    And I choose the "秒" from the "StopConditionNoAlertTimeInputUnitList"
    And I wait for "2000" millsecond

    And I choose the "<SendPolicyName>" from the "SendPolicyNameslist"

    When I click the "StartCruxeePolicy" button
    When I click the "NewCruxeePolicy" button
    And I wait for "AffirmButton" will be visible
    When I click the "AffirmButton" button

    Examples:
      | CruxeePolicyName | SendPolicyName |
      | 事件样例name分组       | 邮件_all_20分钟    |

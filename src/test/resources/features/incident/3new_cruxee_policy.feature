Feature: 事件管理-合并策略-11个

  @incident @newcru1 @newcru
  Scenario Outline: 合并2组_高_字段统计_分组条件name_归并告警数量18条
    Given open the "incident.CruxeePolicyPage" page for uri "/app/incident/policy/list/"
    And I click the "CreateCruxeePolicy" button
    And I set the parameter "CruxeePolicyName" with value "<CruxeePolicyName>"
    And I set the parameter "CruxeePolicyDes" with value "UI自动测试"

    And I click the "AddAppCondition" button
    And I choose the "name" from the "AppConditionFieldslist" in config
    And I choose the "like" from the "AppConditionOperatorsList" in config
    And I set the parameter "AppConditionInput" with value "字段统计"

    And I click the "AddGroupCondition" button
    And I choose the "name" from the "GroupConditionFieldslist" in config

    And I click the "AddStopCondition" button
    And I choose the "归并的告警数量" from the "StopConditionNameslist" in config
    And I set the parameter "StopConditionCruCountInput" with value "18"

    And I choose1 the "<SendPolicyName>" from the "SendPolicyNameslist" in config

    And I click the "SaveCruxeePolicy" button
#    Then I will see the <Result>
    And I wait for "RetListButton" will be visible
    And I click the "RetListButton" button

    Examples:
      | CruxeePolicyName    | SendPolicyName |
      | 合并2组_高_字段统计_分组条件name_归并告警数量18条  | 邮件all_20分钟 |

  @incident @newcru2 @newcru
  Scenario Outline: 合并2组_高_事件_分组条件alertid_name包含停止或连续6小时
    Given open the "incident.CruxeePolicyPage" page for uri "/app/incident/policy/list/"
    And I click the "CreateCruxeePolicy" button
    And I set the parameter "CruxeePolicyName" with value "<CruxeePolicyName>"
    And I set the parameter "CruxeePolicyDes" with value "UI自动测试"

    And I click the "AddAppCondition" button
    And I choose the "name" from the "AppConditionFieldslist" in config
    And I choose the "like" from the "AppConditionOperatorsList" in config
    And I set the parameter "AppConditionInput" with value "事件"

    And I click the "AddSecondAppCondition" button
    And I choose the "alert_id" from the "AppConditionSecondFieldslist" in config
    And I choose the ">" from the "AppConditionSecondOperatorsList" in config
    And I set the parameter "AppConditionSecondInput" with value "0"

    And I click the "AddGroupCondition" button
    And I choose the "alert_id" from the "GroupConditionFieldslist" in config

    And I click the "AddStopCondition" button
    And I choose the "最后一条告警的字段" from the "StopConditionNameslist" in config
    And I choose the "name" from the "StopConditionLastAlertFieldNamesList" in config
    And I choose the "like" from the "StopConditionLastAlertFieldOperatorsList" in config
    And I set the parameter "StopConditionLastAlertFieldInput" with value "事件告警停止"

    And I choose1 the "<SendPolicyName>" from the "SendPolicyNameslist" in config

    And I click the "SaveCruxeePolicy" button
#    Then I will see the <Result>
    And I wait for "RetListButton" will be visible
    And I click the "RetListButton" button

    Examples:
      | CruxeePolicyName    | SendPolicyName |
      | 合并2组_高_事件_分组条件alertid_name包含停止或连续6小时  | 邮件all_20分钟 |

  @incident @newcru3 @newcru
  Scenario Outline: 合并1组_低_连续统计_无分组_未收到新告警的时间1小时
    Given open the "incident.CruxeePolicyPage" page for uri "/app/incident/policy/list/"
    And I click the "CreateCruxeePolicy" button
    And I set the parameter "CruxeePolicyName" with value "<CruxeePolicyName>"
    And I set the parameter "CruxeePolicyDes" with value "UI自动测试"

    And I click the "AddAppCondition" button
    And I choose the "name" from the "AppConditionFieldslist" in config
    And I choose the "like" from the "AppConditionOperatorsList" in config
    And I set the parameter "AppConditionInput" with value "连续统计"

    And I click the "AddStopCondition" button
    And I set the parameter "StopConditionContinuousAlertInput" with value "6"
    And I choose the "小时" from the "StopConditionContinuousAlertInputUnitList" in config
    And I choose the "未收到新告警的时间" from the "StopConditionSecondNameslist" in config
    And I set the parameter "StopConditionNoAlertTimeInput" with value "360"
    And I choose the "分钟" from the "StopConditionNoAlertTimeInputUnitList" in config

    And I choose1 the "<SendPolicyName>" from the "SendPolicyNameslist" in config

    And I click the "SaveCruxeePolicy" button
#    Then I will see the <Result>
    And I wait for "RetListButton" will be visible
    And I click the "RetListButton" button

    Examples:
      | CruxeePolicyName    | SendPolicyName |
      | 合并1组_低_连续统计_无分组_未收到新告警的时间1小时  | 邮件all_20分钟 |

  @incident @newcru4 @newcru
  Scenario Outline: 合并1组_低_连续统计_无分组_未收到新告警的时间1小时
    Given open the "incident.CruxeePolicyPage" page for uri "/app/incident/policy/list/"
    And I click the "CreateCruxeePolicy" button
    And I set the parameter "CruxeePolicyName" with value "<CruxeePolicyName>"
    And I set the parameter "CruxeePolicyDes" with value "UI自动测试"

    And I click the "AddAppCondition" button
    And I choose the "name" from the "AppConditionFieldslist" in config
    And I choose the "like" from the "AppConditionOperatorsList" in config
    And I set the parameter "AppConditionInput" with value "spl统计"

    And I click the "AddGroupCondition" button
    And I choose the "priority" from the "GroupConditionFieldslist" in config

    And I click the "AddStopCondition" button
    And I set the parameter "StopConditionContinuousAlertInput" with value "18000"
    And I choose the "秒" from the "StopConditionContinuousAlertInputUnitList" in config
    And I choose the "最后一条告警的字段" from the "StopConditionNameslist" in config
    And I choose the "priority" from the "StopConditionLastAlertFieldNamesList" in config
    And I choose the ">" from the "StopConditionLastAlertFieldOperatorsList" in config
    And I set the parameter "StopConditionLastAlertFieldInput" with value "60"

    And I choose1 the "<SendPolicyName>" from the "SendPolicyNameslist" in config

    And I click the "SaveCruxeePolicy" button
#    Then I will see the <Result>
    And I wait for "RetListButton" will be visible
    And I click the "RetListButton" button

    Examples:
      | CruxeePolicyName    | SendPolicyName |
      | 合并2组_高中_SPL统计_分组条件priority_最后一条告警字段priority低或5小时 | 邮件all_20分钟 |

  @incident @newcru5 @newcru
  Scenario Outline: 合并1组_中低_基线_分组条件eventtype_连续不断发送6小时_自动规则
    Given open the "incident.CruxeePolicyPage" page for uri "/app/incident/policy/list/"
    And I click the "CreateCruxeePolicy" button
    And I set the parameter "CruxeePolicyName" with value "<CruxeePolicyName>"
    And I set the parameter "CruxeePolicyDes" with value "UI自动测试"

    And I click the "AddAppCondition" button
    And I choose the "name" from the "AppConditionFieldslist" in config
    And I choose the "like" from the "AppConditionOperatorsList" in config
    And I set the parameter "AppConditionInput" with value "基线"

    And I click the "AddGroupCondition" button
    And I choose the "event_type" from the "GroupConditionFieldslist" in config

    And I set the parameter "StopConditionContinuousAlertInput" with value "300"
    And I choose the "分钟" from the "StopConditionContinuousAlertInputUnitList" in config

    And I choose1 the "<SendPolicyName>" from the "SendPolicyNameslist" in config

    And I click the "SaveCruxeePolicy" button
#    Then I will see the <Result>
    And I wait for "RetListButton" will be visible
    And I click the "RetListButton" button

    Examples:
      | CruxeePolicyName    | SendPolicyName |
      | 合并1组_中低_基线_分组条件eventtype_连续不断发送6小时_自动规则 | 邮件all_20分钟 |

  @incident @editcru1 @newcru
  Scenario Outline: 编辑合并策略，加自动规则
    Given open the "incident.CruxeePolicyPage" page for uri "/app/incident/policy/list/"
    When I set the parameter "CruPolicyNameListSearchInput" with value "<CruxeePolicyName>"
    And I click the "EditCruPolicyNameButton" button
    And I wait for "1000" millsecond

    And I click the "SetAutoRule" button
    And I wait for "1000" millsecond

    And I click the "AddRuleButton" button
    And I wait for "1000" millsecond

    And I choose the "归并的告警数量" from the "AutoRulesList" in config
    When I set the parameter "CruAlertCountInput" with value "60"

    And I choose the "将任务分配给" from the "AutoHandleTaskTypeList" in config
    And I choose the "Derek" from the "TaskToUsersList" in config
    And I click the "AddSecondAutoHandleRuleButton" button
    And I choose the "修改状态为" from the "SecondAutoHandleTaskTypeList" in config
    And I choose the "已解决" from the "TaskStatusList" in config

    And I click the "SaveCruxeePolicy" button
#    Then I will see the <Result>
    And I wait for "RetListButton" will be visible
    And I click the "RetListButton" button

    Examples:
      | CruxeePolicyName    |
      | 合并1组_中低_基线_分组条件eventtype_连续不断发送6小时_自动规则 |

  @delcru @incidentdel
  Scenario Outline: 合并1组_中低_基线_分组条件eventtype_连续不断发送6小时_自动规则1
    Given open the "incident.CruxeePolicyPage" page for uri "/app/incident/policy/list/"

    When I set the parameter "CruPolicyNameListSearchInput" with value "<CruxeePolicyName>"
    And I click the "DelCruPolicyNameButton" button
    And I wait for "confirmDelCruPolicyName" will be visible
    And I click the "confirmDelCruPolicyName" button

    Examples:
      | CruxeePolicyName |
      | 合并1组_中低_基线_分组条件eventtype_连续不断发送6小时_自动规则 |
      | 合并2组_高中_SPL统计_分组条件priority_最后一条告警字段priority低或5小时 |
      | 合并1组_低_连续统计_无分组_未收到新告警的时间1小时  |
      | 合并2组_高_事件_分组条件alertid_name包含停止或连续6小时  |
      | 合并2组_高_字段统计_分组条件name_归并告警数量18条         |
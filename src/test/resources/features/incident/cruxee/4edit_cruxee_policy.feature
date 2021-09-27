@editcru @incident
Feature: 事件管理-合并策略-11个

  @editcru1
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

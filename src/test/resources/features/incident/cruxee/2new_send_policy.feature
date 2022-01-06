@sendpolicy @cruxee @autoui02
Feature: 事件管理_发送策略_4个

  Background:
    Given open the "incident.CruxeePolicyPage" page for uri "/app/incident/settings/"
    Given I wait for loading complete
    When I click the "SendPolicyItem" button

  @newsend
  Scenario Outline: 新建2个发送策略
    Given open the "incident.SendPolicyPage" page for uri "/app/incident/settings/"
    Given I wait for loading complete
    When I click the "SendPolicyItem" button
    Given I wait for loading complete

    And I click the "CreateSendPolicy" button
    And I set the parameter "SendPolicyName" with value "<SendPolicyName>"
    And I set the parameter "SendIntervalTime" with value "<SendIntervalTimeValue>"

    And I click the "checkboxNewEventSend" button
    And I click the "checkboxUpdatingSend" button

    And I choose1 the "严重" from the "TunnelPriorityLevelList"
#    And I wait for "3000" millsecond
#    And I click the "PageBlank" button
    And I choose1 the "邮件告警" from the "RelatedSendPluginList"
    And I wait for "3000" millsecond
    And I choose1 the "发送策略一级组<日志易用户体验组>" from the "MailReceiverList"
    And I wait for loading complete
    And I hide the element by the selector "yotta-select-menu"
    And I wait for "2000" millsecond

    And I click the "NewButtonPolicy" button
#    Then I will see the <Result>
#    And I wait for "RetListButton" will be visible
    And I wait for "2000" millsecond
    And I click the "retButton" button

    Examples:
      | SendPolicyName | SendIntervalTimeValue | Result     |
      | 邮件_all_20分钟    | 20                    | "提交发送策略成功" |
      | 邮件_高_20分钟      | 20                    | "提交发送策略成功" |
      | 邮件_中_20分钟      | 20                    | "提交发送策略成功" |
@incident
Feature: 事件管理_发送策略_4个

  @newsend
  Scenario Outline: 新建2个发送策略
    Given open the "incident.SendPolicyPage" page for uri "/app/incident/sender-policy/list/"
    And I click the "CreateSendPolicy" button
    And I set the parameter "SendPolicyName" with value "<SendPolicyName>"
    And I set the parameter "SendIntervalTime" with value "<SendIntervalTimeValue>"

    And I choose1 the "严重" from the "TunnelPriorityLevel"
    And I choose1 the "邮件告警" from the "RelatedSendPluginList" in config
    And I choose1 the "发送策略一级组<日志易用户体验组>,不发送: <kongfeili>" from the "MailReceiver"
#    And I choose1 the "admin@rizhiyi.com" from the "MailReceiver"

    And I click the "SaveSendPolicy" button
#    Then I will see the <Result>
#    And I wait for "RetListButton" will be visible
    And I wait for "2000" millsecond
    And I click the "RetListButton" button

    Examples:
      | SendPolicyName    | SendIntervalTimeValue     | Result|
      | 邮件_all_20分钟 | 20 | "提交发送策略成功" |
      | 邮件_高_20分钟 | 20 | "提交发送策略成功" |
      | 邮件_中_20分钟 | 20 | "提交发送策略成功" |

  @delsends @incidentsdel
  Scenario Outline: 删除2个发送策略
    Given open the "incident.SendPolicyPage" page for uri "/app/incident/sender-policy/list/"
    When I set the parameter "SendPolicyNameListSearchInput" with value "<SendPolicyName>"
    And I click the "SendPolicyNameDeleteButton" button
    And I wait for "ConfirmDeleteSendPolicyNameButton" will be visible
    And I click the "ConfirmDeleteSendPolicyNameButton" button

    Examples:
      | SendPolicyName |
      | 邮件_高_20分钟 |
      | 邮件all_20分钟 |

#      | NoticeReceiveGroupName | ReceiveGroupMemberValue | ReceiveGroupNonMemberValue |
#      | 发送策略一级组 | 日志易用户体验组<Derek> | kongfeili       |
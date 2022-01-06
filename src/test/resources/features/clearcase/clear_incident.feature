@delincident @cleare0
Feature: 删除合并策略

  @incidentdel @cleare0
  Scenario Outline: 删除4个事件管理体验用户
    Given open the "users.ListPage" page for uri "/account/users/"
    When the data name is "{'column':'1','name':'<name>'}" then i click the "删除" button
    And I click the "EnsureButton" button
    And I wait for "SuccessMessage" will be visible
    And I refresh the website
    Then I will see the search result "{'column':'1','name':'<name>','contains':'no'}"

    Examples:
      | name      |
      | ctest     |
      | Derek     |
      | Leibniz   |
      | kongfeili |

  @incidentdel @cleare0
  Scenario Outline: 删除用户分组
    Given open the "userGroups.ListPage" page for uri "/account/usergroups/"
    And the data name is "{'column':'1','name':'<UserGroupName>'}" then i click the "删除" button
    And I click the "Ensure" button

    Examples:
      | UserGroupName |
      | 日志易用户体验组      |

  @delrec @incidentdel
  Scenario Outline: 测试删除接收组
    Given open the "incident.SendPolicyPage" page for uri "/app/incident/sender-policy/list/"
    And I click the "NoticeReceiveGroup" button

    When I set the parameter "NoticeReceiveGroupNameSearchInput" with value "<NoticeReceiveGroupName>"
    And I click the "NoticeReceiveGroupDeleteButton" button
    And I wait for "ConfirmDelNoticeReceiveGroupButton" will be visible
    And I click the "ConfirmDelSNoticeReceiveGroupButton" button

    Examples:
      | NoticeReceiveGroupName |
      | delete_响应组             |
      | 发送策略一级组                |
      | update_响应组             |

  @delsends @incidentdel
  Scenario Outline: 删除2个发送策略
    Given open the "incident.SendPolicyPage" page for uri "/app/incident/sender-policy/list/"
    When I set the parameter "SendPolicyNameListSearchInput" with value "<SendPolicyName>"
    And I click the "SendPolicyNameDeleteButton" button
    And I wait for "ConfirmDeleteSendPolicyNameButton" will be visible
    And I click the "ConfirmDeleteSendPolicyNameButton" button

    Examples:
      | SendPolicyName |
      | 邮件_高_20分钟      |
      | 邮件_all_20分钟    |
      | 邮件_中_20分钟      |

  @delcru @incidentdel
  Scenario Outline: 合并1组_中低_基线_分组条件eventtype_连续不断发送6小时_自动规则1
    Given open the "incident.CruxeePolicyPage" page for uri "/app/incident/settings/"

    When I set the parameter "CruPolicyNameListSearchInput" with value "<CruxeePolicyName>"
    And I click the "DelCruPolicyNameButton" button
    And I wait for "confirmDelCruPolicyName" will be visible
    And I click the "confirmDelCruPolicyName" button

    Examples:
      | CruxeePolicyName                                 |
      | 合并1组_中低_基线_分组条件eventtype_连续不断发送6小时_自动规则          |
      | 合并2组_高中_SPL统计_分组条件priority_最后一条告警字段priority低或5小时 |
      | 合并1组_低_连续统计_无分组_未收到新告警的时间1小时                     |
      | 合并2组_高_事件_分组条件alertid_name包含停止或连续6小时             |
      | 合并2组_高_字段统计_分组条件name_归并告警数量18条                   |
      | 合并1组_中低_基线_分组条件eventtype_连续不断发送6小时_自动规则          |

  @cleare0
  Scenario Outline:
    Given open the "index.ListPage" page for uri "/indexsettings/"
    Given the data name is "{'column':'0','name':'<name>'}" then i click the "删除" button
    And I click the "Ensure" button

    Examples:
      | name             |
      | collectone       |
      | collecttocollect |
      | collecttwo       |
      | collectmodefalse |
      | collectmodetrue  |
      | collectmulti     |
      | collectdelete    |
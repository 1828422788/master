Feature: 事件管理_用户接收组_7个

  @incident @newrec @incident3
  Scenario Outline: 新建3个接收组
    Given open the "incident.SendPolicyPage" page for uri "/app/incident/sender-policy/list/"
    And I click the "NoticeReceiveGroup" button
    And I click the "CreateNoticeReceiveGroup" button

    And I set the parameter "NoticeReceiveGroupNameInput" with value "<NoticeReceiveGroupName>"
    And I choose1 the "<ReceiveGroupMemberValue>" from the "ReceiveGroupMember"
    And I click the "ReceiveGroupMemberLable" button
    And I wait for "1000" millsecond

    And I choose1 the "<ReceiveGroupNonMemberValue>" from the "ReceiveGroupNonMember"
    And I click the "ReceiveGroupMemberLable" button

    And I wait for "1000" millsecond
    And I click the "SaveNoticeReceiveGroup" button
    And I wait for "RetButton" will be visible
    And I click the "RetButton" button

    Examples:
      | NoticeReceiveGroupName | ReceiveGroupMemberValue | ReceiveGroupNonMemberValue |
      | 接收策略一级组 | incident用户体验组 | kongfeili       |
      | delete_响应组 | incident用户体验组 | kongfeili       |
      | update_响应组 | incident用户体验组 | Leibniz         |


  @editrec @incident
  Scenario Outline: 测试编辑接收组
    Given open the "incident.SendPolicyPage" page for uri "/app/incident/sender-policy/list/"
    And I click the "NoticeReceiveGroup" button

    When I set the parameter "NoticeReceiveGroupNameSearchInput" with value "<NoticeReceiveGroupName>"
    And I click the "NoticeReceiveGroupEditButton" button

    And I set the parameter "NoticeReceiveGroupNameInput" with value "update_响应组1"
    And I choose1 the "<ReceiveGroupNonMemberValue>" from the "ReceiveGroupNonMember"
    And I click the "ReceiveGroupMemberLable" button

    And I wait for "1000" millsecond
    And I click the "SaveNoticeReceiveGroup" button
    And I wait for "RetButton" will be visible
    And I click the "RetButton" button

    Examples:
      | NoticeReceiveGroupName | ReceiveGroupNonMemberValue |
      | update_响应组 | kongfeili |

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
      | delete_响应组 |
      | 接收策略一级组 |
      | update_响应组 |
@recieve @cruxee @autoui01
Feature: 事件管理_用户接收组_7个

  @newrec
  Scenario Outline: 新建3个接收组
    Given open the "incident.SendPolicyPage" page for uri "/app/incident/sender-policy/list/"
    And I click the "NoticeReceiveGroup" button
    And I click the "CreateNoticeReceiveGroup" button

    And I set the parameter "NoticeReceiveGroupNameInput" with value "<NoticeReceiveGroupName>"
    And I choose1 the "<ReceiveGroupMemberValue>" from the "ReceiveGroupMemberList"
    And I click the "ReceiveGroupMemberLable" button
    And I wait for "1000" millsecond

#    And I choose1 the "<ReceiveGroupNonMemberValue>" from the "ReceiveGroupNonMemberList"
    And I click the "ReceiveGroupMemberLabel" button

    And I wait for "1000" millsecond
    And I click the "NewNoticeReceiveGroup" button
    And I wait for "RetButton" will be visible
    And I click the "RetButton" button

    Examples:
      | NoticeReceiveGroupName | ReceiveGroupMemberValue | ReceiveGroupNonMemberValue |
      | 发送策略一级组 | 日志易用户体验组 | kongfeili       |
      | delete_响应组 | 日志易用户体验组 | kongfeili       |
      | update_响应组 | 日志易用户体验组 | Leibniz         |

  @editrec
  Scenario Outline: 编辑接收组
    Given open the "incident.SendPolicyPage" page for uri "/app/incident/sender-policy/list/"
    Given I wait for loading complete
    And I click the "NoticeReceiveGroup" button

    Given I wait for loading complete
    When I set the parameter "NoticeReceiveGroupNameSearchInput" with value "<NoticeReceiveGroupName>"
    And I wait for "2000" millsecond
    And I click the "NoticeReceiveGroupEditButton" button

    Given I wait for loading complete
    And I set the parameter "NoticeReceiveGroupNameInput" with value "update_响应组1"
    And I choose1 the "<ReceiveGroupNonMemberValue>" from the "ReceiveGroupNonMember"
    And I click the "ReceiveGroupMemberLable" button

    And I wait for "1000" millsecond
    And I click the "UpdateNoticeReceiveGroup" button
    And I wait for "RetButton" will be visible
    And I click the "RetButton" button

    Examples:
      | NoticeReceiveGroupName | ReceiveGroupNonMemberValue |
      | update_响应组 | kongfeili |

Feature: 新建数据库连接配置

  @newconn @splpre @autoui01
  Scenario Outline: 新建连接配置-4个
    Given open the "dbConnectionPre.dbSettingPage" page for uri "/dbsettings/"
    And I click the "DbConnConfig" button
    And I wait for "1000" millsecond

    And I click the "CreateDbConn" button
    And I wait for loading complete

    And I set the parameter "NewDbConnName" with value "<newDbConnName>"
    And I set the parameter "NewDbUserName" with value "<newDbUserName>"
    And I set the parameter "NewDbUserPassword" with value "<newDbUserPassword>"
    And I set the parameter "NewDbRetLines" with value "<newDbRetLines>"

    And I choose the "<newDbConnTypeList>" from the "NewDbConnTypeList" in config

    And I wait for "3000" millsecond

    And I set the parameter "newDbConnHost" with value "<newDbConnHost>"
    And I set the parameter "newDbConnPort" with value "<newDbConnPort>"
    And I set the parameter "newConnDefaultDb" with value "<newConnDefaultDb>"

    And I click the "NewButtton" button
    Then take a screenshot with name "actual/create_<newDbConnName>"
#    And I wait for element "SearchStatus" change text to "创建成功"
#    And I wait for element "ReminderBoxTitle" change text to "提示"
#    When I click the "AffirmButton" button

    Examples:
      | newDbConnName | newDbUserName | newDbUserPassword | newDbRetLines | newDbConnTypeList | newDbConnHost | newDbConnPort | newConnDefaultDb |
      | v33dbx        | root          | 123456            | 1000          | mysql             | 192.168.1.171 | 3306          | v33dbx           |
      | delv33dbx     | root          | 1233456           | 1000          | mysql             | 192.168.1.171 | 3306          | v33dbx           |
      | editv33dbx    | root          | 123456            | 1000          | mysql             | 192.168.1.171 | 3306          | v33dbx           |
      | v33vertica    | dbadmin       | 123456            | 1000          | vertica           | 192.168.1.221 | 5433          | docker           |

  @editconn
  Scenario Outline:复制
    Given open the "dbConnectionPre.dbSettingPage" page for uri "/dbsettings/"
    And I click the "getNewDbLookup" button
    And I wait for "1000" millsecond

    When I set the parameter "DbConnNameSearchInput" with value "<DbConnName>"
    And I click the "DelDbConnNameButton" button

    And I set the parameter "NoticeReceiveGroupNameInput" with value "update_响应组1"
    And I choose1 the "<ReceiveGroupNonMemberValue>" from the "ReceiveGroupNonMember"
    And I click the "ReceiveGroupMemberLable" button

    And I wait for "1000" millsecond
    And I click the "SaveNoticeReceiveGroup" button
    And I wait for "RetButton" will be visible
    And I click the "RetButton" button

    Examples:
      | DbConnName | ReceiveGroupNonMemberValue |
      | v33deldbx  | kongfeili                  |



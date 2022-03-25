@newconn  @DbSettingSmoke @createDbConnection @DbSetting
Feature: 新建数据库连接配置

  @splpre
  Scenario Outline: 新建连接配置-4个
    Given open the "dbConnectionPre.dbSettingPage" page for uri "/dbsettings/"
    And I click the "DbConnConfig" button

    And I click the "CreateDbConn" button
    Given I wait for loading complete

    And I set the parameter "NewDbConnName" with value "<newDbConnName>"
    And I choose the "<newDbConnTypeList>" from the "NewDbConnTypeList"

    And I set the parameter "NewDbUserName" with value "<newDbUserName>"
    And I set the parameter "NewDbUserPassword" with value "<newDbUserPassword>"
    And I set the parameter "NewDbRetLines" with value "<newDbRetLines>"

    And I set the parameter "newDbConnHost" with value "<newDbConnHost>"
    And I set the parameter "newDbConnPort" with value "<newDbConnPort>"
    And I set the parameter "newConnDefaultDb" with value "<newConnDefaultDb>"

    And I click the "NewButtton" button
    Given I wait for loading complete
    And I wait for "2000" millsecond
    Then take a screenshot with name "actual/create_<newDbConnName>"
    And I wait for element "succMessage" change text to "创建成功"
    Then I will see the message contains "创建成功"
    When I click the "AffirmButton" button

    Examples:
      | newDbConnName | newDbUserName | newDbUserPassword | newDbRetLines | newDbConnTypeList | newDbConnHost | newDbConnPort | newConnDefaultDb |
      | v33dbx        | root          | 123456            | 1000          | mysql             | 192.168.40.171 | 3306          | v33dbx           |
      | delv33dbx     | root          | 1233456           | 1000          | mysql             | 192.168.40.171 | 3306          | v33dbx           |
      | editv33dbx    | root          | 123456            | 1000          | mysql             | 192.168.40.171 | 3306          | v33dbx           |
      | v33vertica    | dbadmin       | 123456            | 1000          | vertica           | 192.168.1.221  | 5433          | docker           |

  @newclickhouse
  Scenario Outline: 新建连接配置clickhouse-1个
    Given open the "dbConnectionPre.dbSettingPage" page for uri "/dbsettings/"
    And I click the "DbConnConfig" button

    And I click the "CreateDbConn" button
    And I wait for loading complete

    And I set the parameter "NewDbConnName" with value "<newDbConnName>"
    And I choose the "<newDbConnTypeList>" from the "NewDbConnTypeList"

#    And I set the parameter "NewDbUserName" with value "<newDbUserName>"
#    And I set the parameter "NewDbUserPassword" with value "<newDbUserPassword>"
    And I set the parameter "NewDbRetLines" with value "<newDbRetLines>"

    And I set the parameter "newDbConnHost" with value "<newDbConnHost>"
    And I set the parameter "newDbConnPort" with value "<newDbConnPort>"
    And I set the parameter "newConnDefaultDb" with value "<newConnDefaultDb>"

    And I click the "NewButtton" button
    Then take a screenshot with name "actual/create_<newDbConnName>"
    And I wait for element "succMessage" change text to "创建成功"
    When I click the "AffirmButton" button

    Examples:
      | newDbConnName | newDbUserName | newDbUserPassword | newDbRetLines | newDbConnTypeList | newDbConnHost | newDbConnPort | newConnDefaultDb |
      | v33clickhouse | dbadmin       | 123456            | 1000          | clickhouse        | 192.168.1.221 | 8123          | docker           |

  Scenario Outline:编辑数据库链接
    Given open the "dbConnectionPre.dbSettingPage" page for uri "/dbsettings/"
    And I click the "DbConnConfig" button
    And I wait for "500" millsecond

    When I set the parameter "DbConnNameSearchInput" with value "<newDbConnName>"
    And I click the "EditDbConnNameButton" button
    Given I wait for loading complete

    And I set the parameter "NewDbRetLines" with value "<newDbRetLines>"

    And I click the "SaveButton" button
    And I will see the element "succMessage" contains "更新成功"

    Examples:
      |newDbConnName | newDbRetLines|
      |editv33dbx    | 10           |



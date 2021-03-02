Feature: 新建数据库连接配置

  @newconn
  Scenario Outline: 新建连接配置-2个
    Given open the "splSearch.dbsettingPage" page for uri "/dbsettings/"
    And I click the "CreateDbConn" button

    And I set the parameter "newDbConnName" with value "<newDbConnName>"
    And I set the parameter "SendIntervalTime" with value "<newDbUserName>"
    And I set the parameter "newDbConnName" with value "<newDbUserPassword>"
    And I set the parameter "newDbRetLines" with value "<newDbRetLines>"

    And I choose1 the "<NewDbConnTypeList>" from the "NewDbConnTypeList"

    And I set the parameter "newDbConnHost" with value "<newDbConnHost>"
    And I set the parameter "newDbConnPort" with value "<newDbConnPort>"
    And I set the parameter "newConnDefaultDb" with value "<newConnDefaultDb>"

    And I click the "SaveButtton" button
    And I wait for element "SearchStatus" change text to "保存成功"

    Examples:
      | newDbConnName | newDbUserName | newDbUserPassword | newDbRetLines | NewDbConnTypeList | newDbConnHost | newDbConnPort | newConnDefaultDb |
      | v33dbx | root | rizhiyi&2014 | 1000 | mysql | 192.168.1.183 | 3306 | v33dbx |
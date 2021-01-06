Feature: 新建数据库查找

  @newdblookup @splpre @extra1
  Scenario Outline: 新建查找-3
    Given open the "dbConnectionPre.dbSettingPage" page for uri "/dbsettings/"
    And I click the "DbLookupConfig" button
    And I wait for "1000" millsecond

    And I click the "NewDbLookup" button
    And I wait for loading complete

    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I wait for loading complete

    When I set the parameter "SearchInput" with value "<splQuery>"
#    And I click the "DateEditor" button
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I click the "NextStepButton" button

    And I choose the "<DbLookupConnList>" from the "DbLookupConnList" in config
    And I choose1 the "<DbLookupDirList>" from the "DbLookupDirList" in config
#    When I set the parameter "LookupDbTable" with value "lookupsample"
    And I wait for "2000" millsecond
    And I click the "LookupDbTableLink" button
    And I wait for "2000" millsecond
    And I click the "NextStepButton" button

    And I click the "AddFieldMap" button
    And I wait for "2000" millsecond
    And I choose1 the "apache.x_forward" from the "DbLookupSearchFieldR1C1List"
    And I wait for "2000" millsecond
    And I choose1 the "domain_id (LONGLONG)" from the "DbLookupSearchFieldR1C2List"
    And I click the "AddLookupField" button
    And I wait for "2000" millsecond
    And I choose the "file_name (VAR_STRING)" from the "DbLookupLookupFieldR1C1List" in config
    And I click the "NextStepButton" button

    And I wait for "1000" millsecond
    When I set the parameter "DbLookupName" with value "<dbLookupName>"
    And I click the "NextStepButton" button
#    And I wait for element "SearchStatus" change text to "创建成功"

    Examples:
      | dbLookupName | DbLookupConnList | DbLookupDirList | splQuery                                                      |
      | lookupsample | v33dbx           | v33dbx          | starttime=\"now/d\" endtime=\"now/d+24h\" tag\:sample04061424 |
      | dellookupsample | v33dbx           | v33dbx          | starttime=\"now/d\" endtime=\"now/d+24h\" tag\:sample04061424 |
      | u_lookupsample | v33dbx           | v33dbx          | starttime=\"now/d\" endtime=\"now/d+24h\" tag\:sample04061424 |


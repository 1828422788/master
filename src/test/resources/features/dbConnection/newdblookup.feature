Feature: 新建数据库查找

  @newdblookup
  Scenario Outline: 新建查找-3个
    Given open the "dbConnection.dbSettingPage" page for uri "/dbsettings/"
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
    And I choose the "<DbLookupDirList>" from the "DbLookupDirList" in config
#    When I set the parameter "LookupDbTable" with value "<LookupDbTable>"
    And I wait for "3000" millsecond
    And I click the "LookupDbTableLink" button
    And I wait for "5000" millsecond
    And I click the "NextStepButton" button

    And I click the "AddFieldMap" button
    And I wait for "5000" millsecond
    And I choose1 the "apache.x_forward" from the "DbLookupSearchFieldR1C1List"
    And I wait for "5000" millsecond
#    And I choose1 the "domain_id(LONGLONG)" from the "DbLookupSearchFieldR1C2List"
#    And I choose the "domain_id(LONGLONG)" from the "DbLookupSearchFieldR1C2List" in config
    And I click the "AddLookupField" button
    And I wait for "5000" millsecond
#    And I choose1 the "file_name(VAR_STRING)" from the "DbLookupLookupFieldR1C1List"
    And I choose the "file_name(VAR_STRING)" from the "DbLookupLookupFieldR1C1List" in config

    And I click the "NextStepButton" button

    And I click the "NextStepButton" button
#    And I wait for element "SearchStatus" change text to "创建成功"

    Examples:
      | DbLookupConnList | DbLookupDirList | LookupDbTable | splQuery                                                      |
      | v33dbx           | v33dbx          | lookupsample  | starttime=\"now/d\" endtime=\"now/d+24h\" tag\:sample04061424 |

  @delconn
  Scenario Outline: 删除连接
    Given open the "dbConnection.dbSettingPage" page for uri "/dbsettings/"
    And I click the "DbConnConfig" button
    And I wait for "1000" millsecond

    When I set the parameter "DbConnNameSearchInput" with value "<DbConnName>"
    And I click the "DelDbConnNameButton" button
    And I wait for "AffirmDelDbConnNameButton" will be visible
    And I click the "AffirmDelDbConnNameButton" button

    Examples:
      | DbConnName |
      | v33dbx_del |

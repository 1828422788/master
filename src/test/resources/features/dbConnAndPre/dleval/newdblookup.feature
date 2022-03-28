@DbSettingSmoke @createDbLookup @DbSetting
Feature: 新建数据库查找

  Background:
    And I zoom the browse to full screen

  @newdblookup @splpre
  Scenario Outline: 新建数据库查找
    Given open the "dbConnectionPre.dbSettingPage" page for uri "/dbsettings/"
    And I click the "DbLookupConfig" button

    And I click the "NewDbLookup" button
    Given I wait for loading complete

    And I wait for element "SearchStatus" change text to "搜索完成!"

    When I set the parameter "SearchInput" with value "<splQuery>"

    When I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I click the "NextStepButton" button
    And I wait for "500" millsecond
    And I choose the "<DbLookupConnList>" from the "DbLookupConnList"
    And I wait for "500" millsecond
    And I choose the "<DbLookupDirList>" from the "DbLookupDirList"

    And I click the "LookupDbTableLink" button
    And I click the "NextStepButton" button
    And I wait for loading complete

    And I click the "AddFieldMap" button
    And I wait for loading complete
    And I wait for "500" millsecond
    And I choose the "apache.x_forward" from the "DbLookupSearchFieldR1C1List"
    And I wait for "500" millsecond
#    And I choose1 the "domain_id (LONGLONG)" from the "DbLookupSearchFieldR1C2List"
    And I choose the "domain_id (LONGLONG)" from the "DbLookupSearchFieldR1C2List"
    And I wait for "500" millsecond
    And I click the "AddLookupField" button
    And I wait for "500" millsecond
#    And I choose the "file_name (VAR_STRING)" from the "DbLookupLookupFieldR1C1List" in config
    And I choose the "file_name (VAR_STRING)" from the "DbLookupLookupFieldR1C1List"
    And I wait for "500" millsecond

    And I click the "NextStepButton" button

    And I wait for "500" millsecond
    When I set the parameter "DbLookupName" with value "<dbLookupName>"
    And I click the "DoneButton" button

    And I will see the element "ResultMessage" contains "新建成功"


    Examples:
      | dbLookupName    | DbLookupConnList | DbLookupDirList | splQuery                                                      |
      | lookupsample    | v33dbx           | v33dbx          | starttime=\"now/d\" endtime=\"now/d+24h\" tag\:sample04061424 |


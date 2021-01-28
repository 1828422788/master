@extra1
Feature: 新建数据库输出

  @newdboutput @splpre @dleval
  Scenario Outline: 新建数据库输出-3
    Given open the "dbConnectionPre.DbOutputPage" page for uri "/dbsettings/"
#    And I click the "DbOutputConfig" button
    And I wait for "1000" millsecond

    And I click the "NewDbOutputButton" button
    And I wait for loading complete

    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I wait for loading complete

    When I set the parameter "SearchInput" with value "<splQuery>"
#    And I click the "DateEditor" button
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I click the "NextStepButton" button

    And I choose the "<DbOutputConnList>" from the "DbOutputConnList" in config
    And I wait for "2000" millsecond
    And I choose the "<DbOutputDirList>" from the "DbOutputDirList" in config
    And I wait for "2000" millsecond
#    And I choose1 the "<DbOutputDirList>" from the "DbOutputDirList" in config
#    When I set the parameter "LookupDbTable" with value "lookupsample"
    And I wait for "2000" millsecond
    And I click the "OutputDbTableLink" button
    And I wait for "2000" millsecond
    And I click the "NextStepButton" button

    And I click the "AddFieldMap" button
    And I wait for "2000" millsecond
    And I choose1 the "apache.x_forward" from the "DbOutputSearchFieldR1C1List"
    And I wait for "2000" millsecond
    And I choose1 the "forward (VARCHAR)" from the "DbOutputSearchFieldR1C2List"
    And I wait for "2000" millsecond
#    And I click the "AddFieldMap" button
#    And I choose1 the "apache.resp_len" from the "getSearchFieldList"
#    And I wait for "2000" millsecond
#    And I choose1 the "resp_len (BIGINT)" from the "getTableColNameList"
#    And I wait for "2000" millsecond
#    And I click the "AddFieldMap" button
#    And I choose1 the "apache.geo.city" from the "getSearchFieldList"
#    And I wait for "2000" millsecond
#    And I choose1 the "city (VARCHAR)" from the "getTableColNameList"
#    And I wait for "2000" millsecond
#    And I click the "AddFieldMap" button
#    And I choose1 the "apache.refer_domain" from the "getSearchFieldList"
#    And I wait for "2000" millsecond
#    And I choose1 the "domain (VARCHAR)" from the "getTableColNameList"
#    And I wait for "2000" millsecond

    And I click the "NextStepButton" button

    And I wait for "1000" millsecond
    When I set the parameter "DbOutputName" with value "<DbOutputName>"
    And I click the "NextStepButton" button
#    And I wait for element "SearchStatus" change text to "创建成功"

    Examples:
      | DbOutputName | DbOutputConnList | DbOutputDirList | splQuery                                                   |
      | outsample | v33dbx           | v33dbx          | starttime=\"now/d\" endtime=\"now/d+24h\" tag\:sample04061424 |
      | outsample_u | v33dbx           | v33dbx          | starttime=\"now/d\" endtime=\"now/d+24h\" tag\:sample04061424 |
      | deloutsample | v33dbx           | v33dbx          | starttime=\"now/d\" endtime=\"now/d+24h\" tag\:sample04061424 |


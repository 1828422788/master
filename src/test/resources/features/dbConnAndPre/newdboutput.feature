@extra1 @ndb2046
Feature: 新建数据库输出

  @newdboutput @splpre @dleval
  Scenario Outline: 新建数据库输出-3
    Given open the "dbConnectionPre.DbOutputPage" page for uri "/dbsettings/"
#    And I click the "DbOutputConfig" button
    And I wait for "1000" millsecond

    And I click the "NewDbOutputButton" button
    Given I wait for loading complete
    And I zoom the screen up to the maximum

    And I wait for element "SearchStatus" change text to "搜索完成!"
    Given I wait for loading complete

    When I set the parameter "SearchInput" with value "<splQuery>"
    And I click the "SearchButton" button
    And I wait for "5000" millsecond
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I click the "NextStepButton" button
    Given I wait for loading complete
    And I zoom the screen up to the maximum
    And I choose the "<DbOutputConnList>" from the "DbOutputConnList"
    And I wait for "2000" millsecond
    And I choose the "<DbOutputDirList>" from the "DbOutputDirList"
    And I wait for "2000" millsecond
    And I click the "OutputDbTableLink" button
    And I wait for "2000" millsecond
    And I click the "NextStepButton" button
    And I zoom the screen up to the maximum

    And I click the "AddFieldMap" button
    Given I wait for loading complete
    And I wait for "2000" millsecond
    And I choose the "apache.x_forward" from the "DbOutputSearchField0List"
    And I wait for "2000" millsecond
    And I choose the "forward (VARCHAR)" from the "DbOutputDbField0List"
    And I wait for "2000" millsecond

    And I click the "AddFieldMap" button
    Given I wait for loading complete
    And I choose the "apache.resp_len" from the "DbOutputSearchField1List"
    And I wait for "2000" millsecond
    And I choose the "resp_len (BIGINT)" from the "DbOutputDbField1List"
    And I wait for "2000" millsecond
    And I click the "AddFieldMap" button
    And I choose the "apache.geo.city" from the "DbOutputSearchField2List"
    And I wait for "2000" millsecond
    And I choose the "city (VARCHAR)" from the "DbOutputDbField2List"
    And I wait for "2000" millsecond
    And I click the "AddFieldMap" button
    And I choose the "apache.referer_domain" from the "DbOutputSearchField3List"
    And I wait for "2000" millsecond
    And I choose the "domain (VARCHAR)" from the "DbOutputDbField3List"
    And I wait for "3000" millsecond

    And I click the "NextStepButton" button

    And I wait for "1000" millsecond
    When I set the parameter "DbOutputName" with value "<DbOutputName>"
    And I click the "DoneButton" button
#    And I wait for element "SearchStatus" change text to "创建成功"

    Examples:
      | DbOutputName | DbOutputConnList | DbOutputDirList | splQuery                                                   |
      | outsample | v33dbx           | v33dbx          | starttime=\"now/d\" endtime=\"now/d+24h\" tag\:sample04061424 |
      | deloutsample | v33dbx           | v33dbx          | starttime=\"now/d\" endtime=\"now/d+24h\" tag\:sample04061424 |
      | outsample_u | v33dbx           | v33dbx          | starttime=\"now/d\" endtime=\"now/d+24h\" tag\:sample04061424 |


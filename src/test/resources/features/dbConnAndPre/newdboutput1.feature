Feature: 编辑DbOutput

  @editdbo @dleval
  Scenario Outline: 编辑数据库输出-1
    Given open the "dbConnectionPre.DbOutputPage" page for uri "/dbsettings/"
    And I wait for "1000" millsecond

    And I set the parameter "SearchNameInput" with value "<DbOutputName>"
    Given I wait for loading complete
    And I wait for "2000" millsecond

#    Given the data name is "{'column':'1','name':'<DbOutputName>'}" then i click the "编辑" button

    Given I click the "EditButton" button
    Given I wait for loading complete
    And I zoom the screen up to the maximum

    And I wait for element "SearchStatus" change text to "搜索完成!"
    Given I wait for loading complete

    And I click the "NextStepButton" button
    Given I wait for loading complete
    And I zoom the screen up to the maximum

    And I click the "NextStepButton" button
    Given I wait for loading complete
    And I wait for "2000" millsecond

    And I click the "UpdateInsertButton" button
    And I choose the "forward" from the "DbOutputKeyList"
    And I wait for "3000" millsecond

    And I click the "NextStepButton" button

    And I wait for "1000" millsecond
    When I set the parameter "DbOutputName" with value "<DbOutputName>"
    And I click the "DoneButton" button
#    And I wait for element "SearchStatus" change text to "创建成功"

    Examples:
      | DbOutputName | DbOutputConnList | DbOutputDirList | splQuery                                                      |
      | outsample_u    | v33dbx           | v33dbx          | starttime=\"now/d\" endtime=\"now/d+24h\" tag\:sample04061424 |

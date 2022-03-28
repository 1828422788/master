@DbSettingSmoke @editDbOutput @DbSetting
Feature: 编辑数据库输出

  Background:
    And I zoom the browse to full screen

  @editdbo
  Scenario Outline: 编辑数据库输出
    Given open the "dbConnectionPre.DbOutputPage" page for uri "/dbsettings/"

    And I set the parameter "SearchNameInput" with value "<DbOutputName>"
    Given I wait for loading complete

    Given I click the "EditButton" button
    Given I wait for loading complete

    And I wait for element "SearchStatus" change text to "搜索完成!"

    And I click the "NextStepButton" button
    And I wait for "500" millsecond
    And I click the "NextStepButton" button
    Given I wait for loading complete

    When I click the "UpdateInsertButton" button

    And I choose the "forward" from the "DbOutputKeyList"

    And I click the "NextStepButton" button

    When I click the "DoneButton" button
    And I will see the element "ResultMessage" contains "更新成功"

    Examples:
      | DbOutputName |
      | outsample    |

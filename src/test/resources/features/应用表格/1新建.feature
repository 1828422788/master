Feature: 应用表格新建（RZY-2150）

  Background:
    Given open the "appTable.ListPage" page for uri "/dataset/"

  Scenario: 新建应用表格总流程
    When the data name is "12" then i click the "编辑" button
    And I click the "Node" button
    And I set the parameter "QueryText" with value "test"
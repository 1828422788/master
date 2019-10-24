@all @smoke @configs @configsSmoke
Feature: 字段提取编辑

  Background:
    Given open the "configs.ListPage" page for uri "/configs/"

  Scenario:
    When the data name is "{'column':'1','name':'RZY3417多值字段(副本)'}" then i click the "编辑" button
    Then I will see the "configs.CreatePage" page
    And I click the "NextButton" button
    When I set the parameter "Name" with value "多值字段副本"
    And I click the "NextButton" button
    And I wait for "ConfigDone" will be visible

  Scenario: 验证是否编辑成功
    Then I will see the search result contains "{'column':'1','name':'多值字段副本'}"

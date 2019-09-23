@all @smoke @configs @configsSmoke
Feature: 字段提取编辑

  Background:
    Given open the "configs.ListPage" page for uri "/configs/"

  Scenario:
    When the data name is "RZY2868redirect主规则(副本)" then i click the "编辑" button
    Then I will see the "configs.CreatePage" page
    And I display the element "ExtractSample"
    When I set the parameter "Name" with value "主规则副本"
    And I click the "NextButton" button
    And I click the "SwitchButton" button
    And I click the "NextButton" button
    And I wait for "ConfigDone" will be visible

  Scenario: 验证是否编辑成功
    Then I will see the search result contains "{'column':'0','name':'主规则副本'}"

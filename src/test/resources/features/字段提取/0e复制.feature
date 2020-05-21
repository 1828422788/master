@all @smoke @configs @configsSmoke
Feature: 字段提取复制、编辑

  Scenario Outline:
    Given open the "configs.ListPage" page for uri "/configs/"
    Then I wait for loading invisible
    When the data name is "{'column':'1','name':'<name>'}" then i click the "复制" button
    And I refresh the website
    Then I will see the search result contains "{'column':'1','name':'<name>(副本)'}"
    When the data name is "{'column':'1','name':'RZY3417多值字段(副本)'}" then i click the "编辑" button
    Then I will see the "configs.CreatePage" page
    When I set the parameter "LogSample" with value "192.168.1.200,xmxm,rzy,13800000000"
    Then I wait for "2000" millsecond
    And I click the "NextButton" button
    When I set the parameter "Name" with value "多值字段副本"
    And I click the "Done" button
    And I wait for "ConfigDone" will be visible
    Given open the "configs.ListPage" page for uri "/configs/"
    Then I wait for loading invisible
    Then I will see the search result contains "{'column':'1','name':'多值字段副本'}"

    Examples:
      | name        |
      | RZY3417多值字段 |



@agent2
Feature: AgentCSV配置文件

  Background:
    Given open the "agent.ListPage" page for uri "/sources/input/agent/"
    And I wait for loading invisible
    When I click the detail which column is "0" in agent page
    And switch to another window
    And I close all tabs except main tab
    And I wait for loading invisible
    And I will see the "agent.CreatePage" page

  Scenario: Csv文件配置JmxInput
    And I click the "CsvConfing" button
    And I click the "JmxInput" button
#    And I "checked" the label before "采集指标" in the agent
#    And I click the "Clean" button
#    And I click the "Ensure" button
#    And I wait for "ChangeMemo" will be visible

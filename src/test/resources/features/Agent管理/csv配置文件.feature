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
    When I choose the "JmxInput" from the "CsvConfing"
    And I wait for "Create" will be visible
    And I click the "Create" button
    And I wait for "CsvJmxRmi" will be visible
    And I set the parameter "CsvJmxRmi" with value "jmx:rmi:///jndi/rmi://10.211.55.3:7000/jmxrmi"
    And I set the parameter "CsvapplicationName" with value "Tomcat"
    And I set the parameter "CsvUser" with value "user"
    And I set the parameter "CsvPassword" with value "password"
    And I set the parameter "CsvWantPorts" with value "8080 8081"
    And I set the parameter "CsvAppName" with value "appName"
    And I set the parameter "Csvtag" with value "tag"
    And I click the "Csvcertain" button
    And I click the "CsvSave" button
#    And I "checked" the label before "采集指标" in the agent

#    And I wait for "ChangeMemo" will be visible

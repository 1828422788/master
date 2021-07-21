@agent @agent_csv
Feature: AgentCSV配置文件

  Background:
    Given open the "agent.ListPage" page for uri "/sources/input/agent/"
    And I wait for loading invisible
    And I zoom the browse to full screen
    When I click the detail which column is "0" in agent page
    And switch to another window
    And I close all tabs except main tab
    And I wait for loading invisible
    And I will see the "agent.CreatePage" page

  Scenario: Csv文件添加配置JmxInput失败
    And I move the mouse pointer to the "CsvConfing"
    When I click the "JmxInput" button
    And I wait for "Create" will be visible
    And I click the "Create" button
    And I click the "Create" button
    And I wait for "ChangeMemo" will be visible
#    Then I will see the element "CsvChangeMemo" name is "当前编辑操作还未确认，请确认后再进行下一步操作"

  Scenario: Csv文件添加配置JmxInput失败2
    And I move the mouse pointer to the "CsvConfing"
    When I click the "JmxInput" button
    And I wait for "Create" will be visible
    And I click the "Create" button
    And I click the "Csvcertain" button
    And I wait for "ChangeMemo" will be visible
#    Then I will see the element "CsvChangeMemo" name is "当前编辑的行不可全部为空"

  Scenario: 从JmxInput配置页面返回Agent具体配置
    And I move the mouse pointer to the "CsvConfing"
    When I click the "JmxInput" button
    And I click the "Backup" button
    And I wait for loading invisible
#    Then I will see the element "AgentTitle" contains "Agent详情"

  Scenario: Csv文件添加配置JmxInput
    And I move the mouse pointer to the "CsvConfing"
    When I click the "JmxInput" button
    And I wait for loading invisible
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

  Scenario: Csv文件编辑JmxInput
    And I move the mouse pointer to the "CsvConfing"
    When I click the "JmxInput" button
    And I wait for loading invisible
    And I click the "Csvedit" button
    And I set the parameter "CsvJmxRmi" with value "jmx:rmi:///jndi/rmi://192.168.1.139:7000/jmxrmi"
    And I set the parameter "CsvapplicationName" with value "Tomcat2"
    And I set the parameter "CsvUser" with value "user2"
    And I set the parameter "CsvPassword" with value "password2"
    And I set the parameter "CsvWantPorts" with value "8080"
    And I set the parameter "CsvAppName" with value "appName2"
    And I set the parameter "Csvtag" with value "tag2"
    And I click the "Csvcertain" button
    And I click the "CsvSave" button

  Scenario: Csv文件删除JmxInput
    And I move the mouse pointer to the "CsvConfing"
    When I click the "JmxInput" button
    And I wait for "Csvdelete" will be visible
    And I click the "Csvdelete" button
    And I click the "Ensure" button
    And I wait for "CsvSave" will be visible
    And I click the "CsvSave" button

  Scenario: Csv文件添加配置HostConnectInput失败
    And I move the mouse pointer to the "CsvConfing"
    When I click the "HostConnectInput" button
    And I wait for "Create" will be visible
    And I click the "Create" button
    And I click the "Csvcertain" button
    And I wait for "ChangeMemo" will be visible
#    Then I will see the element "CsvChangeMemo" name is "当前编辑操作还未确认，请确认后再进行下一步操作"

  Scenario: Csv文件添加配置HostConnectInput失败2
    And I move the mouse pointer to the "CsvConfing"
    When I click the "HostConnectInput" button
    And I wait for "Create" will be visible
    And I click the "Create" button
    And I click the "Csvcertain" button
    And I wait for "ChangeMemo" will be visible
#    Then I will see the element "CsvChangeMemo" name is "当前编辑的行不可全部为空"

  Scenario: 从HostConnectInput配置页面返回Agent具体配置
    And I move the mouse pointer to the "CsvConfing"
    When I click the "HostConnectInput" button
    And I click the "Backup" button
    And I wait for loading invisible
#    Then I will see the element "AgentTitle" contains "Agent详情"

  Scenario: Csv文件添加配置HostConnectInput
    And I move the mouse pointer to the "CsvConfing"
    When I click the "HostConnectInput" button
    And I wait for "Create" will be visible
    And I click the "Create" button
    And I wait for "CsvJmxRmi" will be visible
    And I set the parameter "CsvJmxRmi" with value "192.168.1.113:7070"
    And I set the parameter "CsvapplicationName" with value "192.168.1.114:7070"
    And I set the parameter "CsvUser" with value "192.168.1.115:7070"
    And I set the parameter "CsvPassword" with value "192.168.1.116:7070"
    And I click the "Csvcertain" button
    And I click the "CsvSave" button

  Scenario: Csv文件编辑HostConnectInput
    And I move the mouse pointer to the "CsvConfing"
    When I click the "HostConnectInput" button
    And I wait for "Csvedit" will be visible
    And I click the "Csvedit" button
    And I set the parameter "CsvJmxRmi" with value "192.168.1.113:7071"
    And I set the parameter "CsvapplicationName" with value "192.168.1.114:7072"
    And I set the parameter "CsvUser" with value "192.168.1.115:7073"
    And I set the parameter "CsvPassword" with value "192.168.1.116:7074"
    And I click the "Csvcertain" button
    And I click the "CsvSave" button

  Scenario: Csv文件删除HostConnectInput
    And I move the mouse pointer to the "CsvConfing"
    When I click the "HostConnectInput" button
    And I wait for "Csvdelete" will be visible
    And I click the "Csvdelete" button
    And I click the "Ensure" button
    And I wait for "CsvSave" will be visible
    And I click the "CsvSave" button
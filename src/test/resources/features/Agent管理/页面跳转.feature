@agent2 @agent_jump
Feature: Agent页面跳转

  Background:
    Given open the "agent.ListPage" page for uri "/sources/input/agent/"
    And I wait for loading invisible
    When I click the detail which column is "1" in agent page
    And switch to another window
    And I will see the "agent.CreatePage" page
    And I wait for loading invisible
    And I click the "Create" button
    And I click the "SyslogType" button
    And I set the parameter "Listenaddress" with value "192.168.1.160:514"
    And I click the "Next" button
    And I click the "AddNewMap" button
    And I set the parameter "Syslogip" with value "192.168.1.134"
    And I set the parameter "Syslogappname" with value "autotestjump"
    And I set the parameter "Syslogtag" with value "autotestjump"
    And I click the "Next" button
    And I will see the element "CheckListenaddress" name is "192.168.1.160:514"
    And I click the "Next" button
    And I will see the element "Addsuccessmsg" name is "添加成功"
    And I close all tabs except main tab

  Scenario: 跳转到Agent具体配置页面
    And I click the "CurrentConfiguration" button
    Then the page's title will be "Agent 具体配置"
    Then the data name "192.168.1.160:514" in table "SyslogTable" then i click the "删除" button
    And I click the "Ensure" button
    Then I will see the element "ChangeMemo" name is "删除 Agent 配置成功。"
    And I close all tabs except main tab

  Scenario: 跳转到Agent添加数据源页面
    And I click the "ContinueAdd" button
    Then the page's title will be "Agent 添加数据"
    And I click the "Backup" button
    And I wait for loading invisible
    Then the data name "192.168.1.160:514" in table "SyslogTable" then i click the "删除" button
    And I click the "Ensure" button
    Then I will see the element "ChangeMemo" name is "删除 Agent 配置成功。"
    And I close all tabs except main tab

  Scenario: 跳转到批量配置数据源
    And I click the "ConfigDatasource" button
    Then I will see the element "ConfigDatasourceMsg" name is "将数据源分发至"
    And I click the "Cancle" button
    And I click the "CurrentConfiguration" button
    Then the data name "192.168.1.160:514" in table "SyslogTable" then i click the "删除" button
    And I click the "Ensure" button
    Then I will see the element "ChangeMemo" name is "删除 Agent 配置成功。"
    And I close all tabs except main tab

  Scenario: 跳转到字段提取页面
    And I click the "Datafetch" button
    Then the page's title will be "字段提取"
    Given open the "agent.ListPage" page for uri "/sources/input/agent/"
    And I wait for loading invisible
    When I click the detail which column is "1" in agent page
    And switch to another window
    And I will see the "agent.CreatePage" page
    Given the data name "192.168.1.160:514" in table "SyslogTable" then i click the "删除" button
    And I click the "Ensure" button
    Then I will see the element "ChangeMemo" name is "删除 Agent 配置成功。"
    And I close all tabs except main tab
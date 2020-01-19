Feature: 添加数据源

  Background:
    Given open the "agent.ListPage" page for uri "/sources/input/agent/"
    And I wait for loading invisible
    When I click the detail which column is "1" in agent page
    And switch to another window
    And I will see the "agent.CreatePage" page

  Scenario: Syslog配置添加新映射
    And I click the "Create" button
    And I click the "SyslogType" button
    And I set the parameter "Listenaddress" with value "192.168.1.161:514"
    And I click the "Next" button
    And I wait for loading invisible
    And I click the "Next" button
    And I will see the element "MemoMessage" name is "请至少添加一个映射。"
    And I click the "Ensure" button
    And I click the "AddNewMap" button
    And I set the parameter "Syslogip" with value "192.168.1.134"
    And I set the parameter "Syslogappname" with value "autohekaSyslog"
    And I set the parameter "Syslogtag" with value "autohekaSyslog"
    And I click the "Next" button
    And I will see the element "CheckListenaddress" name is "192.168.1.161:514"
#    And I will see the element "CheckMap" name is "[{"ip":"192.168.1.134","appname":"autohekaSyslog","tag":"autohekaSyslog","charset":"utf-8"}]"
    And I click the "Next" button
    And I will see the element "Addsuccessmsg" name is "添加成功"
    And I click the "CurrentConfiguration" button
    Given the data name "192.168.1.161:514" in table "SyslogTable" then i click the "编辑" button
    And I click the "AddNewMap" button


  Scenario: Syslog数据源删除
    Given the data name "UdpInput" in table "SyslogTable" then i click the "删除" button
    And I click the "Ensure" button
    Then I will see the element "ChangeMemo" name is "删除 Agent 配置成功。"
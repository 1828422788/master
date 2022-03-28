@agentConfig @agent_more

Feature: Agent更多操作

  Background:
    Given open the "agent.ListPage" page for uri "/sources/input/agent/"
    And I wait for loading invisible
    And I zoom the browse to full screen
    And I close all tabs except main tab
    And I click the "More" button

  Scenario: Agent导出Agent分组信息
    And I click the "AgentExportButton" button

  Scenario: Agent下载软件到本地-windows
    And I click the "AgentExportGUIButton" button
    And I click the "WindowsGUIButton" button

  Scenario: Agent下载软件到本地-Mac
    And I click the "AgentExportGUIButton" button
    And I click the "MacOsGUIButton" button
    And I wait for "10000" millsecond

  Scenario: Agent下载安装包-linux
    And I click the "AgentDownloadButton" button
    And I click the "CopyLinux" button

  Scenario: Agent下载安装包-windows
    And I click the "AgentDownloadButton" button
    And I click the "DownloadFile" button



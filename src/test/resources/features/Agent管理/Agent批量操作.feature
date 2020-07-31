@agent3 @agent_multi

Feature: Agent批量操作

  Background:
    Given open the "agent.ListPage" page for uri "/sources/input/agent/"
    And I wait for loading invisible
    And I close all tabs except main tab

  Scenario:  Agent批量操作空操作
    And I click the "AgentMultiButton" button
    And I will see the message "请务必选择至少一个 Agent 进行操作。"
@agent3 @agent_multi

Feature: Agent批量操作

  Background:
    Given open the "agent.ListPage" page for uri "/sources/input/agent/"
    And I wait for loading invisible
    And I close all tabs except main tab

  Scenario:  Agent批量操作空操作
    And I click the "AgentMultiButton" button
#    And I will see the message "请务必选择至少一个 Agent 进行操作。"

  Scenario Outline: Agent批量操作加入分组
    And I click the "AgentMultiButton" button
    When the column is "1" then i "checked" the agent label in agent page
    And I click the "AgentMultiCHooseButton" button
    And I click the "MemoButton" button
    And I set the parameter "Memo" with value "<memory>"
    And I click the "MemoEnsure" button
    And  I wait for loading invisible
    Then I will see the search result contains "{'column':'3','name':'<memory>'}"

    Examples: 备注成功
      | memory  |
      | 中文中文    |
      | test    |
      | *A￥,%&^ |
      | 68      |

  Scenario:  Agent批量操作停止采集数据
    And I click the "AgentMultiButton" button
    When the column is "1" then i "checked" the agent label in agent page
    And I click the "AgentMultiCHooseButton" button
    And I click the "Stop" button
    And I will see the message "您选中的 Agents 将停止采集数据，是否继续？"
    And I click the "CancelButton" button
#    And I wait for "30000" millsecond
#    Then I will see the element "" name contain



@agent3 @agent_multi

Feature: Agent批量操作

  Background:
    Given open the "agent.ListPage" page for uri "/sources/input/agent/"
    And I wait for loading invisible
    And I close all tabs except main tab

  Scenario:  Agent批量操作空操作
    And I click the "AgentMultiButton" button
    And I will see the message "请务必选择至少一个 Agent 进行操作。"

  Scenario Outline: Agent批量操作加入分组
    When the column is "1" then i "checked" the agent label in agent page
    And I click the "AgentMultiButton" button
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

#  Scenario:  Agent批量操作空操作
#    And I click the "AgentMultiButton" button
#    And I click the "Stop" button
#    And I will see the element "Addsuccessmsg" name is "添加 Agent 分组成功"

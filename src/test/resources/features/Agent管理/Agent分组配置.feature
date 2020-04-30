Feature: Agent分组设置

  Background:
    Given open the "agent.ListPage" page for uri "/sources/input/agent/"
    And I wait for loading invisible
    And I close all tabs except main tab

  Scenario Outline: 新建Agent分组设置
    And I click the "AgentGroupButton" button
    And open the "agent.GroupPage" page for uri "/sources/input/agent/group/"
    And switch to another window
    And I close all tabs except main tab
    And I wait for loading invisible
    And I click the "CreateAgentGroupButton" button
    And I set the parameter "Name" with value "<name>"
    When I set the parameter "Description" with value "<description>"
    And I choose the "<role>" from the "Role"
    And I click the "Save" button
    And I will see the element "Addsuccessmsg" name is "添加 Agent 分组成功"

#  @indexSettingSmoke
    Examples: 成功
      | name       | description | role      |
      | sunxctest  | English     | __admin__ |

  Scenario Outline: Agent分组添加ip
    Then the column is "1" then i click the "分组" button in agent page
    And  I wait for loading invisible
    And I click the "GroupButton" button
    Then I will see the element "GroupMemo" name is "<message>"
    And I click the "FinishButton" button
    And I click the "AgentGroupButton" button
    And open the "agent.GroupPage" page for uri "/sources/input/agent/group/"
    And switch to another window
    And I close all tabs except main tab
    And I wait for loading invisible
    And I click the "OpenGroupButton" button
    And I click the "Addgroupinput" button
    And I click the "Addgroupinputbutton" button

#  @indexSettingSmokes
    Examples:
      | message              |
      | 成功加入分组 [ sunxctest ] |
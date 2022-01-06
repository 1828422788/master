@agent_group @agent2
Feature: Agent分组设置

  Background:
    Given open the "agent.ListPage" page for uri "/sources/input/agent/"
    And I wait for loading invisible
    And I zoom the browse to full screen

  Scenario Outline: 新建Agent分组设置成功
    Given open the "agent.GroupPage" page for uri "/agent/agentgroup/"
    And I wait for loading complete
    And I click the "CreateAgentGroupButton" button
    And I set the parameter "Name" with value "<name>"
    When I set the parameter "Description" with value "<description>"
    And I wait for loading invisible
    And I click the "Save" button
    And I wait for "Addsuccessmsg" will be visible
    And I will see the element "Addsuccessmsg" name is "添加 Agent 分组成功"

    Examples: 成功
      | name       | description | role      |
      | sunxctest  | English     | __admin__ |
      | 中文角色       | 中文          | __admin__ |
      | sunxc_test |             | __admin__ |

  Scenario: Agent分组重名新建失败
    Given open the "agent.GroupPage" page for uri "/agent/agentgroup/"
    And I wait for loading complete
    And I click the "CreateAgentGroupButton" button
    And I set the parameter "Name" with value "sunxctest"
    And I click the "Save" button
    And I wait for "Addfailmsg" will be visible


  Scenario: Agent分组未填写名称新建失败
    Given open the "agent.GroupPage" page for uri "/agent/agentgroup/"
    And I wait for loading complete
    And I click the "CreateAgentGroupButton" button
    And I click the "Save" button
    Then I will see the element "searchInput" name is "请务必输入此条目"

  Scenario Outline: Agent分组添加和跳转
    And I will see the "agent.ListPage" page
    And I click the "AgentMultiButton" button
    Then the column is "0" then i click the "分组" button in agent page
    And  I wait for loading invisible
    And I click the "GroupButton" button
    Then I will see the element "GroupMemo" name is "<message>"
    And I click the "FinishGroupButton" button
    And I click the "OpenGroupButton" button

    Examples:
      | message              |
      | 成功加入分组 [ sunxctest ] |

#  Scenario: Agent从分组设置页面跳转
#    And I will see the "agent.ListPage" page
#    And I click the "OpenGroupButton" button
##    And I click the "More" button
##    And I click the "Jump" button
##    And switch to another window
##    And I close all tabs except main tab
##    And I wait for loading invisible
#    Then I will see the agent search result contains "0"

  Scenario Outline: Agent移出分组
    And I will see the "agent.ListPage" page
    And I click the "AgentMultiButton" button
    Then the column is "1" then i click the "分组" button in agent page
    And  I wait for loading invisible
    And I click the "MoveGroupButton" button
    Then I will see the element "GroupMemo" name is "<message>"
    And I click the "FinishGroupButton" button

    Examples:
      | message              |
      | 成功移出分组 [ sunxctest ] |


  Scenario Outline: Agent批量操作加入分组
    And I click the "AgentMultiButton" button
    When the column is "0" then i "checked" the agent label in agent page
    And I click the "AgentMultiCHooseButton" button
    And I click the "MultiGruopButton" button
    And I click the "GroupButton" button
    Then I will see the element "GroupMemo" name is "<message>"
    And I click the "FinishGroupButton" button
    And I click the "OpenGroupButton" button
    And I wait for loading invisible
    Then I will see the agent search result contains "0"

    Examples:
      | message              |
      | 成功加入分组 [ sunxctest ] |

  Scenario Outline: Agent批量操作移出分组
    And I click the "AgentMultiButton" button
    When the column is "0" then i "checked" the agent label in agent page
    And I click the "AgentMultiCHooseButton" button
    And I click the "MultiGruopButton" button
    And I click the "MoveGroupButton" button
    Then I will see the element "GroupMemo" name is "<message>"
    And I click the "FinishGroupButton" button

    Examples:
      | message              |
      | 成功移出分组 [ sunxctest ] |

  Scenario Outline: 编辑Agent资源分组
    Given open the "agent.GroupPage" page for uri "/agent/agentgroup/"
    And I wait for loading invisible
    And I click the "OpenGroupButton" button
    And I set the parameter "Name" with value "<name>"
    When I set the parameter "Description" with value "<description>"
    And I click the "Update" button
    And I wait for "Addsuccessmsg" will be visible
    Then I will see the element "Addsuccessmsg" name is "<updatemessage>"

    Examples: 更新分组信息
      | name      | description | updatemessage |
      | sunxctest | test描述      | 更新 Agent 分组成功 |
      | sunxctest | English     | 更新 Agent 分组成功 |
      | 中文中文      | English     | 更新 Agent 分组成功 |


  Scenario Outline: 删除Agent分组
    Given open the "agent.GroupPage" page for uri "/agent/agentgroup/"
    And I wait for loading invisible
    And I click the "<name>" button
    And I click the "More" button
#    在3.8中没有更多的设置，直接将more定位到删除图标上面了！！！
#    And I wait for "Delete" will be visible
#    And I click the "Delete" button
    And I click the "Ensure" button
    And I wait for "Addsuccessmsg" will be visible
    Then I will see the element "Addsuccessmsg" name is "删除 Agent 分组成功"

    Examples: 模糊搜索ip过滤成功

      | name        |
      | Deleteone   |
      | Deletetwo   |
      | Deletethree |




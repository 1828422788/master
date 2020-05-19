@agent_group @agent2
Feature: Agent分组设置

  Background:
    Given open the "agent.ListPage" page for uri "/sources/input/agent/"
    And I wait for loading invisible
    And I close all tabs except main tab

  Scenario Outline: 新建Agent分组设置成功
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
      | 中文角色       | 中文          | __admin__ |
      | sunxc_test |             | __admin__ |

  Scenario: Agent分组重名新建失败
    And I click the "AgentGroupButton" button
    And open the "agent.GroupPage" page for uri "/sources/input/agent/group/"
    And switch to another window
    And I close all tabs except main tab
    And I wait for loading invisible
    And I click the "CreateAgentGroupButton" button
    And I set the parameter "Name" with value "sunxctest"
#    When I set the parameter "Description" with value "<description>"
    And I choose the "__admin__" from the "Role"
    And I click the "Save" button
    Then I will see the message "操作失败，原因：1062-Duplicate entry '1-sunxctest' for key 'domain_id_name'"

  Scenario: Agent分组未填写名称新建失败
    And I click the "AgentGroupButton" button
    And open the "agent.GroupPage" page for uri "/sources/input/agent/group/"
    And switch to another window
    And I close all tabs except main tab
    And I wait for loading invisible
    And I click the "CreateAgentGroupButton" button
#    When I set the parameter "Description" with value "<description>"
    And I choose the "__admin__" from the "Role"
    And I click the "Save" button
    Then I will see the element "searchInput" name is "请输入名称"

  Scenario: Agent分组未填写角色新建失败
    And I click the "AgentGroupButton" button
    And open the "agent.GroupPage" page for uri "/sources/input/agent/group/"
    And switch to another window
    And I close all tabs except main tab
    And I wait for loading invisible
    And I click the "CreateAgentGroupButton" button
    And I set the parameter "Name" with value "sunxctest2"
#    When I set the parameter "Description" with value "<description>"
    And I click the "Save" button
    Then I will see the element "searchRole" name is "请选择角色"

  Scenario Outline: Agent分组添加和跳转
    Then the column is "1" then i click the "分组" button in agent page
    And  I wait for loading invisible
    And I click the "GroupButton" button
    Then I will see the element "GroupMemo" name is "<message>"
    And I click the "FinishButton" button
    And I click the "OpenGroupButton" button
    Then I will see the agent search result contains "1"

#  @indexSettingSmokes
    Examples:
      | message              |
      | 成功加入分组 [ sunxctest ] |

  Scenario Outline: Agent从分组设置页面跳转
    And I click the "AgentGroupButton" button
    And open the "agent.GroupPage" page for uri "/sources/input/agent/group/"
    And switch to another window
    And I close all tabs except main tab
    And I wait for loading invisible
    And I click the "OpenGroupButton" button
    And I click the "More" button
    And I click the "Jump" button
    And switch to another window
    And I close all tabs except main tab
    Then I will see the agent search result contains "1"

#  @indexSettingSmokes
    Examples:
      | message              |
      | 成功加入分组 [ sunxctest ] |

  Scenario Outline: Agent移出分组
    Then the column is "1" then i click the "分组" button in agent page
    And  I wait for loading invisible
    And I click the "MoveGroupButton" button
    Then I will see the element "GroupMemo" name is "<message>"
    And I click the "FinishButton" button
#    And I click the "OpenGroupButton" button
#    Then I will see the agent doesn't exist in "1" cloumn

    Examples:
      | message              |
      | 成功移出分组 [ sunxctest ] |

  Scenario Outline: cenario Outline:  Agent批量操作空操作
    And I click the "AgentMultiButton" button
    And I will see the message "请务必选择至少一个 Agent 进行操作。"
    Then I click the "EnsureButton" button
    Examples:
      | message              |
      | 成功移出分组 [ sunxctest ] |

  Scenario Outline: Agent批量操作加入分组
    When the column is "1" then i "checked" the agent label in agent page
    And I click the "AgentMultiButton" button
    And I click the "MultiGruopButton" button
    And I click the "GroupButton" button
    Then I will see the element "GroupMemo" name is "<message>"
    And I click the "FinishButton" button
    And I click the "OpenGroupButton" button
    Then I will see the agent search result contains "1"

    Examples:
      | message              |
      | 成功加入分组 [ sunxctest ] |

  Scenario Outline: Agent批量操作移出分组
    When the column is "1" then i "checked" the agent label in agent page
    And I click the "AgentMultiButton" button
    And I click the "MultiGruopButton" button
    And I click the "MoveGroupButton" button
    Then I will see the element "GroupMemo" name is "<message>"
    And I click the "FinishButton" button

#    Then I will see the agent search result not contains "1"

    Examples:
      | message              |
      | 成功移出分组 [ sunxctest ] |

  Scenario Outline: 编辑Agent资源分组
    And I click the "AgentGroupButton" button
    And open the "agent.GroupPage" page for uri "/sources/input/agent/group/"
    And switch to another window
    And I close all tabs except main tab
    And I wait for loading invisible
    And I click the "OpenGroupButton" button
    And I set the parameter "Name" with value "<name>"
    When I set the parameter "Description" with value "<description>"
    And I click the "Update" button
    Then I will see the element "Addsuccessmsg" name is "<updatemessage>"


    Examples: 更新分组信息
      | name      | description | updatemessage |
      | sunxctest | test描述      | 更新 Agent 分组成功 |
      | sunxctest | English     | 更新 Agent 分组成功 |
      | 中文中文      | English     | 更新 Agent 分组成功 |


  Scenario Outline: 删除Agent分组
    And I click the "AgentGroupButton" button
    And open the "agent.GroupPage" page for uri "/sources/input/agent/group/"
    And switch to another window
    And I close all tabs except main tab
    And I wait for loading invisible
    And I click the "<name>" button
    And I click the "More" button
    And I click the "Delete" button
    And I click the "Ensure" button
    Then I will see the element "Addsuccessmsg" name is "删除 Agent 分组成功"


    Examples: 模糊搜索ip过滤成功

      | name        |
      | Deleteone   |
      | Deletetwo   |
      | Deletethree |




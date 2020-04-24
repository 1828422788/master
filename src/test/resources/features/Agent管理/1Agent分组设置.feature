@agent_group
Feature: Agent分组设置

  Background:
    Given open the "agent.ListPage" page for uri "/sources/input/agent/"
    And I wait for loading invisible
    And I close all tabs except main tab

  Scenario Outline: 新建Agent分组设置成功
    And I click the "AgentGroupButton" button
    And open the "agent.GroupPage" page for uri "/sources/input/agent/group/"
    And switch to another window
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

  Scenario Outline: Agent移出分组
    Then the column is "1" then i click the "分组" button in agent page
    And  I wait for loading invisible
    And I click the "GroupButton" button
    Then I will see the element "GroupMemo" name is "<message>"
    And I click the "FinishButton" button
    And I click the "OpenGroupButton" button
    Then I will see the agent doesn't exist in "1" cloumn

    Examples:
      | message              |
      | 成功移出分组 [ sunxctest ] |

  Scenario Outline: Agent批量操作空操作&加入分组
    And I click the "AgentMultiButton" button
#    Then I will see the element value in json "{'PreviewMessage':'请以字母、数字、中文或下划线为元素,tags 之间可用 "," 分隔。'}"
    And I will see the message "请务必选择至少一个 Agent 进行操作。"
    Then I click the "EnsureButton" button
    When the column is "1" then i "checked" the agent label in agent page
    And I click the "AgentMultiButton" button
    And I click the "MultiGruopButton" button
    And I click the "GroupButton" button
    Then I will see the element "GroupMemo" name is "<message>"
    And I click the "FinishButton" button
    Given open the "agent.GroupPage" page for uri "/sources/input/agent/group/"
    Then the data name is "<name>" then i will see "编辑 跳转 删除" button
    And the data name is "<name>" then i click the "跳转" button
    Then I will see the agent search result contains "1"


    Examples:
      | name      | message              |
      | sunxctest | 成功加入分组 [ sunxctest ] |

  Scenario Outline: Agent批量操作移出分组
    When the column is "1" then i "checked" the agent label in agent page
    And I click the "AgentMultiButton" button
    And I click the "MultiGruopButton" button
    And I click the "GroupButton" button
    Then I will see the element "GroupMemo" name is "<message>"
    And I click the "FinishButton" button
    Given open the "agent.GroupPage" page for uri "/sources/input/agent/group/"
    Then the data name is "<name>" then i will see "编辑 跳转 删除" button
    And the data name is "<name>" then i click the "跳转" button


#    Then I will see the agent search result not contains "1"

    Examples:
      | name      | message              |
      | sunxctest | 成功移出分组 [ sunxctest ] |

  Scenario Outline: 编辑Agent资源分组
    And I click the "AgentGroupButton" button
    And open the "agent.GroupPage" page for uri "/sources/input/agent/group/"
    And switch to another window
    And I wait for loading invisible
    Given the data name is "{'column':'1','name':'English'}" then i click the "编辑" button
    Then I will see the "agent.NewGroupPage" page
    And I click the "ReturnButton" button
    And I will see the "agent.GroupPage" page
    And I wait for loading invisible
    Given the data name is "{'column':'1','name':'English'}" then i click the "编辑" button
    Then I will see the "agent.NewGroupPage" page
    And I set the parameter "Name" with value "<name>"
    When I set the parameter "Description" with value "<description>"
    And I click the "SaveButton" button
    Then I will see the element "Updatemsg" name is "<updatemessage>"


    Examples: 更新分组信息
      | name          | description | updatemessage |
      | sunxctesttest | English     | 保存成功          |
      | 中文中文          | English     | 保存成功          |

  Scenario Outline: 模糊搜索Agent分组
    And I click the "AgentGroupButton" button
    And open the "agent.GroupPage" page for uri "/sources/input/agent/group/"
    When I set the parameter "Name" with value "<name>"
    And  I wait for loading invisible
    Then I will see the search result contains "{'column':'0','name':'<correctName>'}"

    Examples: 模糊搜索ip过滤成功

      | name  | correctName |
      | sunxc | sunxc_test  |
      | 中文    | 中文中文        |

  Scenario Outline: 删除Agent分组
    And I click the "AgentGroupButton" button
    And open the "agent.GroupPage" page for uri "/sources/input/agent/group/"
    And switch to another window
    And I wait for loading invisible
    Given the data name is "{'column':'0','name':'<name>'}" then i click the "删除" button
    And I click the "ContainEnsure" button
    Examples:
      | name       |
      | sunxc_test |
      | 中文中文       |
      | 中文角色       |





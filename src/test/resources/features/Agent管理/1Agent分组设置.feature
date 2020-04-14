@agent
Feature: Agent分组设置

  Background:
    Given open the "agent.ListPage" page for uri "/sources/input/agent/"
    And I wait for loading invisible
    And I close all tabs except main tab
    And I click the "AgentGroupButton" button
    And open the "agent.GroupPage" page for uri "/sources/input/agent/group/"


  Scenario Outline: 新建Agent分组设置成功
    And switch to another window
    And I wait for loading invisible
    And I click the "CreateAgentGroupButton" button
    And open the "agent.NewGroupPage" page for uri "/sources/input/agent/group/new/"
    And I set the parameter "Name" with value "<name>"
    When I set the parameter "Description" with value "<description>"
    And I choose the "<role>" from the "Role"
    And I click the "BuildButton" button
    Then I will see the message "<message>"
    And I click the "EnsureButton" button
    And I wait for loading invisible
    Then I will see the search result contains "{'column':'0','name':'<name>'}"

#  @indexSettingSmoke
    Examples: 成功
      | name       | description | role      | message |
      | sunxctest  | English     | __admin__ | 创建成功    |
      | 中文角色       | 中文          | __admin__ | 创建成功    |
      | sunxc_test |             | __admin__ | 创建成功    |


  Scenario Outline: 新建Agent分组设置失败
    And switch to another window
    And I wait for loading invisible
    And I click the "CreateAgentGroupButton" button
    And open the "agent.NewGroupPage" page for uri "/sources/input/agent/group/new/"
    And I set the parameter "Name" with value "<name>"
    When I set the parameter "Description" with value "<description>"
    And I choose the "<role>" from the "Role"
    And I click the "BuildButton" button
    Then I will see the message "<message>"

    Examples: 失败
      | name      | description | role      | message                                                           |
      | sunxctest |             |           | 请分配角色                                                             |
      |           |             |           | 填写资源分组名称                                                          |
      |           |             | __admin__ | 填写资源分组名称                                                          |
      | sunxctest |             | __admin__ | 保存失败: 1062-Duplicate entry '1-sunxctest' for key 'domain_id_name' |


  Scenario Outline: 编辑Agent资源分组
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
    When I set the parameter "Name" with value "<name>"
    And  I wait for loading invisible
    Then I will see the search result contains "{'column':'0','name':'<correctName>'}"

    Examples: 模糊搜索ip过滤成功

      | name  | correctName |
      | sunxc | sunxc_test   |
      | 中文    | 中文中文        |

  Scenario Outline: 删除Agent分组
    And switch to another window
    And I wait for loading invisible
    Given the data name is "{'column':'0','name':'<name>'}" then i click the "删除" button
    And I click the "ContainEnsure" button
    Examples:
      | name       |
      | sunxc_test |
      | 中文中文       |
      | 中文角色       |





@topology @all
Feature: 拓扑图新建（RZY-346至348）

  Background:
    Given open the "topology.ListPage" page for uri "/topology/"

  Scenario Outline: 成功新建拓扑图（RZY-346）
    When I click the "CreateButton" button
    And I set the parameter "NameInput" with value "<name>"
    And I choose the "<group>" from the "GroupInput"
    And I click the "EnsureButton" button

  @smoke @topologySmoke
    Examples:
      | name        | group            |
      | sxjautotest | default_Topology |

  @second
    Examples:
      | name            | group            |
      | 测试标识符           | default_Topology |
      | auto_topology样例 | default_Topology |

  Scenario Outline: 新建拓扑图失败（RZY-347至348）
    When I click the "CreateButton" button
    And I set the parameter "NameInput" with value "<name>"
    And I choose the "<group>" from the "GroupInput"
    And I click the "EnsureButton" button
    Then I will see the <message>

    Examples:
      | name             | group            | message                             |
      |                  |                  | error message "请输入拓扑图名称"            |
      | 我是超出长度的名称哦我有十六个字 | default_Topology | error message "名称太长, 请输入小于32个字符的名称" |
@topology @all
Feature: 拓扑图新建（RZY-346至348）

  Background:
    Given open the "topology.ListPage" page for uri "/topology/"

  Scenario Outline: 成功新建拓扑图（RZY-346）
    When I click the "Create" button
    And I set the parameter "NameInput" with value "<name>"
    And I set the parameter "TagInput" with value "<Type>"
    And I choose the "<Type>" from the "TagDropdown"
    And I click the "Ensure" button

  @smoke @topologySmoke
    Examples:
      | name        | Type             |
      | sxjautotest | default_Topology |

  @second @topologySmoke
    Examples:
      | name            | Type             |
      | 测试标识符           | default_Topology |
      | auto_topology样例 | default_Topology |

  Scenario Outline: 新建拓扑图失败（RZY-347至348）
    When I click the "Create" button
    And I set the parameter "NameInput" with value "<name>"
    And I click the "Ensure" button
    Then I will see the <message>

    Examples:
      | name | message               |
      |      | error message "请输入名称" |

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

    Examples:
      | name        | Type             |
      | 拓扑图AutoTest | default_Topology |

  Scenario Outline: 新建拓扑图（不包含标签）
    When I click the "Create" button
    And I set the parameter "NameInput" with value "<name>"
    And I click the "Ensure" button

    Examples:
      | name   |
      | 拓扑图无标签 |

  Scenario Outline: 新建拓扑图失败（RZY-347至348）
    When I click the "Create" button
    And I set the parameter "NameInput" with value "<name>"
    And I click the "Ensure" button
    Then I will see the <message>

    Examples:
      | name | message               |
      |      | error message "请输入名称" |

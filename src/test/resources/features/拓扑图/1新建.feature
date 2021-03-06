@topology @all
Feature: 拓扑图新建

  Background:
    Given open the "topology.ListPage" page for uri "/topology/"

  @topologySmoke
  Scenario Outline: 成功新建拓扑图
    When I click the "Create" button
    And I set the parameter "NameInput" with value "<name>"
    And I choose the new value "AutoTestTag" from the "TagField"
    And I click the "Ensure" button
    And I wait for "SuccessMessage" will be visible

    Examples:
      | name        |
      | 拓扑图AutoTest |

  @topologySmoke
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
      |      | error message "请填写拓扑图名称!" |

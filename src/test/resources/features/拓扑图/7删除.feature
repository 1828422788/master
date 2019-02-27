Feature: 拓扑图删除（RZY-350）

  Background:
    Given open the "topology.ListPage" page for uri "/topology/"

  Scenario Outline:
    Given the data name is "<name>" then i click the "删除" button
    And I click the "Ensure" button

  @clean
    Examples:
      | name            |
      | 八种布局方式          |
      | auto_topology样例 |
      | 测试标识符           |
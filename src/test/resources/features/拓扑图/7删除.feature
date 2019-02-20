Feature: 拓扑图删除（RZY-350）

  Background:
    Given open the "topology.ListPage" page for uri "/topology/"

  Scenario Outline:
    Given the data name is "<name>" then i click the "删除" button
    And I click the "Ensure" button

  @topology @all @smoke @topologySmoke
    Examples:
      | name     |
      | autotest |

  @clean
    Examples:
      | name            |
      | auto_topology样例 |
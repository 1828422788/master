@topology @all
Feature: 拓扑图删除（RZY-350）

  Background:
    Given open the "topology.ListPage" page for uri "/topology/"
    And I wait for loading invisible

  Scenario Outline:
    Given the data name is "<name>" then i click the "删除" button in more menu
    And I wait for "Ensure" will be visible
    And I click the "Ensure" button

    Examples:
      | name        |
      | 拓扑图没有标签     |
      | 拓扑图AutoTest |


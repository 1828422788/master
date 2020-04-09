@topology @all
Feature: 拓扑图重命名（RZY-352）

  Background:
    Given open the "topology.ListPage" page for uri "/topology/"

  Scenario Outline:
    Given the data name is "<name>" then i click the "重命名" button
    Then I set the parameter "NameInput" with value "<newName>"
    Then I click the "Ensure" button
    Then I will see the search result contains "<newName>"

  @smoke @topologySmoke
    Examples: 重命名成功
      | name        | newName |
      | sxjautotest | 八种布局方式  |


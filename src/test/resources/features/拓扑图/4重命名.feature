@topology @all
Feature: 拓扑图重命名（RZY-352）

  Background:
    Given open the "topology.ListPage" page for uri "/topology/"

  Scenario Outline:
    Given the data name is "拓扑图无标签" then i click the "重命名" button
    Then I set the parameter "NameInput" with value "拓扑图没有标签"
    Then I click the "Ensure" button
    And I refresh the website
    And I wait for loading invisible
    Then I will see the search result contains "<newName>"

  @smoke @topologySmoke
    Examples: 重命名成功
      | newName |
      | 拓扑图没有标签 |


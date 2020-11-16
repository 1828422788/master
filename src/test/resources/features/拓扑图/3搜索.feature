@topology @all @smoke @topologySmoke
Feature: 拓扑图搜索（RZY-354至355）

  Background:
    Given open the "topology.ListPage" page for uri "/topology/"
    And I wait for loading invisible

  Scenario Outline: 根据分组搜索（RZY-355）
    Given I choose the "<group>" from the "ResourceDropdown"
    And I wait for loading invisible
    Then I will see the search result contains "{'column':'0','name':'<name>'}"
    Then I will see the search result "{'column':'0','name':'拓扑图无标签','contains':'no'}"

    Examples:
      | group       | name        |
      | AutoTestTag | 拓扑图AutoTest |

  Scenario Outline: 根据输入内容搜索（RZY-354）
    Given I set the parameter "SearchInput" with value "<name>"
    And I click the "SearchIcon" button
    And I wait for loading invisible
    Then I will see the search result "{'column':'0','name':'<name>'}"
    Then I will see the search result "{'column':'0','name':'拓扑图无标签','contains':'no'}"

    Examples:
      | name        |
      | 拓扑图AutoTest |
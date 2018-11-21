@topology @all @smoke @topologySmoke
Feature: 拓扑图搜索

  Background:
    Given open the "topology.ListPage" page for uri "/topology/"

  Scenario Outline: 根据分组搜索
    Given I choose the "<group>" from the "GroupDropdownList"
    And I wait for loading invisible
    Then I will see the search result contains "{'column':'0','name':'<name>'}"

    Examples:
      | group            | name        |
      | default_Topology | sxjautotest |

  Scenario Outline: 根据输入内容搜索
    Given I set the search input with "<name>"
    Then I will see the search result "{'column':'0','name':'<name>'}"

    Examples:
      | name     |
      | autotest |


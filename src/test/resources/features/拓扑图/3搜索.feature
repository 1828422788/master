@topology @all @smoke @topologySmoke
Feature: 拓扑图搜索

  Background:
    Given open the "topology.ListPage" page for uri "/topology/"

  Scenario Outline:
    Given I choose the "<group>" from the "GroupDropdownList"
    And I wait for loading invisible
    Then I will see the column number "2" contains "<group>"
    Then I choose the "全部资源" from the "GroupDropdownList"
    And I wait for loading invisible
    Then I set the search input with "<name>"
    Then I will see the column number "1" contains "<name>"

    Examples:
      | group            | name        |
      | default_Topology | sxjautotest |

#@topology @all @smoke @topologySmoke
Feature: 拓扑图分组（RZY-353）

  Background:
    Given open the "topology.ListPage" page for uri "/topology/"

  Scenario Outline:
    Given the data name is "sxjautotest" then i click the "分组" button
    Then I <group>
    And I click the "EnsureButton" button
    Then I will see the error message "请至少选择一个分组"

    Examples:
      | group                                                     |
      | cancel selection "default_Topology" from the "GroupInput" |
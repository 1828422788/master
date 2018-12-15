@topology @all @smoke @topologySmoke
Feature: 拓扑图分组

  Background:
    Given open the "topology.ListPage" page for uri "/topology/"

  Scenario Outline:
    Given the data name is "sxjautotest" then i click the "分组" button
    Then I <group>
    And I click the "EnsureButton" button
    Then I will see the success message "保存成功"

    Examples:
      | group                                                                           |
      | cancel selection "default_Topology" from the "GroupInput"                       |
      | choose the "AutoTestRoleWithAllResource,default_Topology" from the "GroupInput" |
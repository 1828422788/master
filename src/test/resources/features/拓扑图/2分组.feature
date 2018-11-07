@topology @all @smoke @topologySmoke
Feature: 拓扑图分组

  Background:
    Given open the "topology.ListPage" page for uri "/topology/"

  Scenario Outline:
    Given the data name is "<name>" then i click the "分组" button
    Then I cancel selection "<group>" from the "GroupInput"
    And I click the "EnsureButton" button
    Then I will see the error message "请选择拓扑图分组"
    Then I click the "Ensure" button
    And I choose the "<newGroup>" from the "GroupInput"
    Then I click the "EnsureButton" button
    Then I will see the success message "保存成功"
    And I refresh the website
    And I wait for loading invisible
    Then I will see the data "<name>" values "{'column':'2','name':'<newGroup>'}"

    Examples:
      | name        | group            | newGroup                                  |
      | sxjautotest | default_Topology | AutoTestWithAllResource, default_Topology |

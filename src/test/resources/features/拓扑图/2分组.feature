@topology @all @smoke @topologySmoke
Feature: 拓扑图标签（RZY-353）

  Background:
    Given open the "topology.ListPage" page for uri "/topology/"

  Scenario: 修改标签
    Given the data name is "拓扑图AutoTest" then i click the "标签" button
    And I set the parameter "Tag" with value "AutoTestTag"
    And I choose the "AutoTestTag" from the "TagDropdown"
    And I click the "Ensure" button
    Then I will see the success message "修改成功"

  Scenario: 验证标签修改成功
    When the data name is "拓扑图AutoTest" then i will see "AutoTestTag" button


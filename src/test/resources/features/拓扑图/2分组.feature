@topology @all @smoke @topologySmoke
Feature: 拓扑图标签（RZY-353）

  Background:
    Given open the "topology.ListPage" page for uri "/topology/"
    And I wait for loading invisible

  Scenario: 修改标签
    Given the data name is "拓扑图AutoTest" then i click the "标签" button in more menu
    And I click the "Tag" button
    And I choose the "AutoTestTag" from the "TagDropdown"
    And I click the "Ensure" button
    And I wait for "1000" millsecond
   # Then I will see the success message "修改成功"
    Then I will see the message "修改成功"

  Scenario: 验证标签修改成功
    When the data name is "拓扑图AutoTest" then i will see "AutoTestTag" button


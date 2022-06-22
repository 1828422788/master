@topology @all @topologySmoke
Feature: 拓扑图标签（RZY-353）

  Scenario: 修改拓扑图标签
    Given open the "topology.ListPage" page for uri "/topology/"
    And I wait for loading invisible
    Given the data name is "拓扑图AutoTest" then i click the "标签" button in more menu
    Then I click the "DeleteTag" button
    Then I set the parameter "TagInput" with value "AutoTestTag"
    And I choose the "AutoTestTag" from the "TagDropdown"
    And I click the "Ensure" button
    Then I will see the message "修改成功"

  Scenario: 验证标签修改成功
    Given open the "topology.ListPage" page for uri "/topology/"
    And I wait for loading invisible
    When the data name is "拓扑图AutoTest" then i will see "AutoTestTag" button


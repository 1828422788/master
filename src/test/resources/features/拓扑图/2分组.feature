@topology @all @smoke @topologySmoke
Feature: 拓扑图标签（RZY-353）

  Background:
    Given open the "topology.ListPage" page for uri "/topology/"

  Scenario: 修改标签
    Given the data name is "sxjautotest" then i click the "标签" button
    And I click the "RemoveTagIcon" button
    And I click the "Ensure" button
    Then I will see the success message "修改成功"

  Scenario: 验证标签修改成功
    Given the data name is "{'column':'1','name':'sxjautotest'}" then the result is "{'column':'2','name':'无'}"
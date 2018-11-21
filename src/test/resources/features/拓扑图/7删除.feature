@topology @all @smoke @topologySmoke
Feature: 拓扑图删除

  Background:
    Given open the "topology.ListPage" page for uri "/topology/"

  Scenario Outline:
    Given the data name is "<name>" then i click the "删除" button
    And I click the "Ensure" button
    Then I will see the success message "删除成功"

    Examples:
      | name     |
      | autotest |
      | 测试中文名称   |
      | 测试中文名称   |

@topology @all @topologySmoke @smoke
Feature: 拓扑图重名校验

  Background:
    Given open the "topology.ListPage" page for uri "/topology/"

  Scenario Outline:
    Given I click the "CreateButton" button
    Then I set the parameter "NameInput" with value "<name>"
    Then I choose the "<group>" from the "GroupInput"
    Then I click the "EnsureButton" button
    Then I will see the success message "<message>"

    Examples: 成功新建拓扑图
      | name   | group            | message |
      | 测试中文名称 | default_Topology | 创建成功    |


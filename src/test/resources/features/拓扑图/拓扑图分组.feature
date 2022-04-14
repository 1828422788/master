@topology
Feature: 拓扑图分组验证

  Background:
    Given open the "topology.ListPage" page for uri "/topology/"
    And I wait for loading invisible

  @topologySmoke
  Scenario Outline: 新建拓扑图
    When I click the "Create" button
    And I set the parameter "NameInput" with value "<name>"
    And I click the "Ensure" button

    Examples:
      | name |
      | 新建分组验证 |

  Scenario Outline: 新建拓扑图分组
    When I click the detail which name is "新建分组验证"
    Then I will see the "topology.DetailPage" page
    And I wait for loading invisible
    And I click the "Setting" button
    And I click the "EditTopologySwitch" button
    And I click the "Setting" button
    And I wait for "1000" millsecond
    And I click the "Group" button
    Then I choose the "<nodetype>" from the "NodeType"
    And I wait for "1000" millsecond
    And I set the parameter "IconGroupName" with value "<name>"
    And I wait for "1500" millsecond
    And I click the Element with text "填充"
    And I wait for "1500" millsecond
    And I set the parameter "FillOfColor" with value "<color>"
    And I set the parameter "Visibility" with value "<visibility>"
    And I click the Element with text "描边"
    Then I choose the "<lineWidth>" from the "LineWidth"
    Then I click the "AddNodeButton" button
    And I wait for "1000" millsecond
    And I click the "Save" button
    Then I will see the message "保存成功"
    And I refresh the website
    And I accept alert window


    Examples:
      | nodetype  |   name  |  color |  visibility  | lineWidth |
      |      |                         |                        |    |      |
      | 矩形  |   矩形高可见度加粗虚线分组 | rgba(169, 172, 177, 1) |  1 | 加粗  |
      | 矩形  |   矩形低可见度标准实线分组 | rgba(169, 172, 177, 1) |  0 | 标准  |
      | 圆形  |   圆形高可见度加粗虚线分组 | rgba(231, 236, 245, 1) |  1 | 加粗  |

    @topologySmoke
    Examples:
      | nodetype  |   name  |  color |  visibility  | lineWidth |
      | 圆形  |   圆形低可见度标准实线分组 | rgba(231, 236, 245, 1) |  0 | 标准  |
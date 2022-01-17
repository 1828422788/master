@topology
Feature: 拓扑图节点验证

  Background:
    Given open the "topology.ListPage" page for uri "/topology/"
    And I wait for loading invisible

  @topologySmoke
  Scenario Outline: 新建拓扑图
    When I click the "Create" button
    And I set the parameter "NameInput" with value "<name>"
    And I wait for "1000" millsecond
    And I click the "Ensure" button

    Examples:
      | name |
      | 新建节点验证 |

  Scenario Outline: 新建拓扑图节点
    When I click the detail which name is "新建节点验证"
    Then I will see the "topology.DetailPage" page
    And I wait for loading invisible
    And I click the "Setting" button under some element
    And I click the "EditTopologySwitch" button
    And I click the "Setting" button under some element
    Then I choose the "<nodetype>" from the "NodeType"
    And I wait for "1000" millsecond
    And I set the parameter "IconNodeName" with value "<name>"
    And I wait for "1500" millsecond
    And I click the Element with text "填充"
    And I wait for "1500" millsecond
    And I set the parameter "FillOfColor" with value "<color>"
    And I set the parameter "Visibility" with value "<visibility>"
    And I click the Element with text "描边"
    Then I choose the "<lineWidth>" from the "LineWidth"
    And I wait for "1500" millsecond
    Then I choose the "<LineType>" from the "LineType"
    Then I click the "AddNodeButton" button
    And I wait for "1000" millsecond
    And I click the "Save" button
    Then I will see the message "保存成功"
    And I refresh the website
    And I accept alert window

    Examples:
      | nodetype  |   name  |  color |  visibility  | lineWidth | LineType  |
      |      |                         |                       |    |      |           |
      | 矩形  |   矩形高可见度加粗虚线节点 | rgba(18, 109, 245, 1) |  1 | 加粗  | 虚线      |
      | 矩形  |   矩形低可见度标准实线节点 | rgba(18, 109, 245, 1) |  0 | 标准  | 直线      |
      | 圆形  |   圆形高可见度加粗虚线节点 | rgba(250, 15, 113, 1) |  1 | 加粗  | 虚线      |
      | 圆形  |   圆形低可见度标准实线节点 | rgba(250, 15, 113, 1) |  0 | 标准  | 直线      |
      | 椭圆  |   椭圆高可见度加粗虚线节点 | rgba(15, 250, 135, 1) |  1 | 加粗  | 虚线      |
      | 椭圆  |   椭圆低可见度标准实线节点 | rgba(15, 250, 135, 1) |  0 | 标准  | 直线      |
      | 菱形  |   菱形高可见度加粗虚线节点 | rgba(199, 195, 19, 1) |  1 | 加粗  | 虚线      |

    @topologySmoke
    Examples:
      | nodetype  |   name  |  color |  visibility  | lineWidth | LineType  |
      | 菱形  |   菱形低可见度标准实线节点 | rgba(199, 195, 19, 1) |  0 | 标准  | 直线     |

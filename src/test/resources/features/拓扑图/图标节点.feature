Feature: 拓扑图图标节点

  Background:
    Given open the "topology.ListPage" page for uri "/topology/"

  Scenario Outline: 新建拓扑图
    When I click the "Create" button
    And I set the parameter "NameInput" with value "<name>"
    And I click the "Ensure" button

    Examples:
      | name |
      | 图标节点 |

  Scenario: 上传自定义图标
    When I click the detail which name is "图标节点"
    And I will see the "topology.DetailPage" page
    And I wait for "Icon" will be visible
    And I click the "Icon" button
    And I set the parameter "IconNodeName" with value "node"
    And I upload a file with name "src/test/resources/testdata/image/smallRobbot.png"
    And I click the "Image" button
    And I click the "AddNodeButton" button
    And I click the "Save" button
    And I refresh the website
    And I accept alert window

  Scenario: 验证自定义图标保存成功
    When I click the detail which name is "图标节点"
    And I will see the "topology.DetailPage" page
    Then I wait for "ImgNode" will be visible

  Scenario: 更新图标节点
    When I click the detail which name is "图标节点"
    And I will see the "topology.DetailPage" page
    And I wait for "AddInputButton" will be visible
    And I click the "AddInputButton" button
    And I click the "ExchangeMachine" button
    And I click the "UpdateNode" button
    And I click the "Save" button
    And I refresh the website
    And I accept alert window

  Scenario: 验证更新图标节点成功
    When I click the detail which name is "图标节点"
    And I will see the "topology.DetailPage" page
    And I wait for "ExchangeMachineIcon" will be visible

  Scenario Outline: 删除拓扑图
    Given the data name is "<name>" then i click the "删除" button
    And I wait for "Ensure" will be visible
    And I click the "Ensure" button

    Examples:
      | name |
      | 图标节点 |
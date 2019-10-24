@all @smoke @configs @configsSmoke
Feature: 字段提取禁用/启用

  Background:
    Given open the "configs.ListPage" page for uri "/configs/"

  Scenario: 禁用成功
    When the data name is "{'column':'1','name':'RZY3417多值字段'}" then I "close" the switch

  Scenario: 验证按钮是否为禁用状态
    Then I will see the element "{'column':'1','name':'RZY3417多值字段'}" is "close"

  Scenario: 启用成功
    When the data name is "{'column':'1','name':'RZY3417多值字段'}" then I "open" the switch

  Scenario: 验证按钮是否为启用状态
    Then I will see the element "{'column':'1','name':'RZY3417多值字段'}" is "open"

  Scenario: RZY-1874:运行统计的关闭与开启
    When I click the "SwitchButton" button
    And I refresh the website
    And I wait for loading complete
    And I will see the "SwitchButton" is "ant-switch-disabled"
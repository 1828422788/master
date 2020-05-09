@all @smoke @configs @configsSmoke
Feature: 字段提取禁用/启用

  Background:
    Given open the "configs.ListPage" page for uri "/configs/"
    Then I wait for loading invisible

  Scenario: 禁用成功
    When the data name is "{'column':'1','name':'RZY3417多值字段'}" then I "close" the switch
    Then I wait for loading invisible
    Then I will see the element "{'column':'1','name':'RZY3417多值字段'}" is "close"

  Scenario: 启用成功
    When the data name is "{'column':'1','name':'RZY3417多值字段'}" then I "open" the switch
    And I wait for loading invisible
    Then I will see the element "{'column':'1','name':'RZY3417多值字段'}" is "open"

  Scenario: RZY-1874:开启运行统计
    When I click the "SwitchButton" button
    And I wait for "1000" millsecond
    Then I will see the "SwitchButton" is "ant-switch-disabled"
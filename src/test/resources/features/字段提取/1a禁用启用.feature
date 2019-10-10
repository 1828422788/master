@all @smoke @configs @configsSmoke
Feature: 字段提取禁用/启用

  Background:
    Given open the "configs.ListPage" page for uri "/configs/"

  Scenario: 启用成功
    When the data name is "{'column':'1','name':'RZY3417多值字段'}" then I "open" the switch
    And I wait for "Content" will be visible
    Then I will see the success message "启用成功"

  Scenario: 验证按钮是否为启用状态
    Then I will see the element "{'column':'1','name':'RZY3417多值字段'}" is "open"

  Scenario: 禁用成功
    When the data name is "{'column':'1','name':'RZY3417多值字段'}" then I "close" the switch
    And I wait for "Content" will be visible
    Then I will see the success message "禁用成功"

  Scenario: 验证按钮是否为禁用状态
    Then I will see the element "{'column':'1','name':'RZY3417多值字段'}" is "close"

#  Scenario: RZY-1874:运行统计的关闭与开启
#    When I click the "SwitchButton" button
#    And I refresh the website
#    And I wait for loading complete
#    And I will see the "SwitchButton" is "el-switch is-disabled"
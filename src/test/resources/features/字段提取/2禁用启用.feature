@all @smoke @configs @configsSmoke
Feature: 字段提取禁用/启用

  Background:
    Given open the "configs.ListPage" page for uri "/configs/"

  Scenario: 禁用成功
    When I disabled the data "AutoTest"
    And I refresh the website
    Then I will see the element "AutoTest" is disabled

  Scenario: 启用成功
    When I disabled the data "AutoTest"

  @third
  Scenario: RZY-1874:运行统计的关闭与开启
    When I click the "SwitchButton" button
    And I refresh the website
    And I will see the "SwitchButton" is "el-switch is-disabled"

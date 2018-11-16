@all @smoke @configs @configsSmoke
Feature: 字段提取禁用/启用

  Background:
    Given open the "configs.ListPage" page for uri "/configs/"

  Scenario: 禁用成功
    When I disabled the data "AutoTest"
    Then I will see the success message "禁用成功"
    And I refresh the website
    Then I will see the element "AutoTest" is disabled

  Scenario: 启用成功
    When I disabled the data "AutoTest"
    Then I will see the success message "启用成功"
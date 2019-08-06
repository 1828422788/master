@all @smoke @alert @alertSmoke
Feature: 监控启用/禁用

  Background:
    Given open the "alert.ListPage" page for uri "/alerts/"

  Scenario Outline:
    When I disabled the data "RZY-435:连续统计监控步骤5"
    Then I will see the success message "<message>"

    Examples:
      | message |
      | 禁用成功    |
      | 启用成功    |

@all @smoke @alert @alertSmoke
Feature: 监控启用/禁用

  Background:
    Given open the "alert.ListPage" page for uri "/alerts/"

  Scenario Outline:
    When I disabled the data "RZY-436：SPL统计监控（不展示监控趋势图）"
    Then I will see the success message "<message>"

    Examples:
      | message |
      | 启用成功    |
      | 禁用成功    |
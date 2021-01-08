@all @smoke @alertss @alertSmoke
Feature: 监控启用/禁用

  Background:
    Given open the "alert.ListPage" page for uri "/alerts/"

  Scenario Outline:
    When I disabled the data "<name>"
    And I refresh the website
    Then I will see the data "<name>" is "<status>"

    Examples:
      | name                  | status  |
      | RZY-434:字段统计监控步骤1(副本) | disable |
      | RZY-434:字段统计监控步骤1(副本) | enable  |

@all @smoke @alert
Feature: 监控启用/禁用

  Background:
    Given open the "alert.ListPage" page for uri "/alerts/"

  Scenario Outline:
    When I disabled the data "<name>"
    Then I will see the success message "<message>"

    Examples:
      | name     | message |
      | AutoTest | 启用成功    |
      | AutoTest | 禁用成功    |
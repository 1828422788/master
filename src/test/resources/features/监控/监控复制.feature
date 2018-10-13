@all @smoke @alert
Feature: 监控复制

  Background:
    Given open the "alert.ListPage" page for uri "/alerts/"

  Scenario Outline:
    Given the data name is "<name>" then i click the "复制" button
    Then I will see the success message "复制成功"

    Examples:
      | name     |
      | AutoTest |
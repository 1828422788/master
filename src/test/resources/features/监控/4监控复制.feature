@all @smoke @alert @alertSmoke @second
Feature: 监控复制

  Background:
    Given open the "alert.ListPage" page for uri "/alerts/"

  Scenario Outline:
    Given the data name is "<name>" then i click the "复制" button
    Then I will see the success message "复制成功"
    And I refresh the website
    Then I will see the search result contains "{'column':'0','name':'<name>(1)'}"

    Examples:
      | name                      |
      | RZY-436：SPL统计监控（不展示监控趋势图） |
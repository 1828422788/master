@alert @alertSmoke @second
Feature: 监控复制

  Background:
    Given open the "alert.ListPage" page for uri "/alerts/"

  Scenario Outline:
    Given the data name is "<name>" then i click the "复制" button
    Then I will see the success message "复制成功"
    And I refresh the website
    Then I will see the search result contains "{'column':'0','name':'<name>(副本)'}"

    Examples:
      | name              |
      | RZY-434:字段统计监控步骤5 |

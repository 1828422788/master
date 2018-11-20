@alert @all @alertSmoke
Feature: 监控人员处理情况

  Background:
    Given open the "alert.ListPage" page for uri "/alerts/"
    And I click the "WorkLoads" button
    Then I wait for loading invisible

  Scenario Outline: 按名称搜索
    When search "{'input':'<name>'}" and I will see the column number "1" contains "<name>"

    Examples:
      | name  |
      | owner |


Feature: 监控删除

  Scenario Outline:
    Given open the "alert.ListPage" page for uri "/alerts/"
    When the data name is "<name>" then i click the "删除" button
    And I click the "EnsureDeleteButton" button

  @clean
    Examples:
      | name                       |
      | RZY-2468:新建监控类型-字段统计监控(副本) |
      | RZY-436：SPL统计监控（不展示监控趋势图）  |
      | RZY-445：rsyslog监控          |
      | RZY-446：邮件监控               |
      | RZY-448：告警转发               |
      | RZY-449：ping主机             |
      | linux日志关键字告警               |
      | RZY-2478:新建监控类型-事件数监控      |
      | RZY-2468:新建监控类型-字段统计监控     |
      | RZY-2469:新建监控类型-连续统计监控     |
      | RZY-2470:新建监控类型-SPL统计监控    |
      | RZY-2471:新建监控类型-基线对比监控     |

#  @all @smoke @alert @alertSmoke
  Scenario:
    Given open the "splSearch.SearchPage" page for uri "/search/"
    Given I click the "OpenSavedSearchButton" button
    Then "删除" the data "alertSavedSearch" in columnNum "1"
    Then I click the "DeleteSavedSearch" button


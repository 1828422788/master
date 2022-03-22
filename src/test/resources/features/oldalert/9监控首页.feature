#@alertss @alertSmoke
Feature: 监控首页UI改版测试

  Background:
    Given open the "alert.ListPage" page for uri "/alerts/"

  @second
  Scenario Outline: RZY-1873:首页UI测试-最新状态
    Given I click the "<button>" button
    Then I will see the element "TitleList" value is "<name>"

    Examples:
      | button       | name            |
      | LatestStatus | 全部监控分组,高,待处理    |
      | Border       | 全部监控分组,全部等级,待处理 |
      | Pending      | 全部监控分组,全部等级,待处理 |
      | Handled      | 全部监控分组,全部等级,已处理 |
      | HighAlert    | 全部监控分组,高,已处理    |
      | View         | 全部监控分组,高,已处理    |

  @second
  Scenario: RZY-2277:首页UI测试-处理及时率
    When I click the "WorkLoads" button
    Then the page's title will be "人员处理情况"

  @second
  Scenario: RZY-2278:首页UI测试-维护期
    When I click the "Maintenance" button
    Then the page's title will be "维护期"

  @third
  Scenario: RZY-2280:首页UI测试-告警插件
    When I click the "AlertNum" button
    Then the page's title will be "告警插件"


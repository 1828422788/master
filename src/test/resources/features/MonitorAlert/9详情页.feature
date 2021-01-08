@alertss @alertSmoke @third
Feature: 监控详情页

  Background:
    Given open the "alert.ListPage" page for uri "/alerts/"

  Scenario Outline: 按照告警等级搜索
    When I click the detail which name is "RZY-434:字段统计监控步骤1"
    Then I will see the "alert.DetailPage" page
    And I choose the "<grade>" from the "DegreeDropdown"
    And I wait for "1000" millsecond
    Then I will see the detail alert grade is "<colour>"

    Examples:
      | grade | colour |
      | 低级    | green  |
      | 高级    | red    |

  Scenario: 按照时间搜索
    When I click the detail which name is "RZY-434:字段统计监控步骤1"
    Then I will see the "alert.DetailPage" page
    And I click the "TimeIcon" button
    And I set the parameter "StartDate" with value "2019-07-30"
    And I click the "Apply" button
    And I choose the "高级" from the "DegreeDropdown"
    And I wait for "1000" millsecond
    Then I will see the detail alert grade is "red"

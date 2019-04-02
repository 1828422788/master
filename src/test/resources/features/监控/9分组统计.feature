@alert @alertSmoke @second
Feature: 监控分组统计

  Background:
    Given open the "alert.WorkLoadPage" page for uri "/alerts/statistics/"

  Scenario: RZY-491:监控-分组统计-返回监控首页
    When I click the "ReturnButton" button
    Then the page's title will be "监控"
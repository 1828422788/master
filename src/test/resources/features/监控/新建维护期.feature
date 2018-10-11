@alert @all
Feature: 监控维护期新建

  Background:
    Given open the "alert.MaintenancePage" page for uri "/alerts/maintenance/"
    And I click the "Create" button

  Scenario Outline: 新建成功
    When I set the parameter "Reason" with value "<reason>"
    And I choose the "<group>" from the "Group"
    And I click the "StartTime" button
    And I click the "RightNow" button
    And I click the "EndTime" button
    And I set the time input "<TimeInput>" to "2" minutes later

    Examples:




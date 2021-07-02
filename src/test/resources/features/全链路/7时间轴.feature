@fulllink @fulllinkTimeAxis
Feature: 全链路_7时间轴

  Background:
    Given open the "fulllink.ListPage" page for uri "/fulllink/"
    And I wait for "3000" millsecond
    When the data name is "AutoTest" then i click the "编辑" button
    And I will see the "fulllink.CreatePage" page
    And I wait for "3000" millsecond

  Scenario:时间轴显示
    And I wait for "TimeAxis" will be visible
    When I click the "TimeAxis" button
    And I click the "DateSetting" button
    And I wait for "SpeedHandle" will be visible
    Then I click the "TimeAxis" button
    And I wait for "SpeedHandle" will be invisible

  Scenario: 直播
    And I wait for "TimeAxis" will be visible
    When I click the "TimeAxis" button
    And I click the "LiveBroadcast" button
    And I wait for "SuccessMessage" will be visible
    And I will see the element "SuccessMessage" contains "直播中"
    And I click the "LiveBroadcast" button
    And I wait for "2000" millsecond
    And I will see the "SuccessMessage" doesn't exist
    And I click the "LiveBroadcast" button
    And I wait for "SuccessMessage" will be visible
    And I will see the element "SuccessMessage" contains "直播中"
    And I click the "LiveBroadcast" button
    And I wait for "2000" millsecond
    And I will see the "SuccessMessage" doesn't exist

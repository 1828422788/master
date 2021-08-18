@exception_fulllink
Feature: 全链路_9告警忽略

  Background:
    Given open the "fulllink.ListPage" page for uri "/fulllink/"
    And I wait for "3000" millsecond
    When the data name is "AutoTest" then i click the "编辑" button
    And I will see the "fulllink.CreatePage" page
    And I wait for "3000" millsecond

  Scenario: 告警忽略
    And I wait for "DisabledSave" will be visible
    And I click the "Switch" button
    And I wait for "Save" will be visible
    When I click the "TimeAxis" button
    And I wait for "AlarmIgnore" will be visible
    And I click the "AlarmIgnore" button
    And I wait for "AlarmIgnoreTextarea" will be visible
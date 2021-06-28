@fulllink @fulllinkCreate
Feature: 全链路_创建

  Background:
    Given open the "fulllink.ListPage" page for uri "/fulllink/"
    And I wait for "3000" millsecond

  Scenario: 创建全链路
    When I click the "Create" button
    And I wait for "Name" will be visible
    And I set the parameter "Name" with value "AutoTest"
    And I click the "Ensure" button
    Then I wait for "SuccessMessage" will be visible
    And I will see the element "SuccessMessage" contains "创建成功"
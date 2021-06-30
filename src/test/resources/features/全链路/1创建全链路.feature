@fulllink @fulllinkCreate
Feature: 全链路_1创建

  Background:
    Given open the "fulllink.ListPage" page for uri "/fulllink/"
    And I wait for "3000" millsecond

  Scenario: 创建全链路_空名称
    When I click the "Create" button
    And I wait for "Name" will be visible
    And I set the parameter "Name" with value "  "
    And I click the "Ensure" button
    Then I wait for "SuccessMessage" will be visible
    And I will see the element "SuccessMessage" contains "名称格式有误, 仅支持汉字，数字，字母，中划线及下划线"

  Scenario: 创建全链路
    When I click the "Create" button
    And I wait for "Name" will be visible
    And I set the parameter "Name" with value "AutoTest"
    And I click the "Ensure" button
    Then I wait for "SuccessMessage" will be visible
    And I will see the element "SuccessMessage" contains "创建成功"
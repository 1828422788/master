@fulllink @fulllinkCheck
Feature: 全链路_8查看链路图

  Background:
    Given open the "fulllink.ListPage" page for uri "/fulllink/"
    And I wait for "3000" millsecond
    When the data name is "AutoTest" then i click the "编辑" button
    And I will see the "fulllink.CreatePage" page
    And I wait for "3000" millsecond
    
  Scenario: 查看全链路
    And I wait for "Canvas" will be visible
    And I wait for "2000" millsecond
    When I click the "CanvasElement" button
    And I wait for "ElementDetails" will be visible
    And I will see the element "ElementDetails" contains "节点详情"
    And I will see the element "ElementDetails" contains "GET_"
    And I will see the element "ElementDetails" contains "市"
    And I will see the element "ElementDetails" contains "节点异常状态"
    And I will see the element "ElementDetails" contains "数量："
    And I will see the element "ElementDetails" contains "3"
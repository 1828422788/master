@all @usage @smoke
Feature: 限额管理截图

  Background:
    Given open the "usage.ListPage" page for uri "/account/usage/"

  Scenario:
    When I click the "ShowButton" button
    Then take a screenshot
@all @smoke @configs
Feature: 字段提取删除

  Background:
    Given open the "configs.ListPage" page for uri "/configs/"

  @configsSmoke
  Scenario Outline:
    When the data name is "<name>" then i click the "删除" button
    And I click the "EnsureButton" button

    Examples:
      | name        |
      | AutoTest    |
      | AutoTest(1) |

  @clean
    Examples:
      | name             |
      | AutoTestForTrend |
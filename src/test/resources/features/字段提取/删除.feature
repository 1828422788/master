@all @smoke @configs @configsSmoke
Feature: 字段提取删除

  Background:
    Given open the "configs.ListPage" page for uri "/configs/"

  Scenario Outline:
    When the data name is "<name>" then i click the "删除" button
    And I click the "EnsureButton" button
#    And I refresh the website
#    Then I will see the search result "{'column':'0','name':'<name>','contains':'no'}"

    Examples:
      | name        |
      | AutoTest    |
      | AutoTest(1) |

  @clean
    Examples:
      | name             |
      | AutoTestForTrend |
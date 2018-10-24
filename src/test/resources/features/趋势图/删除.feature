@all @smoke @trend
Feature: 趋势图删除

  Background:
    Given open the "trend.ListPage" page for uri "/trend/"

  Scenario Outline:
    When the data name is "<name>" then i click the "删除" button
    And I click the "EnsureButton" button
    And I will see the success message "删除成功"
    And I refresh the website
    Then I will see the search result "{'column':'0','name':'<name>','contains':'no'}"

    Examples:
      | name     |
      | AutoTest |
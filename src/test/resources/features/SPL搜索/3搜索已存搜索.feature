@smoke @spl @all @splSmoke
Feature: 已存搜索查询（RZY-157）

  Background:
    Given open the "splSearch.SearchPage" page for uri "/search/"

  Scenario Outline:
    Given I click the "OpenSavedSearchButton" button
    And I wait for loading invisible
    Then I set the parameter "SearchSavedList" with value "<name>"
    Then I will see the column "1" contains "<name>"

    Examples:
      | name     |
      | AutoTest |
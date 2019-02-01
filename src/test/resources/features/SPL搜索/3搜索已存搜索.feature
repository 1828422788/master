@smoke @spl @all @splSmoke
Feature: 已存搜索查询（RZY-157）

  Background:
    Given open the "splSearch.SearchPage" page for uri "/search/"

  Scenario Outline:
    Given I click the "OpenSavedSearchButton" button
    And I wait for loading invisible
    And I set the parameter "SearchSavedList" with value "<name>"
    Then I will see the column "1" contains "<name>"
    Then I will see the column "3" contains "索引模式"
    Then take a screenshot with name "157：已存搜索-查询"

    Examples:
      | name     |
      | AutoTest |
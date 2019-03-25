@smoke @spl @all @splSmoke
Feature: 已存搜索加载（RZY-153）

  Background:
    Given open the "splSearch.SearchPage" page for uri "/search/"

  Scenario Outline:
    Given I click the "OpenSavedSearchButton" button
    And "加载" the data "<name>" in columnNum "1"
    Then I will see the input element "SearchInput" value will be "<spl>"
    Then take a screenshot with name "153：已存搜索-加载已存搜索"

    Examples:
      | name     | spl                                         |
      | AutoTest | starttime=\"-2d/w\" endtime=\"now\" tag:ty* |
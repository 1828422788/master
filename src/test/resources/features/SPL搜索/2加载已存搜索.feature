@smoke @spl @all
Feature: 已存搜索加载

  Background:
    Given open the "splSearch.SearchPage" page for uri "/search/"

  Scenario Outline:
    Given I click the "OpenSavedSearchButton" button
    And "加载" the data "<name>" in columnNum "1"
    Then I will see the input element "SearchInput" value will be "<spl>"

    Examples:
      | name     | spl                                     |
      | AutoTest | starttime="-2d/w" endtime="now" tag:ty* |
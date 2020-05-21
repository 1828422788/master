@event @eventSmoke
Feature: 事件操作搜索

  Background:
    Given open the "event.ListPage" page for uri "/event/action/"

  Scenario Outline:
    When I set the parameter "SearchInput" with value "<name>"
    And I wait for loading invisible
    Then I will see the search result "<name>"

    Examples:
      | name     |
      | AutoTest |
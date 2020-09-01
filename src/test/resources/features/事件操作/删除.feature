@event
Feature: 事件操作删除（RZY-1391）

  Background:
    Given open the "event.ListPage" page for uri "/event/action/"

  Scenario Outline:
    When the data name is "{'column':'1','name':'<name>'}" then i click the "删除" button
    And I wait for "Ensure" will be visible
    And I click the "Ensure" button
    And I refresh the website
    Then I will see the search result "{'column':'0','name':'<name>','contains':'no'}"

  @eventSmoke
    Examples:
      | name        |
      | AutoTest    |
      | 查看上下文sample |

@event
Feature: 事件操作删除（RZY-1391）

  Background:
    Given open the "event.ListPage" page for uri "/event/action/"

  Scenario Outline:
    When the data name is "<name>" then i click the "删除" button
    And I click the "EnsureButton" button
    And I refresh the website
    Then I will see the search result "{'column':'0','name':'<name>','contains':'no'}"

  @eventSmoke
    Examples:
      | name     |
      | AutoTest |

  @clean
    Examples:
      | name        |
      | 查看上下文sample |
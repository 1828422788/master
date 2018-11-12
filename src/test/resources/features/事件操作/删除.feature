@all @event @smoke @eventSmoke
Feature: 事件操作搜索

  Background:
    Given open the "event.ListPage" page for uri "/event/action/"

  Scenario Outline:
    When the data name is "<name>" then i click the "删除" button
    And I click the "EnsureButton" button
    And I will see the success message "删除成功"
    And I refresh the website
    Then I will see the search result "{'column':'0','name':'<name>','contains':'no'}"

    Examples:
      | name     |
      | AutoTest |
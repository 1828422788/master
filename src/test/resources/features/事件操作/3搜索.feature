@event @eventSmoke
Feature: 事件操作搜索

  Background:
    Given open the "event.ListPage" page for uri "/event/action/"

  Scenario Outline:
    Given search "{'input':'<name>'}" and I will see the column number "1" contains "<name>"

    Examples:
      | name     |
      | AutoTest |
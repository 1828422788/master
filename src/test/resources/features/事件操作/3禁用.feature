@event @eventSmoke
Feature: 事件操作启用禁用

  Background:
    Given open the "event.ListPage" page for uri "/event/action/"
    And I wait for loading invisible

  Scenario: 事件操作禁用
    When the data name is "{'column':'1','name':'查看上下文'}" then I "close" the switch
    And open the "splSearch.SearchPage" page for uri "/search/"
    And I wait for element "SearchStatus" change text to "搜索完成"
    When I set the parameter "SearchInput" with value "*"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I click the "RightIcon" button
    And I click the "EventOperate" button
    Then I will see the "Context" is not exist

  Scenario: 事件操作启用
    When the data name is "{'column':'1','name':'查看上下文'}" then I "open" the switch
    And open the "splSearch.SearchPage" page for uri "/search/"
    And I wait for element "SearchStatus" change text to "搜索完成"
    When I set the parameter "SearchInput" with value "*"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I click the "RightIcon" button
    And I click the "EventOperate" button
    Then I click the "Context" button
    And I close all tabs except main tab

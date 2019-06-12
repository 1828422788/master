@alert @alertSmoke @second
Feature: 监控在搜索中打开

  Background:
    Given open the "alert.ListPage" page for uri "/alerts/"

  Scenario:
    When the data name is "RZY-434:字段统计监控步骤5" then i click the "在搜索中打开" button
    And switch to another window
    And I will see the "splSearch.SearchPage" page
    And I wait for element "SearchStatus" change text to "搜索完成!"
    Then I will see the input element "SearchInput" value will be "*|stats top(apache.status, 100) as stat_result"

@trendSearchHistory
Feature: 趋势图_搜索历史
#V22-2687

  Scenario: create_trend
    Given open the "trend.ListPage" page for uri "/trend/"
    Then I click the "NewTrendButton" button
    And I will see the "trend.CreatePage" page
    And I wait for element "SearchStatus" change text to "搜索完成!"
    When I set the parameter "SearchInput" with value "starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424_chart | stats count() by apache.status,apache.geo.city | eval result=\"Test_History\""
    And I click the "SearchButton" button under some element
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I wait for "Header" will be visible
    And I click the "NextButton" button under some element
    And I wait for "Header" will be visible
    And I click the "NextButton" button under some element
    When I set the parameter "NameInput" with value "SearchHistory"
    And I set the parameter "DescribeInput" with value "AutoCreate"
    And I click the "Complete" button under some element
    Then I wait for "SuccessCreate" will be visible

  Scenario: check_search_page
    Given open the "splSearch.SearchPage" page for uri "/search/"
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I simulate typing in "SearchInput"
    And I wait for "SearchHistory" will be visible
    And I click the "SearchHistory" button
    And I wait for "SeacrhHistoryInput" will be visible
    And I set the parameter "SearchHistoryInput" with value "Test_History"
    And I wait for "2000" millsecond
    And I will see the "SearchHistoryResult" doesn't exist

  Scenario: delete_trend
    Given open the "trend.ListPage" page for uri "/trend/"
    And I wait for "2000" millsecond
    When the data name is "{'column':'0','name':'SearchHistory'}" then i click the "删除" button
    Then I will see the message "确认删除 [SearchHistory] ?"
    When I click the "EnsureButton" button
    And I wait for "SuccessMessage" will be visible
    Then I will see the success message "删除成功"
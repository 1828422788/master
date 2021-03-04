@all @trend @trendSavedSearch
Feature: 趋势图_已存搜索

  Scenario: empty_saved_search
    Given open the "splSearch.SearchPage" page for uri "/search/"
    And I wait for element "SearchStatus" change text to "搜索完成!"
    When I set the parameter "SearchInput" with value "* | stats count()"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "NewSavedSearch" button
    And I wait for "SavedSearchName" will be visible
    And I set the parameter "SavedSearchName" with value ""
    And I click the "EnsureCreateSavedSearch" button
    And I will see the "SuccessMessage" doesn't exist

  Scenario: create_saved_search
    Given open the "splSearch.SearchPage" page for uri "/search/"
    And I wait for element "SearchStatus" change text to "搜索完成!"
    When I set the parameter "SearchInput" with value "* | stats count()"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button under some element
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I click the "NewSavedSearch" button
    And I wait for "SavedSearchName" will be visible
    And I set the parameter "SavedSearchName" with value "trend_test"
    And I choose the "auto_package" from the "GroupComboBox"
    And I choose the "test_app" from the "AppComboBox"
    And I click the "EnsureCreateSavedSearch" button under some element
    And I wait for "TimeTaskEnsure" will be visible
    Then I will see the success message "创建成功"
    And I click the "TimeTaskEnsure" button
    And I wait for "SavedSearch" will be visible
    And I click the "OpenSavedSearchList" button
    And I wait for "2000" millsecond
    And "删除" the data "trend_test" in tiny saved search
    And I wait for "ConfirmMessage" will be visible
    And I will see the text "取 消" exist in page
    And I will see the text "确 定" exist in page
    And I will see the element "ConfirmMessage" contains "确认删除 trend_test?"

  Scenario: create_trend
    Given open the "trend.ListPage" page for uri "/trend/"
    Then I click the "NewTrendButton" button
    And I will see the "trend.CreatePage" page
    And I wait for "Loading" will be invisible
    And I click the "SavedSearch" button
    And I wait for "Loading" will be invisible
    And "加载" the data "trend_test" in tiny saved search
    And I click the "SearchButton" button under some element
    And I wait for "5000" millsecond
    And I wait for "Header" will be visible
    And I will see the input element "SearchInput" value will be "* | stats count()"
    And I will see the input element "DateEditor" value will be "今天"
    And I click the "NextButton" button under some element
    And I wait for "Header" will be visible
    And I click the "NextButton" button under some element
    When I set the parameter "NameInput" with value "trend_SavedSearch"
    And I set the parameter "DescribeInput" with value "AutoCreate"
    And I click the "FinishButton" button under some element
    Then I wait for "SuccessCreate" will be visible

  Scenario: delete_in_trend
    Given open the "trend.ListPage" page for uri "/trend/"
    Then I click the "NewTrendButton" button
    And I will see the "trend.CreatePage" page
    And I wait for "Loading" will be invisible
    And I click the "SavedSearch" button
    And I wait for "Loading" will be invisible
    And "删除" the data "trend_test" in tiny saved search
    And I wait for "CancelButton" will be visible
    And I will see the element "ConfirmMessage" contains "确认删除 trend_test?"
    And I click the "CancelButton" button
    And "删除" the data "trend_test" in tiny saved search
    And I wait for "CreateEnsureButton" will be visible
    And I click the "CreateEnsureButton" button
    And I wait for "Notice" will be visible
    And I will see the element "Notice" contains "删除成功"

    Given open the "trend.ListPage" page for uri "/trend/"
    And the data name is "{'column':'0','name':'trend_SavedSearch'}" then i click the "删除" button
    Then I will see the message "确认删除 [trend_SavedSearch] ?"
    When I click the "EnsureButton" button
    And I wait for "SuccessMessage" will be visible
    Then I will see the success message "删除成功"
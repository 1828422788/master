Feature: 用户分享已存搜索

  Background:
    Given I logout current user
    And open the "LoginPage" page for uri "/auth/login/"
    When I set the parameter "Username" with value "AutoTest"
    And I set the parameter "Password" with value "qqqqq11111"
    And I click the "LoginButton" button
    And I wait for loading invisible

  Scenario Outline: 同角色下的账户共享已存搜索
    Given open the "splSearch.SearchPage" page for uri "/search/"
    When I set the parameter "SearchInput" with value "*"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I click the "SaveAsReport" button
    And I click the "SavedSearch" button
    And I wait for loading invisible
    And I set the parameter "OfflineTaskName" with value "<savedSearch>"
    And I choose the "default_SavedSearch" from the "GroupComboBox"
    And I click the "EnsureCreateSavedSearch" button
    Then I will see the success message "创建成功"
    And I logout current user
    And open the "LoginPage" page for uri "/auth/login/"
    When I set the parameter "Username" with value "AutoTestForSavedSearch"
    And I set the parameter "Password" with value "qqqqq11111"
    And I click the "LoginButton" button
    And I wait for loading invisible
    Given open the "splSearch.SearchPage" page for uri "/search/"
    And I click the "OpenSavedSearchButton" button
    Then I will see the search result contains "{'column':'1','name':'<savedSearch>'}"

    Examples:
      | savedSearch                      |
      | AutoTestSavedSearchForUserShared |



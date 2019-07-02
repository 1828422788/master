@smoke @spl @all @splSmoke
Feature: 已存搜索加载（RZY-153）

  Scenario Outline:
    Given open the "splSearch.SearchPage" page for uri "/search/"
    Given I click the "OpenSavedSearchButton" button
    And "加载" the data "<name>" in columnNum "1"
    Then I will see the input element "SearchInput" value will be "<spl>"

    Examples:
      | name     | spl                                     |
      | AutoTest | starttime="-2d/w" endtime="now" tag:ty* |

  Scenario Outline: 在已存搜索列表加载
    Given open the "splSearch.SavedSearchPage" page for uri "/savedsearches/"
    And I set the parameter "SearchInput" with value "<name>"
    And I click the "SearchIcon" button
    And I wait for loading invisible
    Then I will see the search result "{'column':'1','name':'<name>'}"
    And the data name is "{'column':'1','name':'<name>'}" then i click the "加载" button
    And switch to window "搜索"
    Then I will see the "splSearch.SearchPage" page
    And I wait for element "SearchStatus" change text to "搜索完成!"
    Then I will see the input element "SearchInput" value will be "starttime="-2d/w" endtime="now" tag:ty*"

    Examples:
      | name        |
      | AutoTest重名1 |
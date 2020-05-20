@spl @all
Feature: 已存搜索删除（RZY-154）

  Background:

  @smoke @splSmoke
  Scenario Outline:
    Given open the "splSearch.SearchPage" page for uri "/search/"
    When I click the "OpenSavedSearchButton" button
    Then "删除" the data "<name>" in columnNum "1"
    Then I click the "DeleteSavedSearch" button

    Examples:
      | name        |
      | AutoTest重名1 |
      | AutoTest    |

  @smoke @splSmoke
  Scenario: 在列表页删除
    Given open the "splSearch.SavedSearchPage" page for uri "/savedsearches/"
    And the data name is "{'column':'1','name':'AutoTest重名1'}" then i click the "删除" button
    And I click the "EnsureDelete" button

  @clean
  Scenario:
    Given open the "splSearch.SearchPage" page for uri "/search/"
    When I click the "OpenSavedSearchButton" button
    Then "删除" the data "alertSavedSearch" in columnNum "1"
    Then I click the "DeleteSavedSearch" button


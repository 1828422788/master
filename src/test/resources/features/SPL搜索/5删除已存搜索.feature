@smoke @spl @all @splSmoke
Feature: 已存搜索删除（RZY-154）

  Background:
    Given open the "splSearch.SearchPage" page for uri "/search/"

  Scenario Outline:
    Given I click the "OpenSavedSearchButton" button
    Then "删除" the data "<name>" in columnNum "1"
    Then I click the "DeleteSavedSearch" button

    Examples:
      | name        |
      | AutoTest重名1 |
      | AutoTest重名1 |
      | AutoTest    |

      


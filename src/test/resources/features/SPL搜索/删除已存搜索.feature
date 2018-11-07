@smoke @spl @all
Feature: 已存搜索删除

  Background:
    Given open the "splSearch.SearchPage" page for uri "/search/"

  Scenario Outline:
    Given I click the "OpenSavedSearchButton" button
    Then "删除" the data "<name>" in columnNum "1"
    Then I click the "DeleteSavedSearch" button

    Examples:
      | name          |
      | sunxjAutoTest |

      


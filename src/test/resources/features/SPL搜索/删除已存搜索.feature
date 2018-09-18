@smoke @spl @all
Feature: 删除已存搜索

  Background:
    Given I insert into table "SavedSearch" with "{'name':'sunxjAutoTest','domain_id':'1','creator_id':'1','query':'*','source_groups':'all'}"
    Then open the "splSearch.SearchPage" page for uri "/search/"

  Scenario Outline:
    Given I click the "OpenSavedSearchButton" button
    Then "删除" the data "<name>" in columnNum "1"
    Then I click the "DeleteSavedSearch" button

    Examples:
      | name          |
      | sunxjAutoTest |

      


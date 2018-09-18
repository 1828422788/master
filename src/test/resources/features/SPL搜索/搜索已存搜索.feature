@smoke @spl @all
Feature: 加载已存搜索

  Background:
    Given I insert into table "SavedSearch" with "{'name':'sunxjAutoTest','domain_id':'1','creator_id':'1','query':'*','source_groups':'all'}"
    Then open the "splSearch.SearchPage" page for uri "/search/"

  Scenario Outline:
    Given I click the "OpenSavedSearchButton" button
    Then I set the parameter "SearchSavedList" with value "<name>"
    Then I will see the column "1" contains "<name>"

    Examples:
      | name  |
      | sunxj |
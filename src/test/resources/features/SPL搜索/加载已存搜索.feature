@smoke @spl @all
Feature: 已存搜索加载

  Background:
    Given I insert into table "SavedSearch" with "{'name':'sunxjAutoTest','domain_id':'1','creator_id':'1','query':'*','source_groups':'all'}"
    Then open the "splSearch.SearchPage" page for uri "/search/"

  Scenario Outline:
    Given I click the "OpenSavedSearchButton" button
    Then "加载" the data "<name>" in columnNum "1"
    Then take a screenshot

    Examples:
      | name          |
      | sunxjAutoTest |
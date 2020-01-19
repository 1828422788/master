@dataset
Feature: 按应用查询jnd

  Background:
    Given open the "dataset.ListPage" page for uri "/dataset/"
    And I wait for loading invisible

  @dataset
  Scenario: 按应用查询
    Given I click the "appbutton" button
    And  I wait for "app_search_list" will be visible


    And I choose the "EventApp" from the "app_search_list"

    And I wait for loading invisible
    Then I will see the search result contains "{'column':'0','name':'分组和应用'}"
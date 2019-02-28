@clean
Feature: 关联搜索删除

  Background:
    Given open the "customApplication.ListPage" page for uri "/app/relate_search/application/"

  Scenario:
    When the data name is "test" then i click the "删除" button
    And I click the "Ensure" button

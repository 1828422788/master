@configsSmoke
Feature: 字典管理搜索

  Background:
    Given open the "dictionary.ListPage" page for uri "/dictionary/"

  Scenario: 搜索字典管理
    Given open the "dictionary.ListPage" page for uri "/dictionary/"
    Given search "{'group':'字典分组AutoTest'}" and I will see the column number "1" contains "AutoTest.csv"
    And I search the group "未分组"
    And I wait for loading invisible
    Then I will see the search result "{'column':'0','name':'AutoTest.csv','contains':'no'}"
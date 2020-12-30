@spl @all
Feature: 已存搜索删除（RZY-154）

  Background:

  Scenario Outline: 在已存搜索列表加载
    Given open the "splSearch.SavedSearchPage" page for uri "/savedsearches/"
    And I set the parameter "SearchInput" with value "<name>"
    And I click the "SearchIcon" button
    And I wait for loading invisible
    Then I will see the search result "{'column':'1','name':'<name>'}"
    And the data name is "{'column':'1','name':'<name>'}" then i click the "删除" button
    And I wait for "1000" millsecond
    And I click the "EnsureDelete" button

    Examples:
      | name        |
      | test_duplicate_name |
      | test_delete |
      | multiwordsand |
      | spark_cnt |
      | base_sample |

  @v32cleansavedsearch
  Scenario Outline: 在已存搜索列表加载
    Given open the "splSearch.SavedSearchPage" page for uri "/savedsearches/"
    And I set the parameter "SearchInput" with value "<name>"
    And I click the "SearchIcon" button
    And I wait for loading invisible
    Then I will see the search result "{'column':'1','name':'<name>'}"
    And the data name is "{'column':'1','name':'<name>'}" then i click the "删除" button
    And I click the "EnsureDelete" button

    Examples:
      | name        |
      | where或 |
      | where与 |
      | 扩展搜索chart |
      | multiwordsand |
      | spark_cnt |
      | base_sample |
      | app_sparksearch_授权 |
      | spark_dataset |
      | 系统配置高亮 |

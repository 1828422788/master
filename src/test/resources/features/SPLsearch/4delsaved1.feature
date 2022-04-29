@spl @all @delsaved
Feature: 已存搜索删除（RZY-154）

  Background:
    Given open the "splSearch.SearchPage" page for uri "/search/"
    And I wait for element "SearchStatus" change text to "搜索完成!"

  @delsaved1
  Scenario Outline: 在已存搜索列表加载
    Given open the "splSearch.SavedSearchPage" page for uri "/savedsearches/"
    And I set the parameter "TextFilter" with value "<name>"
    And I wait for loading invisible
    Then I will see the search result "{'column':'1','name':'<name>'}"
    And the data name is "{'column':'1','name':'<name>'}" then i click the "删除" button
    And I wait for "1000" millsecond
    And I click the "EnsureDelete" button

    Examples:
      | name                |
      | test_load           |
      | test_delete         |
      | test_duplicate_name |
      | test_duplicate_name |

  @delsaved2
  Scenario Outline: 在已存搜索列表加载
    Given open the "splSearch.SavedSearchPage" page for uri "/savedsearches/"
    And I set the parameter "TextFilter" with value "<name>"
    And I wait for loading invisible
    Then I will see the search result "{'column':'1','name':'<name>'}"
    And the data name is "{'column':'1','name':'<name>'}" then i click the "删除" button
    And I click the "EnsureDelete" button

    Examples:
      | name                         |
      | spark_count                  |
      | 极简模式200status                |
      | 200status_continuous_spark   |
      | app_spark_count_byip_sort_授权 |
      | offlinetask_sample           |
      | multiwordsand                |
      | where或                       |
      | where与                       |
      | 扩展搜索chart                    |
      | 系统配置高亮                       |
      | spark_cnt                    |
      | base_sample                  |
      | spark_dataset                |

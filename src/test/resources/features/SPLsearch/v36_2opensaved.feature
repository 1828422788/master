@all @opensaved
Feature: 已存搜索加载（RZY-153）

  Background:
    Given open the "splSearch.SearchPage" page for uri "/search/"
    And I wait for element "SearchStatus" change text to "搜索完成!"

  Scenario Outline:
    And I wait for loading complete
    Then I choose1 the "打开列表" from the "SavedSearchList"
    And I wait for loading complete

    And "加载" the data "<name>" in tiny saved search
    Then I will see the input element "SearchInput" value will be "<spl>"

    Examples:
      | name                | spl                      |
      | test_load           | * tag:sample04061424 GET |
      | test_duplicate_name | tag:sample04061424       |

  #后续，补充数据集、索引模式加载、及搜索结果验证等；
  Scenario Outline: 在已存搜索列表加载
    Given open the "splSearch.SavedSearchPage" page for uri "/savedsearches/"
    And I set the parameter "SearchInput" with value "<name>"
#    And I click the "SearchIcon" button
    And I wait for loading invisible
    Then I will see the search result "{'column':'1','name':'<name>'}"
    And the data name is "{'column':'1','name':'<name>'}" then i click the "加载" button
#    And switch to window "搜索"
    Then I will see the "splSearch.SearchPage" page
    And I wait for element "SearchStatus" change text to "搜索完成!"
    Then I will see the input element "SearchInput" value will be "<expect_spl>"

    Examples:
      | name          | expect_spl                                                                                                                              |
      | spark_cnt     | tag:\"sample04061424\" \| stats count() as cnt, max(apache.status) as r_max_status by apache.clientip                                   |
      | multiwordsand | * tag:sample* AND AMAP mac Android                                                                                                      |
      | where或        | starttime=\"now/M\" endtime=\"now/d+24h\" tag:\"sample04061424\" \| stats count() as cnt by apache.clientip \| where cnt>17 \|\| cnt<33 |
      | where与        | starttime=\"now/M\" endtime=\"now/d+24h\" tag:\"sample04061424\" \| stats count() as cnt by apache.clientip \| where cnt>17 \&\& cnt<33 |
      | 扩展搜索chart     | starttime=\"now/d\" endtime=\"now/d+24h\" tag:\"sample04061424\" \| chart count() as cnt over apache.resp_len span=\"500\"              |
      | 系统配置高亮GET200  | GET 200                                                                                                                                 |
      | 极简模式200status | starttime=\"now/M\" endtime=\"now/d+24h\" tag:\"sample04061424\" \| stats count() as cnt by apache.clientip                             |
      | spark_dataset | tag:sample04061424 OR tag:c* \| stats count() as cnt by apache.clientip                                                                 |
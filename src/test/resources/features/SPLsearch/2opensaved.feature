@opensaved @searchpage
Feature: 已存搜索加载

  Background:
    Given open the "splSearch.SearchPage" page for uri "/search/"
    And I wait for element "SearchStatus" change text to "搜索完成!"

  @opensaved1
  Scenario Outline:
    And I wait for loading complete
    Then I choose the "打开列表" from the "SavedSearchList"
    And I wait for loading complete

    And I set the parameter "SavedSearchInput" with value "<name>"
    Given I wait for loading complete
    And I wait for "2000" millsecond

    Given I click the which saved name is "<name>"
    Then I will see the input element "SearchInput" value will be "<spl>"
    Examples:
      | name                | spl                                                                                                                               |
      | test_load           | * tag:sample04061424                                                                                                          |
      | test_duplicate_name | tag:sample04061424                                                                                                                |
      | spark_cnt           | tag:"sample04061424" \| stats count() as cnt, max(apache.status) as r_max_status by apache.clientip                               |
      | multiwordsand       | * tag:sample* AND AMAP mac Android                                                                                                |
      | where或              | starttime="now/M" endtime="now/d+24h" tag:"sample04061424" \| stats count() as cnt by apache.clientip \| where cnt>17 \|\| cnt<33 |
      | where与              | starttime="now/M" endtime="now/d+24h" tag:"sample04061424" \| stats count() as cnt by apache.clientip \| where cnt>17 && cnt<33   |
      | 扩展搜索chart           | starttime="now/d" endtime="now/d+24h" tag:"sample04061424" \| chart count() as cnt over apache.resp_len span="500"                |
      | 系统配置高亮GET200        | GET 200                                                                                                                           |
      | 极简模式200status       | starttime="now/M" endtime="now/d+24h" tag:"sample04061424" \| stats count() as cnt by apache.clientip                             |
      | spark_dataset       | tag:sample04061424 OR tag:c* \| stats count() as cnt by apache.clientip                                                           |

  #后续，补数据集、索引模式加载、及搜索结果验证等；

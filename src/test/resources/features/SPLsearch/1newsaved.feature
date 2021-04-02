@newsaved @autoui01
Feature: 已存搜索新建（RZY-150）

  Background:
    Given open the "splSearch.SearchPage" page for uri "/search/"
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I wait for "2000" millsecond

  @newsaved1
  Scenario Outline: 新建已存搜索
    When I set the parameter "SearchInput" with value "<splQuery>"
    And I wait for loading complete

    And I choose the "新建" from the "SavedSearchList"
    And I wait for loading complete

    And I set the parameter "SavedSearchNameInput" with value "<name>"
#    And I choose the "<searchResName>" from the "GroupComboBox"
    And I click the "EnsureCreateSavedSearch" button
    And I wait for loading complete
    Then I will see the success message "创建成功"

    Examples: 保存成功
      | name                              | searchResName | splQuery                                                                                                    |
      | spark_count                  | auto_ui       | starttime=\"now/M\" endtime=\"now/d+24h\" tag:\"sample04061424\" \| stats count() as cnt by apache.clientip |
      | 极简模式200status                | auto_ui       | starttime=\"now/M\" endtime=\"now/d+24h\" tag:\"sample04061424\" \| stats count() as cnt by apache.clientip |
      | 200status_continuous_spark   | auto_ui       | tag:continuous                                                                                              |
      | app_spark_count_byip_sort_授权 | auto_ui       | tag:spark OR tag:c* \| stats count() as cnt by apache.clientip \| sort by cnt                               |
      | offlinetask_sample           | auto_ui       | * \| transaction apache.status maxspan=1h                                                                   |

  @newsaved2
  Scenario Outline: 新建监控使用已存搜索
    When I set the parameter "SearchInput" with value "<splQuery>"
    And I choose1 the "新建" from the "SavedSearchList"
    And I wait for loading complete

    And I set the parameter "SavedSearchName" with value "<name>"
#   And I choose the "<searchResName>" from the "GroupComboBox"
    And I click the "EnsureCreateSavedSearch" button
    Then I will see the success message "<message>"

    Examples: 保存成功
      | name          | splQuery                                                                                                                                | searchResName | message |
      | multiwordsand | * tag:sample* AND AMAP mac Android                                                                                                      | auto_ui       | 创建成功    |
      | where或        | starttime=\"now/M\" endtime=\"now/d+24h\" tag:\"sample04061424\" \| stats count() as cnt by apache.clientip \| where cnt>17 \|\| cnt<33 | auto_ui       | 创建成功    |
      | where与        | starttime=\"now/M\" endtime=\"now/d+24h\" tag:\"sample04061424\" \| stats count() as cnt by apache.clientip \| where cnt>17 \&\& cnt<33 | auto_ui       | 创建成功    |
      | 扩展搜索chart     | starttime=\"now/d\" endtime=\"now/d+24h\" tag:\"sample04061424\" \| chart count() as cnt over apache.resp_len span=\"500\"              | auto_ui       | 创建成功    |
      | 系统配置高亮GET200  | GET 200                                                                                                                                 | auto_ui       | 创建成功    |

  @newsaved3
  Scenario Outline: 添加已存搜索-增删改查、重名
    When I set the parameter "SearchInput" with value "<splQuery>"
    And I choose1 the "新建" from the "SavedSearchList"
    And I wait for loading complete

    And I set the parameter "SavedSearchName" with value "<name>"
    #And I choose the "<searchResName>" from the "SearchResourceInput"
    #And I set the parameter "SearchResourceInput" with value "<searchResName>"
    And I click the "EnsureCreateSavedSearch" button
    Then I will see the success message "<message>"

    Examples: 保存成功
      | name                | splQuery             | searchResName | message |
      | test_load           | * tag:sample04061424 | auto_ui       | 创建成功    |
      | test_delete         | tag:sample04061424   | auto_ui       | 创建成功    |
      | test_duplicate_name | tag:sample04061424   | auto_ui       | 创建成功    |
      | test_duplicate_name | tag:sample04061424   | auto_ui       | 创建成功    |

  @newsaved4
  Scenario Outline: 新建索引模式及高基搜索
    When I set the parameter "SearchInput" with value "<splQuery>"
    And I choose1 the "新建" from the "SavedSearchList"
    And I wait for loading complete

    And I set the parameter "SavedSearchName" with value "<name>"
#    And I choose the "<searchResName>" from the "GroupComboBox"
    And I click the "EnsureCreateSavedSearch" button
    And I wait for loading complete
    Then I will see the success message "创建成功"

    Examples: 保存成功
      | name        | splQuery                                                                                              | message |
      | spark_cnt   | tag:\"sample04061424\" \| stats count() as cnt, max(apache.status) as r_max_status by apache.clientip   | 创建成功    |
      | base_sample | starttime=\"now/M\" endtime=\"now/d+24h\" tag:\"sample04061424\" \| stats count() as cnt by apache.clientip | 创建成功    |

  Scenario Outline: 权限及数据集相关
    When I set the parameter "SearchInput" with value "<splQuery>"
    And I choose1 the "新建" from the "SavedSearchList"
    And I wait for loading complete

    And I set the parameter "SavedSearchName" with value "<name>"
    And I click the "EnsureCreateSavedSearch" button
    Then I will see the success message "<message>"

    Examples: 保存成功
      | name          | splQuery                                                                | message |
      | spark_dataset | tag:sample04061424 OR tag:c* \| stats count() as cnt by apache.clientip | 创建成功    |
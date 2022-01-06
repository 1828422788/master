@newsaved @autoui02
Feature: 已存搜索_新建（RZY-150）

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

    And I click the "resourceTagDiv" button
    When I wait for loading complete
    And I click the "resourceTagDiv" button
    When I wait for loading complete
    And I set the parameter "SavedSearchName" with value "<name>"
    And I set the parameter "ResourceTagInput" with value "<searchResName>"
    And I choose the "<searchResName>" from the "ResourceGroupList"
    And I click the "EnsureCreateSavedSearch" button
    And I wait for loading complete
    Then I will see the success message "创建成功"

    Examples: 保存成功
      | name                         | searchResName   | splQuery                                                                                                                                                                                                                     |
      | spark_count                  | org.saved.mode  | starttime=\"now/M\" endtime=\"now/d+24h\" tag:\"sample04061424\" \| stats count() as cnt by apache.clientip                                                                                                                  |
      | 极简模式200status                | org.saved.mode1 | starttime=\"now/M\" endtime=\"now/d+24h\" tag:\"sample04061424\" \| stats count() as cnt by apache.clientip                                                                                                                  |
      | 200status_continuous_spark   | org.saved.mode2 | tag:continuous                                                                                                                                                                                                               |
      | app_spark_count_byip_sort_授权 | org.saved.mode3 | tag:spark OR tag:c* \| stats count() as cnt by apache.clientip \| sort by cnt                                                                                                                                                |
      | offlinetask_sample           | org.saved.mode4 | * \| transaction apache.status maxspan=1h                                                                                                                                                                                    |
      | lookup_joiner_cidr_wildcard  | org.saved.mode5 | appname:a \| rename 'json.value' as rvalue \| lookup mask,pattern,raw joiner1.csv on json.id=id,json.ip=mask,rvalue=pattern match_type=cidr(json.ip),wildcard(rvalue)\|table json.id, json.ip, rvalue, raw \| sort by rvalue |
      | 索引模式sample                   | org.saved.mode6 | tag:\"sample04061424\" AND get*                                                                                                                                                                                              |

  @newsaved2
  Scenario Outline: 新建监控使用搜索
    When I set the parameter "SearchInput" with value "<splQuery>"
    And I choose the "新建" from the "SavedSearchList"
    And I wait for loading complete

    And I click the "resourceTagDiv" button
    When I wait for loading complete
    And I click the "resourceTagDiv" button
    When I wait for loading complete
    And I set the parameter "SavedSearchName" with value "<name>"
    And I set the parameter "ResourceTagInput" with value "<searchResName>"
    And I choose the "<searchResName>" from the "ResourceGroupList"

    And I click the "EnsureCreateSavedSearch" button
    Then I will see the success message "<message>"

    Examples: 保存成功
      | name          | searchResName    | splQuery                                                                                                                                | message |
      | multiwordsand | org.saved.search | * tag:sample* AND AMAP mac Android                                                                                                      | 创建成功    |
      | where或        | org.saved.search | starttime=\"now/M\" endtime=\"now/d+24h\" tag:\"sample04061424\" \| stats count() as cnt by apache.clientip \| where cnt>17 \|\| cnt<33 | 创建成功    |
      | where与        | org.saved.search | starttime=\"now/M\" endtime=\"now/d+24h\" tag:\"sample04061424\" \| stats count() as cnt by apache.clientip \| where cnt>17 \&\& cnt<33 | 创建成功    |
      | 扩展搜索chart     | org.saved.search | starttime=\"now/d\" endtime=\"now/d+24h\" tag:\"sample04061424\" \| chart count() as cnt over apache.resp_len span=\"500\"              | 创建成功    |
      | 系统配置高亮GET200  | org.saved.search | GET 200                                                                                                                                 | 创建成功    |

  @newsaved3
  Scenario Outline: 添加已存搜索-增删改查、重名
    When I set the parameter "SearchInput" with value "<splQuery>"
    And I choose the "新建" from the "SavedSearchList"

    And I wait for loading complete

    And I set the parameter "SavedSearchName" with value "<name>"

    And I click the "resourceTagDiv" button
    When I wait for loading complete
    And I click the "resourceTagDiv" button
    When I wait for loading complete
    And I set the parameter "SavedSearchName" with value "<name>"
    And I set the parameter "ResourceTagInput" with value "<searchResName>"
    And I choose the "<searchResName>" from the "ResourceGroupList"

    And I click the "EnsureCreateSavedSearch" button
    Then I will see the success message "<message>"

    Examples: 保存成功
      | name                | splQuery             | searchResName  | message |
      | test_load           | * tag:sample04061424 | org.saved.base | 创建成功    |
      | test_delete         | tag:sample04061424   | org.saved.base | 创建成功    |
      | test_duplicate_name | tag:sample04061424   | org.saved.base | 创建成功    |
      | test_duplicate_name | tag:sample04061424   | org.saved.base | 创建成功    |

  @newsaved4
  Scenario Outline: 新建索引模式及高基搜索
    When I set the parameter "SearchInput" with value "<splQuery>"
    And I choose the "新建" from the "SavedSearchList"

    And I wait for loading complete

    And I set the parameter "SavedSearchName" with value "<name>"

    And I click the "resourceTagDiv" button
    When I wait for loading complete
    And I click the "resourceTagDiv" button
    When I wait for loading complete
    And I set the parameter "SavedSearchName" with value "<name>"
    And I set the parameter "ResourceTagInput" with value "<searchResName>"
    And I choose the "<searchResName>" from the "ResourceGroupList"

    And I click the "EnsureCreateSavedSearch" button
    And I wait for loading complete
    Then I will see the success message "创建成功"

    Examples: 保存成功
      | name        | searchResName   | splQuery                                                                                                    | message |
      | spark_cnt   | org.saved.spark | tag:\"sample04061424\" \| stats count() as cnt, max(apache.status) as r_max_status by apache.clientip       | 创建成功    |
      | base_sample | org.saved.spark | starttime=\"now/M\" endtime=\"now/d+24h\" tag:\"sample04061424\" \| stats count() as cnt by apache.clientip | 创建成功    |

  @newsaved5
  Scenario Outline: 权限及数据集相关
    When I set the parameter "SearchInput" with value "<splQuery>"
    And I choose the "新建" from the "SavedSearchList"

    And I wait for loading complete

    And I set the parameter "SavedSearchName" with value "<name>"

    And I click the "resourceTagDiv" button
    When I wait for loading complete
    And I click the "resourceTagDiv" button
    When I wait for loading complete
    And I set the parameter "SavedSearchName" with value "<name>"
    And I set the parameter "ResourceTagInput" with value "<searchResName>"
    And I choose the "<searchResName>" from the "ResourceGroupList"

    And I click the "EnsureCreateSavedSearch" button
    Then I will see the success message "<message>"

    Examples: 保存成功
      | name          | searchResName   | splQuery                                                                | message |
      | spark_dataset | org.saved.spark | tag:sample04061424 OR tag:c* \| stats count() as cnt by apache.clientip | 创建成功    |
@saveds @v36tc
Feature: 已存搜索新建（RZY-150）

  Background:
    Given open the "splSearch.SearchPage" page for uri "/search/"
    And I wait for element "SearchStatus" change text to "搜索完成!"

  Scenario Outline: 新建监控使用已存搜索
    When I set the parameter "SearchInput" with value "<splQuery>"
#    And I click the "DateEditor" button
#    And I click the "Today" button
#    And I click the "SearchButton" button
    And I click the "SavedSearch" button
    And I wait for loading invisible

    And I set the parameter "SavedSearchNameInput" with value "<name>"
    #And I choose the "<searchResName>" from the "SearchResourceInput"
    #And I set the parameter "SearchResourceInput" with value "<searchResName>"

    And I click the "EnsureCreateSavedSearch" button
    Then I will see the success message "<message>"

    @smoke @splSmoke
    Examples: 保存成功
      | name | splQuery                                           | searchResName   | message |
      | multiwordsand | * tag:sample* AND AMAP mac Android            | 1pre_package  | 创建成功 |
      | where或 | starttime=\"now/M\" endtime=\"now/d+24h\" tag:\"sample04061424\" \| stats count() as cnt by apache.clientip \| where cnt>17 \|\| cnt<33  | 1pre_package  | 创建成功 |
      | where与 | starttime=\"now/M\" endtime=\"now/d+24h\" tag:\"sample04061424\" \| stats count() as cnt by apache.clientip \| where cnt>17 \&\& cnt<33   | 1pre_package  | 创建成功 |
      | 扩展搜索chart | starttime=\"now/d\" endtime=\"now/d+24h\" tag:\"sample04061424\" \| chart count() as cnt over apache.resp_len span=\"500\"  | 1pre_package  | 创建成功 |


  Scenario Outline: 添加已存搜索-增删改查及重名
    When I set the parameter "SearchInput" with value "<splQuery>"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I click the "SavedSearch" button
    And I wait for loading invisible

    And I set the parameter "SavedSearchNameInput" with value "<name>"
    #And I choose the "<searchResName>" from the "SearchResourceInput"
    #And I set the parameter "SearchResourceInput" with value "<searchResName>"

    And I click the "EnsureCreateSavedSearch" button
    Then I will see the success message "<message>"

    @smoke @splSmoke
    Examples: 保存成功
      | name | splQuery                                           | searchResName   | message |
      | test_load  | * tag:sample04061424   | 1pre_package  | 创建成功 |
      | test_delete | tag:sample04061424           | 1pre_package  | 创建成功 |
      | test_duplicate_name | tag:sample04061424           | 1pre_package  | 创建成功 |
      | test_duplicate_name | tag:sample04061424            | 1pre_package  | 创建成功 |


  Scenario Outline: 新建索引模式及高基搜索
    When I set the parameter "SearchInput" with value "<splQuery>"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I click the "SavedSearch" button
    And I wait for loading invisible

    And I set the parameter "SavedSearchNameInput" with value "<name>"

    And I click the "EnsureCreateSavedSearch" button
    Then I will see the success message "<message>"

    @smoke @splSmoke
    Examples: 保存成功
      | name  | splQuery                                          | message |
      | spark_cnt|   tag:"sample04061424" \| stats count() as cnt, max(apache.status) as r_max_status by apache.clientip   | 创建成功 |
      | base_sample | starttime="now/M" endtime="now/d+24h" tag:"sample04061424" \| stats count() as cnt by apache.clientip | 创建成功 |

  Scenario Outline: 权限及数据集相关
    When I set the parameter "SearchInput" with value "<splQuery>"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I click the "SavedSearch" button
    And I wait for loading invisible

    And I set the parameter "SavedSearchNameInput" with value "<name>"

    And I click the "EnsureCreateSavedSearch" button
    Then I will see the success message "<message>"

    @smoke @splSmoke
    Examples: 保存成功
      | name    | splQuery                                        | message |
      | app_sparksearch_授权	|   tag:sample04061424 \| stats count() as cnt by apache.clientip    | 创建成功 |
      | spark_dataset|   tag:sample04061424 OR tag:c* \| stats count() as cnt by apache.clientip | 创建成功 |
      | 系统配置高亮 | GET 200  | 1pre_package | 创建成功 |


#@splSmoke
Feature: 搜索配置

  Scenario Outline: RZY-2392:搜索配置_搜索模式_极简模式sample
    Given open the "splSearch.SearchPage" page for uri "/search/"
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I click the "SearchSetting" button
    And I wait for loading invisible
    And I click the "SampleMode" button
    And I alter the input element "FenPianQuYang" value to "100"
    And I "checked" the checkbox which name is "关键字高亮"
    And I wait for "2000" millsecond
    And I click the "CloseBtn" button
    And I set the parameter "SearchInput" with value "<splQuery>"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    #结果数量：72
    Then I will see the element "SearchEventCount" value is "<count>"
    And I wait for "HighLightGet" will be visible
    And I will see the "TimeLine" doesn't exist
    And I will see the "LeftList" doesn't exist

    Examples:
      | splQuery                   |  count   |
      | tag:sample04061424 AND GET |  (72)    |

  Scenario Outline: RZY-2410:索引模式_已存搜索列表
    Given open the "splSearch.SearchPage" page for uri "/search/"
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I set the parameter "SearchInput" with value "<splQuery>"
    And I click the "SearchButton" button
    And I click the "NewSavedSearch" button
    And I wait for loading invisible
    And I set the parameter "OfflineTaskName" with value "<name>"
    And I click the "EnsureCreateSavedSearch" button
    And I click the "AcceptCreateDownloadTask" button
    And I wait for "2000" millsecond
    And I click the "OpenSavedSearchList" button
    And "加载" the data "<name>" in tiny saved search
    Then I will see the input element "SearchInput" value will be "<spl>"



    Examples:
      | splQuery                        |    name        |     spl                          |
      | tag:\"sample04061424\" AND get* | 索引模式sample  |tag:"sample04061424" AND get*    |

  Scenario Outline: RZY-4650:搜索配置_返回条数_yotta索引
    Given open the "splSearch.SearchPage" page for uri "/search/"
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I click the "SearchSetting" button
    And I wait for loading invisible
    And I click the "IndexMode" button
    And I alter the input element "FenPianQuYang" value to "10"
    And I wait for "2000" millsecond
    And I click the "CloseBtn" button
    And I set the parameter "SearchInput" with value "<splQuery>"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    #结果数量：20，即default_shard_size*10
    Then I will see the element "SearchEventCount" value is "<count>"

    Examples:
      | splQuery           |  count   |
      | tag:sample04061424 |  (20)    |

  Scenario Outline: RZY-4654:搜索配置_高亮 - 版本: 1
    Given open the "splSearch.SearchPage" page for uri "/search/"
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I click the "SearchSetting" button
    And I wait for loading invisible
    And I click the "IndexMode" button
    And I alter the input element "FenPianQuYang" value to "10"
    And I "checked" the checkbox which name is "关键字高亮"
    And I wait for "2000" millsecond
    And I click the "CloseBtn" button
    And I set the parameter "SearchInput" with value "<splQuery>"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    #checkPoint:结果数量：20 即default_shard_size*10 且GET高亮
    Then I will see the element "SearchEventCount" value is "<count>"
    And I wait for "HighLightGet" will be visible

    Examples:
      | splQuery                   |  count   |
      | tag:sample04061424 AND GET |  (20)    |


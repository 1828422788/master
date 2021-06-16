@cluster

Feature: 聚类展示

  Background:
    Given open the "splSearch.SearchPage" page for uri "/search/"
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I set the parameter "SearchInput" with value "starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424_display"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"

  Scenario Outline: RZY-2314:logreduce模式_点击数量
    And I click the "Mode" button
    Then I will see the text "无模式搜索结果！" exist in page
    And I click the "ModeSearch" button
    And I wait for loading invisible
    Then I will see the text "<count>" is not existed in page
    And I click the "Count90" button
    And I wait for "2000" millsecond
    Then I will see the text "<count>" exist in page

    Examples:
      |  count   |
      |  (90)    |

  Scenario: RZY-3208:模式_归并_sample
    And I click the "Mode" button
    Then I will see the text "无模式搜索结果！" exist in page
    And I click the "ModeSearch" button
    And I wait for loading invisible
    #未实现检查高亮色块，暂时检测第一行数量，90为第3层
    Then I will see the text "90" exist in page
    And I click the "MergeBtn" button
    And I wait for "3000" millsecond
    #未实现检查高亮色块，暂时检测第一行数量，223为第2层
    Then I will see the text "223" exist in page
    And I click the "BackoffBtn" button
    And I wait for "3000" millsecond
    Then I will see the text "90" exist in page

  Scenario: RZY-3209:归并_顶级_按钮变灰
    And I click the "Mode" button
    Then I will see the text "无模式搜索结果！" exist in page
    And I click the "ModeSearch" button
    And I wait for loading invisible
    #检测第一行数量，90为第3层
    Then I will see the text "90" exist in page
    And I click the "MergeBtn" button
    And I wait for "3000" millsecond
    And I click the "MergeBtn" button
    And I wait for "3000" millsecond
    #检测第一行数量，233为第1层
    Then I will see the text "233" exist in page
    And I will see the "MergeBtn" is "0"
    And I click the "BackoffBtn" button
    And I wait for "3000" millsecond
    And I click the "BackoffBtn" button
    And I wait for "3000" millsecond
    Then I will see the text "90" exist in page
    And I will see the "BackoffBtn" is "0"

  Scenario: RZY-3210:聚类_切分及后退_sample
    And I click the "Mode" button
    Then I will see the text "无模式搜索结果！" exist in page
    And I click the "ModeSearch" button
    And I wait for loading invisible
    #检测第一行数量，90为第3层
    Then I will see the text "90" exist in page
    And I click the "Hierarchy" button
    And I click the "SecondHierarchy" button
    And I wait for "3000" millsecond
    #检测第一行数量，223为第2层
    Then I will see the text "223" exist in page
    And I click the "SegmentationIcon" button
    And I wait for "3000" millsecond
    #检测第一行数量，90为第3层
    Then I will see the text "90" exist in page
    And I click the "BackoffBtn" button
    And I wait for "3000" millsecond
    Then I will see the text "223" exist in page

  Scenario Outline: RZY-4893:归并设置_参数异常值
    And I click the "Mode" button
    Then I will see the text "无模式搜索结果！" exist in page
    And I click the "ModeSearch" button
    And I wait for loading invisible
    And I click the "MergeSetting" button
    And I wait for "<input>" will be visible
    And I alter the input element "<input>" value to "<num>"
    And I click the "EnsureButton" button
    Then I will see the text "<errorMsg>" exist in page

    Examples:
      | input                           |    num    |          errorMsg                                      |
      | InitialDistValue                |        2  |   执行错误: Param error: [initial_dist]                  |
      | AlphaValue                      |      0.5  |     执行错误: Param error: [alpha]                       |
      | StopThreshold                   |        2  |执行错误: Param error: [stop_threshold]                   |
      | MultiAlignThreshold             |        0  |执行错误: Param error: [multi_align_threshold]            |
      | PatternDiscoverAlignThreshold   |        2  |执行错误: Param error: [pattern_discover_align_threshold] |
      | FindClusterAlignThresholdValue  |        2  |执行错误: Param error: [find_cluster_align_threshold]     |

  Scenario: RZY-4894:归并设置_归并IP
    And I click the "Mode" button
    Then I will see the text "无模式搜索结果！" exist in page
    And I click the "ModeSearch" button
    And I wait for loading invisible
    And I click the "MergeSetting" button
    And I wait for "1000" millsecond
    And I click the "MergeIP" button
    And I click the "EnsureButton" button
    #检测点1：聚类结果中的【模式】维度中的具体IP值成为<IP>且底色为灰色

    And I wait for "5000" millsecond
    And I click the "MergeSetting" button
    And I wait for "1000" millsecond
    And I click the "MergeIP" button
    And I click the "EnsureButton" button
    #检测点2：模式维度中的<IP>成为具体的IP且底色为白色

    And I wait for "3000" millsecond

  Scenario: RZY-4895:归并设置_归并URL
    And I click the "Mode" button
    Then I will see the text "无模式搜索结果！" exist in page
    And I click the "ModeSearch" button
    And I wait for loading invisible
    And I click the "MergeSetting" button
    And I wait for "1000" millsecond
    And I click the "MergeURL" button
    And I click the "EnsureButton" button
    #检测点1：URL 被NUM截断，未能被识别

    And I wait for "5000" millsecond
    And I click the "MergeSetting" button
    And I wait for "1000" millsecond
    And I click the "MergeURL" button
    And I click the "EnsureButton" button
    #检测点2：结果与勾选【归并URL】一样

    And I wait for "3000" millsecond

@dblist
Feature: 下载列表查看并下载

  @dblists0
  Scenario Outline: 下载文件到本地
    Given open the "splSearch.OfflineTaskPage" page for uri "/download/"
    Given the data name is "<name>" then i click the "下载" button
#    Then I embedding the text file "<name>" into report

    Examples:
      | name            |
      | atdownload1.csv |
      | atdownload2.csv |

  @dblists1
  Scenario Outline: 过滤文件后，下载到本地
    Given open the "splSearch.OfflineTaskPage" page for uri "/download/#"
    When I set the parameter "DbListPageSearchInput" with value "<name>"
    And I wait for "2000" millsecond
    Given the data name is "<name>" then i click the "下载" button

    Examples:
      | name            |
      | atdownload1.csv |
      | atdownload2.csv |

  Scenario Outline: 搜索框过滤功能
    Given open the "splSearch.OfflineTaskPage" page for uri "/download/#"
    When I set the parameter "DbListPageSearchInput" with value "<name>"
    And I click the "Search" button
    And I wait for loading invisible
    Then I will see the search result "{'column':'0','name':'<name>'}"

    Examples:
      | name        |
      | atdownload1 |

  @deldblist
  Scenario Outline:
    Given open the "splSearch.OfflineTaskPage" page for uri "/download/#"
    When the data name is "<name>" then i click the "删除" button
    And I click the "EnsureButton" button

    Examples:
      | name                                       |
      | tran_ip_maxopen_max.json                   |
      | tran_apachelen_sort.json                   |
      | tran_count_where.json                      |
      | search_highlight_clientip.txt              |
      | search_generall.txt                        |
      | index_yotta_regex.txt                      |
      | search_eventcount.txt                      |
      | search_all_samepre_tag_count.txt           |
      | search_all_nopre_tag_count.txt             |
      | search_highlight_resp_len_char.txt         |
      | search_highlight_clientip.txt              |
      | not_eval_stats_top.txt                     |
      | search_highlight_before_capital_letter.txt |
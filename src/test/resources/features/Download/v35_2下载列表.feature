@dblist
Feature: 下载列表查看并下载

  @dblist0
  Scenario Outline: 下载文件到本地
    Given open the "splSearch.OfflineTaskPage" page for uri "/download/"
    Given the data name is "<name>" then i click the "下载" button
#    Then I embedding the text file "<name>" into report

    Examples:
      | name            |
      | atdownload1.csv |
      | atdownload2.csv |

  @dblist1
  Scenario Outline: 过滤文件后，下载到本地
    Given open the "splSearch.OfflineTaskPage" page for uri "/download/#"
#    When I set the parameter "DbListPageSearchInput" with value "<name>"
#    And I wait for "2000" millsecond
#    Given the data name is "<name>" then i click the "下载" button
    And I wait for "2000" millsecond
#    And take part of "SplStatsRetTable" with name "actual/<splcasename>"
    Then I compare source download file "expect/<name>" with target download files "<name>"

    Examples:
      | name            |
      | tran_ip_maxopen_max.json                       |
      | tran_apachelen_sort.json                       |
#      | tran_count_where.json                          |
#      | search_highlight_clientip.txt                  |
#      | search_generall.txt                            |
#      | index_yotta_regex.txt                          |
#      | search_eventcount.txt                          |
#      | search_all_samepre_tag_count.txt               |
#      | search_all_nopre_tag_count.txt                 |
#      | search_highlight_resp_len_char.txt             |
#      | search_highlight_clientip.txt                  |
#      | not_eval_stats_top.txt                         |
#      | search_highlight_before_capital_letter.txt     |
#      | stats_cnt.csv                                  |
#      | kvextract_request_query_table.csv              |
#      | kvextract_xiaomi_jsonurl.csv                   |
#      | kvextract_h3c_parse_msg_clean_keys_true.csv    |
#      | kvextract_h3c_parse_msg.csv                    |
#      | appendcols_override_index2.csv                 |
#      | eval_printf_1.csv                              |
#      | eventstats_sample_avglen.csv                   |
##      | fillnull_string_to_null_resplen_sample.csv    |
#      | download_cnt_clientip_bystatus_csv_sample.csv  |
#      | makeresults_sample.csv                         |
#      | gf_dapper_tracing.csv                          |
#      | geostats_sample_count.csv                      |
#      | search_all_samepre_tag_count.csv               |
#      | search_all_nopre_tag_count.csv                 |
##      | name.csv                                      |
#      | not_eval_stats_top.csv                         |
##      | parse_chinese_char_maxmatch.csv|
#      | eval_match_query.csv                           |
#      | tran_ip_maxopen_max.csv                        |
#      | bug_tran_with.csv                              |
#      | stats_hg.csv                                   |
#      | stats_pct.csv                                  |
#      | stats_min_timestamp_formatdate.csv             |
#      | stats_stats_avg.csv                            |
#      | top_2_clientip_by_path.csv                     |
#      | bucket_movingavg_rollingstd_eval.csv           |
#      | bucket_timeranges_24h.csv                      |
#      | rollingstd.csv                                 |
#      | bucket_stats_autoregress_eval_where_fields.csv |
#      | tran_stats_cmd_limit.csv                       |
#      | tran_with_stats_fromstate_tostate.csv          |
#      | last_name_mvappend.csv                         |
#      | append_status_sub_eval.csv                     |
#      | sub_join_percent.csv                           |

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
#    When the data name is "<name>" then i click the "删除" button
    When I set the parameter "DbListPageSearchInput" with value "<name>"
    And I wait for "2000" millsecond
    And I click the "DelDownLoadButton" button
    And I click the "EnsureButton" button

    Examples:
      | name                                           |
      | _                                              |
      | _                                              |
      | _                                              |
      | _                                              |
      | _                                              |
      | _                                              |
      | _                                              |
      | _                                              |
      | _                                              |
      | _                                              |
      | _                                              |
      | _                                              |
      | _                                              |
      | _                                              |
      | _                                              |
      | _                                              |
      | _                                              |
      | _                                              |
      | _                                              |
      | _                                              |
      | _                                              |
      | _                                              |
      | _                                              |
      | _                                              |
      | tran_ip_maxopen_max.json                       |
      | tran_apachelen_sort.json                       |
      | tran_count_where.json                          |
      | search_highlight_clientip.txt                  |
      | search_generall.txt                            |
      | index_yotta_regex.txt                          |
      | search_eventcount.txt                          |
      | search_all_samepre_tag_count.txt               |
      | search_all_nopre_tag_count.txt                 |
      | search_highlight_resp_len_char.txt             |
      | search_highlight_clientip.txt                  |
      | not_eval_stats_top.txt                         |
      | search_highlight_before_capital_letter.txt     |
      | stats_cnt.csv                                  |
      | kvextract_request_query_table.csv              |
      | kvextract_xiaomi_jsonurl.csv                   |
      | kvextract_h3c_parse_msg_clean_keys_true.csv    |
      | kvextract_h3c_parse_msg.csv                    |
      | appendcols_override_index2.csv                 |
      | eval_printf_1.csv                              |
      | eventstats_sample_avglen.csv                   |
#      | fillnull_string_to_null_resplen_sample.csv    |
      | download_cnt_clientip_bystatus_csv_sample.csv  |
      | makeresults_sample.csv                         |
      | gf_dapper_tracing.csv                          |
      | geostats_sample_count.csv                      |
      | search_all_samepre_tag_count.csv               |
      | search_all_nopre_tag_count.csv                 |
#      | name.csv                                      |
      | not_eval_stats_top.csv                         |
#      | parse_chinese_char_maxmatch.csv|
      | eval_match_query.csv                           |
      | tran_ip_maxopen_max.csv                        |
      | bug_tran_with.csv                              |
      | stats_hg.csv                                   |
      | stats_pct.csv                                  |
      | stats_min_timestamp_formatdate.csv             |
      | stats_stats_avg.csv                            |
      | top_2_clientip_by_path.csv                     |
      | bucket_movingavg_rollingstd_eval.csv           |
      | bucket_timeranges_24h.csv                      |
      | rollingstd.csv                                 |
      | bucket_stats_autoregress_eval_where_fields.csv |
      | tran_stats_cmd_limit.csv                       |
      | tran_with_stats_fromstate_tostate.csv          |
      | last_name_mvappend.csv                         |
      | append_status_sub_eval.csv                     |
      | sub_join_percent.csv                           |

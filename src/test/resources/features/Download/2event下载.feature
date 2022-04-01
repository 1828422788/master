@dlevent @dlevent0
Feature: download_事件下载part0

  Background:
    Given open the "splSearch.SearchPage" page for uri "/search/"

  Scenario Outline: 下载子查询
    Given I set the parameter "SearchInput" with value "<splQuery>"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    Then take a screenshot with name "downloadpng/<name>"

    And I wait for "DownloadEvent" will be visible
    Then I click the "DownloadEvent" button
    And I set the parameter "DownloadName" with value "<name>"
    And I set the parameter "MaxLineNum" with value "100"
    Then I click the "CreateDownloadTask" button
    Then I will see the success message "提交成功，请到设置-下载管理页查看下载状态！"

    #下载到本地
    Given open the "splSearch.OfflineTaskPage" page for uri "/download/#"
    And I set the parameter "DbListPageSearchInput" with value "<name>.txt"
    And I click the "ListDownloadButton" button

    Examples:
      | name                                        | splQuery                                                                                                                                                                                                                                                                            |
      | sub_join_inner3                             | starttime = \"now/d\" endtime = \"now/d+24h\" tag:sample04061424 \| fields apache.clientip, apache.method \| join type=inner apache.clientip [[starttime = \"now/d\" endtime = \"now/d+24h\" tag:\"sample04061424\" \| stats avg(apache.status) as sub_status by apache.clientip ]] |
      | sub_count                                   | (logtype:apache AND tag:\"sample04061424\") AND [[ appname:apache \| stats count(apache.method) as method_count by apache.method \|  sort by method_count \| limit 1 \| fields apache.method]]                                                                                      |
      | sub4                                        | (logtype:apache AND tag:\"sample04061424\") AND [[ appname:apache \| stats count(apache.method) as method_count by apache.method \| sort by method_count \| limit 1 \| fields apache.method]]                                                                                       |
      | sub5                                        | (logtype:apache AND tag:\"sample04061424\") AND [[ logtype:apache AND [[ * \| stats count(appname) by apache.method \| fields apache.method \| limit 2 ]] \| stats count(appname) as appcount by apache.method \| fields apache.method ]]                                           |
      | sub6                                        | (logtype:apache AND tag:\"sample04061424\") AND [[ logtype:apache AND [[ * \| stats count(appname) by apache.method \| fields apache.method \| limit 2 ]] \| stats count(appname) as appcount by apache.method \| fields apache.method ]]                                           |
      | sub7                                        | (logtype:apache AND tag:\"sample04061424\") AND [[ * \| stats es(apache.status) as es_status by apache.method \| fields apache.method ]]                                                                                                                                            |
      | sub_sample                                  | tag:\"sample04061424\" AND [[ tag:\"sample04061424\"  \| stats count(apache.clientip) as count_ by apache.clientip \| sort by count_ \| limit 1 \| fields apache.clientip ]]                                                                                                        |
      | sub_sample1                                 | starttime=\"now/d\" endtime=\"now/d+24h\" tag:\"sample04061424\" AND [[ tag:\"sample04061424\"\| stats count(apache.clientip) by apache.clientip, apache.method \| limit 2 \| fields apache.clientip apache.method ]]                                                               |
      | sub_es                                      | tag:\"sample04061424\" AND [[tag:\"sample04061424\" \| stats es(apache.status) by apache.method \| fields apache.method]]                                                                                                                                                           |
      | sub_join_left2                              | tag:\"sample04061424\"\| fields apache.method apache.clientip \| join type=left apache.clientip [[ tag:\"sample04061424\" \| stats sum(apache.status) by apache.clientip ]]                                                                                                         |
      | sub_where_count_big5                        | (apache.resp_len:69 AND tag:\"sample04061424\") AND [[tag:\"sample04061424\" \| stats count(apache.clientip) as count_ by apache.clientip,apache.method \| where count_>5 \| fields apache.clientip,apache.method ]]                                                                |
      | search_generall                             | tag:sample04061424                                                                                                                                                                                                                                                                  |
      | index_yotta_tag                             | index=* tag:sample04061424                                                                                                                                                                                                                                                          |
      | index_yotta_regex                           | index=yotta tag:sample04061424 AND  /[0][8]0{2,2}/                                                                                                                                                                                                                                  |
      | index_all_tag_regex                         | index=* starttime=\"now/d\" endtime=\"now/d+24h\" tag:*04061424                                                                                                                                                                                                                     |
      | search_eventcount                           | tag:sample04061424 AND apache.referer_domain:\"m5.baidu.com\" AND apache.clientip:\"23.166.125.53\"                                                                                                                                                                                 |
      | search_fieldstats                           | tag:sample04061424 AND apache.request_path:\"/index/login/\" apache.status:\"200\"                                                                                                                                                                                                  |
      | search_and_logic                            | tag:sample04061424 AND (Mobile  Mozilla apache.resp_len:\"69\")                                                                                                                                                                                                                     |
      | search_and_logic_filterfield_match          | starttime=\"now/d\" endtime=\"now/d+24h\" ((* AND appname:apache) AND tag:sample04061424) AND (apache.ua:Mozilla*)                                                                                                                                                                  |
      | search_not_and                              | tag:sample04061424 69 (NOT SAMSUNG)                                                                                                                                                                                                                                                 |
      | search_not                                  | tag:sample04061424 (NOT Mozilla)                                                                                                                                                                                                                                                    |
      | search_regex                                | tag:sample04061424 AND /0{2,2}/                                                                                                                                                                                                                                                     |
      | search_uppercase_full_text_retrieval        | starttime=\"now/d\" endtime=\"now/d+24h\" RC                                                                                                                                                                                                                                        |
      | search_notless                              | tag:sample04061424 AND apache.status:>=404                                                                                                                                                                                                                                          |
      | search_greater                              | tag:sample04061424 AND apache.status:>301                                                                                                                                                                                                                                           |
      | search_and1                                 | tag:sample04061424 AND apache.status:200 Build                                                                                                                                                                                                                                      |
      | search_bracket                              | tag:sample04061424 AND apache.status:200 AND \"mac\" AND (apache.clientip:12.234.8.15 OR apache.clientip:13.78.39.216 OR apache.clientip:22.132.197.8)                                                                                                                              |
      | search_filterfield_uppercase_fuzzy_match1   | tag:sample04061424 AND apache.ua:Mozilla*                                                                                                                                                                                                                                           |
      | search_chinese_fuzzy_match                  | tag:chinese_fuzzy_match 企*                                                                                                                                                                                                                                                          |
      | search_log4j                                | tag:\"sample04061424_log4j_100\"                                                                                                                                                                                                                                                    |
      | search_highlight_get                        | tag:sample04061424 AND get*                                                                                                                                                                                                                                                         |
      | search_highlight_gf_bond_start              | tag:highlight_gf_bond_56 justLogSplRequest start                                                                                                                                                                                                                                    |
      | search_highlight_resp_len_char              | tag:sample04061424 AND apache.resp_len:\"93\"                                                                                                                                                                                                                                       |
      | search_highlight_resp_len_int               | tag:sample04061424 AND apache.resp_len:93                                                                                                                                                                                                                                           |
      | search_highlight_clientip                   | tag:sample04061424 AND apache.clientip:23*                                                                                                                                                                                                                                          |
      | search_syntax_equal_word_highlight          | tag:sample04061424_syntax_equal_5 AND \"api\\\\=user\"                                                                                                                                                                                                                              |
      | search_syntax_equal_2word_noquote_highlight | tag:sample04061424_syntax_equal_5 AND api\\\\=user                                                                                                                                                                                                                                  |
      | search_syntax_equal_string_highlight        | tag:sample04061424_syntax_equal_5 AND user.passport.loginLog                                                                                                                                                                                                                        |
    @search_regex_match_ip_highlight
    Examples:
      | name                                   | splQuery                                                                                                                                                                                                                   |
      | search_regex_match_ip_highlight        | tag:sample04061424_syntax_equal_5 AND  /[0-9]{3}.[0-9]{1}.[0-9]{3}.[0-9]{1}/                                                                                                                                               |

      | search_regex_match_3string_highlight   | tag:sample04061424_syntax_equal_5  AND /[a-z]{4}/ /[a-z]{7}/                                                                                                                                                               |
      | search_chinese                         | tag:sample04061424_chinese_5                                                                                                                                                                                               |
      | search_raw                             | tag:sample04061424_raw_36                                                                                                                                                                                                  |
      | search_upload_noappname                | tag:\"sample04061424_noappname_36\"                                                                                                                                                                                        |
      | search_highlight_last_update_timestamp | tag:last_update_timestamp_100 AND last_update_timestamp                                                                                                                                                                    |
      | search_highlight_last_asterisk_match   | tag:last_update_timestamp_100 AND last*                                                                                                                                                                                    |
      | search_highlight_before_capital_letter | tag:highlight_huawei_10 \"the message is\"                                                                                                                                                                                 |
      | start_time_para_mon                    | starttime=\"now-1M/M-1d/w\"  endtime=\"now\" tag:sample04061424                                                                                                                                                            |
      | startt_today                           | starttime=\"now/d\" endtime=\"now\" tag:sample04061424                                                                                                                                                                     |
      | limit_1                                | tag:\"sample04061424\"\| limit 10                                                                                                                                                                                          |
      | dedup_default                          | tag:sample04061424 \| dedup apache.status \| sort by timestamp                                                                                                                                                             |
      | fields_result_seq                      | tag:\"sample04061424\" \| fields appname, tag, apache.clientip, apache.geo.country, apache.request_path, apache.status, apache.resp_len, apache.method, apache.x_forward \| sort by  apache.x_forward                      |
      | rename_apache_fields_sort              | starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424 \| rename apache.* as test.* \| fields test.clientip, test.resp_len, test.status, test.x_forward, test.request_query \| sort by test.x_forward, test.clientip |
      | spl_eval_add                           | tag:sample04061424 \| eval status = apache.status \| eval resp_len =  apache.resp_len \| eval status_add0=apache.status+0 \| eval len_add0=resp_len+0                                                                      |
      #v3.6版本自动添加字段
      | autofield_jpath_output_city_sample     | tag:json_jpath_mv_where \| jpath output=city path=\"a[*].city\"                                                                                                                                                            |
      | autofield_spl_eval_empty               | tag:sample04061424 \| eval path_is_empty=empty(apache.resp_len)                                                                                                                                                            |
      | autofield_spl_eval_match               | tag:\"sample04061424\" AND apache.request_query:* \| eval r_match1 = match(apache.request_query, \"b.*e\")                                                                                                                 |
      | autofield_spl_eval_parse               | tag:sample04061424 AND  apache.x_forward:1\| parse \"(?<digital_list>\\\\d+)\" max_match=100                                                                                                                               |
      | autofield_spl_eval_kvextract           | tag:sample04061424 \| sort by -apache.x_forward \| limit 3 \| kvextract apache.request_query clean_keys=true pairdelim=\"&\" kvdelim=\"=\"                                                                                 |

  @dltran
  Scenario Outline: 下载transaction
    Given I set the parameter "SearchInput" with value "<splQuery>"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    Then take a screenshot with name "downloadpng/<name>"

    And I wait for "DownloadEvent" will be visible
    Then I click the "DownloadEvent" button
    And I set the parameter "DownloadName" with value "<name>"
    And I set the parameter "MaxLineNum" with value "100"
    And I choose the "JSON" from the "DocumentTypeList"
    And I choose the "UTF-8" from the "DocumentEncodeList"
    Then I click the "CreateDownloadTask" button
    Then I will see the success message "提交成功，请到设置-下载管理页查看下载状态！"

    #下载到本地
    Given open the "splSearch.OfflineTaskPage" page for uri "/download/#"
    When I set the parameter "DbListPageSearchInput" with value "<name>.json"
    And I click the "ListDownloadButton" button

    Examples:
      | name                                            | splQuery                                                                                                                                                                                                                 |
      | eval_case_tran                                  | tag:sample04061424_display OR tag:sample04061424_chart \| eval status_com = case(tag==\"sample04061424_display\", apache.status, tag==\"sample04061424_chart\", apache.status) \| transaction status_com maxevents=100   |
      | rename_apache_tran2len_sort                     | starttime=\"now/d\" endtime=\"now/d+24h\" tag:\"sample04061424\" \| rename apache.* as new.* \| transaction new.resp_len keepevicted=true \| sort by new.resp_len                                                        |
      | transaction_status_sortfield_sample             | tag:sample04061424 AND (NOT apache.status:499 AND NOT apache.status:206) \| transaction apache.status keepevicted=true sortfield=apache.x_forward \| limit 2                                                             |
      | transaction_status_sortfield_forward_desc       | tag:sample04061424 AND (NOT apache.status:499 AND NOT apache.status:206) \| transaction apache.status keepevicted=true sortfield=-apache.x_forward \| limit 2                                                            |
      | transaction_status_sortfield_forward_asc        | tag:sample04061424 AND (NOT apache.status:499 AND NOT apache.status:206) \| transaction apache.status keepevicted=true sortfield=+apache.x_forward \| limit 2                                                            |
      | transaction_status_sortfield_clientip           | tag:sample04061424 AND (NOT apache.status:499 AND NOT apache.status:206) \| transaction apache.status keepevicted=true sortfield=apache.clientip \| limit 2                                                              |
      | transaction_clientip_sortfield_resplen_xforward | tag:sample04061424 AND (NOT apache.status:499 AND NOT apache.status:206) \| transaction apache.clientip keepevicted=true sortfield=apache.resp_len,apache.x_forward \| limit 2                                           |
      | transaction_clientip_sortfield_resplen          | tag:sample04061424 AND (NOT apache.status:499 AND NOT apache.status:206) \| transaction apache.clientip keepevicted=true sortfield=+apache.resp_len \| limit 2                                                           |
      | tran_ip_maxopen_max                             | (logtype:apache AND tag:sample04061424) \| transaction apache.clientip maxopenevents=10 maxevents=10                                                                                                                     |
      #add
      | tran_apachelen_sort                             | tag:sample04061424 \| transaction  apache.resp_len keepevicted=true \| sort by apache.resp_len                                                                                                                           |
      #add
      | tran_sort_ascend                                | tag:sample04061424 \| transaction apache.status keepevicted=true\| sort by + apache.status                                                                                                                               |
      | tran_param_max_txn_maxopen10                    | tag:sample04061424 \| transaction apache.status maxevents=10 maxopentxn=100 maxopenevents=100                                                                                                                            |
      | tran_param_max_txn_maxopen3                     | tag:sample04061424 AND apache.status:\"200\" \| transaction apache.status maxevents=3 maxopentxn=100 maxopenevents=100                                                                                                   |
      #add
      | tran_status_contains_maxevents_10               | tag:sample04061424 AND clientconfig \| transaction apache.status keepevicted=true maxevents=10 maxopenevents=100 contains=\"clientconfig\"                                                                               |
      #add
      | tran_status_contains_maxevents_100              | tag:sample04061424 AND clientconfig \| transaction apache.status  keepevicted=true maxevents=100 maxopenevents=100 contains=\"clientconfig\"                                                                             |
      | tran_method_max_maxopen_contains1               | \"clientconfig\" AND tag:sample04061424 \| transaction apache.method contains=\"clientconfig\"  maxevents=10 maxopenevents=100                                                                                           |
      #add
      | tran_method_max_maxopen_contains2               | \"GET /index/portal/\" AND tag:sample04061424 \| transaction apache.method contains=\"GET /index/portal/\" keepevicted=true maxevents=300 maxopenevents=1000                                                             |
      #add
      | tran_count_where                                | tag:sample04061424 \| transaction apache.resp_len keepevicted=true \| where _count==4                                                                                                                                    |
      #add
#      | tran_duration_where | tag:sample04061424 \| transaction apache.resp_len keepevicted=true \| where _duration<500 |
      | tran_endswith_eval_contains                     | tag:sample04061424 \| transaction apache.clientip endswith=eval(apache.status == 200) maxevents=10 contains=\"Dalvik\"                                                                                                   |
      | tran_startswith_endswith_maxspan_5s             | starttime = \"now/d\" endtime = \"now\" tag:sample04061424 \| transaction apache.clientip startswith=\"Android\" endswith=\"Dalvik\" maxspan=5s maxevents=50 maxopentxn=1000 maxopenevents=1000                          |
      #add
      | tran_startswith_endswith_maxopenevents2         | starttime=\"now/d\" endtime = \"now/d+24h\" tag:sample04061424 \| transaction apache.clientip  startswith=\"1977\" endswith=\"Android 4.3\"  keepevicted=true maxspan=1d maxevents=50 maxopentxn=1000 maxopenevents=1000 |
      #add
      | tran_sort                                       | tag:sample04061424 \| transaction apache.resp_len keepevicted=true \| sort by apache.resp_len                                                                                                                            |
      | bug_tran_with                                   | tag:t_with \| transaction json.sid keepevicted=true with states a, b, c in json.module results by flow                                                                                                                   |


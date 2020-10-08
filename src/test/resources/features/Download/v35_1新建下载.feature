@db1
Feature: 新建下载任务

  Background:
    Given open the "splSearch.SearchPage" page for uri "/search/"

  @dbstats
  Scenario Outline: 新建下载任务3个
    Given I set the parameter "SearchInput" with value "<splQuery>"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for "2000" millsecond
    And I wait for element "SearchStatus" change text to "搜索完成!"

    And I wait for "2000" millsecond
    Then I click the "downloadButton" button
    Then I set the parameter "DownloadName" with value "<name>"
    Then I set the parameter "MaxLineNum" with value "<lNum>"
#    Then I choose the "<unit>" from the "MaxLineDropdown"
    Then I choose the "<fileType>" from the "DocumentTypeList"
    Then I choose the "<encode>" from the "DocumentEncodeList"
    Then I click the "CreateDownloadTask" button
    And I wait for "2000" millsecond
    Then I will see the success message "提交成功，请到设置-下载管理页查看下载状态！"

    Examples: 新建成功
      | name                                      | lNum | unit | fileType | encode | splQuery                                                                                                                                                                                                                                                                           |
      | stats_cnt                                 | 100  | 行    | CSV      | UTF-8  | tag:sample04061424 \| stats count() as cnt                                                                                                                                                                                                                                         |
      | kvextract_request_query_table             | 100  | 行    | CSV      | UTF-8  | tag:sample04061424 \| sort by -apache.x_forward \| limit 10 \| kvextract apache.request_query pairdelim=\"&\" kvdelim=\"=\" \| table apache.status, apache.resp_len, gw_address, gw_port                                                                                           |
      | kvextract_xiaomi_jsonurl                  | 100  | 行    | CSV      | UTF-8  | tag:sample04061424_xiaomi_3 \| kvextract json.url pairdelim=\"&\" kvdelim=\"=\" \| table stamp, props                                                                                                                                                                              |
      | kvextract_h3c_parse_msg_clean_keys_true   | 100  | 行    | CSV      | UTF-8  | tag:sample04061424_h3c_kv_1 \| parse field=raw_message \"(?<message>DEV_TYPE[\S+\s+]+)rule_ID(?<message1>[\S+\s+]+)\" \| fields message \| kvextract message clean_keys=true pairdelim=\";\" kvdelim=\"=\" \| fields -message \| table *                                           |
      | kvextract_h3c_parse_msg                   | 100  | 行    | CSV      | UTF-8  | tag:sample04061424_h3c_kv_1 \| parse field=raw_message \"(?<message>DEV_TYPE[\S+\s+]+)rule_ID(?<message1>[\S+\s+]+)\" \| fields message \| kvextract message pairdelim=\";\" kvdelim=\"=\" \| fields -message \| table *                                                           |
      | appendcols_override_index2                | 100  | 行    | CSV      | UTF-8  | tag:sample04061424 \| stats count(apache.clientip)  \| appendcols override=true  [[ index=*  tag:sample04061424_display \| stats count(apache.clientip) ]]                                                                                                                         |
      | eval_printf_1                             | 100  | 行    | CSV      | UTF-8  | tag:sample04061424 \| sort by apache.x_forward \| limit 1 \| eval aa=printf(\"%04d\",1) \| table aa                                                                                                                                                                                |
      | eventstats_sample_avglen                  | 100  | 行    | CSV      | UTF-8  | tag:sample04061424  \| where apache.resp_len > 100 &&  apache.resp_len < 500 \| eventstats  avg(apache.resp_len) as avglen \| table apache.resp_len, avglen                                                                                                                        |
      | fillnull_string_to_null_resplen_sample    | 100  | 行    | CSV      | UTF-8  | starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424 AND NOT apache.resp_len:* \| fillnull value=\"66\" apache.resp_len \ eval type_apache.resp_len = typeof(apache.resp_len) \| table apache.resp_len, type_apache.resp_len, apache.x_forward \| sort by apache.x_forward |
      | download_cnt_clientip_bystatus_csv_sample | 100  | 行    | CSV      | UTF-8  | starttime=\"now/d\" endtime="now/d+24h\" tag:sample04061424_chart \| chart count() over apache.clientip by apache.status \| download filename=\"download_cnt_clientip_bystatus_csv_sample\" fileformat=\"csv\"                                                                     |
      | makeresults_sample                        | 100  | 行    | CSV      | UTF-8  | \| makeresults count = 1 \| eval tag = \"sample04061424\" \| map \"starttime=\"now/d\" endtime=\"now/d+24h\" tag:$tag$ \| table apache.status, apache.resp_len,apache.clientip \| sort by apache.status, apache.resp_len,apache.clientip\"                                         |
      | gf_dapper_tracing                         | 100  | 行    | CSV      | UTF-8  | tag:gf_dapper* AND dapper.msg.traceId:\"511f8756ce1d0b8a\" dapper.msg.duration:>0 \| table dapper.msg.id, dapper.msg.parentId, dapper.class, dapper.msg.duration, dapper.msg.timestamp, dapper.msg.binaryAnnotations[].value, collector_recv_timestamp \| sort by dapper.msg.id    |
      | geostats_sample_count                     | 3000 | 行    | CSV      | UTF-8  | tag:vendors_461 \| geostats latfield=vendors.VendorLatitude longfield=vendors.VendorLongitude count() as cnt                                                                                                                                                                       |
      | search_all_samepre_tag_count              | 100  | 行    | CSV      | UTF-8  | index=* starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424* \| top 100 tag \| sort by count,tag                                                                                                                                                                          |
      | search_all_nopre_tag_count                | 100  | 行    | CSV      | UTF-8  | index=* starttime=\"now/d\" endtime=\"now/d+24h\" NOT tag:sample04061424* \| top 10 tag \| sort by tag                                                                                                                                                                             |
#      | name                                      | 100  | 行    | CSV      | UTF-8  |                                                                                                                                                                                                                                                                              |
      | not_eval_stats_top                        | 100  | 行    | TXT      | UTF-8  | tag:sample04061424 AND (NOT apache.status:200) \| eval status = apache.status \| stats top(status,10)                                                                                                                                                                              |

  @dbevent
  Scenario Outline: 新建事件数3个
    Given I set the parameter "SearchInput" with value "<splQuery>"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for "2000" millsecond
    And I wait for element "SearchStatus" change text to "搜索完成!"

    And I wait for "2000" millsecond
    Then I click the "DownloadEvent" button
    Then I set the parameter "DownloadName" with value "<name>"
    Then I set the parameter "MaxLineNum" with value "<lNum>"
    Then I choose the "<fileType>" from the "DocumentTypeList"
    Then I choose the "<encode>" from the "DocumentEncodeList"
    Then I click the "CreateDownloadTask" button
    And I wait for "2000" millsecond
    Then I will see the success message "提交成功，请到设置-下载管理页查看下载状态！"

    Examples:
      | name                                   | lNum | unit | fileType | encode | splQuery                                                                                             |
      | tran_ip_maxopen_max                    | 100  | 行    | JSON     | UTF-8  | (logtype:apache AND tag:sample04061424) \| transaction apache.clientip maxopenevents=10 maxevents=10 |
#      | tran_apachelen_sort                    | 100  | 行    | JSON     | UTF-8  | tag:sample04061424 \| transaction  apache.resp_len \| sort by apache.resp_len                         |
#      | tran_count_where                       | 100  | 行    | JSON     | UTF-8  | tag:sample04061424 \| transaction apache.resp_len \| where _count>0                                   |
#      | bug_tran_with                          | 100  | 行    | CSV      | UTF-8  | tag:t_with \| transaction json.sid with states a, b, c in json.module results by flow                 |
      | search_generall                        | 100  | 行    | TXT      | UTF-8  | tag:sample04061424                                                                                   |
      | index_yotta_regex                      | 100  | 行    | TXT      | UTF-8  | index=yotta tag:sample04061424 AND  /[0][8]0{2,2}/                                                   |
      | search_eventcount                      | 100  | 行    | TXT      | UTF-8  | tag:sample04061424 AND apache.referer_domain:\"m5.baidu.com\" AND apache.clientip:\"23.166.125.53\"  |
      | search_highlight_resp_len_char         | 100  | 行    | TXT      | UTF-8  | tag:sample04061424 AND apache.resp_len:\"93\"                                                        |
      | search_highlight_clientip              | 100  | 行    | TXT      | UTF-8  | tag:sample04061424 AND apache.clientip:23*                                                           |
      | search_highlight_before_capital_letter | 100  | 行    | TXT      | UTF-8  | tag:highlight_huawei_10 \"the message is\"                                                           |
#      | name | 100  | 行    | CSV      | UTF-8  |       |




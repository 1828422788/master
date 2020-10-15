@dblist
Feature: 下载列表查看并下载

  @v35dblevent
  Scenario Outline: 过滤文件后，下载到本地
    Given open the "splSearch.OfflineTaskPage" page for uri "/download/#"
    When I set the parameter "DbListPageSearchInput" with value "<name>"
    And I wait for "1000" millsecond
    Given the data name is "<name>.txt" then i click the "下载" button
    And I wait for "1000" millsecond
    Then I compare source download file "expect/<name>.txt" with target download files "<name>.txt"

    Examples:
      | name                                         | splQuery                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      |
      | search_verify_chart_log | starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424_chart |
      | search_generall | tag:sample04061424 |
      | index_yotta_tag | index=* tag:sample04061424 |
      | index_yotta_regex | index=yotta tag:sample04061424 AND  /[0][8]0{2,2}/ |
      | index_yotta_all | index=yotta starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424* |
      | index_internal | index=internal * |
      | index_schedule | index=schedule * |
      | search_eventcount | tag:sample04061424 AND apache.referer_domain:\"m5.baidu.com\" AND apache.clientip:\"23.166.125.53\" |
      | search_all_samepre_tag_count | index=* starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424* \| top 100 tag \| sort by count,tag |
      | search_all_nopre_tag_count | index=* starttime=\"now/d\" endtime=\"now/d+24h\" NOT tag:sample04061424* \| top 100 tag \| sort by tag |
      | search_fieldstats | tag:sample04061424 AND apache.request_path:\"/index/login/\" apache.status:\"200\" |
      | search_and_logic | tag:sample04061424 AND (Mobile  Mozilla apache.resp_len:\"69\") |
      | search_and_logic_filterfield_match | starttime=\"now/d\" endtime=\"now/d+24h\" ((* AND appname:apache) AND tag:sample04061424) AND (apache.ua:Mozilla*) |
      | search_not_and | tag:sample04061424 69 (NOT SAMSUNG) |
      | search_not | tag:sample04061424 (NOT Mozilla) |
      | search_regex | tag:sample04061424 AND /0{2,2}/ |
      | search_uppercase_full_text_retrieval | starttime=\"now/d\" endtime=\"now/d+24h\" RC |
      | search_notless | tag:sample04061424 AND apache.status:>=404 |
      | search_greater | tag:sample04061424 AND apache.status:>301 |
      | search_and1 | tag:sample04061424 AND apache.status:200 Build |
      | search_bracket | tag:sample04061424 AND apache.status:200 AND \"mac\" AND (apache.clientip:12.234.8.15 OR apache.clientip:13.78.39.216 OR apache.clientip:22.132.197.8) |
      #| search_filterfield_uppercase_fuzzy_match | tag:sample04061424 AND apache.ua:Mozilla\/5.* |
      | search_filterfield_uppercase_fuzzy_match1 | tag:sample04061424 AND apache.ua:Mozilla* |
      | search_filterfield_lowercase_fuzzy_match | tag:sample04061424 AND  apache.referer_domain:m5* \| table apache.referer_domain |
      | search_filterfield_data_fuzzy_match | tag:sample04061424 AND NOT 'apache.clientip':*2* \| sort by apache.clientip \| table apache.clientip |
      | search_filterfield_chinese_fuzzy_match | tag:sample04061424_json_sdyd_float_59  json.name:用* \| table json.name |
      | search_chinese_fuzzy_match | tag:chinese_fuzzy_match 企* |
      | search_regex_json | tag:sample04061424_regex_json_100 |
      | search_json_sdyd_41 | tag:\"sample04061424_json_sdyd_41\" |
      | search_json_sdyd_float | tag:\"sample04061424_json_sdyd_float_59\" |
      | search_log4j | tag:\"sample04061424_log4j_100\" |
      | search_highlight_get | tag:sample04061424 AND get* |
      | search_highlight_gf_bond_start | tag:highlight_gf_bond_56 justLogSplRequest start |
      | search_highlight_resp_len_char | tag:sample04061424 AND apache.resp_len:\"93\" |
      | search_highlight_resp_len_int | tag:sample04061424 AND apache.resp_len:93 |
      | search_highlight_clientip | tag:sample04061424 AND apache.clientip:23* |
      | search_highlight_version | tag:sample04061424 AND apache.status:version |
      | search_syntax_equal | tag:sample04061424_syntax_equal_5 AND api\"=\"/[a-z]{4}.[a-z]{8}.[a-z]{8}/ |
      | search_syntax_1word_wildcard_highlight | tag:sample04061424_syntax_equal_5 AND user.* |
      | search_syntax_equal_word_highlight | tag:sample04061424_syntax_equal_5 AND \"api\=user\" |
      | search_syntax_equal_2word_noquote_highlight | tag:sample04061424_syntax_equal_5 AND api\=user |
      | search_syntax_equal_string_highlight | tag:sample04061424_syntax_equal_5 AND user.passport.loginLog |
      | search_regex_match_ip_highlight | tag:sample04061424_syntax_equal_5 AND  /[0-9]{3}.[0-9]{1}.[0-9]{3}.[0-9]{1}/ |
      | search_regex_match_3string_highlight | tag:sample04061424_syntax_equal_5  AND /[a-z]{4}/ /[a-z]{7}/ |
      | search_regex_match_3string_highlight_noret | tag:sample04061424_syntax_equal_5  AND /[a-z]{4}/ /[a-z]{7}/ /[a-z]{100}/ |
      | search_chinese | tag:sample04061424_chinese_5 |
      | search_raw | tag:sample04061424_raw_36 |
      | search_upload_noappname | tag:\"sample04061424_noappname_36\" |
      | search_alert_yctv | tag:\"sample04061424_yctv_100\" AND cgi.loglevel:ERROR AND  (NOT \"errno 104\") AND (NOT \"code 0\") AND (NOT \"errno 111\") AND (NOT \"errno 106\") AND (NOT \"verify failed\") AND (NOT \"errno 101\") AND (NOT \"errno 115\") AND (NOT \"errno 117\") AND (NOT \"Detect failed\") AND (NOT \"errno 109\") AND (NOT \"Job failed\") |
      | search_xiaomi_syntax | tag:\"sample04061424_xiaomi_3\" AND (invalid \"did=\"yunyi.ba12*) |
      | search_two_index | starttime=\"now-1d/d\" endtime=\"now/d+7h\" tag:two_index |
      | search_fields_range | tag:sample04061424 AND apache.resp_len:[1 TO 5049] \| eval r_type=typeof(apache.resp_len) \| stats count() as cnt by apache.status, r_type \| sort by cnt, apache.status |
      | not_eval_stats_top | tag:sample04061424 AND (NOT apache.status:200) \| eval status = apache.status \| stats top(status,10) |
      | search_highlight_last_update_timestamp | tag:last_update_timestamp_100 AND last_update_timestamp |
      | search_highlight_last_asterisk_match | tag:last_update_timestamp_100 AND last* |
      | search_highlight_before_capital_letter | tag:highlight_huawei_10 \"the message is\" |
      | start_time_para_mon | starttime=\"now-1M/M-1d/w\"  endtime=\"now\" tag:sample04061424 |
      | start_time_value | starttime=2017-08-13 endtime=2017-08-13:23:59:00 tag:sample |
      | startt_today | starttime=\"now/d\" endtime=\"now\" tag:sample04061424 |
      | limit_1 | tag:\"sample04061424\"\| limit 10 |
      | gf_dapper_tracing | tag:gf_dapper* AND dapper.msg.traceId:\"511f8756ce1d0b8a\" dapper.msg.duration:>0 \| table dapper.msg.id, dapper.msg.parentId, dapper.class, dapper.msg.duration, dapper.msg.timestamp, dapper.msg.binaryAnnotations[].value, collector_recv_timestamp \| sort by dapper.msg.id |
      | tracing_mvszip_mvexpand_parse | tag:gf_dapper* AND 'tag':gf_dapper_mould_3 \| eval aa=mvszip(mvszip(dapper.msg.annotations[].endpoint.serviceName,dapper.msg.annotations[].timestamp),dapper.msg.annotations[].value)\|mvexpand aa\|parse field=aa \"(?<aname>[^,]*),(?<atime>[^,]*),(?<avalue>\S+)\"\|sort by +atime \| table atime,dapper.msg.name,dapper.msg.traceId,dapper.msg.parentId,dapper.msg.id,dapper.msg.duration,aname,avalue,dapper.msg.binaryAnnotations[].endpoint.serviceName,dapper.msg.binaryAnnotations[].key,dapper.msg.binaryAnnotations[].value\|rename dapper.time as time,dapper.mtype as mtype,dapper.msg.name as fundname,dapper.msg.traceId as traceId,dapper.msg.parentId as parentId,dapper.msg.id as id,dapper.msg.duration as duration,dapper.msg.binaryAnnotations[].endpoint.serviceName as daname,dapper.msg.binaryAnnotations[].key as dakey,dapper.msg.binaryAnnotations[].value as davalue\|eval time=formatdate(tolong(substring(tostring(atime),0,13)))\|fields time,fundname,traceId,parentId,id,duration,aname,avalue,daname,dakey,davalue |
      | transpose_count | tag:\"sample04061424\" \| stats count() as cnt by apache.method, apache.status \| transpose row=apache.method column=apache.status valuefield=cnt |
      | transpose_pct | tag:\"sample04061424\" \| stats pct(apache.status,1,5,25,50,75,95,99) as pct_ by apache.method \| transpose row=pct_.1 column=apache.method valuefield=pct_.5 |
      | transpose_table | starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424_apachesample_dawn \| table apache.geo.longitude,apache.geo.latitude, apache.clientip \| transpose row=apache.geo.longitude column=apache.geo.latitude valuefield=apache.clientip |
      | transpose_eval_table | tag:sample04061424_chart \| stats avg(apache.resp_len) as avglen by  apache.clientip \| eval int_avglen = floor(avglen) \| sort by avglen  \| transpose row=apache.clientip column=int_avglen valuefield=avglen |
      | transpose_bucket_stats_eval_autoregress | starttime=\"now/d\" endtime=\"now+d/d\" tag:sample04061424_apachesample_dawn \|bucket timestamp span=1h as ts\|stats count() as count_app by ts\|eval time=formatdate(ts,\"HH:mm:ss\") \|autoregress count_app p=3 \|transpose row=ts column=time valuefield=count_app |
      | esma_sample | starttime=\"now/d\" endtime=\"now+d/d\" tag:\"sample04061424_apachesample_dawn\" \| bucket timestamp span=1h as ts \| stats count() as cnt by ts \| esma cnt timefield=ts |
      | esma_sample1 | starttime=\"now/d\" endtime=\"now+d/d\" tag:\"sample04061424_apachesample_dawn\" \| bucket timestamp span=1h as ts \| stats avg(apache.resp_len) as cnt by ts \| esma cnt timefield=ts \|eval r_fmt_time=formatdate(ts) |
      | esma_futurecount | starttime=\"now/d\" endtime=\"now+d/d\" tag:\"sample04061424_apachesample_dawn\" \| bucket timestamp span=1h as ts \| stats count() as cnt by ts \| esma cnt timefield=ts futurecount=30 \|eval new_tt=formatdate(ts,\"HH:mm:ss\") |
      | esma_where_join | starttime=\"now-1d/d\" endtime=\"now/d\" tag:\"sample04061424\" \| bucket timestamp span=1h as ts \| stats avg(apache.status) as avg_ by ts \| esma avg_ timefield=ts futurecount=24 \| eval r_fmt=formatdate(ts)  \| where typeof(_predict_avg_)==\"double\" \| eval time = formatdate(ts, \"HH:mm\") \| table time, _predict_avg_ \| join type=left time [[ starttime=\"now/d\" endtime=\"now/d+24h\"  tag:\"sample04061424_apachesample_dawn\" \| bucket timestamp span=1h as ts \| stats avg(apache.status) as avg_ by ts \| eval time = formatdate(ts, \"HH:mm\") \| table time, avg_ ]] |
      | dedup_default | tag:\"sample04061424\" \| dedup apache.status \| sort by timestamp |
      | dedup_int | tag:\"sample04061424\" \| dedup 3 apache.status \| sort by timestamp |
      | dedup_char_keepevents_true | tag:\"sample04061424\" \| dedup 3 apache.version keepevents=true \| sort by timestamp |
      | dedup_char_keepevents_false | tag:\"sample04061424\" \| dedup 3 apache.version keepevents=false \| sort by timestamp |
      | dedup_double_fields_keepevents_true | tag:\"sample04061424\" \| dedup 3 apache.method, appname keepevents = true \| sort by timestamp |
      | dedup_double_fields_keepevents_false | tag:\"sample04061424\" \| dedup 3 apache.status, appname keepevents = false \| sort by timestamp |
      | dedup_keepempty_true | tag:sample04061424_win_sys_20 \| dedup json.Category keepempty = true |
      | dedup_keepempty_false | tag:sample04061424_win_sys_20 \| dedup json.Category keepempty = false |
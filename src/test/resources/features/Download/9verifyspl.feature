@vdl
Feature: 处理下载结果

  Background:
#    Given open the "splSearch.SearchPage" page for uri "/search/"
#    And I wait for element "SearchStatus" change text to "搜索完成!"

  @vdlftp
  Scenario Outline: 下载
    Given open the "splSearch.OfflineTaskPage" page for uri "/download/#"
    And I wait for loading complete
#    Then I compare source download file "expect/<name>.csv" with target download files "<name>.csv"
    Then I get remote ftp download file "<name>.csv"
    And I wait for "1000" millsecond

    Examples:
      | name                                         | splQuery                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      |
      | search_verify_chart_log | starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424_chart |

  @vdlevent
  Scenario Outline: 下载比较
    Given open the "splSearch.OfflineTaskPage" page for uri "/download/#"
#    And I download file "<name>.csv" to local
    Then I compare source download file "expect/<name>.csv" with target download files "<name>.csv"

    Examples:
      | name                                         | splQuery                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      |
      | search_verify_chart_log | starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424_chart |
      | search_generall | tag:sample04061424 |
      | index_yotta_tag | index=* tag:sample04061424 |
      | index_yotta_regex | index=yotta tag:sample04061424 AND  /[0][8]0{2,2}/ |
      | index_yotta_all | index=yotta starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424* |
#      | index_internal | index=internal * |
#      | index_schedule | index=schedule * |
      | search_eventcount | tag:sample04061424 AND apache.referer_domain:\"m5.baidu.com\" AND apache.clientip:\"23.166.125.53\" |
#      | search_all_samepre_tag_count | index=* starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424* \| top 100 tag \| sort by count,tag |
#      | search_all_nopre_tag_count | index=* starttime=\"now/d\" endtime=\"now/d+24h\" NOT tag:sample04061424* \| top 100 tag \| sort by tag |
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
#      | search_filterfield_lowercase_fuzzy_match | tag:sample04061424 AND  apache.referer_domain:m5* \| table apache.referer_domain |
#      | search_filterfield_data_fuzzy_match | tag:sample04061424 AND NOT 'apache.clientip':*2* \| sort by apache.clientip \| table apache.clientip |
#      | search_filterfield_chinese_fuzzy_match | tag:sample04061424_json_sdyd_float_59  json.name:用* \| table json.name |
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
#      | search_highlight_version | tag:sample04061424 AND apache.status:version |
#      | search_syntax_equal | tag:sample04061424_syntax_equal_5 AND api\"=\"/[a-z]{4}.[a-z]{8}.[a-z]{8}/ |
#      | search_syntax_1word_wildcard_highlight | tag:sample04061424_syntax_equal_5 AND user.* |
      | search_syntax_equal_word_highlight | tag:sample04061424_syntax_equal_5 AND \"api\=user\" |
      | search_syntax_equal_2word_noquote_highlight | tag:sample04061424_syntax_equal_5 AND api\=user |
      | search_syntax_equal_string_highlight | tag:sample04061424_syntax_equal_5 AND user.passport.loginLog |
      | search_regex_match_ip_highlight | tag:sample04061424_syntax_equal_5 AND  /[0-9]{3}.[0-9]{1}.[0-9]{3}.[0-9]{1}/ |
      | search_regex_match_3string_highlight | tag:sample04061424_syntax_equal_5  AND /[a-z]{4}/ /[a-z]{7}/ |
#      | search_regex_match_3string_highlight_noret | tag:sample04061424_syntax_equal_5  AND /[a-z]{4}/ /[a-z]{7}/ /[a-z]{100}/ |
      | search_chinese | tag:sample04061424_chinese_5 |
      | search_raw | tag:sample04061424_raw_36 |
      | search_upload_noappname | tag:\"sample04061424_noappname_36\" |
#      | search_alert_yctv | tag:\"sample04061424_yctv_100\" AND cgi.loglevel:ERROR AND  (NOT \"errno 104\") AND (NOT \"code 0\") AND (NOT \"errno 111\") AND (NOT \"errno 106\") AND (NOT \"verify failed\") AND (NOT \"errno 101\") AND (NOT \"errno 115\") AND (NOT \"errno 117\") AND (NOT \"Detect failed\") AND (NOT \"errno 109\") AND (NOT \"Job failed\") |
#      | search_xiaomi_syntax | tag:\"sample04061424_xiaomi_3\" AND (invalid \"did=\"yunyi.ba12*) |
#      | search_two_index | starttime=\"now-1d/d\" endtime=\"now/d+7h\" tag:two_index |
#      | search_fields_range | tag:sample04061424 AND apache.resp_len:[1 TO 5049] \| eval r_type=typeof(apache.resp_len) \| stats count() as cnt by apache.status, r_type \| sort by cnt, apache.status |
#      | not_eval_stats_top | tag:sample04061424 AND (NOT apache.status:200) \| eval status = apache.status \| stats top(status,10) |
      | search_highlight_last_update_timestamp | tag:last_update_timestamp_100 AND last_update_timestamp |
      | search_highlight_last_asterisk_match | tag:last_update_timestamp_100 AND last* |
      | search_highlight_before_capital_letter | tag:highlight_huawei_10 \"the message is\" |
      | start_time_para_mon | starttime=\"now-1M/M-1d/w\"  endtime=\"now\" tag:sample04061424 |
#      | start_time_value | starttime=2017-08-13 endtime=2017-08-13:23:59:00 tag:sample |
      | startt_today | starttime=\"now/d\" endtime=\"now\" tag:sample04061424 |
      | limit_1 | tag:\"sample04061424\"\| limit 10 |
#      | gf_dapper_tracing | tag:gf_dapper* AND dapper.msg.traceId:\"511f8756ce1d0b8a\" dapper.msg.duration:>0 \| table dapper.msg.id, dapper.msg.parentId, dapper.class, dapper.msg.duration, dapper.msg.timestamp, dapper.msg.binaryAnnotations[].value, collector_recv_timestamp \| sort by dapper.msg.id |
#      | tracing_mvszip_mvexpand_parse | tag:gf_dapper* AND 'tag':gf_dapper_mould_3 \| eval aa=mvszip(mvszip(dapper.msg.annotations[].endpoint.serviceName,dapper.msg.annotations[].timestamp),dapper.msg.annotations[].value)\|mvexpand aa\|parse field=aa \"(?<aname>[^,]*),(?<atime>[^,]*),(?<avalue>\S+)\"\|sort by +atime \| table atime,dapper.msg.name,dapper.msg.traceId,dapper.msg.parentId,dapper.msg.id,dapper.msg.duration,aname,avalue,dapper.msg.binaryAnnotations[].endpoint.serviceName,dapper.msg.binaryAnnotations[].key,dapper.msg.binaryAnnotations[].value\|rename dapper.time as time,dapper.mtype as mtype,dapper.msg.name as fundname,dapper.msg.traceId as traceId,dapper.msg.parentId as parentId,dapper.msg.id as id,dapper.msg.duration as duration,dapper.msg.binaryAnnotations[].endpoint.serviceName as daname,dapper.msg.binaryAnnotations[].key as dakey,dapper.msg.binaryAnnotations[].value as davalue\|eval time=formatdate(tolong(substring(tostring(atime),0,13)))\|fields time,fundname,traceId,parentId,id,duration,aname,avalue,daname,dakey,davalue |
#      | transpose_count | tag:\"sample04061424\" \| stats count() as cnt by apache.method, apache.status \| transpose row=apache.method column=apache.status valuefield=cnt |
#      | transpose_pct | tag:\"sample04061424\" \| stats pct(apache.status,1,5,25,50,75,95,99) as pct_ by apache.method \| transpose row=pct_.1 column=apache.method valuefield=pct_.5 |
#      | transpose_table | starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424_apachesample_dawn \| table apache.geo.longitude,apache.geo.latitude, apache.clientip \| transpose row=apache.geo.longitude column=apache.geo.latitude valuefield=apache.clientip |
#      | transpose_eval_table | tag:sample04061424_chart \| stats avg(apache.resp_len) as avglen by  apache.clientip \| eval int_avglen = floor(avglen) \| sort by avglen  \| transpose row=apache.clientip column=int_avglen valuefield=avglen |
#      | transpose_bucket_stats_eval_autoregress | starttime=\"now/d\" endtime=\"now+d/d\" tag:sample04061424_apachesample_dawn \|bucket timestamp span=1h as ts\|stats count() as count_app by ts\|eval time=formatdate(ts,\"HH:mm:ss\") \|autoregress count_app p=3 \|transpose row=ts column=time valuefield=count_app |
#      | esma_sample | starttime=\"now/d\" endtime=\"now+d/d\" tag:\"sample04061424_apachesample_dawn\" \| bucket timestamp span=1h as ts \| stats count() as cnt by ts \| esma cnt timefield=ts |
#      | esma_sample1 | starttime=\"now/d\" endtime=\"now+d/d\" tag:\"sample04061424_apachesample_dawn\" \| bucket timestamp span=1h as ts \| stats avg(apache.resp_len) as cnt by ts \| esma cnt timefield=ts \|eval r_fmt_time=formatdate(ts) |
#      | esma_futurecount | starttime=\"now/d\" endtime=\"now+d/d\" tag:\"sample04061424_apachesample_dawn\" \| bucket timestamp span=1h as ts \| stats count() as cnt by ts \| esma cnt timefield=ts futurecount=30 \|eval new_tt=formatdate(ts,\"HH:mm:ss\") |
#      | esma_where_join | starttime=\"now-1d/d\" endtime=\"now/d\" tag:\"sample04061424\" \| bucket timestamp span=1h as ts \| stats avg(apache.status) as avg_ by ts \| esma avg_ timefield=ts futurecount=24 \| eval r_fmt=formatdate(ts)  \| where typeof(_predict_avg_)==\"double\" \| eval time = formatdate(ts, \"HH:mm\") \| table time, _predict_avg_ \| join type=left time [[ starttime=\"now/d\" endtime=\"now/d+24h\"  tag:\"sample04061424_apachesample_dawn\" \| bucket timestamp span=1h as ts \| stats avg(apache.status) as avg_ by ts \| eval time = formatdate(ts, \"HH:mm\") \| table time, avg_ ]] |
      | dedup_default | tag:\"sample04061424\" \| dedup apache.status \| sort by timestamp |
      | dedup_int | tag:\"sample04061424\" \| dedup 3 apache.status \| sort by timestamp |
      | dedup_char_keepevents_true | tag:\"sample04061424\" \| dedup 3 apache.version keepevents=true \| sort by timestamp |
      | dedup_char_keepevents_false | tag:\"sample04061424\" \| dedup 3 apache.version keepevents=false \| sort by timestamp |
      | dedup_double_fields_keepevents_true | tag:\"sample04061424\" \| dedup 3 apache.method, appname keepevents = true \| sort by timestamp |
      | dedup_double_fields_keepevents_false | tag:\"sample04061424\" \| dedup 3 apache.status, appname keepevents = false \| sort by timestamp |
      | dedup_keepempty_true | tag:sample04061424_win_sys_20 \| dedup json.Category keepempty = true |
      | dedup_keepempty_false | tag:sample04061424_win_sys_20 \| dedup json.Category keepempty = false |

  @vdleval
  Scenario Outline: 下载比较
    Given open the "splSearch.OfflineTaskPage" page for uri "/download/#"
    Then I compare source download file "expect/<name>.txt" with target download files "<name>.txt"

    Examples: 新建成功
      | name                                         | splQuery                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      |
      | eval_noempty_logic_and | tag:\"sample04061424\" \| eval bool_is_empty=empty(apache.request_path) \| eval bool_not_empty=! empty(apache.request_path) \| eval bool_is_false= false && empty(apache.request_path) \| table bool_is_empty, bool_not_empty,bool_is_false, apache.x_forward \| sort by  apache.x_forward |
      | eval_relation | tag:\"sample04061424\" \| eval r1_not200=apache.status!=200 \| eval r2_is200=apache.status==200 \| eval r3_big200=apache.status>200 \| eval r4_bigequal200=apache.status>=200 \| eval r5_small200=apache.status<200 \| eval r6_smallequal200=apache.status<=200 \| table r1_not200,r2_is200,r3_big200, r4_bigequal200,r5_small200,r6_smallequal200,apache.status \| sort by apache.status |
      | eval_connect_table_sort | tag:\"sample04061424\" \| eval ret_connect = appname + apache.clientip + apache.method + \"科罗拉多斯普林斯\"  \| table ret_connect \| sort by ret_connect |
      | eval_math_add_bracket | tag:\"sample04061424\" \| eval r_len=apache.resp_len \| eval r_status=apache.status \| eval status_add10=apache.status+10 \| eval r_plus=apache.resp_len+apache.status \| eval r_plus_bracket=(apache.resp_len+apache.status)*r_status \| table r_len, r_status,status_add0, r_plus, r_plus_bracket, apache.x_forward \| sort by  apache.x_forward |
      | eval_ceil_floor_min_max_log | tag:sample04061424_json_sdyd_41 \| sort by json.purePathId \| limit 10 \|  eval r_ceil_cpuTime=ceil(json.cpuTime) \| eval r_floor_cpuTime=floor(json.cpuTime) \| eval r_min=min(json.execTime,json.responseTime) \| eval r_max=max(json.execTime,json.responseTime) \| eval r_log_responseTime=log(json.responseTime) \| table json.cpuTime, json.execTime, json.responseTime, r_ceil_cpuTime, r_floor_cpuTime, r_min, r_max, r_log_responseTime, json.purePathId |
      | eval_coalesce_sample | tag:\"sample04061424\" \| eval ret_path=coalesce(apache.request_path,apache.referer) \| table ret_path, apache.x_forward \| sort by  apache.x_forward |
      | eval_empty_sample | tag:\"sample04061424\" \| eval path_is_empty=empty(apache.referer_domain) \| table path_is_empty, apache.referer_domain, apache.x_forward \| sort by  apache.x_forward |
      | eval_empty_resp_len | tag:\"sample04061424\" \| eval path_is_empty=empty(apache.resp_len) \| table path_is_empty, apache.x_forward \| sort by  apache.x_forward |
      | eval_2if | tag:\"sample04061424\" \| eval ret_equal200=if(apache.status==200,\"equal200\",\"not_200\") \| eval ret_larger=if(apache.status>200,\"larger200\",\"not larger\") \| table apache.status, ret_equal200, ret_larger, apache.x_forward \| sort by  apache.x_forward |
      | eval_math_stats | tag:\"sample04061424\" \| eval new_len = 1000 + apache.resp_len \| stats count(new_len) |
      | eval_if_stats_count | (logtype:apache AND tag:\"sample04061424\") \| eval desc = if (apache.status==200, \"OK\", \"Error\") \| stats count(desc) by desc |
      | eval_case_stats_count | (logtype:apache AND tag:\"sample04061424\") \| eval desc=case(apache.resp_len<0,\"nagetive\",apache.resp_len<100,\"low\",apache.resp_len>2000,\"high\",empty(apache.resp_len),\"Not found\",default,\"middle\") \| stats count(desc) by desc |
      | eval_tolong | (logtype:apache AND tag:\"sample04061424\") \| eval int_status= tolong(apache.status) \| table int_status, apache.x_forward \| sort by  apache.x_forward |
      | eval_parsedate_formatdate | (logtype:apache AND tag:\"sample04061424_chart\") \| eval f_ref_time = \"22:52:22.000\" \| eval mill_ref_time=parsedate(f_ref_time,\"HH:mm:ss.SSS\") \| eval f_cut_timestamp = formatdate(timestamp,\"HH:mm:ss.SSS\") \| eval mill_cut_timestamp=parsedate(f_cut_timestamp,\"HH:mm:ss.SSS\") \| eval mill_diff_time= mill_ref_time - mill_cut_timestamp \| eval f_diff_time = formatdate(mill_diff_time,\"HH:mm:ss:SSS\") \| table f_ref_time, f_cut_timestamp, mill_ref_time, mill_cut_timestamp, mill_diff_time,f_diff_time |
      | eval_if_nest_empty_top | tag:sample04061424 \| eval len=if(empty(apache.resp_len),0,1) \| stats top(len,10) |
      | eval_empty_if_where | tag:sample04061424 \| eval is_resplen_empty=empty(apache.resp_len) \| eval res_str=if(is_resplen_empty,\"repslen_empty\",\"resplen_non_null\") \| table apache.resp_len, is_resplen_empty, res_str \| where is_resplen_empty==true |
      | eval_add_subtract_divide_multiply_sort | tag:\"sample04061424\" \| eval res_mul=apache.status*apache.status*0 - apache.status/apache.status%100 \| eval r_add=apache.status+apache.status*10-9*apache.status \| sort by apache.resp_len \| table res_mul, r_add, apache.resp_len |
      | add_1 | tag:\"sample04061424\" AND apache.resp_len:>2000 \| eval resplen=apache.resp_len \| eval status=apache.status \| eval mid=apache.resp_len+apache.status \| eval res_mul=(apache.resp_len+apache.status)*apache.status \| table resplen, status, mid, res_mul, apache.x_forward \| sort by  apache.x_forward |
      | eval_logical_or | tag:sample04061424 \| eval input_true=true \| eval input_false=false \| eval ret_true=input_false \|\| input_true \| table ret_true, apache.x_forward \| sort by  apache.x_forward |
      | eval_logical_and | tag:sample04061424 \| eval input_true=true \| eval input_false=false \| eval ret_false=input_false && input_true \| table ret_false, apache.x_forward \| sort by  apache.x_forward |
      | eval_empty_logical_or_and | tag:\"sample04061424_json_sdyd_float_59\" \| eval res_empty=empty(json.cpuTime) \| eval res_not_empty=!empty(json.cpuTime) \| eval res_true=empty(json.cpuTime) \|\| true \| eval res_false= false && empty(json.cpuTime) \| table json.cpuTime, res_empty, res_not_empty, res_true, res_false, json.purePathId \| sort by json.purePathId |
      | eval_comparison_operation | tag:\"sample04061424\" AND NOT apache.status:200 \| eval not_200=apache.status!=200 \| eval is_200=apache.status==200 \| eval big_200=apache.status>200 \| eval bigto_200=apache.status>=200 \| eval small_200=apache.status<200 \| eval smallto_200=apache.status<=200 \| eval res_equal_200=if(apache.status==200,\"equal200\",\"other200\") \| eval res_not_200=if(apache.status!=200,\"not200\",\"error\") \| table apache.status, not_200, is_200, big_200, bigto_200,small_200,smallto_200, res_equal_200,res_not_200, apache.x_forward \| sort by  apache.x_forward |
      | eval_abs_ceil_floor | tag:sample04061424_json_sdyd_float_59 \|  eval r_abs=abs(json.duration) \| eval r_ceil=ceil(json.duration) \| eval r_floor=floor(json.duration) \| table json.duration,r_abs, r_ceil, r_floor, json.purePathId \| sort by json.purePathId |
      | eval_min_max_float | tag:sample04061424_json_sdyd_41 \| eval r_min=min(json.execTime,json.responseTime) \| eval r_max=max(json.execTime,json.responseTime) \| eval r_log_time=log(r_max) \| sort by r_max \| table json.execTime, json.responseTime, r_max, r_min, r_log_time, json.purePathId \| sort by json.purePathId |
      | eval_min_max_int | tag:\"sample04061424\" AND apache.resp_len:* \| eval res_min=min(apache.status, apache.resp_len) \| eval res_max=max(apache.status,apache.resp_len) \| table res_min, res_max, apache.x_forward \| sort by  apache.x_forward |
      | eval_log_status | tag:\"sample04061424\" \| eval r_log_status=log(apache.status) \| table apache.status, r_log_status, apache.x_forward \| sort by  apache.x_forward |
      | eval_len_sdyd_json_name | tag:sample04061424_json_sdyd_41 \| eval r_name_len=len(json.name) \| eval r_ip_len=len(json.dimensions.IP) \| table json.name, r_name_len, json.dimensions.IP, r_ip_len, json.purePathId \| sort by json.purePathId |
      | eval_case_default | tag:sample04061424 AND NOT apache.status:200\| eval r_status = \"status: \" + case(apache.status==200, \"ok\", apache.status==400, \"bad\", apache.status>=500, \"other\", default, \"error\") \| table apache.status, r_status, apache.x_forward \| sort by  apache.x_forward |
      | eval_case_status | tag:\"sample04061424\" \| eval res_status=case(apache.status==200,\"status=200\",apache.status==404,\"apache=404\",apache.status==500,\"apache==500\",default,\"apache=other\") \| table apache.status,res_status, apache.x_forward \| sort by  apache.x_forward |
      | eval_case_stats | tag:sample04061424 AND apache.status:>=301 \| eval r_status=case(apache.status==200,\"status=200\",apache.status<=301,\"apache<=301\",apache.status==304,\"apache==304\",default,\"apache=other\") \| table r_status, apache.x_forward \| sort by  apache.x_forward |
      | eval_case_param | tag:sample04061424 OR  tag:sample04061424_json_sdyd_41 \| eval r_len=case(logtype==\"json\", json.cpuTime, logtype==\"apache\", apache.resp_len) \| sort by r_len \| table r_len |
      | eval_upper_lower | tag:\"sample04061424\" AND apache.request_path:* \| eval r_upper=upper(apache.request_path) \| eval r_lower=lower(apache.request_path) \| table r_upper, r_lower, apache.x_forward \| sort by  apache.x_forward |
      | eval_match_clientip1 | tag:\"sample04061424\" \| eval ret_match = match(apache.clientip, \"^\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}$\") \| table apache.clientip, ret_match, apache.x_forward \| sort by  apache.x_forward |
      | eval_match_sample_query | tag:\"sample04061424\" AND apache.request_query:* \| eval r_match1 = match(apache.request_query, \"b.*e\") \| eval r_match2 = match(apache.request_query, \"^bcd\") \| table r_match1, r_match2, apache.x_forward \| sort by  apache.x_forward |
      | eval_substring_trim | tag:\"sample04061424\" AND apache.referer_domain:* \| eval r_subdomain= substring(apache.referer_domain,0,len(apache.referer_domain)) \| eval r_trim=trim(\"中文 \") \| eval r_eng=trim(\" \"+apache.referer_domain + \" \") \| table r_subdomain, r_eng, r_trim, apache.x_forward \| sort by  apache.x_forward |
      | eval_str_tolong | tag:\"sample04061424\" \| eval res_to_str=tolong(\"123\")\| eval res_to_long=tolong(20.3) \| table res_to_str, res_to_long, apache.x_forward \| sort by  apache.x_forward |
      | eval_todouble | tag:\"sample04061424\" \| eval r_frm_str=todouble(\"123.1\")  \| eval r_frm_long = todouble(20) \| eval res=r_frm_str+20\| eval t_frm_str = typeof(r_frm_str) \| eval t_frm_long = typeof(r_frm_long) \| eval t_res = typeof(res) \| table r_frm_str, t_frm_str, r_frm_long,t_frm_long, res,t_res, apache.x_forward \| sort by  apache.x_forward |
      | eval_typeof_json_string | tag:sample04061424_json_sdyd_41 \| eval t_actionName=typeof(json.actionName) \| eval t_dimensions_ip=typeof(json.dimensions.IP) \| table json.actionName, t_actionName, json.dimensions.IP, t_dimensions_ip \| sort by json.purePathId |
      | eval_typeof_1 | tag:sample04061424_json_sdyd_41 \| eval t_cputime = typeof(json.cpuTime) \| eval t_failed=typeof(json.failed) \| eval t_agent_timestamp=typeof(agent_send_timestamp) \| eval t_dimensions = typeof(json.dimensions) \| table json.cpuTime, t_cputime, json.failed, t_failed, json.agent_send_timestamp, t_agent_timestamp, t_dimensions, json.purePathId \| sort by json.purePathId |
      | eval_typeof_2 | tag:sample04061424 \| eval t_timestamp = typeof(timestamp) \| eval t_context_id = typeof(context_id) \| eval t_x_forward = typeof(apache.x_forward) \| eval t_latitude = typeof(apache.geo.latitude) \| eval t_resp_len = typeof(apache.resp_len) \| eval t_status = typeof(apache.status) \| table t_timestamp,t_context_id,t_x_forward,t_latitude,t_resp_len, t_status, apache.x_forward \| sort by  apache.x_forward |
      | eval_tostring | tag:\"sample04061424\" \| eval t = \"logtype:\" + logtype \| where tostring(t) == \"logtype:apache\" && tostring(apache.clientip) == \"23.166.125.53\" && tostring(appname) == \"apache\" \| table apache.clientip, appname, t, apache.x_forward \| sort by  apache.x_forward |
      | eval_parsedate | tag:\"sample04061424\" apache.method:GET \| eval x = parsedate(\"28/04/2016:12:01:01\",\"dd/MM/yyyy:HH:mm:ss\") \| eval y = parsedate(\"28/04/2016\",\"dd/MM/yyyy\") \| table x,y, apache.x_forward \| sort by  apache.x_forward |
      | eval_parsedate_chinese_month | tag:\"sample04061424\" apache.method:GET \| eval t_chn = parsedate(\"28/四月/2016\", \"dd/MMMM/yyyy\", \"Asia/Shanghai\", \"zh\") \| table t_chn, apache.x_forward \| sort by  apache.x_forward \| eval f_t_chn = formatdate(t_chn) |
      | formatdate_sample | tag:\"sample04061424\" apache.method:GET \| eval r_formatdate = formatdate(1537414676598, \"HH:mm:ss:SSS MM/dd/yyyy\") \| table apache.resp_len, r_formatdate, apache.x_forward \| sort by  apache.x_forward |
      | parsedate_limit | tag:\"sample04061424\" AND 'apache.resp_len':5049 \| limit 10 \| eval f_start_time = \"2014-08-02 10:52:22.000\" \| eval f_end_time = \"2046-12-29 10:52:22.000\" \| eval mill_start_time=parsedate(f_start_time,\"yyyy-MM-dd HH:mm:ss.SSS\") \| eval mill_end_time = parsedate(f_end_time,\"yyyy-MM-dd HH:mm:ss.SSS\") \| table f_start_time, f_end_time, mill_start_time, mill_end_time, apache.x_forward \| sort by  apache.x_forward |
      | format | tag:\"sample04061424\" \| eval x_format = format(\"%s, %s => %s\", logtype, tag, apache.clientip) \| table x_format, apache.x_forward \| sort by  apache.x_forward |
      | eval_isnum_isstr | tag:\"sample04061424\" \| eval r_isnum = isnum(apache.status) \| eval r_isstr = isstr(apache.method) \| table r_isnum, r_isstr, apache.x_forward \| sort by  apache.x_forward |
      | relative_time_timestamp_data_math | tag:\"sample04061424\" \| eval cur_timestamp=1589212800000 \| eval r_relative = relative_time(cur_timestamp, \"-1d/d\") \| eval r_format_relative = formatdate(r_relative, \"HH:mm:ss:SSS MM/dd/yyyy\") \| eval r_format_timestamp = formatdate(cur_timestamp, \"HH:mm:ss:SSS MM/dd/yyyy\") \| table r_relative, r_format_relative, apache.x_forward \| sort by  apache.x_forward |
      | cidrmatch | tag:\"sample04061424\" \| eval r_m130 = cidrmatch(\"192.168.1.130/25\", \"192.168.1.129\") \| eval r_m128 = cidrmatch(\"192.168.1.128/25\", \"192.168.1.129\") \| eval r_m255 = cidrmatch(\"192.168.1.255/25\", \"192.168.1.129\") \| table r_m130, r_m128, r_m255, apache.x_forward \| sort by  apache.x_forward |
      | eval_urldecode | starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424_urldecode_apache_10 AND apache.request_query:* \| eval r_decode = urldecode(apache.request_query) \| table apache.request_query,r_decode, apache.x_forward \| sort by  apache.x_forward |
      | eval_stats1 | starttime=\"now/d\" endtime=\"now/d+24h\" tag:\"sample04061424\" \| eval method = apache.method \| stats count() as count1, avg(apache.resp_len) as avg_len by method, apache.status \| sort by -avg_len |
      | rename_status | tag:\"sample04061424\" \| rename apache.status as \"status_1\" \| table apache.status,status_1, apache.x_forward \| sort by  apache.x_forward |
      | rename_status_to_chinese | index=* starttime=\"now/d\" endtime=\"now/d+24h\"  tag:\"sample04061424\" \| rename apache.status as \"状态码\" \| table '状态码', apache.x_forward \| sort by  apache.x_forward |
      | rename_status_to_chinese_single_quotation | tag:sample04061424 \| rename apache.status as 'tt.状态码' \| eval ret_a =  'tt.状态码'  \| eval ret_typeof= typeof('tt.状态码') \| table  ret_typeof, 'tt.状态码' |
      | table_sample | starttime=\"now/d\" endtime=\"now/d+7h\" tag:\"sample04061424_apachesample_dawn\" \| eval new_time=formatdate(timestamp, \"HH:mm:ss\") \| table apache.status,apache.method,new_time |
      | table_result_seq | tag:\"sample04061424\" \| table appname, tag, apache.clientip, apache.geo.country, apache.request_path, apache.status, apache.resp_len, apache.method, apache.x_forward \| sort by  apache.x_forward |
      | parse_message2ip_count2tag | tag:\"sample04061424\" \| parse \"^(?<ip_addr>\d+\.\d+\.\d+\.\d+)\" \| eval ip_str = \"ip:\" + ip_addr \| stats count(tag) as app_cnt by ip_str \| sort by app_cnt,ip_str |
      | parse_clientip_stats | tag:\"sample04061424\" \| parse field=apache.clientip \"(?<ip_addr>\d+\.\d+\.\d+\.\d+)\" \| eval ip_str = \"ip:\" + ip_addr \| stats count(appname) as app_cnt by ip_str \| sort by app_cnt,ip_str |
      | parse_request_path_stats | tag:\"sample04061424\" \| parse field=apache.request_path \"^(?<outer_path>/[^/]*)\" \| stats count(appname) by outer_path |
      | parse_sample_to_table | tag:sample04061424 AND apache.x_forward:7* \| parse \"(?<digital_list>\d+)\" max_match=5 \| table digital_list, apache.x_forward \| sort by  apache.x_forward |
      | parse_digital_max_match15 | tag:sample04061424 AND  apache.x_forward:1\| parse \"(?<digital_list>\d+)\" max_match=15 \|  table digital_list, apache.x_forward |
      | parse_digital_match_default | tag:sample04061424 \| parse \"(?<digital>\d+)\" \| eval ret_str = \"digital:\" + digital  \| table ret_str, apache.x_forward \| sort by  apache.x_forward |
      | parse_request_path_stats_count_by | tag:\"sample04061424\" \| parse field=apache.request_path \"^(?<outer_path>/[^/]*)\" \| stats count(appname) by outer_path |
      | parse_first_chinese_char_to_table | tag:sample04061424_chinese_5 \| parse field=raw_message \"(?<first_chinese_char>[\u4e00-\u9fa5])\" \| table first_chinese_char |
      | parse_chinesechar_maxmatch10_exceed_rawlen | tag:sample04061424_chinese_5 \| limit 1 \| parse field=raw_message \"(?<first_chinese_char>[\u4e00-\u9fa5])\" max_match=10 \| table first_chinese_char |
      | parse_request_path_table | tag:sample04061424  \| parse field=apache.request_path \"(?<digital>[a-zA-Z0-9][-a-zA-Z0-9]{0,62}(/.[a-zA-Z0-9][-a-zA-Z0-9]{0,62})+/.?)\" \| table apache.request_path, digital, apache.x_forward \| sort by  apache.x_forward |
      | time_sequence | tag:\"sample04061424_apachesample_dawn\" AND apache.resp_len:* \| eval res_reduce_time = collector_recv_timestamp - agent_send_timestamp \| eval f_timestamp = formatdate(timestamp,\"HH:mm:ss\")  \| table res_reduce_time, f_timestamp, agent_send_timestamp, collector_recv_timestamp \| where agent_send_timestamp<collector_recv_timestamp \|\|  agent_send_timestamp==collector_recv_timestamp |
      | eval_formatdate_2y_4m | \| makeresults count=1 \| eval cur_timestamp = 1570738470000 \| eval ret_time = formatdate(cur_timestamp,\"yy-MMMM-dd HH:mm:ss.SSS ZZ Z z\") \| eval splittime = split(ret_time, \" \") \| eval splittime_name = split(\"日期 时间 RFC时区1 RFC时区2 通用时区\", \" \") \| eval r_display = mvszip(splittime_name,splittime ,\"：\") \| table r_display |
      | eval_formatdate_1570738470000 | \| makeresults count=1 \| eval cur_timestamp = 1570738470000 \| eval ret_time = formatdate(cur_timestamp,\"yyyy-MM-dd HH:mm:ss.SSS ZZZ Z z '' G CC xxxx ww e '' EEEE DDD aa KK hh '' kk\") \| eval splittime = split(ret_time, \" \") \| eval splittime_name = split(\"日期 时间 RFC时区1 RFC时区2 通用时区 ' 公元 Centryofera WeekYear WeekofYear DayofWeek ' DayofWeek1 DayinYear Halfofday0_11 Clockhourofhalfday1_12 Hourofhalfday ' Hourinday1_24 \", \" \") \| eval r_display = mvszip(splittime_name,splittime ,\"：\") \| table r_display |
      | eval_formatdate_1570813200000 | \| makeresults count=1 \| eval cur_timestamp = 1570813200000 \| eval ret_time = formatdate(cur_timestamp,\"yyyy-MM-dd HH:mm:ss.SSS ZZZ Z z '' G CC xxxx ww e '' EEEE DDD aa KK hh '' kk\") \| eval splittime = split(ret_time, \" \") \| eval splittime_name = split(\"日期 时间 RFC时区1 RFC时区2 通用时区 ' 公元 Centryofera WeekYear WeekofYear DayofWeek ' DayofWeek1 DayinYear Halfofday0_11 Clockhourofhalfday1_12 Hourofhalfday ' Hourinday1_24 \", \" \") \| eval r_display = mvszip(splittime_name,splittime ,\"：\") \| table r_display |
      | eval_formatdate_1570888800000 | \| makeresults count=1 \| eval cur_timestamp = 1570888800000 \| eval ret_time = formatdate(cur_timestamp,\"yyyy-MM-dd HH:mm:ss.SSS ZZZ Z z '' G CC xxxx ww e '' EEEE DDD aa KK hh '' kk\") \| eval splittime = split(ret_time, \" \") \| eval splittime_name = split(\"日期 时间 RFC时区1 RFC时区2 通用时区 ' 公元 Centryofera WeekYear WeekofYear DayofWeek ' DayofWeek1 DayinYear Halfofday0_11 Clockhourofhalfday1_12 Hourofhalfday ' Hourinday1_24 \", \" \") \| eval r_display = mvszip(splittime_name,splittime ,\"：\") \| table r_display |
      | rename_sample | starttime=\"now/d\" endtime=\"now/d+24h\" tag:\"sample04061424\" \| rename apache.resp_len as resp_len, apache.status as status, apache.clientip as clientip \| table resp_len, status, clientip \| sort by resp_len, clientip, status |
      | rename_apache_limit_avg | starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424 \| rename apache.* as * \| limit 5 \| stats avg(resp_len) as avg_len by status |
      | rename_apache_avg_bystatusip_sort | starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424 \| rename apache.* as * \| stats avg(resp_len) as avg_len by status, clientip \| sort by avg_len, status, clientip |
      | rename_apache_formatdate_bucket_span1_count | starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424_display \| rename apache.c* as * \| eval f_timestamp = formatdate(timestamp,\"HH\")\| eval u_hour=tolong(f_timestamp) \| bucket u_hour span=1 as ts \| stats count(lientip) as c_ip by ts |
      | rename_multi_fields_apache_plus | tag:sample04061424 \| rename apache.geo.* as *, apache.r* as r* \| table referer_domain, apache.clientip, resp_len, request_path, apache.x_forward \| sort by apache.x_forward |

  @vdlstats
  Scenario Outline: 下载比较
    Given open the "splSearch.OfflineTaskPage" page for uri "/download/#"
#    And I download file "<name>.csv" to local
    Then I compare source download file "expect/<name>.csv" with target download files "<name>.csv"

    Examples: 新建成功
      | name                                         | splQuery                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      |
      | sub_join_inner1 | tag:\"sample04061424\" \| stats avg(apache.status) by apache.clientip \| join type=inner apache.clientip [[ tag:\"sample04061424\" AND apache.clientip:23.166.125.53 \| stats sum(apache.status) by apache.clientip ]] |
      | sub_join_inner2 | tag:\"sample04061424\" \| stats avg(apache.status) by apache.clientip \| join type=inner apache.clientip [[ tag:\"sample04061424\" AND apache.clientip:23.166.125.53 \| stats sum(apache.status) by apache.clientip ]] |
      | sub_join_left | tag:\"sample04061424\" \| stats count(logtype) as count_all by apache.geo.isp \| sort by count_all,apache.geo.isp \| join type=left apache.geo.isp [[tag:\"sample04061424\" AND apache.status:[400 TO 499] \| stats count(logtype) as count_400l by apache.geo.isp]] \| join type=left apache.geo.isp [[tag:\"sample04061424\" AND apache.status:[500 TO 599] \| stats count(logtype) as count_500l by apache.geo.isp]] |
      | sub_join_left1 | tag:\"sample04061424\" \| stats avg(apache.status) by apache.clientip \| sort by apache.clientip \| join type=left apache.clientip [[ tag:\"sample04061424\" AND apache.clientip:23.166.125.53 \| stats sum(apache.status) by apache.clientip ]] |
      | sub_join_left_count_3times | tag:\"sample04061424\" \| stats count(logtype) as count_all by apache.clientip \| sort by count_all \| limit 20 \| join type=left apache.clientip [[tag:\"sample04061424\" AND apache.status:[400 TO 499] \| stats count(logtype) as count_400l by apache.clientip]] \| join type=left apache.clientip [[tag:\"sample04061424\" AND apache.status:[500 TO 599] \| stats count(logtype) as count_500l by apache.clientip]] \| join type=left apache.clientip [[tag:\"sample04061424\"AND apache.resp_len:>1000\| stats count(logtype) as len_1000l by apache.clientip]] \| sort by count_all, apache.clientip |
      | sub_join_left_if_divide | tag:\"sample04061424\" \| stats count(logtype) as count_all by apache.clientip \| sort by count_all \| limit 5 \| join type=left apache.clientip [[logtype:\"apache\" AND apache.status:[400 TO 499]\|stats count(logtype) as count_400 by apache.clientip]]\|join type=left apache.clientip [[logtype:\"apache\" AND apache.status:[500 TO 599]\|stats count(logtype) as count_500 by apache.clientip]]\|join type=left apache.clientip [[logtype:\"apache\" AND apache.resp_len:>1000\|stats count(logtype) as len_1000 by apache.clientip]]\|eval rate_400=if(empty(count_400),0,count_400/count_all)\|eval rate_500=if(empty(count_500),0,count_500/count_all)\|eval rate_len_1000=if(empty(len_1000),0,len_1000/count_all) |
      | sub_join_percent | tag:\"sample04061424\" \| stats count(logtype) as count_all by apache.clientip \| sort by count_all \| limit 50 \| join type=left apache.clientip [[ tag:\"sample04061424\" AND apache.status:[400 TO 499] \| stats count(logtype) as count_400 by apache.clientip]] \| join type=left apache.clientip [[ tag:\"sample04061424\" AND apache.status:[500 TO 599] \| stats count(logtype) as count_500 by apache.clientip ]] \| join type=left apache.clientip [[tag:\"sample04061424\" AND apache.resp_len:>1000 \| stats count(logtype) as len_1000 by apache.clientip]] \| eval rate_400=if(empty(count_400),0,count_400/count_all) \| eval rate_500=if(empty(count_500),0,count_500/count_all) \| eval rate_len_1000=if(empty(len_1000),0,len_1000/count_all) \| sort by count_all, apache.clientip |
      | sub_multi | starttime = \"now/d\" endtime = \"now\" tag:sample04061424_rizhiyi_access_1000 AND (apache.clientip:1.197.41.37 OR  apache.clientip:123.150.214.81) \| append [[tag:sample04061424 apache.status:200 AND apache.method:\"GET\" AND apache.clientip:\"49.85.230.247\" \| append [[tag:sample04061424 \| stats count() as cnt by apache.status]]]] \| sort by cnt, apache.status |
      | sub_nest_1 | tag:\"sample04061424\" \| stats dc(apache.status) as dc_count by apache.method \| join apache.method [[ tag:\"sample04061424\" \| stats count(apache.status) as cnt by apache.method \| append [[ tag:\"sample04061424\" \| stats count() as total ]] ]] |
      | stats_math_sort_limit_eval | (logtype:apache AND tag:\"sample04061424\") \| stats count(tag) as event_count,sum(apache.resp_len) as sum_len,max(apache.resp_len) as max_len,min(apache.resp_len) as min_len by apache.clientip\|sort by sum_len \| limit 5 \| eval agv_len=if(event_time==0,0,sum_len/event_time) |
      | stats_count_eval | tag:\"sample04061424\" \| stats count() as count_ by appname, logtype \| eval test_eval=appname |
      | stats_extend_stat | tag:\"sample04061424\" \| stats extend_stat(apache.resp_len) |
      | stats_arith_by_city | tag:\"sample04061424\" \| stats count(apache.status), max(apache.status), min(apache.resp_len), sum(apache.status), avg(apache.status) by apache.clientip \| sort by apache.clientip |
      | stats_top | tag:\"sample04061424\" \| stats top(apache.status,3) |
      | stats_hg | tag:\"sample04061424\" \| stats hg(apache.status,50) |
      | stats_pct | tag:\"sample04061424\"\| stats pct(raw_message_length,1,5,25,50,75,95,99) |
      | stats_math_1 | tag:\"sample04061424\" \| stats count(apache.status) as cnt, min(apache.status),max(apache.status),avg(apache.status),sum(apache.status), es(apache.status) by apache.clientip \| sort by cnt, apache.clientip |
      | stats_math_2 | tag:\"sample04061424\" \| stats count(apache.status) as cnt, min(apache.status),max(apache.status),avg(apache.status),sum(apache.status), extend_stat(apache.status) by apache.clientip \| sort by cnt, apache.clientip |
      | stats_count | tag:\"sample04061424\" \| stats count() as cnt by apache.status |
      | stats_min_timestamp_formatdate | tag:\"sample04061424_chart\" \| stats min(timestamp) as min_time by apache.status \| eval t_min_time = typeof(min_time) \| eval long_min_time = tolong(min_time) \| eval f_min_time = formatdate(log_min_time,\"HH:mm:ss\") \| sort by +apache.status |
      | stats_sort | tag:\"sample04061424\" \| sort by +apache.status,+apache.resp_len\| table apache.status, apache.resp_len |
      | stats_sort_fail | tag:\"sample04061424\" \| stats avg(apache.resp_len) as avg_length by apache.clientip \| sort by +avg_length, apache.clientip \| eval eval_length = avg_length + 200 \| limit 10 |
      | stats_sort_true | tag:\"sample04061424\" \| stats avg(apache.resp_len) as avg_length by apache.status \| eval eval_length = avg_length + 200 \| sort by eval_length |
      | stats_avg_count_sort | tag:\"sample04061424\" \| stats avg(apache.resp_len) as avg_length, count(apache.clientip) as ip_count by apache.status \| sort by ip_count, apache.status |
      | stats_stats_avg | tag:\"sample04061424\" \| stats count() as cnt, max(apache.status) as r_max by apache.clientip \| stats avg(cnt) by  r_max |
      | stats_stats_top | tag:\"sample04061424\" \| stats count() as cnt, max(apache.status) as r_max by apache.clientip \| top 3 cnt |
      | top_1_resp_len | tag:\"sample04061424\" \| top 50 apache.resp_len \| sort by count, apache.resp_len |
      | top_2_clientip_by_path | tag:\"sample04061424\" \| top 20 apache.clientip by apache.request_path \| sort by count, apache.request_path, apache.clientip |
      | top_count_percent | tag:\"sample04061424\" \| top 11 apache.clientip  countfield=clientip_count  percentfield=clientip_percent |
      | top_groupby | tag:\"sample04061424\"  \| top 3 apache.clientip by apache.resp_len \| sort by count, apache.resp_len, apache.clientip |
      | command_limit_mul_stats | tag:\"sample04061424\" \| stats count() as cnt, max(apache.status) as r_max by apache.clientip \| stats max(cnt),max(r_max) |
      | command_limit_mul_top | tag:\"sample04061424\" \| stats count() as cnt, max(apache.status) as r_max_status by apache.clientip \| top 3 r_max_status |
      | bucket_stats_eval_where | starttime=\"now/d\" endtime=\"now/d+7h\" tag:sample04061424_apachesample_dawn \| bucket timestamp span=10m as ts\|stats count(appname) as count_app by ts\|eval time=formatdate(ts,\"HH:mm:ss\") \| autoregress count_app p=6\|eval rate=if(empty(count_app_p6),0,abs(count_app_p6-count_app)) \| eval result=if(empty(count_app_p6),0,1) \|where result>0\|fields count_app,time,count_app_p6,rate |
      | bucket_movingavg_rollingstd_eval | starttime=\"now/d\" endtime=\"now/d+7h\" tag:sample04061424_apachesample_dawn \| bucket timestamp span=1h as ts\| stats count(appname) as count_ by ts\| movingavg count_,5 as ma\| rollingstd count_,5 as rs\| eval lower=ma-1*rs\| eval upper=ma+1*rs\| eval outlier=if(count_>upper\|\|count_<lower, count_, 0) |
      | bucket_timeranges_24h | starttime=\"now/d\" endtime=\"now\" tag:sample04061424_apachesample_dawn \| bucket timestamp timeranges=((MIN,-48h),(-48h,-24h),(-24h,MAX)) as ret_timeranges \| table ret_timeranges |
      | bucket_timeranges_count | starttime=\"now/d\" endtime=\"now\" tag:\"sample04061424\" \| bucket timestamp timeranges=((-2d, -1d),(-1d, MAX),(2017-02-17:00:00:00, 2018-02-23:00:00:00)) as tr \| stats count(appname) as ct by tr |
      | where_dc | tag:\"sample04061424\" \| where apache.status>400 \| stats dc(apache.status) |
      | where_es | tag:\"sample04061424\" \| where apache.status>400 \| stats es(apache.status) |
      | where_logic_and | tag:\"sample04061424\" \| where  apache.status > 200 && apache.status < 400 \| table apache.status |
      | fields_sample | starttime=\"now/d\" endtime=\"now\" tag:\"sample04061424\" \| stats count() as count_res by appname,apache.clientip \| fields apache.clientip, count_res \| sort by count_res, apache.clientip |
      | save_stats_avg_ip | tag:\"sample04061424\" \| stats avg(apache.resp_len) as avg_len,count(apache.resp_len) by apache.clientip \| sort by +apache.clientip \| save /data/rizhiyi/spldata/save_stats_avg_ip.csv |
      | rollingstd | starttime=\"now/d\" endtime=\"now/d+13h\" tag:sample04061424_apachesample_dawn\| bucket timestamp span=1h as ts \| stats avg(apache.resp_len) as avg_resp_len by ts  \| rollingstd avg_resp_len,10 as resp_len_rolling_std |
      | autoregress1 | starttime=\"now/d\" endtime=\"now/d+13h\" tag:sample04061424_apachesample_dawn \| bucket timestamp span=10m as ts \| stats count(appname) as count_app by ts\|eval time=formatdate(ts,\"HH:mm:ss\") \| autoregress count_app p=6\|eval rate=if(empty(count_app_p6),0,abs(count_app_p6-count_app)) \| eval result=if(empty(count_app_p6),0,1) \| where result>0\|fields count_app,time,count_app_p6,rate |
      | autoregress_2 | tag:\"sample04061424\" \| eval  avg_resp_len = apache.resp_len \| autoregress avg_resp_len p=1-2 \| eval res_avg = (avg_resp_len + avg_resp_len_p2 + avg_resp_len_p1) / 3 \| top 3 res_avg |
      | bucket_ranges_status_count | (logtype:apache AND tag:\"sample04061424\") \| bucket apache.status ranges=((0, 200), (200, 300), (300, MAX)) as rs \| stats count(apache.status) as count_status by rs |
      | bucket_stats_autoregress_eval_where_fields | starttime=\"now/d\" endtime=\"now/d+24h\" tag:\"sample04061424_chart\" \| bucket timestamp span=1h as ts \| stats count(appname) as count_app by ts \| eval time=formatdate(ts,\"HH:mm:ss\") \| autoregress count_app p=6 \| eval rate=if(empty(count_app_p6),0,abs(count_app_p6-count_app)) \| eval result=if(empty(count_app_p6),0,1) \| where result>0 \| fields count_app,time,count_app_p6,rate,result |
      | stats_save | tag:\"sample04061424\" \| stats avg(apache.status) by hostname \| save /data/rizhiyi/spldata/apache_latency.csv |
      | start_time_para_day | starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424 \| stats count(apache.resp_len) as event_count, max(apache.resp_len) as max_len, avg(apache.resp_len) as avg_status |
      | tran_count_apachelen | tag:\"sample04061424\" \| transaction apache.resp_len \| stats count(apache.resp_len) |
      | tran_stats_cmd_limit | tag:\"sample04061424\" \| transaction apache.status, apache.method \| stats count() as cnt |
      | tran_with_stats_fromstate_tostate | tag:\"t_with\" \| transaction json.sid with states a, b, c in json.module results by flow \| stats count() by fromstate, tostate |
      | bug_tran_bucket_stats | index=* tag:\"sample04061424\" \| transaction apache.status maxevents=10 \| bucket apache.status span=100 as ts \| stats avg(apache.status) as base_len, count() as base_count, es(apache.status) by ts |
      | subs3 | logtype:apache AND (tag:sample04061424_display OR tag:\"sample04061424_chart\") AND [[ tag:\"sample04061424\" \| stats count(apache.method) as method_count by apache.method \|  sort by method_count \| limit 1 \| fields apache.method]] \| table apache.x_forward, apache.request_path \| sort by apache.x_forward |
      | mindex_append_stats | index=* starttime=\"now/d\" endtime=\"now/d+24h\" tag:\"sample04061424_display\" \| stats count(apache.clientip)  \| append [[ index=* starttime=\"now/d\" endtime=\"now/d+24h\" tag:\"sample04061424_chart\" \| stats count(apache.clientip) ]] |
      | first_top_resp_len | tag:\"sample04061424\" \| top 50 apache.resp_len by apache.status \| stats first(apache.resp_len) |
      | last_sort_resp_len | tag:\"sample04061424\" AND apache.resp_len:* \| sort by +apache.status,+apache.resp_len \| table apache.status, apache.resp_len \| stats last(apache.resp_len) |
      | first_limit_fields | tag:\"sample04061424\"\| limit 10 \| fields apache.resp_len \| stats first(apache.resp_len) |
      | last_count_field | tag:\"sample04061424\" \| stats count() as count_res by appname,apache.clientip \| fields apache.clientip, count_res  \| stats last(apache.clientip) |
      | first_split | tag:\"sample04061424\" \| eval m_ips=split(apache.clientip, \".\") \| eval m_paths=split(apache.request_path, \"/\") \| table m_ips \| stats first(m_ips) |
      | last_name_mvappend | tag:\"sample04061424\" \| eval fullName=mvappend(apache.clientip, \"middle value\", apache.method) \| table apache.clientip, apache.method,fullName \| stats last(fullName) |
      | last_split_ip_mvsort | tag:\"sample04061424\" \| eval m_ips=split(apache.clientip, \".\") \| eval r_mvsort=mvsort(m_ips) \| table r_mvsort \| stats last(r_mvsort) |
      | first_sub_mvzip | tag:\"sample04061424\" \| eval m_ips=split(apache.clientip, \".\") \| eval m_paths=split(apache.request_path, \"/\") \| eval r_zips = mvzip(m_ips,m_paths) \| eval zips_count = mvcount(r_zips) \| table m_ips, m_paths, r_zips, zips_count \| limit 1 \| stats first(r_zips) |
      | first_mvrange_base | tag:\"sample04061424\" \| eval base=mvrange(1,6) \| table base \| stats first(base) |
      | first_resp_len_in_map | tag:\"sample04061424\" \|  map \" tag:\"sample04061424\" \| stats first(apache.resp_len) \" |
      | append_sample | starttime=\"now/d\" endtime=\"now/d+24h\" tag:\"sample04061424_display\" \| stats avg(apache.resp_len) as avg_resp_len \| append [[ starttime=\"now/d\" endtime=\"now/d+24h\" tag:\"sample04061424_chart\" \| stats avg(apache.resp_len) as avg_resp_len \| append [[ starttime=\"now/d\" endtime=\"now/d+24h\"  tag:\"sample04061424\" \| stats avg(apache.resp_len) as avg_resp_len]] ]] |
      | append_stats_sub | tag:\"sample04061424\" \| stats count(apache.clientip)  \| append [[ index=*  tag:\"sample04061424\" \| stats count(apache.clientip) ]] |
      | group_size_count | tag:\"sample04061424\" AND apache.resp_len:*  \| stats count() as cnt, max(apache.resp_len) as r_max by apache.clientip \| top 3 cnt \| stats last(cnt) |
      | group_size_max | tag:\"sample04061424\" AND apache.resp_len:* \| stats count() as cnt, max(apache.resp_len) as r_max by apache.clientip \| top 3 r_max \| stats last(r_max) |
      | append_status_sub_eval | starttime=\"now/d\" endtime=\"now/d+24h\" tag:\"sample04061424_apachesample_dawn\" \| stats avg(apache.resp_len) \| eval day=\"the group dawn\" \| append  [[ starttime=\"now/d\" endtime=\"now/d+24h\" tag:\"sample04061424_display\" \| stats avg(apache.resp_len) \| eval day=\"the group display\" \| append [[ starttime=\"now/d\" endtime=\"now/d+24h\" tag:\"sample04061424_chart\" \| stats avg(apache.resp_len) \| eval day=\"the group chart\" ]] ]] |

  @vdltable
  Scenario Outline: 下载比较
    Given open the "splSearch.OfflineTaskPage" page for uri "/download/#"
#    And I download file "<name>.csv" to local
    Then I compare source download file "expect/<name>.csv" with target download files "<name>.csv"

    Examples:
      | name                                         | splQuery                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      |
      | bucket_ts_stats_sum_eval | (logtype:apache AND tag:\"sample04061424_chart\") \| bucket timestamp span=1m as ts \| stats sum(apache.resp_len) as sum_len by ts,apache.status \| eval time=formatdate(ts,\"HH:mm:ss\") |
      | bucket_stats_eval_movingavg | starttime=\"now/d\" endtime=\"now/d+24h\"  tag:\"sample04061424_chart\"\| bucket timestamp span=1m as ts \| stats sum(apache.resp_len) as sum_resp_len by ts \| eval time=formatdate(ts,\"HH:mm:ss\") \| movingavg sum_resp_len,3 as moving_avg_resp_len |
      | bucket_1h_stats_count | starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424_chart \| bucket timestamp span=1h as ts \| stats count(apache.clientip) as c_ip by ts |
      | autoregress_sample | starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424_apachesample_dawn \| bucket timestamp span=30m as ts \| stats count(appname) as count_app by ts \| eval time=formatdate(ts,\"HH:mm:ss\") \| autoregress count_app p=6 |
      | starttime_bucket_ts_sum_eval | starttime=\"now/d\" endtime=\"now/d+24h\" tag:\"sample04061424_chart\" \| bucket timestamp span=1h as ts \| stats sum(apache.resp_len) as sum_len by ts \| eval time=formatdate(ts,\"HH:mm:ss\") |
      | starttime_bucket_ts_count_eval_formatdate | starttime=\"now/d\" endtime=\"now/d+24h\" tag:\"sample04061424_chart\" \| bucket timestamp span=1h as ts \| stats count(apache.resp_len) as sum_len by ts \| eval time=formatdate(ts,\"HH:mm:ss\") |
      | bucket_stats_autoregress | starttime=\"now/d\" endtime=\"now/d+24h\" tag:\"sample04061424_chart\" \| bucket timestamp span=1h as ts \| stats count() as count_app by ts \| eval time=formatdate(ts,\"HH:mm:ss\") \| autoregress count_app p=3 |
      | schedule_append_bucket_count_geoisp | starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424_apachesample_dawn \| bucket timestamp span=1h as ts \| stats count(apache.geo.isp) as count_ by apache.geo.isp, ts \| eval date_hour=tolong(formatdate(ts,\"HH\")) \| rename apache.geo.isp as group_line \| sort by +date_hour, +group_line \| append [[index=schedule starttime=\"-2d\" endtime=\"-d/d\" schedule_name:pip_task\|stats avg(ip_count) as count_ by date_hour\|eval group_line=\"base_line\"\|sort by +date_hour,+group_line]] |
      | earliest_timestamp | tag:sample04061424_apachesample_dawn \| stats earliest(timestamp) as earliest_time \| eval f_earliest_time=formatdate(earliest_time,\"HH:mm:SS\") |
      | earliest_timestamp_by_ip | tag:sample04061424_apachesample_dawn \| stats earliest(timestamp) as earliest_time by apache.clientip \| eval f_earliest_time=formatdate(earliest_time,\"HH:mm:SS\") \| sort by apache.clientip |
      | latest_timestamp | tag:sample04061424_apachesample_dawn \| stats latest(timestamp) as latest_time \| eval f_latest_time =formatdate(latest_time) |
      | latest_timestamp_by_ip | tag:sample04061424_apachesample_dawn \| stats latest(timestamp) as latest_time by apache.clientip \| eval f_latest_time =formatdate(latest_time) |
      | first_timestamp | tag:sample04061424_apachesample_dawn \| stats first(timestamp) as first_time \| eval f_first_time =formatdate(first_time) |
      | first_timestamp_by_ip | tag:sample04061424_apachesample_dawn \| stats first(timestamp) as first_time by apache.clientip \| eval f_first_time =formatdate(first_time) |
      | last_timestamp | tag:sample04061424_apachesample_dawn \| stats last(timestamp) as last_time \| eval f_last_time =formatdate(last_time) |
      | last_timestamp_by_ip | tag:sample04061424_apachesample_dawn \| stats last(timestamp) as last_time by apache.clientip \| eval f_last_time=formatdate(last_time) |
      | first_bucket_count_ip | tag:sample04061424_apachesample_dawn \| bucket timestamp span=1h as ts \| stats count(apache.clientip) as c_ip by ts \| stats first(c_ip) |
      | earliest_bucket_count_ip | tag:sample04061424_apachesample_dawn \| bucket timestamp span=1h as ts \| stats count(apache.clientip) as c_ip by ts \| stats earliest(c_ip) |
#      | bucket_stats_es | starttime=\"now/d\" endtime=\"now/d+7h\" tag:sample04061424_apachesample_dawn \| bucket timestamp span=1h as ts \| stats es(apache.status) by ts |
#      | index_task_search | index=schedule schedule_name:bar_resp_len \| bucket timestamp span=1h as ts \| stats max(max_resp_len) as max_resp_len_hour by ts |
      | timechart_sample | starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424_display \| timechart count() \| eval f_time = formatdate(_time,\"HH:mm:SS\") |
      | timechart_sample_count_span1h | starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424_display \| timechart span=1h max(apache.resp_len) as cnt |
      | timechart_sample_count_span1h_bystatus | starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424_display \| timechart span=1h count() as cnt by apache.status |
      | timechart_sample_avg_span1h | starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424_display \| timechart span=1h avg(apache.resp_len) as avg_len |
      | timechart_sep_byip_span1h | starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424_chart AND ('apache.clientip':221.226.97.92 OR 'apache.clientip':117.136.79.162)  \| timechart sep=\":\" span=1h count() as cnt max(apache.resp_len) by apache.clientip |
      | timechart_sep_bydomain_span1h | starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424_chart AND ('apache.clientip':221.226.97.92 OR 'apache.clientip':117.136.79.162)  \| timechart sep=\":\" span=1h count() as cnt max(apache.resp_len) by apache.referer_domain |
      | timechart_sep_bystatus_span1h | starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424_display \| timechart sep=\":\" span=1h count() as cnt max(apache.resp_len) by apache.status |
      | timechart_format | starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424_display \| timechart sep=\"-sep分格-\" format=\"$VAL\|分格2\|$AGG\" span=1h count() as cnt by apache.status |
      | timechart_format1 | starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424_display \| timechart sep=\"-sep分格-\" format=\"$VAL\|分格2\|$AGG\" span=1h count() as cnt max(apache.resp_len) as ma by apache.status |
      | timechart_limit_by_one | starttime=\"now/d\" endtime=\"now/d+24h\" tag:\"sample04061424_display\" \| timechart span=1h limit=5 count() max(apache.resp_len) by apache.status |
#      | timechart_limit_by_two | starttime=\"now/d\" endtime=\"now/d+24h\" tag:\"sample04061424_display\" \| timechart span=1h limit=5 count() max(apache.resp_len) by apache.status, apache.method |
      | timechart_bins_sample | starttime=\"now/d\" endtime=\"now/d+24h\" tag:\"sample04061424_display\" \| timechart bins=10 span=30m count() |
      | timechart_span30m_bins3 | starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424_display \| timechart span=30m bins=3 count() max(apache.resp_len) by apache.status |
      | timechart_minspan2h_bins40 | starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424_display \| timechart minspan=2h bins=40 count() |
      | timechart_minspan30m_bins40 | starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424_display \| timechart minspan=30m bins=40 count() |
      | timechart_minspan30m_bins4 | starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424_display \| timechart minspan=30m bins=4 count() |
      | timechart_bins100_bymethod | starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424_display \| timechart span=1h bins=100 count() max(apache.resp_len) by apache.method |
#      | timechart_startindex_endindex | starttime=\"now/d\" endtime=\"now/d+24h\" tag:\"sample04061424_display\" \| timechart bins=8 span=30m startindex=1 endindex=8 count() max(apache.status) |
#      | timechart_startindex_endindex1 | starttime=\"now/d\" endtime=\"now/d+24h\" tag:\"sample04061424_display\" \| timechart bins=10 span=30m startindex=1 endindex=8 count() max(apache.status) by apache.resp_len |
#      | timechart_sample_all_params | starttime=\"now/d\" endtime=\"now/d+24h\" tag:\"sample04061424_display\" \| timechart sep=\":\" format=\"$VAL--$AGG\" cont=true span=30m bins=100 startindex=1 endindex=8 limit=5 count() min(apache.resp_len) by apache.status |
      | timechart_sample_all_params1 | starttime=\"now/d\" endtime=\"now/d+24h\" tag:\"sample04061424\"  \| eval x=len(tostring(apache.request_path)) \| timechart sep=\",\" format=\"$VAL**$AGG\" cont=true limit=5 bins=10 minspan=1m span=10m max(x) as ma count() as cnt \| where ma>0 && cnt>0 |
      | timechart_cont_true | starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424_display \| timechart cont=true span=1h count() |
      | timechart_cont_false | starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424_display \| timechart cont=false span=1h count() |
      | timechart_cont_bystatus_true | starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424_display \| timechart sep=\":\" span=30m cont=false count() by apache.status |
      | timechart_cont_bystatus_false | starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424_display \| timechart sep=\":\" span=30m cont=false count() by apache.status |
#      | timechart_rendertype_line | starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424_chart \| timechart sep=\",\" format=\"$VAL**$AGG\" limit=3 rendertype=\"line\" bins=200 minspan=1m span=10m max(apache.resp_len) as ma count() as cnt by apache.clientip |
#      | timechart_rendertype_area | starttime=\"now/d\" endtime=\"now/d+24h\" tag:\"sample04061424_display\" \| timechart sep=\"-sep分格-\" format=\"$VAL-分格2-$AGG\" cont=true span=30m bins=100 startindex=1 endindex=8 limit=5 rendertype=\"area\"  count() min(apache.resp_len) by apache.status |
#      | timechart_rendertype_scatter | starttime=\"now/d\" endtime=\"now/d+24h\" tag:\"sample04061424_display\" \| timechart sep=\"-sep分格-\" format=\"$VAL-分格2-$AGG\" cont=true span=30m bins=100 startindex=1 endindex=8 limit=5 rendertype=\"scatter\"  count() min(apache.resp_len) by apache.status |
#      | timechart_rendertype_column | starttime=\"now/d\" endtime=\"now/d+24h\" tag:\"sample04061424_display\" \| timechart sep=\"-sep分格-\" format=\"$VAL-分格2-$AGG\" cont=true span=30m bins=100 startindex=1 endindex=8 limit=5 rendertype=\"column\" count() min(apache.resp_len) by apache.status |
      | timechart_timewrap_8h | starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424_display \| timechart span=1h count() as cnt \| timewrap 8h |
      | timechart_timewrap_10h | starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424_display \| timechart span=1h count() as cnt \| timewrap 10h |
      | timechart_timewrap_series_short | starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424_display \| timechart span=1h count() as cnt \| timewrap 8h series=short |
      | timechart_timewrap_timeformat | starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424_display \| timechart span=1h count() as cnt \| timewrap 8h series=exact timeformat=\"H\" |
      | timechart_timewrap_align_end | starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424_display \| timechart span=1h count() as cnt \| timewrap 8h align=end |
      | timechart_timewrap_align_now | starttime=\"now/d\" endtime=\"now\" tag:sample04061424_display \| timechart span=1h count() as cnt \| timewrap 8h align=now |
      | timechart_timewrap_formatedate | starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424_display \| timechart span=1h count() as cnt \| timewrap 8h \| eval f_time = formatdate(_time,\"HH:mm:SS\") |
      | timechart_span12h_timewrap_1d | starttime=\"now-7d\" endtime=\"now/d+24h\" tag:sample04061424_display \| timechart span=12h count() as cnt  \| timewrap 1d |
      | timechart_span1h_timewrap_1d | starttime=\"now-3d\" endtime=\"now/d+24h\" tag:sample04061424_display \| timechart span=1h count() as cnt \| timewrap 1d |
      | timechart_span1h_timewrap_3d | starttime=\"now-7d\" endtime=\"now/d+24h\" tag:sample04061424_display \| timechart span=1h count() as cnt max(apache.resp_len) as max_len by apache.status \| timewrap 3d |

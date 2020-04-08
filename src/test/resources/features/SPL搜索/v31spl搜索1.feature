
Feature: SPL语句执行_EVAL部分

  Background:
    Given open the "splSearch.SearchPage" page for uri "/search/"

#  @smoke @spl @all
  @v31tcspl1
  Scenario Outline: V3.1版本SPL用例、截图
    Given I set the parameter "SearchInput" with value "<splQuery>"
    And I wait for "1000" millsecond
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    #And I wait for element "SearchStatus" change text to "搜索完成!"
    And I wait for "5000" millsecond
    Then take a screenshot with name "<splcasename>"

    Examples:
      |splcasename| splQuery|
| search_all | starttime=\"now/d\" endtime=\"now/d+24h\" * |
| search_all_samepre_tag_count | index=* starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424* \| top 100 tag \| sort by count,tag |
| search_all_nopre_tag_count | index=* starttime=\"now/d\" endtime=\"now/d+24h\" NOT tag:sample04061424* \| top 100 tag \| sort by tag |
| verify_init_chart_data | starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424_chart |
| search_generall | tag:\"sample04061424\" |
| search_eventcount | tag:\"sample04061424\" AND apache.referer_domain:\"m5.baidu.com\" AND apache.clientip:\"23.166.125.53\" |
| search_fieldstats | tag:\"sample04061424\" AND apache.request_path:\"/index/login/\" apache.status:\"200\" |
| search_and_logic | tag:\"sample04061424\" AND (Mobile  Mozilla apache.resp_len:\"69\") |
| search_and_logic_filterfield_match | starttime=\"now/d\" endtime=\"now/d+24h\" ((* AND appname:apache) AND tag:sample04061424) AND (apache.ua:Mozilla*) |
| search_not_and | tag:sample04061424 69 (NOT SAMSUNG) |
| search_not | tag:\"sample04061424\" (NOT Mozilla) |
| search_regex | tag:\"sample04061424\" AND /0{2,2}/ |
| search_uppercase_full_text_retrieval | starttime=\"now/d\" endtime=\"now/d+24h\" RC |
| search_notless | tag:\"sample04061424\" AND apache.status:>=404 |
| search_greater | tag:\"sample04061424\" AND apache.status:>301 |
| search_and1 | tag:\"sample04061424\" AND apache.status:200 Build |
| search_bracket | tag:\"sample04061424\" AND apache.status:200 AND \"mac\" AND (apache.clientip:12.234.8.15 OR apache.clientip:13.78.39.216 OR apache.clientip:22.132.197.8) |
| search_filterfield_uppercase_fuzzy_match | tag:\"sample04061424\" AND apache.ua:Mozilla\/5.* |
| search_filterfield_uppercase_fuzzy_match1 | tag:\"sample04061424\" AND apache.ua:Mozilla* |
| search_filterfield_lowercase_fuzzy_match | tag:\"sample04061424\" AND  apache.referer_domain:m5* \| table apache.referer_domain |
| search_filterfield_data_fuzzy_match | tag:\"sample04061424\" AND NOT 'apache.clientip':*2* \| sort by apache.clientip \| table apache.clientip |
| search_filterfield_chinese_fuzzy_match | tag:sample04061424_json_sdyd_float_59  json.name:用* \| table json.name |
| search_chinese_fuzzy_match | tag:chinese_fuzzy_match 企* |
| search_regex_json | tag:sample04061424_regex_json_100 |
| search_json_sdyd_41 | tag:\"sample04061424_json_sdyd_41\" |
| search_json_sdyd_float | tag:\"sample04061424_json_sdyd_float_59\" |
| search_log4j | tag:\"sample04061424_log4j_100\" |
| search_highlight_get | tag:\"sample04061424\" AND get* |
| search_highlight_gf_bond_start | tag:highlight_gf_bond_56 justLogSplRequest start |
| search_highlight_resp_len_char | tag:\"sample04061424\" AND apache.resp_len:\"93\" |
| search_highlight_resp_len_int | tag:\"sample04061424\" AND apache.resp_len:93 |
| search_highlight_clientip | tag:\"sample04061424\" AND apache.clientip:23* |
| search_highlight_version | tag:\"sample04061424\" AND apache.status:version |
| search_syntax_equal | tag:\"sample04061424_syntax_equal_5\" AND api\"=\"/[a-z]{4}.[a-z]{8}.[a-z]{8}/ |
| search_syntax_equal_oneword_highlight | tag:sample04061424_syntax_equal_5 AND \"user.\" |
| search_syntax_equal_word_highlight | tag:sample04061424_syntax_equal_5 AND \"api\=user\" |
| search_syntax_equal_two_word_noquote_highlight | tag:sample04061424_syntax_equal_5 AND api\=user |
| search_syntax_equal_string_highlight | tag:sample04061424_syntax_equal_5 AND user.passport.loginLog |
| search_syntax_equal_ip_regex_highlight | tag:sample04061424_syntax_equal_5 AND  /[0-9]{3}.[0-9]{1}.[0-9]{3}.[0-9]{1}/ |
| search_regex_match_3string_highlight | tag:\"sample04061424_syntax_equal_5\"  AND /[a-z]{4}/ /[a-z]{7}/ /[a-z]{8}/ |
| search_regex_match_3string_highlight1 | tag:\"sample04061424_syntax_equal_5\"  AND /[a-z]{4}/ /[a-z]{7}/ /[a-z]{100}/ |
| search_chinese | tag:\"sample04061424_chinese_5\" |
| search_raw | tag:\"sample04061424_raw_36\" |
| search_upload_noappname | tag:\"sample04061424_noappname_36\" |
| search_alert_yctv | tag:\"sample04061424_yctv_100\" AND cgi.loglevel:ERROR AND  (NOT \"errno 104\") AND (NOT \"code 0\") AND (NOT \"errno 111\") AND (NOT \"errno 106\") AND (NOT \"verify failed\") AND (NOT \"errno 101\") AND (NOT \"errno 115\") AND (NOT \"errno 117\") AND (NOT \"Detect failed\") AND (NOT \"errno 109\") AND (NOT \"Job failed\") |
| search_xiaomi_syntax | tag:\"sample04061424_xiaomi_3\" AND (invalid \"did=\"yunyi.ba12*) |
| search_two_index | starttime=\"now-1d/d\" endtime=\"now/d+7h\" tag:two_index |
| search_fields_range | tag:\"sample04061424\" AND apache.resp_len:[1 TO 5049] \| eval r_type=typeof(apache.resp_len) \| stats count() as cnt by apache.status, r_type \| sort by cnt, apache.status |
| not_eval_stats_top | tag:\"sample04061424\" AND (NOT apache.status:200) \| eval status = apache.status \| stats top(status,10) |
| sub_es | tag:\"sample04061424\" AND [[tag:\"sample04061424\" \| stats es(apache.status) by apache.method \| fields apache.method]] |
| sub_count | (logtype:apache AND tag:\"sample04061424\") AND [[ appname:apache \| stats count(apache.method) as method_count by apache.method \|  sort by method_count \| limit 1 \| fields apache.method]] |
| subs3 | logtype:apache AND (tag:sample04061424_display OR tag:\"sample04061424_chart\") AND [[ tag:\"sample04061424\" \| stats count(apache.method) as method_count by apache.method \|  sort by method_count \| limit 1 \| fields apache.method]] \| table tag,apache.x_forward, apache.referer, apache.request_query \| sort by tag,apache.x_forward |
| subs4 | (logtype:apache AND tag:\"sample04061424\") AND [[ appname:apache \| stats count(apache.method) as method_count by apache.method \| sort by method_count \| limit 1 \| fields apache.method]] |
| subs5 | (logtype:apache AND tag:\"sample04061424\") AND [[ logtype:apache AND [[ * \| stats count(appname) by apache.method \| fields apache.method \| limit 2 ]] \| stats count(appname) as appcount by apache.method \| fields apache.method ]] |
| subs6 | (logtype:apache AND tag:\"sample04061424\") AND [[ logtype:apache AND [[ * \| stats count(appname) by apache.method \| fields apache.method \| limit 2 ]] \| stats count(appname) as appcount by apache.method \| fields apache.method ]] |
| subs7 | (logtype:apache AND tag:\"sample04061424\") AND [[ * \| stats es(apache.status) as es_status by apache.method \| fields apache.method ]] |
| subs_multi | starttime = \"now/d\" endtime = \"now\" tag:sample04061424_rizhiyi_access_1000 AND (apache.clientip:1.197.41.37 OR  apache.clientip:123.150.214.81) \| append [[tag:sample04061424 apache.status:200 AND apache.method:\"GET\" AND apache.clientip:\"49.85.230.247\" \| append [[tag:sample04061424 \| stats count() as cnt by apache.status]]]] \| sort by cnt, apache.status |
| mindex_append_stats | index=* starttime=\"now/d\" endtime=\"now/d+12h\" tag:\"sample04061424_display\" \| stats count(apache.clientip)  \| append [[ index=* starttime=\"now/d\" endtime=\"now/d+12h\" tag:\"sample04061424_chart\" \| stats count(apache.clientip) ]] |
| sub_download | [[ tag:\"sample04061424\"\| stats avg(apache.resp_len) as avg_len by apache.clientip \| sort by +avg_len ]] \| sort by timestamp |
| group_size_count | tag:\"sample04061424\" AND apache.resp_len:*  \| stats count() as cnt, max(apache.resp_len) as r_max by apache.clientip \| top 3 cnt \| stats last(cnt) |
| group_size_max | tag:\"sample04061424\" AND apache.resp_len:* \| stats count() as cnt, max(apache.resp_len) as r_max by apache.clientip \| top 3 r_max \| stats last(r_max) |
| search_highlight_last_update_timestamp | tag:last_update_timestamp_100 AND last_update_timestamp |
| search_highlight_last_asterisk_match | tag:last_update_timestamp_100 AND last* |
| highlight_before_capital_letter | tag:highlight_huawei_10 \"the message is\" |
| sub_sample | tag:\"sample04061424\" AND [[ tag:\"sample04061424\"  \| stats count(apache.clientip) as count_ by apache.clientip \| sort by count_ \| limit 1 \| fields apache.clientip ]] |
| sub_sample1 | starttime=\"now/d\" endtime=\"now/d+24h\" tag:\"sample04061424\" AND [[ tag:\"sample04061424\"\| stats count(apache.clientip) by apache.clientip, apache.method \| limit 2 \| fields apache.clientip apache.method ]] |
| sub_sample2 | [[ tag:\"sample04061424\"  \| stats count(apache.clientip) as count_ by apache.clientip \| sort by count_ \| limit 1  ]] |
| sub_nest_1 | tag:\"sample04061424\" \| stats dc(apache.status) as dc_count by apache.method \| join apache.method [[ tag:\"sample04061424\" \| stats count(apache.status) as cnt by apache.method \| append [[ tag:\"sample04061424\" \| stats count() as total ]] ]] |
| sub_nest_2 | starttime=\"-d/d\" endtime=\"now/d\" tag:\"sample04061424\" \| append [[ starttime=\"-5h\" endtime=\"now\" tag:\"sample04061424\" apache.status:200 AND apache.method:\"GET\" \| append [[ tag:\"sample04061424\" \| stats count() as cnt by apache.status]] ]] |
| sub_join_left1 | tag:\"sample04061424\" \| stats avg(apache.status) by apache.clientip \| sort by apache.clientip \| join type=left apache.clientip [[ tag:\"sample04061424\" AND apache.clientip:23.166.125.53 \| stats sum(apache.status) by apache.clientip ]] |
| sub_join_left2 | tag:\"sample04061424\"\| fields apache.method apache.clientip \| join type=left apache.clientip [[ tag:\"sample04061424\" \| stats sum(apache.status) by apache.clientip ]] |
| sub_join_inner1 | tag:\"sample04061424\" \| stats avg(apache.status) by apache.clientip \| join type=inner apache.clientip [[ tag:\"sample04061424\" AND apache.clientip:23.166.125.53 \| stats sum(apache.status) by apache.clientip ]] |
| sub_join_inner2 | tag:\"sample04061424\" \| stats avg(apache.status) by apache.clientip \| join type=inner apache.clientip [[ tag:\"sample04061424\" AND apache.clientip:23.166.125.53 \| stats sum(apache.status) by apache.clientip ]] |
| sub_join_inner3 | starttime = \"-1d/d\" endtime = \"now/d\" tag:\"sample04061424\" \| fields apache.clientip, apache.method \| join type=inner apache.clientip [[starttime = \"now/d\" endtime = \"now/d+24h\" tag:\"sample04061424\" \| stats avg(apache.status) as sub_status by apache.clientip ]] |
| sub_join_left3 | starttime = \"-1d/d\" endtime = \"now/d\" tag:\"sample04061424\" \| bucket timestamp span=1h as ts \| stats count() as ip_count by apache.clientip,ts \| join type=left ts [[starttime = \"-1d/d\" endtime = \"now/d\" tag:\"sample04061424\" \| bucket timestamp span=1h as ts \| stats count() as hour_count by ts ]] \| eval ippercent=100 * ip_count / hour_count \| eval r_fomart = formatdate(ts,\"HH:mm:ss\") |
| sub_join_left_if_divide | tag:\"sample04061424\" \| stats count(logtype) as count_all by apache.clientip \| sort by count_all \| limit 5 \| join type=left apache.clientip [[logtype:\"apache\" AND apache.status:[400 TO 499]\|stats count(logtype) as count_400 by apache.clientip]]\|join type=left apache.clientip [[logtype:\"apache\" AND apache.status:[500 TO 599]\|stats count(logtype) as count_500 by apache.clientip]]\|join type=left apache.clientip [[logtype:\"apache\" AND apache.resp_len:>1000\|stats count(logtype) as len_1000 by apache.clientip]]\|eval rate_400=if(empty(count_400),0,count_400/count_all)\|eval rate_500=if(empty(count_500),0,count_500/count_all)\|eval rate_len_1000=if(empty(len_1000),0,len_1000/count_all) |
| eval_logic | tag:\"sample04061424\" \| eval bool_is_empty=empty(apache.request_path) \| eval bool_not_empty=! empty(apache.request_path) \| eval bool_is_false= false && empty(apache.request_path) |
| eval_relation | tag:\"sample04061424\" \| eval new_not_200=apache.status!=200 \| eval new_is_200=apache.status==200 \| eval new_big_200=apache.status>200 \| eval new_bigequal_200=apache.status>=200
\| eval new_small_200=apache.status<200 \| eval new_smallequal_200=apache.status<=200 |
| eval_concat | tag:\"sample04061424\" \| eval ret_connect = appname + apache.clientip + apache.method \| table ret_connect |
| eval_math_add_bracket | tag:\"sample04061424\" \| eval r_len=apache.resp_len \| eval r_status=apache.status \| eval status_add10=apache.status+10 \| eval r_plus=apache.resp_len+apache.status \| eval r_plus_bracket=(apache.resp_len+apache.status)*r_status \| table r_len, r_status,status_add0, r_plus, r_plus_bracket |
| eval_ceil_floor_min_max_log | tag:sample04061424_json_sdyd_41 \| eval r_ceil_cpuTime=ceil(json.cpuTime) \| eval r_floor_cpuTime=floor(json.cpuTime) \| eval r_min=min(json.execTime,json.responseTime) \| eval r_max=max(json.execTime,json.responseTime) \| eval r_log_responseTime=log(json.responseTime) \| table json.cpuTime, json.execTime, json.responseTime, r_ceil_cpuTime, r_floor_cpuTime, r_min, r_max, r_log_responseTime |
| eval_coalesce_empty_if | tag:\"sample04061424\" \| eval path_coalesce=coalesce(apache.request_path,apache.referer) \| eval path_is_empty=empty(apache.request_path) \| eval res=if(path_is_empty,\"path_empty\",\"path_not_empty\") \| eval res_equal200=if(apache.status==200,\"equal200\",\"not_200\") \| eval res_larger=if(apache.status>200,\"larger200\",\"not larger\") |
| eval_case_tran | tag:sample04061424_display OR tag:sample04061424_chart \| eval status_com = case(tag==\"sample04061424_display\", apache.status, tag==\"sample04061424_chart\", apache.status) \| transaction status_com maxevents=100 |
| eval_math_stats | tag:\"sample04061424\" \| eval new_len = 1000 + apache.resp_len \| stats count(new_len) |
| eval_empty_if_top | tag:sample04061424 \| eval len=if(empty(apache.resp_len),0,1) \| stats top(len,10) |
| eval_empty_if_table | tag:sample04061424 \| eval is_resplen_empty=empty(apache.resp_len) \| eval res_str=if(is_resplen_empty,\"repslen_empty\",\"resplen_non_null\") \| table apache.resp_len, is_resplen_empty, res_str \| where is_resplen_empty==true |
| add_subtract_multiply_divide | tag:\"sample04061424\" \| eval res_mul=apache.status*apache.status*0 - apache.status/apache.status%100 \| eval r_add=apache.status+apache.status*10-9*apache.status \| eval res_concat = appname + apache.clientip + \"科罗拉多斯普林斯\" \| sort by apache.resp_len \| table res_mul, r_add, res_concat, apache.resp_len |
| add_1 | tag:\"sample04061424\" AND apache.resp_len:>2000 \| eval resplen=apache.resp_len \| eval status=apache.status \| eval mid=apache.resp_len+apache.status \| eval res_mul=(apache.resp_len+apache.status)*apache.status \| table resplen, status, mid, res_mul |
| logical_operation | tag:\"sample04061424_json_sdyd_float_59\" \| eval res_empty=empty(json.cpuTime) \| eval res_not_empty=!empty(json.cpuTime) \| eval res_true=empty(json.cpuTime) \|\| true \| eval res_false= false && empty(json.cpuTime) \| table json.cpuTime, res_empty, res_not_empty, res_true, res_false |
| comparison_operation | tag:\"sample04061424\" AND NOT apache.status:200 \| eval not_200=apache.status!=200 \| eval is_200=apache.status==200 \| eval big_200=apache.status>200 \| eval bigto_200=apache.status>=200 \| eval small_200=apache.status<200 \| eval smallto_200=apache.status<=200 \| eval res_equal_200=if(apache.status==200,\"\"equal200\"\",\"\"other200\"\") \| eval res_not_200=if(apache.status!=200,\"\"not200\"\",\"\"error\"\") \| table apache.status, not_200, is_200, big_200, bigto_200,small_200,smallto_200, res_equal_200,res_not_200 |
| eval_abs_ceil_floor | tag:sample04061424_json_sdyd_float_59 \|  eval r_abs=abs(json.duration) \| eval r_ceil=ceil(json.duration) \| eval r_floor=floor(json.duration) \| table json.duration,r_abs, r_ceil, r_floor |
| eval_min_max_float | tag:sample04061424_json_sdyd_41 \| eval r_min=min(json.execTime,json.responseTime) \| eval r_max=max(json.execTime,json.responseTime) \| eval r_log_time=log(r_max) \| sort by r_max \| table json.execTime, json.responseTime, r_max, r_min, r_log_time |
| eval_min_max_int | tag:\"sample04061424\" AND apache.resp_len:* \| eval res_min=min(apache.status, apache.resp_len) \| eval res_max=max(apache.status,apache.resp_len) \| table res_min, res_max |
| eval_log_status | tag:\"sample04061424\" \| eval r_log_status=log(apache.status) \| table apache.status, r_log_status |
| eval_len_sdyd_json_name | tag:sample04061424_json_sdyd_41 \| eval r_name_len=len(json.name) \| eval r_ip_len=len(json.dimensions.IP) \| table json.name, r_name_len, json.dimensions.IP, r_ip_len |
| eval_case_default | tag:sample04061424 AND NOT apache.status:200\| eval r_status = \"status: \" + case(apache.status==200, \"ok\", apache.status==400, \"bad\", apache.status>=500, \"other\", default, \"error\") \| table apache.status, r_status |
| eval_case_status | tag:\"sample04061424\" \| eval res_status=case(apache.status==200,\"status=200\",apache.status==404,\"apache=404\",apache.status==500,\"apache==500\",default,\"apache=other\") \| table apache.status,res_status |
| eval_case_stats | tag:sample04061424 AND apache.status:>=301 \| eval r_status=case(apache.status==200,\"status=200\",apache.status<=301,\"apache<=301\",apache.status==304,\"apache==304\",default,\"apache=other\") \| table r_status |
| eval_case_param | tag:sample04061424 OR  tag:sample04061424_json_sdyd_41 \| eval r_len=case(logtype==\"json\", json.cpuTime, logtype==\"apache\", apache.resp_len) \| sort by r_len \| table r_len |
| eval_upper_lower | tag:\"sample04061424\" AND apache.request_path:* \| eval r_upper=upper(apache.request_path) \| eval r_lower=lower(apache.request_path) \| table r_upper, r_lower |
| eval_match_ip1 | tag:\"sample04061424\" \| eval r_match = match(apache.clientip, \"^\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}$\") \| table apache.clientip, r_match |
| eval_match_query | tag:\"sample04061424\" AND apache.request_query:* \| eval r_match1 = match(apache.request_query, \"b.*e\") \| eval r_match2 = match(apache.request_query, \"^bcd\") \| table apache.request_query, r_match1, r_match2 |
| eval_substring_trim | tag:\"sample04061424\" AND apache.referer_domain:* \| eval r_subdomain= substring(apache.referer_domain,0,len(apache.referer_domain)) \| eval r_trim=trim(\"中文 \") \| eval r_eng=trim(\" \"+apache.referer_domain + \" \") \| table r_subdomain, r_eng, r_trim |
| eval_str_tolong | tag:\"sample04061424\" \| eval res_to_str=tolong(\"123\")\| eval res_to_long=tolong(20.3) \| table res_to_str, res_to_long |
| eval_todouble | tag:\"sample04061424\" \| eval r_frm_str=todouble(\"123.1\")  \| eval r_frm_long = todouble(20) \| eval res=r_frm_str+20\| eval t_frm_str = typeof(r_frm_str) \| eval t_frm_long = typeof(r_frm_long) \| eval t_res = typeof(res) \| table r_frm_str, t_frm_str, r_frm_long,t_frm_long, res,t_res |
| eval_typeof_1 | tag:sample04061424_json_sdyd_41 \| eval t_cputime = typeof(json.cpuTime) \| eval t_actionName=typeof(json.actionName) \| eval t_failed=typeof(json.failed) \| eval t_agent_timestamp=typeof(agent_send_timestamp)  \| eval t_dimensions_ip=typeof(json.dimensions.IP) \| eval t_dimensions = typeof(json.dimensions) \| table json.cpuTime, t_cputime, json.actionName, t_actionName, json.failed, t_failed, json.agent_send_timestamp, t_agent_timestamp, json.dimensions.IP, t_dimensions_ip, t_dimensions |
| eval_typeof_2 | tag:sample04061424 \| eval t_timestamp = typeof(timestamp) \| eval t_context_id = typeof(context_id) \| eval t_x_forward = typeof(apache.x_forward) \| eval t_latitude = typeof(apache.geo.latitude) \| eval t_resp_len = typeof(apache.resp_len) \| eval t_status = typeof(apache.status) \| table t_timestamp,t_context_id,t_x_forward,t_latitude,t_resp_len, t_status |
| eval_tostring | tag:\"sample04061424\" \| eval t = \"logtype:\" + logtype \| where tostring(t) == \"logtype:apache\" && tostring(apache.clientip) == \"23.166.125.53\" && tostring(appname) == \"apache\" \| table apache.clientip, appname, t |
| eval_parsedate | tag:\"sample04061424\" apache.method:GET \| eval x = parsedate(\"28/04/2016:12:01:01\",\"dd/MM/yyyy:HH:mm:ss\") \| eval y = parsedate(\"28/04/2016\",\"dd/MM/yyyy\") \| table x,y |
| eval_parsedate_chinese_month | tag:\"sample04061424\" apache.method:GET \| eval t_chn = parsedate(\"28/四月/2016\", \"dd/MMMM/yyyy\", \"Asia/Shanghai\", \"zh\") \| table t_chn \| eval f_t_chn = formatdate(t_chn) |
| formatdate_sample | tag:\"sample04061424\" apache.method:GET \| eval r_formatdate = formatdate(1537414676598, \"HH:mm:ss:SSS MM/dd/yyyy\") \|table apache.resp_len, r_formatdate |
| parsedate_limit | tag:\"sample04061424\" AND 'apache.resp_len':5049 \| limit 10 \| eval f_start_time = \"2014-08-02 10:52:22.000\" \| eval f_end_time = \"2046-12-29 10:52:22.000\" \| eval mill_start_time=parsedate(f_start_time,\"yyyy-MM-dd HH:mm:ss.SSS\") \| eval mill_end_time = parsedate(f_end_time,\"yyyy-MM-dd HH:mm:ss.SSS\") \| table f_start_time, f_end_time, mill_start_time, mill_end_time |
| format | tag:\"sample04061424\" \| eval x_format = format(\"%s, %s => %s\", logtype, tag, apache.clientip) \| table x_format |
| eval_isnum_isstr | tag:\"sample04061424\" \| eval r_isnum = isnum(apache.status) \| eval r_isstr = isstr(apache.method) \| table r_isnum, r_isstr |
| relative_time_timestamp_data_math | tag:\"sample04061424\" \| eval r_relative = relative_time(timestamp, \"-1d/d\") \| eval r_format_relative = formatdate(r_relative, \"HH:mm:ss:SSS MM/dd/yyyy\") \| eval r_format_timestamp = formatdate(timestamp, \"HH:mm:ss:SSS MM/dd/yyyy\") \| table r_relative, r_format_relative |
| cidrmatch | tag:\"sample04061424\" \| eval r_m130 = cidrmatch(\"192.168.1.130/25\", \"192.168.1.129\") \| eval r_m128 = cidrmatch(\"192.168.1.128/25\", \"192.168.1.129\") \| eval r_m255 = cidrmatch(\"192.168.1.255/25\", \"192.168.1.129\") \| table r_m130, r_m128, r_m255 |
| eval_urldecode | starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424_urldecode_apache_10 AND apache.request_query:* \| eval r_decode = urldecode(apache.request_query) \| table apache.request_query,r_decode |
| bug_followed_add | tag:\"sample04061424\" \|eval a=add(apache.status,apache.resp_len) \| sort a |
| eval_stats1 | starttime=\"now/d\" endtime=\"now/d+24h\" tag:\"sample04061424\" \| eval method = apache.method \| stats count() as count1, avg(apache.resp_len) as avg_len by method, apache.status \| sort by -avg_len |
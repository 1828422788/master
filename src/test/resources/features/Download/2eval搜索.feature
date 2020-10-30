@alldownload
Feature: eval函数

  Background:
    Given open the "splSearch.SearchPage" page for uri "/search/"
    And I wait for element "SearchStatus" change text to "搜索完成!"

  @dleval
  Scenario Outline: 执行
    Given I set the parameter "SearchInput" with value "<splQuery>"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for "2000" millsecond
    And I wait for element "SearchStatus" change text to "搜索完成!"

    And I wait for "2000" millsecond
    And I wait for "downloadButton" will be visible
    Then I click the "downloadButton" button
    Then I set the parameter "DownloadName" with value "<name>"
    Then I set the parameter "MaxLineNum" with value "100"
#    Then I choose the "<unit>" from the "MaxLineDropdown"
    Then I choose the "CSV" from the "DocumentTypeList"
    Then I choose the "UTF" from the "DocumentEncodeList"
    Then I click the "CreateDownloadTask" button
#    And I wait for "2000" millsecond
#    Then I will see the success message "提交成功，请到设置-下载管理页查看下载状态！"

    #下载到本地
    Given open the "splSearch.OfflineTaskPage" page for uri "/download/#"
    When I set the parameter "DbListPageSearchInput" with value "<name>.csv"
    And I wait for "2000" millsecond
    Given the data name is "<name>.csv" then i click the "下载" button
#    And I wait for "2000" millsecond
#    Then I compare source download file "expect/<name>.csv" with target download files "<name>.csv"

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

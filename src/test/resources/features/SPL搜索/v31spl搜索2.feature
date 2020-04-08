
Feature: SPL语句执行_STATS部分

  Background:
    Given open the "splSearch.SearchPage" page for uri "/search/"

#  @smoke @spl @all
  @v31tcspl2
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
| stats_math_sort_limit_eval | (logtype:apache AND tag:\"sample04061424\") \| stats count(tag) as event_count,sum(apache.resp_len) as sum_len,max(apache.resp_len) as max_len,min(apache.resp_len) as min_len by apache.clientip\|sort by sum_len \| limit 5 \| eval agv_len=if(event_time==0,0,sum_len/event_time) |
| stats_count_eval | tag:\"sample04061424\" \| stats count() as count_ by appname, logtype \| eval test_eval=appname |
| stats_extend_stat | tag:\"sample04061424\" \| stats extend_stat(apache.resp_len) |
| stats_arith_by_city | tag:\"sample04061424\" \| stats count(apache.status), max(apache.status), min(apache.resp_len), sum(apache.status), avg(apache.status) by apache.clientip \| sort by apache.clientip |
| stats_top | tag:\"sample04061424\" \| stats top(apache.status,3) |
| stats_hg | tag:\"sample04061424\" \| stats hg(apache.status,10) |
| stats_pct | tag:\"sample04061424\"\| stats pct(raw_message_length,1,5,25,50,75,95,99) |
| tran_apachelen_sort | tag:\"sample04061424\" \| transaction  apache.resp_len \| sort by apache.resp_len |
| tran_sort_ascend | tag:\"sample04061424\" \| transaction apache.status \| sort by + apache.status |
| tran_param_max_txn_maxopen10 | tag:\"sample04061424\" \| transaction apache.status maxevents=10 maxopentxn=100 maxopenevents=100 |
| tran_param_max_txn_maxopen3 | tag:\"sample04061424\" AND apache.status:\"200\" \| transaction apache.status maxevents=3 maxopentxn=100 maxopenevents=100 |
| tran_status_contains_maxevents_10 | tag:\"sample04061424\" AND clientconfig \| transaction apache.status  maxevents=10 maxopenevents=100 contains=\"clientconfig\" |
| tran_status_contains_maxevents_100 | tag:\"sample04061424\" AND clientconfig \| transaction apache.status  maxevents=100 maxopenevents=100 contains=\"clientconfig\" |
| tran_method_max_maxopen_contains1 | \"clientconfig\" AND tag:\"sample04061424\" \| transaction apache.method contains=\"clientconfig\"  maxevents=10 maxopenevents=100 |
| tran_method_max_maxopen_contains2 | \"\\"GET /index/portal/\" AND tag:\"sample04061424\" \| transaction apache.method contains=\"\\"GET /index/portal/\"  maxevents=300 maxopenevents=1000 |
| eval_if_stats_count | (logtype:apache AND tag:\"sample04061424\") \| eval desc = if (apache.status==200, \"OK\", \"Error\")\|stats count(desc) by desc |
| eval_case_stats_count | (logtype:apache AND tag:\"sample04061424\") \| eval desc=case(apache.resp_len<0,\"nagetive\",apache.resp_len<100,\"low\",apache.resp_len>2000,\"high\",empty(apache.resp_len),\"Not found\",default,\"middle\") \| stats count(desc) by desc |
| eval_tolong | (logtype:apache AND tag:\"sample04061424\") \| eval int_status= tolong(apache.status) |
| eval_parsedate_formatdate | (logtype:apache AND tag:\"sample04061424_chart\") \| eval f_ref_time = \"22:52:22.000\" \| eval mill_ref_time=parsedate(f_ref_time,\"HH:mm:ss.SSS\") \| eval f_cut_timestamp = formatdate(timestamp,\"HH:mm:ss.SSS\") \| eval mill_cut_timestamp=parsedate(f_cut_timestamp,\"HH:mm:ss.SSS\") \| eval mill_diff_time= mill_ref_time - mill_cut_timestamp \| eval f_diff_time = formatdate(mill_diff_time,\"HH:mm:ss:SSS\") \| table f_ref_time, f_cut_timestamp, mill_ref_time, mill_cut_timestamp, mill_diff_time,f_diff_time |
| tran_ip_maxopen_max | (logtype:apache AND tag:\"sample04061424\") \| transaction apache.clientip maxopenevents=10 maxevents=10 |
| bucket_ts_stats_sum_eval | (logtype:apache AND tag:\"sample04061424_chart\") \| bucket timestamp span=1m as ts \| stats sum(apache.resp_len) as sum_len by ts,apache.status \| eval time=formatdate(ts,\"HH:mm:ss\") |
| starttime_bucket_ts_sum_eval | starttime=\"now/d\" endtime=\"now/d+24h\" tag:\"sample04061424_chart\" \| bucket timestamp span=1h as ts \| stats sum(apache.resp_len) as sum_len by ts \| eval time=formatdate(ts,\"HH:mm:ss\") |
| starttime_bucket_ts_count_eval_formatdate | starttime=\"now/d\" endtime=\"now/d+24h\" tag:\"sample04061424_chart\" \| bucket timestamp span=1h as ts \| stats count(apache.resp_len) as sum_len by ts \| eval time=formatdate(ts,\"HH:mm:ss\") |
| bucket_ranges_status_count | (logtype:apache AND tag:\"sample04061424\") \| bucket apache.status ranges=((0, 200), (200, 300), (300, MAX)) as rs \| stats count(apache.status) as count_status by rs |
| sub_where_count_big5 | (apache.resp_len:69 AND tag:\"sample04061424\") AND [[tag:\"sample04061424\" \| stats count(apache.clientip) as count_ by apache.clientip,apache.method \| where count_>5 \| fields apache.clientip,apache.method ]] |
| sub_join_left | tag:\"sample04061424\" \| stats count(logtype) as count_all by apache.geo.isp \| sort by count_all \| limit 20 \| join type=left apache.geo.isp [[tag:\"sample04061424\" AND apache.status:[400 TO 499] \| stats count(logtype) as count_400l by apache.geo.isp]] \| join type=left apache.geo.isp [[tag:\"sample04061424\" AND apache.status:[500 TO 599] \| stats count(logtype) as count_500l by apache.geo.isp]] |
| sub_join_left_count_3times | tag:\"sample04061424\" \| stats count(logtype) as count_all by apache.clientip \| sort by count_all \| limit 20 \| join type=left apache.clientip [[tag:\"sample04061424\" AND apache.status:[400 TO 499] \| stats count(logtype) as count_400l by apache.clientip]] \| join type=left apache.clientip [[tag:\"sample04061424\" AND apache.status:[500 TO 599] \| stats count(logtype) as count_500l by apache.clientip]] \| join type=left apache.clientip [[tag:\"sample04061424\"AND apache.resp_len:>1000\| stats count(logtype) as len_1000l by apache.clientip]] \| sort by count_all, apache.clientip |
| sub_join_percent | tag:\"sample04061424\" \| stats count(logtype) as count_all by apache.clientip \| sort by count_all \| limit 50 \| join type=left apache.clientip [[ tag:\"sample04061424\" AND apache.status:[400 TO 499] \| stats count(logtype) as count_400 by apache.clientip]] \| join type=left apache.clientip [[ tag:\"sample04061424\" AND apache.status:[500 TO 599] \| stats count(logtype) as count_500 by apache.clientip ]] \| join type=left apache.clientip [[tag:\"sample04061424\" AND apache.resp_len:>1000 \| stats count(logtype) as len_1000 by apache.clientip]] \| eval rate_400=if(empty(count_400),0,count_400/count_all) \| eval rate_500=if(empty(count_500),0,count_500/count_all) \| eval rate_len_1000=if(empty(len_1000),0,len_1000/count_all) \| sort by count_all, apache.clientip |
| bucket_stats_eval_movingavg | starttime=\"now/d\" endtime=\"now/d+24h\"  tag:\"sample04061424_chart\"\| bucket timestamp span=1m as ts \| stats sum(apache.resp_len) as sum_resp_len by ts \| eval time=formatdate(ts,\"HH:mm:ss\") \| movingavg sum_resp_len,3 as moving_avg_resp_len |
| bucket_append_math | starttime=\"now/d\" endtime=\"now/d+24h\" tag:\"sample04061424_chart\" \| bucket timestamp span=1h as ts \| stats avg(apache.resp_len) as stats_resplen by ts \| eval time=formatdate(ts,\"HH\") \| eval line=\"avg_line\" \| append [[starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424_chart \| bucket timestamp span=1h as ts \| stats max(apache.resp_len) as stats_resplen by ts \| eval time=formatdate(ts,\"HH\") \| eval line=\"max_line\"]] \| append [[starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424_chart \| bucket timestamp span=1h as ts \| stats min(apache.resp_len) as stats_resplen by ts \| eval time=formatdate(ts,\"HH\") \| eval line=\"min_line\" ]] |
| append_baseline_cmp | starttime=\"now/d\" endtime=\"now\" tag:\"sample04061424\"\| bucket timestamp span=1h as ts \| stats count(apache.geo.isp) as count_ by apache.geo.isp, ts\|eval date_hour=tolong(formatdate(ts,\"HH\")) \| rename apache.geo.isp as group_line \| append [[index=schedule starttime=\"-2d\" endtime=\"-d/d\" schedule_name:pip_task\|stats avg(ip_count) as count_ by date_hour\|eval group_line=\"base_line\"\|sort by +date_hour]] |
| bucket_stats_autoregress_eval_where_fields | starttime=\"now/d\" endtime=\"now/d+24h\" tag:\"sample04061424_chart\" \| bucket timestamp span=1h as ts \| stats count(appname) as count_app by ts \| eval time=formatdate(ts,\"HH:mm:ss\") \| autoregress count_app p=6 \| eval rate=if(empty(count_app_p6),0,abs(count_app_p6-count_app)) \| eval result=if(empty(count_app_p6),0,1) \| where result>0 \| fields count_app,time,count_app_p6,rate,result |
| bucket_stats_autoregress | starttime=\"now/d\" endtime=\"now/d+24h\" tag:\"sample04061424_chart\" \| bucket timestamp span=1h as ts \| stats count() as count_app by ts \| eval time=formatdate(ts,\"HH:mm:ss\") \| autoregress count_app p=3 |
| stats_save | tag:\"sample04061424\" \| stats avg(apache.status) by hostname \| save /data/rizhiyi/spldata/apache_latency.csv |
| start_time_para_mon | starttime=\"now-1M/M-1d/w\"  endtime=\"now\" tag:sample04061424 |
| start_time_value | starttime=2017-08-13 endtime=2017-08-13:23:59:00 tag:sam ple |
| startt_today | starttime=\"now/d\" endtime=\"now\" tag:sample04061424 |
| start_time_para_day | starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424 \| stats count(apache.resp_len) as event_count, max(apache.resp_len) as max_len, avg(apache.resp_len) as avg_status |
| index_yotta_tag | index=* tag:sample04061424 |
| index_yotta_regex | index=yotta tag:sample04061424 AND  /[0][8]0{2,2}/ |
| index_yotta_all | index=yotta starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424* |
| index_internal | index=internal * |
| index_schedule | index=schedule * |
| index_task_search | index=schedule schedule_name:bar_resp_len \| bucket timestamp span=1h as ts \| stats max(max_resp_len) as max_resp_len_hour by ts |
| tran_count_where | tag:\"sample04061424\" \| transaction apache.resp_len \| where _count==4 |
| tran_duration_where | tag:\"sample04061424\" \| transaction apache.resp_len \| where _duration<500 |
| tran_endswith_eval_contains | tag:\"sample04061424\" \| transaction apache.clientip endswith=eval(apache.status == 200) maxevents=10 contains=\"Dalvik\" |
| tran_startswith_endswith_maxspan_5s | starttime = \"now/d\" endtime = \"now\" tag:\"sample04061424\" \| transaction apache.clientip startswith=\"Android\" endswith=\"Dalvik\" maxspan=5s maxevents=50 maxopentxn=1000 maxopenevents=1000 |
| tran_startswith_endswith_maxopenevents2 | starttime=\"now/d\" endtime = \"now/d+24h\" tag:\"sample04061424\" \| transaction apache.clientip  startswith=\"1977\" endswith=\"Android 4.3\" maxspan=1d maxevents=50 maxopentxn=1000 maxopenevents=1000 |
| tran_sort | tag:\"sample04061424\" \| transaction apache.resp_len \| sort by apache.resp_len |
| tran_count_apachelen | tag:\"sample04061424\" \| transaction apache.resp_len \| stats count(apache.resp_len) |
| tran_stats_cmd_limit | tag:\"sample04061424\" \| transaction apache.status, apache.method \| stats count() as cnt |
| stats_math_1 | tag:\"sample04061424\" \| stats count(apache.status) as cnt, min(apache.status),max(apache.status),avg(apache.status),sum(apache.status), es(apache.status) by apache.clientip \| sort by cnt, apache.clientip |
| stats_math_2 | tag:\"sample04061424\" \| stats count(apache.status) as cnt, min(apache.status),max(apache.status),avg(apache.status),sum(apache.status), extend_stat(apache.status) by apache.clientip \| sort by cnt, apache.clientip |
| where_dc | tag:\"sample04061424\" \| where apache.status>400 \| stats dc(apache.status) |
| where_es | tag:\"sample04061424\" \| where apache.status>400 \| stats es(apache.status) |
| stats_count | tag:\"sample04061424\" \| stats count() as cnt by apache.status |
| stats_min_timestamp_formatdate | tag:\"sample04061424_chart\" \| stats min(timestamp) as min_time by apache.status \| eval t_min_time = typeof(min_time) \| eval long_min_time = tolong(min_time) \| eval f_min_time = formatdate(log_min_time,\"HH:mm:ss\") \| sort by +apache.status |
| stats_sort | tag:\"sample04061424\" \| sort by +apache.status,+apache.resp_len\| table apache.status, apache.resp_len |
| stats_sort_fail | tag:\"sample04061424\" \| stats avg(apache.resp_len) as avg_length by apache.clientip \| sort by +avg_length, apache.clientip \| eval eval_length = avg_length + 200 |
| stats_sort_true | tag:\"sample04061424\" \| stats avg(apache.resp_len) as avg_length by apache.status \| eval eval_length = avg_length + 200 \| sort by eval_length |
| stats_avg_count_sort | tag:\"sample04061424\" \| stats avg(apache.resp_len) as avg_length, count(apache.clientip) as ip_count by apache.status \| sort by ip_count, apache.status |
| stats_stats_avg | tag:\"sample04061424\" \| stats count() as cnt, max(apache.status) as r_max by apache.clientip \| stats avg(cnt) by  r_max |
| stats_stats_top | tag:\"sample04061424\" \| stats count() as cnt, max(apache.status) as r_max by apache.clientip \| top 3 cnt |
| top_1_resp_len | tag:\"sample04061424\" \| top 50 apache.resp_len \| sort by count, apache.resp_len |
| top_2_clientip_by_path | tag:\"sample04061424\" \| top 20 apache.clientip by apache.request_path \| sort by count, apache.request_path, apache.clientip |
| top_count_percent | tag:\"sample04061424\" \| top 20 apache.clientip  countfield=clientip_count  percentfield=clientip_percent |
| top_groupby | tag:\"sample04061424\"  \| top 3 apache.clientip by apache.resp_len \| sort by count, apache.resp_len, apache.clientip |
| bucket_1h_stats_count | starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424_chart \| bucket timestamp span=1h as ts \| stats count(apache.clientip) as c_ip by ts |
| bucket_stats_eval_where | starttime=\"now/d\" endtime=\"now/d+7h\" tag:sample04061424_apachesample_dawn \| bucket timestamp span=10m as ts\|stats count(appname) as count_app by ts\|eval time=formatdate(ts,\"HH:mm:ss\") \| autoregress count_app p=6\|eval rate=if(empty(count_app_p6),0,abs(count_app_p6-count_app)) \| eval result=if(empty(count_app_p6),0,1) \|where result>0\|fields count_app,time,count_app_p6,rate |
| bucket_movingavg_rollingstd_eval | starttime=\"now/d\" endtime=\"now/d+7h\" tag:sample04061424_apachesample_dawn \| bucket timestamp span=1h as ts\| stats count(appname) as count_ by ts\| movingavg count_,5 as ma\| rollingstd count_,5 as rs\| eval lower=ma-1*rs\| eval upper=ma+1*rs\| eval outlier=if(count_>upper\|\|count_<lower, count_, 0) |
| bucket_timeranges | starttime=\"now/d\" endtime=\"now\" tag:\"sample04061424\" \| bucket timestamp timeranges=((MIN,-2h),(-2h,-1h),(-1h,MAX)) as ts \| table ts |
| bucket_timeranges_count | starttime=\"now/d\" endtime=\"now\" tag:\"sample04061424\" \| bucket timestamp timeranges=((-2d, -1d),(-1d, MAX),(2017-02-17:00:00:00, 2018-02-23:00:00:00)) as tr \| stats count(appname) as ct by tr |
| rename_status | tag:\"sample04061424\" \| rename apache.status as \"status_1\" \| table apache.status,status_1 |
| rename_status_to_chinese | index=* starttime=\"now/d\" endtime=\"now/d+24h\"  tag:\"sample04061424\" \| rename apache.status as \"状态码\" \| table '状态码' \| sort by '状态码' |
| where_logic_and | tag:\"sample04061424\" \| where  apache.status > 200 && apache.status < 400 \| table apache.status |
| limit_1 | tag:\"sample04061424\"\| limit 10 |
| fields_sample | starttime=\"now/d\" endtime=\"now\" tag:\"sample04061424\" \| stats count() as count_res by appname,apache.clientip \| fields apache.clientip, count_res \| sort by count_res, apache.clientip |
| save_stats_avg_ip | tag:\"sample04061424\" \| stats avg(apache.resp_len) as avg_len,count(apache.resp_len) by apache.clientip \| sort by +apache.clientip \| save /data/rizhiyi/spldata/save_stats_avg_ip.csv |
| rollingstd | starttime=\"now/d\" endtime=\"now/d+13h\" tag:sample04061424_apachesample_dawn\| bucket timestamp span=1h as ts \| stats avg(apache.resp_len) as avg_resp_len by ts  \| rollingstd avg_resp_len,10 as resp_len_rolling_std |
| autoregress_sample | starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424_apachesample_dawn \| bucket timestamp span=30m as ts \| stats count(appname) as count_app by ts \| eval time=formatdate(ts,\"HH:mm:ss\") \| autoregress count_app p=6 |
| autoregress1 | starttime=\"now/d\" endtime=\"now/d+13h\" tag:sample04061424_apachesample_dawn \| bucket timestamp span=10m as ts \| stats count(appname) as count_app by ts\|eval time=formatdate(ts,\"HH:mm:ss\") \| autoregress count_app p=6\|eval rate=if(empty(count_app_p6),0,abs(count_app_p6-count_app)) \| eval result=if(empty(count_app_p6),0,1) \| where result>0\|fields count_app,time,count_app_p6,rate |
| autoregress_2 | tag:\"sample04061424\" \| eval  avg_resp_len = apache.resp_len \| autoregress avg_resp_len p=1-2 \| eval res_avg = (avg_resp_len + avg_resp_len_p2 + avg_resp_len_p1) / 3 \| top 3 res_avg |
| append_sample | starttime=\"now/d\" endtime=\"now/d+24h\" tag:\"sample04061424_display\" \| stats avg(apache.resp_len) as avg_resp_len \| append [[ starttime=\"now/d\" endtime=\"now/d+24h\" tag:\"sample04061424_chart\" \| stats avg(apache.resp_len) as avg_resp_len \| append [[ starttime=\"now/d\" endtime=\"now/d+24h\"  tag:\"sample04061424\" \| stats avg(apache.resp_len) as avg_resp_len]] ]] |
| append_stats_sub | tag:\"sample04061424\" \| stats count(apache.clientip)  \| append [[ index=*  tag:\"sample04061424\" \| stats count(apache.clientip) ]] |
| append_status_sub_eval | starttime=\"now/d\" endtime=\"now/d+24h\" tag:\"sample04061424_apachesample_dawn\" \| stats avg(apache.resp_len) \| eval day=\"the group dawn\" \| append  [[ starttime=\"now/d\" endtime=\"now/d+24h\" tag:\"sample04061424_display\" \| stats avg(apache.resp_len) \| eval day=\"the group display\" \| append [[ starttime=\"now/d\" endtime=\"now/d+24h\" tag:\"sample04061424_chart\" \| stats avg(apache.resp_len) \| eval day=\"the group chart\" ]] ]] |
| append_bucket_bucket | starttime=\"now/d\" endtime=\"now/d+12h\" tag:\"sample04061424_display\" \| bucket timestamp span=1h as ts \| stats max(apache.resp_len) as count_1 by ts \| eval time=formatdate(ts, \"HH:mm:ss.SSS\") \| eval line=\"max_line\" \| append [[starttime=\"now/d\" endtime=\"now/d+12h\" tag:sample04061424_chart \| bucket timestamp span=1h as ts \| stats count(apache.resp_len) as count_2 by ts \| eval time=formatdate(ts, \"HH:mm:ss.SSS\") \| eval line=\"count_line\" ]] |
| bucket_stats_es | starttime=\"now/d\" endtime=\"now/d+7h\" tag:sample04061424_apachesample_dawn \| bucket timestamp span=1h as ts \| stats es(apache.status) by ts |
| table_sample | starttime=\"now/d\" endtime=\"now/d+7h\" tag:\"sample04061424_apachesample_dawn\" \| eval new_time=formatdate(timestamp, \"HH:mm:ss\") \| table apache.status,apache.method,new_time |
| table_result_seq | tag:\"sample04061424\" \| table appname, tag, apache.clientip, apache.geo.country, apache.request_path, apache.status, apache.resp_len, apache.method |
| fields_result_seq | tag:\"sample04061424\" \| fields appname, tag, apache.clientip, apache.geo.country, apache.request_path, apache.status, apache.resp_len, apache.method |
| command_limit_mul_stats | tag:\"sample04061424\" \| stats count() as cnt, max(apache.status) as r_max by apache.clientip \| stats max(cnt),max(r_max) |
| command_limit_mul_top | tag:\"sample04061424\" \| stats count() as cnt, max(apache.status) as r_max_status by apache.clientip \| top 3 r_max_status |
| parse_message2ip_count2tag | tag:\"sample04061424\" \| parse \"^(?<ip_addr>\d+\.\d+\.\d+\.\d+)\" \| eval ip_str = \"ip:\" + ip_addr \| stats count(tag) as app_cnt by ip_str \| sort by app_cnt,ip_str |
| parse_clientip_stats | tag:\"sample04061424\" \| parse field=apache.clientip \"(?<ip_addr>\d+\.\d+\.\d+\.\d+)\" \| eval ip_str = \"ip:\" + ip_addr \| stats count(appname) as app_cnt by ip_str \| sort by app_cnt,ip_str |
| parse_request_path_stats | tag:\"sample04061424\" \| parse field=apache.request_path \"^(?<outer_path>/[^/]*)\" \| stats count(appname) by outer_path |
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
| time_sequence | tag:\"sample04061424_apachesample_dawn\" AND apache.resp_len:* \| eval res_reduce_time = collector_recv_timestamp - agent_send_timestamp \| eval f_timestamp = formatdate(timestamp,\"HH:mm:ss\")  \| table res_reduce_time, f_timestamp, agent_send_timestamp, collector_recv_timestamp \| where agent_send_timestamp<collector_recv_timestamp \|\|  agent_send_timestamp==collector_recv_timestamp |

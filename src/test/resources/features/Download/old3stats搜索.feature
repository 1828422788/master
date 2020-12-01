@oldalldownload
Feature: stats下载

  Background:
    Given open the "splSearch.SearchPage" page for uri "/search/"
    And I wait for element "SearchStatus" change text to "搜索完成!"

  @olddlstats
  Scenario Outline: stats用例结果下载
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
#    And I download file "<name>.csv" to local
#    Then I compare source download file "expect/<name>.csv" with target download files "<name>.csv"

    Examples: 新建成功
      | name                                         | splQuery                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      |
      | sub_join_inner1 | tag:\"sample04061424\" \| stats avg(apache.status) by apache.clientip \| join type=inner apache.clientip [[ tag:\"sample04061424\" AND apache.clientip:23.166.125.53 \| stats sum(apache.status) by apache.clientip ]] |
      | sub_join_inner2 | tag:\"sample04061424\" \| stats avg(apache.status) by apache.clientip \| join type=inner apache.clientip [[ tag:\"sample04061424\" AND apache.clientip:23.166.125.53 \| stats sum(apache.status) by apache.clientip ]] |
      | sub_join_left | tag:\"sample04061424\" \| stats count(logtype) as count_all by apache.geo.isp \| sort by count_all,apache.geo.isp \| join type=left apache.geo.isp [[tag:\"sample04061424\" AND apache.status:[400 TO 499] \| stats count(logtype) as count_400l by apache.geo.isp]] \| join type=left apache.geo.isp [[tag:\"sample04061424\" AND apache.status:[500 TO 599] \| stats count(logtype) as count_500l by apache.geo.isp]] |
      | sub_join_left1 | tag:\"sample04061424\" \| stats avg(apache.status) by apache.clientip \| sort by apache.clientip \| join type=left apache.clientip [[ tag:\"sample04061424\" AND apache.clientip:23.166.125.53 \| stats sum(apache.status) by apache.clientip ]] |
      | sub_join_left_count_3times | tag:\"sample04061424\" \| stats count(logtype) as count_all by apache.clientip \| sort by count_all \| limit 20 \| join type=left apache.clientip [[tag:\"sample04061424\" AND apache.status:[400 TO 499] \| stats count(logtype) as count_400l by apache.clientip]] \| join type=left apache.clientip [[tag:\"sample04061424\" AND apache.status:[500 TO 599] \| stats count(logtype) as count_500l by apache.clientip]] \| join type=left apache.clientip [[tag:\"sample04061424\"AND apache.resp_len:>1000\| stats count(logtype) as len_1000l by apache.clientip]] \| sort by count_all, apache.clientip |
#      | sub_join_left_if_divide | tag:\"sample04061424\" \| stats count(logtype) as count_all by apache.clientip \| sort by count_all \| limit 5 \| join type=left apache.clientip [[logtype:\"apache\" AND apache.status:[400 TO 499]\|stats count(logtype) as count_400 by apache.clientip]]\|join type=left apache.clientip [[logtype:\"apache\" AND apache.status:[500 TO 599]\|stats count(logtype) as count_500 by apache.clientip]]\|join type=left apache.clientip [[logtype:\"apache\" AND apache.resp_len:>1000\|stats count(logtype) as len_1000 by apache.clientip]]\|eval rate_400=if(empty(count_400),0,count_400/count_all)\|eval rate_500=if(empty(count_500),0,count_500/count_all)\|eval rate_len_1000=if(empty(len_1000),0,len_1000/count_all) |
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
#      | tran_with_stats_fromstate_tostate | tag:\"t_with\" \| transaction json.sid with states a, b, c in json.module results by flow \| stats count() by fromstate, tostate |
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

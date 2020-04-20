
Feature: SPL语句执行_PART3

  Background:
    Given open the "splSearch.SearchPage" page for uri "/search/"

#  @smoke @spl @all
  @v31tcspl @v31tcspl3
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
| bug_onetag_sort_timestamp1 | index=* starttime=\"now/d\" endtime=\"now/d+24h\" tag: sample04061424*  \| sort by timestamp |
| bug_onetag_sort_timestamp2 | index=* starttime=\"now/d\" endtime=\"now/d+24h\" tag: sample04061424*  \| sort by +timestamp |
| bug_top_limit_sort1_Mindex | index=* starttime=\"now/d\" endtime=\"now/d+24h\" tag: sample04061424*  \| top 10 appname \| limit 10 |
| bug_stats_limit_sort2_Mindex | index=* starttime=\"now/d\" endtime=\"now/d+24h\" tag: sample04061424*  \| top 10 appname \| limit 10 \|sort by count |
| join_left_mult | tag:\"sample04061424\" \| stats count(logtype) as count_all by apache.geo.isp \| sort by count_all \| limit 5 \| join type=left apache.geo.isp[[logtype:\"apache\" AND apache.status:[400 TO 499]\|stats count(logtype) as count_400 by apache.geo.isp]]\|join type=left apache.geo.isp [[logtype:\"apache\" AND apache.status:[500 TO 599]\|stats count(logtype) as count_500 by apache.geo.isp]]\|join type=left apache.geo.isp [[logtype:\"apache\" AND apache.resp_len:>1000\|stats count(logtype) as len_1000 by apache.geo.isp]]\|eval rate_400=if(empty(count_400),0,count_400/count_all)\|eval rate_500=if(empty(count_500),0,count_500/count_all)\|eval rate_len_1000=if(empty(len_1000),0,len_1000/count_all) |
| bug_sort_timestamp1 | index=* starttime=\"now/d\" endtime=\"now/d+24h\" tag: sample04061424* \| sort by timestamp \| table tag |
| bug_sort_timestamp2 | index=* starttime=\"now/d\" endtime=\"now/d+24h\" tag: sample04061424* \| sort by +timestamp \| eval f_formatdate = formatdate(timestamp)\| table appname,f_formatdate |
| bug_top_limit_sort1 | index=* starttime=\"now/d\" endtime=\"now/d+24h\" tag: sample04061424*  \| top 10 appname \| limit 20 |
| bug_top_limit_sort2 | index=* starttime=\"now/d\" endtime=\"now/d+24h\" tag: sample04061424*  \| top 10 appname \| limit 10 \|sort by count |
| bug_stats_limit_sort1 | index=* starttime=\"now/d\" endtime=\"now/d+24h\" tag: sample04061424* \| stats count() as ct by appname \| limit 10 |
| bug_stats_limit_sort2 | index=* starttime=\"now/d\" endtime=\"now/d+24h\" tag: sample04061424* \| stats count() as ct by appname \| limit 10 \| sort by +ct |
| bug_where_count1 | tag:sample04061424 AND apache.resp_len:* \| eval trade_time=todouble(apache.resp_len) \| where trade_time>0.0 \| stats count() as count_ |
| bug_where_count2 | tag:sample04061424 AND apache.resp_len:>0 \| eval trade_time=todouble(apache.resp_len) \| where trade_time>0.1 \| stats count() as count_ |
| bug_count_extend_stats | tag:\"sample04061424\" \| stats count() as cnt by apache.status \| stats extend_stat(cnt) |
| bug_max_if | tag:\"sample04061424\" \| stats max(timestamp) by apache.method \| eval a = if(empty(apache.method), 1, 0) |
| bug_max_as_value | tag:\"sample04061424\" \| stats max(apache.status) as value |
| bug_tran_with | tag:\"t_with\" \| transaction json.sid with states a, b, c in json.module results by flow |
| tran_with_stats_fromstate_tostate | tag:\"t_with\" \| transaction json.sid with states a, b, c in json.module results by flow \| stats count() by fromstate, tostate |
| bug_count_ip_sort | tag:\"sample04061424\" \| stats count(apache.status) as status by apache.clientip \| sort by +status |
| bug_formatdate_Asia | tag:\"sample04061424_apachesample_dawn\" \| eval new_time = 1552237948000 \| eval f_timestamp = formatdate(new_time, \"yyyy-MM-dd HH:mm:ss.SSS\", \"Asia/Shanghai\") \| table f_timestamp,new_time |
| bug_now_where_count_app | starttime=\"now/d\" endtime=\"now\" tag:\"sample04061424_apachesample_dawn\" \| bucket timestamp span=10m as ts\|stats count(appname) as count_app by ts \| eval time=formatdate(ts,\"HH:mm:ss\")\| where count_app>0 |
| where_now_time_dis_l0 | starttime=\"now/d\" endtime=\"now\" tag:\"sample04061424_apachesample_dawn\" \| bucket timestamp span=10m as ts\|stats count(appname) as count_app by ts\| eval time_dis=formatdate(now()-ts, \"HH:mm:ss\") \| where time_dis>0 |
| bug_schedul_count1 | index=schedule schedule_name:xxtest AND count_1:* |
| bug_schedul_count2 | index=schedule schedule_name:xxtest AND apache.status:>200 \| stats count() by apache.status |
| bug_nodata_count_dc | tag:no \| stats count() as cnt by apache.status \| stats dc(cnt) |
| bug_count_eval_chinese | tag:\"sample04061424\" \| stats count() as cnt \| eval ttt = cnt + \"  试试中文下载内容，⚠️\" |
| bug_tran_bucket_stats | index=* tag:\"sample04061424\" \| transaction apache.status maxevents=10 \| bucket apache.status span=100 as ts \| stats avg(apache.status) as base_len, count() as base_count, es(apache.status) by ts |
| geostats_sample_count | tag:vendors_461 \| geostats latfield=vendors.VendorLatitude longfield=vendors.VendorLongitude count() as cnt |
| geostats_outputlatfield_outputlongfield_count | tag:vendors_461 \| geostats outputlatfield=res_latfield outputlongfield=res_longfield latfield=vendors.VendorLatitude longfield=vendors.VendorLongitude count() as cnt |
| geostats_binspanlat_binspanlong_count | tag:vendors_461 \| geostats binspanlat=22.5 binspanlong=45.0 latfield=vendors.VendorLatitude longfield=vendors.VendorLongitude count() as cnt |
| geostats_maxzoomlevel_count_sample | tag:vendors_461 AND vendors.VendorCountry:China\ \(PRC\) \| geostats latfield=vendors.VendorLatitude longfield=vendors.VendorLongitude maxzoomlevel=1 count(vendors.Weight) |
| geostats_maxzoomlevel_count | tag:vendors_461 AND vendors.VendorCountry:China\ \(PRC\) \| geostats latfield=vendors.VendorLatitude longfield=vendors.VendorLongitude maxzoomlevel=3 count(vendors.Weight) |
| geostats_china_maxzoomlevel_count_by_province | tag:vendors_461 AND vendors.VendorCountry:China\ \(PRC\) \| geostats latfield=vendors.VendorLatitude longfield=vendors.VendorLongitude maxzoomlevel=3 count(vendors.Weight) by vendors.VendorStateProvince |
| geostats_maxzoomlevel_count_by_province | tag:vendors_461 \| geostats latfield=vendors.VendorLatitude longfield=vendors.VendorLongitude maxzoomlevel=3 count(vendors.Weight) by vendors.VendorStateProvince |
| geostats_china_maxzoomlevel_sum_by_province | tag:vendors_461 AND vendors.VendorCountry:China\ \(PRC\) \| geostats latfield=vendors.VendorLatitude longfield=vendors.VendorLongitude maxzoomlevel=3 sum(vendors.Weight)  by vendors.VendorStateProvince |
| geostats_maxzoomlevel_sum_by_province | tag:vendors_461 \| geostats latfield=vendors.VendorLatitude longfield=vendors.VendorLongitude maxzoomlevel=3 sum(vendors.Weight)  by vendors.VendorStateProvince |
| list_sample | tag:sample04061424 \| stats list(apache.resp_len,10) as ret_list1 |
| list_ua_default | tag:sample04061424 AND 'apache.clientip':23.166.125.53 \| stats list(apache.ua) |
| list_clientip_default | tag:sample04061424 AND 'apache.clientip':23.166.125.53 \| stats list(apache.clientip) |
| list_n_ua_by_status | tag:sample04061424 \| stats list(apache.ua,10) by apache.status |
| list_clientip_mvcount | tag:sample04061424 \| table apache.clientip \| stats list(apache.clientip, 30) as res_list \| eval count_res_list=mvcount(res_list) |
| list_n_tag_in_alllogs | tag:sample04061424* \| stats list(tag,10) |
| list_n_appname_in_alllogs | tag:sample04061424* \| stats list(appname,10) |
| list_n_clientip_in_alllogs | tag:sample04061424* \| stats list(apache.clientip,10) |
| values_sample | tag:sample04061424 \| stats values(apache.clientip, 10) |
| values_all_ua | tag:sample04061424 AND 'apache.clientip':23.166.125.53 \| stats values(apache.ua) |
| values_all_clientip | tag:sample04061424 AND 'apache.clientip':23.166.125.53 \| stats values(apache.clientip) |
| values_n_clientip | tag:sample04061424 \| stats values(apache.clientip, 10) |
| values_n_clientip_by_status | tag:sample04061424 \| stats values(apache.clientip, 10) by apache.status |
| values_n_ua | tag:sample04061424 \| stats values(apache.ua,10) |
| values_resp_len_mvcount | tag:sample04061424 \| stats values(apache.resp_len) as res_list \| eval count_res_list=mvcount(res_list) |
| values_all_clientips_mvcount | tag:sample04061424 \| stats values(apache.clientip, 100) as res_list \| eval count_res_list=mvcount(res_list) |
| values_n_tag_in_alllogs | tag:sample04061424* \| stats values(tag,10) |
| values_n_appname_in_alllogs | tag:sample04061424* \| stats values(appname,10) |
| values_n_clientip_in_alllogs | tag:sample04061424* \| stats values(apache.clientip,10) |
| parse_sample_to_table | tag:sample04061424 \| parse \"(?<digital_list>\d+)\" max_match=5 \| table digital_list |
| parse_digital_match_exceed_raw_len | tag:sample04061424 \| parse \"(?<digital_list>\d+)\" max_match=100 \| eval ret_str = \"digital:\" + digital_list  \| table ret_str |
| parse_digital_match_default | tag:sample04061424 \| parse \"(?<digital>\d+)\" \| eval ret_str = \"digital:\" + digital  \| table ret_str |
| parse_request_path_stats_count_by | tag:\"sample04061424\" \| parse field=apache.request_path \"^(?<outer_path>/[^/]*)\" \| stats count(appname) by outer_path |
| parse_first_chinese_char_to_table | tag:sample04061424_chinese_5 \| parse field=raw_message \"(?<first_chinese_char>[\u4e00-\u9fa5])\" \| table first_chinese_char |
| parse_chinese_char_match_exceed_raw_len | tag:sample04061424_chinese_5 \| limit 1 \| parse field=raw_message \"(?<first_chinese_char>[\u4e00-\u9fa5])\" max_match=100 \| table first_chinese_char |
| parse_request_path_table | tag:sample04061424  \| parse field=apache.request_path \"(?<digital>[a-zA-Z0-9][-a-zA-Z0-9]{0,62}(/.[a-zA-Z0-9][-a-zA-Z0-9]{0,62})+/.?)\" \| table apache.request_path, digital |
| makeresults_sample | \| makeresults count = 1 \| eval tag = \"sample04061424\" \| map \"starttime=\"now/d\" endtime=\"now/d+24h\" tag:$tag$ \| table apache.status, apache.resp_len,apache.clientip \| sort by apache.status, apache.resp_len,apache.clientip\" |
| rename_sample | starttime=\"now/d\" endtime=\"now/d+24h\" tag:\"sample04061424\" \| rename apache.resp_len as resp_len, apache.status as status, apache.clientip as clientip \| table resp_len, status, clientip \| sort by resp_len, clientip, status |
| rename_apache_fields_sort | starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424 \| rename apache.* as test.* \| fields test.clientip, test.resp_len, test.status, test.x_forward, test.request_query \| sort by test.x_forward, test.clientip |
| rename_apache_table2all_fields2test_sort | starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424 \| rename apache.* as test.* \| table * \| fields test.* \| fields test.clientip, test.resp_len, test.status, test.x_forward, test.request_query \| sort by test.x_forward, test.clientip |
| rename_apache_limit_avg | starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424 \| rename apache.* as * \| limit 5 \| stats avg(resp_len) as avg_len by status |
| rename_apache_avg_bystatusip_sort | starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424 \| rename apache.* as * \| stats avg(resp_len) as avg_len by status, clientip \| sort by avg_len, status, clientip |
| rename_apache_tran2len_sort | starttime=\"now/d\" endtime=\"now/d+24h\" tag:\"sample04061424\" \| rename apache.* as * \| transaction resp_len \| sort by resp_len |
| rename_apache_bucket_span1h_count | starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424 \| rename apache.* as * \| bucket timestamp span=1h as ts \| stats count(clientip) as c_ip by ts |
| rename_multi_apache | tag:sample04061424 \| rename apache.geo.* as *, apache.r* as r*, apache.clientip as clientip \| table r*,clientip \| sort by resp_len, clientip, request_query |
| earliest_timestamp | tag:sample04061424_apachesample_dawn \| stats earliest(timestamp) as earliest_time \| eval f_earliest_time=formatdate(earliest_time) |
| earliest_timestamp_by_ip | tag:sample04061424_apachesample_dawn \| stats earliest(timestamp) as earliest_time by apache.clientip \| eval f_earliest_time=formatdate(earliest_time) |
| latest_timestamp | tag:sample04061424_apachesample_dawn \| stats latest(timestamp) as latest_time \| eval f_latest_time =formatdate(latest_time) |
| latest_timestamp_by_ip | tag:sample04061424_apachesample_dawn \| stats latest(timestamp) as latest_time by apache.clientip \| eval f_latest_time =formatdate(latest_time) |
| first_timestamp | tag:sample04061424_apachesample_dawn \| stats first(timestamp) as first_time \| eval f_first_time =formatdate(first_time) |
| first_timestamp_by_ip | tag:sample04061424_apachesample_dawn \| stats first(timestamp) as first_time by apache.clientip \| eval f_first_time =formatdate(first_time) |
| last_timestamp | tag:sample04061424_apachesample_dawn \| stats last(timestamp) as last_time \| eval f_last_time =formatdate(last_time) |
| last_timestamp_by_ip | tag:sample04061424_apachesample_dawn \| stats last(timestamp) as last_time by apache.clientip \| eval f_last_time=formatdate(last_time) |
| first_bucket_count_ip | tag:sample04061424_apachesample_dawn \| bucket timestamp span=1h as ts \| stats count(apache.clientip) as c_ip by ts \| stats first(c_ip) |
| earliest_bucket_count_ip | tag:sample04061424_apachesample_dawn \| bucket timestamp span=1h as ts \| stats count(apache.clientip) as c_ip by ts \| stats earliest(c_ip) |
| first_top_resp_len | tag:\"sample04061424\" \| top 50 apache.resp_len by apache.status \| stats first(apache.resp_len) |
| last_sort_resp_len | tag:\"sample04061424\" AND apache.resp_len:* \| sort by +apache.status,+apache.resp_len \| table apache.status, apache.resp_len \| stats last(apache.resp_len) |
| first_limit_fields | tag:\"sample04061424\"\| limit 10 \| fields apache.resp_len \| stats first(apache.resp_len) |
| last_count_field | tag:\"sample04061424\" \| stats count() as count_res by appname,apache.clientip \| fields apache.clientip, count_res  \| stats last(apache.clientip) |
| first_sub_inner_ip | [[ tag:\"sample04061424\"\| stats count(apache.clientip) by apache.clientip, apache.method \| limit 2 \| fields apache.clientip apache.method ]] |
| first_split | tag:\"sample04061424\" \| eval m_ips=split(apache.clientip, \".\") \| eval m_paths=split(apache.request_path, \"/\") \| table m_ips \| stats first(m_ips) |
| last_name_mvappend | tag:\"sample04061424\" \| eval fullName=mvappend(apache.clientip, \"middle value\", apache.method) \| table apache.clientip, apache.method,fullName \| stats last(fullName) |
| last_split_ip_mvsort | tag:\"sample04061424\" \| eval m_ips=split(apache.clientip, \".\") \| eval r_mvsort=mvsort(m_ips) \| table r_mvsort \| stats last(r_mvsort) |
| first_sub_mvzip | tag:\"sample04061424\" \| eval m_ips=split(apache.clientip, \".\") \| eval m_paths=split(apache.request_path, \"/\") \| eval r_zips = mvzip(m_ips,m_paths) \| eval zips_count = mvcount(r_zips) \| table m_ips, m_paths, r_zips, zips_count \| limit 1 \| stats first(r_zips) |
| first_mvrange_base | tag:\"sample04061424\" \| eval base=mvrange(1,6) \| table base \| stats first(base) |
| first_sub_resp_len | tag:\"sample04061424\" \|  map \" tag:\"sample04061424\" \| stats first(apache.resp_len) \" |
| gf_dapper_tracing | tag:gf_dapper* AND dapper.msg.traceId:\"511f8756ce1d0b8a\" dapper.msg.duration:>0 \| table dapper.msg.id, dapper.msg.parentId, dapper.class, dapper.msg.duration, dapper.msg.timestamp, dapper.msg.binaryAnnotations[].value, collector_recv_timestamp \| sort by dapper.msg.id |
| spl_eval_add | tag:gf_dapper* AND tag:gf_dapper_mould_3 \| eval aa=mvszip(mvszip(dapper.msg.annotations[].endpoint.serviceName,dapper.msg.annotations[].timestamp),dapper.msg.annotations[].value)\|mvexpand aa\|parse field=aa \"(?<aname>[^,]*),(?<atime>[^,]*),(?<avalue>\S+)\"\|sort by +atime \| table atime,dapper.msg.name,dapper.msg.traceId,dapper.msg.parentId,dapper.msg.id,dapper.msg.duration,aname,avalue,dapper.msg.binaryAnnotations[].endpoint.serviceName,dapper.msg.binaryAnnotations[].key,dapper.msg.binaryAnnotations[].value\|rename dapper.time as time,dapper.mtype as mtype,dapper.msg.name as fundname,dapper.msg.traceId as traceId,dapper.msg.parentId as parentId,dapper.msg.id as id,dapper.msg.duration as duration,dapper.msg.binaryAnnotations[].endpoint.serviceName as daname,dapper.msg.binaryAnnotations[].key as dakey,dapper.msg.binaryAnnotations[].value as davalue\|eval time=formatdate(tolong(substring(tostring(atime),0,13)))\|fields time,fundname,traceId,parentId,id,duration,aname,avalue,daname,dakey,davalue |
| formatdate_2y_4m | \| makeresults count=1 \| eval cur_timestamp = 1570738470000 \| eval ret_time = formatdate(cur_timestamp,\"yy-MMMM-dd HH:mm:ss.SSS ZZ Z z\") \| eval splittime = split(ret_time, \" \") \| eval splittime_name = split(\"日期 时间 RFC时区1 RFC时区2 通用时区\", \" \") \| eval r_display = mvszip(splittime_name,splittime ,\"：\") \| table r_display |

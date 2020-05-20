Feature: SPL other

  Background:
    Given open the "splSearch.SearchPage" page for uri "/search/"
    And I wait for element "SearchStatus" change text to "搜索完成!"

  @v33other1
  Scenario Outline: SPL_其它
    Given I set the parameter "SearchInput" with value "<splQuery>"
    #And I wait for "1000" millsecond
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    Then take a screenshot with name "<splcasename>"

    Examples:
      |splcasename| splQuery|
      | mv_split_sample | tag:\"sample04061424\" \| eval m_ips=split(apache.clientip, \".\") \| eval m_paths=split(apache.request_path, \"/\") \| table m_ips, m_paths |
      | mv_where_split | tag:\"sample04061424\" \| where !empty(apache.request_query) \| eval m_querys = split(apache.request_query, \"=\") \| table m_querys,apache.request_query |
      | mvcount | tag:\"sample04061424\" \| eval m_ips=split(apache.clientip, \".\") \| eval m_paths=split(apache.request_path, \"/\") \| eval m_ips_count = mvcount(m_ips) \| eval m_paths_count = mvcount(m_paths)  \| table m_ips, m_paths,m_ips_count, m_paths_count |
      | mvappend_sample | tag:\"sample04061424\" \| eval fullName=mvappend(apache.clientip, \"middle value\", apache.method) \| table apache.clientip, apache.method,fullName |
      | mvappend | tag:\"sample04061424\" \| eval m_ips=split(apache.clientip, \".\") \| eval m_paths=split(apache.request_path, \"/\") \| eval m_ips_count = mvcount(m_ips) \| eval m_paths_count = mvcount(m_paths)  \| eval r_count_append=mvappend('m_ips_count', 'm_paths_count') \| table m_ips_count, m_paths_count, r_count_append |
      | mvdedup | tag:\"sample04061424\" AND apache.referer_domain:m5.baidu.com \| eval m_referers=split(apache.referer, \"%\") \| eval r_dup = mvdedup(m_referers) \| table m_referers, r_dup |
      | mvfind_sample | tag:\"sample04061424\" AND apache.referer_domain:m5.baidu.com  \| eval m_referers=split(apache.referer, \"%\") \| eval m_referers_find=mvfind(m_referers, \"E4\") \| table m_referers, m_referers_find |
      | mvfind_from0 | tag:\"sample04061424\" AND apache.referer_domain:m5.baidu.com  \| eval m_referers=split(apache.referer, \"%\") \| eval m_referers_find=mvfind(m_referers, \"http://m5.baidu.com/s?from=124n&word=\") \| table m_referers, m_referers_find |
      | mvfind_from1 | tag:\"sample04061424\" AND apache.referer_domain:m5.baidu.com  \| eval m_referers=split(apache.referer, \"%\") \| eval m_referers_find=mvfind(m_referers, \"http://m5.baidu.com/s?from=124n&word=ii\") \| table m_referers, m_referers_find |
      | mvindex_sample | tag:\"sample04061424\" AND apache.referer_domain:m5.baidu.com  \| eval m_referers=split(apache.referer, \"%\") \| eval m_referers_index= mvindex(m_referers, 0) \| table m_referers, m_referers_index |
      | mvindex_sample_1_4 | tag:\"sample04061424\" AND apache.referer_domain:m5.baidu.com  \| eval m_referers=split(apache.referer, \"%\") \| eval m_referers_index= mvindex(m_referers, 1,4) \| table m_referers, m_referers_index |
      | mvjoin_sample | tag:\"sample04061424\" \| eval m_ips=split(apache.clientip, \".\") \| eval m_ips_join = mvjoin(m_ips, \", \") \| table m_ips,m_ips_join |
      | mv_msort_sample | tag:\"sample04061424\" \| eval m_ips=split(apache.referer_domain, \".\") \| eval r_mvsort= mvsort(m_ips) \| table m_ips, r_mvsort \| sort by +apache.x_forward |
      | mv_msort_int | tag:\"sample04061424\" \| eval m_ips=split(apache.clientip, \".\") \| eval r_mvsort= mvsort(m_ips) \| table m_ips, r_mvsort \| sort by +apache.x_forward |
      | mvzip_sample | tag:\"sample04061424\" \| eval m_ips=split(apache.clientip, \".\") \| eval m_paths=split(apache.request_path, \"/\") \| eval r_zips = mvzip(m_ips,m_paths) \| eval zips_count = mvcount(r_zips) \| table m_ips, m_paths, r_zips, zips_count |
      | mvzip_sample1 | tag:\"sample04061424\" \| eval m_ips=split(apache.clientip, \".\") \| eval m_paths=split(apache.request_path, \"/\") \| eval r_zips = mvzip(m_ips,m_paths) \| eval zips_count = mvcount(r_zips) \| eval zips_idx=mvindex(r_zips,2) \| table m_ips, m_paths, r_zips, zips_count,zips_idx |
      | mvfilter_sample | tag:\"sample04061424\" AND apache.referer_domain:m5.baidu.com \| eval m_referers=split(apache.referer, \"%\") \| eval m_referers_filter = mvfilter(m_referers, _x == \"E4\") \| table apache.referer, m_referers, m_referers_filter |
      | mvfilter_sample1 | tag:\"sample04061424\" AND apache.referer_domain:m5.baidu.com \| eval m_referers=split(apache.referer, \"%\") \| eval m_referers_filter = mvfilter(m_referers, _x == \"E4erqe\") \| table apache.referer, m_referers, m_referers_filter |
      | mvrange_sample | tag:\"sample04061424\" \| eval base=mvrange(1,6) \| table base |
      | mv_mvrange_step_add2 | tag:\"sample04061424\" \| eval base=mvrange(1,6,2) \| table base |
      | mvrange_step_minus | tag:\"sample04061424\" \| eval base=mvrange(10,2,-3) \| table base |
      | map_sample1 | tag:\"sample04061424\" \| table hostname, apache.status \| limit 1 \| map \"tag:\"sample04061424\" hostname:$hostname$ apache.status:>$apache.status$ \" |
      | map_sample2 | tag:\"sample04061424\" \| table hostname, apache.status \| limit 1 \| map \"tag:\"sample04061424\" hostname:$hostname$ apache.status:>$apache.status$ *\" |
      | map_sample5 | tag:\"sample04061424\" \| stats count() as cnt by apache.clientip \| limit 7 \| rename apache.clientip as clientip \| sort by cnt, clientip  \| map \"apache.clientip:$clientip$ \| stats max(apache.resp_len) as max_len \" |
      | map_stats_two_fields_rename_clientip | tag: sample04061424 \| stats count() by apache.clientip, apache.resp_len \| fields apache.clientip, apache.resp_len \| rename apache.clientip as src_ip \| map \"raw_message:$src_ip$\" \| fields hostname, appname, raw_message |
      | map_sample_maxsearches | tag:\"sample04061424\" \| stats count() by apache.clientip \| limit 5 \| rename apache.clientip as clientip \| map\"apache.clientip:$clientip$ \| stats max(apache.resp_len)\" maxsearches=3 |
      | map_fields | index=* tag:\"sample04061424\" \| table hostname, apache.status \| limit 1 \| map \"tag:\"sample04061424\" hostname:$hostname$ apache.status:>$apache.status$ *\" \| fields apache.resp_len, apache.status, timestamp |
      | map_sample3 | tag:\"sample04061424\" \| stats max(timestamp) as max_time \| eval start=max_time-5*3600000 \| eval start_f = formatdate(tolong(start), \"yyyy-MM-dd:HH:mm:ss\") \| eval end_f = formatdate(tolong(max_time+3600000), \"yyyy-MM-dd:HH:mm:ss\")  \|  map \" starttime=$start_f$ endtime=$end_f$ tag:\"sample04061424\"  AND /0{2,2}/ \" \| table apache.resp_len, apache.status |
      | map_sample4 | tag:\"sample04061424\" \| stats max(timestamp) as max_time \| eval start=max_time \| eval start_f = formatdate(tolong(start-5*360000), \"yyyy-MM-dd:HH:mm:ss\")  \| eval end_f = formatdate(tolong(max_time+360000), \"yyyy-MM-dd:HH:mm:ss\")  \|  map \" starttime=$start_f$ endtime=$end_f$ tag:\"sample04061424\"  AND \"android\" \" |
      | map_sample_table | tag:\"sample04061424_chart\" \| stats max(timestamp) as max_time, min(timestamp) as min_time \| eval start_f = formatdate(tolong(min_time-1000*3), \"yyyy-MM-dd:HH:mm:ss\")  \| eval end_f = formatdate(tolong(max_time+90000), \"yyyy-MM-dd:HH:mm:ss\") \| map \" starttime=$start_f$ endtime=$end_f$ tag:\"sample04061424_chart\"  \" \| table start_f, end_f, tag, apache.clientip, apache.resp_len, apache.x_forward \| sort by apache.x_forward, apache.clientip |
      | map_stats | tag:\"sample04061424\"  \| table hostname, apache.status \| limit 1  \| map \"tag:\"sample04061424\" hostname:$hostname$ apache.status:>$apache.status$ \| stats count()\" |
      | map_rename_status | tag:\"sample04061424\" \| table apache.status, apache.method \| limit 1 \| rename apache.status as status \| map \"apache.status:$status$ apache.method:$apache.method$ tag:sample04061424 \| stats count() \" |
      | map_rename_opt_stats | tag:\"sample04061424\" \| table apache.status, apache.method \| limit 1 \| rename apache.status as status\| eval opt_name=\"stats\" \| map \"apache.status:$status$ apache.method:$apache.method$ tag:sample04061424 \| $opt_name$ count() \" |
      | map_status_sort | tag:\"sample04061424\" \| table apache.clientip, apache.status \| limit 1 \| map \" tag:sample04061424 apache.clientip:<>$apache.clientip$ apache.status:>$apache.status$ \| table apache.status, apache.clientip \| sort by -apache.status, apache.clientip\" |
      | map_status_sort1 | tag:\"sample04061424\" \| table apache.clientip, apache.status \| limit 1 \| map \" tag:sample04061424 apache.clientip:>$apache.clientip$ apache.status:>$apache.status$ \| table apache.status, apache.clientip \| sort by -apache.status, apache.clientip\" |
      | map_starttime_all | tag:\"sample04061424_chart\" \| stats max(timestamp) as max_time, min(timestamp) as min_time \| eval start_f = formatdate(tolong(min_time-30*1000), \"yyyy-MM-dd:HH:mm:ss\")  \| eval end_f = formatdate(tolong(max_time+360000), \"yyyy-MM-dd:HH:mm:ss\") \| map \" starttime=$start_f$ endtime=$end_f$ tag:sample04061424_chart OR tag:sample04061424_display OR tag:sample04061424_dawn\" \| table tag, apache.clientip, apache.resp_len \| sort by apache.resp_len, apache.clientip |
      | map_index_param | index=* tag:\"sample04061424_chart\" \| stats min(timestamp) as min_time, max(timestamp) as max_time \| eval start=min_time - 30*1000 \| eval start_f = formatdate(tolong(start), \"yyyy-MM-dd:HH:mm:ss\") \| eval end_f = formatdate(tolong(max_time+60000), \"yyyy-MM-dd:HH:mm:ss\") \| eval index_name=\"index\" \| map \" $index_name$=* starttime=$start_f$ endtime=$end_f$ tag:sample04061424* \" \| fields tag, apache.resp_len, apache.clientip, apache.x_forward, apache.request_query, apache.referer, timestamp \| sort by timestamp, apache.x_forward |
      | map_opt_count | tag:\"sample04061424\" \| eval txt=\"count\" \| limit 1 \| table txt \| map \" tag:\"sample04061424\" \| stats $txt$(timestamp) \" |
      | map_makeresults | \| makeresults count=1 \| eval app_name=\"appname\" \| map \" tag:sample04061424* \| stats count() as cnt by $app_name$ \| sort by cnt, -$app_name$\" |
      | mvexpand_sample | tag:json_jpath0 \| mvexpand json.a \| table json.a |
      | mvexpand_limit | tag:json_jpath0 \| mvexpand json.a \| limit 2 \| table json.a |
      | mvcombine_sample | tag:sample04061424* apache.clientip:* \| table tag, appname, apache.clientip \| limit 10 \| mvcombine apache.clientip |
      | mvcombine_sample2 | tag:\"sample04061424\" \| table appname, hostname, apache.method \| limit 100 \| mvcombine apache.method |
      | mvcombine_sample3 | index=* tag:\"sample04061424_chart\" \| table appname, hostname, apache.clientip, apache.method \| limit 72 \| mvcombine apache.method |
      | mvcombine_rename_stats_combine_resplenip | index=* tag:\"sample04061424\" \| rename apache.resp_len as ret_resp_len \| stats count() as cnt by apache.clientip, ret_resp_len \| sort by cnt \| mvcombine sep=\" \" ret_resp_len \| mvcombine sep=\",\" apache.clientip |
      | mv_jpath_sample | tag:json_jpath0 \| jpath output=x path=\"a[*][2]\" \| stats sum(x) |
      | mv_jpath_mvzip | tag:json_jpath_mv_where \| jpath output=city path=\"a[*].city\" \| jpath output=status path=\"a[*].status\" \| eval x=mvzip(city,status) \| table x |
      | mv_jpath_mvzip_string | tag:jpath_mvzip_1 \| jpath output=city path=\"a[*].city\" \| jpath output=street path=\"a[*].street\" \| eval ret_mvzip=mvzip(city, street) \| table ret_mvzip |
      | mv_mvszip_traceip_mvexpand_parse | tag:traceip_list_3 \| eval kvpair=mvszip(json.traceip, json.cost) \| mvexpand kvpair \| parse field=kvpair \"(?<traceip>\d+\.\d+\.\d+\.\d+),(?<cost>\d+(?:\.\d+)?)\" \| table traceip, cost \| sort by traceip, cost |
      | mv_mvszip_traceip_sample | tag:traceip_list_3 \| eval kvpair=mvszip(json.traceip, json.cost,\"zzz\") \| table kvpair \| sort by kvpair |
      | mv_jpath_mvexpand_where | tag:json_jpath_mv_where \| jpath output=city path=\"a[*].city\" \| jpath output=status path=\"a[*].status\" \| eval x=mvszip(city,status) \| mvexpand x \| parse field=x \"(?<ccc>\w+),(?<ddd>\d+)\"  \| where ccc==\"beijing\" \| stats count() by ddd |
      | makeresults_sample | \| makeresults count = 1 \| eval tag = \"sample04061424\" \| map \"starttime=\"now/d\" endtime=\"now/d+24h\" tag:$tag$ \| table apache.status, apache.resp_len,apache.clientip \| sort by apache.status, apache.resp_len,apache.clientip\" |
      | search_all | starttime=\"now/d\" endtime=\"now/d+24h\" * |
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
      | eval_case_tran | tag:sample04061424_display OR tag:sample04061424_chart \| eval status_com = case(tag==\"sample04061424_display\", apache.status, tag==\"sample04061424_chart\", apache.status) \| transaction status_com maxevents=100 |
      | rename_apache_tran2len_sort | starttime=\"now/d\" endtime=\"now/d+24h\" tag:\"sample04061424\" \| rename apache.* as new.* \| transaction new.resp_len \| sort by new.resp_len |
      | fields_result_seq | tag:\"sample04061424\" \| fields appname, tag, apache.clientip, apache.geo.country, apache.request_path, apache.status, apache.resp_len, apache.method, apache.x_forward \| sort by  apache.x_forward |
      | rename_apache_fields_sort | starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424 \| rename apache.* as test.* \| fields test.clientip, test.resp_len, test.status, test.x_forward, test.request_query \| sort by test.x_forward, test.clientip |
      | rename_apache_table2all_fields2test_sort | starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424 \| rename apache.* as test.* \| table * \| fields test.* \| fields test.clientip, test.resp_len, test.status, test.x_forward, test.request_query \| sort by test.x_forward, test.clientip |
      | rename_multi_fields_apache_plus | tag:sample04061424 \| rename apache.geo.* as *, apache.r* as r*, apache.clientip as clientip \| table r*,clientip \| sort by resp_len, clientip, request_query |
      | parse_digital_max_match100 | tag:sample04061424 AND  apache.x_forward:1\| parse \"(?<digital_list>\d+)\" max_match=100 \|  table digital_list, apache.x_forward |
      | parse_chinese_char_maxmatch100_exceed_rawlen | tag:sample04061424_chinese_5 \| limit 1 \| parse field=raw_message \"(?<first_chinese_char>[\u4e00-\u9fa5])\" max_match=100 \| table first_chinese_char |
      | eval_match_query | tag:\"sample04061424\" AND apache.request_query:* \| eval r_match1 = match(apache.request_query, \"b.*e\") \| eval r_match2 = match(apache.request_query, \"^bcd\") \| table apache.request_query, r_match1, r_match2, apache.x_forward \| sort by  apache.x_forward |
      | parse_to_table | tag:sample04061424 \| parse \"(?<digital_list>\d+)\" max_match=5 \| table digital_list, apache.x_forward \| sort by  apache.x_forward |
      | rename_apache_bucket_span1h_count_formatdate | starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424_display \| rename apache.c* as * \| bucket timestamp span=1h as ts \| stats count(lientip) as c_ip by ts \| eval f_timestamp = formatdate(ts,\"HH\") \| eval aa=tolong(f_timestamp) |
      | spl_eval_add | tag:sample04061424 \| eval status = apache.status \| eval resp_len =  apache.resp_len \| eval status_add0=apache.status+0 \| eval len_add0=resp_len+0 |
      | spl_rangeline_outlier_is_0 | tag:sample04061424_display \| bucket timestamp span=3h as ts\| stats count(appname) as count_ by ts\| movingavg count_,5 as ma\| rollingstd count_,5 as rs \| eval lower=ma-3*rs \| eval upper=ma+3*rs\| eval outlier=if(count_>upper\|\|count_<lower, count_, 0) |
      | spl_rangeline_outlier_not_all_0 | tag:sample04061424_display \| bucket timestamp span=3h as ts\| stats count(appname) as count_ by ts\| movingavg count_,5 as ma\| rollingstd count_,5 as rs\| eval lower=ma-1*rs\| eval upper=ma+1*rs\| eval outlier=if(count_>upper\|\|count_<lower, count_, 0) |
      | search_four_divide_five_makersult | \| makeresults count = 10 \| eval a=4/5 \| table a |
      | eval_4divide5_event | tag:sample04061424  \| eval a=4/5 \| table a |
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


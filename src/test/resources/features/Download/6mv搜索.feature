@oldalldownload
Feature: MV下载

  Background:
    Given open the "splSearch.SearchPage" page for uri "/search/"
    And I wait for element "SearchStatus" change text to "搜索完成!"

  @dlmv
  Scenario Outline: 执行
    And I wait for "2000" millsecond
    And I wait for loading complete
    And I wait for "DownloadTipsText" will be invisible
    Given I set the parameter "SearchInput" with value "<splQuery>"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
#    And I wait for "2000" millsecond
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I wait for loading complete
    And I wait for "DownloadTipsText" will be invisible
    And I wait for "2000" millsecond

    And I wait for "downloadButton" will be visible
    Then I click the "downloadButton" button
    Then I set the parameter "DownloadName" with value "<name>"
    Then I set the parameter "MaxLineNum" with value "100"
#    Then I choose the "<unit>" from the "MaxLineDropdown"
    Then I choose the "CSV" from the "DocumentTypeList"
    Then I choose the "UTF" from the "DocumentEncodeList"
    Then I click the "CreateDownloadTask" button
    And I wait for "2000" millsecond
    Then I will see the success message "提交成功，请到设置-下载管理页查看下载状态！"

    #下载到本地
    Given open the "splSearch.OfflineTaskPage" page for uri "/download/#"
    When I set the parameter "DbListPageSearchInput" with value "<name>.csv"
    And I wait for "1000" millsecond
    Given the data name is "<name>.csv" then i click the "下载" button
#    And I wait for "1000" millsecond
#    Then I compare source download file "expect/<name>.json" with target download files "<name>.json"

    Examples: 新建成功
      | name                                         | splQuery                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      |
      #      | map_index_param | index=* tag:\"sample04061424_chart\" \| stats min(timestamp) as min_time, max(timestamp) as max_time \| eval start=min_time - 30*1000 \| eval start_f = formatdate(tolong(start), \"yyyy-MM-dd:HH:mm:ss\") \| eval end_f = formatdate(tolong(max_time+60000), \"yyyy-MM-dd:HH:mm:ss\") \| eval index_name=\"index\" \| map \" $index_name$=* starttime=$start_f$ endtime=$end_f$ tag:sample04061424* \" \| fields tag, apache.resp_len, apache.clientip, apache.x_forward, apache.request_query, apache.referer, timestamp \| sort by timestamp, apache.x_forward |
      | rename_multi_fields_apache_plus | tag:sample04061424 \| rename apache.geo.* as *, apache.r* as r*, apache.clientip as clientip \| table r*,clientip \| sort by resp_len, clientip, request_query |
      | parse_digital_max_match100 | tag:sample04061424 AND  apache.x_forward:1\| parse \"(?<digital_list>\d+)\" max_match=100 \|  table digital_list, apache.x_forward |
#      | parse_chinese_char_maxmatch100_exceed_rawlen | tag:sample04061424_chinese_5 \| limit 1 \| parse field=raw_message \"(?<first_chinese_char>[\u4e00-\u9fa5])\" max_match=100 \| table first_chinese_char |
#      | parse_to_table | tag:sample04061424 \| parse \"(?<digital_list>\d+)\" max_match=5 \| table digital_list, apache.x_forward \| sort by  apache.x_forward |
      | rename_apache_bucket_span1h_count_formatdate | starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424_display \| rename apache.c* as * \| bucket timestamp span=1h as ts \| stats count(lientip) as c_ip by ts \| eval f_timestamp = formatdate(ts,\"HH\") \| eval aa=tolong(f_timestamp) |
      | spl_rangeline_outlier_is_0 | tag:sample04061424_display \| bucket timestamp span=3h as ts\| stats count(appname) as count_ by ts\| movingavg count_,5 as ma\| rollingstd count_,5 as rs \| eval lower=ma-3*rs \| eval upper=ma+3*rs\| eval outlier=if(count_>upper\|\|count_<lower, count_, 0) |
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
#      | mv_split_sample | tag:\"sample04061424\" \| eval m_ips=split(apache.clientip, \".\") \| eval m_paths=split(apache.request_path, \"/\") \| table m_ips, m_paths |
#      | mvcount | tag:\"sample04061424\" \| eval m_ips=split(apache.clientip, \".\") \| eval m_paths=split(apache.request_path, \"/\") \| eval m_ips_count = mvcount(m_ips) \| eval m_paths_count = mvcount(m_paths)  \| table m_ips, m_paths,m_ips_count, m_paths_count |
      | mvappend_sample | tag:\"sample04061424\" \| eval fullName=mvappend(apache.clientip, \"middle value\", apache.method) \| table apache.clientip, apache.method,fullName |
#      | mvappend | tag:\"sample04061424\" \| eval m_ips=split(apache.clientip, \".\") \| eval m_paths=split(apache.request_path, \"/\") \| eval m_ips_count = mvcount(m_ips) \| eval m_paths_count = mvcount(m_paths)  \| eval r_count_append=mvappend('m_ips_count', 'm_paths_count') \| table m_ips_count, m_paths_count, r_count_append |
      | mvfind_sample | tag:\"sample04061424\" AND apache.referer_domain:m5.baidu.com  \| eval m_referers=split(apache.referer, \"%\") \| eval m_referers_find=mvfind(m_referers, \"E4\") \| table m_referers, m_referers_find |
#      | mvfind_from1 | tag:\"sample04061424\" AND apache.referer_domain:m5.baidu.com  \| eval m_referers=split(apache.referer, \"%\") \| eval m_referers_find=mvfind(m_referers, \"http://m5.baidu.com/s?from=124n&word=ii\") \| table m_referers, m_referers_find |
      | mvindex_sample | tag:\"sample04061424\" AND apache.referer_domain:m5.baidu.com  \| eval m_referers=split(apache.referer, \"%\") \| eval m_referers_index= mvindex(m_referers, 0) \| table m_referers, m_referers_index |
#      | mvindex_sample_1_4 | tag:\"sample04061424\" AND apache.referer_domain:m5.baidu.com  \| eval m_referers=split(apache.referer, \"%\") \| eval m_referers_index= mvindex(m_referers, 1,4) \| table m_referers, m_referers_index |
      | mv_msort_sample | tag:\"sample04061424\" \| eval m_ips=split(apache.referer_domain, \".\") \| eval r_mvsort= mvsort(m_ips) \| table m_ips, r_mvsort \| sort by +apache.x_forward |
#      | mv_msort_int | tag:\"sample04061424\" \| eval m_ips=split(apache.clientip, \".\") \| eval r_mvsort= mvsort(m_ips) \| table m_ips, r_mvsort \| sort by +apache.x_forward |
      | mvzip_sample | tag:\"sample04061424\" \| eval m_ips=split(apache.clientip, \".\") \| eval m_paths=split(apache.request_path, \"/\") \| eval r_zips = mvzip(m_ips,m_paths) \| eval zips_count = mvcount(r_zips) \| table m_ips, m_paths, r_zips, zips_count |
#      | mvzip_sample1 | tag:\"sample04061424\" \| eval m_ips=split(apache.clientip, \".\") \| eval m_paths=split(apache.request_path, \"/\") \| eval r_zips = mvzip(m_ips,m_paths) \| eval zips_count = mvcount(r_zips) \| eval zips_idx=mvindex(r_zips,2) \| table m_ips, m_paths, r_zips, zips_count,zips_idx |
#      | mvfilter_sample1 | tag:\"sample04061424\" AND apache.referer_domain:m5.baidu.com \| eval m_referers=split(apache.referer, \"%\") \| eval m_referers_filter = mvfilter(m_referers, _x == \"E4erqe\") \| table apache.referer, m_referers, m_referers_filter |
      | mvrange_sample | tag:\"sample04061424\" \| eval base=mvrange(1,6) \| table base |
#      | mv_mvrange_step_add2 | tag:\"sample04061424\" \| eval base=mvrange(1,6,2) \| table base |
#      | map_sample1 | tag:\"sample04061424\" \| table hostname, apache.status \| limit 1 \| map \"tag:\"sample04061424\" hostname:$hostname$ apache.status:>$apache.status$ \" |
      | map_sample2 | tag:\"sample04061424\" \| table hostname, apache.status \| limit 1 \| map \"tag:\"sample04061424\" hostname:$hostname$ apache.status:>$apache.status$ *\" |
      | map_sample5 | tag:\"sample04061424\" \| stats count() as cnt by apache.clientip \| limit 7 \| rename apache.clientip as clientip \| sort by cnt, clientip  \| map \"apache.clientip:$clientip$ \| stats max(apache.resp_len) as max_len \" |
#      | map_stats_two_fields_rename_clientip | tag: sample04061424 \| stats count() by apache.clientip, apache.resp_len \| fields apache.clientip, apache.resp_len \| rename apache.clientip as src_ip \| map \"raw_message:$src_ip$\" \| fields hostname, appname, raw_message |
      | map_sample_maxsearches | tag:\"sample04061424\" \| stats count() by apache.clientip \| limit 5 \| rename apache.clientip as clientip \| map\"apache.clientip:$clientip$ \| stats max(apache.resp_len)\" maxsearches=3 |
      | map_fields | index=* tag:\"sample04061424\" \| table hostname, apache.status \| limit 1 \| map \"tag:\"sample04061424\" hostname:$hostname$ apache.status:>$apache.status$ *\" \| fields apache.resp_len, apache.status, timestamp |
      | map_sample3 | tag:\"sample04061424\" \| stats max(timestamp) as max_time \| eval start=max_time-5*3600000 \| eval start_f = formatdate(tolong(start), \"yyyy-MM-dd:HH:mm:ss\") \| eval end_f = formatdate(tolong(max_time+3600000), \"yyyy-MM-dd:HH:mm:ss\")  \|  map \" starttime=$start_f$ endtime=$end_f$ tag:\"sample04061424\"  AND /0{2,2}/ \" \| table apache.resp_len, apache.status |
#      | map_sample4 | tag:\"sample04061424\" \| stats max(timestamp) as max_time \| eval start=max_time \| eval start_f = formatdate(tolong(start-5*360000), \"yyyy-MM-dd:HH:mm:ss\")  \| eval end_f = formatdate(tolong(max_time+360000), \"yyyy-MM-dd:HH:mm:ss\")  \|  map \" starttime=$start_f$ endtime=$end_f$ tag:\"sample04061424\"  AND \"android\" \" |
      | map_sample_table | tag:\"sample04061424_chart\" \| stats max(timestamp) as max_time, min(timestamp) as min_time \| eval start_f = formatdate(tolong(min_time-1000*3), \"yyyy-MM-dd:HH:mm:ss\")  \| eval end_f = formatdate(tolong(max_time+90000), \"yyyy-MM-dd:HH:mm:ss\") \| map \" starttime=$start_f$ endtime=$end_f$ tag:\"sample04061424_chart\"  \" \| table start_f, end_f, tag, apache.clientip, apache.resp_len, apache.x_forward \| sort by apache.x_forward, apache.clientip |
      | map_stats | tag:\"sample04061424\"  \| table hostname, apache.status \| limit 1  \| map \"tag:\"sample04061424\" hostname:$hostname$ apache.status:>$apache.status$ \| stats count()\" |
      | map_rename_status | tag:\"sample04061424\" \| table apache.status, apache.method \| limit 1 \| rename apache.status as status \| map \"apache.status:$status$ apache.method:$apache.method$ tag:sample04061424 \| stats count() \" |
      | map_rename_opt_stats | tag:\"sample04061424\" \| table apache.status, apache.method \| limit 1 \| rename apache.status as status\| eval opt_name=\"stats\" \| map \"apache.status:$status$ apache.method:$apache.method$ tag:sample04061424 \| $opt_name$ count() \" |
      | map_status_sort | tag:\"sample04061424\" \| table apache.clientip, apache.status \| limit 1 \| map \" tag:sample04061424 apache.clientip:<>$apache.clientip$ apache.status:>$apache.status$ \| table apache.status, apache.clientip \| sort by -apache.status, apache.clientip\" |
      | map_status_sort1 | tag:\"sample04061424\" \| table apache.clientip, apache.status \| limit 1 \| map \" tag:sample04061424 apache.clientip:>$apache.clientip$ apache.status:>$apache.status$ \| table apache.status, apache.clientip \| sort by -apache.status, apache.clientip\" |
      | map_starttime_all | tag:\"sample04061424_chart\" \| stats max(timestamp) as max_time, min(timestamp) as min_time \| eval start_f = formatdate(tolong(min_time-30*1000), \"yyyy-MM-dd:HH:mm:ss\")  \| eval end_f = formatdate(tolong(max_time+360000), \"yyyy-MM-dd:HH:mm:ss\") \| map \" starttime=$start_f$ endtime=$end_f$ tag:sample04061424_chart OR tag:sample04061424_display OR tag:sample04061424_dawn\" \| table tag, apache.clientip, apache.resp_len \| sort by apache.resp_len, apache.clientip |
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
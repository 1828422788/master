
Feature: SPL语句_多值指令部分

  Background:
    Given open the "splSearch.SearchPage" page for uri "/search/"

#  @smoke @spl @all
  @v31tcsplmv
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
| mv_msort_sample | tag:\"sample04061424\" \| eval m_ips=split(apache.clientip, \".\") \| eval r_mvsort= mvsort(m_ips) \| table m_ips, r_mvsort |
| mv_msort_int | tag:\"sample04061424\" \| eval m_ips=split(apache.clientip, \".\") \| eval r_mvsort= mvsort(m_ips) \| table m_ips, r_mvsort |
| mvzip_sample | tag:\"sample04061424\" \| eval m_ips=split(apache.clientip, \".\") \| eval m_paths=split(apache.request_path, \"/\") \| eval r_zips = mvzip(m_ips,m_paths) \| eval zips_count = mvcount(r_zips) \| table m_ips, m_paths, r_zips, zips_count |
| mvzip_sample1 | tag:\"sample04061424\" \| eval m_ips=split(apache.clientip, \".\") \| eval m_paths=split(apache.request_path, \"/\") \| eval r_zips = mvzip(m_ips,m_paths) \| eval zips_count = mvcount(r_zips) \| eval zips_idx=mvindex(r_zips,2) \| table m_ips, m_paths, r_zips, zips_count,zips_idx |
| mvfilter_sample | tag:\"sample04061424\" AND apache.referer_domain:m5.baidu.com \| eval m_referers=split(apache.referer, \"%\") \| eval m_referers_filter = mvfilter(m_referers, _x == \"E4\") \| table apache.referer, m_referers, m_referers_filter |
| mvfilter_sample1 | tag:\"sample04061424\" AND apache.referer_domain:m5.baidu.com \| eval m_referers=split(apache.referer, \"%\") \| eval m_referers_filter = mvfilter(m_referers, _x == \"E4erqe\") \| table apache.referer, m_referers, m_referers_filter |
| mvrange_sample | tag:\"sample04061424\" \| eval base=mvrange(1,6) \| table base |
| mvrange_step_add | tag:\"sample04061424\" \| eval base=mvrange(1,6,2) \| table base |
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
| mv_jpath_mvzip | tag:json_jpath_mv_where \| jpath output=city path=\"$.a[*].city\" \| jpath output=status path=\"$.a[*].status\" \| eval x=mvzip(city,status) \| table x |
| mv_jpath_mvzip_string | tag:jpath_mvzip_1 \| jpath output=city path=\"$.a[*].city\" \| jpath output=street path=\"$.a[*].street\" \| eval ret_mvzip=mvzip(city, street) |
| mv_mvszip2traceip_mvexpand_parse | tag:traceip_list_3 \| eval kvpair=mvszip(json.traceip, json.cost) \| mvexpand kvpair \| parse field=kvpair \"(?<traceip>\d+\.\d+\.\d+\.\d+),(?<cost>\d+(?:\.\d+)?)\" \| table traceip, cost \| sort by traceip, cost |
| mv_mvszip2traceip_sample | tag:traceip_list_3 \| eval kvpair=mvszip(json.traceip, json.cost,\"zzz\") \| table kvpair \| sort by kvpair |
| mv_jpath_mvexpand_where | tag:json_jpath_mv_where \| jpath output=city path=\"a[*].city\" \| jpath output=status path=\"a[*].status\" \| eval x=mvszip(city,status) \| mvexpand x \| parse field=x \"(?<ccc>\w+),(?<ddd>\d+)\"  \| where ccc==\"beijing\" \| stats count() by ddd |
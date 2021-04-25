@dltable @dltable1
Feature: download_table下载part1

  Background:
    Given open the "splSearch.SearchPage" page for uri "/search/"
    And I wait for element "SearchStatus" change text to "搜索完成!"

  Scenario Outline: 下载table用例结果
    Given I set the parameter "SearchInput" with value "<splQuery>"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for "5000" millsecond
    And I wait for element "SearchStatus" change text to "搜索完成!"
    Then take a screenshot with name "spldownload/<name>"

    And I wait for "2000" millsecond
    When I wait for "SaveAsOther" will be visible
    And I choose the "下载" from the "SaveAsList"
    And I wait for "1000" millsecond

    And I set the parameter "DownloadName" with value "<name>"
    And I set the parameter "MaxLineNum" with value "<maxLineNum>"
#    Then I choose the "<unit>" from the "MaxLineDropdown"
    And I choose the "CSV" from the "DocumentTypeList"
    And I wait for "2000" millsecond
    And I choose the "UTF-8" from the "DocumentEncodeList"
    And I wait for "2000" millsecond
    When I click the "CreateDownloadTask" button
#    And I wait for "2000" millsecond
#    Then I will see the success message "提交成功，请到设置-下载管理页查看下载状态！"

    #下载到本地
    Given open the "splSearch.OfflineTaskPage" page for uri "/download/#"
    When I set the parameter "DbListPageSearchInput" with value "<name>.csv"
    And I wait for "2000" millsecond
#    Given the data name is "<name>.csv" then i click the "下载" button
    And I click the "ListDownloadButton" button

    Examples: 新建成功
      | maxLineNum | name                                          | splQuery                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              |
    # | 100 | sub_join_left_if_divide | tag:sample04061424 \| stats count(logtype) as count_all by apache.clientip \| sort by count_all \| limit 5 \| join type=left apache.clientip [[logtype:\"apache\" AND apache.status:[400 TO 499]\|stats count(logtype) as count_400 by apache.clientip]]\|join type=left apache.clientip [[logtype:\"apache\" AND apache.status:[500 TO 599]\|stats count(logtype) as count_500 by apache.clientip]]\|join type=left apache.clientip [[logtype:\"apache\" AND apache.resp_len:>1000\|stats count(logtype) as len_1000 by apache.clientip]]\|eval rate_400=if(empty(count_400),0,count_400/count_all)\|eval rate_500=if(empty(count_500),0,count_500/count_all)\|eval rate_len_1000=if(empty(len_1000),0,len_1000/count_all) |
      #需区分验证
      | 100        | eval_addinfo_sample                           | tag:sample04061424 \| sort by apache.x_forward \| limit 5 \| addinfo \| table info*                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   |
      | 100        | eval_4divide5_event                           | tag:sample04061424  \| eval a=4/5 \| table a                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          |
      | 100        | eval_parsedate_formatdate                     | (logtype:apache AND tag:sample04061424_chart) \| eval f_ref_time = \"22:52:22.000\" \| eval mill_ref_time=parsedate(f_ref_time,\"HH:mm:ss.SSS\") \| eval f_cut_timestamp = formatdate(timestamp,\"HH:mm:ss.SSS\") \| eval mill_cut_timestamp=parsedate(f_cut_timestamp,\"HH:mm:ss.SSS\") \| eval mill_diff_time= mill_ref_time - mill_cut_timestamp \| eval f_diff_time = formatdate(mill_diff_time,\"HH:mm:ss:SSS\") \| table f_ref_time, f_cut_timestamp, mill_ref_time, mill_cut_timestamp, mill_diff_time,f_diff_time \| limit 10                                                                                                                                                                 |
      | 100        | time_sequence                                 | tag:sample04061424_apachesample_dawn AND apache.resp_len:* \| eval res_reduce_time = collector_recv_timestamp - agent_send_timestamp \| eval f_timestamp = formatdate(timestamp,\"HH:mm:ss\")  \| table res_reduce_time, f_timestamp, agent_send_timestamp, collector_recv_timestamp \| where agent_send_timestamp<collector_recv_timestamp \|\|  agent_send_timestamp==collector_recv_timestamp                                                                                                                                                                                                                                                                                                      |
      | 100        | rare_sample                                   | starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424 \| rare apache.clientip by apache.status                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 |
      | 100        | rare_resplen_sample                           | starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424 \| rare apache.resp_len by apache.status                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 |
      | 100        | rare_limit10_resplen_sample                   | starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424 \| rare apache.resp_len limit=10 by apache.status                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        |
      | 100        | map_sample1                                   | tag:sample04061424 \| table hostname, apache.status \| limit 1 \| map \"tag:sample04061424 hostname:$hostname$ apache.status:>$apache.status$ \" \| table apache.clientip, apache.geo.latitude, apache.geo.longitude, apache.request_path,apache.resp_len,apache.x_forward                                                                                                                                                                                                                                                                                                                                                                                                                            |
      | 100        | map_sample2                                   | tag:sample04061424 \| table hostname, apache.status \| limit 1 \| map \"tag:sample04061424 hostname:$hostname$ apache.status:>$apache.status$ *\" \| table apache.clientip, apache.request_path, apache.resp_len, apache.x_forward                                                                                                                                                                                                                                                                                                                                                                                                                                                                    |
      | 100        | map_fields                                    | index=* tag:sample04061424 \| table hostname, apache.status \| limit 1 \| map \"tag:sample04061424 hostname:$hostname$ apache.status:>$apache.status$ *\" \| fields apache.resp_len, apache.status, timestamp                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         |
      | 100        | map_sample4                                   | tag:sample04061424 \| stats max(timestamp) as max_time \| eval start=max_time \| eval start_f = formatdate(tolong(start-5*360000), \"yyyy-MM-dd:HH:mm:ss\")  \| eval end_f = formatdate(tolong(max_time+360000), \"yyyy-MM-dd:HH:mm:ss\")  \|  map \" starttime=$start_f$ endtime=$end_f$ tag:sample04061424  AND \"android\" \" \| table apache.clientip, apache.geo.latitude, apache.geo.longitude, apache.request_path,apache.resp_len,apache.x_forward                                                                                                                                                                                                                                            |
      | 100        | map_index_param                               | index=* tag:\"sample04061424_chart\" \| stats min(timestamp) as min_time, max(timestamp) as max_time \| eval start=min_time - 30*1000 \| eval start_f = formatdate(tolong(start), \"yyyy-MM-dd:HH:mm:ss\") \| eval end_f = formatdate(tolong(max_time+60000), \"yyyy-MM-dd:HH:mm:ss\") \| eval index_name=\"index\" \| map \" $index_name$=* starttime=$start_f$ endtime=$end_f$ tag:sample04061424* \" \| fields tag, apache.resp_len, apache.clientip, apache.x_forward, apache.referer, timestamp \| sort by timestamp, apache.x_forward                                                                                                                                                           |
      | 100        | mvcombine_sample2                             | tag:sample04061424 \| table appname, hostname, apache.method \| limit 100 \| mvcombine apache.method                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  |
      | 100        | mvcombine_sample3                             | index=* tag:\"sample04061424_chart\" \| table appname, hostname, apache.clientip, apache.method \| limit 72 \| mvcombine apache.method                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                |
      | 100        | mv_mvszip_traceip_mvexpand_parse              | tag:traceip_list_3 \| eval kvpair=mvszip(json.traceip, json.cost) \| mvexpand kvpair \| parse field=kvpair \"(?<traceip>\d+\.\d+\.\d+\.\d+),(?<cost>\d+(?:\.\d+)?)\" \| table traceip, cost \| sort by traceip, cost                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  |
      | 100        | mv_mvszip_traceip_sample                      | tag:traceip_list_3 \| eval kvpair=mvszip(json.traceip, json.cost,\"zzz\") \| table kvpair \| sort by kvpair                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           |
      | 100        | geostats_sample_count                         | tag:vendors_461 \| geostats latfield=vendors.VendorLatitude longfield=vendors.VendorLongitude count() as cnt \| limit 15                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              |
      | 100        | geostats_outputlatfield_outputlongfield_count | tag:vendors_461 \| geostats outputlatfield=res_latfield outputlongfield=res_longfield latfield=vendors.VendorLatitude longfield=vendors.VendorLongitude count() as cnt \| limit 15                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    |
      | 100        | geostats_binspanlat_binspanlong_count         | tag:vendors_461 \| geostats binspanlat=22.5 binspanlong=45.0 latfield=vendors.VendorLatitude longfield=vendors.VendorLongitude count() as cnt \| limit 15                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             |
      | 100        | geostats_maxzoomlevel_count_by_province       | tag:vendors_461 \| geostats latfield=vendors.VendorLatitude longfield=vendors.VendorLongitude maxzoomlevel=3 count(vendors.Weight) by vendors.VendorStateProvince \| limit 15                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         |
      | 100        | geostats_china_maxzoomlevel_sum_by_province   | tag:vendors_461 AND vendors.VendorCountry:China* \| geostats latfield=vendors.VendorLatitude longfield=vendors.VendorLongitude maxzoomlevel=3 sum(vendors.Weight)  by vendors.VendorStateProvince \| limit 15                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         |
      | 100        | geostats_maxzoomlevel_sum_by_province         | tag:vendors_461 \| geostats latfield=vendors.VendorLatitude longfield=vendors.VendorLongitude maxzoomlevel=3 sum(vendors.Weight)  by vendors.VendorStateProvince \| limit 15                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          |
      | 100        | eval_if_stats_count                           | (logtype:apache AND tag:sample04061424) \| eval desc = if (apache.status==200, \"OK\", \"Error\") \| stats count(desc) by desc                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        |
      | 100        | stats_sort_fail                               | tag:sample04061424 \| stats avg(apache.resp_len) as avg_length by apache.clientip \| sort by +avg_length, apache.clientip \| eval eval_length = avg_length + 200 \| limit 10                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          |
      | 100        | top_groupby                                   | tag:sample04061424  \| top 3 apache.clientip by apache.resp_len \| sort by count, apache.resp_len, apache.clientip                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    |
      | 100        | fields_sample                                 | starttime=\"now/d\" endtime=\"now\" tag:sample04061424 \| stats count() as count_res by appname,apache.clientip \| fields apache.clientip, count_res \| sort by count_res, apache.clientip                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            |
      | 100        | save_stats_avg_ip                             | tag:sample04061424 \| stats avg(apache.resp_len) as avg_len,count(apache.resp_len) by apache.clientip \| sort by +apache.clientip \| save /data/rizhiyi/spldata/save_stats_avg_ip.csv                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 |
      | 100        | stats_save                                    | tag:sample04061424 \| stats avg(apache.status) by hostname \| save /data/rizhiyi/spldata/apache_latency.csv                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           |
      | 100        | first_resp_len_in_map                         | starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424 \|  map \" tag:sample04061424 \| stats first(apache.resp_len) \"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         |
      | 100        | append_sample                                 | starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424_display \| stats avg(apache.resp_len) as avg_resp_len \| append [[ starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424_chart \| stats avg(apache.resp_len) as avg_resp_len \| append [[ starttime=\"now/d\" endtime=\"now/d+24h\"  tag:sample04061424 \| stats avg(apache.resp_len) as avg_resp_len]] ]]                                                                                                                                                                                                                                                                                                                        |
      | 100        | sub_nest_2                                    | starttime=\"now/d\" endtime=\"now/d+24h\" tag:\"sample04061424\" \| append [[ starttime=\"now/d\" endtime=\"now/d+24h\" tag:\"sample04061424\" apache.status:200 AND apache.method:\"GET\" \| append [[ tag:\"sample04061424\" \| stats count() as cnt by apache.status]] ]] \| table apache.clientip, apache.geo.latitude,apache.geo.longitude, apache.referer_domain,apache.x_forward                                                                                                                                                                                                                                                                                                               |
      | 1000       | sub_join_left3                                | starttime = \"now/d\" endtime = \"now/d+24h\" tag:\"sample04061424\" \| bucket timestamp span=1h as ts \| stats count() as ip_count by apache.clientip,ts \| join type=left ts [[starttime = \"now/d\" endtime = \"now/d+24h\" tag:\"sample04061424\" \| bucket timestamp span=1h as ts \| stats count() as hour_count by ts ]] \| eval ippercent=100 * ip_count / hour_count \| eval r_fomart = formatdate(ts,\"HH:mm:ss\")                                                                                                                                                                                                                                                                          |
      | 100        | spl_rangeline_outlier_not_all_0               | tag:sample04061424_display \| bucket timestamp span=3h as ts\| stats count(appname) as count_ by ts\| movingavg count_,5 as ma\| rollingstd count_,5 as rs\| eval lower=ma-1*rs\| eval upper=ma+1*rs\| eval outlier=if(count_>upper\|\|count_<lower, count_, 0)                                                                                                                                                                                                                                                                                                                                                                                                                                       |
      | 100        | append_bucket_bucket                          | starttime=\"now/d\" endtime=\"now/d+12h\" tag:\"sample04061424_display\" \| bucket timestamp span=1h as ts \| stats max(apache.resp_len) as count_1 by ts \| eval time=formatdate(ts, \"HH:mm:ss.SSS\") \| eval line=\"max_line\" \| append [[starttime=\"now/d\" endtime=\"now/d+12h\" tag:sample04061424_chart \| bucket timestamp span=1h as ts \| stats count(apache.resp_len) as count_2 by ts \| eval time=formatdate(ts, \"HH:mm:ss.SSS\") \| eval line=\"count_line\" ]]                                                                                                                                                                                                                      |
      | 100        | append_bucket_stats_mathematical              | starttime=\"now/d\" endtime=\"now/d+24h\" tag:\"sample04061424_chart\" \| bucket timestamp span=1h as ts \| stats avg(apache.resp_len) as stats_resplen by ts \| eval time=formatdate(ts,\"HH\") \| eval line=\"avg_line\" \| append [[starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424_chart \| bucket timestamp span=1h as ts \| stats max(apache.resp_len) as stats_resplen by ts \| eval time=formatdate(ts,\"HH\") \| eval line=\"max_line\"]] \| append [[starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424_chart \| bucket timestamp span=1h as ts \| stats min(apache.resp_len) as stats_resplen by ts \| eval time=formatdate(ts,\"HH\") \| eval line=\"min_line\" ]] |
      | 100        | rename_apache_bucket_span1h_count_formatdate  | starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424_display \| rename apache.c* as * \| bucket timestamp span=1h as ts \| stats count(lientip) as c_ip by ts \| eval f_timestamp = formatdate(ts,\"HH\") \| eval aa=tolong(f_timestamp)                                                                                                                                                                                                                                                                                                                                                                                                                                                      |
      | 100        | gf_dapper_tracing                             | tag:gf_dapper* AND dapper.msg.traceId:\"511f8756ce1d0b8a\" dapper.msg.duration:>0 \| table dapper.msg.id, dapper.msg.parentId, dapper.class, dapper.msg.duration, dapper.msg.timestamp, dapper.msg.binaryAnnotations[].value, collector_recv_timestamp \| sort by dapper.msg.id                                                                                                                                                                                                                                                                                                                                                                                                                       |
      | 100        | geostats_sample_count                         | tag:vendors_461 \| geostats latfield=vendors.VendorLatitude longfield=vendors.VendorLongitude count() as cnt                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          |
      | 100        | geostats_outputlatfield_outputlongfield_count | tag:vendors_461 \| geostats outputlatfield=res_latfield outputlongfield=res_longfield latfield=vendors.VendorLatitude longfield=vendors.VendorLongitude count() as cnt                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                |
      | 100        | geostats_binspanlat_binspanlong_count         | tag:vendors_461 \| geostats binspanlat=22.5 binspanlong=45.0 latfield=vendors.VendorLatitude longfield=vendors.VendorLongitude count() as cnt                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         |
      | 100        | geostats_china_maxzoomlevel_sum_by_province   | tag:vendors_461 AND vendors.VendorCountry:China* \| geostats latfield=vendors.VendorLatitude longfield=vendors.VendorLongitude maxzoomlevel=3 sum(vendors.Weight)  by vendors.VendorStateProvince                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     |
      | 100        | geostats_maxzoomlevel_sum_by_province         | tag:vendors_461 \| geostats latfield=vendors.VendorLatitude longfield=vendors.VendorLongitude maxzoomlevel=3 sum(vendors.Weight)  by vendors.VendorStateProvince                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      |


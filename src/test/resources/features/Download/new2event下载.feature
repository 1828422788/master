@alldownload @newdlevent
Feature: 事件搜索下载

  Background:
    Given open the "splSearch.SearchPage" page for uri "/search/"
    And I wait for element "SearchStatus" change text to "搜索完成!"

  @dlevent
  Scenario Outline: 执行
    Given I set the parameter "SearchInput" with value "<splQuery>"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for "2000" millsecond
    And I wait for element "SearchStatus" change text to "搜索完成!"

    And I wait for "2000" millsecond
    And I wait for "DownloadEvent" will be visible
    Then I click the "DownloadEvent" button
    Then I set the parameter "DownloadName" with value "<name>"
    Then I set the parameter "MaxLineNum" with value "100"
#    Then I choose the "<unit>" from the "MaxLineDropdown"
    Then I choose the "TXT" from the "DocumentTypeList"
    Then I choose the "UTF" from the "DocumentEncodeList"
    Then I click the "CreateDownloadTask" button
#    And I wait for "2000" millsecond
#    Then I will see the success message "提交成功，请到设置-下载管理页查看下载状态！"

    #下载到本地
#    Given open the "splSearch.OfflineTaskPage" page for uri "/download/#"
#    When I set the parameter "DbListPageSearchInput" with value "<name>.txt"
#    And I wait for "1000" millsecond
#    Given the data name is "<name>.txt" then i click the "下载" button

    Examples: 下载子查询结果
      | name                                          | splQuery                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             |
      | sub_count | (logtype:apache AND tag:\"sample04061424\") AND [[ appname:apache \| stats count(apache.method) as method_count by apache.method \|  sort by method_count \| limit 1 \| fields apache.method]] |
      | sub4 | (logtype:apache AND tag:\"sample04061424\") AND [[ appname:apache \| stats count(apache.method) as method_count by apache.method \| sort by method_count \| limit 1 \| fields apache.method]] |
      | sub5 | (logtype:apache AND tag:\"sample04061424\") AND [[ logtype:apache AND [[ * \| stats count(appname) by apache.method \| fields apache.method \| limit 2 ]] \| stats count(appname) as appcount by apache.method \| fields apache.method ]] |
      | sub6 | (logtype:apache AND tag:\"sample04061424\") AND [[ logtype:apache AND [[ * \| stats count(appname) by apache.method \| fields apache.method \| limit 2 ]] \| stats count(appname) as appcount by apache.method \| fields apache.method ]] |
      | sub7 | (logtype:apache AND tag:\"sample04061424\") AND [[ * \| stats es(apache.status) as es_status by apache.method \| fields apache.method ]] |
      | sub_download | [[ tag:\"sample04061424\"\| stats avg(apache.resp_len) as avg_len by apache.clientip \| sort by +avg_len ]] \| sort by timestamp |
      | sub_sample | tag:\"sample04061424\" AND [[ tag:\"sample04061424\"  \| stats count(apache.clientip) as count_ by apache.clientip \| sort by count_ \| limit 1 \| fields apache.clientip ]] |
      | sub_sample1 | starttime=\"now/d\" endtime=\"now/d+24h\" tag:\"sample04061424\" AND [[ tag:\"sample04061424\"\| stats count(apache.clientip) by apache.clientip, apache.method \| limit 2 \| fields apache.clientip apache.method ]] |
      | sub_sample2 | [[ tag:\"sample04061424\"  \| stats count(apache.clientip) as count_ by apache.clientip \| sort by count_ \| limit 1  ]] |
      | sub_es | tag:\"sample04061424\" AND [[tag:\"sample04061424\" \| stats es(apache.status) by apache.method \| fields apache.method]] |
      | sub_nest_2 | starttime=\"-d/d\" endtime=\"now/d\" tag:\"sample04061424\" \| append [[ starttime=\"-5h\" endtime=\"now\" tag:\"sample04061424\" apache.status:200 AND apache.method:\"GET\" \| append [[ tag:\"sample04061424\" \| stats count() as cnt by apache.status]] ]] |
      | sub_join_left2 | tag:\"sample04061424\"\| fields apache.method apache.clientip \| join type=left apache.clientip [[ tag:\"sample04061424\" \| stats sum(apache.status) by apache.clientip ]] |
      | sub_join_inner3 | starttime = \"-1d/d\" endtime = \"now/d\" tag:\"sample04061424\" \| fields apache.clientip, apache.method \| join type=inner apache.clientip [[starttime = \"now/d\" endtime = \"now/d+24h\" tag:\"sample04061424\" \| stats avg(apache.status) as sub_status by apache.clientip ]] |
      | sub_join_left3 | starttime = \"-1d/d\" endtime = \"now/d\" tag:\"sample04061424\" \| bucket timestamp span=1h as ts \| stats count() as ip_count by apache.clientip,ts \| join type=left ts [[starttime = \"-1d/d\" endtime = \"now/d\" tag:\"sample04061424\" \| bucket timestamp span=1h as ts \| stats count() as hour_count by ts ]] \| eval ippercent=100 * ip_count / hour_count \| eval r_fomart = formatdate(ts,\"HH:mm:ss\") |
      | append_bucket_bucket | starttime=\"now/d\" endtime=\"now/d+12h\" tag:\"sample04061424_display\" \| bucket timestamp span=1h as ts \| stats max(apache.resp_len) as count_1 by ts \| eval time=formatdate(ts, \"HH:mm:ss.SSS\") \| eval line=\"max_line\" \| append [[starttime=\"now/d\" endtime=\"now/d+12h\" tag:sample04061424_chart \| bucket timestamp span=1h as ts \| stats count(apache.resp_len) as count_2 by ts \| eval time=formatdate(ts, \"HH:mm:ss.SSS\") \| eval line=\"count_line\" ]] |
      | sub_where_count_big5 | (apache.resp_len:69 AND tag:\"sample04061424\") AND [[tag:\"sample04061424\" \| stats count(apache.clientip) as count_ by apache.clientip,apache.method \| where count_>5 \| fields apache.clientip,apache.method ]] |
      | append_bucket_stats_mathematical | starttime=\"now/d\" endtime=\"now/d+24h\" tag:\"sample04061424_chart\" \| bucket timestamp span=1h as ts \| stats avg(apache.resp_len) as stats_resplen by ts \| eval time=formatdate(ts,\"HH\") \| eval line=\"avg_line\" \| append [[starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424_chart \| bucket timestamp span=1h as ts \| stats max(apache.resp_len) as stats_resplen by ts \| eval time=formatdate(ts,\"HH\") \| eval line=\"max_line\"]] \| append [[starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424_chart \| bucket timestamp span=1h as ts \| stats min(apache.resp_len) as stats_resplen by ts \| eval time=formatdate(ts,\"HH\") \| eval line=\"min_line\" ]] |
      | makeresults_sample | \| makeresults count = 1 \| eval tag = \"sample04061424\" \| map \"starttime=\"now/d\" endtime=\"now/d+24h\" tag:$tag$ \| table apache.status, apache.resp_len,apache.clientip \| sort by apache.status, apache.resp_len,apache.clientip\" |
#      | collect_sample_appcollect_step1 | tag:sample04061424\| collect index=collectone marker=\"appname=\\\\\"appcollect\\\\\"\" |
#      | collect_sample_appcollect_step2 | index=collectone tag:sample04061424\| table tag, apache.resp_len, apache.x_forward \| sort by apache.x_forward |
#      | collect_appcollect_newtagcollect_step1 | tag:sample04061424\| collect index=collecttwo marker=\"appname=\\\\\"appcollect\\\\\", tag=\\\\\"newtagcollect\\\\\"\" |
#      | collect_appcollect_newtagcollect_step2 | index=collecttwo tag:\"newtagcollect\"  \| table tag, apache.resp_len, apache.x_forward \| sort by apache.x_forward |
#      | collect_testmode_true_step1 | tag:sample04061424 \| collect index=collectmode marker=\"tag=\\\\\"testmode1\\\\\"\" testmode=true |
#      | collect_testmode_true_step2 | index=collectmode tag:\"testmode1\" \| table tag, apache.resp_len, apache.x_forward \| sort by apache.x_forward |
#      | collect_testmode_false_step1 | tag:sample04061424 \| collect index=collectmode marker=\"tag=\\\\\"testmode1\\\\\"\" testmode=false |
#      | collect_testmode_false_step2 | index=collectmode tag:\"testmode1\" \| table tag, apache.resp_len, apache.x_forward \| sort by apache.x_forward |
#      | collect_to_collect_step1 | index=collectone appname:appcollect \| collect index=collecttocollect marker=\"tag=\\\\\"newcollect\\\\\"\" |
#      | collect_to_collect_step2 | index=collecttocollect tag:newcollect \| table tag, apache.resp_len, apache.x_forward \| sort by apache.x_forward |
#      | collect_mulparam_step1 | tag:sample04061424 \| collect index=collectmulti marker=\"tag=\\\\\"newtagcollect\\\\\",ip=\\\\\"192.168.1.100\\\\\", apache.status=100, apache.resp_len=23.0\" |
#      | collect_mulparam_step2 | tag:sample04061424 \| collect index=collectmulti marker=\"tag=\\\\\"newtagcollect\\\\\",ip=\\\\\"192.168.1.100\\\\\", apache.status=100, apache.resp_len=23.0\" |
      | rename_multi_fields_apache_plus | tag:sample04061424 \| rename apache.geo.* as *, apache.r* as r*, apache.clientip as clientip \| table r*,clientip \| sort by resp_len, clientip, request_query |
      | parse_digital_max_match100 | tag:sample04061424 AND  apache.x_forward:1\| parse \"(?<digital_list>\\\\d+)\" max_match=100 \|  table digital_list, apache.x_forward |
      | parse_chinese_char_maxmatch100_exceed_rawlen | tag:sample04061424_chinese_5 \| limit 1 \| parse field=raw_message \"(?<first_chinese_char>[\\\\u4e00-\\\\u9fa5])\" max_match=100 \| table first_chinese_char |
      | eval_match_query | tag:\"sample04061424\" AND apache.request_query:* \| eval r_match1 = match(apache.request_query, \"b.*e\") \| eval r_match2 = match(apache.request_query, \"^bcd\") \| table apache.request_query, r_match1, r_match2, apache.x_forward \| sort by  apache.x_forward |
      | parse_to_table | tag:sample04061424 \| parse \"(?<digital_list>\\\\d+)\" max_match=5 \| table digital_list, apache.x_forward \| sort by  apache.x_forward |
      | rename_apache_bucket_span1h_count_formatdate | starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424_display \| rename apache.c* as * \| bucket timestamp span=1h as ts \| stats count(lientip) as c_ip by ts \| eval f_timestamp = formatdate(ts,\"HH\") \| eval aa=tolong(f_timestamp) |
      | search_verify_chart_log | starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424_chart |
      | search_generall | tag:sample04061424 |
      | index_yotta_tag | index=* tag:sample04061424 |
      | index_yotta_regex | index=yotta tag:sample04061424 AND  /[0][8]0{2,2}/ |
      | index_all_tag_regex | index=* starttime=\"now/d\" endtime=\"now/d+24h\" tag:*04061424 |
      | search_eventcount | tag:sample04061424 AND apache.referer_domain:\"m5.baidu.com\" AND apache.clientip:\"23.166.125.53\" |
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
      | search_filterfield_uppercase_fuzzy_match1 | tag:sample04061424 AND apache.ua:Mozilla* |
      | search_chinese_fuzzy_match | tag:chinese_fuzzy_match 企* |
      | search_regex_json | tag:sample04061424_regex_json_100 |
      | search_json_sdyd_41 | tag:sample04061424_json_sdyd_41 |
      | search_json_sdyd_float | tag:sample04061424_json_sdyd_float_59 |
      | search_log4j | tag:\"sample04061424_log4j_100\" |
      | search_highlight_get | tag:sample04061424 AND get* |
      | search_highlight_gf_bond_start | tag:highlight_gf_bond_56 justLogSplRequest start |
      | search_highlight_resp_len_char | tag:sample04061424 AND apache.resp_len:\"93\" |
      | search_highlight_resp_len_int | tag:sample04061424 AND apache.resp_len:93 |
      | search_highlight_clientip | tag:sample04061424 AND apache.clientip:23* |
      | search_syntax_equal_word_highlight | tag:sample04061424_syntax_equal_5 AND \"api\\\\=user\" |
      | search_syntax_equal_2word_noquote_highlight | tag:sample04061424_syntax_equal_5 AND api\\\\=user |
      | search_syntax_equal_string_highlight | tag:sample04061424_syntax_equal_5 AND user.passport.loginLog |
      | search_regex_match_ip_highlight | tag:sample04061424_syntax_equal_5 AND  /[0-9]{3}.[0-9]{1}.[0-9]{3}.[0-9]{1}/ |
      | search_regex_match_3string_highlight | tag:sample04061424_syntax_equal_5  AND /[a-z]{4}/ /[a-z]{7}/ |
      | search_chinese | tag:sample04061424_chinese_5 |
      | search_raw | tag:sample04061424_raw_36 |
      | search_upload_noappname | tag:\"sample04061424_noappname_36\" |
      | search_alert_yctv | tag:sample04061424_yctv_100 AND (NOT \"errno 104\") AND (NOT \"code 0\") AND (NOT \"errno 111\") AND (NOT \"errno 106\") AND (NOT \"verify failed\") AND (NOT \"errno 101\") AND (NOT \"errno 115\") AND (NOT \"errno 117\") AND (NOT \"Detect failed\") AND (NOT \"errno 109\") AND (NOT \"Job failed\") AND (NOT \"inner error\") |
      | search_highlight_last_update_timestamp | tag:last_update_timestamp_100 AND last_update_timestamp |
      | search_highlight_last_asterisk_match | tag:last_update_timestamp_100 AND last* |
      | search_highlight_before_capital_letter | tag:highlight_huawei_10 \"the message is\" |
      | start_time_para_mon | starttime=\"now-1M/M-1d/w\"  endtime=\"now\" tag:sample04061424 |
      | startt_today | starttime=\"now/d\" endtime=\"now\" tag:sample04061424 |
      | limit_1 | tag:\"sample04061424\"\| limit 10 |
      | gf_dapper_tracing | tag:gf_dapper* AND dapper.msg.traceId:\"511f8756ce1d0b8a\" dapper.msg.duration:>0 \| table dapper.msg.id, dapper.msg.parentId, dapper.class, dapper.msg.duration, dapper.msg.timestamp, dapper.msg.binaryAnnotations[].value, collector_recv_timestamp \| sort by dapper.msg.id |
      | tracing_mvszip_mvexpand_parse | tag:gf_dapper* AND 'tag':gf_dapper_mould_3 \| eval aa=mvszip(mvszip(dapper.msg.annotations[].endpoint.serviceName,dapper.msg.annotations[].timestamp),dapper.msg.annotations[].value)\|mvexpand aa\|parse field=aa \"(?<aname>[^,]*),(?<atime>[^,]*),(?<avalue>\\\\S+)\"\|sort by +atime \| table atime,dapper.msg.name,dapper.msg.traceId,dapper.msg.parentId,dapper.msg.id,dapper.msg.duration,aname,avalue,dapper.msg.binaryAnnotations[].endpoint.serviceName,dapper.msg.binaryAnnotations[].key,dapper.msg.binaryAnnotations[].value\|rename dapper.time as time,dapper.mtype as mtype,dapper.msg.name as fundname,dapper.msg.traceId as traceId,dapper.msg.parentId as parentId,dapper.msg.id as id,dapper.msg.duration as duration,dapper.msg.binaryAnnotations[].endpoint.serviceName as daname,dapper.msg.binaryAnnotations[].key as dakey,dapper.msg.binaryAnnotations[].value as davalue\|eval time=formatdate(tolong(substring(tostring(atime),0,13)))\|fields time,fundname,traceId,parentId,id,duration,aname,avalue,daname,dakey,davalue |
      | first_sub_inner_ip | [[ tag:\"sample04061424\"\| stats count(apache.clientip) by apache.clientip, apache.method \| limit 2 \| fields apache.clientip apache.method ]] |
      | geostats_sample_count | tag:vendors_461 \| geostats latfield=vendors.VendorLatitude longfield=vendors.VendorLongitude count() as cnt |
      | geostats_outputlatfield_outputlongfield_count | tag:vendors_461 \| geostats outputlatfield=res_latfield outputlongfield=res_longfield latfield=vendors.VendorLatitude longfield=vendors.VendorLongitude count() as cnt |
      | geostats_binspanlat_binspanlong_count | tag:vendors_461 \| geostats binspanlat=22.5 binspanlong=45.0 latfield=vendors.VendorLatitude longfield=vendors.VendorLongitude count() as cnt |
      | geostats_maxzoomlevel_count_sample | tag:vendors_461 AND vendors.VendorCountry:China* \| geostats latfield=vendors.VendorLatitude longfield=vendors.VendorLongitude maxzoomlevel=1 count(vendors.Weight) |
      | geostats_maxzoomlevel_count | tag:vendors_461 AND vendors.VendorCountry:China* \| geostats latfield=vendors.VendorLatitude longfield=vendors.VendorLongitude maxzoomlevel=3 count(vendors.Weight) |
      | geostats_china_maxzoomlevel_count_by_province | tag:vendors_461 AND vendors.VendorCountry:China* \| geostats latfield=vendors.VendorLatitude longfield=vendors.VendorLongitude maxzoomlevel=3 count(vendors.Weight) by vendors.VendorStateProvince |
      | geostats_maxzoomlevel_count_by_province | tag:vendors_461 \| geostats latfield=vendors.VendorLatitude longfield=vendors.VendorLongitude maxzoomlevel=3 count(vendors.Weight) by vendors.VendorStateProvince |
      | geostats_china_maxzoomlevel_sum_by_province | tag:vendors_461 AND vendors.VendorCountry:China* \| geostats latfield=vendors.VendorLatitude longfield=vendors.VendorLongitude maxzoomlevel=3 sum(vendors.Weight)  by vendors.VendorStateProvince |
      | geostats_maxzoomlevel_sum_by_province | tag:vendors_461 \| geostats latfield=vendors.VendorLatitude longfield=vendors.VendorLongitude maxzoomlevel=3 sum(vendors.Weight)  by vendors.VendorStateProvince |
      | dedup_default | tag:sample04061424 \| dedup apache.status \| sort by timestamp |
      | dedup_int | tag:sample04061424 \| dedup 3 apache.status \| sort by timestamp |
      | dedup_char_keepevents_true | tag:sample04061424 \| dedup 3 apache.version keepevents=true \| sort by timestamp |
      | dedup_char_keepevents_false | tag:sample04061424 \| dedup 3 apache.version keepevents=false \| sort by timestamp |
      | dedup_double_fields_keepevents_true | tag:sample04061424 \| dedup 3 apache.method, appname keepevents = true \| sort by timestamp |
      | dedup_double_fields_keepevents_false | tag:sample04061424 \| dedup 3 apache.status, appname keepevents = false \| sort by timestamp |
      | dedup_keepempty_true | tag:sample04061424_win_sys_20 \| dedup json.Category keepempty = true |
      | dedup_keepempty_false | tag:sample04061424_win_sys_20 \| dedup json.Category keepempty = false |
      | eval_case_tran | tag:sample04061424_display OR tag:sample04061424_chart \| eval status_com = case(tag==\"sample04061424_display\", apache.status, tag==\"sample04061424_chart\", apache.status) \| transaction status_com maxevents=100 |
      | rename_apache_tran2len_sort | starttime=\"now/d\" endtime=\"now/d+24h\" tag:\"sample04061424\" \| rename apache.* as new.* \| transaction new.resp_len \| sort by new.resp_len |
      | fields_result_seq | tag:\"sample04061424\" \| fields appname, tag, apache.clientip, apache.geo.country, apache.request_path, apache.status, apache.resp_len, apache.method, apache.x_forward \| sort by  apache.x_forward |
      | rename_apache_fields_sort | starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424 \| rename apache.* as test.* \| fields test.clientip, test.resp_len, test.status, test.x_forward, test.request_query \| sort by test.x_forward, test.clientip |
      | eval_delete_sample_step1 | starttime=\"now/d\" endtime=\"now/d+24h\" tag:spldelete \| delete |
      | eval_delete_after_where_step1 | starttime=\"now/d\" endtime=\"now/d+24h\" tag:spldelete1 \| limit 10 \| delete |
      | eval_delete_sample_step2 | starttime=\"now/d\" endtime=\"now/d+24h\" tag:spldelete |
      | eval_delete_after_where_step2 | starttime=\"now/d\" endtime=\"now/d+24h\" tag:spldelete1 |
      | spl_eval_add | tag:sample04061424 \| eval status = apache.status \| eval resp_len =  apache.resp_len \| eval status_add0=apache.status+0 \| eval len_add0=resp_len+0 |
      | spl_rangeline_outlier_is_0 | tag:sample04061424_display \| bucket timestamp span=3h as ts\| stats count(appname) as count_ by ts\| movingavg count_,5 as ma\| rollingstd count_,5 as rs \| eval lower=ma-3*rs \| eval upper=ma+3*rs\| eval outlier=if(count_>upper\|\|count_<lower, count_, 0) |
      | spl_rangeline_outlier_not_all_0 | tag:sample04061424_display \| bucket timestamp span=3h as ts\| stats count(appname) as count_ by ts\| movingavg count_,5 as ma\| rollingstd count_,5 as rs\| eval lower=ma-1*rs\| eval upper=ma+1*rs\| eval outlier=if(count_>upper\|\|count_<lower, count_, 0) |
      | search_four_divide_five_makersult | \| makeresults count = 10 \| eval a=4/5 \| table a |
      | eval_4divide5_event | tag:sample04061424  \| eval a=4/5 \| table a |

@alldownload
Feature: download_v33

  Background:
    Given open the "splSearch.SearchPage" page for uri "/search/"
    And I wait for element "SearchStatus" change text to "搜索完成!"

  @dlother2
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

    Examples:
      | name                                                   | splQuery                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              |
      | eval_not_in_resp_len | starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424 \| eval is_in = in(apache.resp_len, -1, -2) \| table apache.resp_len, is_in, apache.x_forward \| sort by apache.x_forward \| limit 10 |
      | eval_in_resp_len_v_null | starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424 \| eval is_in = in(apache.resp_len, null) \| table apache.resp_len, is_in, apache.x_forward \| sort by apache.x_forward \| limit 10 |
      | eval_in_flist_loat_v_float | starttime=\"now/d\" endtime=\"now/d+24h\" tag:traceip_list_3 \| eval is_in=in(json.cost,4.993,8.973 ) \| table json.cost, is_in |
      | eval_in_forward_v_params | starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424 \| eval is_in=in(apache.x_forward, apache.x_forward) \| table apache.status, apache.resp_len, is_in, apache.x_forward \| sort by apache.x_forward \| limit 10 |
      | eval_in_refererdomain_v_params | starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424 \| eval is_in=in(apache.referer_domain, apache.referer_domain) \| table apache.resp_len, is_in, apache.referer_domain \| sort by apache.referer_domain \| limit 10 |
      | eval_in_resp_len_v_single_where | starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424 \| eval is_in=in(apache.resp_len, apache.status,4653, 2017, 2020) \| where is_in==true \| table apache.status, apache.resp_len, is_in, apache.x_forward \| sort by apache.x_forward |
      | eval_in_resp_len_v_list | starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424 \| eval len_list=mvappend(4653, 2017, 2020) \| eval is_in=in(apache.resp_len, apache.status, len_list) \| where is_in==true \| table apache.status, apache.resp_len, is_in, apache.x_forward \| sort by apache.x_forward |
      | eval_in_list_v_single_resp_len | starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424 \| eval len_list=mvappend(4653, 2017, 2020) \| eval is_in=in(len_list, apache.resp_len, apache.status) \| where is_in==true \| table apache.status, apache.resp_len, is_in, apache.x_forward \| sort by apache.x_forward |
      | eval_in_data_list_v_data_list | starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424 \| sort by apache.x_forward \| limit 3 \| eval list123_1=mvappend(1,2,3) \| eval list123_2=mvappend(1,2,3) \| eval is_in=in(list123_1, list123_2) \| table list123_1,is_in |
      | eval_in_data_list_v_data_list_single | starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424 \| sort by apache.x_forward \| limit 3 \| eval list123_1=mvappend(1,2,3) \| eval list123_2=mvappend(4, 5, 6) \| eval is_in=in(list123_1, list123_2) \| table list123_1,is_in |
      | eval_in_string_list_v_string_list | starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424 \| sort by apache.x_forward \| limit 1 \| eval citylist=mvappend(\"beijing\", \"tianjin\", \"Shanghai\") \| eval is_in=in(citylist, citylist) \| table citylist, is_in |
      | eval_in_string_list_v_string_list_false | starttime=\"now/d\" endtime=\"now/d+24h\" tag:jpath_mvzip_1 \| eval citylist=mvappend(\"beijing1\", \"tianjin1\", \"Shanghai1\") \| eval is_in=in(json.a[].city, citylist) \| table citylist, json.a[].city, is_in |
#      | kvdict_sample_stats_rename_outputlookup | starttime=\"now/d\" endtime=\"now/d+24h\"  tag:sample04061424 \| stats count() as cnt by apache.status, apache.clientip \| rename apache.status as status, apache.clientip as clientip \| where cnt>2 \| outputlookup kvstoresample |
#      | kvdict_sample_inputlookup | \| inputlookup kvstoresample |
#      | kvstore_sample_stats_rename_outputlookup_csv | starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424_chart \| eval int_x_forward= tolong(apache.x_forward) \| sort by +int_x_forward \| limit 10 \| stats count() as cnt by apache.clientip, apache.status \| outputlookup cnt_ip_status.csv |
#      | kvstore_sample_inputlookup_csv | \| inputlookup cnt_ip_status.csv |
      | partition_status_stats_sample | starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424 \| partition 5 by apache.status [[ stats count() by apache.status ]] |
      | partition_status_chart_sample | starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424 \| partition 3 by apache.status [[ chart count() over apache.status span=\"100\" ]] |
      | newfields_keep_ipstatus_limit_table_ipstatus_tag | starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424 \| sort by apache.x_forward \| fields + apache.status, apache.clientip \| limit 10 \| table apache.status, apache.clientip, tag |
      | newfields_keep_ipstatus_table_tagmethod | starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424 \| sort by apache.x_forward \| limit 10 \| fields + apache.status, apache.clientip \| table tag, apache.method, apache.status |
      | limit_newfields_batch_keep_apache_remove_apacher_table | starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424 \| sort by apache.x_forward \| limit 10 \| fields + apache.* \| fields - apache.g*, apache.r*, apache.timestamp,apache.ua \| table apache.* |
      | newfields_remove_tagappname_table_tagstatus | starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424 \| sort by apache.x_forward \| fields - appname, tag \| table tag, apache.status |
      | newfields_remove_tag_keep_tag_table | starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424 \| sort by apache.x_forward \| limit 10 \| fields - tag \| fields + tag \| table tag |
      | newfields_batch_keep_apache_limit_count_byip | starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424 \| sort by apache.x_forward \| fields + apache.* \| limit 13 \| stats count() by apache.clientip |
      | newfields_keep_noexistfield | starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424 \| sort by apache.x_forward \| limit 10 \| fields + noexistfield1, noexistfield2 \| table noexistfield1, noexistfield2, tag |
      | newfields_remove_noexistfield | starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424 \| sort by apache.x_forward \| limit 10 \| fields - noexistfield1, noexistfield2 \| table apache.x_forward, apache.resp_len, apache.referer_domain, apache.clientip |
      | newfields_batch_remove_spacesplit_table | starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424 \| sort by apache.x_forward \| limit 10 \| fields - apache.* raw_message  \| table tag, apache.x_forward |
      | newfields_batch_remove_apache_sample | starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424 \| sort by apache.x_forward \| limit 10 \| fields - apache.*, raw_message \| table tag, apache.status |
      | newfields_keep_ipstatus_limit_sample | starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424 \| sort by apache.x_forward \| sort by apache.x_forward \| limit 10 \| fields + apache.status, apache.clientip \| table apache.status, apache.clientip, tag |
      | limit_newfields_batch_keep_apache_count_byip | starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424 \| sort by apache.x_forward \| limit 10 \| fields + apache.* \| stats count() by apache.clientip |
      | bug_onetag_sort_timestamp1 | index=* starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424* AND logtype:apache  \| sort by timestamp \| table tag, apache.clientip |
      | bug_onetag_sort_timestamp2 | index=* starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424* AND logtype:apache  \| sort by +timestamp \| table tag, apache.clientip |
      | bug_top_limit_sort1_Mindex | index=* starttime=\"now/d\" endtime=\"now/d+24h\" tag: sample04061424*  \| top 10 appname \| limit 10 |
      | bug_stats_limit_sort2_Mindex | index=* starttime=\"now/d\" endtime=\"now/d+24h\" tag: sample04061424*  \| top 10 appname \| limit 10 \|sort by count |
      | bug_sort_timestamp1 | index=* starttime=\"now/d\" endtime=\"now/d+24h\" tag: sample04061424* \| sort by timestamp \| table tag |
      | bug_sort_timestamp2 | index=* starttime=\"now/d\" endtime=\"now/d+24h\" tag: sample04061424* \| sort by +timestamp \| eval f_formatdate = formatdate(timestamp)\| table appname,f_formatdate |
      | bug_top_limit_sort1 | index=* starttime=\"now/d\" endtime=\"now/d+24h\" tag: sample04061424*  \| top 10 appname \| limit 20 |
      | bug_top_limit_sort2 | index=* starttime=\"now/d\" endtime=\"now/d+24h\" tag: sample04061424*  \| top 10 appname \| limit 10 \|sort by count |
      | bug_stats_limit_sort1 | index=* starttime=\"now/d\" endtime=\"now/d+24h\" tag: sample04061424* \| stats count() as ct by appname \| limit 10 |
      | bug_stats_limit_sort2 | index=* starttime=\"now/d\" endtime=\"now/d+24h\" tag: sample04061424* \| stats count() as ct by appname \| limit 10 \| sort by +ct |
      | bug_where_count1 | tag:sample04061424 AND apache.resp_len:* \| eval trade_time=todouble(apache.resp_len) \| where trade_time>0.0 \| stats count() as count_ |
      | bug_where_count2 | tag:sample04061424 AND apache.resp_len:>0 \| eval trade_time=todouble(apache.resp_len) \| where trade_time>0.1 \| stats count() as count_ |
      | bug_count_extend_stats | tag:sample04061424 \| stats count() as cnt by apache.status \| stats extend_stat(cnt) |
      | bug_max_if | tag:sample04061424 \| stats max(timestamp) by apache.method \| eval a = if(empty(apache.method), 1, 0) |
      | bug_max_as_value | tag:sample04061424 \| stats max(apache.status) as value |
      | bug_count_ip_sort | tag:sample04061424 \| stats count(apache.status) as status by apache.clientip \| sort by +status |
      | bug_formatdate_Asia | tag:sample04061424_apachesample_dawn \| eval new_time = 1552237948000 \| eval f_timestamp = formatdate(new_time, \"yyyy-MM-dd HH:mm:ss.SSS\", \"Asia/Shanghai\") \| table f_timestamp,new_time |
      | bug_now_where_count_app | starttime=\"now/d\" endtime=\"now\" tag:sample04061424_apachesample_dawn \| bucket timestamp span=10m as ts\|stats count(appname) as count_app by ts \| eval time=formatdate(ts,\"HH:mm:ss\")\| where count_app>0 |
      | bucket_formatdate_where_count_larger3 | starttime=\"now/d\" endtime=\"now\" tag:sample04061424_apachesample_dawn \| bucket timestamp span=10m as ts\|stats count(appname) as count_app by ts\| eval time_dis=formatdate(now()-ts, \"HH:mm:ss\") \| where count_app>3 |
#      | rate_sample | tag:top_info \| eval retpath=json.disk.path \| eval retused=json.disk.used \| eval used=tolong(retused) \| bucket timestamp span=10m as timestamp \| table used,retpath,timestamp \| stats rate(used) by timestamp,retpath |
      | transpose_count | tag:sample04061424 \| stats count() as cnt by apache.method, apache.status \| transpose row=apache.method column=apache.status valuefield=cnt |
      | transpose_pct | tag:sample04061424 \| stats pct(apache.status,1,5,25,50,75,95,99) as pct_ by apache.method \| transpose row=pct_.1 column=apache.method valuefield=pct_.5 |
      | transpose_table | starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424_apachesample_dawn \| table apache.geo.longitude,apache.geo.latitude, apache.clientip \| transpose row=apache.geo.longitude column=apache.geo.latitude valuefield=apache.clientip |
      | transpose_eval_table | tag:sample04061424_chart \| stats avg(apache.resp_len) as avglen by  apache.clientip \| eval int_avglen = floor(avglen) \| sort by avglen  \| transpose row=apache.clientip column=int_avglen valuefield=avglen |
      | transpose_bucket_stats_eval_autoregress | starttime=\"now/d\" endtime=\"now+d/d\" tag:sample04061424_apachesample_dawn \|bucket timestamp span=1h as ts\|stats count() as count_app by ts\|eval time=formatdate(ts,\"HH:mm:ss\") \|autoregress count_app p=3 \|transpose row=ts column=time valuefield=count_app |
      | esma_sample | starttime=\"now/d\" endtime=\"now+d/d\" tag:\"sample04061424_apachesample_dawn\" \| bucket timestamp span=1h as ts \| stats count() as cnt by ts \| esma cnt timefield=ts |
      | esma_sample1 | starttime=\"now/d\" endtime=\"now+d/d\" tag:\"sample04061424_apachesample_dawn\" \| bucket timestamp span=1h as ts \| stats avg(apache.resp_len) as cnt by ts \| esma cnt timefield=ts \|eval r_fmt_time=formatdate(ts) |
      | esma_futurecount | starttime=\"now/d\" endtime=\"now+d/d\" tag:\"sample04061424_apachesample_dawn\" \| bucket timestamp span=1h as ts \| stats count() as cnt by ts \| esma cnt timefield=ts futurecount=30 \|eval new_tt=formatdate(ts,\"HH:mm:ss\") |
      | esma_where_join | starttime=\"now-1d/d\" endtime=\"now/d\" tag:sample04061424 \| bucket timestamp span=1h as ts \| stats avg(apache.status) as avg_ by ts \| esma avg_ timefield=ts futurecount=24 \| eval r_fmt=formatdate(ts)  \| where typeof(_predict_avg_)==\"double\" \| eval time = formatdate(ts, \"HH:mm\") \| table time, _predict_avg_ \| join type=left time [[ starttime=\"now/d\" endtime=\"now/d+24h\"  tag:\"sample04061424_apachesample_dawn\" \| bucket timestamp span=1h as ts \| stats avg(apache.status) as avg_ by ts \| eval time = formatdate(ts, \"HH:mm\") \| table time, avg_ ]] |

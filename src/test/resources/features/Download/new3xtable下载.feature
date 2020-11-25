@newalldownload
Feature: table下载

  Background:
    Given open the "splSearch.SearchPage" page for uri "/search/"
    And I wait for element "SearchStatus" change text to "搜索完成!"

  @newxtable
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
      | chart_over_timestamp_span1h | starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424_display  \| chart count() over timestamp span=\"1h\" |
      | chart_over_timestamp_span1d | starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424_display \| chart count() over timestamp span=\"1d\" |
      | chart_bins3_span1h | starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424_display \| chart count() over timestamp bins=3 span=\"1h\" |
      | chart_bins24_span1h | starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424_display \| chart count() over timestamp bins=24 span=\"1h\" |
      | chart_sep_sample | starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424_display \| chart sep=\"-sep分格-\" count() max(apache.resp_len) over timestamp span=\"1h\" by apache.status |
      | chart_sep_format | starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424_display \| chart sep=\"-sep分格-\" format=\"$AGG\|format分格\|$VAL\" count() max(apache.resp_len) over timestamp span=\"1h\" by apache.status |
      | chart_sep_format1 | starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424_display \| chart sep=\"-sep分格-\" format=\"$VAL\|format分格\|$AGG\" count() max(apache.resp_len) over timestamp span=\"1h\" by apache.status |
      | chart_bins10_span30m | starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424_display \| chart count() max(apache.resp_len) over timestamp bins=10 span=\"30m\" |
      | chart_bins10_span30m_startindex2_endindex7 | starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424_display \| chart count() max(apache.resp_len) over timestamp bins=10 span=\"30m\" |
      | chart_bins10_span30m_startindex4_endindex7 | starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424_display \| chart count() max(apache.resp_len) over timestamp bins=10 span=\"1h\" startindex=4 endindex=7 |
      | chart_bins10_span30m_startindex4_endindex7_bystatus | starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424_display \| chart count() max(apache.resp_len) over timestamp bins=10 span=\"1h\" startindex=4 endindex=7 by apache.status |
      | chart_limit_one_field | starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424_display \| chart limit=5 count() max(apache.resp_len) over timestamp span=\"1h\" by apache.status |
      | chart_limit_two_field | starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424_display \| chart limit=5 count() max(apache.resp_len) over timestamp span=\"1h\"  by apache.status, apache.method |
      | chart_multi_params_by_clientip | starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424_display \| chart sep=\"-sep分格-\" format=\"$AGG\|format分格\|$VAL\" limit=5 cont=false count() as cnt max(apache.resp_len) over timestamp span=\"1h\" bins=4 startindex=1 endindex=4 by apache.clientip bins=3 |
      | chart_multi_params_by_status_bins1 | starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424_display \| chart sep=\"-sep分格-\" format=\"$AGG\|format分格\|$VAL\" limit=5 cont=false count() as cnt max(apache.resp_len) over timestamp span=\"1h\" bins=4 startindex=1 endindex=4 by apache.status bins=1 |
      | chart_multi_params_by_resplen_bins3 | starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424_display \| chart sep=\"-sep分格-\" format=\"$AGG\|format分格\|$VAL\" limit=5 cont=false count() as cnt max(apache.status) over timestamp span=\"1h\" bins=4 startindex=1 endindex=4 by apache.resp_len bins=3 |
      | bucket_ts_stats_sum_eval | (logtype:apache AND tag:\"sample04061424_chart\") \| bucket timestamp span=1m as ts \| stats sum(apache.resp_len) as sum_len by ts,apache.status \| eval time=formatdate(ts,\"HH:mm:ss\") |
      | bucket_stats_eval_movingavg | starttime=\"now/d\" endtime=\"now/d+24h\"  tag:\"sample04061424_chart\"\| bucket timestamp span=1m as ts \| stats sum(apache.resp_len) as sum_resp_len by ts \| eval time=formatdate(ts,\"HH:mm:ss\") \| movingavg sum_resp_len,3 as moving_avg_resp_len |
      | bucket_1h_stats_count | starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424_chart \| bucket timestamp span=1h as ts \| stats count(apache.clientip) as c_ip by ts |
      | autoregress_sample | starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424_apachesample_dawn \| bucket timestamp span=30m as ts \| stats count(appname) as count_app by ts \| eval time=formatdate(ts,\"HH:mm:ss\") \| autoregress count_app p=6 |
      | starttime_bucket_ts_sum_eval | starttime=\"now/d\" endtime=\"now/d+24h\" tag:\"sample04061424_chart\" \| bucket timestamp span=1h as ts \| stats sum(apache.resp_len) as sum_len by ts \| eval time=formatdate(ts,\"HH:mm:ss\") |
      | starttime_bucket_ts_count_eval_formatdate | starttime=\"now/d\" endtime=\"now/d+24h\" tag:\"sample04061424_chart\" \| bucket timestamp span=1h as ts \| stats count(apache.resp_len) as sum_len by ts \| eval time=formatdate(ts,\"HH:mm:ss\") |
      | bucket_stats_autoregress | starttime=\"now/d\" endtime=\"now/d+24h\" tag:\"sample04061424_chart\" \| bucket timestamp span=1h as ts \| stats count() as count_app by ts \| eval time=formatdate(ts,\"HH:mm:ss\") \| autoregress count_app p=3 |
      | schedule_append_bucket_count_geoisp | starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424_apachesample_dawn \| bucket timestamp span=1h as ts \| stats count(apache.geo.isp) as count_ by apache.geo.isp, ts \| eval date_hour=tolong(formatdate(ts,\"HH\")) \| rename apache.geo.isp as group_line \| sort by +date_hour, +group_line \| append [[index=schedule starttime=\"-2d\" endtime=\"-d/d\" schedule_name:pip_task\|stats avg(ip_count) as count_ by date_hour\|eval group_line=\"base_line\"\|sort by +date_hour,+group_line]] |
      | filldown_after_bucket_avg_eval | starttime=\"now/d\" endtime=\"now/d+12h\" tag:sample04061424_chart \| bucket timestamp span=1h as ts \| stats avg(apache.resp_len) as a_ by ts \| eval b=a_ \| filldown b |
      | filldown_after_bucket_stats_avg | starttime=\"now/d\" endtime=\"now/d+12h\" tag:sample04061424_apachesample_dawn \| bucket timestamp span=1h as ts \| stats avg(apache.resp_len) as avg_resp_len by ts  \| filldown avg_resp_len |
      | bucket_movingavg_rollingstd_eval | starttime=\"now/d\" endtime=\"now/d+7h\" tag:sample04061424_apachesample_dawn \| bucket timestamp span=1h as ts\| stats count(appname) as count_ by ts\| movingavg count_,5 as ma\| rollingstd count_,5 as rs\| eval lower=ma-1*rs\| eval upper=ma+1*rs\| eval outlier=if(count_>upper\|\|count_<lower, count_, 0) |
      | top_count_percent | tag:sample04061424 \| top 11 apache.clientip  countfield=clientip_count  percentfield=clientip_percent |
      | earliest_timestamp | tag:sample04061424_apachesample_dawn \| stats earliest(timestamp) as earliest_time \| eval f_earliest_time=formatdate(earliest_time,\"HH:mm:SS\") |
      | earliest_timestamp_by_ip | tag:sample04061424_apachesample_dawn \| stats earliest(timestamp) as earliest_time by apache.clientip \| eval f_earliest_time=formatdate(earliest_time,\"HH:mm:SS\") \| sort by apache.clientip |
      | latest_timestamp | tag:sample04061424_apachesample_dawn \| stats latest(timestamp) as latest_time \| eval f_latest_time =formatdate(latest_time,\"HH:mm:ss.SSS\") |
      | latest_timestamp_by_ip | tag:sample04061424_apachesample_dawn \| stats latest(timestamp) as latest_time by apache.clientip \| eval f_latest_time =formatdate(latest_time,\"HH:mm:ss.SSS\") |
      | first_timestamp | tag:sample04061424_apachesample_dawn \| stats first(timestamp) as first_time \| eval f_first_time =formatdate(first_time) |
      | first_timestamp_by_ip | tag:sample04061424_apachesample_dawn \| stats first(timestamp) as first_time by apache.clientip \| eval f_first_time =formatdate(first_time) |
      | last_timestamp | tag:sample04061424_apachesample_dawn \| stats last(timestamp) as last_time \| eval f_last_time =formatdate(last_time) |
      | last_timestamp_by_ip | tag:sample04061424_apachesample_dawn \| stats last(timestamp) as last_time by apache.clientip \| eval f_last_time=formatdate(last_time) |
      | first_bucket_count_ip | tag:sample04061424_apachesample_dawn \| bucket timestamp span=1h as ts \| stats count(apache.clientip) as c_ip by ts \| stats first(c_ip) |
      | earliest_bucket_count_ip | tag:sample04061424_apachesample_dawn \| bucket timestamp span=1h as ts \| stats count(apache.clientip) as c_ip by ts \| stats earliest(c_ip) |
      | bucket_stats_es | starttime=\"now/d\" endtime=\"now/d+7h\" tag:sample04061424_apachesample_dawn \| bucket timestamp span=1h as ts \| stats es(apache.status) by ts |
      | index_task_search | index=schedule schedule_name:bar_resp_len \| bucket timestamp span=1h as ts \| stats max(max_resp_len) as max_resp_len_hour by ts |
      | rollingstd | starttime=\"now/d\" endtime=\"now/d+13h\" tag:sample04061424_apachesample_dawn\| bucket timestamp span=1h as ts \| stats avg(apache.resp_len) as avg_resp_len by ts  \| rollingstd avg_resp_len,10 as resp_len_rolling_std |
      | makecontinuous_sample | \| makeresults count=2 \| streamstats count() as cnt \| eval time=case(cnt==2,relative_time(now(),\"+1d\"), cnt==1, now()) \| makecontinuous time span=3h |
      | rate_sample | tag:top_info \| eval retpath=json.disk.path \| eval retused=json.disk.used \| eval used=tolong(retused) \| bucket timestamp span=10m as timestamp \| table used,retpath,timestamp \| stats rate(used) by timestamp,retpath |
      | timechart_sample | starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424_display \| timechart count() \| eval f_time = formatdate(_time,\"HH:mm:ss\") |
      | timechart_sample_count_span1h | starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424_display \| timechart span=1h max(apache.resp_len) as cnt |
      | timechart_sample_count_span1h_bystatus | starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424_display \| timechart span=1h count() as cnt by apache.status |
      | timechart_sample_avg_span1h | starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424_display \| timechart span=1h avg(apache.resp_len) as avg_len |
      | timechart_sep_byip_span1h | starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424_chart AND ('apache.clientip':221.226.97.92 OR 'apache.clientip':117.136.79.162)  \| timechart sep=\":\" span=1h count() as cnt max(apache.resp_len) by apache.clientip |
      | timechart_sep_bydomain_span1h | starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424_chart AND ('apache.clientip':221.226.97.92 OR 'apache.clientip':117.136.79.162)  \| timechart sep=\":\" span=1h count() as cnt max(apache.resp_len) by apache.referer_domain |
      | timechart_sep_bystatus_span1h | starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424_display \| timechart sep=\":\" span=1h count() as cnt max(apache.resp_len) by apache.status |
      | timechart_format | starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424_display \| timechart sep=\"-sep分格-\" format=\"$VAL\|分格2\|$AGG\" span=1h count() as cnt by apache.status |
      | timechart_format1 | starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424_display \| timechart sep=\"-sep分格-\" format=\"$VAL\|分格2\|$AGG\" span=1h count() as cnt max(apache.resp_len) as ma by apache.status |
      | timechart_limit_by_one | starttime=\"now/d\" endtime=\"now/d+24h\" tag:\"sample04061424_display\" \| timechart span=1h limit=5 count() max(apache.resp_len) by apache.status |
      | timechart_limit_by_two | starttime=\"now/d\" endtime=\"now/d+24h\" tag:\"sample04061424_display\" \| timechart span=1h limit=5 count() max(apache.resp_len) by apache.status, apache.method |
      | timechart_bins_sample | starttime=\"now/d\" endtime=\"now/d+24h\" tag:\"sample04061424_display\" \| timechart bins=10 span=30m count() |
      | timechart_span30m_bins3 | starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424_display \| timechart span=30m bins=3 count() max(apache.resp_len) by apache.status |
      | timechart_minspan2h_bins40 | starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424_display \| timechart minspan=2h bins=40 count() |
      | timechart_minspan30m_bins40 | starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424_display \| timechart minspan=30m bins=40 count() |
      | timechart_minspan30m_bins4 | starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424_display \| timechart minspan=30m bins=4 count() |
      | timechart_bins100_bymethod | starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424_display \| timechart span=1h bins=100 count() max(apache.resp_len) by apache.method |
      | timechart_startindex_endindex | starttime=\"now/d\" endtime=\"now/d+24h\" tag:\"sample04061424_display\" \| timechart bins=8 span=30m startindex=1 endindex=8 count() max(apache.status) |
      | timechart_startindex_endindex1 | starttime=\"now/d\" endtime=\"now/d+24h\" tag:\"sample04061424_display\" \| timechart bins=10 span=30m startindex=1 endindex=8 count() max(apache.status) by apache.resp_len |
      | timechart_sample_all_params | starttime=\"now/d\" endtime=\"now/d+24h\" tag:\"sample04061424_display\" \| timechart sep=\":\" format=\"$VAL--$AGG\" cont=true span=30m bins=100 startindex=1 endindex=8 limit=5 count() min(apache.resp_len) by apache.status |
      | timechart_sample_all_params1 | starttime=\"now/d\" endtime=\"now/d+24h\" tag:\"sample04061424\"  \| eval x=len(tostring(apache.request_path)) \| timechart sep=\",\" format=\"$VAL**$AGG\" cont=true limit=5 bins=10 minspan=1m span=10m max(x) as ma count() as cnt \| where ma>0 && cnt>0 |
      | timechart_cont_true | starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424_display \| timechart cont=true span=1h count() |
      | timechart_cont_false | starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424_display \| timechart cont=false span=1h count() |
      | timechart_cont_bystatus_true | starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424_display \| timechart sep=\":\" span=30m cont=false count() by apache.status |
      | timechart_cont_bystatus_false | starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424_display \| timechart sep=\":\" span=30m cont=false count() by apache.status |
      | timechart_rendertype_line | starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424_chart \| timechart sep=\",\" format=\"$VAL**$AGG\" limit=3 rendertype=\"line\" bins=200 minspan=1m span=10m max(apache.resp_len) as ma count() as cnt by apache.clientip |
      | timechart_rendertype_area | starttime=\"now/d\" endtime=\"now/d+24h\" tag:\"sample04061424_display\" \| timechart sep=\"-sep分格-\" format=\"$VAL-分格2-$AGG\" cont=true span=30m bins=100 startindex=1 endindex=8 limit=5 rendertype=\"area\"  count() min(apache.resp_len) by apache.status |
      | timechart_rendertype_scatter | starttime=\"now/d\" endtime=\"now/d+24h\" tag:\"sample04061424_display\" \| timechart sep=\"-sep分格-\" format=\"$VAL-分格2-$AGG\" cont=true span=30m bins=100 startindex=1 endindex=8 limit=5 rendertype=\"scatter\"  count() min(apache.resp_len) by apache.status |
      | timechart_rendertype_column | starttime=\"now/d\" endtime=\"now/d+24h\" tag:\"sample04061424_display\" \| timechart sep=\"-sep分格-\" format=\"$VAL-分格2-$AGG\" cont=true span=30m bins=100 startindex=1 endindex=8 limit=5 rendertype=\"column\" count() min(apache.resp_len) by apache.status |
      | timechart_timewrap_8h | starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424_display \| timechart span=1h count() as cnt \| timewrap 8h |
      | timechart_timewrap_10h | starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424_display \| timechart span=1h count() as cnt \| timewrap 10h |
      | timechart_timewrap_series_short | starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424_display \| timechart span=1h count() as cnt \| timewrap 8h series=short |
      | timechart_timewrap_timeformat | starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424_display \| timechart span=1h count() as cnt \| timewrap 8h series=exact timeformat=\"H\" |
      | timechart_timewrap_align_end | starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424_display \| timechart span=1h count() as cnt \| timewrap 8h align=end |
      | timechart_timewrap_align_now | starttime=\"now/d\" endtime=\"now/d+24h\"  tag:sample04061424_display \| timechart span=1h count() as cnt \| timewrap 8h align=now |
      | timechart_timewrap_formatedate | starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424_display \| timechart span=1h count() as cnt \| timewrap 8h \| eval f_time = formatdate(_time,\"HH:mm:ss\") |
      | timechart_span12h_timewrap_1d | starttime=\"now-7d\" endtime=\"now/d+24h\" tag:sample04061424_display \| timechart span=12h count() as cnt  \| timewrap 1d |
      | timechart_span1h_timewrap_1d | starttime=\"now-3d\" endtime=\"now/d+24h\" tag:sample04061424_display \| timechart span=1h count() as cnt \| timewrap 1d |
      | timechart_span1h_timewrap_3d | starttime=\"now-7d\" endtime=\"now/d+24h\" tag:sample04061424_display \| timechart span=1h count() as cnt max(apache.resp_len) as max_len by apache.status \| timewrap 3d |

Feature: SPL other

  Background:
    Given open the "splSearch.SearchPage" page for uri "/search/"
    And I wait for element "SearchStatus" change text to "搜索完成!"

  @v33other
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
      | chart_sample_noparam | starttime=\"now/d\" endtime=\"now/d+24h\" tag:\"sample04061424\" \| chart max(apache.status) as ma count() as cnt |
      | chart_sample_over_status | starttime=\"now/d\" endtime=\"now/d+24h\" tag:\"sample04061424\" \| chart count() as cnt over apache.status span=\"50\" |
      | chart_sample_over_resp_len | starttime=\"now/d\" endtime=\"now/d+24h\" tag:\"sample04061424\" \| chart count() over apache.resp_len span=\"500\" by apache.method |
      | chart_over_timestamp_span1h | starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424_display  \| chart count() over timestamp span=\"1h\" |
      | chart_over_timestamp_span1d | starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424_display \| chart count() over timestamp span=\"1d\" |
      | chart_cont_false_overstatus_span50 | starttime=\"now/d\" endtime=\"now/d+24h\" tag:\"sample04061424\" \| chart cont=false count() as cnt over apache.status span=\"50\" |
      | chart_cont_true_overstatus_span50 | starttime=\"now/d\" endtime=\"now/d+24h\" tag:\"sample04061424\" \| chart cont=true count() as cnt over apache.status span=\"50\" |
      | chart_cont_false_overstatus_span50_bymethod | starttime=\"now/d\" endtime=\"now/d+24h\" tag:\"sample04061424\" \| chart cont=false count() as cnt over apache.status span=\"50\" by apache.method |
      | chart_cont_true_overstatus_span50_bymethod | starttime=\"now/d\" endtime=\"now/d+24h\" tag:\"sample04061424\" \| chart cont=true count() as cnt over apache.status span=\"50\" by apache.method |
      | chart_bins3_span1h | starttime=\"now/d\" endtime=\"now/d+24h\" tag:\"sample04061424_display\" \| chart count() over timestamp bins=3 span=\"1h\" |
      | chart_bins24_span1h | starttime=\"now/d\" endtime=\"now/d+24h\" tag:\"sample04061424_display\" \| chart count() over timestamp bins=24 span=\"1h\" |
      | chart_overresplen_bins10_span50 | starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424 \| chart sep=\"-sep分格-\" format=\"$AGG\|format分格\|$VAL\" cont=true count() as cnt over apache.resp_len bins=10 span=\"50\" |
      | chart_sep_sample | starttime=\"now/d\" endtime=\"now/d+24h\" tag:\"sample04061424_display\" \| chart sep=\"-sep分格-\" count() max(apache.resp_len) over timestamp span=\"1h\" by apache.status |
      | chart_sep_format | starttime=\"now/d\" endtime=\"now/d+24h\" tag:\"sample04061424_display\" \| chart sep=\"-sep分格-\" format=\"$AGG\|format分格\|$VAL\" count() max(apache.resp_len) over timestamp span=\"1h\" by apache.status |
      | chart_sep_format1 | starttime=\"now/d\" endtime=\"now/d+24h\" tag:\"sample04061424_display\" \| chart sep=\"-sep分格-\" format=\"$VAL\|format分格\|$AGG\" count() max(apache.resp_len) over timestamp span=\"1h\" by apache.status |
      | chart_bins10_span30m | starttime=\"now/d\" endtime=\"now/d+24h\" tag:\"sample04061424_display\" \| chart count() max(apache.resp_len) over timestamp bins=10 span=\"30m\" |
      | chart_bins10_span30m_startindex2_endindex7 | starttime=\"now/d\" endtime=\"now/d+24h\" tag:\"sample04061424_display\" \| chart count() max(apache.resp_len) over timestamp bins=10 span=\"30m\" |
      | chart_bins10_span30m_startindex4_endindex7 | starttime=\"now/d\" endtime=\"now/d+24h\" tag:\"sample04061424_display\" \| chart count() max(apache.resp_len) over timestamp bins=10 span=\"1h\" startindex=4 endindex=7 |
      | chart_bins10_span30m_startindex4_endindex7_bystatus | starttime=\"now/d\" endtime=\"now/d+24h\" tag:\"sample04061424_display\" \| chart count() max(apache.resp_len) over timestamp bins=10 span=\"1h\" startindex=4 endindex=7 by apache.status |
      | chart_limit_one_field | starttime=\"now/d\" endtime=\"now/d+24h\" tag:\"sample04061424_display\" \| chart limit=5 count() max(apache.resp_len) over timestamp span=\"1h\" by apache.status |
      | chart_limit_two_field | starttime=\"now/d\" endtime=\"now/d+24h\" tag:\"sample04061424_display\" \| chart limit=5 count() max(apache.resp_len) over timestamp span=\"1h\"  by apache.status, apache.method |
      | chart_multi_params_by_clientip | starttime=\"now/d\" endtime=\"now/d+24h\" tag:\"sample04061424_display\" \| chart sep=\"-sep分格-\" format=\"$AGG\|format分格\|$VAL\" limit=5 cont=false count() as cnt max(apache.resp_len) over timestamp span=\"1h\" bins=4 startindex=1 endindex=4 by apache.clientip bins=3 |
      | chart_multi_params_by_status_bins1 | starttime=\"now/d\" endtime=\"now/d+24h\" tag:\"sample04061424_display\" \| chart sep=\"-sep分格-\" format=\"$AGG\|format分格\|$VAL\" limit=5 cont=false count() as cnt max(apache.resp_len) over timestamp span=\"1h\" bins=4 startindex=1 endindex=4 by apache.status bins=1 |
      | chart_multi_params_by_resplen_bins3 | starttime=\"now/d\" endtime=\"now/d+24h\" tag:\"sample04061424_display\" \| chart sep=\"-sep分格-\" format=\"$AGG\|format分格\|$VAL\" limit=5 cont=false count() as cnt max(apache.status) over timestamp span=\"1h\" bins=4 startindex=1 endindex=4 by apache.resp_len bins=3 |
      | chart_multi_params_by_resplen_span1000_bins5_endindex2 | starttime=\"now/d\" endtime=\"now/d+24h\" tag:\"sample04061424_display\" \| chart count() over apache.status span=\"200\" by apache.resp_len span=\"1000\"  bins=5  startindex=0 endindex=2 |
      | chart_rendertype_pie_overstatus_contfalse_span50 | starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424_chart \| chart cont=false rendertype=\"pie\" count(apache.x_forward) as cnt over apache.status span=\"50\" |
      | chart_rendertype_pie_overdomain | starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424_display \| chart cont=true rendertype=\"pie\" count(apache.resp_len) as cnt over apache.referer_domain |
      | chart_rendertype_pie_overclientip | starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424 \| chart cont=true rendertype=\"pie\" count(apache.resp_len) as cnt over apache.clientip |
      | chart_rendertype_rose_overresplen_span500_contfalse | starttime=\"now/d\" endtime=\"now/d+24h\" tag:\"sample04061424\" \| chart cont=false rendertype=\"pie\" count(apache.clientip) as cnt over apache.resp_len span=\"500\" |
      | chart_rendertype_rose_overresplen_span500 | starttime=\"now/d\" endtime=\"now/d+24h\" tag:\"sample04061424\" \| chart cont=false rendertype=\"rose\" min(apache.status) as min_status over apache.resp_len span=\"500\" |
      | chart_rendertype_bar_overresplen_span500_limit20 | starttime=\"now/d\" endtime=\"now/d+24h\" tag:\"sample04061424\" \| chart  cont=false rendertype=\"bar\" min(apache.status) as min_status over apache.resp_len span=\"500\" \| limit 20 |
      | chart_rendertype_sunburst_overresplen_span500_bydomain | starttime=\"now/d\" endtime=\"now/d+24h\" tag:\"sample04061424\" \| chart sep=\"无效sep\" format=\"$AGG\|format分格\|$VAL\" cont=false rendertype=\"sunburst\" avg(apache.status) as avg_status over apache.resp_len span=\"500\" by apache.referer_domain |
      | chart_rendertype_sunburst_overresplen_span500_bydomain_limit3 | starttime=\"now/d\" endtime=\"now/d+24h\" tag:\"sample04061424\" \| chart sep=\"无效sep\" format=\"$AGG\|format分格\|$VAL\" cont=false rendertype=\"sunburst\" avg(apache.status) as avg_status over apache.resp_len span=\"500\" by apache.referer_domain \| limit 3 |
      | chart_rendertype_sankey_overresplen_span500_byip | tag:\"sample04061424\" AND (apache.clientip:2* OR apache.clientip:8* ) \| chart sep=\"无效sep\" format=\"$AGG\|format分格\|$VAL\" cont=false rendertype=\"sankey\" count() as cnt over apache.resp_len span=\"1000\" by apache.clientip |
      | chart_rendertype_force_overresplen_span500_byip | tag:\"sample04061424\" AND (apache.clientip:2* OR apache.clientip:8* ) \| chart sep=\"无效sep\" format=\"$AGG\|format分格\|$VAL\" cont=false rendertype=\"force\" count() as cnt over apache.resp_len span=\"1000\" by apache.clientip |
      | chart_rendertype_chord_overresplen_span500_byip | tag:\"sample04061424\" AND (apache.clientip:2* OR apache.clientip:8* ) \| chart sep=\"无效sep\" format=\"$AGG\|format分格\|$VAL\" cont=false rendertype=\"chord\" count() as cnt over apache.resp_len span=\"1000\" by apache.clientip |
      | chart_heatmap_overgeo | tag:sample04061424_display \| chart rendertype=\"heatmap\" count() as cnt by apache.geo.city |
      | chart_wordcloud_overresplen_span100 | tag:\"sample04061424\" \| chart sep=\"无效sep\" format=\"$VAL\|分格2\|$AGG\" cont=false rendertype=\"wordcloud\" count() as cnt over apache.resp_len span=\"100\" \| limit 10 |
      | sparkline_max2len_span1h | starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424_display AND apache.referer_domain:tnt.mr2z7.cn \| stats sparkline(max(apache.resp_len),1h) as tt by apache.referer_domain |
      | sparkline_count2forward_span1h | starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424_display AND ('apache.referer_domain':tnt.mr2z7.cn) OR ('apache.referer_domain':hl.16e5au.cn) OR ('apache.referer_domain':shdating.dfllg.cn) OR ('apache.referer_domain':sss.cv294.cn) \| stats sparkline(count(apache.x_forward),1h) as count_ by apache.referer_domain \| rename apache.referer_domain as \"主要域名\", count_ as \"访问量变化\" |
      | sparkline_avg2len_span60s | starttime=\"now/d\" endtime=\"now/d+10m\" tag:sample04061424_display AND ('apache.referer_domain':tnt.mr2z7.cn) OR ('apache.referer_domain':hl.16e5au.cn) OR ('apache.referer_domain':shdating.dfllg.cn) OR ('apache.referer_domain':sss.cv294.cn) \| stats sparkline(avg(apache.resp_len),60s) as count_ by apache.referer_domain \| rename apache.referer_domain as \"主要域名\", count_ as \"访问量变化\" |
      | sparkline_min2status_span1d | starttime=\"-7d\" endtime=\"now/d+24h\" tag:sample04061424_display AND ('apache.referer_domain':tnt.mr2z7.cn) OR ('apache.referer_domain':hl.16e5au.cn) OR ('apache.referer_domain':shdating.dfllg.cn) OR ('apache.referer_domain':sss.cv294.cn) \| stats sparkline(min(apache.status),1d) as count_ by apache.referer_domain \| rename apache.referer_domain as \"主要域名\", count_ as \"访问量变化\" |
      | sparkline_sum2status_span1w | starttime=\"-30d\" endtime=\"now/d+24h\" tag:sample04061424_display AND ('apache.referer_domain':tnt.mr2z7.cn) OR ('apache.referer_domain':hl.16e5au.cn) OR ('apache.referer_domain':shdating.dfllg.cn) OR ('apache.referer_domain':sss.cv294.cn) \| stats sparkline(sum(apache.status),1w) as count_ by apache.referer_domain \| rename apache.referer_domain as \"主要域名\", count_ as \"访问量变化\" |
      | sparkline_distinct_count2ip_span1h | starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424_display AND ('apache.referer_domain':tnt.mr2z7.cn) OR ('apache.referer_domain':hl.16e5au.cn) OR ('apache.referer_domain':shdating.dfllg.cn) OR ('apache.referer_domain':sss.cv294.cn) \| stats sparkline(distinct_count(apache.clientip),60m) as count_ by apache.referer_domain \| rename apache.referer_domain as \"主要域名\", count_ as \"访问量变化\" |
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
      | bucket_ts_stats_sum_eval | (logtype:apache AND tag:\"sample04061424_chart\") \| bucket timestamp span=1m as ts \| stats sum(apache.resp_len) as sum_len by ts,apache.status \| eval time=formatdate(ts,\"HH:mm:ss\") |
      | bucket_stats_eval_movingavg | starttime=\"now/d\" endtime=\"now/d+24h\"  tag:\"sample04061424_chart\"\| bucket timestamp span=1m as ts \| stats sum(apache.resp_len) as sum_resp_len by ts \| eval time=formatdate(ts,\"HH:mm:ss\") \| movingavg sum_resp_len,3 as moving_avg_resp_len |
      | bucket_1h_stats_count | starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424_chart \| bucket timestamp span=1h as ts \| stats count(apache.clientip) as c_ip by ts |
      | autoregress_sample | starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424_apachesample_dawn \| bucket timestamp span=30m as ts \| stats count(appname) as count_app by ts \| eval time=formatdate(ts,\"HH:mm:ss\") \| autoregress count_app p=6 |
      | starttime_bucket_ts_sum_eval | starttime=\"now/d\" endtime=\"now/d+24h\" tag:\"sample04061424_chart\" \| bucket timestamp span=1h as ts \| stats sum(apache.resp_len) as sum_len by ts \| eval time=formatdate(ts,\"HH:mm:ss\") |
      | starttime_bucket_ts_count_eval_formatdate | starttime=\"now/d\" endtime=\"now/d+24h\" tag:\"sample04061424_chart\" \| bucket timestamp span=1h as ts \| stats count(apache.resp_len) as sum_len by ts \| eval time=formatdate(ts,\"HH:mm:ss\") |
      | bucket_stats_autoregress | starttime=\"now/d\" endtime=\"now/d+24h\" tag:\"sample04061424_chart\" \| bucket timestamp span=1h as ts \| stats count() as count_app by ts \| eval time=formatdate(ts,\"HH:mm:ss\") \| autoregress count_app p=3 |
      | schedule_append_bucket_count_geoisp | starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424_apachesample_dawn \| bucket timestamp span=1h as ts \| stats count(apache.geo.isp) as count_ by apache.geo.isp, ts \| eval date_hour=tolong(formatdate(ts,\"HH\")) \| rename apache.geo.isp as group_line \| sort by +date_hour, +group_line \| append [[index=schedule starttime=\"-2d\" endtime=\"-d/d\" schedule_name:pip_task\|stats avg(ip_count) as count_ by date_hour\|eval group_line=\"base_line\"\|sort by +date_hour,+group_line]] |
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
      | bucket_stats_es | starttime=\"now/d\" endtime=\"now/d+7h\" tag:sample04061424_apachesample_dawn \| bucket timestamp span=1h as ts \| stats es(apache.status) by ts |
      | index_task_search | index=schedule schedule_name:bar_resp_len \| bucket timestamp span=1h as ts \| stats max(max_resp_len) as max_resp_len_hour by ts |
      | bug_onetag_sort_timestamp1 | index=* starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424* AND logtype:apache  \| sort by timestamp \| table tag, apache.clientip |
      | bug_onetag_sort_timestamp2 | index=* starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424* AND logtype:apache  \| sort by +timestamp \| table tag, apache.clientip |
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
      | bug_count_ip_sort | tag:\"sample04061424\" \| stats count(apache.status) as status by apache.clientip \| sort by +status |
      | bug_formatdate_Asia | tag:\"sample04061424_apachesample_dawn\" \| eval new_time = 1552237948000 \| eval f_timestamp = formatdate(new_time, \"yyyy-MM-dd HH:mm:ss.SSS\", \"Asia/Shanghai\") \| table f_timestamp,new_time |
      | bug_now_where_count_app | starttime=\"now/d\" endtime=\"now\" tag:\"sample04061424_apachesample_dawn\" \| bucket timestamp span=10m as ts\|stats count(appname) as count_app by ts \| eval time=formatdate(ts,\"HH:mm:ss\")\| where count_app>0 |
      | bucket_formatdate_where_count_larger3 | starttime=\"now/d\" endtime=\"now\" tag:\"sample04061424_apachesample_dawn\" \| bucket timestamp span=10m as ts\|stats count(appname) as count_app by ts\| eval time_dis=formatdate(now()-ts, \"HH:mm:ss\") \| where count_app>3 |
      | bug_schedul_count1 | index=schedule schedule_name:xxtest AND count_1:* |
      | bug_schedul_count2 | index=schedule schedule_name:xxtest AND apache.status:>200 \| stats count() by apache.status |
      | bug_nodata_count_dc | tag:no \| stats count() as cnt by apache.status \| stats dc(cnt) |
      | bug_count_eval_chinese | tag:\"sample04061424\" \| stats count() as cnt \| eval ttt = cnt + \"  试试中文下载内容，⚠️\" |
      | timechart_sample | starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424_display \| timechart count() \| eval f_time = formatdate(_time,\"HH:mm:SS\") |
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
      | timechart_timewrap_align_now | starttime=\"now/d\" endtime=\"now\" tag:sample04061424_display \| timechart span=1h count() as cnt \| timewrap 8h align=now |
      | timechart_timewrap_formatedate | starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424_display \| timechart span=1h count() as cnt \| timewrap 8h \| eval f_time = formatdate(_time,\"HH:mm:SS\") |
      | timechart_span12h_timewrap_1d | starttime=\"now-7d\" endtime=\"now/d+24h\" tag:sample04061424_display \| timechart span=12h count() as cnt  \| timewrap 1d |
      | timechart_span1h_timewrap_1d | starttime=\"now-3d\" endtime=\"now/d+24h\" tag:sample04061424_display \| timechart span=1h count() as cnt \| timewrap 1d |
      | timechart_span1h_timewrap_3d | starttime=\"now-7d\" endtime=\"now/d+24h\" tag:sample04061424_display \| timechart span=1h count() as cnt max(apache.resp_len) as max_len by apache.status \| timewrap 3d |
      | 防火墙_hillstone事件趋势图 | starttime=\"-1d/d\" endtime=\"now/d\" * appname:firewall tag:hillstone\|bucket timestamp span=30m as ts \| stats count() as total by ts |
      | 防火墙_hillstone不同模块日志数量 | starttime=\"-1d/d\" endtime=\"now/d\" * appname:firewall tag:hillstone\| stats count() as total by firewall.module \| rename firewall.module as \"模块\",total as\"数量\" |
      | 防火墙_hillstone不同级别日志数量 | starttime=\"-1d/d\" endtime=\"now/d\" * appname:firewall tag:hillstone\| stats count() as total by firewall.level \| rename firewall.level as \"级别\",total as\"数量\" |
      | 策略拒绝事件趋势图 | starttime=\"-1d/d\" endtime=\"now/d\" tag:hillstone AND policy\ deny \|bucket timestamp span=5m as ts \| stats count() as total by ts |
      | 拒绝策略事件占比 | starttime=\"-1d/d\" endtime=\"now/d\" tag:hillstone AND policy\ deny \| stats count() as total by firewall.flow.policy\| rename total as \"事件数量\",firewall.flow.policy as \"拒绝策略\" |
      | 被策略拒绝源IP TOP10 | starttime=\"-1d/d\" endtime=\"now/d\" tag:hillstone AND policy\ deny \|top 10 firewall.flow.src_ip \|rename firewall.flow.src_ip as \"被策略拒绝源IP\" |
      | 策略拒绝连接协议占比 | starttime=\"-1d/d\" endtime=\"now/d\" tag:hillstone AND policy\ deny \|stats count() as total by firewall.flow.proto \| rename total as \"事件数量\",firewall.flow.proto as \"协议\" |
      | 策略拒绝连接接口占比 | starttime=\"-1d/d\" endtime=\"now/d\" tag:hillstone AND policy\ deny \|stats count() as total by firewall.flow.interface \| rename total as \"事件数量\",firewall.flow.interface as \"接口\" |
      | 策略拒绝访问目的城市TOP10 | starttime=\"-1d/d\" endtime=\"now/d\" tag:hillstone AND policy\ deny \|top 10 firewall.flow.geo.city \|rename firewall.flow.geo.city as \"目的城市\" |
      | 策略拒绝主要源IP的引力图 | starttime=\"-1d/d\" endtime=\"now/d\" tag:hillstone AND policy\ deny \|stats count() as total by firewall.flow.src_ip,firewall.flow.dest_ip \| limit 50 |
      | 连接关闭原因分析 | starttime=\"-1d/d\" endtime=\"now/d\" tag:hillstone session end \|stats count() as total by firewall.flow.reason |
      | 连接接收字节数趋势 | starttime=\"-1d/d\" endtime=\"now/d\" tag:hillstone session end \| bucket timestamp span=30m as ts \|eval rcv_=tolong(firewall.flow.rcvbyte) \|stats sum(rcv_) as rcvbyte by hostname,ts  \| rename rcvbyte as \"接收字节数\" |
      | 连接发送字节数趋势 | starttime=\"-1d/d\" endtime=\"now/d\" tag:hillstone session end \| bucket timestamp span=30m as ts \|eval sbyte_=tolong(firewall.flow.sbyte) \|stats sum(sbyte_) as sendbyte by hostname,ts  \| rename sendbyte as \"发送字节数\" |
      | 连接应用事件数量TOP10 | starttime=\"-1d/d\" endtime=\"now/d\" tag:hillstone session end \|stats count() as total by firewall.flow.application \|limit 10 \|rename firewall.flow.application as \"应用\",total as \"事件数量\" |
      | 连接协议分析 | starttime=\"-1d/d\" endtime=\"now/d\" tag:hillstone session end \|stats count() as total by firewall.flow.proto |
      | 放行策略命中数排名 | starttime=\"-1d/d\" endtime=\"now/d\" tag:hillstone session end \|stats count() as total by firewall.flow.policy |
      | 连接目的城市分布 | starttime=\"-1d/d\" endtime=\"now/d\" (tag:hillstone session end) AND tag:hillstone \|stats count() as total by firewall.flow.geo.city |
      | 转换目的地址对比 | starttime=\"-1d/d\" endtime=\"now/d\" (tag:hillstone NAT) AND tag:hillstone \|stats count() by firewall.flow.snat_ip |
      | NAT连接城市词云图 | starttime=\"-1d/d\" endtime=\"now/d\" (tag:hillstone session end) AND tag:hillstone\|stats count() as total by firewall.flow.geo.city |
      | NAT协议统计 | starttime=\"-1d/d\" endtime=\"now/d\" (tag:hillstone NAT) AND tag:hillstone \|stats count() as total by firewall.flow.proto |
      | NAT规则命中数 | starttime=\"-1d/d\" endtime=\"now/d\" (tag:hillstone NAT) AND tag:hillstone \|stats count() as total by firewall.flow.rule |
      | 事件数最多应用接收字节趋势图 | starttime=\"-1d/d\" endtime=\"now/d\" (tag:hillstone session end) AND tag:hillstone \|eval rcv_=tolong(firewall.flow.rcvbyte) \| stats sparkline(sum(rcv_),30m) as rcv_byte_trend,count() as count_ by firewall.flow.application \|rename firewall.flow.application as \"应用\",rcv_byte_trend as \"接收字节趋势\",count_ as \"事件数量\"\|limit 10 |
      | 接收字节最多应用事件趋势图 | starttime=\"-1d/d\" endtime=\"now/d\" (tag:hillstone session end) AND tag:hillstone \|eval rcv_=tolong(firewall.flow.rcvbyte) \| stats sparkline(count(),30m) as count_,sum(rcv_) as rcvbyte by firewall.flow.application \|sort by rcvbyte  \|rename firewall.flow.application as \"应用\",rcvbyte as \"接收字节\",count_ as \"事件数量\"\| limit 10 |
      | AAA认证模块 | starttime=\"-1d/d\" endtime=\"now/d\" (tag:hillstone AAA 结果) AND tag:hillstone \|parse field=firewall.flow \"回复(?<AAA_module>\w+)模块\S+(?<AAA_user>\S+)认证请求，结果：(?<AAA_result>.*)\" \|stats count() by AAA_module |
      | AAA认证结果 | starttime=\"-1d/d\" endtime=\"now/d\" (tag:hillstone AAA 结果) AND tag:hillstone \|parse field=firewall.flow \"回复(?<AAA_module>\w+)模块\S+(?<AAA_user>\S+)认证请求，结果：(?<AAA_result>.*)\" \|stats count() as total by AAA_result\|rename AAA_result as \"认证结果\",total as  \"事件数量\" |
      | AAA认证失败日志列表 | starttime=\"-1d/d\" endtime=\"now/d\" (tag:hillstone AAA 结果 失败) AND tag:hillstone \|parse field=firewall.flow \"回复(?<AAA_module>\w+)模块\S+(?<AAA_user>\S+)认证请求，结果：(?<AAA_result>.*)\" \|table AAA_module,AAA_user,AAA_result |
      | 过去一天添加用户组数量 | starttime=\"-1d/d\" endtime=\"now/d\" (tag:hillstone AAA 添加用户组) AND tag:hillstone \|stats count() as total |
      | 最近一天VPN登录地点次数列表 | starttime=\"-1d/d\" endtime=\"now/d\" (tag:hillstone VPN 登录) AND tag:hillstone \|stats count() as count_ by firewall.flow.clientip.geo.province,firewall.flow.clientip.geo.city\|rename firewall.flow.clientip.geo.province as \"省份\", firewall.flow.clientip.geo.city as \"城市\",count_ as \"登录次数\" |
      | IPS威胁类型 | starttime=\"-1d/d\" endtime=\"now/d\" (tag:hillstone IPS) AND tag:hillstone \|stats count() as total by 'firewall.flow.kvs.威胁类型' |
      | IPS攻击应用 | starttime=\"-1d/d\" endtime=\"now/d\" (tag:hillstone IPS) AND tag:hillstone \|stats count() as total by 'firewall.flow.kvs.应用/协议' |
      | IPS攻击子类型 | starttime=\"-1d/d\" endtime=\"now/d\" (tag:hillstone IPS) AND tag:hillstone \|stats count() as total by 'firewall.flow.kvs.威胁子类型' |
      | IPS威胁策略命中数 | starttime=\"-1d/d\" endtime=\"now/d\" (tag:hillstone IPS) AND tag:hillstone \|stats count() as total by 'firewall.flow.kvs.策略号' |
      | IPS攻击变化趋势 | starttime=\"-1d/d\" endtime=\"now/d\" (tag:hillstone IPS) AND tag:hillstone \|bucket timestamp span=30m as ts \| stats count() as count_ by  ts |
      | 源IP事件数排名 | starttime=\"-1d/d\" endtime=\"now/d\" (tag:hillstone IPS) AND tag:hillstone \| top 10 firewall.flow.attack_ip |
      | 攻击事件来源端口 | starttime=\"-1d/d\" endtime=\"now/d\" (tag:hillstone IPS) AND tag:hillstone \|stats count() as total by firewall.flow.attack_interface |
      | 攻击事件目的端口 | starttime=\"-1d/d\" endtime=\"now/d\" (tag:hillstone IPS) AND tag:hillstone \|stats count() as total by firewall.flow.victim_interface |
      | 威胁TOP10 | starttime=\"-1d/d\" endtime=\"now/d\" (tag:hillstone IPS) AND tag:hillstone \|stats count() as total by 'firewall.flow.kvs.威胁名称' \| limit 10 |
      | 不同攻击的变化趋势 | starttime=\"-1d/d\" endtime=\"now/d\" (tag:hillstone IPS) AND tag:hillstone \|bucket timestamp span=30m as ts \| stats count() as count_ by ts,'firewall.flow.kvs.威胁子类型' |
      | 不同级别攻击趋势图 | starttime=\"-1d/d\" endtime=\"now/d\" (tag:hillstone IPS) AND tag:hillstone \|bucket timestamp span=30m as ts \| stats count() as count_ by ts,'firewall.flow.kvs.威胁级别' |
      | 被攻击最多国家攻击趋势图 | starttime=\"-1d/d\" endtime=\"now/d\" (tag:hillstone IPS) AND tag:hillstone [[(* IPS) AND tag:hillstone\|top 10 firewall.flow.victim_ip.geo.country\| fields firewall.flow.victim_ip.geo.country]] \|bucket timestamp span=30m as ts \| stats count() by ts, firewall.flow.victim_ip.geo.country |
      | VPN登录趋势图 | starttime=\"-1d/d\" endtime=\"now/d\" (tag:hillstone VPN 登录) AND tag:hillstone \|bucket timestamp span=30m as ts \|stats count() as total by ts |
      | TOP10源IP攻击情况 | starttime=\"-1d/d\" endtime=\"now/d\" appname:firewall AND tag:hillstone IPS [[appname:firewall AND tag:hillstone IPS \| top 10 firewall.flow.attack_ip\| fields firewall.flow.attack_ip]] \|stats count() as total by firewall.flow.attack_ip,firewall.flow.victim_ip.geo.ip |
      | 日志不同优先级分析 | starttime=\"-1d/d\" endtime=\"now/d\" appname:firewall AND tag:hillstone \|stats count() as total by firewall.severity |

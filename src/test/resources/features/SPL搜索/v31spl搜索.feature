
Feature: SPL语句执行

  Background:
    Given open the "splSearch.SearchPage" page for uri "/search/"

#  @smoke @spl @all
  @v31tcspl
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
| geostats_sample_count | tag:vendors_461 \| geostats latfield=vendors.VendorLatitude longfield=vendors.VendorLongitude count() as cnt |
| geostats_outputlatfield_outputlongfield_count | tag:vendors_461 \| geostats outputlatfield=res_latfield outputlongfield=res_longfield latfield=vendors.VendorLatitude longfield=vendors.VendorLongitude count() as cnt |
| geostats_binspanlat_binspanlong_count | tag:vendors_461 \| geostats binspanlat=22.5 binspanlong=45.0 latfield=vendors.VendorLatitude longfield=vendors.VendorLongitude count() as cnt |
| geostats_maxzoomlevel_count_sample | tag:vendors_461 AND vendors.VendorCountry:China\ \(PRC\) \| geostats latfield=vendors.VendorLatitude longfield=vendors.VendorLongitude maxzoomlevel=1 count(vendors.Weight) |
| geostats_maxzoomlevel_count | tag:vendors_461 AND vendors.VendorCountry:China\ \(PRC\) \| geostats latfield=vendors.VendorLatitude longfield=vendors.VendorLongitude maxzoomlevel=3 count(vendors.Weight) |
| geostats_china_maxzoomlevel_count_by_province | tag:vendors_461 AND vendors.VendorCountry:China\ \(PRC\) \| geostats latfield=vendors.VendorLatitude longfield=vendors.VendorLongitude maxzoomlevel=3 count(vendors.Weight) by vendors.VendorStateProvince |
| geostats_maxzoomlevel_count_by_province | tag:vendors_461 \| geostats latfield=vendors.VendorLatitude longfield=vendors.VendorLongitude maxzoomlevel=3 count(vendors.Weight) by vendors.VendorStateProvince |
| geostats_china_maxzoomlevel_sum_by_province | tag:vendors_461 AND vendors.VendorCountry:China\ \(PRC\) \| geostats latfield=vendors.VendorLatitude longfield=vendors.VendorLongitude maxzoomlevel=3 sum(vendors.Weight)  by vendors.VendorStateProvince |
| geostats_maxzoomlevel_sum_by_province | tag:vendors_461 \| geostats latfield=vendors.VendorLatitude longfield=vendors.VendorLongitude maxzoomlevel=3 sum(vendors.Weight)  by vendors.VendorStateProvince |
| geostats_lookup | tag:vendors_461 \| lookup product_name /data/rizhiyi/share/prices.csv on vendor_sales.code=Code \| table product_name, vendor_sales.vendorid \| lookup Vendor,VendorID,VendorCity,VendorLatitude,VendorLongitude,VendorStateProvince,VendorCountry,Weight  /data/rizhiyi/share/vendors.csv on vendor_sales.vendorid=VendorID \| geostats latfield=VendorLatitude longfield=VendorLongitude maxzoomlevel=3 count() by product_name |
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
| inputlookup_sample | \| inputlookup input1.csv |
| inputlookup_start2 | \| inputlookup start = 2 input1.csv |
| inputlookup_start2_max2 | \| inputlookup start = 2 max=2 input1.csv |
| inputlookup_where_host | \| inputlookup input1.csv \| where host==\"192.168.2.56\" |
| inputlookup_count2host | \| inputlookup input1.csv \| stats count(host) |
| inputlookup_append_sub2avglen | \| inputlookup start =1 max=2 zidian.csv \| append [[ tag:sample04061424 \| stats avg(apache.resp_len) as avg_len, count(apache.resp_len) by apache.clientip \| limit 10]] \| sort by avg_len, apache.clientip |
| inputlookup_append2avglen_dedup1 | \| inputlookup zidian.csv  \| append [[ tag:sample04061424 \| stats avg(apache.resp_len) as avg_len, count(apache.resp_len) by apache.clientip \| limit 10]] \| sort by  apache.clientip \| dedup 1 apache.clientip |
| inputlookup_append_inputlookup | \| inputlookup zidian.csv \| append [[ l inputlookup zidian.csv]] |
| rename_sample | starttime=\"now/d\" endtime=\"now/d+24h\" tag:\"sample04061424\" \| rename apache.resp_len as resp_len, apache.status as status, apache.clientip as clientip \| table resp_len, status, clientip \| sort by resp_len, clientip, status |
| rename_apache_fields_sort | starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424 \| rename apache.* as test.* \| fields test.clientip, test.resp_len, test.status, test.x_forward, test.request_query \| sort by test.x_forward, test.clientip |
| rename_apache_table2all_fields2test_sort | starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424 \| rename apache.* as test.* \| table * \| fields test.* \| fields test.clientip, test.resp_len, test.status, test.x_forward, test.request_query \| sort by test.x_forward, test.clientip |
| rename_apache_limit_avg | starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424 \| rename apache.* as * \| limit 5 \| stats avg(resp_len) as avg_len by status |
| rename_apache_avg_bystatusip_sort | starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424 \| rename apache.* as * \| stats avg(resp_len) as avg_len by status, clientip \| sort by avg_len, status, clientip |
| rename_apache_tran2len_sort | starttime=\"now/d\" endtime=\"now/d+24h\" tag:\"sample04061424\" \| rename apache.* as * \| transaction resp_len \| sort by resp_len |
| rename_apache_bucket_span1h_count | starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424 \| rename apache.* as * \| bucket timestamp span=1h as ts \| stats count(clientip) as c_ip by ts |
| rename_multi_apache | tag:sample04061424 \| rename apache.geo.* as *, apache.r* as r*, apache.clientip as clientip \| table r*,clientip \| sort by resp_len, clientip, request_query |
| outputlookup_sample | index=*  tag:sample04061424 \| outputlookup outputlookup_sample.csv |
| outputlookup_createempty2false | tag:sample040614241tt \| outputlookup createempty=false t116.csv |
| outputlookup_createempty2true | tag:sample040614241tt \| outputlookup createempty=true t117.csv |
| outputlookup_overrideifempty2fasle | tag:sample040614241tt \| outputlookup overrideifempty=false t102.csv |
| outputlookup_overrideifempty2true | tag:sample040614241tt \| outputlookup overrideifempty=true t103.csv |
| outputlookup_maxresult10 | tag:sample04061424 \| outputlookup overrideifempty=true maxresult=10 outputlookup_maxresult10.csv |
| inputlookup_outputlookup_sample | \| inputlookup zidian.csv \| outputlookup inputlookup_outputlookup_sample.csv |
| inputlookup_append_sub_outputlookup | \| inputlookup zidian.csv \| limit 10 \| append [[ tag:sample04061424 \| stats avg(apache.resp_len) as avg_len, count(apache.resp_len) by apache.clientip\| limit 12]] \| outputlookup inputlookup_append_sub_outputlookup.csv |
| inputlookup_append_sub_dedup1 | \| inputlookup zidian.csv  \| append [[ tag:sample04061424 \| stats avg(apache.resp_len) as avg_len, count(apache.resp_len) by apache.clientip \| limit 10]] \| sort by  apache.clientip \| dedup 1 apache.clientip |
| outputlookup_eval_table_sort2len | tag:sample04061424 \| sort by -apache.resp_len \| limit 27 \| eval resp_len = apache.resp_len \| eval clientip = apache.clientip \| table resp_len, clientip, apache.x_forward \| sort by resp_len, clientip, apache.x_forward \| outputlookup sort_eval_table.csv |
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
| search_all | starttime=\"now/d\" endtime=\"now/d+24h\" * |
| search_all_samepre_tag_count | index=* starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424* \| top 100 tag \| sort by count,tag |
| search_all_nopre_tag_count | index=* starttime=\"now/d\" endtime=\"now/d+24h\" NOT tag:sample04061424* \| top 100 tag \| sort by tag |
| verify_init_chart_data | starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424_chart |
| search_generall | tag:\"sample04061424\" |
| search_eventcount | tag:\"sample04061424\" AND apache.referer_domain:\"m5.baidu.com\" AND apache.clientip:\"23.166.125.53\" |
| search_fieldstats | tag:\"sample04061424\" AND apache.request_path:\"/index/login/\" apache.status:\"200\" |
| search_and_logic | tag:\"sample04061424\" AND (Mobile  Mozilla apache.resp_len:\"69\") |
| search_and_logic_filterfield_match | starttime=\"now/d\" endtime=\"now/d+24h\" ((* AND appname:apache) AND tag:sample04061424) AND (apache.ua:Mozilla*) |
| search_not_and | tag:sample04061424 69 (NOT SAMSUNG) |
| search_not | tag:\"sample04061424\" (NOT Mozilla) |
| search_regex | tag:\"sample04061424\" AND /0{2,2}/ |
| search_uppercase_full_text_retrieval | starttime=\"now/d\" endtime=\"now/d+24h\" RC |
| search_notless | tag:\"sample04061424\" AND apache.status:>=404 |
| search_greater | tag:\"sample04061424\" AND apache.status:>301 |
| search_and1 | tag:\"sample04061424\" AND apache.status:200 Build |
| search_bracket | tag:\"sample04061424\" AND apache.status:200 AND \"mac\" AND (apache.clientip:12.234.8.15 OR apache.clientip:13.78.39.216 OR apache.clientip:22.132.197.8) |
| search_filterfield_uppercase_fuzzy_match | tag:\"sample04061424\" AND apache.ua:Mozilla\/5.* |
| search_filterfield_uppercase_fuzzy_match1 | tag:\"sample04061424\" AND apache.ua:Mozilla* |
| search_filterfield_lowercase_fuzzy_match | tag:\"sample04061424\" AND  apache.referer_domain:m5* \| table apache.referer_domain |
| search_filterfield_data_fuzzy_match | tag:\"sample04061424\" AND NOT 'apache.clientip':*2* \| sort by apache.clientip \| table apache.clientip |
| search_filterfield_chinese_fuzzy_match | tag:sample04061424_json_sdyd_float_59  json.name:用* \| table json.name |
| search_chinese_fuzzy_match | tag:chinese_fuzzy_match 企* |
| search_regex_json | tag:sample04061424_regex_json_100 |
| search_json_sdyd_41 | tag:\"sample04061424_json_sdyd_41\" |
| search_json_sdyd_float | tag:\"sample04061424_json_sdyd_float_59\" |
| search_log4j | tag:\"sample04061424_log4j_100\" |
| search_highlight_get | tag:\"sample04061424\" AND get* |
| search_highlight_gf_bond_start | tag:highlight_gf_bond_56 justLogSplRequest start |
| search_highlight_resp_len_char | tag:\"sample04061424\" AND apache.resp_len:\"93\" |
| search_highlight_resp_len_int | tag:\"sample04061424\" AND apache.resp_len:93 |
| search_highlight_clientip | tag:\"sample04061424\" AND apache.clientip:23* |
| search_highlight_version | tag:\"sample04061424\" AND apache.status:version |
| search_syntax_equal | tag:\"sample04061424_syntax_equal_5\" AND api\"=\"/[a-z]{4}.[a-z]{8}.[a-z]{8}/ |
| search_syntax_equal_oneword_highlight | tag:sample04061424_syntax_equal_5 AND \"user.\" |
| search_syntax_equal_word_highlight | tag:sample04061424_syntax_equal_5 AND \"api\=user\" |
| search_syntax_equal_two_word_noquote_highlight | tag:sample04061424_syntax_equal_5 AND api\=user |
| search_syntax_equal_string_highlight | tag:sample04061424_syntax_equal_5 AND user.passport.loginLog |
| search_syntax_equal_ip_regex_highlight | tag:sample04061424_syntax_equal_5 AND  /[0-9]{3}.[0-9]{1}.[0-9]{3}.[0-9]{1}/ |
| search_regex_match_3string_highlight | tag:\"sample04061424_syntax_equal_5\"  AND /[a-z]{4}/ /[a-z]{7}/ /[a-z]{8}/ |
| search_regex_match_3string_highlight1 | tag:\"sample04061424_syntax_equal_5\"  AND /[a-z]{4}/ /[a-z]{7}/ /[a-z]{100}/ |
| search_chinese | tag:\"sample04061424_chinese_5\" |
| search_raw | tag:\"sample04061424_raw_36\" |
| search_upload_noappname | tag:\"sample04061424_noappname_36\" |
| search_alert_yctv | tag:\"sample04061424_yctv_100\" AND cgi.loglevel:ERROR AND  (NOT \"errno 104\") AND (NOT \"code 0\") AND (NOT \"errno 111\") AND (NOT \"errno 106\") AND (NOT \"verify failed\") AND (NOT \"errno 101\") AND (NOT \"errno 115\") AND (NOT \"errno 117\") AND (NOT \"Detect failed\") AND (NOT \"errno 109\") AND (NOT \"Job failed\") |
| search_xiaomi_syntax | tag:\"sample04061424_xiaomi_3\" AND (invalid \"did=\"yunyi.ba12*) |
| search_two_index | starttime=\"now-1d/d\" endtime=\"now/d+7h\" tag:two_index |
| search_fields_range | tag:\"sample04061424\" AND apache.resp_len:[1 TO 5049] \| eval r_type=typeof(apache.resp_len) \| stats count() as cnt by apache.status, r_type \| sort by cnt, apache.status |
| not_eval_stats_top | tag:\"sample04061424\" AND (NOT apache.status:200) \| eval status = apache.status \| stats top(status,10) |
| sub_es | tag:\"sample04061424\" AND [[tag:\"sample04061424\" \| stats es(apache.status) by apache.method \| fields apache.method]] |
| sub_count | (logtype:apache AND tag:\"sample04061424\") AND [[ appname:apache \| stats count(apache.method) as method_count by apache.method \|  sort by method_count \| limit 1 \| fields apache.method]] |
| subs3 | logtype:apache AND (tag:sample04061424_display OR tag:\"sample04061424_chart\") AND [[ tag:\"sample04061424\" \| stats count(apache.method) as method_count by apache.method \|  sort by method_count \| limit 1 \| fields apache.method]] \| table tag,apache.x_forward, apache.referer, apache.request_query \| sort by tag,apache.x_forward |
| subs4 | (logtype:apache AND tag:\"sample04061424\") AND [[ appname:apache \| stats count(apache.method) as method_count by apache.method \| sort by method_count \| limit 1 \| fields apache.method]] |
| subs5 | (logtype:apache AND tag:\"sample04061424\") AND [[ logtype:apache AND [[ * \| stats count(appname) by apache.method \| fields apache.method \| limit 2 ]] \| stats count(appname) as appcount by apache.method \| fields apache.method ]] |
| subs6 | (logtype:apache AND tag:\"sample04061424\") AND [[ logtype:apache AND [[ * \| stats count(appname) by apache.method \| fields apache.method \| limit 2 ]] \| stats count(appname) as appcount by apache.method \| fields apache.method ]] |
| subs7 | (logtype:apache AND tag:\"sample04061424\") AND [[ * \| stats es(apache.status) as es_status by apache.method \| fields apache.method ]] |
| subs_multi | starttime = \"now/d\" endtime = \"now\" tag:sample04061424_rizhiyi_access_1000 AND (apache.clientip:1.197.41.37 OR  apache.clientip:123.150.214.81) \| append [[tag:sample04061424 apache.status:200 AND apache.method:\"GET\" AND apache.clientip:\"49.85.230.247\" \| append [[tag:sample04061424 \| stats count() as cnt by apache.status]]]] \| sort by cnt, apache.status |
| eval_logic | tag:\"sample04061424\" \| eval bool_is_empty=empty(apache.request_path) \| eval bool_not_empty=! empty(apache.request_path) \| eval bool_is_false= false && empty(apache.request_path) |
| eval_relation | tag:\"sample04061424\" \| eval new_not_200=apache.status!=200 \| eval new_is_200=apache.status==200 \| eval new_big_200=apache.status>200 \| eval new_bigequal_200=apache.status>=200 \| eval new_small_200=apache.status<200 \| eval new_smallequal_200=apache.status<=200 |
| eval_concat | tag:\"sample04061424\" \| eval ret_connect = appname + apache.clientip + apache.method \| table ret_connect |
| eval_math_add_bracket | tag:\"sample04061424\" \| eval r_len=apache.resp_len \| eval r_status=apache.status \| eval status_add10=apache.status+10 \| eval r_plus=apache.resp_len+apache.status \| eval r_plus_bracket=(apache.resp_len+apache.status)*r_status \| table r_len, r_status,status_add0, r_plus, r_plus_bracket |
| eval_ceil_floor_min_max_log | tag:sample04061424_json_sdyd_41 \| eval r_ceil_cpuTime=ceil(json.cpuTime) \| eval r_floor_cpuTime=floor(json.cpuTime) \| eval r_min=min(json.execTime,json.responseTime) \| eval r_max=max(json.execTime,json.responseTime) \| eval r_log_responseTime=log(json.responseTime) \| table json.cpuTime, json.execTime, json.responseTime, r_ceil_cpuTime, r_floor_cpuTime, r_min, r_max, r_log_responseTime |
| eval_coalesce_empty_if | tag:\"sample04061424\" \| eval path_coalesce=coalesce(apache.request_path,apache.referer) \| eval path_is_empty=empty(apache.request_path) \| eval res=if(path_is_empty,\"path_empty\",\"path_not_empty\") \| eval res_equal200=if(apache.status==200,\"equal200\",\"not_200\") \| eval res_larger=if(apache.status>200,\"larger200\",\"not larger\") |
| eval_case_tran | tag:sample04061424_display OR tag:sample04061424_chart \| eval status_com = case(tag==\"sample04061424_display\", apache.status, tag==\"sample04061424_chart\", apache.status) \| transaction status_com maxevents=100 |
| eval_math_stats | tag:\"sample04061424\" \| eval new_len = 1000 + apache.resp_len \| stats count(new_len) |
| stats_math_sort_limit_eval | (logtype:apache AND tag:\"sample04061424\") \| stats count(tag) as event_count,sum(apache.resp_len) as sum_len,max(apache.resp_len) as max_len,min(apache.resp_len) as min_len by apache.clientip\|sort by sum_len \| limit 5 \| eval agv_len=if(event_time==0,0,sum_len/event_time) |
| stats_count_eval | tag:\"sample04061424\" \| stats count() as count_ by appname, logtype \| eval test_eval=appname |
| stats_extend_stat | tag:\"sample04061424\" \| stats extend_stat(apache.resp_len) |
| stats_arith_by_city | tag:\"sample04061424\" \| stats count(apache.status), max(apache.status), min(apache.resp_len), sum(apache.status), avg(apache.status) by apache.clientip \| sort by apache.clientip |
| stats_top | tag:\"sample04061424\" \| stats top(apache.status,3) |
| stats_hg | tag:\"sample04061424\" \| stats hg(apache.status,10) |
| stats_pct | tag:\"sample04061424\"\| stats pct(raw_message_length,1,5,25,50,75,95,99) |
| tran_apachelen_sort | tag:\"sample04061424\" \| transaction  apache.resp_len \| sort by apache.resp_len |
| tran_sort_ascend | tag:\"sample04061424\" \| transaction apache.status \| sort by + apache.status |
| tran_param_max_txn_maxopen10 | tag:\"sample04061424\" \| transaction apache.status maxevents=10 maxopentxn=100 maxopenevents=100 |
| tran_param_max_txn_maxopen3 | tag:\"sample04061424\" AND apache.status:\"200\" \| transaction apache.status maxevents=3 maxopentxn=100 maxopenevents=100 |
| tran_status_contains_maxevents_10 | tag:\"sample04061424\" AND clientconfig \| transaction apache.status  maxevents=10 maxopenevents=100 contains=\"clientconfig\" |
| tran_status_contains_maxevents_100 | tag:\"sample04061424\" AND clientconfig \| transaction apache.status  maxevents=100 maxopenevents=100 contains=\"clientconfig\" |
| tran_method_max_maxopen_contains1 | \"clientconfig\" AND tag:\"sample04061424\" \| transaction apache.method contains=\"clientconfig\"  maxevents=10 maxopenevents=100 |
| tran_method_max_maxopen_contains2 | \"\\"GET /index/portal/\" AND tag:\"sample04061424\" \| transaction apache.method contains=\"\\"GET /index/portal/\"  maxevents=300 maxopenevents=1000 |
| eval_if_stats_count | (logtype:apache AND tag:\"sample04061424\") \| eval desc = if (apache.status==200, \"OK\", \"Error\")\|stats count(desc) by desc |
| eval_case_stats_count | (logtype:apache AND tag:\"sample04061424\") \| eval desc=case(apache.resp_len<0,\"nagetive\",apache.resp_len<100,\"low\",apache.resp_len>2000,\"high\",empty(apache.resp_len),\"Not found\",default,\"middle\") \| stats count(desc) by desc |
| eval_tolong | (logtype:apache AND tag:\"sample04061424\") \| eval int_status= tolong(apache.status) |
| eval_parsedate_formatdate | (logtype:apache AND tag:\"sample04061424_chart\") \| eval f_ref_time = \"22:52:22.000\" \| eval mill_ref_time=parsedate(f_ref_time,\"HH:mm:ss.SSS\") \| eval f_cut_timestamp = formatdate(timestamp,\"HH:mm:ss.SSS\") \| eval mill_cut_timestamp=parsedate(f_cut_timestamp,\"HH:mm:ss.SSS\") \| eval mill_diff_time= mill_ref_time - mill_cut_timestamp \| eval f_diff_time = formatdate(mill_diff_time,\"HH:mm:ss:SSS\") \| table f_ref_time, f_cut_timestamp, mill_ref_time, mill_cut_timestamp, mill_diff_time,f_diff_time |
| tran_ip_maxopen_max | (logtype:apache AND tag:\"sample04061424\") \| transaction apache.clientip maxopenevents=10 maxevents=10 |
| bucket_ts_stats_sum_eval | (logtype:apache AND tag:\"sample04061424_chart\") \| bucket timestamp span=1m as ts \| stats sum(apache.resp_len) as sum_len by ts,apache.status \| eval time=formatdate(ts,\"HH:mm:ss\") |
| starttime_bucket_ts_sum_eval | starttime=\"now/d\" endtime=\"now/d+24h\" tag:\"sample04061424_chart\" \| bucket timestamp span=1h as ts \| stats sum(apache.resp_len) as sum_len by ts \| eval time=formatdate(ts,\"HH:mm:ss\") |
| starttime_bucket_ts_count_eval_formatdate | starttime=\"now/d\" endtime=\"now/d+24h\" tag:\"sample04061424_chart\" \| bucket timestamp span=1h as ts \| stats count(apache.resp_len) as sum_len by ts \| eval time=formatdate(ts,\"HH:mm:ss\") |
| bucket_ranges_status_count | (logtype:apache AND tag:\"sample04061424\") \| bucket apache.status ranges=((0, 200), (200, 300), (300, MAX)) as rs \| stats count(apache.status) as count_status by rs |
| sub_where_count_big5 | (apache.resp_len:69 AND tag:\"sample04061424\") AND [[tag:\"sample04061424\" \| stats count(apache.clientip) as count_ by apache.clientip,apache.method \| where count_>5 \| fields apache.clientip,apache.method ]] |
| sub_join_left | tag:\"sample04061424\" \| stats count(logtype) as count_all by apache.geo.isp \| sort by count_all \| limit 20 \| join type=left apache.geo.isp [[tag:\"sample04061424\" AND apache.status:[400 TO 499] \| stats count(logtype) as count_400l by apache.geo.isp]] \| join type=left apache.geo.isp [[tag:\"sample04061424\" AND apache.status:[500 TO 599] \| stats count(logtype) as count_500l by apache.geo.isp]] |
| sub_join_left_count_3times | tag:\"sample04061424\" \| stats count(logtype) as count_all by apache.clientip \| sort by count_all \| limit 20 \| join type=left apache.clientip [[tag:\"sample04061424\" AND apache.status:[400 TO 499] \| stats count(logtype) as count_400l by apache.clientip]] \| join type=left apache.clientip [[tag:\"sample04061424\" AND apache.status:[500 TO 599] \| stats count(logtype) as count_500l by apache.clientip]] \| join type=left apache.clientip [[tag:\"sample04061424\"AND apache.resp_len:>1000\| stats count(logtype) as len_1000l by apache.clientip]] \| sort by count_all, apache.clientip |
| sub_join_percent | tag:\"sample04061424\" \| stats count(logtype) as count_all by apache.clientip \| sort by count_all \| limit 50 \| join type=left apache.clientip [[ tag:\"sample04061424\" AND apache.status:[400 TO 499] \| stats count(logtype) as count_400 by apache.clientip]] \| join type=left apache.clientip [[ tag:\"sample04061424\" AND apache.status:[500 TO 599] \| stats count(logtype) as count_500 by apache.clientip ]] \| join type=left apache.clientip [[tag:\"sample04061424\" AND apache.resp_len:>1000 \| stats count(logtype) as len_1000 by apache.clientip]] \| eval rate_400=if(empty(count_400),0,count_400/count_all) \| eval rate_500=if(empty(count_500),0,count_500/count_all) \| eval rate_len_1000=if(empty(len_1000),0,len_1000/count_all) \| sort by count_all, apache.clientip |
| bucket_stats_eval_movingavg | starttime=\"now/d\" endtime=\"now/d+24h\"  tag:\"sample04061424_chart\"\| bucket timestamp span=1m as ts \| stats sum(apache.resp_len) as sum_resp_len by ts \| eval time=formatdate(ts,\"HH:mm:ss\") \| movingavg sum_resp_len,3 as moving_avg_resp_len |
| bucket_append_math | starttime=\"now/d\" endtime=\"now/d+24h\" tag:\"sample04061424_chart\" \| bucket timestamp span=1h as ts \| stats avg(apache.resp_len) as stats_resplen by ts \| eval time=formatdate(ts,\"HH\") \| eval line=\"avg_line\" \| append [[starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424_chart \| bucket timestamp span=1h as ts \| stats max(apache.resp_len) as stats_resplen by ts \| eval time=formatdate(ts,\"HH\") \| eval line=\"max_line\"]] \| append [[starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424_chart \| bucket timestamp span=1h as ts \| stats min(apache.resp_len) as stats_resplen by ts \| eval time=formatdate(ts,\"HH\") \| eval line=\"min_line\" ]] |
| append_baseline_cmp | starttime=\"now/d\" endtime=\"now\" tag:\"sample04061424\"\| bucket timestamp span=1h as ts \| stats count(apache.geo.isp) as count_ by apache.geo.isp, ts\|eval date_hour=tolong(formatdate(ts,\"HH\")) \| rename apache.geo.isp as group_line \| append [[index=schedule starttime=\"-2d\" endtime=\"-d/d\" schedule_name:pip_task\|stats avg(ip_count) as count_ by date_hour\|eval group_line=\"base_line\"\|sort by +date_hour]] |
| bucket_stats_autoregress_eval_where_fields | starttime=\"now/d\" endtime=\"now/d+24h\" tag:\"sample04061424_chart\" \| bucket timestamp span=1h as ts \| stats count(appname) as count_app by ts \| eval time=formatdate(ts,\"HH:mm:ss\") \| autoregress count_app p=6 \| eval rate=if(empty(count_app_p6),0,abs(count_app_p6-count_app)) \| eval result=if(empty(count_app_p6),0,1) \| where result>0 \| fields count_app,time,count_app_p6,rate,result |
| bucket_stats_autoregress | starttime=\"now/d\" endtime=\"now/d+24h\" tag:\"sample04061424_chart\" \| bucket timestamp span=1h as ts \| stats count() as count_app by ts \| eval time=formatdate(ts,\"HH:mm:ss\") \| autoregress count_app p=3 |
| stats_save | tag:\"sample04061424\" \| stats avg(apache.status) by hostname \| save /data/rizhiyi/spldata/apache_latency.csv |
| start_time_para_mon | starttime=\"now-1M/M-1d/w\"  endtime=\"now\" tag:sample04061424 |
| start_time_value | starttime=2017-08-13 endtime=2017-08-13:23:59:00 tag:sam ple |
| startt_today | starttime=\"now/d\" endtime=\"now\" tag:sample04061424 |
| start_time_para_day | starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424 \| stats count(apache.resp_len) as event_count, max(apache.resp_len) as max_len, avg(apache.resp_len) as avg_status |
| index_yotta_tag | index=* tag:sample04061424 |
| index_yotta_regex | index=yotta tag:sample04061424 AND  /[0][8]0{2,2}/ |
| index_yotta_all | index=yotta starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424* |
| index_internal | index=internal * |
| index_schedule | index=schedule * |
| index_task_search | index=schedule schedule_name:bar_resp_len \| bucket timestamp span=1h as ts \| stats max(max_resp_len) as max_resp_len_hour by ts |
| eval_empty_if_top | tag:sample04061424 \| eval len=if(empty(apache.resp_len),0,1) \| stats top(len,10) |
| eval_empty_if_table | tag:sample04061424 \| eval is_resplen_empty=empty(apache.resp_len) \| eval res_str=if(is_resplen_empty,\"repslen_empty\",\"resplen_non_null\") \| table apache.resp_len, is_resplen_empty, res_str \| where is_resplen_empty==true |
| add_subtract_multiply_divide | tag:\"sample04061424\" \| eval res_mul=apache.status*apache.status*0 - apache.status/apache.status%100 \| eval r_add=apache.status+apache.status*10-9*apache.status \| eval res_concat = appname + apache.clientip + \"科罗拉多斯普林斯\" \| sort by apache.resp_len \| table res_mul, r_add, res_concat, apache.resp_len |
| add_1 | tag:\"sample04061424\" AND apache.resp_len:>2000 \| eval resplen=apache.resp_len \| eval status=apache.status \| eval mid=apache.resp_len+apache.status \| eval res_mul=(apache.resp_len+apache.status)*apache.status \| table resplen, status, mid, res_mul |
| logical_operation | tag:\"sample04061424_json_sdyd_float_59\" \| eval res_empty=empty(json.cpuTime) \| eval res_not_empty=!empty(json.cpuTime) \| eval res_true=empty(json.cpuTime) \|\| true \| eval res_false= false && empty(json.cpuTime) \| table json.cpuTime, res_empty, res_not_empty, res_true, res_false |
| comparison_operation | tag:\"sample04061424\" AND NOT apache.status:200 \| eval not_200=apache.status!=200 \| eval is_200=apache.status==200 \| eval big_200=apache.status>200 \| eval bigto_200=apache.status>=200 \| eval small_200=apache.status<200 \| eval smallto_200=apache.status<=200 \| eval res_equal_200=if(apache.status==200,\"\"equal200\"\",\"\"other200\"\") \| eval res_not_200=if(apache.status!=200,\"\"not200\"\",\"\"error\"\") \| table apache.status, not_200, is_200, big_200, bigto_200,small_200,smallto_200, res_equal_200,res_not_200 |
| eval_abs_ceil_floor | tag:sample04061424_json_sdyd_float_59 \|  eval r_abs=abs(json.duration) \| eval r_ceil=ceil(json.duration) \| eval r_floor=floor(json.duration) \| table json.duration,r_abs, r_ceil, r_floor |
| eval_min_max_float | tag:sample04061424_json_sdyd_41 \| eval r_min=min(json.execTime,json.responseTime) \| eval r_max=max(json.execTime,json.responseTime) \| eval r_log_time=log(r_max) \| sort by r_max \| table json.execTime, json.responseTime, r_max, r_min, r_log_time |
| eval_min_max_int | tag:\"sample04061424\" AND apache.resp_len:* \| eval res_min=min(apache.status, apache.resp_len) \| eval res_max=max(apache.status,apache.resp_len) \| table res_min, res_max |
| eval_log_status | tag:\"sample04061424\" \| eval r_log_status=log(apache.status) \| table apache.status, r_log_status |
| eval_len_sdyd_json_name | tag:sample04061424_json_sdyd_41 \| eval r_name_len=len(json.name) \| eval r_ip_len=len(json.dimensions.IP) \| table json.name, r_name_len, json.dimensions.IP, r_ip_len |
| eval_case_default | tag:sample04061424 AND NOT apache.status:200\| eval r_status = \"status: \" + case(apache.status==200, \"ok\", apache.status==400, \"bad\", apache.status>=500, \"other\", default, \"error\") \| table apache.status, r_status |
| eval_case_status | tag:\"sample04061424\" \| eval res_status=case(apache.status==200,\"status=200\",apache.status==404,\"apache=404\",apache.status==500,\"apache==500\",default,\"apache=other\") \| table apache.status,res_status |
| eval_case_stats | tag:sample04061424 AND apache.status:>=301 \| eval r_status=case(apache.status==200,\"status=200\",apache.status<=301,\"apache<=301\",apache.status==304,\"apache==304\",default,\"apache=other\") \| table r_status |
| eval_case_param | tag:sample04061424 OR  tag:sample04061424_json_sdyd_41 \| eval r_len=case(logtype==\"json\", json.cpuTime, logtype==\"apache\", apache.resp_len) \| sort by r_len \| table r_len |
| eval_upper_lower | tag:\"sample04061424\" AND apache.request_path:* \| eval r_upper=upper(apache.request_path) \| eval r_lower=lower(apache.request_path) \| table r_upper, r_lower |
| eval_match_ip1 | tag:\"sample04061424\" \| eval r_match = match(apache.clientip, \"^\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}$\") \| table apache.clientip, r_match |
| eval_match_query | tag:\"sample04061424\" AND apache.request_query:* \| eval r_match1 = match(apache.request_query, \"b.*e\") \| eval r_match2 = match(apache.request_query, \"^bcd\") \| table apache.request_query, r_match1, r_match2 |
| eval_substring_trim | tag:\"sample04061424\" AND apache.referer_domain:* \| eval r_subdomain= substring(apache.referer_domain,0,len(apache.referer_domain)) \| eval r_trim=trim(\"中文 \") \| eval r_eng=trim(\" \"+apache.referer_domain + \" \") \| table r_subdomain, r_eng, r_trim |
| eval_str_tolong | tag:\"sample04061424\" \| eval res_to_str=tolong(\"123\")\| eval res_to_long=tolong(20.3) \| table res_to_str, res_to_long |
| eval_todouble | tag:\"sample04061424\" \| eval r_frm_str=todouble(\"123.1\")  \| eval r_frm_long = todouble(20) \| eval res=r_frm_str+20\| eval t_frm_str = typeof(r_frm_str) \| eval t_frm_long = typeof(r_frm_long) \| eval t_res = typeof(res) \| table r_frm_str, t_frm_str, r_frm_long,t_frm_long, res,t_res |
| eval_typeof_1 | tag:sample04061424_json_sdyd_41 \| eval t_cputime = typeof(json.cpuTime) \| eval t_actionName=typeof(json.actionName) \| eval t_failed=typeof(json.failed) \| eval t_agent_timestamp=typeof(agent_send_timestamp)  \| eval t_dimensions_ip=typeof(json.dimensions.IP) \| eval t_dimensions = typeof(json.dimensions) \| table json.cpuTime, t_cputime, json.actionName, t_actionName, json.failed, t_failed, json.agent_send_timestamp, t_agent_timestamp, json.dimensions.IP, t_dimensions_ip, t_dimensions |
| eval_typeof_2 | tag:sample04061424 \| eval t_timestamp = typeof(timestamp) \| eval t_context_id = typeof(context_id) \| eval t_x_forward = typeof(apache.x_forward) \| eval t_latitude = typeof(apache.geo.latitude) \| eval t_resp_len = typeof(apache.resp_len) \| eval t_status = typeof(apache.status) \| table t_timestamp,t_context_id,t_x_forward,t_latitude,t_resp_len, t_status |
| eval_tostring | tag:\"sample04061424\" \| eval t = \"logtype:\" + logtype \| where tostring(t) == \"logtype:apache\" && tostring(apache.clientip) == \"23.166.125.53\" && tostring(appname) == \"apache\" \| table apache.clientip, appname, t |
| eval_parsedate | tag:\"sample04061424\" apache.method:GET \| eval x = parsedate(\"28/04/2016:12:01:01\",\"dd/MM/yyyy:HH:mm:ss\") \| eval y = parsedate(\"28/04/2016\",\"dd/MM/yyyy\") \| table x,y |
| eval_parsedate_chinese_month | tag:\"sample04061424\" apache.method:GET \| eval t_chn = parsedate(\"28/四月/2016\", \"dd/MMMM/yyyy\", \"Asia/Shanghai\", \"zh\") \| table t_chn \| eval f_t_chn = formatdate(t_chn) |
| formatdate_sample | tag:\"sample04061424\" apache.method:GET \| eval r_formatdate = formatdate(1537414676598, \"HH:mm:ss:SSS MM/dd/yyyy\") \|table apache.resp_len, r_formatdate |
| parsedate_limit | tag:\"sample04061424\" AND 'apache.resp_len':5049 \| limit 10 \| eval f_start_time = \"2014-08-02 10:52:22.000\" \| eval f_end_time = \"2046-12-29 10:52:22.000\" \| eval mill_start_time=parsedate(f_start_time,\"yyyy-MM-dd HH:mm:ss.SSS\") \| eval mill_end_time = parsedate(f_end_time,\"yyyy-MM-dd HH:mm:ss.SSS\") \| table f_start_time, f_end_time, mill_start_time, mill_end_time |
| format | tag:\"sample04061424\" \| eval x_format = format(\"%s, %s => %s\", logtype, tag, apache.clientip) \| table x_format |
| eval_isnum_isstr | tag:\"sample04061424\" \| eval r_isnum = isnum(apache.status) \| eval r_isstr = isstr(apache.method) \| table r_isnum, r_isstr |
| relative_time_timestamp_data_math | tag:\"sample04061424\" \| eval r_relative = relative_time(timestamp, \"-1d/d\") \| eval r_format_relative = formatdate(r_relative, \"HH:mm:ss:SSS MM/dd/yyyy\") \| eval r_format_timestamp = formatdate(timestamp, \"HH:mm:ss:SSS MM/dd/yyyy\") \| table r_relative, r_format_relative |
| cidrmatch | tag:\"sample04061424\" \| eval r_m130 = cidrmatch(\"192.168.1.130/25\", \"192.168.1.129\") \| eval r_m128 = cidrmatch(\"192.168.1.128/25\", \"192.168.1.129\") \| eval r_m255 = cidrmatch(\"192.168.1.255/25\", \"192.168.1.129\") \| table r_m130, r_m128, r_m255 |
| eval_urldecode | starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424_urldecode_apache_10 AND apache.request_query:* \| eval r_decode = urldecode(apache.request_query) \| table apache.request_query,r_decode |
| bug_followed_add | tag:\"sample04061424\" \|eval a=add(apache.status,apache.resp_len) \| sort a |
| eval_stats1 | starttime=\"now/d\" endtime=\"now/d+24h\" tag:\"sample04061424\" \| eval method = apache.method \| stats count() as count1, avg(apache.resp_len) as avg_len by method, apache.status \| sort by -avg_len |
| tran_count_where | tag:\"sample04061424\" \| transaction apache.resp_len \| where _count==4 |
| tran_duration_where | tag:\"sample04061424\" \| transaction apache.resp_len \| where _duration<500 |
| tran_endswith_eval_contains | tag:\"sample04061424\" \| transaction apache.clientip endswith=eval(apache.status == 200) maxevents=10 contains=\"Dalvik\" |
| tran_startswith_endswith_maxspan_5s | starttime = \"now/d\" endtime = \"now\" tag:\"sample04061424\" \| transaction apache.clientip startswith=\"Android\" endswith=\"Dalvik\" maxspan=5s maxevents=50 maxopentxn=1000 maxopenevents=1000 |
| tran_startswith_endswith_maxopenevents2 | starttime=\"now/d\" endtime = \"now/d+24h\" tag:\"sample04061424\" \| transaction apache.clientip  startswith=\"1977\" endswith=\"Android 4.3\" maxspan=1d maxevents=50 maxopentxn=1000 maxopenevents=1000 |
| tran_sort | tag:\"sample04061424\" \| transaction apache.resp_len \| sort by apache.resp_len |
| tran_count_apachelen | tag:\"sample04061424\" \| transaction apache.resp_len \| stats count(apache.resp_len) |
| tran_stats_cmd_limit | tag:\"sample04061424\" \| transaction apache.status, apache.method \| stats count() as cnt |
| stats_math_1 | tag:\"sample04061424\" \| stats count(apache.status) as cnt, min(apache.status),max(apache.status),avg(apache.status),sum(apache.status), es(apache.status) by apache.clientip \| sort by cnt, apache.clientip |
| stats_math_2 | tag:\"sample04061424\" \| stats count(apache.status) as cnt, min(apache.status),max(apache.status),avg(apache.status),sum(apache.status), extend_stat(apache.status) by apache.clientip \| sort by cnt, apache.clientip |
| where_dc | tag:\"sample04061424\" \| where apache.status>400 \| stats dc(apache.status) |
| where_es | tag:\"sample04061424\" \| where apache.status>400 \| stats es(apache.status) |
| stats_count | tag:\"sample04061424\" \| stats count() as cnt by apache.status |
| stats_min_timestamp_formatdate | tag:\"sample04061424_chart\" \| stats min(timestamp) as min_time by apache.status \| eval t_min_time = typeof(min_time) \| eval long_min_time = tolong(min_time) \| eval f_min_time = formatdate(log_min_time,\"HH:mm:ss\") \| sort by +apache.status |
| stats_sort | tag:\"sample04061424\" \| sort by +apache.status,+apache.resp_len\| table apache.status, apache.resp_len |
| stats_sort_fail | tag:\"sample04061424\" \| stats avg(apache.resp_len) as avg_length by apache.clientip \| sort by +avg_length, apache.clientip \| eval eval_length = avg_length + 200 |
| stats_sort_true | tag:\"sample04061424\" \| stats avg(apache.resp_len) as avg_length by apache.status \| eval eval_length = avg_length + 200 \| sort by eval_length |
| stats_avg_count_sort | tag:\"sample04061424\" \| stats avg(apache.resp_len) as avg_length, count(apache.clientip) as ip_count by apache.status \| sort by ip_count, apache.status |
| stats_stats_avg | tag:\"sample04061424\" \| stats count() as cnt, max(apache.status) as r_max by apache.clientip \| stats avg(cnt) by  r_max |
| stats_stats_top | tag:\"sample04061424\" \| stats count() as cnt, max(apache.status) as r_max by apache.clientip \| top 3 cnt |
| top_1_resp_len | tag:\"sample04061424\" \| top 50 apache.resp_len \| sort by count, apache.resp_len |
| top_2_clientip_by_path | tag:\"sample04061424\" \| top 20 apache.clientip by apache.request_path \| sort by count, apache.request_path, apache.clientip |
| top_count_percent | tag:\"sample04061424\" \| top 20 apache.clientip  countfield=clientip_count  percentfield=clientip_percent |
| top_groupby | tag:\"sample04061424\"  \| top 3 apache.clientip by apache.resp_len \| sort by count, apache.resp_len, apache.clientip |
| bucket_1h_stats_count | starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424_chart \| bucket timestamp span=1h as ts \| stats count(apache.clientip) as c_ip by ts |
| bucket_stats_eval_where | starttime=\"now/d\" endtime=\"now/d+7h\" tag:sample04061424_apachesample_dawn \| bucket timestamp span=10m as ts\|stats count(appname) as count_app by ts\|eval time=formatdate(ts,\"HH:mm:ss\") \| autoregress count_app p=6\|eval rate=if(empty(count_app_p6),0,abs(count_app_p6-count_app)) \| eval result=if(empty(count_app_p6),0,1) \|where result>0\|fields count_app,time,count_app_p6,rate |
| bucket_movingavg_rollingstd_eval | starttime=\"now/d\" endtime=\"now/d+7h\" tag:sample04061424_apachesample_dawn \| bucket timestamp span=1h as ts\| stats count(appname) as count_ by ts\| movingavg count_,5 as ma\| rollingstd count_,5 as rs\| eval lower=ma-1*rs\| eval upper=ma+1*rs\| eval outlier=if(count_>upper\|\|count_<lower, count_, 0) |
| bucket_timeranges | starttime=\"now/d\" endtime=\"now\" tag:\"sample04061424\" \| bucket timestamp timeranges=((MIN,-2h),(-2h,-1h),(-1h,MAX)) as ts \| table ts |
| bucket_timeranges_count | starttime=\"now/d\" endtime=\"now\" tag:\"sample04061424\" \| bucket timestamp timeranges=((-2d, -1d),(-1d, MAX),(2017-02-17:00:00:00, 2018-02-23:00:00:00)) as tr \| stats count(appname) as ct by tr |
| rename_status | tag:\"sample04061424\" \| rename apache.status as \"status_1\" \| table apache.status,status_1 |
| rename_status_to_chinese | index=* starttime=\"now/d\" endtime=\"now/d+24h\"  tag:\"sample04061424\" \| rename apache.status as \"状态码\" \| table '状态码' \| sort by '状态码' |
| where_logic_and | tag:\"sample04061424\" \| where  apache.status > 200 && apache.status < 400 \| table apache.status |
| limit_1 | tag:\"sample04061424\"\| limit 10 |
| fields_sample | starttime=\"now/d\" endtime=\"now\" tag:\"sample04061424\" \| stats count() as count_res by appname,apache.clientip \| fields apache.clientip, count_res \| sort by count_res, apache.clientip |
| sub_sample | tag:\"sample04061424\" AND [[ tag:\"sample04061424\"  \| stats count(apache.clientip) as count_ by apache.clientip \| sort by count_ \| limit 1 \| fields apache.clientip ]] |
| sub_sample1 | starttime=\"now/d\" endtime=\"now/d+24h\" tag:\"sample04061424\" AND [[ tag:\"sample04061424\"\| stats count(apache.clientip) by apache.clientip, apache.method \| limit 2 \| fields apache.clientip apache.method ]] |
| sub_sample2 | [[ tag:\"sample04061424\"  \| stats count(apache.clientip) as count_ by apache.clientip \| sort by count_ \| limit 1  ]] |
| sub_nest_1 | tag:\"sample04061424\" \| stats dc(apache.status) as dc_count by apache.method \| join apache.method [[ tag:\"sample04061424\" \| stats count(apache.status) as cnt by apache.method \| append [[ tag:\"sample04061424\" \| stats count() as total ]] ]] |
| sub_nest_2 | starttime=\"-d/d\" endtime=\"now/d\" tag:\"sample04061424\" \| append [[ starttime=\"-5h\" endtime=\"now\" tag:\"sample04061424\" apache.status:200 AND apache.method:\"GET\" \| append [[ tag:\"sample04061424\" \| stats count() as cnt by apache.status]] ]] |
| sub_join_left1 | tag:\"sample04061424\" \| stats avg(apache.status) by apache.clientip \| sort by apache.clientip \| join type=left apache.clientip [[ tag:\"sample04061424\" AND apache.clientip:23.166.125.53 \| stats sum(apache.status) by apache.clientip ]] |
| sub_join_left2 | tag:\"sample04061424\"\| fields apache.method apache.clientip \| join type=left apache.clientip [[ tag:\"sample04061424\" \| stats sum(apache.status) by apache.clientip ]] |
| sub_join_inner1 | tag:\"sample04061424\" \| stats avg(apache.status) by apache.clientip \| join type=inner apache.clientip [[ tag:\"sample04061424\" AND apache.clientip:23.166.125.53 \| stats sum(apache.status) by apache.clientip ]] |
| sub_join_inner2 | tag:\"sample04061424\" \| stats avg(apache.status) by apache.clientip \| join type=inner apache.clientip [[ tag:\"sample04061424\" AND apache.clientip:23.166.125.53 \| stats sum(apache.status) by apache.clientip ]] |
| sub_join_inner3 | starttime = \"-1d/d\" endtime = \"now/d\" tag:\"sample04061424\" \| fields apache.clientip, apache.method \| join type=inner apache.clientip [[starttime = \"now/d\" endtime = \"now/d+24h\" tag:\"sample04061424\" \| stats avg(apache.status) as sub_status by apache.clientip ]] |
| sub_join_left3 | starttime = \"-1d/d\" endtime = \"now/d\" tag:\"sample04061424\" \| bucket timestamp span=1h as ts \| stats count() as ip_count by apache.clientip,ts \| join type=left ts [[starttime = \"-1d/d\" endtime = \"now/d\" tag:\"sample04061424\" \| bucket timestamp span=1h as ts \| stats count() as hour_count by ts ]] \| eval ippercent=100 * ip_count / hour_count \| eval r_fomart = formatdate(ts,\"HH:mm:ss\") |
| sub_join_left_if_divide | tag:\"sample04061424\" \| stats count(logtype) as count_all by apache.clientip \| sort by count_all \| limit 5 \| join type=left apache.clientip [[logtype:\"apache\" AND apache.status:[400 TO 499]\|stats count(logtype) as count_400 by apache.clientip]]\|join type=left apache.clientip [[logtype:\"apache\" AND apache.status:[500 TO 599]\|stats count(logtype) as count_500 by apache.clientip]]\|join type=left apache.clientip [[logtype:\"apache\" AND apache.resp_len:>1000\|stats count(logtype) as len_1000 by apache.clientip]]\|eval rate_400=if(empty(count_400),0,count_400/count_all)\|eval rate_500=if(empty(count_500),0,count_500/count_all)\|eval rate_len_1000=if(empty(len_1000),0,len_1000/count_all) |
| save_stats_avg_ip | tag:\"sample04061424\" \| stats avg(apache.resp_len) as avg_len,count(apache.resp_len) by apache.clientip \| sort by +apache.clientip \| save /data/rizhiyi/spldata/save_stats_avg_ip.csv |
| stats_lookup | tag:\"sample04061424\" \| stats count() as cnt by apache.clientip \| lookup user,department /data/rizhiyi/spldata/lookup/user.csv on apache.clientip=host \| sort by cnt, apache.clientip |
| rollingstd | starttime=\"now/d\" endtime=\"now/d+13h\" tag:sample04061424_apachesample_dawn\| bucket timestamp span=1h as ts \| stats avg(apache.resp_len) as avg_resp_len by ts  \| rollingstd avg_resp_len,10 as resp_len_rolling_std |
| autoregress_sample | starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424_apachesample_dawn \| bucket timestamp span=30m as ts \| stats count(appname) as count_app by ts \| eval time=formatdate(ts,\"HH:mm:ss\") \| autoregress count_app p=6 |
| autoregress1 | starttime=\"now/d\" endtime=\"now/d+13h\" tag:sample04061424_apachesample_dawn \| bucket timestamp span=10m as ts \| stats count(appname) as count_app by ts\|eval time=formatdate(ts,\"HH:mm:ss\") \| autoregress count_app p=6\|eval rate=if(empty(count_app_p6),0,abs(count_app_p6-count_app)) \| eval result=if(empty(count_app_p6),0,1) \| where result>0\|fields count_app,time,count_app_p6,rate |
| autoregress_2 | tag:\"sample04061424\" \| eval  avg_resp_len = apache.resp_len \| autoregress avg_resp_len p=1-2 \| eval res_avg = (avg_resp_len + avg_resp_len_p2 + avg_resp_len_p1) / 3 \| top 3 res_avg |
| append_sample | starttime=\"now/d\" endtime=\"now/d+24h\" tag:\"sample04061424_display\" \| stats avg(apache.resp_len) as avg_resp_len \| append [[ starttime=\"now/d\" endtime=\"now/d+24h\" tag:\"sample04061424_chart\" \| stats avg(apache.resp_len) as avg_resp_len \| append [[ starttime=\"now/d\" endtime=\"now/d+24h\"  tag:\"sample04061424\" \| stats avg(apache.resp_len) as avg_resp_len]] ]] |
| append_stats_sub | tag:\"sample04061424\" \| stats count(apache.clientip)  \| append [[ index=*  tag:\"sample04061424\" \| stats count(apache.clientip) ]] |
| append_status_sub_eval | starttime=\"now/d\" endtime=\"now/d+24h\" tag:\"sample04061424_apachesample_dawn\" \| stats avg(apache.resp_len) \| eval day=\"the group dawn\" \| append  [[ starttime=\"now/d\" endtime=\"now/d+24h\" tag:\"sample04061424_display\" \| stats avg(apache.resp_len) \| eval day=\"the group display\" \| append [[ starttime=\"now/d\" endtime=\"now/d+24h\" tag:\"sample04061424_chart\" \| stats avg(apache.resp_len) \| eval day=\"the group chart\" ]] ]] |
| append_bucket_bucket | starttime=\"now/d\" endtime=\"now/d+12h\" tag:\"sample04061424_display\" \| bucket timestamp span=1h as ts \| stats max(apache.resp_len) as count_1 by ts \| eval time=formatdate(ts, \"HH:mm:ss.SSS\") \| eval line=\"max_line\" \| append [[starttime=\"now/d\" endtime=\"now/d+12h\" tag:sample04061424_chart \| bucket timestamp span=1h as ts \| stats count(apache.resp_len) as count_2 by ts \| eval time=formatdate(ts, \"HH:mm:ss.SSS\") \| eval line=\"count_line\" ]] |
| bucket_stats_es | starttime=\"now/d\" endtime=\"now/d+7h\" tag:sample04061424_apachesample_dawn \| bucket timestamp span=1h as ts \| stats es(apache.status) by ts |
| table_sample | starttime=\"now/d\" endtime=\"now/d+7h\" tag:\"sample04061424_apachesample_dawn\" \| eval new_time=formatdate(timestamp, \"HH:mm:ss\") \| table apache.status,apache.method,new_time |
| table_result_seq | tag:\"sample04061424\" \| table appname, tag, apache.clientip, apache.geo.country, apache.request_path, apache.status, apache.resp_len, apache.method |
| fields_result_seq | tag:\"sample04061424\" \| fields appname, tag, apache.clientip, apache.geo.country, apache.request_path, apache.status, apache.resp_len, apache.method |
| command_limit_mul_stats | tag:\"sample04061424\" \| stats count() as cnt, max(apache.status) as r_max by apache.clientip \| stats max(cnt),max(r_max) |
| command_limit_mul_top | tag:\"sample04061424\" \| stats count() as cnt, max(apache.status) as r_max_status by apache.clientip \| top 3 r_max_status |
| parse_message2ip_count2tag | tag:\"sample04061424\" \| parse \"^(?<ip_addr>\d+\.\d+\.\d+\.\d+)\" \| eval ip_str = \"ip:\" + ip_addr \| stats count(tag) as app_cnt by ip_str \| sort by app_cnt,ip_str |
| parse_clientip_stats | tag:\"sample04061424\" \| parse field=apache.clientip \"(?<ip_addr>\d+\.\d+\.\d+\.\d+)\" \| eval ip_str = \"ip:\" + ip_addr \| stats count(appname) as app_cnt by ip_str \| sort by app_cnt,ip_str |
| parse_request_path_stats | tag:\"sample04061424\" \| parse field=apache.request_path \"^(?<outer_path>/[^/]*)\" \| stats count(appname) by outer_path |
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
| time_sequence | tag:\"sample04061424_apachesample_dawn\" AND apache.resp_len:* \| eval res_reduce_time = collector_recv_timestamp - agent_send_timestamp \| eval f_timestamp = formatdate(timestamp,\"HH:mm:ss\")  \| table res_reduce_time, f_timestamp, agent_send_timestamp, collector_recv_timestamp \| where agent_send_timestamp<collector_recv_timestamp \|\|  agent_send_timestamp==collector_recv_timestamp |
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
| mindex_append_stats | index=* starttime=\"now/d\" endtime=\"now/d+12h\" tag:\"sample04061424_display\" \| stats count(apache.clientip)  \| append [[ index=* starttime=\"now/d\" endtime=\"now/d+12h\" tag:\"sample04061424_chart\" \| stats count(apache.clientip) ]] |
| sub_download | [[ tag:\"sample04061424\"\| stats avg(apache.resp_len) as avg_len by apache.clientip \| sort by +avg_len ]] \| sort by timestamp |
| group_size_count | tag:\"sample04061424\" AND apache.resp_len:*  \| stats count() as cnt, max(apache.resp_len) as r_max by apache.clientip \| top 3 cnt \| stats last(cnt) |
| group_size_max | tag:\"sample04061424\" AND apache.resp_len:* \| stats count() as cnt, max(apache.resp_len) as r_max by apache.clientip \| top 3 r_max \| stats last(r_max) |
| search_highlight_last_update_timestamp | tag:last_update_timestamp_100 AND last_update_timestamp |
| search_highlight_last_asterisk_match | tag:last_update_timestamp_100 AND last* |
| highlight_before_capital_letter | tag:highlight_huawei_10 \"the message is\" |
| gf_dapper_tracing | tag:gf_dapper* AND dapper.msg.traceId:\"511f8756ce1d0b8a\" dapper.msg.duration:>0 \| table dapper.msg.id, dapper.msg.parentId, dapper.class, dapper.msg.duration, dapper.msg.timestamp, dapper.msg.binaryAnnotations[].value, collector_recv_timestamp \| sort by dapper.msg.id |
| spl_eval_add | tag:gf_dapper* AND 'tag':gf_dapper_mould_3 \| eval aa=mvszip(mvszip(dapper.msg.annotations[].endpoint.serviceName,dapper.msg.annotations[].timestamp),dapper.msg.annotations[].value)\|mvexpand aa\|parse field=aa \"(?<aname>[^,]*),(?<atime>[^,]*),(?<avalue>\S+)\"\|sort by +atime \| table atime,dapper.msg.name,dapper.msg.traceId,dapper.msg.parentId,dapper.msg.id,dapper.msg.duration,aname,avalue,dapper.msg.binaryAnnotations[].endpoint.serviceName,dapper.msg.binaryAnnotations[].key,dapper.msg.binaryAnnotations[].value\|rename dapper.time as time,dapper.mtype as mtype,dapper.msg.name as fundname,dapper.msg.traceId as traceId,dapper.msg.parentId as parentId,dapper.msg.id as id,dapper.msg.duration as duration,dapper.msg.binaryAnnotations[].endpoint.serviceName as daname,dapper.msg.binaryAnnotations[].key as dakey,dapper.msg.binaryAnnotations[].value as davalue\|eval time=formatdate(tolong(substring(tostring(atime),0,13)))\|fields time,fundname,traceId,parentId,id,duration,aname,avalue,daname,dakey,davalue |
| formatdate_2y_4m | \| makeresults count=1 \| eval cur_timestamp = 1570738470000 \| eval ret_time = formatdate(cur_timestamp,\"yy-MMMM-dd HH:mm:ss.SSS ZZ Z z\") \| eval splittime = split(ret_time, \" \") \| eval splittime_name = split(\"日期 时间 RFC时区1 RFC时区2 通用时区\", \" \") \| eval r_display = mvszip(splittime_name,splittime ,\"：\") \| table r_display |
| formatdate_1570738470000 | \| makeresults count=1 \| eval cur_timestamp = 1570738470000 \| eval ret_time = formatdate(cur_timestamp,\"yyyy-MM-dd HH:mm:ss.SSS ZZZ Z z '' G CC xxxx ww e '' EEEE DDD aa KK hh '' kk\") \| eval splittime = split(ret_time, \" \") \| eval splittime_name = split(\"日期 时间 RFC时区1 RFC时区2 通用时区 ' 公元 Centryofera WeekYear WeekofYear DayofWeek ' DayofWeek1 DayinYear Halfofday0_11 Clockhourofhalfday1_12 Hourofhalfday ' Hourinday1_24 \", \" \") \| eval r_display = mvszip(splittime_name,splittime ,\"：\") \| table r_display |
| formatdate_1570813200000 | \| makeresults count=1 \| eval cur_timestamp = 1570813200000 \| eval ret_time = formatdate(cur_timestamp,\"yyyy-MM-dd HH:mm:ss.SSS ZZZ Z z '' G CC xxxx ww e '' EEEE DDD aa KK hh '' kk\") \| eval splittime = split(ret_time, \" \") \| eval splittime_name = split(\"日期 时间 RFC时区1 RFC时区2 通用时区 ' 公元 Centryofera WeekYear WeekofYear DayofWeek ' DayofWeek1 DayinYear Halfofday0_11 Clockhourofhalfday1_12 Hourofhalfday ' Hourinday1_24 \", \" \") \| eval r_display = mvszip(splittime_name,splittime ,\"：\") \| table r_display |
| formatdate_1570888800000 | \| makeresults count=1 \| eval cur_timestamp = 1570888800000 \| eval ret_time = formatdate(cur_timestamp,\"yyyy-MM-dd HH:mm:ss.SSS ZZZ Z z '' G CC xxxx ww e '' EEEE DDD aa KK hh '' kk\") \| eval splittime = split(ret_time, \" \") \| eval splittime_name = split(\"日期 时间 RFC时区1 RFC时区2 通用时区 ' 公元 Centryofera WeekYear WeekofYear DayofWeek ' DayofWeek1 DayinYear Halfofday0_11 Clockhourofhalfday1_12 Hourofhalfday ' Hourinday1_24 \", \" \") \| eval r_display = mvszip(splittime_name,splittime ,\"：\") \| table r_display |
| sparkline_max2len_span1h | starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424_display AND apache.referer_domain:tnt.mr2z7.cn \| stats sparkline(max(apache.resp_len),1h) as tt by apache.referer_domain |
| sparkline_count2forward_span1h | starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424_display AND ('apache.referer_domain':tnt.mr2z7.cn) OR ('apache.referer_domain':hl.16e5au.cn) OR ('apache.referer_domain':shdating.dfllg.cn) OR ('apache.referer_domain':sss.cv294.cn) \| stats sparkline(count(apache.x_forward),1h) as count_ by apache.referer_domain \| rename apache.referer_domain as \"主要域名\", count_ as \"访问量变化\" |
| sparkline_avg2len_span60s | starttime=\"now/d\" endtime=\"now/d+10m\" tag:sample04061424_display AND ('apache.referer_domain':tnt.mr2z7.cn) OR ('apache.referer_domain':hl.16e5au.cn) OR ('apache.referer_domain':shdating.dfllg.cn) OR ('apache.referer_domain':sss.cv294.cn) \| stats sparkline(avg(apache.resp_len),60s) as count_ by apache.referer_domain \| rename apache.referer_domain as \"主要域名\", count_ as \"访问量变化\" |
| sparkline_min2status_span1d | starttime=\"-7d\" endtime=\"now/d+24h\" tag:sample04061424_display AND ('apache.referer_domain':tnt.mr2z7.cn) OR ('apache.referer_domain':hl.16e5au.cn) OR ('apache.referer_domain':shdating.dfllg.cn) OR ('apache.referer_domain':sss.cv294.cn) \| stats sparkline(min(apache.status),1d) as count_ by apache.referer_domain \| rename apache.referer_domain as \"主要域名\", count_ as \"访问量变化\" |
| sparkline_sum2status_span1w | starttime=\"-30d\" endtime=\"now/d+24h\" tag:sample04061424_display AND ('apache.referer_domain':tnt.mr2z7.cn) OR ('apache.referer_domain':hl.16e5au.cn) OR ('apache.referer_domain':shdating.dfllg.cn) OR ('apache.referer_domain':sss.cv294.cn) \| stats sparkline(sum(apache.status),1w) as count_ by apache.referer_domain \| rename apache.referer_domain as \"主要域名\", count_ as \"访问量变化\" |
| sparkline_distinct_count2ip_span1m | starttime=\"-60d\" endtime=\"now/d+24h\" tag:sample04061424_display AND ('apache.referer_domain':tnt.mr2z7.cn) OR ('apache.referer_domain':hl.16e5au.cn) OR ('apache.referer_domain':shdating.dfllg.cn) OR ('apache.referer_domain':sss.cv294.cn) \| stats sparkline(distinct_count(apache.clientip),1m) as count_ by apache.referer_domain \| rename apache.referer_domain as \"主要域名\", count_ as \"访问量变化\" |
| bug_onetag_sort_timestamp1 | index=* starttime=\"now/d\" endtime=\"now/d+24h\" tag: sample04061424*  \| sort by timestamp |
| bug_onetag_sort_timestamp2 | index=* starttime=\"now/d\" endtime=\"now/d+24h\" tag: sample04061424*  \| sort by +timestamp |
| bug_top_limit_sort1_Mindex | index=* starttime=\"now/d\" endtime=\"now/d+24h\" tag: sample04061424*  \| top 10 appname \| limit 10 |
| bug_stats_limit_sort2_Mindex | index=* starttime=\"now/d\" endtime=\"now/d+24h\" tag: sample04061424*  \| top 10 appname \| limit 10 \|sort by count |
| join_left_mult | tag:\"sample04061424\" \| stats count(logtype) as count_all by apache.geo.isp \| sort by count_all \| limit 5 \| join type=left apache.geo.isp[[logtype:\"apache\" AND apache.status:[400 TO 499]\|stats count(logtype) as count_400 by apache.geo.isp]]\|join type=left apache.geo.isp [[logtype:\"apache\" AND apache.status:[500 TO 599]\|stats count(logtype) as count_500 by apache.geo.isp]]\|join type=left apache.geo.isp [[logtype:\"apache\" AND apache.resp_len:>1000\|stats count(logtype) as len_1000 by apache.geo.isp]]\|eval rate_400=if(empty(count_400),0,count_400/count_all)\|eval rate_500=if(empty(count_500),0,count_500/count_all)\|eval rate_len_1000=if(empty(len_1000),0,len_1000/count_all) |
| spl_rangeline_outlier_is_0 | tag:sample04061424_display \| bucket timestamp span=3h as ts\| stats count(appname) as count_ by ts\| movingavg count_,5 as ma\| rollingstd count_,5 as rs \| eval lower=ma-3*rs \| eval upper=ma+3*rs\| eval outlier=if(count_>upper\|\|count_<lower, count_, 0) |
| spl_rangeline_outlier_not_all_0 | tag:sample04061424_display \| bucket timestamp span=3h as ts\| stats count(appname) as count_ by ts\| movingavg count_,5 as ma\| rollingstd count_,5 as rs\| eval lower=ma-1*rs\| eval upper=ma+1*rs\| eval outlier=if(count_>upper\|\|count_<lower, count_, 0) |
| search_four_divide_five_makersult | \| makeresult count = 10 \| eval a=4/5 \| table a |
| search_four_divide_five_event | tag:sample06041224 \| eval a=4/5 \| table a |
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
| timechart_sample_all_params1 | starttime=\"now/d\" endtime=\"now/d+24h\" tag:\"sample04061424\"  \| eval x=len(tostring(apache.request_path)) \| timechart sep=\",\" format=\"$VAL**$AGG\" cont=true limit=5 bins=10 minspan=1m span=10m max(x) as ma count() as cnt |
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
| timechart_span1d_timewrap_1w | starttime=\"now-30d\" endtime=\"now/d+24h\" tag:sample04061424_display \| timechart span=1d count() as cnt \| timewrap 1w |
| timechart_span1h_timewrap_1d | starttime=\"now-3d\" endtime=\"now/d+24h\" tag:sample04061424_display \| timechart span=1h count() as cnt \| timewrap 1d |
| timechart_span1h_timewrap_3d | starttime=\"now-7d\" endtime=\"now/d+24h\" tag:sample04061424_display \| timechart span=1h count() as cnt max(apache.resp_len) as max_len by apache.status \| timewrap 3d |
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
